from django.shortcuts import render,redirect


from restaurantwebsite.models import insertuser,cargo,documentoemp,departamento,puesto,sucursal,empleados,categoria,familia_producto,elaboracion,almacen



from django.contrib.auth import logout,login,authenticate
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import AuthenticationForm
from django.views.generic import ListView
from django.core.paginator import Paginator

from django.db.models import Q


# VISTA USUARIO


def tableuser(request):
    user=insertuser.objects.all()

    context={
        'user':user
    }

    return render(request,"usuarios.html",context)

from django.contrib.auth.hashers import make_password
def registrarusuarioenellogin(request):

    if request.method == 'POST':
        nombre = request.POST['nombre']
        apellido = request.POST['apellido']
        username = request.POST['username']
        email = request.POST['email']
        password = request.POST['password']
        confirm_password = request.POST['confirm_password']


        if password != confirm_password:
            context = {'error': 'Passwords do not match'}
            return render(request, 'signup.html', context)

        # Encriptar la contraseña
        password_encrypted = make_password(password)

        user = insertuser.objects.create(
        nombre=nombre,
        apellido=apellido,
        username=username,
        email=email,
        password=password_encrypted,
          
          
          
          )
        user.save()
        return redirect('home')
    return render(request, 'signup.html')



def registrarentablausuario(request):
    if request.method=='POST':
        if request.POST.get('username') and request.POST.get('password'):
         saverecord = insertuser()
         saverecord.id_usuario=request.POST.get('id_usuario')
         saverecord.username=request.POST.get('username')
         saverecord.nombre=request.POST.get('nombre')
         saverecord.email=request.POST.get('email')
         saverecord.password=request.POST.get('password')
         saverecord.estado=request.POST.get('estado')
         saverecord.apellido=request.POST.get('apellido')
         

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
    apellido=request.POST.get('apellido')
    estado=request.POST.get('estado')


    email=request.POST.get('email')

    user.apellido=apellido
    user.estado=estado
    

    user.id_usuario=id
    user.username=username
    user.password=password
    user.nombre=nombre
    user.email=email

    user.save()
  
    print("SU USUARIO HA SIDO MODIFICADO CON EXITO")
    return redirect("tableuser")


def eliminarusuario(request,id):
    user = insertuser.objects.get(id_usuario=id)  
    user.delete()  
    print("registro borrado retornando a la tabla principal de usuarios")
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
    emp=empleados.objects.all()
    dep=departamento.objects.all()
    pu=puesto.objects.all()
    sucu=sucursal.objects.all()

    car=cargo.objects.all()
    docs=  documentoemp.objects.all()


    context={

        'emp':emp,
        'dep':dep,
        'pu':pu,
        'sucu':sucu,

        'car':car,
        'docs':docs,

    
    
    }




    return render(request, 'registroemp.html' , context)


def addempleado(request):
    if request.method=='POST':

        nombre=request.POST.get("nombre")
        apellido=request.POST.get("apellido")
        jornada=request.POST.get("jornada")
        telefono=request.POST.get("telefono")
        id_empleado=request.POST.get("id_empleado")
        sucursal_asignado=request.POST.get("sucursal_asignado")
        departamento_asignado=request.POST.get("departamento_asignado")
        puesto_asignado=request.POST.get("puesto_asignado")

        cargo_asignado=request.POST.get("cargo_asignado")
        tipodedocumentos=request.POST.get("tipodedocumentos")


     #   id_sucursal = request.POST.get("departamento")
      #  sucursal.objects.get(id=id_sucursal)
       # print(id_sucursal)

       # id_departamento = request.POST.get("sucursal")
       # departamento.objects.get(id=id_departamento)

       # puesto_id = request.POST.get("puesto")
      #  puesto.objects.get(id=puesto_id)

        empleados.objects.create(
        #    sucursal=sucursal,
         #   departamento=departamento,
          #  puesto=puesto,

            nombre=nombre,
            apellido=apellido,
            jornada=jornada,
            telefono=telefono,
            id_empleado=id_empleado,

            sucursal_asignado=sucursal_asignado,
            puesto_asignado=puesto_asignado,
            departamento_asignado=departamento_asignado,

            cargo_asignado=cargo_asignado,
            tipodedocumentos=tipodedocumentos,




        )
        print("SALVADO EMPLEADO RETORNANDO OTRA VEZ")
    else:
        print("LA LLAVE A LA QUE ESTAS GUARDANDO ESTA DUPLICADA")



        
    return redirect("empleados")



def eliminarempleado(request,id):
    emp = empleados.objects.get(id_empleado=id)  
    emp.delete()  
    return redirect("empleados")



