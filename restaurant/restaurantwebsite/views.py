from django.shortcuts import render,redirect
from restaurantwebsite.models import insertuser,insertempl,cargo,documentoemp
from django.contrib.auth import logout,login,authenticate
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import AuthenticationForm
from django.views.generic import ListView

from django.db.models import Q


# VISTA USUARIO

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


# ver Editar,eliminar,añadir,enlistar y Buscar Cargo  VISTA EMPLEADO

def empleado(request):
    return render(request, 'empleadologin.html')

def homeemp(request):
    return render(request, 'homeemp.html')


from django.core.paginator import Paginator
def registroemp(request):


    empleados=insertempl.objects.all()
    
    docs=  documentoemp.objects.all()

    paginator = Paginator(empleados,2)
    page=request.GET.get('page')
    empleados=paginator.get_page(page)


    
    if request.method == 'GET' :
        query = request.GET.get('buscaremp')


        paginator = Paginator(empleados,2)
        page=request.GET.get('page')
        empleados=paginator.get_page(page)
        
        

        if query:
   



            empleados = insertempl.objects.filter(



            Q(nombre__icontains=query) |
            Q(apellido__icontains=query) ).distinct

            print("lo encontre!!!!")

 


        else:
            empleados=insertempl.objects.all()


            paginator = Paginator(empleados,2)
            page=request.GET.get('page')
            empleados=paginator.get_page(page)



            query = request.GET.get('buscaremp')
            print("Enlistando Todos los REgistros ")

            

    context={
        
        
        'empleados':empleados,
       
    }


 

    return render(request,"registroemp.html",context) 



  
    
   


def addemp(request):
    if request.method=='POST':
        if request.POST.get('nombre') and request.POST.get('apellido') and request.POST.get('tipo_identificacion') and request.POST.get('documento_identificacion') and request.POST.get('direccion') and request.POST.get('telefono') and request.POST.get('departamento')and request.POST.get('puesto') and request.POST.get('jornada') and request.POST.get('fecha_contratacion') and request.POST.get('fecha_nacimiento'):
         insertempl1 = insertempl()

       
         insertempl1.nombre=request.POST.get('nombre')
         insertempl1.apellido=request.POST.get('apellido')
         insertempl1.tipo_identificacion=request.POST.get('tipo_identificacion')
         insertempl1.documento_identificacion=request.POST.get('documento_identificacion')
         insertempl1.direccion=request.POST.get('direccion')   
         insertempl1.telefono=request.POST.get('telefono')
         insertempl1.departamento=request.POST.get('departamento')
         insertempl1.puesto=request.POST.get('puesto')
         insertempl1.jornada=request.POST.get('jornada')
         insertempl1.fecha_contratacion=request.POST.get('fecha_contratacion')
         insertempl1.fecha_nacimiento=request.POST.get('fecha_nacimiento')
         insertempl1.save()





    return redirect("registroemp") 


def edit(request, id):
    employee =insertempl.objects.get(id=id)
    return render(request,'edit.html',{'employee':employee})

   

def updateemp(request , id ):
    
    emp= insertempl.objects.get(id=id)
    nombre=request.POST.get('nombre')
    apellido=request.POST.get('apellido')
    tipo_identificacion=request.POST.get('tipo_identificacion')
    documento_identificacion=request.POST.get('documento_identificacion')
    direccion=request.POST.get('direccion')
    telefono=request.POST.get('telefono')
    departamento=request.POST.get('departamento')
    puesto=request.POST.get('puesto')
    jornada=request.POST.get('jornada')
    fecha_contratacion=request.POST.get('fecha_contratacion')
    fecha_nacimiento=request.POST.get('fecha_nacimiento')
     

    emp.nombre=nombre
    emp.apellido=apellido
    emp.tipo_identificacion=tipo_identificacion
    emp.documento_identificacion=documento_identificacion
    emp.direccion=direccion
    emp.telefono=telefono
    emp.departamento=departamento
    emp.puesto=puesto
    emp.jornada=jornada
    emp.fecha_contratacion=fecha_contratacion
    emp.fecha_nacimiento=fecha_nacimiento
     


    emp.save()
  

    messages.info(request,"ITEM ACTUALIZADO EXITOSAMENTE")
    return redirect("registroemp")




def destroy(request, id):  
    employee = insertempl.objects.get(id=id)  
    employee.delete()  
    return redirect("registroemp")






# ver Editar,eliminar,añadir,enlistar y Buscar ----------------VISTA de Cargos

def cargoregister(request):



    car=cargo.objects.all()

    paginator = Paginator(car,2)
    page=request.GET.get('page')
    car=paginator.get_page(page)



    if request.method == 'GET' :
        query = request.GET.get('buscarcargosemp')

        paginator = Paginator(car,2)
        page=request.GET.get('page')
        car=paginator.get_page(page)
    

        if query:
            car = cargo.objects.filter(




            Q(apellido_empleado__icontains=query) |
            Q(empleado__icontains=query) ).distinct
            print("Lo encontre EL CARGO ES!!!")    
         
        else:
            car=cargo.objects.all()


            paginator = Paginator(car,2)
            page=request.GET.get('page')
            car=paginator.get_page(page)    

            query = request.GET.get('buscarcargosemp')
            print("REtornando de vuelta a la vista principal de CARGOS")






    context={
        'car':car
    }

    
    return render(request,"cargoregister.html",context) 


