.data
############################### espacio para el nombre del archivo de entrada no encriptado##########################
mensaje_ruta: .asciiz "Introduce la Ruta Hacia el Archivo:"
myFile: .space 1024    
       
base64_table: .asciiz "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
espacio: .asciiz "="            
#########################################################################################################################
############################### espacio para la creacion del archivo encriptado .txt##########################
nombre_final_archivo: .space 132 
extension: .asciiz ".txt"
#######################################################################################################################
newline: .asciiz "\n"
nombre_archivo_encriptado: .asciiz "El archivo se almaceno con nombre codificado:"
las_lineas_del_archivo: .asciiz "las 5 lineas del archivo de texto:"

buffer: .space 1048576

#######################################################################################################################
################ espacio para el nombre del archivo de salida encriptado##############################################
encoded: .space 1398101     
#######################################################################################################################
.text
    # Imprimir mensaje para pedir la ruta del archivo
    li $v0, 4                   # Código del servicio para imprimir cadena
    la $a0, mensaje_ruta        # Dirección de la cadena a imprimir
    syscall                     # Llamada al sistema para imprimir
    
    # Leer la ruta del archivo desde la entrada del usuario
    li $v0, 8                   # Código del servicio para leer string
    la $a0, myFile              # C:\Users\Usuario2024\Desktop\MARS4.5 ejercicios\holaoriginal.txt
    li $a1, 1024                # Tamaño máximo del buffer
    syscall                     # Llamada al sistema para leer el string
    
    # Eliminar el carácter de nueva línea al final del string si existe
    la $t0, myFile            # Dirección del buffer donde se almacenó el nombre
    li $t1, 0                 # Índice inicial

 

Lectura_Loop:
    lb   $t2, 0($t0)            # Cargar el siguiente byte del buffer
    beq  $t2, 0, siguiente_linea     # Si es el fin del string, terminar
    addi $t1, $t1, 1            # Incrementar el índice
    addi $t0, $t0, 1            # Avanzar al siguiente byte
    j    Lectura_Loop         # Repetir el ciclo

siguiente_linea:
    subi $t0, $t0, 1            # Retroceder un byte
    lb   $t2, 0($t0)            # Cargar el último byte del buffer
    li   $t3, 10                # Carácter de nueva línea (ASCII 10)
    bne  $t2, $t3, terminar_loop    # Si no es nueva línea, saltar
    sb   $zero, 0($t0)          # Si es nueva línea, reemplazar con NULL

terminar_loop:
     jal encriptar_archivo_final
    # Abrir el archivo para lectura
    li   $v0, 13                # Código del servicio para abrir archivo
    la   $a0, myFile            # Nombre del archivo de entrada
    li   $a1, 0                 # Bandera para lectura
    li   $a2, 0                 # Modo es ignorado
    syscall                     # Abrir archivo
    move $s0, $v0               # Guardar descriptor de archivo

    # Leer desde el archivo recién abierto
    li   $v0, 14                # Código del servicio para leer desde archivo
    move $a0, $s0               # Descriptor de archivo
    la   $a1, buffer            # Dirección del buffer desde el cual leer
    li   $a2, 1048576              # Longitud del buffer
    syscall                     # Leer desde archivo
    move $s1, $v0               # Guardar el número de bytes leídos

    # Cerrar el archivo de entrada
    li   $v0, 16          # llamada del sistema para cerrar archivo
    move $a0, $s0         # descriptor de archivo a cerrar
    syscall               # cerrar archivo


    li $v0, 4                   # Código del servicio para imprimir cadena
    la $a0, las_lineas_del_archivo       # Dirección de la cadena a imprimir
    syscall                     # Llamada al sistema para imprimir
    
      li $v0, 4                   # Código del servicio para imprimir cadena
    la $a0, newline        # Dirección de la cadena a imprimir
    syscall 
    
    
       li $t4, 0                   # Contador de líneas
    la $t5, buffer              # Dirección del buffer
    li $t6, 0                   # Índice en el buffer

imprimir_lineas:
    beq $t4, 5, fin_imprimir    # Si se han impreso 5 líneas, terminar
    lb  $t7, 0($t5)             # Leer byte del buffer
    beq $t7, 0, fin_imprimir    # Si es el fin del buffer, terminar
    li  $v0, 11                 # Código del servicio para imprimir carácter
    move $a0, $t7               # Carácter a imprimir
    syscall                     # Llamada al sistema para imprimir
    beq $t7, 10, nueva_linea    # Si es nueva línea, incrementar contador
    addi $t5, $t5, 1            # Avanzar al siguiente byte
    j imprimir_lineas           # Repetir el ciclo

nueva_linea:
    addi $t4, $t4, 1            # Incrementar contador de líneas
    addi $t5, $t5, 1            # Avanzar al siguiente byte
    j imprimir_lineas           # Repetir el ciclo

