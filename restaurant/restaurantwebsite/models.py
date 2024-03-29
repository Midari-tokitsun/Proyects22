from django.db import models


from passlib.context import CryptContext

from django.contrib.auth.hashers import BasePasswordHasher
from argon2 import PasswordHasher, exceptions
from argon2 import PasswordHasher

from cryptography.fernet import Fernet


from django.utils import timezone
from django.db.models.signals import post_save






class insertuser(models.Model):
    id_usuario=models.CharField(primary_key=True,max_length=40)
    username = models.CharField(max_length=100, )
    apellido=models.CharField(max_length=50)
    
    telefono=models.CharField(max_length=50) 

    nombre = models.CharField(max_length=100)
    email = models.CharField(max_length=100)
    
    estadocuenta=(
        ('activo','ACTIVO'),
        ('Inactivo','INACTIVO')
    )
    
    estado=models.CharField(max_length=20 , choices=estadocuenta , default="Activo")
    password =  models.CharField(max_length=120)
    fecha_creacion=models.DateField(auto_now_add=True)
    fecha_modificacion=models.DateField(auto_now=True)

    intentos = models.IntegerField(default=0) # Agregar el campo attempts como un entero con valor por defecto 0
    bloqueado = models.BooleanField(default=False) # Agregar el campo block como un booleano con valor por defecto False







    class Meta:
        db_table = 'users'

    


        


class sucursal(models.Model):
    id_sucursal=models.CharField(primary_key=True,max_length=20)
    direccion_sucursal=models.CharField(max_length=50)
    descripcion=models.CharField(max_length=50)


    class Meta:
        db_table='sucursal'


class departamento(models.Model):
    id_departamento=models.CharField(primary_key=True,max_length=50)
    departamento=models.CharField(max_length=50)
    codigo_postal=models.CharField(max_length=50)



    class Meta:
        db_table='departamento'

class puesto(models.Model):
    puesto_id=models.CharField(primary_key=True,max_length=50)
    puesto=models.CharField(max_length=50)
    descripcion=models.CharField(max_length=50)



    class Meta:
        db_table='puesto'



class empleados(models.Model):
    id_empleado = models.CharField(primary_key=True, max_length=20)
    nombre = models.CharField(max_length=50)
    apellido= models.CharField(max_length=50)
    jornada=models.CharField(max_length=20)
    telefono=models.CharField(max_length=50) 


    sucursal_asignado=models.CharField(max_length=20)
    departamento_asignado=models.CharField(max_length=50)
    puesto_asignado=models.CharField(max_length=50)


    cargo_asignado=models.CharField(max_length=30)
    tipodedocumentos=models.CharField(max_length=30)
    numero_identificacion=models.CharField(max_length=40)


# RElaciones De otras TAblas

#    departamento = models.ForeignKey(departamento, related_name='dep', on_delete=models.CASCADE)
    
 #   sucursale = models.ForeignKey(sucursal, related_name='sucu', on_delete=models.CASCADE)

  #  puestos = models.ForeignKey(puesto, related_name='pu', on_delete=models.CASCADE)


    class Meta:
        db_table = 'empleados'





class cargo(models.Model):
    id=models.CharField(primary_key=True, max_length=20)
 
    nombre_cargo=models.CharField(max_length=50)


    descripcion=models.TextField(max_length=100)


    class Meta:
        db_table='cargos'






class documentoemp(models.Model):
    id=models.CharField(primary_key=True , max_length=20)

    tipo_identificacion = models.CharField(max_length=20)



    class Meta:
        db_table='tipodocumentosemp'


class categoria(models.Model):
    categoria_id=models.CharField(primary_key=True, max_length=20) 
    nombre_categoria=models.CharField(max_length=50)
    descripcion_categoria=models.CharField(max_length=50)


    class Meta:
        db_table='categoria'


class familia_producto(models.Model):
    id_familia_producto=models.CharField(primary_key=True, max_length=30)
    nombre_familia=models.CharField(max_length=50)
    descripcion_familia=models.CharField(max_length=100)


    class Meta:
        db_table='familia_producto'


class elaboracion(models.Model):
    id_elaboracion=models.CharField(primary_key=True,max_length=20)
    descripcion_elaboracion=models.TextField(max_length=254)

    class Meta:
        db_table='elaboracion'

