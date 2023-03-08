from django.shortcuts import render,redirect
from restaurantwebsite.models import insertuser,insertempl,cargo,documentoemp,departamento,puesto,sucursal
from django.contrib.auth import logout,login,authenticate
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import AuthenticationForm
from django.views.generic import ListView

from django.db.models import Q


# VISTA USUARIO


def tableuser(request):
    user=insertuser.objects.all()

    context={
        'user':user
    }

    return render(request,"usuarios.html",context)



def registrarentablausuario(request):
    if request.method=='POST':
        if request.POST.get('username') and request.POST.get('password'):
         saverecord = insertuser()
         saverecord.username=request.POST.get('username')
         saverecord.nombre=request.POST.get('nombre')
         saverecord.email=request.POST.get('email')
         saverecord.password=request.POST.get('password')
         
         saverecord.save()
         
        print("USUARIO CREADO EXITOSAMENTE")
        return redirect("tableuser")
    else: 
        return redirect("tableuser") 


def editarusuario(request):
    user=insertuser.objects.all()

    context={
        'user':user
    }

    return render(request,'usuarios.html', context)


def actualizarusuario(request,id):

    user= insertuser.objects.get(id_usuario=id)
    id=request.POST.get('id_usuario')

    username=request.POST.get('username')
    password=request.POST.get('password')

    nombre=request.POST.get('nombre')

    email=request.POST.get('email')

    user.id_usuario=id
    user.username=username
    user.password=password
    user.nombre=nombre
    user.email=email

    user.save()
  
    print("SU USUARIO HA SIDO MODIFICADO CON EXITO")
    return redirect("tableuser")


def eliminarusuario(request,id):

    return redirect("tableuser")



def signup(request):
    if request.method=='POST':
        if request.POST.get('username') and request.POST.get('password'):
         saverecord = insertuser()
         saverecord.username=request.POST.get('username')
         saverecord.nombre=request.POST.get('nombre')
         saverecord.email=request.POST.get('email')
         saverecord.password=request.POST.get('password')
         
         saverecord.save()
         
        print("USUARIO CREADO EXITOSAMENTE")
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
            
    return render(request, 'empleadologin.html')
        

def signout(request):
    logout(request)
    messages.info(request, 'Adios Usuario')
    return redirect('/usuario')


def menu(request):
    return render(request, 'menu.html')


def pedidos(request):
    return render(request, 'pedidos.html')


# ver Editar,eliminar,añadir,enlistar y Buscar Cargo  VISTA EMPLEADO

def empleado(request):
    return render(request, 'home.html')

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

         insertempl1.direccion=request.POST.get('direccion')   
         insertempl1.telefono=request.POST.get('telefono')
 
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

    jornada=request.POST.get('jornada')
    fecha_contratacion=request.POST.get('fecha_contratacion')
    fecha_nacimiento=request.POST.get('fecha_nacimiento')
     

    emp.nombre=nombre
    emp.apellido=apellido

    emp.direccion=direccion
    emp.telefono=telefono

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




            
            Q(nombre_cargo__icontains=query) |
            Q(id__icontains=query) ).distinct
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
     if request.POST.get('id') and request.POST.get('nombre_cargo') and request.POST.get('descripcion'): 
         addcargo=cargo()
    
         addcargo.id=request.POST.get('id')
         addcargo.nombre_cargo=request.POST.get('nombre_cargo')
         addcargo.descripcion=request.POST.get('descripcion')



         
         
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

    nombre_cargo=request.POST.get('nombre_cargo')
    descripcion=request.POST.get('descripcion')

    car.id=id
    car.nombre_cargo=nombre_cargo
    car.descripcion=descripcion


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
            Q(tipo_identificacion__icontains=query) |
            Q(id__icontains=query) |
            Q(numero_identificacion__icontains=query) ).distinct

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
        if request.POST.get('id') and request.POST.get('tipo_identificacion') and request.POST.get('numero_identificacion'):
         documentoemp1=documentoemp()
         documentoemp1.id=request.POST.get('id')

         documentoemp1.tipo_identificacion=request.POST.get('tipo_identificacion')
         documentoemp1.numero_identificacion=request.POST.get('numero_identificacion')
   
         

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

    tipo_identificacion=request.POST.get('tipo_identificacion')
    numero_identificacion=request.POST.get('numero_identificacion')
    



    docs.id=id
    docs.numero_identificacion=numero_identificacion
    docs.tipo_identificacion=tipo_identificacion
    


    docs.save()
  

    messages.info(request,"ITEM ACTUALIZADO EXITOSAMENTE")
    return redirect("tipodocumentoemp")



# ver Editar,eliminar,añadir,enlistar y Buscar ----------------VISTA de departamentos 

def departamentohome(request):

    dep=departamento.objects.all()



    paginator = Paginator(dep,2)
    page=request.GET.get('page')
    dep=paginator.get_page(page)


    if request.method == 'GET' :
        query = request.GET.get('buscardept')


        paginator = Paginator(dep,2)
        page=request.GET.get('page')
        dep=paginator.get_page(page)



        if query:
            dep = departamento.objects.filter(
            Q(departamento__icontains=query) |
            Q(codigo_postal__icontains=query) |
            Q(id_departamento__icontains=query) ).distinct

            print("LO ENCONTRE Y TE ENLISTOS SUS REFERENCIAS!!")
        
         
        else:
            dep=departamento.objects.all()


            paginator = Paginator(dep,2)
            page=request.GET.get('page')
            dep=paginator.get_page(page)


            

            query = request.GET.get('buscardept')
            print("Retornando a Todos los registros")

    context={
        'dep':dep

    }

    return render(request, "departamento.html",context)