fin_imprimir:


    li $v0, 4                   # Código del servicio para imprimir cadena
    la $a0, newline        # Dirección de la cadena a imprimir
    syscall    
#################################################################################################################

#########################################################################################################################    
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################

    la $t0, buffer     # Puntero al buffer de entrada
    la $t1, encoded    # Puntero al buffer de salida
    move $t2, $s1      # Longitud del buffer de entrada (número de bytes leídos)
    li $t3, 0          # Contador de bytes procesados
encode_to_base64:
    # Verificar si quedan bytes por procesar
    bge $t3, $t2, terminado

    # Leer 3 bytes del buffer de entrada, manejar padding si es necesario
    lb $t4, 0($t0)
    addi $t3, $t3, 1
    beq $t3, $t2, last_byte
    lb $t5, 1($t0)
    addi $t3, $t3, 1
    beq $t3, $t2, two_bytes
    lb $t6, 2($t0)
    addi $t3, $t3, 1
    j encode_bytes

last_byte:
    li $t5, 0
    li $t6, 0
    j encode_bytes

two_bytes:
    li $t6, 0

encode_bytes:
    # Primer byte: bits 7-2
    andi $t7, $t4, 0xFC
    srl $t7, $t7, 2

    # Primer byte: bits 1-0
    andi $t8, $t4, 0x03
    sll $t8, $t8, 4
    andi $t9, $t5, 0xF0
    srl $t9, $t9, 4
    or $t8, $t8, $t9

    # Segundo byte: bits 7-4
    andi $t9, $t5, 0x0F
    sll $t9, $t9, 2
    andi $s0, $t6, 0xC0
    srl $s0, $s0, 6
    or $t9, $t9, $s0

    # Tercer byte: bits 5-0
    andi $s0, $t6, 0x3F

    # Obtener los caracteres Base64 correspondientes
    la $s1, base64_table
    addu $t7, $s1, $t7
    lb $t7, 0($t7)

    addu $t8, $s1, $t8
    lb $t8, 0($t8)

    addu $t9, $s1, $t9
    lb $t9, 0($t9)

    addu $s0, $s1, $s0
    lb $s0, 0($s0)

    # Almacenar los caracteres Base64 en el buffer de salida
    sb $t7, 0($t1)
    sb $t8, 1($t1)
    sb $t9, 2($t1)
    sb $s0, 3($t1)

    # Avanzar los punteros
    addi $t0, $t0, 3
    addi $t1, $t1, 4

    # Verificar si es el último byte procesado para agregar rellenador
    bge $t3, $t2, check_rellenador

    # Volver a la codificación del siguiente bloque
    j encode_to_base64

check_rellenador:
    # Calcular el número de bytes restantes en el bloque final
    rem $t5, $t3, 3

    # Añadir padding '=' si es necesario
    li $t6, '='
    beq $t5, 1, agrega_dos_rellenador
    beq $t5, 2, agrega_uno_rellenador
    j terminado

agrega_dos_rellenador:
    sb $t6, -2($t1)    # Añadir rellenador '=' en la penúltima posición
    sb $t6, -1($t1)    # Añadir rellenador '=' en la última posición
    j terminado

agrega_uno_rellenador:
    sb $t6, -1($t1)    # Añadir rellenador '=' en la última posición

terminado:
    # cargar los bytes en el registro zero
    sb $zero, 0($t1)

#########################################################################################################################    
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################

    # Abrir archivo para escritura (si no existe, lo crea)
    li   $v0, 13          # llamada del sistema para abrir archivo
    la   $a0, nombre_final_archivo        # usar el nombre encriptado del archivo de salida
    li   $a1, 1           # bandera para escritura
    li   $a2, 0           # modo es ignorado
    syscall               # abrir archivo
    move $s6, $v0         # guardar descriptor de archivo

    # Escribir el contenido codificado en Base64 en el archivo de salida
    li   $v0, 15          # llamada del sistema para escribir en archivo
    move $a0, $s6         # descriptor de archivo
    la   $a1, encoded     # dirección del buffer codificado
    sub  $a2, $t1, $a1    # longitud de los datos codificados
    syscall               # escribir en archivo

    # Cerrar el archivo de salida
    li   $v0, 16          # llamada del sistema para cerrar archivo
    move $a0, $s6         # descriptor de archivo a cerrar
    syscall               # cerrar archivo
    
    li $v0, 4            
    la $a0, nombre_archivo_encriptado            
    syscall 
    
    li $v0, 4                   # Código del servicio para imprimir cadena
    la $a0, newline        # Dirección de la cadena a imprimir
    syscall  
    
    # Imprimir el nombre encriptado del archivo de salida
    li $v0, 4            
    la $a0, nombre_final_archivo            
    syscall  

    # Salir del programa
    li $v0, 10                  # Código del servicio para salir del programa
    syscall  
             
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
encriptar_archivo_final:
    la   $t0, base64_table   # Dirección de la tabla Base64
    la   $t1, myFile         # Dirección del nombre del archivo original
    la   $t2, nombre_final_archivo          # Dirección del buffer para el nombre encriptado
    li   $t3, 130            # Índice del buffer de salida

