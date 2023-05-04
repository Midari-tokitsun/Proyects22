from django.shortcuts import render,redirect


from restaurantwebsite.models import insertuser,cargo,documentoemp,departamento,puesto,sucursal,empleados,categoria,familia_producto,elaboracion,almacen,menutabla,recetatabla,detalle_pedido,estado_pedido,sar_tabla,metodo_pago_tabla,historico_menu,reservacionestabla,productostabla,inventariotabla,promocionestabla,provedorestabla,pedidostabla,historico_producto,factura_tabla,impuesto_tabla,descuento_tabla,cliente_tabla


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


        # Inicializar variables
    nombre = ''
    apellido = ''
    username = ''
    email = ''
    password = ''
    confirm_password = ''
    telefono = ''

    if request.method == 'POST':
        nombre = request.POST['nombre']
        apellido = request.POST['apellido']
        username = request.POST['username']
        email = request.POST['email']
        password = request.POST['password']
        confirm_password = request.POST['confirm_password']
        telefono=request.POST['telefono']

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
                    insertuser.objects.create(
                    nombre=nombre,
                    apellido=apellido,
                    username=username,
                    email=email,
                    password=hashed_password,
                    telefono=telefono,
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
        'telefono':telefono,
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
from django.http import JsonResponse
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
            telefono=request.POST.get("telefono")

        # Encriptar la contraseña
            hashed_password = encriptar_password(password)

            # Verificar si ya existe un usuario con el mismo id_usuario
            if insertuser.objects.filter(Q(username=username) | Q(email=email) ).exists():
                messages.error(request, 'Error: ya existe un registro con ese Email y Nombre de Usuario')
                return redirect('tableuser')
            else:
                insertuser.objects.create(
                id_usuario=request.POST.get('id_usuario'),
                username=username,
                nombre=nombre,
                email=email,
                password=hashed_password,
                estado=estado,
                apellido=apellido,
                telefono=telefono,

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
    telefono=request.POST.get('telefono')

    user.apellido=apellido
    user.estado=estado
    

    user.id_usuario=id
    user.username=username
    user.password=password
    user.nombre=nombre
    user.email=email
    user.telefono=telefono

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
            
            elif user.estado == 'Inactivo':
            # Usuario inactivo, mostrar mensaje de error
                messages.error(request, 'La cuenta está inactiva. Contacte con el Administrador de Pizza Wave')
            
            
            elif verificar_password(password, user.password):
                # Usuario y contraseña válidos
                #ponemos Esto para agarrar los datos del
                #usuario Logeado y extraer los datos
                request.session['username'] = user.username
                request.session['password'] = user.password
                request.session['nombre'] = user.nombre
                request.session['apellido'] = user.apellido
                request.session['email'] = user.email
                request.session['telefono'] = user.telefono
                
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
    if request.method=='POST':
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
    else:
        return render(request, 'editaralmacen.html')

def eliminaralmacen(request,id):
    alma=almacen.objects.get(id_almacen=id)
    alma.delete()
    messages.success(request, 'Registro Eliminado con Exito')
    return redirect('almacentabla')
     





#Fin de la Vista de Almacen


# VISTA DE Menu
from datetime import datetime


def menutablaregistros(request):
    ela=elaboracion.objects.all()
    men=menutabla.objects.all()
    imp=impuesto_tabla.objects.all()
    context={
        'ela':ela,        
        'men':men,
        'imp':imp,
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
            impuesto=request.POST.get("impuesto")


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
                impuesto=impuesto,



            )

                historico = historico_menu(
                    nombre_menu=nombre_menu,
                    precio_menu=precio_menu,
                    fecha_inicio=datetime.now() # Establecer la fecha_inicio al momento de crear el registro
                
                )
                historico.save()


            messages.success(request, 'Registro Agregado con Exito')

            return redirect("menutablaregistros")


    except IntegrityError:    
        messages.error(request, 'Error: ya existe un registro con esa clave')


    return redirect('menutablaregistros')




def editarmenutabla(request,id):
    men=menutabla.objects.get(id_menu=id)

    his = historico_menu.objects.filter(nombre_menu=men.nombre_menu, fecha_final=None).first()

    id_menu=request.POST.get('id_menu')
    nombre_menu=request.POST.get('nombre_menu')
    precio_menu=request.POST.get('precio_menu')
    descripcion_menu=request.POST.get('descripcion_menu')
    modo_elaboracion=request.POST.get('modo_elaboracion')
    impuesto=request.POST.get('impuesto')

    if his:
        his.fecha_final = datetime.now()
        his.save()

    men.id_menu=id_menu
    men.nombre_menu=nombre_menu
    men.precio_menu=precio_menu
    men.descripcion_menu=descripcion_menu
    men.modo_elaboracion=modo_elaboracion
    men.impuesto=impuesto

    men.save()

    historico = historico_menu(
        nombre_menu=nombre_menu,
        precio_menu=precio_menu,
        fecha_inicio=datetime.now(),
        fecha_final=None
    )
    historico.save()


    messages.success(request, 'Registro Modificado con Exito')




    return redirect('menutablaregistros')

def eliminarmenutabla(request,id):
    men=menutabla.objects.get(id_menu=id)
    men.delete()

    messages.success(request, 'Registro Eliminado con Exito')
    return redirect('menutablaregistros')


# FIN DE VISTA Menu

#VISTA HISTORICO MENU


def historicomenutabla(request):
    men=menutabla.objects.all()
    his = historico_menu.objects.all()
    context={
        'his':his,
        'men':men
    }


    return render(request, 'historicomenu.html', context)

def eliminarhistoricomenu(request,id):
    his=historico_menu.objects.get(id_historico=id)
    his.delete()
    messages.success(request, 'Registro Eliminado con Exito')
    return redirect('historicomenutabla')



from django.utils import timezone

"""def crearhistorico(request):
    if request.method == 'POST':
        # Obtener el menú seleccionado del formulario
        id_menu = request.POST.get('id_menu')

        # Obtener el menú correspondiente al ID seleccionado
        menu = menutabla.objects.get(id_menu=id_menu)

        # Obtener el precio nuevo del formulario
        precio_menu = request.POST.get('precio_menu')

        # Obtener el registro histórico más reciente del menú correspondiente
        ultimo_historico = historico_menu.objects.filter(nombre_menu=menu.nombre_menu).last()

        # Verificar si el precio nuevo es igual al precio del registro histórico más reciente
        if ultimo_historico and precio_menu == ultimo_historico.precio_menu:
            # El precio nuevo es igual al precio del registro histórico más reciente, no es necesario crear un nuevo registro
            messages.warning(request, 'El precio nuevo es igual al precio del registro histórico más reciente')
            return redirect('historicomenutabla')
        else:
            # Buscar si existe un registro histórico con el mismo nombre de menú y precio
            historico_existente = historico_menu.objects.filter(nombre_menu=menu.nombre_menu, precio_menu=precio_menu).first()

            if historico_existente:
                # Si ya existe un registro histórico con el mismo nombre de menú y precio, actualizarlo y establecer su fecha final
                historico_existente.fecha_final = timezone.now()
                historico_existente.save()

                # Actualizar el precio del menú actual y el registro histórico más reciente
                menu.precio_menu = precio_menu

                # Crear un nuevo registro histórico con la fecha de inicio actual
                his = historico_menu.objects.create(
                    nombre_menu=menu.nombre_menu,
                    precio_menu=precio_menu,
                    fecha_inicio=timezone.now(),
                    fecha_final=None,
                )

                messages.success(request, 'Registro actualizado con éxito')
            else:
                # Si no existe un registro histórico con el mismo nombre de menú y precio, crear uno nuevo y establecer la fecha final del registro histórico más reciente
                if ultimo_historico:
                    ultimo_historico.fecha_final = timezone.now()
                    ultimo_historico.save()

                # Crear un nuevo registro histórico con la fecha de inicio actual
                his = historico_menu.objects.create(
                    nombre_menu=menu.nombre_menu,
                    precio_menu=precio_menu,
                    fecha_inicio=timezone.now(),
                    fecha_final=None,
                )

                # Actualizar el precio del menú actual
         
                menu.precio_menu = precio_menu

                messages.success(request, 'Registro creado con éxito')

            menu.save()
            return redirect('historicomenutabla')

    # Obtener todos los menús disponibles
    menus = menutabla.objects.all()

    # Renderizar el formulario HTML
    return render(request, 'crearhistorico.html', {'menus': menus})"""





"""def editar_historico(request, id):
    historico = historico_menu.objects.get(id_historico=id)
    menu = menutabla.objects.get(nombre_menu=historico.nombre_menu)
    if request.method == 'POST':
        nuevo_precio = request.POST.get('nuevo_precio')
        historico.precio_menu = nuevo_precio
        menu.precio_menu = nuevo_precio
        historico.save()
        menu.save()
        messages.success(request, 'Historial actualizado con éxito.')
        return redirect('historicomenutabla')
    else:
        return render(request, 'editarhistorico.html', {'historico': historico})

"""

#FIN DE LA VISTA HISTORICO MENU



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


# FIN DE VISTA Receta



# Vista de Promociones 

def promociones(request):
    promo=promocionestabla.objects.all()
    men=menutabla.objects.all()
    context={
        'promo':promo,
        'men':men,
    }


    return render(request,"promociones.html",context)


def agregarpromociones(request):
    try:  
        pass         
        if request.method=='POST':

            id_promocion=request.POST.get("id_promocion")
            nombre_promocion=request.POST.get("nombre_promocion")
            menu_id=request.POST.get("menu_id")           
            precio_oferta=request.POST.get("precio_oferta") 
            fecha_final=request.POST.get("fecha_final") 
            descripcion=request.POST.get("descripcion")


            promocionestabla.objects.create(
                precio_oferta=precio_oferta,
                fecha_final=fecha_final,
                id_promocion=id_promocion,
                nombre_promocion=nombre_promocion,
                menu_id=menu_id,
                descripcion=descripcion,
         


            )
            messages.success(request, 'Registro Agregado con Exito')

            return redirect('promociones')

    except IntegrityError:    
        messages.error(request, 'Error: ya existe un registro con esa clave')   



    return redirect('promociones')


def editarpromocion(request,id):
    promo=promocionestabla.objects.get(id_promocion=id)
    
    id_promocion=request.POST.get('id_promocion')
    nombre_promocion=request.POST.get('nombre_promocion')
    menu_id=request.POST.get('menu_id')
    precio_oferta=request.POST.get('precio_oferta')
    descripcion=request.POST.get('descripcion')
    fecha_final=request.POST.get('fecha_final')

    promo.id_promocion=id_promocion
    promo.nombre_promocion=nombre_promocion
    promo.menu_id=menu_id
    promo.precio_oferta=precio_oferta
    promo.fecha_final=fecha_final
    promo.descripcion=descripcion

    promo.save()

    messages.success(request, 'Registro Modificado con Exito')




    return redirect('promociones')



def eliminarpromocion(request,id):
    promo=promocionestabla.objects.get(id_promocion=id)
    promo.delete()

    messages.success(request, 'Registro Modificado con Exito')


    return redirect('promociones')



#FIN DE LA VISTA DE PROMOCIONES


def detallepedido(request):
    deta=detalle_pedido.objects.all()
    esta=estado_pedido.objects.all()
    context={
        'esta':esta,
        'deta':deta

    }


    return render(request,"detallepedido.html",context)



def agregardetallepedido(request):
    try:  
        pass         
        if request.method=='POST':

            id_detalle=request.POST.get("id_detalle")
            descripcion_detalle=request.POST.get("descripcion_detalle")
            estado_pedido=request.POST.get("estado_pedido")
            tamaño_menu=request.POST.get("tamaño_menu")
            



            detalle_pedido.objects.create(
                id_detalle=id_detalle,
                descripcion_detalle=descripcion_detalle,
                estado_pedido=estado_pedido,
                tamaño_menu=tamaño_menu,


            )
            messages.success(request, 'Registro Agregado con Exito')

            return redirect("detallepedido")

    except IntegrityError:    
        messages.error(request, 'Error: ya existe un registro con esa clave')


    return redirect("detallepedido")

def editardetallepedido(request, id):
    deta=detalle_pedido.objects.get(id_detalle=id)
    
    id_detalle=request.POST.get('id_detalle')
    descripcion_detalle=request.POST.get('descripcion_detalle')
    estado_pedido=request.POST.get("estado_pedido")
    tamaño_menu=request.POST.get("tamaño_menu")


    deta.id_detalle=id_detalle
    deta.descripcion_detalle=descripcion_detalle
    deta.estado_pedido=estado_pedido
    deta.tamaño_menu=tamaño_menu

    deta.save()

    messages.success(request, 'Registro Modificado con Exito')




    return redirect('detallepedido')


def eliminardetallepedido(request, id):
    deta=detalle_pedido.objects.get(id_detalle=id)
    deta.delete()
    messages.success(request, 'Registro Eliminado con Exito')


    return redirect('detallepedido')









def estadopedido(request):
    esta=estado_pedido.objects.all()
    context={

        'esta':esta

    }


    return render(request,"estadopedido.html",context)


def guardarpedido(request):
    try:  
        pass         
        if request.method=='POST':

            id_estado=request.POST.get("id_estado")
            descripcion_pedido=request.POST.get("descripcion_pedido")



            estado_pedido.objects.create(
                id_estado=id_estado,
                descripcion_pedido=descripcion_pedido,
         


            )
            messages.success(request, 'Registro Agregado con Exito')

            return redirect("estadopedido")

    except IntegrityError:    
        messages.error(request, 'Error: ya existe un registro con esa clave')



    return redirect("estadopedido")



def editarestadopedido(request,id):
    esta=estado_pedido.objects.get(id_estado=id)
    
    id_estado=request.POST.get('id_estado')
    descripcion_pedido=request.POST.get('descripcion_pedido')

    esta.id_estado=id_estado
    esta.descripcion_pedido=descripcion_pedido

    esta.save()

    messages.success(request, 'Registro Modificado con Exito')




    return redirect('estadopedido')




def eliminarestadopedido(request,id):
    esta=estado_pedido.objects.get(id_estado=id)
    esta.delete()
    messages.success(request, 'Registro Eliminado con Exito')


    return redirect('estadopedido')



# FIN DE VISTA estado pedido

#Vista de Reservaciones

def reservaciones(request):
    res=reservacionestabla.objects.all()
    sucu=sucursal.objects.all()
    user=insertuser.objects.all()
    cli=cliente_tabla.objects.all()
    context={
        'res':res,
        'sucu':sucu,
        'user':user,
        'cli':cli,
    }



    return render(request,"reservacion.html",context)



from PIL import Image
from reportlab.lib.utils import ImageReader



def generar_pdf(request):
    # Obtener la ruta de la imagen
    ruta_imagen = 'C:/Users/USER/Desktop/restaurant/restaurantwebsite/static/images/restaurantfloorplant.JPG'
    # Abrir la imagen y convertirla a formato RGB
    imagen = Image.open(ruta_imagen).convert('RGB')
    # Obtener las dimensiones de la imagen
    ancho, alto = imagen.size
    # Crear un objeto BytesIO para guardar el PDF generado
    buffer = BytesIO()
    # Crear un objeto canvas de reportlab
    c = canvas.Canvas(buffer, pagesize=letter)
    # Convertir la imagen a formato ImageReader de reportlab
    imagen_reportlab = ImageReader(imagen)
    # Agregar la imagen al canvas
    c.drawImage(imagen_reportlab, 0, 0, width=ancho, height=alto)
    # Dibujar las mesas
    c.setFillColorRGB(1, 0, 0)  # Color rojo
    c.setFontSize(12)  # Tamaño de fuente 12
    c.setFont('Helvetica-Bold', 12)  # Fuente Helvetica negrita
    # Lista de coordenadas de mesa (ejemplo)
    mesas = request.session.get('mesas', []) # Obtener las coordenadas de las mesas de la sesión del usuario
    # Dibujar cada mesa en el PDF
    for mesa in mesas:
        # Convertir las coordenadas a números flotantes
        x, y = mesa
        # Ajustar las coordenadas para que la mesa se muestre en la posición correcta
        x = x * (ancho / 100)
        y = (100 - y) * (alto / 100)
        # Dibujar la mesa en el PDF
        c.drawCentredString(x, y, 'Mesa')
        c.circle(x, y, 10)
    # Guardar el PDF y cerrar el canvas
    c.save()
    # Obtener el contenido del BytesIO
    pdf = buffer.getvalue()
    # Cerrar el buffer
    buffer.close()
    # Crear una respuesta HTTP con el PDF generado
    response = HttpResponse(content_type='application/pdf')
    response['Content-Disposition'] = 'attachment; filename="reservaciones.pdf"'
    response.write(pdf)

    return response


def agregarreservacion(request):
    try:  
        pass         
        if request.method=='POST':

            id_reservacion=request.POST.get("id_reservacion")
            nombre_reservante=request.POST.get("nombre_reservante")
            nombre_sucursal=request.POST.get("nombre_sucursal")
            numero_mesas=request.POST.get("numero_mesas")
            fecha_reserva=request.POST.get("fecha_reserva")
            fecha_llegada=request.POST.get("fecha_llegada")
            descripcion=request.POST.get("descripcion")







            reservacionestabla.objects.create(
                id_reservacion=id_reservacion,
                nombre_reservante=nombre_reservante,
                nombre_sucursal=nombre_sucursal,
                numero_mesas=numero_mesas,
                fecha_reserva=fecha_reserva,
                fecha_llegada=fecha_llegada,
                descripcion=descripcion,


            )
            messages.success(request, 'Registro Agregado con Exito')

            return redirect("reservaciones")

    except IntegrityError:    
        messages.error(request, 'Error: ya existe un registro con esa clave')



    return redirect("reservaciones")


def editarreservacion(request,id):
    res=reservacionestabla.objects.get(id_reservacion=id)
    
    nombre_reservante=request.POST.get('nombre_reservante')
    nombre_sucursal=request.POST.get('nombre_sucursal')
    numero_mesas=request.POST.get('numero_mesas')
    fecha_reserva=request.POST.get('fecha_reserva')
    fecha_llegada=request.POST.get('fecha_llegada')
    descripcion=request.POST.get('descripcion')

    res.nombre_reservante=nombre_reservante
    res.nombre_sucursal=nombre_sucursal
    res.numero_mesas=numero_mesas
    res.fecha_reserva=fecha_reserva
    res.fecha_llegada=fecha_llegada
    res.descripcion=descripcion

    res.save()

    messages.success(request, 'Registro Modificado con Exito')




    return redirect('reservaciones')

def eliminarreservacion(request, id):
    res=reservacionestabla.objects.get(id_reservacion=id)
    res.delete()

    messages.success(request, 'Registro Eliminado con Exito')


    return redirect('reservaciones')
    



#Fin De la VISTA RESERVACIONES


#VISTA DE SAR
def sartabla(request):
    sar=sar_tabla.objects.all()
    sucu=sucursal.objects.all()
    context={
        'sar':sar,
        'sucu':sucu,

    }

    return render(request,"SAR.html",context)

def agregarsar(request):
    try:  
        pass         
        if request.method=='POST':
     

            id_sar=request.POST.get("id_sar")
            codigo_sar=request.POST.get("codigo_sar")

            descripcion=request.POST.get("descripcion")

            fecha_emision=request.POST.get("fecha_emision")
            fecha_final=request.POST.get("fecha_final")

            numero_inicial=request.POST.get("numero_inicial")
            numero_final=request.POST.get("numero_final")
            consecutivo=request.POST.get("consecutivo")
            cod_sucursal=request.POST.get("cod_sucursal")


            sar_tabla.objects.create(
                id_sar=id_sar,
                codigo_sar=codigo_sar,
       
            descripcion=descripcion,
            fecha_emision=fecha_emision,
            fecha_final=fecha_final,
            numero_inicial=numero_inicial,
            numero_final=numero_final,
            consecutivo=consecutivo,
            cod_sucursal=cod_sucursal,

            )
            messages.success(request, 'Registro Agregado con Exito')

            return redirect("sartabla")

    except IntegrityError:    
        messages.error(request, 'Error: ya existe un registro con esa clave')




    return redirect('sartabla')


def elminarsar(request,id):
    sar=sar_tabla.objects.get(id_sar=id)
    sar.delete()

    messages.success(request, 'Registro Eliminado con Exito')

    return redirect('sartabla')


def editarsar(request,id):
    sar=sar_tabla.objects.get(id_sar=id)
    

    codigo_sar=request.POST.get('codigo_sar')

    descripcion=request.POST.get('descripcion')

    fecha_emision=request.POST.get("fecha_emision")
    fecha_final=request.POST.get("fecha_final")

    numero_inicial=request.POST.get("numero_inicial")
    numero_final=request.POST.get("numero_final")
    consecutivo=request.POST.get("consecutivo")
    cod_sucursal=request.POST.get("cod_sucursal")
    sar.numero_inicial=numero_inicial
    sar.numero_final=numero_final
    sar.consecutivo=consecutivo
    sar.cod_sucursal=cod_sucursal


    sar.fecha_emision=fecha_emision
    sar.fecha_final=fecha_final

    sar.codigo_sar=codigo_sar

    sar.descripcion=descripcion

    sar.save()

    messages.success(request, 'Registro Modificado con Exito')


    return redirect('sartabla')


#FIN DE LA VISTA SAR


# VISTA METODO DE PAGO POST

def metodopagotabla(request):
    meto=metodo_pago_tabla.objects.all()
    context={
        'meto':meto

    }

    return render(request,"metodopago.html",context)


def agregarmetododepago(request):
    try:  
        pass         
        if request.method=='POST':
     

            id_metodo_pago=request.POST.get("id_metodo_pago")
            forma_pago=request.POST.get("forma_pago")

            moneda=request.POST.get("moneda")




            metodo_pago_tabla.objects.create(
                id_metodo_pago=id_metodo_pago,
                forma_pago=forma_pago,

            moneda=moneda,


            )
            messages.success(request, 'Registro Agregado con Exito')

            return redirect("metodopagotabla")

    except IntegrityError:    
        messages.error(request, 'Error: ya existe un registro con esa clave')




    return redirect('metodopagotabla')


def editarmetododepago(request,id):

    meto=metodo_pago_tabla.objects.get(id_metodo_pago=id)
    

    id_metodo_pago=request.POST.get('id_metodo_pago')
    forma_pago=request.POST.get('forma_pago')
    moneda=request.POST.get('moneda')

    meto.id_metodo_pago=id_metodo_pago
    meto.forma_pago=forma_pago
    meto.moneda=moneda
    meto.save()

    messages.success(request, 'Registro Modificado con Exito')




    return redirect('metodopagotabla')



def eliminarmetododepago(request,id):
    meto=metodo_pago_tabla.objects.get(id_metodo_pago=id)
    meto.delete()
    messages.success(request, 'Registro Eliminado con Exito')

    return redirect('metodopagotabla')




# FIN DE LA VISTA METODO DE PAGO POST

#VISTA DE INVENTARIO

def inventario(request):
    inv=inventariotabla.objects.all()
    pro=productostabla.objects.all()
    men=menutabla.objects.all()
    context={
        'inv':inv,
        'pro':pro,
        'men':men,
    }



    return render(request,"inventario.html",context)


def agregarinventario(request):

    try:  
        pass         
        if request.method=='POST':
     

            id_inventario=request.POST.get("id_inventario")
            producto=request.POST.get("producto")
            cantidad_actual=request.POST.get("cantidad_actual")
            cantidad_minima=request.POST.get("cantidad_minima")
            cantidad_maxima=request.POST.get("cantidad_maxima")
            unidad_de_medida=request.POST.get("unidad_de_medida")
            menu_id=request.POST.get("menu_id")
            



            inventariotabla.objects.create(
                id_inventario=id_inventario,
                producto=producto,
            cantidad_actual=cantidad_actual,
            cantidad_minima=cantidad_minima,
            cantidad_maxima=cantidad_maxima,
            unidad_de_medida=unidad_de_medida,
            menu_id=menu_id,

            )
            messages.success(request, 'Registro Agregado con Exito')

            return redirect("inventario")

    except IntegrityError:    
        messages.error(request, 'Error: ya existe un registro con esa clave')


    return redirect('inventario')


def editarinventario(request,id):

    inv=inventariotabla.objects.get(id_inventario=id)
    

    id_inventario=request.POST.get('id_inventario')
    producto=request.POST.get('producto')
    cantidad_actual=request.POST.get('cantidad_actual')
    cantidad_minima=request.POST.get('cantidad_minima')
    cantidad_maxima=request.POST.get('cantidad_maxima')
    unidad_de_medida=request.POST.get('unidad_de_medida')
    menu_id=request.POST.get("menu_id")

    inv.id_inventario=id_inventario
    inv.producto=producto
    inv.cantidad_actual=cantidad_actual
    inv.cantidad_minima=cantidad_minima
    inv.cantidad_maxima=cantidad_maxima
    inv.unidad_de_medida=unidad_de_medida
    inv.menu_id=menu_id
    inv.save()

    messages.success(request, 'Registro Modificado con Exito')

    return redirect('inventario')


def eliminarinventario(request,id):
    inv=inventariotabla.objects.get(id_inventario=id)
    inv.delete()
    messages.success(request, 'Registro Eliminado con Exito')

    return redirect('inventario')


#FIN DE LA VISTA DE INVENTARIO

#VISTA DE PROVEDORES
 
def provedores(request):
    prov=provedorestabla.objects.all()
    context={
        'prov':prov
    }

    return render(request,"provedores.html",context)

def agregarprovedor(request):
    try:  
        pass         
        if request.method=='POST':
     

            id_provedor=request.POST.get("id_provedor")
            nombre_provedor=request.POST.get("nombre_provedor")
            apellido_provedor=request.POST.get("apellido_provedor")
            compañia_provevdor=request.POST.get("compañia_provevdor")
            telefono_provedor=request.POST.get("telefono_provedor")
            email_provedor=request.POST.get("email_provedor")
       
            



            provedorestabla.objects.create(
            id_provedor=id_provedor,
            nombre_provedor=nombre_provedor,
            apellido_provedor=apellido_provedor,
            compañia_provevdor=compañia_provevdor,
            telefono_provedor=telefono_provedor,
            email_provedor=email_provedor,



            )
            messages.success(request, 'Registro Agregado con Exito')

            return redirect('provedores')

    except IntegrityError:    
        messages.error(request, 'Error: ya existe un registro con esa clave')



    return redirect('provedores')


def editarprovedores(request,id):
    prov=provedorestabla.objects.get(id_provedor=id)
    

    id_provedor=request.POST.get('id_provedor')
    nombre_provedor=request.POST.get('nombre_provedor')
    apellido_provedor=request.POST.get('apellido_provedor')
    compañia_provevdor=request.POST.get('compañia_provevdor')
    telefono_provedor=request.POST.get('telefono_provedor')
    email_provedor=request.POST.get('email_provedor')

    prov.id_provedor=id_provedor
    prov.nombre_provedor=nombre_provedor
    prov.apellido_provedor=apellido_provedor
    prov.compañia_provevdor=compañia_provevdor
    prov.telefono_provedor=telefono_provedor
    prov.email_provedor=email_provedor

    prov.save()

    messages.success(request, 'Registro Modificado con Exito')

    return redirect('provedores')


def eliminarprovedor(request,id):
     prov=provedorestabla.objects.get(id_provedor=id)
     prov.delete()
     messages.success(request, 'Registro Eliminado con Exito')
     return redirect('provedores')


#FIN DE LA VISTA DE PROVEDORES

#HISTORICO PRODUCTO
def historicoproducto(request):
    his=historico_producto.objects.all()
    context={
        'his':his
    }
    return render(request,"historicoproducto.html",context)

def eliminarhistoricoproducto(request,id):
    his=historico_producto.objects.get(id_historico=id)
    his.delete()

    messages.success(request, 'Registro Eliminado con Exito')

    return redirect('historicoproducto')

#VISTA DE PRODUCTOS


def productos(request):
    pro=productostabla.objects.all()
    cat=categoria.objects.all()
    alma=almacen.objects.all()
    inv=inventariotabla.objects.all()
    fam=familia_producto.objects.all()
    men=menutabla.objects.all()
    prov=provedorestabla.objects.all()
    context={
        'pro':pro,
        'cat':cat,
        'alma':alma,
        'inv':inv,
        'fam':fam,
        'men':men,
        'prov':prov,

    }

    return render(request,"productos.html",context)


def agregarproductos(request):
    try:  
        pass         
        if request.method=='POST':
     

            id_producto=request.POST.get("id_producto")
            nombre_producto=request.POST.get("nombre_producto")
            id_categoria=request.POST.get("id_categoria")
            almacen_id=request.POST.get("almacen_id")
            familia_id=request.POST.get("familia_id")
            menu_id=request.POST.get("menu_id")
            provedor_id=request.POST.get("provedor_id")            
            precio_producto=request.POST.get("precio_producto") 


            productostabla.objects.create(
            id_producto=id_producto,
            nombre_producto=nombre_producto,
            id_categoria=id_categoria,
            almacen_id=almacen_id,
            familia_id=familia_id,
            menu_id=menu_id,
            provedor_id=provedor_id,
            precio_producto=precio_producto,


            )
            historico = historico_producto(
            nombre_producto=nombre_producto,
            precio_producto=precio_producto,
            fecha_inicio=datetime.now() # Establecer la fecha_inicio al momento de crear el registro
                
                )
            historico.save()
            messages.success(request, 'Registro Agregado con Exito')

            return redirect('productos')

    except IntegrityError:    
        messages.error(request, 'Error: ya existe un registro con esa clave')

    return redirect('productos')




def editarproducto(request,id):
    pro=productostabla.objects.get(id_producto=id)
    his =  historico_producto.objects.filter(nombre_producto=pro.nombre_producto, fecha_final=None).first()


    id_producto=request.POST.get('id_producto')
    nombre_producto=request.POST.get('nombre_producto')
    id_categoria=request.POST.get('id_categoria')
    almacen_id=request.POST.get('almacen_id')
    familia_id=request.POST.get('familia_id')
    menu_id=request.POST.get('menu_id')
    provedor_id=request.POST.get('provedor_id')

    precio_producto=request.POST.get("precio_producto") 

    if his:
        his.fecha_final = datetime.now()
        his.save()
    
    pro.precio_producto=precio_producto

    pro.id_producto=id_producto
    pro.nombre_producto=nombre_producto
    pro.id_categoria=id_categoria
    pro.almacen_id=almacen_id
    pro.familia_id=familia_id
    pro.menu_id=menu_id
    pro.provedor_id=provedor_id

    pro.save()


    historico = historico_producto(
        nombre_producto=nombre_producto,
        precio_producto=precio_producto,
        fecha_inicio=datetime.now(),
        fecha_final=None
    )
    historico.save()

    messages.success(request, 'Registro Modificado con Exito')
    return redirect('productos')


def eliminarproducto(request,id):
    pro=productostabla.objects.get(id_producto=id)
    pro.delete()

    messages.success(request, 'Registro Eliminado con Exito')

    return redirect('productos')



#FIN DE LA VISTA DE PRODUCTOS

#vista de pedidos


def pedidos(request):
    est=estado_pedido.objects.all()

    user=insertuser.objects.all()
    ped=pedidostabla.objects.all()
    men=menutabla.objects.all()
    cli=cliente_tabla.objects.all()
    context={
        'ped':ped,
        'est':est,

        'user':user,
        'men':men,
        'cli':cli,
    }

    return render(request, 'pedidos.html',context)

def obtener_dni_cliente(request):
    nombre_cliente = request.GET.get('nombre_cliente', None)
    if nombre_cliente is not None:
        cliente = cliente_tabla.objects.get(nombre=nombre_cliente)
        return JsonResponse({"dni": cliente.dni})
    else:
        return JsonResponse({"dni": ""})

def agregarpedido(request):
    try:
        if request.method == 'POST':
            id_pedido = request.POST.get("id_pedido")
            nombre_cliente = request.POST.get("nombre_cliente")
            nombre_menu = request.POST.get("nombre_menu_hidden")
            cantidades = request.POST.get("cantidades_hidden")

            nombres = [nombre.strip() for nombre in nombre_menu.split(',')]
            cantidades_list = [cantidad.strip() for cantidad in cantidades.split(',')]

            # Crear una lista de cadenas de nombre y cantidad
            nombre_cantidad = [f"{cantidad}x{nombre}" for nombre, cantidad in zip(nombres, cantidades_list)]

            # Convertir la lista de cadenas en una sola cadena separada por comas y espacios
            nombre_cantidad_str = "\n".join(nombre_cantidad)

            dni_cliente= request.POST.get("dni_cliente")

            estado_pedido = request.POST.get("estado_pedido")
            
            # Obtener los tamaños seleccionados
            tamanos = request.POST.getlist("tamaño_menu[]")

            # Crear una cadena de tamaños separada por comas
            tamanos_str = "\n".join(tamanos)

            # Crear un nuevo registro en la base de datos
            pedidostabla.objects.create(
                id_pedido=id_pedido,
                nombre_cliente=nombre_cliente,
                nombre_menu=nombre_cantidad_str,
                cantidades=cantidades,
                tamaño_menu=tamanos_str,
                estado_pedido=estado_pedido,
                dni_cliente=dni_cliente,
            )

            messages.success(request, 'Registro Agregado con Exito')
            return redirect('pedidos')

    except IntegrityError:
        messages.error(request, 'Error: ya existe un registro con esa clave')

    return redirect('pedidos')




"""def agregarpedido(request):
    try:  
        pass         
        if request.method=='POST':
     

            id_pedido=request.POST.get("id_pedido")
            nombre_cliente=request.POST.get("nombre_cliente")
            nombre_menu=request.POST.getlist("nombre_menu[]")  # Obtener la lista de opciones seleccionadas
            cantidades=request.POST.get("cantidades")
            tamaño_menu=request.POST.get("tamaño_menu")
            estado_pedido=request.POST.get("estado_pedido")

                       # convierte la lista en una cadena separada por comas
            nombre_menu_str =  ', '.join(nombre_menu)



            pedidostabla.objects.create(
            id_pedido=id_pedido,
            nombre_cliente=nombre_cliente,
            nombre_menu=nombre_menu_str,
            cantidades=cantidades,
            tamaño_menu=tamaño_menu,
            estado_pedido=estado_pedido,




            )
            messages.success(request, 'Registro Agregado con Exito')

            return redirect('pedidos')

    except IntegrityError:    
        messages.error(request, 'Error: ya existe un registro con esa clave')

    return redirect('pedidos')"""

def editarpedido(request,id):
    ped=pedidostabla.objects.get(id_pedido=id)
    

    id_pedido=request.POST.get('id_pedido')
    nombre_cliente=request.POST.get('nombre_cliente')
    nombre_menu=request.POST.get('nombre_menu')
    cantidades=request.POST.get("cantidades")
    tamaño_menu=request.POST.get("tamaño_menu")
    estado_pedido=request.POST.get("estado_pedido")
    dni_cliente= request.POST.get("dni_cliente")

    ped.tamaño_menu=tamaño_menu
    ped.estado_pedido=estado_pedido

    ped.cantidades=cantidades

    ped.id_pedido=id_pedido
    ped.nombre_cliente=nombre_cliente
    ped.nombre_menu=nombre_menu
    ped.dni_cliente=dni_cliente

    ped.save()

    messages.success(request, 'Registro Modificado con Exito')
    return redirect('pedidos')


def eliminarpedido(request,id):
    ped=pedidostabla.objects.get(id_pedido=id)
    ped.delete()
    messages.success(request, 'Registro Eliminado con Exito')
    return redirect('pedidos')
#fin de la vista de pedidos



#VISTA DE FACTURACION

def facturaciontabla(request):
    fact=factura_tabla.objects.all()
    men=menutabla.objects.all()
    user=insertuser.objects.all()
    ped=pedidostabla.objects.all()
    meto=metodo_pago_tabla.objects.all()
    sar=sar_tabla.objects.all()
    imp=impuesto_tabla.objects.all()
    des=descuento_tabla.objects.all()
    context={
        'fact':fact,
        'men':men,
        'ped':ped,
        'user':user,
        'meto':meto,
        'sar':sar,
        'imp':imp,
        'des':des,
    }
    return render(request,"facturacion.html",context)

#fIN DE LA VISTA FACTURACION
from django.views.decorators.csrf import csrf_exempt

def obtener_detalles_pedido(request):
    
    cliente_id = request.GET.get('cliente_id', '')
    
    if cliente_id:
        # Obtener el último pedido del cliente seleccionado
        pedido = get_object_or_404(pedidostabla, nombre_cliente=cliente_id)

            # Obtener el objeto cliente correspondiente al pedido




        # Obtener el precio de cada elemento del pedido y su impuesto individual
        elementos_pedido = pedido.nombre_menu.split('\n')
        cantidades = []
        precios = []
        impuestos_individuales = []
        for elemento in elementos_pedido:
            cantidad, nombre_menu = elemento.split('x')
            cantidad = int(cantidad.strip('()'))
            menu = menutabla.objects.get(nombre_menu=nombre_menu)
            cantidades.append(cantidad)
            precios.append(float(menu.precio_menu))
            impuestos_individuales.append(float(menu.impuesto))

        # Calcular el precio total y el impuesto acumulado total
        precio_total = sum([cantidad * precio for cantidad, precio in zip(cantidades, precios)])
        impuesto_acumulado_total = round(sum([cantidad * precio * impuesto for cantidad, precio, impuesto in zip(cantidades, precios, impuestos_individuales)]), 2)
        total_a_pagar = precio_total + impuesto_acumulado_total

        # Crear un diccionario con los detalles del pedido
        detalles_pedido = {
            'menu_nombre': pedido.nombre_menu,
            'cantidades': pedido.cantidades,
            'tamaño_menu': pedido.tamaño_menu,
            'estado_pedido': pedido.estado_pedido,
            'fecha': pedido.fecha_pedido.strftime('%Y-%m-%d'),
            'total_a_pagar': total_a_pagar,
            'impuesto_acumulado': impuesto_acumulado_total,
            'dni_cliente':pedido.dni_cliente,
      
        }
        
        return JsonResponse(detalles_pedido)
    
    # Si no se proporcionó el parámetro `cliente_id`, devolver una respuesta vacía
    return JsonResponse({})

    
@csrf_exempt
def obtener_detalles_menu(request):
    menu_nombre = request.GET.get('menu', None)
    menu = get_object_or_404(menutabla, nombre_menu=menu_nombre)
    precio = menu.precio_menu
    return JsonResponse({'precio': str(precio)})

def obtener_precio_menu(menu_nombre):
    menu = get_object_or_404(menutabla, nombre_menu=menu_nombre)
    precio = menu.precio_menu
    return precio

def obtener_precio_total_menu(menu_nombre, cantidad_str):
    # Obtener el precio unitario del menú
    menu = get_object_or_404(menutabla, nombre_menu=menu_nombre)
    precio_unitario = menu.precio_menu

    # Extraer la cantidad del menú como un entero
    cantidad_str = cantidad_str.strip('()')
    cantidad_float = float(cantidad_str)
    cantidad_formateada = f'({cantidad_float:.0f})'


    # Calcular el precio total del menú
    precio_total = float(precio_unitario) * float(cantidad_float)


    return precio_total






from reportlab.pdfgen import canvas
from reportlab.lib.pagesizes import letter, A4
from django.http import HttpResponse
from reportlab.lib.styles import getSampleStyleSheet
from reportlab.lib.units import inch
from io import BytesIO
from reportlab.pdfgen import canvas
from reportlab.lib.pagesizes import letter, landscape
import re
from reportlab.pdfbase.ttfonts import TTFont
from reportlab.pdfbase import pdfmetrics
import os
from reportlab.lib.fonts import addMapping

def factura_pdf(request, id):
    # Obtener los datos de la factura desde la base de datos
    factura = factura_tabla.objects.get(id_factura=id)

    # Crear el objeto HttpResponse con el tipo de contenido PDF
    response = HttpResponse(content_type='application/pdf')
    
    # Establecer el nombre del archivo PDF
    response['Content-Disposition'] = 'attachment; filename="factura.pdf"'
    
    # Crear el objeto canvas para generar el PDF
    pdf_canvas = canvas.Canvas(response, pagesize=A4)
    
    # Definir el estilo de texto para el PDF
    style = getSampleStyleSheet()['Normal']

    # Obtener la ruta absoluta del archivo de fuente
    font_path = "C:/Users/USER/Downloads/Arial Unicode MS Font.ttf"

    # Registrar la fuente DejaVu Sans en ReportLab
    # Registrar la fuente
    pdfmetrics.registerFont(TTFont('Arial Unicode MS Font', font_path))
    # Mapear la fuente Arial Unicode MS a las fuentes predeterminadas
    addMapping('Arial Unicode MS Font', 0, 0, 'Arial Unicode MS Font')

        # Agregar el logo
    logo_path = "C:/Users/USER/Desktop/restaurant/restaurantwebsite/static/images/pizzawavelogo500.jpg"
    pdf_canvas.drawImage(logo_path,2.9*inch, 9.9*inch , width=130, height=130)
            
    # Agregar encabezado
    pdf_canvas.setFont("Arial Unicode MS Font", 11)
    pdf_canvas.drawCentredString(3.8*inch, 11.5*inch, "Pizza Wave")

    pdf_canvas.drawCentredString(3.8*inch, 9.6 * inch, "TEGUCIGALPA, FRANCISCO MORAZAN COL MIRAFLORES SUR")

    pdf_canvas.drawCentredString(3.9*inch, 9.3 * inch, " BOULEVARD SANTA CRISTINA, CALLE HUMUYA BLOQUE 3 FRENTE DE LA UJCV")


    pdf_canvas.drawCentredString(3.8*inch, 10*inch, "FACTURA")
    pdf_canvas.drawCentredString(3.8*inch, 9.8*inch, "RTN: 0801901919170521")


    pdf_canvas.drawString(4.8*inch, 9 * inch, 'Numero de Factura: {}'.format(factura.numero_factura))


    pdf_canvas.line(inch, 8.8 * inch, 7.5*inch, 8.8 * inch)
    


    # Escribir los datos de la factura en el PDF
    pdf_canvas.drawString(inch, 8.5 * inch, 'Codigo CAI: {}'.format(factura.codigo_cai))
    pdf_canvas.drawString(inch, 9 * inch, 'Nombre del Encargado: {}'.format(factura.nombre_encargado))
    pdf_canvas.drawString(3.1*inch, 9 * inch, ' {}'.format(factura.apellido_encargado))
    pdf_canvas.drawString(inch, 8 * inch, 'Numero Inicial: {}'.format(factura.numero_inicial))
    pdf_canvas.drawString(3.8*inch, 8 * inch, 'Numero Final: {}'.format(factura.numero_final))


    pdf_canvas.drawString(inch, 7.5 * inch, 'Fecha Inicial: {}'.format(factura.fecha_emision))
    pdf_canvas.drawString(3.8*inch, 7.5 * inch, 'Fecha Final: {}'.format(factura.fecha_final))

    pdf_canvas.drawString(inch, 7 * inch, 'Correo: Administrador@PizzaWavehn.com')
    pdf_canvas.drawString(4.5*inch, 7 * inch, 'Numero: 8844-6955 8772-2631')

    pdf_canvas.line(inch, 6.8 * inch, 7.5*inch, 6.8 * inch)

    pdf_canvas.drawString(inch, 6.5 * inch, 'Nombre del Cliente: {}'.format(factura.nombre_cliente))
    
    pdf_canvas.drawString(4.7 * inch, 6.5 * inch, 'DNI del Cliente: {}'.format(factura.dni_cliente))

    # Convertir la cadena de menú y cantidades a una lista de cadenas codificadas en utf-8
    menu_cantidades_codificadas = [linea.encode('utf-8') for linea in factura.menu_cantidades.strip().splitlines()]

    # Decodificar cada cadena en la lista y guardar los resultados en una nueva lista de cadenas Unicode
    menu_cantidades_unicode = [cadena.decode('utf-8') for cadena in menu_cantidades_codificadas]

    # Separar las cantidades y los nombres del menú en listas diferentes
    cantidades = [linea.split('x')[0] for linea in menu_cantidades_unicode]
    nombres_menu = [linea.split('x')[1].strip() for linea in menu_cantidades_unicode]


    # Obtener los precios de cada menú y guardarlos en una lista
    precios_menu = [obtener_precio_menu(nombre) for nombre in nombres_menu]

    # Obtener los precios totales de cada menú y guardarlos en una lista
    precios_totales_menu = [float(cantidad.strip('()')) * float(precio) for cantidad, precio in zip(cantidades, precios_menu)]




    # Escribir la cantidad, el nombre y el precio unitario de cada menú
    y_position = 4.5 * inch
    precio_total_factura = 0
    for cantidad, nombre, precio_unitario in zip(cantidades, nombres_menu, precios_menu):
        precio_total_menu = obtener_precio_total_menu(nombre, cantidad)

        pdf_canvas.drawString(inch, y_position, cantidad)
        pdf_canvas.drawString(3.8 * inch, y_position, nombre)
        precio_unitario = float(precio_unitario) # convert to float
        pdf_canvas.drawString(5.5*inch, y_position, '{:.2f}LPS'.format(precio_unitario))
        
        pdf_canvas.drawString(7 * inch, y_position, f'{precio_total_menu:.2f}LPS')
        precio_total_factura += precio_total_menu



        y_position -= 0.25 * inch

        # Escribir el total de la factura

    precio_total_factura_str = '{:.2f}LPS'.format(precio_total_factura)
    pdf_canvas.drawString(7 * inch, y_position, precio_total_factura_str)
    pdf_canvas.drawString(7 * inch, 4.7 * inch, 'SubTotal:')

    # Escribir el encabezado de cantidad
    pdf_canvas.drawString(inch, 4.7 * inch, 'Cantidad:')
    
    # Escribir el encabezado del nombre del menú
    pdf_canvas.drawString(3.8*inch, 4.7 * inch, 'Nombre del Menú:')

    # Escribir el encabezado del precio unitario
    pdf_canvas.drawString(5.5*inch, 4.7 * inch, 'Precio:')

    # Escribir el eTamaño del Menu
    pdf_canvas.drawString(1.8*inch,4.7 * inch, 'Tamaño del Menu:')
    # Convertir la cadena de tamaños de menú a una lista de cadenas codificadas en utf-8
    tamanos_codificados = [t.encode('utf-8') for t in factura.tamaño_menu.strip().split()]

    # Decodificar cada cadena en la lista y guardar los resultados en una nueva lista de cadenas Unicode
    tamanos_unicode = [t.decode('utf-8') for t in tamanos_codificados]

    # Escribir cada tamaño de menú en columnas
    y_position = 4.5 * inch
    for tamano in tamanos_unicode:
        pdf_canvas.drawString(1.8*inch, y_position, tamano)
        y_position -= 0.25 * inch



    pdf_canvas.drawString(inch, 5.7 * inch, 'Estado del Pedido: {}'.format(factura.estado_pedido))

    pdf_canvas.drawString(inch, 6.2 * inch, 'Fecha de Realizacion del Pedido: {}'.format(factura.fecha_realizacion_pedido))

    pdf_canvas.drawString(inch, 2.6 * inch, 'Descuentos:')
    pdf_canvas.drawString(6.8 * inch, 2.6 * inch, ' {}%'.format(float(factura.descuento)* 100))

    pdf_canvas.drawString(inch, 3.3 * inch, 'Impuesto:')
    pdf_canvas.drawString(6.8 * inch, 3.3 * inch,' {:,.2f}LPS'.format(float(factura.impuesto)))


    pdf_canvas.drawString(inch, 3 * inch, 'Monto Extra:')
    pdf_canvas.drawString(6.8 * inch, 3 * inch,' {:,.2f} LPS '.format(float(factura.isv)))


    

    pdf_canvas.drawString(inch, 5.4 * inch, 'Metodo de Pago: {}'.format(factura.metodo_pago))
    pdf_canvas.drawString(inch, 5.2 * inch, 'Numero de la Tarjeta: {}'.format(factura.numero_tarjeta))

    pdf_canvas.line(inch, 5 * inch, 7.5*inch, 5 * inch)


    pdf_canvas.drawString(inch, 1.9 * inch, 'Cantidad a Pagar:')
    pdf_canvas.drawString(6.8 * inch, 1.9 * inch, '{:,.2f} LPS'.format(float(factura.cantidad_pagar)))
    pdf_canvas.drawString(inch, 2.3 * inch, 'Total a Pagar:')
    pdf_canvas.drawString(6.8 * inch, 2.3 * inch, '{:,.2f} LPS'.format(float(factura.total_pagar)))
    pdf_canvas.drawString(inch, 1.5 * inch, 'Cambio:')
    pdf_canvas.drawString(6.8 * inch, 1.5 * inch, '{:,.2f} LPS'.format(float(factura.cambio)))


    pdf_canvas.drawCentredString(3.8*inch, 1*inch, "GRACIAS POR SU COMPRA")
    pdf_canvas.drawCentredString(3.8*inch, 0.8*inch, "RANGO AUTORIZADO")
    pdf_canvas.drawCentredString(3*inch, 0.5 * inch, '{}'.format(factura.numero_factura))
    pdf_canvas.drawCentredString(4.4*inch, 0.5 * inch, '/004-005-10-00500')

        # Definir el número total de páginas y la ubicación del número de página
    numero_pagina = 1
    total_paginas = 1
    x = 550
    y = 15

    # Generar contenido para cada página del PDF
    for i in range(total_paginas):
        # Agregar contenido a la página actual del PDF
        # Agregar número de página a la página actual del PDF
        pdf_canvas.drawString(x, y, f"Página {numero_pagina} de {total_paginas}")
        numero_pagina += 1
        # Si no es la última página, agregar una nueva página al PDF
        if i < total_paginas - 1:    
            pdf_canvas.showPage()

    # Finalizar el PDF y cerrar el objeto canvas
    pdf_canvas.showPage()
    pdf_canvas.save()
    
    # Devolver el objeto HttpResponse con el contenido PDF generado
    return response


from creditcard import CreditCard


def agregarfactura(request):
    try:  
        pass         
        if request.method=='POST':
            
            id_factura=request.POST.get("id_factura")
            codigo_cai=request.POST.get("codigo_cai")
            numero_factura=request.POST.get("numero_factura")
            nombre_encargado=request.POST.get("nombre_encargado")
            apellido_encargado=request.POST.get("apellido_encargado")
            correo_encargado=request.POST.get("correo_encargado")
            telefono_encargado=request.POST.get("telefono_encargado")
            nombre_cliente=request.POST.get("nombre_cliente")
            
            
            
            menu_cantidades=request.POST.get("menu_cantidades")


            # Separamos las líneas de texto
            menu_cantidades_list = menu_cantidades.splitlines()

            # Iteramos sobre cada línea
            for menu_cantidad in menu_cantidades_list:
                # Obtenemos el nombre del menú
                menu_nombre = menu_cantidad.split("x")[1].strip()

                # Obtenemos el inventario correspondiente al menú
                inventario = inventariotabla.objects.filter(menu_id=menu_nombre).first()

                if inventario:
                    # Restamos 1 a la cantidad actual del inventario
                    inventario.cantidad_actual = str(int(inventario.cantidad_actual) - 1)
                    inventario.save()


                    





            
            tamaño_menu=request.POST.get("tamaño_menu")
            estado_pedido = "Terminado"
            fecha_realizacion_pedido=request.POST.get("fecha_realizacion_pedido")
            descuento=request.POST.get("descuento")
            
            
            
            
            #Monto Acumulado de Mixto
            isv = float(request.POST.get("isv")) if request.POST.get("isv") else 0

            
            
            
            
            
            
            metodo_pago=request.POST.get("metodo_pago")
            impuesto=request.POST.get("impuesto")
            
            numero_tarjeta=request.POST.get("numero_tarjeta")



            # Enmascarar los números de la tarjeta excepto los últimos 4 dígitos
            mascara = "*" * 12
            numero_enmascarado = mascara + numero_tarjeta[-4:]

            cantidad_pagar=request.POST.get("cantidad_pagar")
            total_pagar=request.POST.get("total_pagar")
            cambio=request.POST.get("cambio")

            dni_cliente= request.POST.get("dni_cliente")    
            # Obtener el último valor de consecutivo en la tabla de SAR
            sar = sar_tabla.objects.first()
            if sar is not None:
                consecutivo_actual = int(sar.consecutivo)
                
                # actualizar el valor del consecutivo en la tabla sar_tabla
                sar.consecutivo = str(consecutivo_actual + 1)
                sar.save()
                
                # generar el número de factura con el valor actual del consecutivo
                numero_factura = f'004-005-10-{consecutivo_actual+1:05}'

            fecha_emision=request.POST.get("fecha_emision")
            fecha_final=request.POST.get("fecha_final")
            numero_inicial=request.POST.get("numero_inicial")
            numero_final=request.POST.get("numero_final")


            pedido = pedidostabla.objects.filter(nombre_cliente=nombre_cliente).latest('fecha_pedido')

            pedido.estado_pedido="Terminado"
            pedido.save()








            factura_tabla.objects.create(
            id_factura=id_factura,
            codigo_cai=codigo_cai,
            numero_factura=numero_factura,
            nombre_encargado=nombre_encargado,
            apellido_encargado=apellido_encargado,
            correo_encargado=correo_encargado,
            telefono_encargado=telefono_encargado,
            nombre_cliente=nombre_cliente,
            menu_cantidades=menu_cantidades,
            tamaño_menu=tamaño_menu,
            estado_pedido=estado_pedido,
            fecha_realizacion_pedido=fecha_realizacion_pedido,
            descuento=descuento,
            isv=isv,
            metodo_pago=metodo_pago,

            numero_tarjeta=numero_enmascarado,

            cantidad_pagar=cantidad_pagar,
            total_pagar=total_pagar,
            cambio=cambio,

            fecha_emision=fecha_emision,
            fecha_final=fecha_final,
            numero_inicial=numero_inicial,
            numero_final=numero_final,
            dni_cliente=dni_cliente,
            impuesto=impuesto,
            )
            messages.success(request, 'Registro Agregado con Exito')


            return redirect('facturacion')

    except IntegrityError:    
        messages.error(request, 'Error: ya existe un registro con esa clave')

    return redirect('facturacion')





def eliminarfactura(request,id):
    fact=factura_tabla.objects.get(id_factura=id)
    fact.delete()
    messages.error(request, 'Registro Eliminado Con Exito!')

    return redirect('facturacion')


def obtener_datos_cai(request):
    if request.method == 'GET':
        cai_id = request.GET.get('cai_id', '')
        print(cai_id)

        if cai_id:
            # Obtener los datos del CAI seleccionado
            cai = get_object_or_404(sar_tabla, codigo_sar=cai_id)
            print(cai)

            # Crear un diccionario con los detalles del CAI
            detalles_cai = {
                'fecha_emision': cai.fecha_emision.strftime('%Y-%m-%d'),
                'fecha_final': cai.fecha_final.strftime('%Y-%m-%d'),
                'numero_inicial': cai.numero_inicial,
                'numero_final': cai.numero_final,
            }

            return JsonResponse(detalles_cai)

    return JsonResponse({})





def impuestostabla(request):
    imp=impuesto_tabla.objects.all()
    context={
        'imp':imp
    }
    return render(request,"impuesto.html",context)

def agregarimpuesto(request):
    try:
        if request.method == 'POST':
            id_impuesto = request.POST.get("id_impuesto")
            impuesto = request.POST.get("impuesto")
            impuesto_anterior = None  # Initialize to None
            try:
                # Buscar el registro anterior en impuesto_tabla
                impuesto_anterior = impuesto_tabla.objects.filter(
                    id_impuesto__lt=id_impuesto
                ).latest('fecha_inicio')

                # Actualizar la fecha final del registro anterior
                impuesto_anterior.fecha_final = timezone.now()
                impuesto_anterior.save()
            except impuesto_tabla.DoesNotExist:
                # No se encontró un registro anterior, no se actualiza nada
                pass

            # Crear un nuevo registro en impuesto_tabla con la fecha_inicio
            # del nuevo registro y fecha_final igual a fecha_inicio del registro anterior
            impuesto_tabla.objects.create(
                id_impuesto=id_impuesto,
                impuesto=impuesto,
                fecha_inicio=timezone.now(),
                fecha_final=None,  # La fecha final del registro reciente es None
            )


            messages.success(request, 'Registro Agregado con Exito')
            return redirect('impuestostabla')

    except IntegrityError:    
        messages.error(request, 'Error: ya existe un registro con esa clave')
    return redirect('impuestostabla')

def eliminarimpuesto(request,id):
    imp=impuesto_tabla.objects.get(id_impuesto=id)
    imp.delete()
    messages.success(request, 'Registro Eliminado con Exito')
    return redirect('impuestostabla')


def editarimpuesto(request,id):
    imp=impuesto_tabla.objects.get(id_impuesto=id)
    id_impuesto=request.POST.get('id_impuesto')
    impuesto=request.POST.get('impuesto')
    imp.id_impuesto=id_impuesto
    imp.impuesto=impuesto
    imp.save()

    messages.success(request, 'Registro Modificado con Exito')
    return redirect('impuestostabla')

#DESCUENTO TABLA
def descuentotabla(request):
    des=descuento_tabla.objects.all()
    context={
        'des':des,
    }
    return render(request,"descuento.html",context)

def agregardescuento(request):
    try:
        if request.method == 'POST':
            id_descuento = request.POST.get("id_descuento")
            descuento = request.POST.get("descuento")
            descuento_anterior = None  # Initialize to None
            try:
                # Buscar el registro anterior en descuento_tabla
                descuento_anterior = descuento_tabla.objects.filter(
                    id_descuento__lt=id_descuento
                ).latest('fecha_inicio')

                # Actualizar la fecha final del registro anterior
                descuento_anterior.fecha_final = timezone.now()
                descuento_anterior.save()
            except descuento_tabla.DoesNotExist:
                # No se encontró un registro anterior, no se actualiza nada
                pass

            # Crear un nuevo registro en descuento_tabla con la fecha_inicio
            # del nuevo registro y fecha_final igual a fecha_inicio del registro anterior
            descuento_tabla.objects.create(
                id_descuento=id_descuento,
                descuento=descuento,
                fecha_inicio=timezone.now(),
                fecha_final=None,  # La fecha final del registro reciente es None
            )

            # Actualizar la fecha final del último registro si su fecha final es None
            ultimo_descuento = descuento_tabla.objects.filter(
                fecha_final=None
            ).exclude(
                id_descuento=id_descuento
            ).last()
            if ultimo_descuento:
                ultimo_descuento.fecha_final = timezone.now()
                ultimo_descuento.save()

            messages.success(request, 'Registro Agregado con Exito')
            return redirect('descuentotabla')

    except IntegrityError:    
        messages.error(request, 'Error: ya existe un registro con esa clave')
    return redirect('descuentotabla')

def editardescuento(request,id):
    des=descuento_tabla.objects.get(id_descuento=id)
    id_descuento=request.POST.get('id_descuento')
    descuento=request.POST.get('descuento')
    des.id_descuento=id_descuento
    des.descuento=descuento
    des.save()

    messages.success(request, 'Registro Modificado con exito con Exito')
    return redirect('descuentotabla')


def eliminardescuento(request,id):
    des=descuento_tabla.objects.get(id_descuento=id)
    des.delete()
    messages.success(request, 'Registro eliminado con exito con Exito')
    return redirect('descuentotabla')

#CLientes

def clientetabla(request):
    cli=cliente_tabla.objects.all()
    context={
        'cli':cli
    }

    return render(request,"cliente.html",context)


def agregarcliente(request):
    try:  
        pass         
        if request.method=='POST':
     

            id_cliente=request.POST.get("id_cliente")
            nombre=request.POST.get("nombre")
            apellido=request.POST.get("apellido")
            dni=request.POST.get("dni")

       
            



            cliente_tabla.objects.create(
            id_cliente=id_cliente,
            nombre=nombre,
            apellido=apellido,
            dni=dni,




            )
            messages.success(request, 'Registro Agregado con Exito')

            return redirect('clientetabla')

    except IntegrityError:    
        messages.error(request, 'Error: ya existe un registro con esa clave')



    return redirect('clientetabla')


def editarcliente(request,id):
    cli=cliente_tabla.objects.get(id_cliente=id)
    id_cliente=request.POST.get('id_cliente')
    nombre=request.POST.get('nombre')
    apellido=request.POST.get('apellido')
    dni=request.POST.get('dni')

    cli.id_cliente=id_cliente
    cli.nombre=nombre
    cli.apellido=apellido
    cli.dni=dni

    cli.save()

    messages.success(request, 'Registro Modificado con exito con Exito')
    return redirect('clientetabla')



def eliminarcliente(request,id):
    cli=cliente_tabla.objects.get(id_cliente=id)
    cli.delete()
    messages.success(request, 'Registro Eliminado con Exito')
    return redirect('clientetabla')
