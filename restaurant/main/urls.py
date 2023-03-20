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
    path("registrarusuarioenellogin",views.registrarusuarioenellogin, name="registrarusuarioenellogin"),# REgistro de usuario en EL SIGNUP



    path("registrousuarios/",views.tableuser, name="tableuser"),# REgistro y tabla de clientes Cliente
    path("registrartablausuario/",views.registrarentablausuario, name="registrarentablausuario"),# REgistro Cliente EN LA TABLA

    path("eliminarusuario/<int:id>",views.eliminarusuario, name="eliminarusuario"),# REgistro Cliente EN LA TABLA


    path("actualizarusuario/<int:id>",views.actualizarusuario, name="actualizarusuario"),# REgistro Cliente EN LA TABLA

    path("editarusuario/<int:id>",views.editarusuario, name="editarusuario"),# REgistro Cliente EN LA TABLA



    path("RegistroNuevoCliente/",views.RegistroNuevoCliente, name="RegistroNuevoCliente"),# REgistro Cliente EN LA TABLA
    path("AgregarNuevoUsuario",views.AgregarNuevoUsuario, name="AgregarNuevoUsuario"),# REgistro Cliente EN LA TABLA
  

    
    


    path("signup/",views.registrarusuarioenellogin, name="signup"),# REgistro Cliente
    path("usuario/",views.home, name="home"),# HomePAge Usuario
    path("login_user/",views.login_user, name="login_user"),# Log in USuario
    path('signout/',views.signout, name='signout'),# Cerrar Sesion Usuario
# OPERACIONES DEL MENU PARA EL USUARIO--CLIENTE 
    path("menu/",views.menu, name="menu"),
    path("pedidos/",views.pedidos, name="pedidos"),


# VISTA DE EMPLEADO
 # Editar,Eliminar,Añadir,Enlistar,Buscar Empleado


    path("empleado/",views.empleado, name="empleados"),# Registro Empleado
    path("addempleado",views.addempleado, name="addempleado"),# Registro Empleado
    
    path("editarempleado/<int:id>",views.editarempleado, name="editarempleado"),# Registro Empleado
    path("eliminarempleado/<int:id>",views.eliminarempleado, name="eliminarempleado"),# Registro Empleado


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



# VISTA DE categoria
 # Editar,Eliminar,Añadir,Enlistar,Buscar Sucursal
    path('categoria/', views.categoriatabla , name="categoriatabla"),#pantalla principal del table
   
    path('añadircategoria', views.añadircategoria , name="añadircategoria"),#pantalla de guardado registros
   
    path('editarcategoria/<int:id>', views.editarcategoria , name="editarcategoria"),#pantalla de guardado registros

    path('eliminarcategoria/<int:id>', views.eliminarcategoria , name="eliminarcategoria"),#pantalla de guardado registros

# FIN DE LA VISTA DE CATEGORIA




# VISTA DE familiaproducto
 # Editar,Eliminar,Añadir,Enlistar,Buscar Sucursal
    path('familiaproducto/', views.familiaproductotabla , name="familiaproductotabla"),#pantalla principal del table

    path('añadirfamiliaproducto', views.añadirfamiliaproducto , name="añadirfamiliaproducto"),#pantalla principal del table

    path('editarfamiliaproducto/<int:id>', views.editarfamiliaproducto , name="editarfamiliaproducto"),#pantalla principal del table

    path('editarfamiliaproducto/<int:id>', views.editarfamiliaproducto , name="editarfamiliaproducto"),
    
    path('eliminarfamilia/<int:id>', views.eliminarfamilia , name="eliminarfamilia"),    
    #FIN DE LA VISTA fAMILIA PRODUCTOS





    #Incio DE LA VISTA almacen
    path('almacen/', views.almacentabla , name="almacentabla"),    

    path('añadiralmacen', views.añadiralmacen , name="añadiralmacen"),    

    path('editaralmacen/<int:id>', views.editaralmacen , name="editaralmacen"),    

    path('eliminaralmacen/<int:id>', views.eliminaralmacen , name="eliminaralmacen"),    




