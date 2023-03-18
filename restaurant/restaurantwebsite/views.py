from django.shortcuts import render,redirect


from restaurantwebsite.models import insertuser,cargo,documentoemp,departamento,puesto,sucursal,empleados,categoria,familia_producto,elaboracion,almacen,menutabla,recetatabla



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

from passlib.context import CryptContext

from django.contrib.auth.hashers import make_password
from django.core.exceptions import ValidationError
from django.core.validators import validate_email
from django.contrib.auth.password_validation import validate_password
"""def registrarusuarioenellogin(request):

    if request.method == 'POST':
        nombre = request.POST['nombre']
        apellido = request.POST['apellido']
        username = request.POST['username']
        email = request.POST['email']
        password = request.POST['password']
        confirm_password = request.POST['confirm_password']
        registro_exitoso = False  # Inicialmente, el registro no es exitoso

        if password != confirm_password:
            messages.error(request,"Las contraseñas no coinciden")
            context = {
            'nombre': nombre,
            'apellido': apellido,
            'username': username,
            'email': email,
            }
            return render(request, 'signup.html', context)
        else:
            # Encriptar la contraseña
            pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")
            hashed_password = pwd_context.hash(password)

            user = insertuser.objects.create(
                nombre=nombre,
                apellido=apellido,
                username=username,
                email=email,
                password=hashed_password,
            )
            user.save()
            registro_exitoso = True  # El registro es exitoso ahora

        if registro_exitoso:
            messages.success(request,"USUARIO REGISTRADO CON EXITO!!!!")
            return redirect("signup")
        else:
            # renderizar el formulario de registro con los datos previos
            return render(request, 'signup.html', {'registro_exitoso': registro_exitoso})

    else:
        return render(request,'signup.html')"""


import bcrypt
import bcrypt

def encriptar_password(password):
    hashed_password = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(rounds=4)).decode('utf-8')
    return hashed_password

import bcrypt

def verificar_password(password, hashed_password):
    print(f"password: {password}")
    print(f"hashed_password: {hashed_password}")
    return bcrypt.checkpw(password.encode('utf-8'), hashed_password.encode('utf-8'))







from django.db import IntegrityError
from passlib.hash import pbkdf2_sha256

def registrarusuarioenellogin(request):

    if request.method == 'POST':
        nombre = request.POST['nombre']
        apellido = request.POST['apellido']
        username = request.POST['username']
        email = request.POST['email']
        password = request.POST['password']
        confirm_password = request.POST['confirm_password']

        if password != confirm_password:
            messages.error(request, "Las contraseñas no coinciden")
        else:
        # Encriptar la contraseña
            hashed_password = encriptar_password(password)

        # Verificar si ya existe un usuario con el mismo nombre de usuario o correo electrónico
            if insertuser.objects.filter(Q(username=username) | Q(email=email)).exists():
                messages.error(request, "Ya existe un usuario con ese nombre de usuario y correo electrónico.")
            else:
                try:
                # Crear un nuevo usuario
                    user = insertuser.objects.create(
                    nombre=nombre,
                    apellido=apellido,
                    username=username,
                    email=email,
                    password=hashed_password,
                    )
                    messages.success(request, "USUARIO REGISTRADO CON EXITO!!!!")
                    return redirect("signup")
                except IntegrityError:
                    messages.error(request, "Ya existe un usuario con ese nombre de usuario o correo electrónico.")
    
    # Agregar los datos ingresados anteriormente al contexto
        context = {
        'nombre': nombre,
        'apellido': apellido,
        'username': username,
        'email': email,
        }
        return render(request, 'signup.html', context)

    else:
    # Si el método de la solicitud no es "POST", crear un contexto vacío.
        context = {}
        return render(request, 'signup.html', context)




