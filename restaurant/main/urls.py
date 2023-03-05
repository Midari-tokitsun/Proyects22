"""sitioweb URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from restaurantwebsite import views

urlpatterns = [


    path('admin/', admin.site.urls),

# VISTA DE CLIENTE
    path("signup/",views.signup, name="signup"),# REgistro Cliente
    path("usuario/",views.home, name="home"),# HomePAge Usuario
    path("login_user/",views.login_user, name="login_user"),# Log in USuario
    path('signout/',views.signout, name='signout'),# Cerrar Sesion Usuario
# OPERACIONES DEL MENU PARA EL USUARIO--CLIENTE 
    path("menu/",views.menu, name="menu"),
    path("pedidos/",views.pedidos, name="pedidos"),


# VISTA DE EMPLEADO
 # Editar,Eliminar,Añadir,Enlistar,Buscar Empleado
    path("",views.empleado, name="empleado"),# log in EMpleado
    path("homeemp/",views.homeemp, name="homeemp"), # HomePAGE
    path("registroemp/",views.registroemp, name="registroemp"),# Registro Empleado
    path('addemp', views.addemp , name="addemp"),# añadir Registro EMP
    path('delete/<int:id>', views.destroy , name="destroy"),# BOrrar Registro EMP
    
    path('edit/<int:id>', views.edit , name="edit"),# enlista los datos de El EMPLEADO
    

    path('update/<int:id>', views.updateemp , name="updateemp"),# Actualizar una vez editados El EMPLEADO
    path('buscar/', views.buscaremp , name="buscaremp"),# ver EMpleado


# ver Editar,eliminar,añadir,enlistar y Buscar Cargo

    path('cargoregister/', views.cargoregister , name="cargoregister"),
    path('añadircargo', views.añadircargo , name="añadircargo"),
    path('editarcargo/<int:id>', views.editarcargo , name="editarcargo"),
    path('actializarcargo/<int:id>', views.actializarcargo , name="actializarcargo"),
    path('borrarcargo/<int:id>', views.borrarcargo , name="borrarcargo"),
    path('visualizarcargo/<int:id>', views.visualizarcargo , name="visualizarcargo"),






# VISTA TipodeDOCUMENTO EMPLEADOS


    path('tipodocumentoemp/', views.tipodocumentoemp , name="tipodocumentoemp"),

    path('añadirdocumentoemp', views.añadirdocumentoemp , name="añadirdocumentoemp"),
    path('borrartipodocumentoemp/<int:id>', views.borrartipodocumentoemp , name="borrartipodocumentoemp"),
    path('editartipodedocumento/<int:id>', views.editartipodedocumento , name="editartipodedocumento"),
    path('actualizartipodedocumento/<int:id>', views.actualizartipodedocumento , name="actializartipodedocumento"),
 



] 
