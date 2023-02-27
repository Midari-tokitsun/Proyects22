from django.shortcuts import render,redirect
from restaurantwebsite.models import insertuser
from django.contrib.auth import logout,login,authenticate
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import AuthenticationForm

def signup(request):
    if request.method=='POST':
        if request.POST.get('username') and request.POST.get('password'):
         saverecord = insertuser()
         saverecord.username=request.POST.get('username')
         saverecord.nombre=request.POST.get('nombre')
         saverecord.email=request.POST.get('email')
         saverecord.password=request.POST.get('password')
         
         saverecord.save()
         
         messages.success(request, 'Usuario Creado Exitosamente!!')
        return render(request, 'signup.html')
    else: 
        return render(request, 'signup.html') 


def home(request):
    return render(request, 'home.html')

def login_user(request):
   
    if request.method=='POST':
        try:
            saverecord = insertuser.objects.get(username=request.POST['username'],password=request.POST['password'])
            
            request.session['username']=saverecord.username
            request.session['password']=saverecord.password

  
            return render(request,'home.html')


        except insertuser.DoesNotExist:
            messages.success(request, 'Usuario No Existente!!')
            
    return render(request, 'login_user.html')
        

def signout(request):
    logout(request)
    messages.info(request, 'Adios Usuario')
    return redirect('/')


def menu(request):
    return render(request, 'menu.html')


def pedidos(request):
    return render(request, 'pedidos.html')

def listadepedidos(request):
    return render(request, 'listadepedidos.html')