"""    if request.method == 'POST':
        nombre = request.POST['nombre']
        apellido = request.POST['apellido']
        username = request.POST['username']
        email = request.POST['email']
        password = request.POST['password']
        confirm_password = request.POST['confirm_password']

        if password != confirm_password:
            messages.error(request, "Las contraseñas no coinciden")
        else:
            # Encriptar la contraseña
            

            # Verificar si ya existe un usuario con el mismo nombre de usuario o correo electrónico
            if insertuser.objects.filter(Q(username=username) | Q(email=email)).exists():
                messages.error(request, "Ya existe un usuario con ese nombre de usuario o correo electrónico.")
            else:
                try:
                    # Crear un nuevo usuario
                    user = insertuser.objects.create(
                        nombre=nombre,
                        apellido=apellido,
                        username=username,
                        email=email,
                        password=password,
                    )
                    user.save()
                    messages.success(request, "USUARIO REGISTRADO CON EXITO!!!!")
                    return redirect("signup")
                except IntegrityError:
                    messages.error(request, "Ya existe un usuario con ese nombre de usuario o correo electrónico.")
        
        # Crear un nuevo contexto que contenga los datos del usuario y el mensaje flash.
        context = {
            'nombre': nombre,
            'apellido': apellido,
            'username': username,
            'email': email,
        }
        return render(request, 'signup.html', context)

    else:
        return render(request, 'signup.html')
"""

def registrarentablausuario(request):
    try:  
        
        if request.method=='POST':
#         if request.POST.get('username') and request.POST.get('password'):
#          saverecord = insertuser()
#          saverecord.id_usuario=request.POST.get('id_usuario')
#          saverecord.username=request.POST.get('username')
#          saverecord.nombre=request.POST.get('nombre')
#          saverecord.email=request.POST.get('email')
#          saverecord.password=request.POST.get('password')
#          saverecord.estado=request.POST.get('estado')
#          saverecord.apellido=request.POST.get('apellido')
         

#          saverecord.save()



            id_usuario=request.POST.get("id_usuario")
            username=request.POST.get("username")
            nombre=request.POST.get("nombre")
            email=request.POST.get("email")
            password=request.POST.get("password")
            estado=request.POST.get("estado")
            apellido=request.POST.get("apellido")

        # Encriptar la contraseña
            hashed_password = encriptar_password(password)

                        # Verificar si ya existe un usuario con el mismo id_usuario
            if insertuser.objects.filter(Q(username=username) | Q(email=email) ).exists():
                messages.error(request, 'Error: ya existe un registro con ese Email y Nombre de Usuario')
                return redirect('tableuser')
            else:
                insertuser.objects.create(
                id_usuario=id_usuario,
                username=username,
                nombre=nombre,
                email=email,
                password=hashed_password,
                estado=estado,
                apellido=apellido,


        )

        messages.success(request, 'Registro Agregado con Exito')
        return redirect("tableuser")
    except IntegrityError:    
        messages.error(request, 'Error: ya existe un registro con esa clave')

        return redirect('tableuser')



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
  
    messages.success(request, 'Registro Modificado con Exito')
    return redirect("tableuser")


def eliminarusuario(request,id):
    user = insertuser.objects.get(id_usuario=id)  
    user.delete()  
    messages.success(request, 'Registro Eliminado con Exito')
    return redirect("tableuser")




from django.contrib.auth.forms import UserCreationForm
from .form import CreateUserForm


from django.contrib.auth.models import User
def RegistroNuevoCliente(request):
    form=CreateUserForm
    users = User.objects.all()

    context={'form':form , 'users': users }

    return render (request,"RegistroNuevoCliente.html",context)



def AgregarNuevoUsuario(request):
    form= CreateUserForm

    if request.method == 'POST':
        form = CreateUserForm(request.POST)
        if form.is_valid():
            form.save()

    return redirect ("RegistroNuevoCliente")



from django.contrib import messages
from django.contrib.auth.forms import UserChangeForm

from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from django.shortcuts import get_object_or_404






    




def home(request):
    return render(request, 'home.html')

from passlib.context import CryptContext


