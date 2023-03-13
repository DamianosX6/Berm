from turtle import up
from django.forms import ModelForm
from django.db import models
from .models import  customuser
from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm, UserChangeForm



class CreateUserForm(UserCreationForm):
    class Meta:
        model = customuser

        fields = ['username','first_name','last_name','email','c_tel','zip','city']


    
