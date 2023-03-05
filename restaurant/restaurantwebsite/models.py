from django.db import models

class insertuser(models.Model):
    username = models.CharField(max_length=100)
    nombre = models.CharField(max_length=100)
    email = models.CharField(max_length=100)
    password =  models.CharField(max_length=100)
    class Meta:
        db_table = 'users'


class insertempl(models.Model):
    id = models.CharField(primary_key=True, max_length=50)
    nombre = models.CharField(max_length=100)
    apellido= models.CharField(max_length=100)
    tipo_identificacion =models.CharField(max_length=100)
    documento_identificacion=models.CharField(max_length=100)
    direccion=models.CharField(max_length=100)
    telefono=models.CharField(max_length=15) 
    departamento=models.CharField(max_length=100)
    puesto=models.CharField(max_length=100)
    jornada=models.CharField(max_length=100)
    fecha_contratacion=	models.CharField(max_length=15) 
    fecha_nacimiento=models.CharField(max_length=15)
    class Meta:
        db_table = 'empleados'

class cargo(models.Model):
    id=models.CharField(primary_key=True, max_length=20)
    empleado=models.TextField(max_length=50)
    nombre=models.CharField(max_length=50)
    descripcion=models.TextField(max_length=100)
    salario	=models.CharField(max_length=50)
    class Meta:
        db_table='cargos'






class documentoemp(models.Model):
    id=models.CharField(primary_key=True , max_length=20)
    nombre = models.CharField(max_length=50)
    apellido=models.CharField(max_length=50)
    tipo_identificacion = models.CharField(max_length=20)
    numero_identificacion = models.CharField(max_length=20)

    class Meta:
        db_table='tipodocumentosemp'