def login_user(request):


    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        try:
            user = insertuser.objects.get(username=username)
            if user.bloqueado:
                # Usuario bloqueado, mostrar mensaje de error
                messages.error(request, 'La cuenta ha sido bloqueada. Contacte con el Administrador de Pizza Wave')
            elif verificar_password(password, user.password):
                # Usuario y contraseña válidos
                
                request.session['username'] = user.username
                request.session['password'] = user.password
                user.intentos = 0 # Resetear attempts si inicia sesión correctamente
                user.bloqueado = False # Desbloquear la cuenta si inicia sesión correctamente
                user.save()
                return render(request, 'home.html')
            else:
                # Usuario o contraseña incorrectos
                user.intentos += 1 # Incrementar attempts si falla el inicio de sesión
                if user.intentos >= 3:
                    user.bloqueado = True # Bloquear la cuenta si se supera el límite de intentos
                user.save()
                messages.success(request, 'La Contraseña ha sido Incorrecta')
        except insertuser.DoesNotExist:
            messages.success(request, 'Usuario No Existente!!')
    return render(request, 'empleadologin.html')



"""    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        try:
            user = insertuser.objects.get(username=username)
            if user.password == password:
                # Usuario y contraseña válidos
                request.session['username'] = user.username
                request.session['password'] = user.password
                user.intentos = 0 # Resetear attempts si inicia sesión correctamente
                user.bloqueado = False # Desbloquear la cuenta si inicia sesión correctamente
                user.save()
                return render(request, 'home.html')
            else:
                # Usuario o contraseña incorrectos
                user.intentos += 1 # Incrementar attempts si falla el inicio de sesión
                if user.intentos >= 3:
                    user.bloqueado = True # Bloquear la cuenta si se supera el límite de intentos
                user.save()
                messages.success(request, 'La Cuenta Ha sido BLoqueada por exceder el Numero Maximo de Intentos')
        except insertuser.DoesNotExist:
            messages.success(request, 'Usuario No Existente!!')
    return render(request, 'empleadologin.html')
"""
"""    if request.method == 'POST':
        username = request.POST.get['username']
        password = request.POST.get['password']
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('home')
        else:
            messages.error(request, 'Usuario o contraseña incorrecta.')
    return render(request, 'empleadologin.html')"""






"""    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']

        try:
            user = insertuser.objects.get(username=username)
        except insertuser.DoesNotExist:
            return render(request, 'empleadologin.html', {'error_message': 'Correo electrónico o contraseña incorrectos'})

        pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")
        if pwd_context.verify(password, user.password):
            # log in user
            return redirect('home')
        else:
            return render(request, 'empleadologin.html', {'error_message': 'Correo electrónico o contraseña incorrectos'})
    else:
        return render(request, 'empleadologin.html')"""


"""
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')

        # obtén el usuario según su nombre de usuario o correo electrónico
        user = authenticate(request, username=username.lower(), password=password)
            



        if user is not None:
            print(f"Usuario encontrado: {user}")
            if check_password(password, user.password):
                login(request, user)
                return redirect('home')
            else:
                messages.error(request, 'Credenciales inválidas')
        else:
            messages.error(request, 'Credenciales inválidas')
            print(f"Usuario no encontrado: {username}")

    return render(request, 'empleadologin.html')
"""



"""
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')

        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('usuarios')
        else:
            messages.error(request, 'Credenciales inválidas')
    
    return render(request, 'empleadologin.html')
"""


   

    

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
    try:  
        pass 
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
                numero_identificacion=request.POST.get("numero_identificacion")


                    # Verificar si ya existe un empleado con la misma clave
                if empleados.objects.filter(Q(nombre=nombre) | Q(apellido=apellido)).exists():
                    messages.error(request, 'Error: ya existe un registro con ese Nombre Y Apellido')
                    return redirect('empleados')

     #   id_sucursal = request.POST.get("departamento")
      #  sucursal.objects.get(id=id_sucursal)
       # print(id_sucursal)

       # id_departamento = request.POST.get("sucursal")
       # departamento.objects.get(id=id_departamento)

       # puesto_id = request.POST.get("puesto")
      #  puesto.objects.get(id=puesto_id)
                else:
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
                numero_identificacion=numero_identificacion,




                )
                messages.success(request, 'Registro Agregado con Exito')
                return redirect('empleados')

    except IntegrityError:    
        messages.error(request, 'Error: ya existe un registro con esa clave')

 
    return redirect('empleados')



