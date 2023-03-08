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
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [




    path('admin/', admin.site.urls),

# VISTA DE CLIENTE
    path("registrousuarios/",views.tableuser, name="tableuser"),# REgistro y tabla de clientes Cliente
    path("registrartablausuario/",views.registrarentablausuario, name="registrarentablausuario"),# REgistro Cliente EN LA TABLA

    path("eliminarusuario/<int:id>",views.eliminarusuario, name="eliminarusuario"),# REgistro Cliente EN LA TABLA


    path("actualizarusuario/<int:id>",views.actualizarusuario, name="actualizarusuario"),# REgistro Cliente EN LA TABLA

    path("editarusuario/<int:id>",views.editarusuario, name="editarusuario"),# REgistro Cliente EN LA TABLA





    path("signup/",views.signup, name="signup"),# REgistro Cliente
    path("usuario/",views.home, name="home"),# HomePAge Usuario
    path("login_user/",views.login_user, name="login_user"),# Log in USuario
    path('signout/',views.signout, name='signout'),# Cerrar Sesion Usuario
# OPERACIONES DEL MENU PARA EL USUARIO--CLIENTE 
    path("menu/",views.menu, name="menu"),
    path("pedidos/",views.pedidos, name="pedidos"),


# VISTA DE EMPLEADO
 # Editar,Eliminar,Añadir,Enlistar,Buscar Empleado


    path("registroemp/",views.registroemp, name="registroemp"),# Registro Empleado
    path('addemp', views.addemp , name="addemp"),# añadir Registro EMP
    path('delete/<int:id>', views.destroy , name="destroy"),# BOrrar Registro EMP    
    path('edit/<int:id>', views.edit , name="edit"),# enlista los datos de El EMPLEADO    
    path('update/<int:id>', views.updateemp , name="updateemp"),# Actualizar una vez editados El EMPLEADO
    path('buscar/', views.registroemp , name="registroemp"),# ver EMpleado


# ver Editar,eliminar,añadir,enlistar y Buscar Cargo

    path('cargoregister/', views.cargoregister , name="cargoregister"),
    path('añadircargo', views.añadircargo , name="añadircargo"),
    path('editarcargo/<int:id>', views.editarcargo , name="editarcargo"),
    path('actializarcargo/<int:id>', views.actializarcargo , name="actializarcargo"),
    path('borrarcargo/<int:id>', views.borrarcargo , name="borrarcargo"),
    path('visualizarcargo/<int:id>', views.visualizarcargo , name="visualizarcargo"),
    path('buscarcargosemp/', views.cargoregister , name="cargoregister"),# ver EMpleado


# ver Editar,eliminar,añadir,enlistar y Buscar Departamento

    path('departamentohome/', views.departamentohome , name="departamentohome"),# ver tabla de Departamentos
    path('departamentoeliminar/<int:id>', views.departamentoeliminar , name="departamentoeliminar"),
    path('añadirdepartamento', views.añadirdepartamento , name="añadirdepartamento"),
    path('departamentoeditar/<int:id>', views.departamentoeditar , name="departamentoeditar"),
    path('actualizardepartamentos/<int:id>', views.actualizardepartamentos , name="actualizardepartamentos"),


# VISTA Puesto EMPLEADOS
    path('puestos/', views.puestohome , name="puestohome"),# ver tabla de puesto
    path('añadirpuesto', views.añadirpuesto , name="añadirpuesto"),# Agregar
    path('eliminarpuesto/<int:id>', views.eliminarpuesto , name="eliminarpuesto"),# Eliminar
    
    path('editarpuesto/<int:id>', views.editarpuesto , name="editarpuesto"),# editar
    
    path('actualizarpuesto/<int:id>', views.actualizarpuesto , name="actualizarpuesto"),# actualizar
   
    path('actualizarpuesto/<int:id>', views.actualizarpuesto , name="actualizarpuesto"),# buscar


# VISTA TipodeDOCUMENTO EMPLEADOS


    path('tipodocumentoemp/', views.tipodocumentoemp , name="tipodocumentoemp"),
    path('añadirdocumentoemp', views.añadirdocumentoemp , name="añadirdocumentoemp"),
    path('borrartipodocumentoemp/<int:id>', views.borrartipodocumentoemp , name="borrartipodocumentoemp"),
    path('editartipodedocumento/<int:id>', views.editartipodedocumento , name="editartipodedocumento"),
    path('actualizartipodedocumento/<int:id>', views.actualizartipodedocumento , name="actializartipodedocumento"),
    path('buscardocuemntoemp/', views.tipodocumentoemp , name="buscardocuemntoemp"),# ver EMpleado
 

# VISTA DE Sucursal
 # Editar,Eliminar,Añadir,Enlistar,Buscar Sucursal

    path('sucursal/', views.sucursalhome , name="sucursalhome"),#pantalla principal del table
    path('añadirsucursal', views.añadirsucursal , name="añadirsucursal"),#añadir sucursal


    path('eliminarsucurusal/<int:id>', views.eliminarsucurusal , name="eliminarsucurusal"),#eliminar sucursal


    path('editarsucursal/<int:id>', views.editarsucursal , name="editarsucursal"),#editar sucursal

    path('actualizarsucursal/<int:id>', views.actualizarsucursal , name="actualizarsucursal"),#actualizar sucursal










] 

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