def departamentoeliminar(request , id):
    dept = departamento.objects.get(id_departamento=id)  
    dept.delete()  
    return redirect("departamentohome")


def departamentoeditar(request, id):
   dep=departamento.objects.all()

   context={

        'dep':dep
    }

   return render(request,'departamento.html', context)

def añadirdepartamento(request):
    if request.method=='POST':
        if request.POST.get('id_departamento') and request.POST.get('departamento') and request.POST.get('codigo_postal'):

         dept=departamento()
         dept.id_departamento=request.POST.get('id_departamento')
         dept.departamento=request.POST.get('departamento')
         dept.codigo_postal=request.POST.get('codigo_postal')  

         dept.save()
         print("Se ha registrado su Registro a la Pagina de Departamento")
    return redirect('departamentohome')

   



def actualizardepartamentos(request , id ):
    
    dep= departamento.objects.get(id_departamento=id)
    dep.id_departamento=request.POST.get('id_departamento')
    dep.departamento=request.POST.get('departamento')
    dep.codigo_postal=request.POST.get('codigo_postal')
     


    dep.save()
    print("su registro se ha actualizado")

    messages.info(request,"ITEM ACTUALIZADO EXITOSAMENTE")
    return redirect("departamentohome")

# FIN dE LA VISTA DEPARTAMENTO 


# ver Editar,eliminar,añadir,enlistar y Buscar ----------------VISTA de puestos para los empleados

def puestohome(request):
    puestos=puesto.objects.all()


    
    paginator = Paginator(puestos,2)
    page=request.GET.get('page')
    puestos=paginator.get_page(page)


    if request.method == 'GET' :
        query = request.GET.get('buscarpuest')


 


        if query:
            puestos = puesto.objects.filter(
            Q(puesto_id__icontains=query) |
            Q(puesto__icontains=query) |
            Q(descripcion__icontains=query) ).distinct

            print("LO ENCONTRE Y TE ENLISTOS SUS REFERENCIAS!!")
        
         
        else:
            puestos=puesto.objects.all()


         


            

            query = request.GET.get('buscarpuest')
            print("Retornando a Todos los registros")

    context={
        'puestos':puestos


    }

    return render(request,"puesto.html",context)



def añadirpuesto(request):
    if request.method=='POST':
        if request.POST.get('puesto_id') and request.POST.get('puesto') and request.POST.get('descripcion'):

         puestos=puesto()
         puestos.puesto_id=request.POST.get('puesto_id')
         puestos.puesto=request.POST.get('puesto')
         puestos.descripcion=request.POST.get('descripcion')  

         puestos.save()
         print("Se ha registrado su Registro a la Pagina de PUESTOS")
    return redirect('puestohome')



def eliminarpuesto(request, id):
    puest = puesto.objects.get(puesto_id=id)  
    puest.delete()  
    return redirect("puestohome")



def editarpuesto(request):
    puestos=puesto.objects.all()

    context={
        'puestos':puestos


    }

    return render(request,"puesto.html",context)


def actualizarpuesto(request ,id):
    puestos= puesto.objects.get(puesto_id=id)
    puestos.puesto_id=request.POST.get('puesto_id')
    puestos.puesto=request.POST.get('puesto')
    puestos.descripcion=request.POST.get('descripcion')
     


    puestos.save()
    print("su registro se ha actualizado EN LA PANTALLA DE PUESTOS")

    messages.info(request,"ITEM ACTUALIZADO EXITOSAMENTE")
    return redirect("puestohome")


#Fin de la Vista de Puestos

#VISTA DE SUCURSALES

def sucursalhome(request):
    sucu=sucursal.objects.all()
    context={
        'sucu':sucu
    }

    return render(request,"sucursal.html",context)

def añadirsucursal(request):
        if request.method=='POST':
         if request.POST.get('id_sucursal') and request.POST.get('direccion_sucursal') and request.POST.get('descripcion'):

          sucu=sucursal()
          sucu.id_sucursal=request.POST.get('id_sucursal')
          sucu.direccion_sucursal=request.POST.get('direccion_sucursal')
          sucu.descripcion=request.POST.get('descripcion')  

          sucu.save()
         print("Se ha registrado su Registro a la Pagina de SUUCRSAL")
        return redirect('sucursalhome')


def eliminarsucurusal(request , id):
    sucu = sucursal.objects.get(id_sucursal=id)  
    sucu.delete()  
    return redirect("sucursalhome")

def editarsucursal(request):
    sucu=sucursal.objects.all()

    context={
        'sucu':sucu


    }

    return render(request,"sucursal.html",context)


def actualizarsucursal(request ,id):
    sucu= sucursal.objects.get(id_sucursal=id)
    sucu.id_sucursal=request.POST.get('id_sucursal')
    sucu.direccion_sucursal=request.POST.get('direccion_sucursal')
    sucu.descripcion=request.POST.get('descripcion')
     


    sucu.save()
    print("su registro se ha actualizado EN LA PANTALLA DE Sucursal")

    messages.info(request,"ITEM ACTUALIZADO EXITOSAMENTE")
    return redirect("sucursalhome")