def eliminarempleado(request,id):
    emp = empleados.objects.get(id_empleado=id)  
    emp.delete()
    messages.success(request, 'Registro Eliminado con Exito')  
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
    numero_identificacion=request.POST.get('numero_identificacion')

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
    emp.numero_identificacion=numero_identificacion

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
    messages.success(request, 'Registro Editado con Exito')
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
    try:  
        pass
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


            if cargo.objects.filter(Q(nombre_cargo=nombre_cargo)).exists():
                messages.error(request, 'Ya existe un Cargo Con ese Nombre')
                return redirect('cargoregister')
        
            else:
        

                cargo.objects.create(
                id=id,
                nombre_cargo=nombre_cargo,
                descripcion=descripcion,





            )
        messages.success(request, 'Registro Agregado con Exito')
        return redirect('cargoregister')

    except IntegrityError:    
        messages.error(request, 'Error: ya existe un registro con esa clave')

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
  

    messages.success(request, 'Registro Modificado con Exito')
    return redirect("cargoregister")



def visualizarcargo(request,id):
    
    car =cargo.objects.get(id=id)
    print(id)
    return render(request,'cargoregister.html',{'car':car})
    



  
def borrarcargo(request , id):
    car = cargo.objects.get(id=id)  
    car.delete()
    messages.success(request, 'Registro Eliminado con Exito')  
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
            
            Q(id__icontains=query) |
            Q(tipo_identificacion__icontains=query) ).distinct

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
    try:  
        pass  
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


            if documentoemp.objects.filter(Q(tipo_identificacion=tipo_identificacion)).exists():
                messages.error(request, 'Ya existe un Documento Con ese Nombre')
                return redirect('tipodocumentoemp')
            else:

                    documentoemp.objects.create(
                id=id,
                tipo_identificacion=tipo_identificacion,
    






            )
            messages.success(request, 'Registro Agregado con Exito')
        return redirect('tipodocumentoemp')

    except IntegrityError:    
        messages.error(request, 'Error: ya existe un registro con esa clave')

        return redirect('tipodocumentoemp')








def borrartipodocumentoemp(request , id):
    docs = documentoemp.objects.get(id=id)  
    docs.delete()
    messages.success(request, 'Registro Borrado con Exito')  
    return redirect("tipodocumentoemp")



def editartipodedocumento(request, id):
    docs =tipodocumentoemp.objects.get(id=id)
    print(id)
    return render(request,'tipodocumentoemp.html',{'docs':docs})


def actualizartipodedocumento(request , id ):
    
    docs= documentoemp.objects.get(id=id)
    id=request.POST.get('id')

    tipo_identificacion=request.POST.get('tipo_identificacion')

    



    docs.id=id

    docs.tipo_identificacion=tipo_identificacion
    


    docs.save()
  

    messages.success(request, 'Registro Modificado con Exito')
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
    messages.success(request, 'Registro Eliminado con Exito')
    return redirect("departamentohome")


def departamentoeditar(request, id):
   dep=departamento.objects.all()

   context={

        'dep':dep
    }

   return render(request,'departamento.html', context)

def añadirdepartamento(request):
    try:  
        pass 
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


            if departamento.objects.filter(Q(departamento=dept.departamento) | Q(codigo_postal=dept.codigo_postal)).exists():
                messages.error(request, 'Ya existe un Departamento con Ese nombre y codigo postal por favor introduzca otro')
                return redirect('departamentohome')

            else:


                departamento.objects.create(
                id_departamento=dept.id_departamento,
                departamento=dept.departamento,
                codigo_postal=dept.codigo_postal,





            )
            messages.success(request, 'Registro Agregado con Exito')
            return redirect('departamentohome')

    except IntegrityError:    
        messages.error(request, 'Error: ya existe un registro con esa clave')


    return redirect('departamentohome')



