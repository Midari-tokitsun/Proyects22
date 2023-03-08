from django.db import models

class insertuser(models.Model):
    id_usuario=models.CharField(primary_key=True,max_length=40)
    username = models.CharField(max_length=100)
    nombre = models.CharField(max_length=100)
    email = models.CharField(max_length=100)
    password =  models.CharField(max_length=100)
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



class insertempl(models.Model):
    id = models.CharField(primary_key=True, max_length=50)
    nombre = models.CharField(max_length=100)
    apellido= models.CharField(max_length=100)

  
    direccion=models.CharField(max_length=100)
    telefono=models.CharField(max_length=15) 





    jornada=models.CharField(max_length=100)
    fecha_contratacion=	models.CharField(max_length=15) 
    fecha_nacimiento=models.CharField(max_length=15)
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
    numero_identificacion = models.CharField(max_length=20)


    class Meta:
        db_table='tipodocumentosemp'