def editarempleado(request , id):

    emp=empleados.objects.get(id_empleado=id)
    id_empleado=request.POST.get('id_empleado')
    nombre=request.POST.get('nombre')
    apellido=request.POST.get('apellido')
    jornada=request.POST.get('jornada')
    telefono=request.POST.get('telefono')
    sucursal_asignado=request.POST.get('sucursal_asignado')
    departamento_asignado=request.POST.get('departamento_asignado')
    puesto_asignado=request.POST.get('puesto_asignado')
    cargo_asignado=request.POST.get('cargo_asignado')
    tipodedocumentos=request.POST.get('tipodedocumentos')

    emp.id_empleado=id_empleado
    emp.nombre=nombre
    emp.apellido=apellido
    emp.jornada=jornada
    emp.telefono=telefono
    emp.sucursal_asignado=sucursal_asignado
    emp.departamento_asignado=departamento_asignado
    emp.puesto_asignado=puesto_asignado
    emp.cargo_asignado=cargo_asignado
    emp.tipodedocumentos=tipodedocumentos

    emp.save()

    #if request.method=='POST':

       # nombre=request.POST.get("nombre")
        #apellido=request.POST.get("apellido")
        #jornada=request.POST.get("jornada")
        #telefono=request.POST.get("telefono")
        #id_empleado=request.POST.get("id_empleado")
       # sucursal_asignado=request.POST.get("sucursal_asignado")
      #  departamento_asignado=request.POST.get#("departamento_asignado")
       # puesto_asignado=request.POST.get("puesto_asignado")

      #  cargo_asignado=request.POST.get("cargo_asignado")
     #   tipodedocumentos=request.POST.get("tipodedocumentos")


     #   id_sucursal = request.POST.get("departamento")
      #  sucursal.objects.get(id=id_sucursal)
       # print(id_sucursal)

       # id_departamento = request.POST.get("sucursal")
       # departamento.objects.get(id=id_departamento)

       # puesto_id = request.POST.get("puesto")
      #  puesto.objects.get(id=puesto_id)

     #   empleados.objects.create(
        #    sucursal=sucursal,
         #   departamento=departamento,
          #  puesto=puesto,

      #      nombre=nombre,
       #     apellido=apellido,
        #    jornada=jornada,
         #   telefono=telefono,
          #  id_empleado=id_empleado,

         #   sucursal_asignado=sucursal_asignado,
         #   puesto_asignado=puesto_asignado,
          #  departamento_asignado=departamento_asignado,

          #  cargo_asignado=cargo_asignado,
          #  tipodedocumentos=tipodedocumentos,




     #   )
    print("SALVADO EdICION DE EMPLEADO RETORNANDO OTRA VEZ")
    #else:
     #   print("LA LLAVE A LA QUE ESTAS GUARDANDO ESTA DUPLICADA")

    return redirect('empleados')
#Fin de la Vista de Empleado



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
#     if request.POST.get('id') and request.POST.get('nombre_cargo') and request.POST.get('descripcion'): 
#         addcargo=cargo()
    
#         addcargo.id=request.POST.get('id')
#         addcargo.nombre_cargo=request.POST.get('nombre_cargo')
#         addcargo.descripcion=request.POST.get('descripcion')



         
         
#         addcargo.save()
         
#         messages.success(request, 'registro Creado Exitosamente!!')
#    return redirect('cargoregister')

        id=request.POST.get("id")
        nombre_cargo=request.POST.get("nombre_cargo")
      
        descripcion=request.POST.get("descripcion")


        cargo.objects.create(
            id=id,
            nombre_cargo=nombre_cargo,
            descripcion=descripcion,





        )
        print("Se ha Guardado Exitosamente tu CArgo RETORNANDO NUEVAMENTE A LA VISTA PRINCIPAL DE CARGOS")
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
#        if request.POST.get('id') and request.POST.get('tipo_identificacion') and request.POST.get('numero_identificacion'):
#         documentoemp1=documentoemp()
#         documentoemp1.id=request.POST.get('id')

#         documentoemp1.tipo_identificacion=request.POST.get('tipo_identificacion')
#         documentoemp1.numero_identificacion=request.POST.get('numero_identificacion')
   
         

#         documentoemp1.save()
         
#         messages.success(request, 'registro Creado Exitosamente!!')


#    return redirect('tipodocumentoemp')

        id=request.POST.get("id")
        tipo_identificacion=request.POST.get("tipo_identificacion")
        numero_identificacion=request.POST.get("numero_identificacion")

        
        documentoemp.objects.create(
            id=id,
            tipo_identificacion=tipo_identificacion,
            numero_identificacion=numero_identificacion,






        )
        print("tipo de documentos ha sido añadido con exito Retornando a la Vista principal de TIPO DE DOCUMENTO")
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
#        if request.POST.get('id_departamento') and request.POST.get('departamento') and request.POST.get('codigo_postal'):