def actualizardepartamentos(request , id ):
    
    dep= departamento.objects.get(id_departamento=id)
    dep.id_departamento=request.POST.get('id_departamento')
    dep.departamento=request.POST.get('departamento')
    dep.codigo_postal=request.POST.get('codigo_postal')
     


    dep.save()
    messages.success(request, 'Registro Modificado con Exito')
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
    try:  
        pass  
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


            if puesto.objects.filter(Q(puesto=pu.puesto)).exists():
                messages.error(request, 'Ya existe un Puesto con Ese nombre por favor introduzca otro')
                return redirect('puestohome')

            else:
                puesto.objects.create(
                puesto_id=pu.puesto_id,
                puesto=pu.puesto,
                descripcion=pu.descripcion,





            )
            messages.success(request, 'Registro Agregado con Exito')
            return redirect('puestohome')

    except IntegrityError:    
        messages.error(request, 'Error: ya existe un registro con esa clave')

    return redirect('puestohome')





def eliminarpuesto(request, id):
    puest = puesto.objects.get(puesto_id=id)  
    puest.delete()  
    messages.success(request, 'Registro Eliminado con Exito')
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
    messages.success(request, 'Registro Modificado con Exito')


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
    try:  
        pass 
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

            if sucursal.objects.filter(Q(direccion_sucursal=direccion_sucursal)).exists():
                messages.error(request, 'Ya existe un Sucursal con Ese nombre por favor introduzca otro')
                return redirect('sucursalhome')


            else:
                sucursal.objects.create(
            id_sucursal=id_sucursal,
            direccion_sucursal=direccion_sucursal,
            descripcion=descripcion,





        )
        messages.success(request, 'Registro Agregado con Exito')
        return redirect('sucursalhome')
    except IntegrityError:    
        messages.error(request, 'Error: ya existe un registro con esa clave')

        return redirect('sucursalhome')



def eliminarsucurusal(request , id):
    sucu = sucursal.objects.get(id_sucursal=id)  
    sucu.delete()
    messages.info(request,"Registro Eliminado Exitosamente")  
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


    messages.info(request,"Registro Actualizado Exitosamente")
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
    try:  
        pass
        if request.method=='POST':

            categoria_id=request.POST.get("categoria_id")
            nombre_categoria=request.POST.get("nombre_categoria")
            descripcion_categoria=request.POST.get("descripcion_categoria")



            if categoria.objects.filter(Q(nombre_categoria=nombre_categoria)).exists():
                messages.error(request, 'Ya existe una Categoria con Ese nombre por favor introduzca otro')
                return redirect('categoriatabla')

            else:
                categoria.objects.create(
   
                categoria_id=categoria_id,
                nombre_categoria=nombre_categoria,
                descripcion_categoria=descripcion_categoria,


            )
            messages.success(request, 'Registro Agregado con Exito')
            return redirect("categoriatabla")

    except IntegrityError:    
        messages.error(request, 'Error: ya existe un registro con esa clave')



        
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


        messages.success(request, 'Registro Modificado con Exito')
    else:
        print("LA LLAVE A LA QUE ESTAS GUARDANDO ESTA DUPLICADA")



        
    return redirect("categoriatabla")




def eliminarcategoria(request,id):

    cat=categoria.objects.get(categoria_id=id)

    cat.delete()
    messages.success(request, 'Registro Eliminado con Exito')


    return redirect('categoriatabla')
    #VISTA DE Familia_producto




def familiaproductotabla(request):
    fam=familia_producto.objects.all()

    context={

        'fam':fam
    }


    return render(request,"familiaproducto.html", context)

    
