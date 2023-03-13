from ast import Or
from msilib.schema import CreateFolder
from multiprocessing import context
from pydoc import pager
from re import A

from django.db.models import Avg, Max, Min, Sum
from django.db.models import Count
from urllib import request
from django.core.paginator import Paginator
from venv import create
from django.core.exceptions import ObjectDoesNotExist
from django.shortcuts import redirect ,HttpResponse
from django.contrib.auth.decorators import login_required
from django.contrib.auth.mixins import LoginRequiredMixin
from django.shortcuts import render, get_object_or_404 
from .models import  Item , OrderItem ,Order, customuser, up1
from django.views.generic import ListView , DetailView , View
from django.utils import timezone
from django.contrib import messages
from django.urls import reverse
from .forms import  CreateUserForm, EditUserProfileForm , product
from django.contrib.auth.forms import  PasswordChangeForm 
from django.contrib.auth import authenticate, login, logout, update_session_auth_hash
from .forms import product ,CheckoutForm ,CreateUserForm , kuy , orderstatus
# Create your views here.
from django.contrib.auth.models import User 
# def shop(request):
#     return render(request,'shop.html')
def logoutuser(request):
    logout(request)
    messages.success(request, ' ขอบคุณที่ใช้บริการ')
    return redirect('../../login')

def loginPage(request):
    if request.method == 'POST':
        
        email = request.POST.get('email')
        password = request.POST.get('password')
        username = request.POST.get('username')

        user = authenticate(request, email=email, password=password, username = username)
        if user is not None:
            login(request, user)

            messages.info(request, 'ยินดีต้อนรับสู่ MASTER OF MUSIC' , user)
            return redirect('../../#')
            
        else:
            messages.info(
                request, 'ชื่อผู้ใช้งาน และ รหัสผ่านไม่ถูกต้อง กรุณาเช็คแล้วกรอกใหม่')
    context = {}
    return render(request, 'login.html', context)


def addshow1(request):
    if request.method == 'POST':
        s_form = product(request.POST, request.FILES)
        if s_form.is_valid(): 
                         
         s_form.save()

         s_form = product()
         
        return redirect('../../#')
    else:
        s_form = product
    context = {'s_form': s_form}
    return render(request, 'addshow1.html', context,)


def profilest800(request):
    u_form = EditUserProfileForm()
    if request.method == 'POST' :
        u_form = EditUserProfileForm(request.POST, request.FILES ,instance=request.user )
        if u_form.is_valid():
            u_form.save()
            messages.success(request, 'แก้ไขสำเร็จแล้ว')

        return redirect('../../#')
    else:
        u_form = EditUserProfileForm(instance=request.user)
    context = {'u_form': u_form}
    return render(request, 'profile.html', context)

def register(request):
    form = CreateUserForm()

    if request.method == 'POST' or request.method == 'FILES':
        form = CreateUserForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            user = form.cleaned_data.get('username')
            messages.success(request, ' ขอบคุณที่สมัครสมาชิก : ' + user)
            return redirect('../../login')
        else:
            messages.info(
                request, 'ชื่อผู้ใช้งาน และ รหัสผ่านไม่ถูกต้อง กรุณาเช็คแล้วกรอกใหม่')

    context = {'form': form}
    return render(request, 'register.html', context)

class HomeView(ListView):
    model = Item
    paginate_by = 3

    template_name = 'home.html'


# class ItemDetailView(DetailView):
#     model = Item
#     template_name = 'product.html'

class ItemDetailView(DetailView):
    model = Item
    template_name = "product.html"
class OrderSummaryView(LoginRequiredMixin,View):

    def get(self,*args,**kwargs):
        try:
            order = Order.objects.get(user=self.request.user , orderead=False)

            
            
            context = {
                'object':order
            }
            return render(self.request,"order_summary.html",context)
        except ObjectDoesNotExist:
            messages.error(self.request,'ผิดพลาด')
            return redirect("/")


@login_required
def add_to_cart(request,slug):
    item = get_object_or_404(Item,slug=slug)
    order_item, created = OrderItem.objects.get_or_create(item=item,user=request.user,orderead=False)
    order_qs = Order.objects.filter(user=request.user,orderead=False)
    if order_qs.exists():
        order = order_qs[0]
        messages.success(request, 'สินค้าอยู่ในตระกร้าแล้ว')
        #เช็คว่า คำสั่งซื้อสินค้า อยู่ในคำสั่งซื้อ
        if order.items.filter(item__slug=item.slug).exists():
            order_item.quantity += 1
            order_item.save()
            messages.success(request, 'สินค้าอยู่ในตระกร้าแล้ว') # ignored
            return redirect("core:product",slug=slug)
            


        else:
            order.items.add(order_item)
            
    else:
        orderead_date = timezone.now()
        order = Order.objects.create(user=request.user,orderead_date = orderead_date)
        
        order.items.add(order_item)
    return redirect("core:product",slug=slug)
@login_required
def add_to_cart_single(request,slug):
    item = get_object_or_404(Item,slug=slug)
    order_item, created = OrderItem.objects.get_or_create(item=item,user=request.user,orderead=False)
    order_qs = Order.objects.filter(user=request.user,orderead=False)
    tyre = Item.objects.get(id=item.id)
    if order_qs.exists():
        order = order_qs[0]
        #เช็คว่า คำสั่งซื้อสินค้า อยู่ในคำสั่งซื้อ
        if order.items.filter(item__slug=item.slug).exists():
            # tyre.stock  order_item.quantity
            order_item.quantity += 1
            order_item.save()
            messages.success(request, 'เพิ่มสินค้าแล้ว',) # ignored
            return redirect("core:order-summary")


        else:
            order.items.add(order_item)
            return redirect("core:order-summary")

            
    else:
        orderead_date = timezone.now()
        order = Order.objects.create(user=request.user,orderead_date = orderead_date)
        order.items.add(order_item)
    return redirect("core:order-summary")