codificar_archivo_final_loop:
    lb   $t4, 0($t1)         # Cargar el siguiente byte del nombre del archivo original
    beq  $t4, 0, agregar_extension # Si hemos alcanzado el fin del string, saltar a la extensión

    srl  $t5, $t4, 2         # Primer carácter Base64
    add  $t6, $t5, $t0       # Sumar la base de la tabla
    lb   $t7, 0($t6)         # Cargar el carácter correspondiente de la tabla Base64
    sb   $t7, 0($t2)         # Guardar en el buffer de salida
    addi $t2, $t2, 1         # Incrementar el índice del buffer de salida

    andi $t5, $t4, 0x03      # Tomar los últimos 2 bits
    sll  $t5, $t5, 4         # Desplazar 4 bits a la izquierda

    lb   $t4, 1($t1)         # Cargar el siguiente byte del nombre del archivo original
    beq  $t4, 0, rellenar_espacio # Si es el fin, agregar relleno

    srl  $t6, $t4, 4         # Segundo carácter Base64
    or   $t5, $t5, $t6       # Combinar los bits
    add  $t6, $t5, $t0       # Sumar la base de la tabla
    lb   $t7, 0($t6)         # Cargar el carácter correspondiente de la tabla Base64
    sb   $t7, 0($t2)         # Guardar en el buffer de salida
    addi $t2, $t2, 1         # Incrementar el índice del buffer de salida

    andi $t5, $t4, 0x0F      # Tomar los últimos 4 bits
    sll  $t5, $t5, 2         # Desplazar 2 bits a la izquierda

    lb   $t4, 2($t1)         # Cargar el siguiente byte del nombre del archivo original
    beq  $t4, 0, rellenar_espacio # Si es el fin, agregar relleno

    srl  $t6, $t4, 6         # Tercer carácter Base64
    or   $t5, $t5, $t6       # Combinar los bits
    add  $t6, $t5, $t0       # Sumar la base de la tabla
    lb   $t7, 0($t6)         # Cargar el carácter correspondiente de la tabla Base64
    sb   $t7, 0($t2)         # Guardar en el buffer de salida
    addi $t2, $t2, 1         # Incrementar el índice del buffer de salida

    andi $t5, $t4, 0x3F      # Cuarto carácter Base64
    add  $t6, $t5, $t0       # Sumar la base de la tabla
    lb   $t7, 0($t6)         # Cargar el carácter correspondiente de la tabla Base64
    sb   $t7, 0($t2)         # Guardar en el buffer de salida
    addi $t2, $t2, 1         # Incrementar el índice del buffer de salida

    addi $t1, $t1, 3         # Avanzar al siguiente grupo de 3 bytes
    j    codificar_archivo_final_loop         # Repetir el ciclo

rellenar_espacio:
    sll  $t5, $t5, 4         # Desplazar los bits restantes
    add  $t6, $t5, $t0       # Sumar la base de la tabla
    lb   $t7, 0($t6)         # Cargar el carácter correspondiente de la tabla Base64
    sb   $t7, 0($t2)         # Guardar en el buffer de salida
    addi $t2, $t2, 1         # Incrementar el índice del buffer de salida

    la   $t9, espacio        # Cargar la dirección del carácter de relleno '='
    lb   $t7, 0($t9)         # Cargar el carácter de relleno '='
    sb   $t7, 0($t2)         # Guardar en el buffer de salida
    addi $t2, $t2, 1         # Incrementar el índice del buffer de salida
    sb   $t7, 0($t2)         # Guardar en el buffer de salida
    addi $t2, $t2, 1         # Incrementar el índice del buffer de salida

    j    agregar_extension       # Saltar a agregar la extensión

#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
agregar_extension:
    # Agregar la extensión .txt
    la   $t7, extension      # Cargar la dirección de la extensión ".txt"

extension_loop:
    lb   $t9, 0($t7)         # Cargar el siguiente byte de la extensión
    beq  $t9, 0, extension_fin   # Si es el fin de la cadena, terminar

    sb   $t9, 0($t2)         # Guardar el byte en el buffer de salida
    addi $t2, $t2, 1         # Incrementar el índice del buffer de salida
    addi $t7, $t7, 1         # Avanzar al siguiente byte de la extensión

    j    extension_loop # Repetir el ciclo

extension_fin:
    sb   $zero, 0($t2)       # poner los bytes de t2 a zero

    jr   $ra                 # Retornar

#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
        # Imprimir el DEAPURACION
        li   $v0, 4            # Código del servicio para imprimir cadena
        la   $a0, extension         # Dirección de la extension
        syscall


#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
       # Terminar el programa
       li $v0, 10            
       syscall              

#########################################################################################################################
#########################################################################################################################
#########################################################################################################################

