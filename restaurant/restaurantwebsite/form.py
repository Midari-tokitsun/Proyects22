from django.contrib.auth.forms import UserCreationForm
from django import forms
from django.contrib.auth.models import User


class CreateUserForm(UserCreationForm):
    class Meta:
        model= User
        fields = ['username','email','first_name','last_name','password1','password2']


from django.contrib.auth.forms import UserChangeForm


class CustomUserChangeForm(UserChangeForm):
    class Meta(UserChangeForm.Meta):
        model = User
        fields = ('username', 'first_name', 'last_name', 'email')