#         dept=departamento()
#         dept.id_departamento=request.POST.get('id_departamento')
#         dept.departamento=request.POST.get('departamento')
#         dept.codigo_postal=request.POST.get('codigo_postal')  

#         dept.save()
#         print("Se ha registrado su Registro a la Pagina de Departamento")
#    return redirect('departamentohome')
        dept=departamento()
        dept.id_departamento=request.POST.get("id_departamento")
        dept.departamento=request.POST.get("departamento")
        dept.codigo_postal=request.POST.get("codigo_postal")



        departamento.objects.create(
            id_departamento=dept.id_departamento,
            departamento=dept.departamento,
            codigo_postal=dept.codigo_postal,





        )
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
#        if request.POST.get('puesto_id') and request.POST.get('puesto') and request.POST.get('descripcion'):

#         puestos=puesto()
#         puestos.puesto_id=request.POST.get('puesto_id')
#         puestos.puesto=request.POST.get('puesto')
#         puestos.descripcion=request.POST.get('descripcion')  

#         puestos.save()
#         print("Se ha registrado su Registro a la Pagina de PUESTOS")
#    return redirect('puestohome')

        pu=puesto()
        pu.puesto_id=request.POST.get("puesto_id")
        pu.puesto=request.POST.get("puesto")
       
        pu.descripcion=request.POST.get("descripcion")

        
        puesto.objects.create(
            puesto_id=pu.puesto_id,
            puesto=pu.puesto,
            descripcion=pu.descripcion,





        )
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
#         if request.POST.get('id_sucursal') and request.POST.get('direccion_sucursal') and request.POST.get('descripcion'):

#          sucu=sucursal()
#          sucu.id_sucursal=request.POST.get('id_sucursal')
#          sucu.direccion_sucursal=request.POST.get('direccion_sucursal')
#          sucu.descripcion=request.POST.get('descripcion')  

#          sucu.save()
#         print("Se ha registrado su Registro a la Pagina de SUUCRSAL")
#        return redirect('sucursalhome')

            id_sucursal=request.POST.get("id_sucursal")
            
            direccion_sucursal=request.POST.get("direccion_sucursal")
            descripcion=request.POST.get("descripcion")


            sucursal.objects.create(
            id_sucursal=id_sucursal,
            direccion_sucursal=direccion_sucursal,
            descripcion=descripcion,





        )
        print("guardando Registro a la tabla de SUCURSAL RETORNANDO NUEVAMENTE A LA TABLA PRINCIPAL DE SUCURSAL")
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



    #VISTA DE CATEGORIA

def categoriatabla(request):
        cat=categoria.objects.all()

        context={
            'cat':cat

        }

        return render(request,"categoria.html",context)
   



    #FIN DE LA VISTA DE CATEGORIA


def añadircategoria(request):

    if request.method=='POST':

        categoria_id=request.POST.get("categoria_id")
        nombre_categoria=request.POST.get("nombre_categoria")
        descripcion_categoria=request.POST.get("descripcion_categoria")





        categoria.objects.create(
   
            categoria_id=categoria_id,
            nombre_categoria=nombre_categoria,
            descripcion_categoria=descripcion_categoria,


        )
        print("SALVADO CAtegoria RETORNANDO OTRA VEZ")
    else:
        print("LA LLAVE A LA QUE ESTAS GUARDANDO ESTA DUPLICADA")



        
    return redirect("categoriatabla")


def editarcategoria(request , id):

    if request.method=='POST':

        cat= categoria.objects.get(categoria_id=id)
     


        categoria_id=request.POST.get("categoria_id")
        nombre_categoria=request.POST.get("nombre_categoria")
        descripcion_categoria=request.POST.get("descripcion_categoria")



        cat.categoria_id=categoria_id
        cat.nombre_categoria=nombre_categoria
        cat.descripcion_categoria=descripcion_categoria

        cat.save()


        print("SALVANDO EDICION DE CAtegoria RETORNANDO OTRA VEZ")
    else:
        print("LA LLAVE A LA QUE ESTAS GUARDANDO ESTA DUPLICADA")



        
    return redirect("categoriatabla")




def eliminarcategoria(request,id):

    cat=categoria.objects.get(categoria_id=id)

    cat.delete()


    return redirect('categoriatabla')
    #VISTA DE Familia_producto




def familiaproductotabla(request):
    fam=familia_producto.objects.all()

    context={

        'fam':fam
    }


    return render(request,"familiaproducto.html", context)

    