class almacen(models.Model):
    id_almacen=models.CharField(primary_key=True,max_length=30)
    tipo_almacen=models.CharField(max_length=30)
    descripcion_almacen=models.CharField(max_length=50)
    estado_almacen=models.CharField(max_length=20)

    class Meta:
        db_table='almacen'

class menutabla(models.Model):
    id_menu = models.CharField(primary_key=True, max_length=20) 
    nombre_menu = models.CharField(max_length=50)
    precio_menu = models.CharField(max_length=50)
    descripcion_menu = models.TextField()
    modo_elaboracion = models.CharField(max_length=30)
    impuesto=models.CharField(max_length=50)

    class Meta:
        db_table = 'menu'

class historico_menu(models.Model):
    id_historico = models.CharField(primary_key=True, max_length=50)
    nombre_menu = models.CharField(max_length=100)
    fecha_inicio = models.DateField(default=timezone.now)
    fecha_final = models.DateField(null=True,blank=True)
    precio_menu = models.CharField(max_length=50)


    
    class Meta:
        db_table='historico_menu'


class historico_producto(models.Model):
    id_historico = models.CharField(primary_key=True, max_length=20)
    nombre_producto = models.CharField(max_length=50)
    precio_producto = models.CharField(max_length=50)
    fecha_inicio = models.DateField(default=timezone.now)
    fecha_final = models.DateField(null=True,blank=True)


    
    class Meta:
        db_table='historico_producto'


    

class recetatabla(models.Model):
    id_receta=models.CharField(primary_key=True, max_length=20)  
    nombre_receta=models.CharField( max_length=100) 
    menu_id=models.CharField(max_length=50) 
    descripcion_receta=models.TextField() 
    porciones_receta=models.CharField( max_length=20)

    class Meta:
        db_table='receta' 



class detalle_pedido(models.Model):
    id_detalle=models.CharField(primary_key=True , max_length=40)
    tamaño_menu=models.CharField(max_length=50)
    estado_pedido=models.CharField(max_length=50)
    descripcion_detalle=models.TextField()
    
    class Meta:
        db_table='detalle_pedido' 


class estado_pedido(models.Model):
    id_estado=models.CharField(primary_key=True , max_length=40)
    descripcion_pedido=models.TextField()       
    
    class Meta:
        db_table='estado_pedido' 


class sar_tabla(models.Model):
    id_sar=models.CharField(primary_key=True,max_length=50)
    codigo_sar=models.CharField(max_length=100)
    fecha_emision=models.DateField()
    fecha_final=models.DateField()
    descripcion=models.TextField()
    numero_inicial=models.CharField(max_length=50)
    numero_final=models.CharField(max_length=50)
    consecutivo=models.CharField(max_length=80)
    cod_sucursal=models.CharField(max_length=50)
    class Meta:
        db_table='sar' 

class metodo_pago_tabla(models.Model):
    id_metodo_pago=models.CharField(primary_key=True,max_length=100)
    forma_pago=models.CharField(max_length=50)
    moneda=models.CharField(max_length=40)
    fecha_pago=models.DateField(auto_now_add=True)

    class Meta:
        db_table='metodo_pago'

class reservacionestabla(models.Model):
    id_reservacion=models.CharField(primary_key=True,max_length=20)
    nombre_reservante=models.CharField(max_length=50)
    nombre_sucursal=models.CharField(max_length=50)
    numero_mesas=models.CharField(max_length=20)
    fecha_reserva=models.DateField()
    fecha_llegada=models.DateField()
    descripcion=models.CharField(max_length=100)



    class Meta:
        db_table='reservaciones'


class inventariotabla(models.Model):
    id_inventario=models.CharField(primary_key=True ,max_length=20)
    producto=models.CharField(max_length=50)
    cantidad_actual=models.CharField(max_length=50)
    cantidad_minima=models.CharField(max_length=50)
    cantidad_maxima=models.CharField(max_length=50)
    unidad_de_medida=models.CharField(max_length=50)
    menu_id=models.CharField(max_length=50)

    class Meta:
        db_table='inventario'