#FIN DE LA VISTA almacen


    #Inicio de la Vista de Elaboracion

    path('elaboracion/', views.elaboraciontable , name="elaboraciontable"),    


    path('añadirelaboracion', views.añadirelaboracion , name="añadirelaboracion"),    


    path('editarelaboracio/<int:id>', views.editarelaboracio , name="editarelaboracio"),#pantalla principal del table

    path('eliminarelaboracion/<int:id>', views.eliminarelaboracion , name="eliminarelaboracion"),#pantalla principal del table
    #FIN DE LA VISTA de Elaboracion


    
# VISTA Menu

    path('menutabla/', views.menutablaregistros , name="menutablaregistros"),#pantalla principal del table
    path('agregarmenu', views.agregarmenu , name="agregarmenu"),#pantalla principal del table
    path('editarmenutabla/<int:id>', views.editarmenutabla , name="editarmenutabla"),#pantalla principal del table
    path('eliminarmenutabla/<int:id>', views.eliminarmenutabla , name="eliminarmenutabla"),#pantalla principal del table


# FIN de VISTA MEnu




# VISTA receta

    path('recetatablaregistros/', views.recetatablaregistros , name="recetatablaregistros"),#pantalla principal del table
    path('agregarreceta', views.agregarreceta , name="agregarreceta"),#pantalla principal del table
    path('editarreceta/<int:id>', views.editarreceta , name="editarreceta"),#pantalla principal del table
    path('eliminarreceta/<int:id>', views.eliminarreceta , name="eliminarreceta"),#pantalla principal del table



# VISTA Fin de la Vista REceta

# VISTA Promociones
    path('promociones/', views.promocionestabla , name="promociones"),#pantalla principal del table



# VISTA de Estado de detallepedido
    path('detallepedido/', views.detallepedido , name="detallepedido"),#pantalla principal del table
    path('agregardetallepedido', views.agregardetallepedido , name="agregardetallepedido"),#pantalla principal del table
    path('editardetallepedido/<int:id>', views.editardetallepedido , name="editardetallepedido"),#pantalla principal del table
    path('eliminardetallepedido/<int:id>', views.eliminardetallepedido , name="eliminardetallepedido"),#pantalla principal del table



# VISTA de Estado de estado pedido
    path('estadopedido/', views.estadopedido , name="estadopedido"),#pantalla principal del table
    path('guardarpedido', views.guardarpedido , name="guardarpedido"),#pantalla principal del table
    path('editarestadopedido/<int:id>', views.editarestadopedido , name="editarestadopedido"),#pantalla principal del table
    path('eliminarestadopedido/<int:id>', views.eliminarestadopedido , name="eliminarestadopedido"),#pantalla principal del table
# FIN DE LA VISTA de Estado de estado pedido

# VISTA de Reservaciones

    path('reservaciones/', views.reservaciones , name="reservaciones"),#pantalla principal del table


# FIN DE LA VISTA de Reservaciones


# VISTA DE SAR

    path('sartabla/', views.sartabla , name="sartabla"),#pantalla principal del table
    path('agregarsar', views.agregarsar , name="agregarsar"),#pantalla principal del table
    path('elminarsar/<int:id>', views.elminarsar , name="elminarsar"),#pantalla principal del table
    path('editarsar/<int:id>', views.editarsar , name="editarsar"),#pantalla principal del table


# FIN DE LA VISTA SAR

#vista METODO PAGO POST

    path('metodopago/', views.metodopagotabla , name="metodopagotabla"),#pantalla principal del table
    path('agregarmetododepago', views.agregarmetododepago , name="agregarmetododepago"),#pantalla principal del table
    path('editarmetododepago/<int:id>', views.editarmetododepago , name="editarmetododepago"),#pantalla principal del table
    path('eliminarmetododepago/<int:id>', views.eliminarmetododepago , name="eliminarmetododepago"),#pantalla principal del table


# FIN VISTA METODO DE PAGO POST


] 

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