def añadirfamiliaproducto(request):

    if request.method=='POST':

        id_familia_producto=request.POST.get("id_familia_producto")
        nombre_familia=request.POST.get("nombre_familia")
        descripcion_familia=request.POST.get("descripcion_familia")





        familia_producto.objects.create(
   
            id_familia_producto=id_familia_producto,
            nombre_familia=nombre_familia,
            descripcion_familia=descripcion_familia,

        )
        print("SALVADO CAtegoria RETORNANDO OTRA VEZ")
    else:
        print("LA LLAVE A LA QUE ESTAS GUARDANDO ESTA DUPLICADA")






    return redirect('familiaproductotabla')
    
    

def editarfamiliaproducto(request,id):
    

    if request.method=='POST':

        fam=familia_producto.objects.get(id_familia_producto=id)
     

        id_familia_producto=request.POST.get("id_familia_producto")
        nombre_familia=request.POST.get("nombre_familia")
        descripcion_familia=request.POST.get("descripcion_familia")


        fam.id_familia_producto=id_familia_producto
        fam.nombre_familia=nombre_familia
        fam.descripcion_familia=descripcion_familia


        fam.save()


        print("SALVANDO EDICION DE LA FAMILIA DE PRODUCTOS RETORNANDO OTRA VEZ")
    else:
        print("LA LLAVE A LA QUE ESTAS GUARDANDO ESTA DUPLICADA")

    return redirect('familiaproductotabla')



def eliminarfamilia(request, id):
    fam=familia_producto.objects.get(id_familia_producto=id)
    fam.delete()

    return redirect('familiaproductotabla')



    #FIN DE LA VISTA DE Familia_producto


# Inicio de la Vista de Elaboracion

def elaboraciontable(request):
    ela=elaboracion.objects.all()
    context={
        'ela':ela

    }

    return render(request,"elaboracion.html", context)


def añadirelaboracion(request):
    if request.method=='POST':

        id_elaboracion=request.POST.get("id_elaboracion")
        descripcion_elaboracion=request.POST.get("descripcion_elaboracion")

        elaboracion.objects.create(
        id_elaboracion=id_elaboracion,
        descripcion_elaboracion=descripcion_elaboracion,




        )

        print("SALVADO Elaboracion RETORNANDO OTRA VEZ")
        return redirect('elaboraciontable')
    else:
        print("LA LLAVE A LA QUE ESTAS GUARDANDO ESTA DUPLICADA")
    return redirect(request,'elaboraciontable')

    
def editarelaboracio(request, id):


    ela=elaboracion.objects.get(id_elaboracion=id)
    id_elaboracion=request.POST.get('id_elaboracion')
    descripcion_elaboracion=request.POST.get('descripcion_elaboracion')



    ela.id_elaboracion=id_elaboracion
    ela.descripcion_elaboracion=descripcion_elaboracion

    ela.save()

    print("Se han guardado los CAMBIOS RETORNANDO A LA VISTA PRINCIPAL DE ELABORACION")




    return redirect('elaboraciontable')


def eliminarelaboracion(request,id):
    ela = elaboracion.objects.get(id_elaboracion=id)  
    ela.delete()  
    return redirect("elaboraciontable")




#Fin de la Vista de Elaboracion


#Inicio de la Vista de Almacen
def almacentabla(request):
    alma=almacen.objects.all()
    context={
        'alma':alma

    }

    return render(request,"almacen.html" , context)

def añadiralmacen(request):
    if request.method=='POST':

        id_almacen=request.POST.get("id_almacen")
        tipo_almacen=request.POST.get("tipo_almacen")
        descripcion_almacen=request.POST.get("descripcion_almacen")
        estado_almacen=request.POST.get("estado_almacen")


        almacen.objects.create(
            id_almacen=id_almacen,
            tipo_almacen=tipo_almacen,
            descripcion_almacen=descripcion_almacen,
            estado_almacen=estado_almacen,





        )

        print("SALVADO en almacentabla RETORNANDO OTRA VEZ")
        return redirect('almacentabla')
    else:
        print("LA LLAVE A LA QUE ESTAS GUARDANDO ESTA DUPLICADA")
    return redirect(request,'almacentabla')


def editaralmacen(request,id):
    alma=almacen.objects.get(id_almacen=id)
    
    id_almacen=request.POST.get('id_almacen')
    tipo_almacen=request.POST.get('tipo_almacen')
    descripcion_almacen=request.POST.get('descripcion_almacen')
    estado_almacen=request.POST.get('estado_almacen')

    alma.id_almacen=id_almacen
    alma.tipo_almacen=tipo_almacen
    alma.descripcion_almacen=descripcion_almacen
    alma.estado_almacen=estado_almacen


    alma.save()

    print("Se han guardado los CAMBIOS RETORNANDO A LA VISTA PRINCIPAL DE ALMACEN RETORNANDO NUEVAMENTE")




    return redirect('almacentabla')

def eliminaralmacen(request,id):
    alma=almacen.objects.get(id_almacen=id)
    alma.delete()
    return redirect('almacentabla')
     





#Fin de la Vista de Almacen