def añadircargo(request):
    if request.method=='POST':
     if request.POST.get('id') and request.POST.get('empleado') and request.POST.get('nombre') and request.POST.get('descripcion') and request.POST.get('salario') and request.POST.get('apellido_empleado') and request.POST.get('sucursal_asignado') and request.POST.get('estado')and request.POST.get('departamento')and request.POST.get('traslado')and request.POST.get('duracion_cargo'):
         addcargo=cargo()
         addcargo.empleado=request.POST.get('empleado')
         addcargo.id=request.POST.get('id')
         addcargo.nombre=request.POST.get('nombre')
         addcargo.descripcion=request.POST.get('descripcion')
         addcargo.salario=request.POST.get('salario')

         addcargo.apellido_empleado=request.POST.get('apellido_empleado')
         addcargo.estado=request.POST.get('estado')
         addcargo.sucursal_asignado=request.POST.get('sucursal_asignado')

         addcargo.departamento=request.POST.get('departamento')
         addcargo.duracion_cargo=request.POST.get('duracion_cargo')
         addcargo.traslado=request.POST.get('traslado')
         
         
         addcargo.save()
         
         messages.success(request, 'registro Creado Exitosamente!!')
    return redirect('cargoregister')


def editarcargo(request, id):
    car =cargo.objects.get(id=id)
    print(id)
    return render(request,'cargoregister.html',{'car':car})


def actializarcargo(request , id ):
    
    car= cargo.objects.get(id=id)
    id=request.POST.get('id')
    empleado=request.POST.get('empleado')
    nombre=request.POST.get('nombre')
    descripcion=request.POST.get('descripcion')
    salario=request.POST.get('salario')
    apellido_empleado=request.POST.get('apellido_empleado')
    sucursal_asignado=request.POST.get('sucursal_asignado')
    estado=request.POST.get('estado')

    duracion_cargo=request.POST.get('duracion_cargo')
    traslado=request.POST.get('traslado')
    departamento=request.POST.get('departamento')

    car.duracion_cargo=duracion_cargo
    car.traslado=traslado
    car.departamento=departamento

    car.apellido_empleado=apellido_empleado
    car.sucursal_asignado=sucursal_asignado
    car.estado=estado

    

    car.nombre=nombre
    car.empleado=empleado
    car.id=id
    car.descripcion=descripcion
    car.salario=salario


    car.save()
  

    messages.info(request,"ITEM ACTUALIZADO EXITOSAMENTE")
    return redirect("cargoregister")



def visualizarcargo(request,id):
    
    car =cargo.objects.get(id=id)
    print(id)
    return render(request,'cargoregister.html',{'car':car})
    



  
def borrarcargo(request , id):
    car = cargo.objects.get(id=id)  
    car.delete()  
    return redirect("cargoregister")





    


# ver Editar,eliminar,añadir,enlistar y Buscar ----------------VISTA de TIPODOCUMENTO EMPLEAADOS


def tipodocumentoemp(request):

    docs=  documentoemp.objects.all()

    paginator = Paginator(docs,2)
    page=request.GET.get('page')
    docs=paginator.get_page(page)


    if request.method == 'GET' :
        query = request.GET.get('buscardocuemntoemp')


        paginator = Paginator(docs,2)
        page=request.GET.get('page')
        docs=paginator.get_page(page)



        if query:
            docs = documentoemp.objects.filter(
            
            Q(nombre__icontains=query) |
            Q(apellido__icontains=query) ).distinct

            print("LO ENCONTRE Y TE ENLISTOS SUS REFERENCIAS!!")
        
         
        else:
            docs=documentoemp.objects.all()


            paginator = Paginator(docs,2)
            page=request.GET.get('page')
            docs=paginator.get_page(page)


            

            query = request.GET.get('buscardocuemntoemp')
            print("Retornando a Todos los registros")
 


    context={
        
        'docs':docs
    }


    return render(request,"tipodocumentoemp.html" , context)


def añadirdocumentoemp(request):

    if request.method=='POST':
        if request.POST.get('id') and request.POST.get('nombre') and request.POST.get('apellido') and request.POST.get('tipo_identificacion') and request.POST.get('numero_identificacion') and request.POST.get('licencia_conducir'):
         documentoemp1=documentoemp()
         documentoemp1.id=request.POST.get('id')
         documentoemp1.nombre=request.POST.get('nombre')
         documentoemp1.apellido=request.POST.get('apellido')
         documentoemp1.tipo_identificacion=request.POST.get('tipo_identificacion')
         documentoemp1.numero_identificacion=request.POST.get('numero_identificacion')
         documentoemp1.licencia_conducir=request.POST.get('licencia_conducir')
         

         documentoemp1.save()
         
         messages.success(request, 'registro Creado Exitosamente!!')


    return redirect('tipodocumentoemp')



def borrartipodocumentoemp(request , id):
    docs = documentoemp.objects.get(id=id)  
    docs.delete()  
    return redirect("tipodocumentoemp")



def editartipodedocumento(request, id):
    docs =tipodocumentoemp.objects.get(id=id)
    print(id)
    return render(request,'tipodocumentoemp.html',{'docs':docs})


def actualizartipodedocumento(request , id ):
    
    docs= documentoemp.objects.get(id=id)
    id=request.POST.get('id')
    nombre=request.POST.get('nombre')
    apellido=request.POST.get('apellido')
    tipo_identificacion=request.POST.get('tipo_identificacion')
    numero_identificacion=request.POST.get('numero_identificacion')
    licencia_conducir=request.POST.get('licencia_conducir')


    docs.nombre=nombre
    docs.apellido=apellido
    docs.id=id
    docs.numero_identificacion=numero_identificacion
    docs.tipo_identificacion=tipo_identificacion
    docs.licencia_conducir=licencia_conducir


    docs.save()
  

    messages.info(request,"ITEM ACTUALIZADO EXITOSAMENTE")
    return redirect("tipodocumentoemp")