@login_required
def get_success_url(self):
    return reverse('mainapp:profile')

@login_required
def profile(request):
    u_form = EditUserProfileForm()
    if request.method == 'POST' or request.method == 'FILES' :
        u_form = EditUserProfileForm(request.POST, request.FILES ,instance=request.user )
    if u_form.is_valid():
        u_form.save()
        messages.success(request, 'แก้ไขสำเร็จแล้ว')

        return redirect('core:profile')
    else:
        u_form = EditUserProfileForm(instance=request.user)
    context = {'u_form': u_form}
    return render(request, 'profile.html', context)



@login_required
def passwordchange(request):
    if request.user.is_authenticated:
        if request.method == 'POST':
            fm = PasswordChangeForm(user=request.user, data=request.POST)
            if fm.is_valid():
                fm.save()
                update_session_auth_hash(request, fm.user)
                messages.success(request, 'แก้ไขสำเร็จแล้ว')

                return redirect('core:home')
        else:
            fm = PasswordChangeForm(user=request.user)
            # context = {'fm': fm}
        return render(request, 'passwordchange.html', {'fm':fm})


@login_required
def remove_from_cart(request,slug):
    item = get_object_or_404(Item,slug=slug)
    order_qs = Order.objects.filter(
        user = request.user,
        orderead=False
    )
    if order_qs.exists():
        order = order_qs[0]
        if order.items.filter(item__slug=item.slug).exists():
            order_items = OrderItem.objects.filter(item=item,user = request.user,orderead = False
)[0]
            if order_items.quantity > 1:
               order_items.quantity -= 1
               order_items.save()
               messages.success(request, order_items,)

            else: 
                order.items.remove(order_items)
                messages.success(request, 'ลบสินค้าออกแล้ว.') #
        else:
            return redirect("core:product",slug=slug)
    else:
        return redirect("core:product",slug=slug)
    return redirect("core:product",slug=slug)


@login_required
def remove_single_item_from_cart(request,slug):
    item = get_object_or_404(Item,slug=slug)
    
    order_qs = Order.objects.filter(
        user = request.user,
        orderead=False
    )
    if order_qs.exists():
        order = order_qs[0]
        if order.items.filter(item__slug=item.slug).exists():
            order_item = OrderItem.objects.filter(item=item,user = request.user,orderead = False
)[0]
            if order_item.quantity > 1:
               order_item.quantity -= 1
               order_item.save()
               messages.success(request, 'ลบสินค้าออกแล้ว.') #
            # elif order_item.quantity > 0:
            #    order_item.quantity -= 0
            #    order_item.save()

      


            else: 

                order.items.remove(order_item)
                messages.success(request, 'ลบสินค้าออกแล้ว.') #
            # order_item.quantity > 1    
            # order_item.quantity -= 1
            # order_item.save()
            return redirect("core:order-summary")


          
        else:
            return redirect("core:order-summary")
    else:
        return redirect("core:order-summary")


@login_required
def remove_single_item_from_cart_trash(request, slug):
    item = get_object_or_404(Item,slug=slug)
    try:
        book_sel = OrderItem.objects.get(item=item,user = request.user,orderead = False)
    except OrderItem.DoesNotExist:
        return redirect('core:order-summary')
    book_sel.delete()
    messages.success(request, 'ลบสินค้าออกจากตะกร้าแล้ว.') #

    return redirect('core:order-summary')


    
def remove_from_stock(request, slug):
    try:
        item = get_object_or_404(Item,slug=slug)

        book_sel = OrderItem.objects.get(item=item,user = request.user,orderead = False)
        tyre = Item.objects.get(id=item.id)
        # tyre.stock = tyre.stock - book_sel.quantity
        # tyre.save()
            
        if  tyre.stock >=  book_sel.quantity:
                book_sel.quantity == book_sel.quantity 
                tyre.stock==  tyre.stock 
                tyre.stock = tyre.stock - book_sel.quantity
                tyre.save()
                messages.success(request, 'กดได้ไอ้น้อง',)
                if tyre.stock >= 0:
                    tyre.stock == 0
                    tyre.save()

                    
            # tyre.stock ==  tyre.stock  == 1  :
            #     book_sel.quantity == book_sel.quantity ==1
                    # elif order_item.quantity > 0:
                    #    order_item.quantity -= 0
                    #    order_item.save()
                # if  tyre.stock == 0:
                #     tyre.save() == 0
                #     tyre.save()
        else:
            messages.success(request, 'กดไม่ได้ ของไม่พอไอ้โง่',)

    except:  
        # else:
            messages.success(request, 'อย่าเยอะๆ',)

                # tyre.stock > 0
                # tyre.stock = 0
                # tyre.save()
        # tyre.stock <= 0
        # book_sel.quantity == book_sel.quantity 
        # tyre.stock==  tyre.stock 
        # book_sel.quantity < tyre.stock
        # tyre.stock == 0
        # tyre.stock = tyre.stock - book_sel.quantity
            

    return redirect('core:order-summary')