class promocionestabla(models.Model):
    id_promocion=models.CharField(primary_key=True, max_length=50)
    nombre_promocion=models.CharField(max_length=50)
    menu_id=models.TextField()
    precio_oferta=models.CharField(max_length=50)
    tiempo_inicio=models.DateField(blank=True,auto_now=True)
    fecha_final=models.DateField(null=True,blank=True)
    descripcion=models.TextField()

    class Meta:
        db_table='promociones'


class provedorestabla(models.Model):
    id_provedor=models.CharField(primary_key=True,max_length=40)
    nombre_provedor=models.CharField(max_length=50)
    apellido_provedor=models.CharField(max_length=50)
    compañia_provevdor=models.CharField(max_length=50)
    telefono_provedor=models.CharField(max_length=50)
    email_provedor=models.CharField(max_length=50)


    class Meta:
        db_table='provedores'

class pedidostabla(models.Model):
    id_pedido=models.CharField(primary_key=True,max_length=40)
    nombre_cliente=models.CharField(max_length=50)
    nombre_menu=models.TextField()
    cantidades=models.CharField(max_length=250)
    tamaño_menu=models.CharField(max_length=250)
    estado_pedido=models.CharField(max_length=50)
    fecha_pedido=models.DateField(blank=True,auto_now=True)
    dni_cliente=models.CharField(max_length=50)



    class Meta:
        db_table='pedido'    



class productostabla(models.Model):
    id_producto=models.CharField(primary_key=True,max_length=20)
    nombre_producto=models.CharField(max_length=50)
    id_categoria=models.CharField(max_length=50)
    almacen_id=models.CharField(max_length=50)
    familia_id=models.CharField(max_length=50)
    menu_id=models.CharField(max_length=50)
    provedor_id=models.CharField(max_length=50)
    precio_producto=models.CharField(max_length=50)

    class Meta:
        db_table='productos'


class factura_tabla(models.Model):
    id_factura=models.CharField(primary_key=True,max_length=40)
    codigo_cai=models.CharField(max_length=90)
    numero_factura=models.CharField(max_length=90)
    nombre_encargado=models.CharField(max_length=90)
    apellido_encargado=models.CharField(max_length=90)
    correo_encargado=models.CharField(max_length=90)
    telefono_encargado=models.CharField(max_length=90)
    nombre_cliente=models.CharField(max_length=90)
    menu_cantidades=models.CharField(max_length=90)
    tamaño_menu=models.CharField(max_length=90)
    estado_pedido=models.CharField(max_length=90)
    fecha_realizacion_pedido=models.DateField(null=True,blank=True)
    descuento=models.CharField(max_length=90)
    isv=models.CharField(max_length=90)
    metodo_pago=models.CharField(max_length=90)
    numero_tarjeta=models.CharField(max_length=90)
    cantidad_pagar=models.CharField(max_length=90)
    total_pagar=models.CharField(max_length=90)
    cambio=models.CharField(max_length=50)
    
    fecha_emision=models.CharField(max_length=50)
    fecha_final=models.CharField(max_length=50)
    numero_inicial=models.CharField(max_length=50)
    numero_final=models.CharField(max_length=50)
    dni_cliente=models.CharField(max_length=50)
    impuesto=models.CharField(max_length=50)

    class Meta:
        db_table='factura'



class impuesto_tabla(models.Model):
    id_impuesto=models.CharField(primary_key=True,max_length=40)
    impuesto=models.CharField(max_length=50)
    fecha_inicio = models.DateField(default=timezone.now)
    fecha_final = models.DateField(null=True,blank=True)
    class Meta:
        db_table='impuesto'

class descuento_tabla(models.Model):
    id_descuento=models.CharField(primary_key=True,max_length=40) 
    descuento=models.CharField(max_length=50)
    fecha_inicio= models.DateField(default=timezone.now)
    fecha_final= models.DateField(null=True,blank=True)
    class Meta:
        db_table='descuentos'

class cliente_tabla(models.Model):
    id_cliente=models.CharField(primary_key=True,max_length=40)
    nombre=models.CharField(max_length=50)
    apellido=models.CharField(max_length=50)
    dni=models.CharField(max_length=50)
    class Meta:
        db_table='cliente'

class MyException(Exception):
    pass