def añadirfamiliaproducto(request):
    try:  
        pass
        if request.method=='POST':

            id_familia_producto=request.POST.get("id_familia_producto")
            nombre_familia=request.POST.get("nombre_familia")
            descripcion_familia=request.POST.get("descripcion_familia")


            if familia_producto.objects.filter(Q(nombre_familia=nombre_familia)).exists():
                messages.error(request, 'Ya existe una Familia con Ese nombre por favor introduzca otro')
                return redirect('familiaproductotabla')

            else:

                familia_producto.objects.create(
   
                id_familia_producto=id_familia_producto,
                nombre_familia=nombre_familia,
                descripcion_familia=descripcion_familia,

            )
            messages.success(request, 'Registro Agregado con Exito')
            return redirect('familiaproductotabla')




    except IntegrityError:    
        messages.error(request, 'Error: ya existe un registro con esa clave')
 
    
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


        messages.success(request, 'Registro Modificado con Exito')
    else:
        print("LA LLAVE A LA QUE ESTAS GUARDANDO ESTA DUPLICADA")

    return redirect('familiaproductotabla')



def eliminarfamilia(request, id):
    fam=familia_producto.objects.get(id_familia_producto=id)
    fam.delete()
    messages.success(request, 'Registro Eliminado con Exito')
    return redirect('familiaproductotabla')



    #FIN DE LA VISTA DE Familia_producto


# Inicio de la Vista de Elaboracion
from django.db import IntegrityError

def elaboraciontable(request):
    ela=elaboracion.objects.all()
    context={
        'ela':ela

    }

    return render(request,"elaboracion.html", context)


def añadirelaboracion(request):
    try:  
        pass   
        if request.method=='POST':

            id_elaboracion=request.POST.get("id_elaboracion")
            descripcion_elaboracion=request.POST.get("descripcion_elaboracion")

            elaboracion.objects.create(
            id_elaboracion=id_elaboracion,
            descripcion_elaboracion=descripcion_elaboracion,




            )
            
            messages.success(request, 'Registro Agregado con Exito')
            return redirect('elaboraciontable')
        
        
    except IntegrityError:    
        messages.error(request, 'Error: ya existe un registro con esa clave')

 

    return redirect('elaboraciontable')

    
def editarelaboracio(request, id):


    ela=elaboracion.objects.get(id_elaboracion=id)
    id_elaboracion=request.POST.get('id_elaboracion')
    descripcion_elaboracion=request.POST.get('descripcion_elaboracion')



    ela.id_elaboracion=id_elaboracion
    ela.descripcion_elaboracion=descripcion_elaboracion

    ela.save()

    messages.success(request, 'Registro Modificado con Exito')




    return redirect('elaboraciontable')


def eliminarelaboracion(request,id):
    ela = elaboracion.objects.get(id_elaboracion=id)  
    ela.delete()  
    messages.success(request, 'Registro Eliminado con Exito')
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
    try:  
        pass          
        if request.method=='POST':

            id_almacen=request.POST.get("id_almacen")
            tipo_almacen=request.POST.get("tipo_almacen")
            descripcion_almacen=request.POST.get("descripcion_almacen")
            estado_almacen=request.POST.get("estado_almacen")


            if almacen.objects.filter(Q(tipo_almacen=tipo_almacen)).exists():
                messages.error(request, 'Ya existe un Almacen con Ese nombre por favor introduzca otro')
                return redirect('almacentabla')


            else:
                almacen.objects.create(
                id_almacen=id_almacen,
                tipo_almacen=tipo_almacen,
                descripcion_almacen=descripcion_almacen,
                estado_almacen=estado_almacen,





            )

            messages.success(request, 'Registro Agregado con Exito')
            return redirect('almacentabla')
    except IntegrityError:    
        messages.error(request, 'Error: ya existe un registro con esa clave')
    return redirect('almacentabla')


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

    messages.success(request, 'Registro Modificado con Exito')




    return redirect('almacentabla')

def eliminaralmacen(request,id):
    alma=almacen.objects.get(id_almacen=id)
    alma.delete()
    messages.success(request, 'Registro Eliminado con Exito')
    return redirect('almacentabla')
     





#Fin de la Vista de Almacen


# VISTA DE Menu

def menutablaregistros(request):
    ela=elaboracion.objects.all()
    men=menutabla.objects.all()
    context={
        'ela':ela,        
        'men':men,
    }


    return render(request,"menutabla.html",context)

