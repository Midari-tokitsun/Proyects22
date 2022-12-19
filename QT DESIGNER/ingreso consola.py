from producto import producto


pregunta = 1
while pregunta== 1:
    codigo= float(input("ingrese el codigo: "))
    descripcion= input("ingrese la descripcion: ")
    precio = float(input("ingrese el precio: "))
    unidad= input("ingrese la unidad: ")
    pregunta= input("desea meter otro producto Si=1 NO=0: ") 
    p1= producto()
    p1.guardar([codigo,descripcion,precio,unidad])