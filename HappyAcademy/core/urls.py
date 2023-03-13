from nturl2path import url2pathname
from django.urls import path , re_path
from . import views
from django.contrib.auth import views as auth_views

from .views import (
    HomeView,
    ItemDetailView,
    add_to_cart,
    remove_from_cart,
    OrderSummaryView,
    remove_single_item_from_cart,
    passwordchange,
    add_to_cart_single,
    remove_single_item_from_cart_trash,
    remove_from_stock,



    

    
    
)

app_name = 'core'

urlpatterns = [
  path('',HomeView.as_view(),name='home'),
  path('order-summary/',OrderSummaryView.as_view(),name='order-summary'),
  # path('profile/',views.profile,name='profile'),

  path('passwordchange',passwordchange,name='passwordchange'),
  path('add-to-cart-single/<slug>',add_to_cart_single,name='add-to-cart-single'),
  # re_path(r'add-to-cart/<slug>/', views.add_to_cart, name='add-to-cart'),
  path('product/<slug>/', ItemDetailView.as_view(), name='product'),
  path('add-to-cart/<slug>/', add_to_cart, name='add-to-cart'),
  path('remove-from-cart/<slug>',remove_from_cart,name='remove-from-cart'),
  path('remove-single-item-from-cart/<slug>',remove_single_item_from_cart,name='remove-single-item-from-cart'),
  path('remove-single-item-from-cart-trash/<slug>',  remove_single_item_from_cart_trash,name='remove-single-item-from-cart-trash'),
  path('remove_from_stock',remove_from_stock,name='remove_from_stock'),
  path('addshow2/',views.addshow2,name='addshow2'),
  path('ro89/', ro89, name='ro89'),
  path('addshow1/',views.addshow1,name='addshow1'),
  path('register',views.register,name='register'),
  path('logout',views.logoutuser,name='logout'),
  path('addshow1/',views.addshow1,name='addshow1'),

  path('CheckoutView',views.CheckoutView,name='CheckoutView'),
  path('login',views.loginPage,name='login'),
  path('profilest800',views.profilest800,name='profilest800'),
  path('delete1/<int:book_id>',views.delete_data1,name='delete1'),
  path('delete2/<int:book_id>',views.delete_data2,name='delete2'),
  path('delete3/<int:book_id>',views.delete_data3,name='delete3'),

  path('allorder/',views.allorder,name='allorder'),

  path('Payment',Payment.as_view(),name='Payment'),
  path('statictnt',views.statictnt,name='statictnt'),
  path('updatedata1/<str:pk>',views.updatedata1,name='updatedata1'),
  path('updatedata2/<str:pk>',views.updatedata2,name='updatedata2'),
  path('acguitar/',views.acguitar,name='acguitar'),
  path('eguitar/',views.eguitar,name='eguitar'),
  path('acc/',views.acc,name='acc'),
  path('allpd/',views.allpd,name='allpd'),
  path('bom/',views.bom,name='bom'),
  path('few/',views.few,name='few'),
  path('jokeball/',views.jokeball,name='jokeball'),

  path('t8001/',views.t8001,name='t8001'),
  path('t8002/',views.t8002,name='t8002'),
  path('t8003/',views.t8003,name='t8003'),

  path('updatedata3/<str:pk>',views.updatedata3,name='updatedata3'),

  path('allorder112/',views.allorder112,name='allorder112'),

  
  path('password_reset/',auth_views.PasswordResetView.as_view(template_name='password_reset.html'),name="password_reset"),
  path('password_reset_done/',auth_views.PasswordResetDoneView.as_view(template_name='password_reset_done.html'),name="password_reset_done"),
  path('password_reset_confirm/<uidb64>/<token>/',auth_views.PasswordResetConfirmView.as_view(template_name='password_reset_confirm.html'),name="password_reset_confirm"),
  path('password_reset_complete',auth_views.PasswordResetCompleteView.as_view(template_name='password_reset_complete.html'),name="password_reset_complete"),
    
    



]
from django.conf import settings  
from django.conf.urls.static import static  
  
urlpatterns += static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)  