def agregarmenu(request):

    try:  
        pass
        if request.method=='POST':

            id_menu=request.POST.get("id_menu")
            nombre_menu=request.POST.get("nombre_menu")
            precio_menu=request.POST.get("precio_menu")
            descripcion_menu=request.POST.get("descripcion_menu")
            modo_elaboracion=request.POST.get("modo_elaboracion")


            if menutabla.objects.filter(Q(nombre_menu=nombre_menu)).exists():
                messages.error(request, 'Ya existe un Menu con Ese nombre por favor introduzca otro')
                return redirect('menutablaregistros')

            else:

                menutabla.objects.create(
                id_menu=id_menu,
                nombre_menu=nombre_menu,
                precio_menu=precio_menu,
                descripcion_menu=descripcion_menu,
                modo_elaboracion=modo_elaboracion,




            )
            messages.success(request, 'Registro Agregado con Exito')

            return redirect("menutablaregistros")


    except IntegrityError:    
        messages.error(request, 'Error: ya existe un registro con esa clave')


    return redirect('menutablaregistros')




def editarmenutabla(request,id):
    men=menutabla.objects.get(id_menu=id)
    
    id_menu=request.POST.get('id_menu')
    nombre_menu=request.POST.get('nombre_menu')
    precio_menu=request.POST.get('precio_menu')
    descripcion_menu=request.POST.get('descripcion_menu')
    modo_elaboracion=request.POST.get('modo_elaboracion')

    men.id_menu=id_menu
    men.nombre_menu=nombre_menu
    men.precio_menu=precio_menu
    men.descripcion_menu=descripcion_menu
    men.modo_elaboracion=modo_elaboracion

    men.save()

    messages.success(request, 'Registro Modificado con Exito')




    return redirect('menutablaregistros')

def eliminarmenutabla(request,id):
    men=menutabla.objects.get(id_menu=id)
    men.delete()

    messages.success(request, 'Registro Eliminado con Exito')
    return redirect('menutablaregistros')


# FIN DE VISTA Menu



def recetatablaregistros(request):
    rec=recetatabla.objects.all()
    men=menutabla.objects.all()
    context={
        'rec':rec,
        'men':men,
    }


    return render(request,"receta.html",context)


def agregarreceta(request):
    try:  
        pass         
        if request.method=='POST':

            id_receta=request.POST.get("id_receta")
            nombre_receta=request.POST.get("nombre_receta")
            menu_id=request.POST.get("menu_id")
            descripcion_receta=request.POST.get("descripcion_receta")
            porciones_receta=request.POST.get("porciones_receta")


            if recetatabla.objects.filter(Q(nombre_receta=nombre_receta)).exists():
                messages.error(request, 'Ya existe una Receta con Ese nombre por favor introduzca otro')
                return redirect('recetatablaregistros')

            else:

                recetatabla.objects.create(
                id_receta=id_receta,
                nombre_receta=nombre_receta,
                menu_id=menu_id,
                descripcion_receta=descripcion_receta,
                porciones_receta=porciones_receta,


            )
            messages.success(request, 'Registro Agregado con Exito')

            return redirect("recetatablaregistros")

    except IntegrityError:    
        messages.error(request, 'Error: ya existe un registro con esa clave')

    return redirect('recetatablaregistros')
        


def editarreceta(request,id):
    rec=recetatabla.objects.get(id_receta=id)
    
    id_receta=request.POST.get('id_receta')
    nombre_receta=request.POST.get('nombre_receta')
    menu_id=request.POST.get('menu_id')
    descripcion_receta=request.POST.get('descripcion_receta')
    porciones_receta=request.POST.get('porciones_receta')

    rec.id_receta=id_receta
    rec.nombre_receta=nombre_receta
    rec.menu_id=menu_id
    rec.descripcion_receta=descripcion_receta
    rec.porciones_receta=porciones_receta

    rec.save()

    messages.success(request, 'Registro Modificado con Exito')




    return redirect('recetatablaregistros')


def eliminarreceta(request,id):
    rec=recetatabla.objects.get(id_receta=id)
    rec.delete()
    messages.success(request, 'Registro Eliminado con Exito')
    return redirect('recetatablaregistros')
