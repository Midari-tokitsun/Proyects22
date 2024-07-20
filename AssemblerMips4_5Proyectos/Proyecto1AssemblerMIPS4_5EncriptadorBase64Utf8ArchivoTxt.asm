.data
############################### espacio para el nombre del archivo de entrada no encriptado##########################
mensaje_ruta: .asciiz "Introduce la Ruta Hacia el Archivo:"
myFile: .space 1024    
       
base64_table: .asciiz "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
espacio: .asciiz "="            
#########################################################################################################################
############################### espacio para la creacion del archivo encriptado .txt##########################
nombre_final_archivo: .space 232 
cifrado_ext: .asciiz "_cifrado.txt"

#######################################################################################################################
newline: .asciiz "\n"
nombre_archivo_encriptado: .asciiz "El archivo se almaceno con el sufijo _cifrado:"
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
    
    # Inicializar las variables de lectura para leer la ruta del archivo de texto
    la $t0, myFile            # Dirección del buffer donde se almacenó el nombre
    li $t1, 0                 # Índice inicial

 
# Bucle que nos ayudara a leer todo el tamaño de la ruta hacia el archivo de texto
Lectura_Loop:
    lb   $t2, 0($t0)            # cargamos los bytes de t0 myfile a t2
    beq  $t2, 0, verificar_siguiente_linea     # Si es el fin del string, saltar a verificar_siguiente_linea
    addi $t1, $t1, 1            # Incrementar el índice inicial 
    addi $t0, $t0, 1            # Avanzar al siguiente byte
    j    Lectura_Loop         # Repetir el ciclo
# Eliminar el carácter de nueva línea al final del string si existe
verificar_siguiente_linea:
    subi $t0, $t0, 1            # Retroceder un byte
    lb   $t2, 0($t0)            # Cargar el último byte del buffer myfile y lo pasa a t2
    li   $t3, 10                # ponemos a t3 con 10 que es Carácter de nueva línea (ASCII 10)
    bne  $t2, $t3, terminar    # comparamos Si no es una nueva línea, saltar
    sb   $zero, 0($t0)          # Si es nueva línea, eliminar

terminar:
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


    li $v0, 4                   
    la $a0, las_lineas_del_archivo      
    syscall                 
    
      li $v0, 4               
    la $a0, newline      
    syscall 
    
    
       li $t4, 0                   # Contador de líneas
    la $t5, buffer              # Dirección del buffer
    li $t6, 0                   # Índice en el buffer

imprimir_lineas:
    beq $t4, 5, fin_imprimir    # Si se han impreso 5 líneas, terminar
    lb  $t7, 0($t5)             # Leer byte del buffer
    beq $t7, 0, fin_imprimir    # Si es el fin del buffer, terminar
    li  $v0, 11                 # Código del servicio para imprimir los bytes leidos
    move $a0, $t7               # Carácter a imprimir los bytes
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
#########################################################################################################################    
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################
#########################################################################################################################

    la $t0, buffer     # Puntero al buffer de entrada
    la $t1, encoded    # Puntero al buffer de salida
    move $t2, $s1      # Longitud del buffer de entrada (número de bytes leídos) el tamaño del buffer lo que contiene el archivo
    li $t3, 0          # Contador de bytes procesados
encode_to_base64:
    # Verificar si quedan bytes por procesar
    bge $t3, $t2, terminado

    # Leer 3 bytes del buffer de entrada, manejar padding = si es necesario
    lb $t4, 0($t0)
    addi $t3, $t3, 1
    beq $t3, $t2, ultimos_bytes
    lb $t5, 1($t0)
    addi $t3, $t3, 1
    beq $t3, $t2, ultimos_dos_bytes
    lb $t6, 2($t0)
    addi $t3, $t3, 1
    j encode_bytes

ultimos_bytes:
    li $t5, 0
    li $t6, 0
    j encode_bytes

ultimos_dos_bytes:
    li $t6, 0

encode_bytes:
    # Primer byte: bits 7-5
    andi $t7, $t4, 0xFC # Toma los primeros 6 bits del primer byte. 11111100
    srl $t7, $t7, 2 # Desplaza estos bits 2 posiciones a la derecha Se utiliza para mover bits a posiciones más bajas para que queden de modo a un valor menos que 64

    # Segundo byte: bits 7-2
    andi $t8, $t4, 0x03 # Toma los últimos 2 bits del primer byte. 00000011
    sll $t8, $t8, 4 # Desplaza estos bits a la izquierda para formar parte del segundo byte codificado. 00110000 Se utiliza para mover bits a posiciones más altas
    andi $t9, $t5, 0xF0 # Toma los primeros 4 bits del segundo byte. 11110000
    srl $t9, $t9, 4 # Desplaza estos bits 4 posiciones a la derecha. quedando 00001111 Se utiliza para mover bits a posiciones más bajas.
    or $t8, $t8, $t9 #  Combina los bits desplazados para formar el segundo byte codificado SUMAR.

    # Tercer byte: bits 7-4
    andi $t9, $t5, 0x0F # Toma los últimos 4 bits del segundo byte. 00001111
    sll $t9, $t9, 2 # Desplaza estos bits 2 posiciones a la izquierda para formar parte del tercer byte codificado. Se utiliza para mover bits a posiciones más altas
    andi $s0, $t6, 0xC0 # Toma los primeros 2 bits del tercer byte. 11000000
    srl $s0, $s0, 6 # Desplaza estos bits 6 posiciones a la derecha.00000011 Se utiliza para mover bits a posiciones más bajas.
    or $t9, $t9, $s0 # Combina los bits desplazados para formar el tercer byte codificado SUMAR.

    # Cuarto byte: bits 7-5
    andi $s0, $t6, 0x3F # Toma los últimos 6 bits del tercer byte. 00111111

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
    # elimnar el ultimo byte nulo
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
    sub  $a2, $t1, $a1    # longitud de los datos codificados del encoded ya en base64 - el buffer encoded el valor grande 1398101
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
# sufijo _cifrado.txt
encriptar_archivo_final: 
    la   $t1, myFile       
    la   $t2, nombre_final_archivo 
    la   $t3, cifrado_ext 
    li   $t4, 0              

# Leer la ruta del archivo para agregarle el _cifrado
copy_filename:
    lb $t5, ($t1)            # Cargar un byte del nombre del archivo original
    beq $t5, $zero, add_cifrado   # Si es el fin de la cadena, salir del bucle
    sb $t5, ($t2)            # Almacenar el byte en el buffer de salida
    addi $t1, $t1, 1         # Avanzar al siguiente byte del nombre original
    addi $t2, $t2, 1         # Avanzar al siguiente byte en el buffer de salida
    j copy_filename          # Repetir el ciclo

# Agregar "_cifrado"
add_cifrado:
    lb $t6, ($t3)            # Cargar un byte de "_cifrado"
    beq $t6, $zero, end_add_cifrado  # Si es el fin de la cadena, salir del bucle
    sb $t6, ($t2)            # Almacenar el byte en el buffer de salida
    addi $t3, $t3, 1         # Avanzar al siguiente byte de "_cifrado"
    addi $t2, $t2, 1         # Avanzar al siguiente byte en el buffer de salida
    j add_cifrado            # Repetir el ciclo

end_add_cifrado:


    jr $ra
