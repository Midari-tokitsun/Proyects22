.data
# NUMERO DE CESAR A ENCRIPTAR
key_prompt: .asciiz "Ingrese la clave de cifrado (número): "
# DONDE SE GUARDARA LA RUTA NORMAL
mensaje_ruta: .asciiz "PINGA INTRODUCE TU MIERDA DERUTA:"
buffer: .space 1024

# DONDE SE GUARDARA LA RUTA ENCRIPTADA
encoded_buffer: .space 120
# DONDE SE GUARDARA LO ENCRIPTADO
buffer1: .space 1048576
encoded: .space 1398101
# DONDE SE ALMACENARA EL CONTENIDO DEL ARCHIVO NORMAL

# DONDE SE añade el .TXT
_cifrado: .asciiz "_cifrado.txt"

.text
main:
    li $v0, 4                   # Código del servicio para imprimir cadena
    la $a0, mensaje_ruta        # Dirección de la cadena a imprimir
    syscall                     # Llamada al sistema para imprimir
    
    # Leer la ruta del archivo desde la entrada del usuario
    li $v0, 8                   # Código del servicio para leer string
    la $a0, buffer              # C:\Users\Usuario2024\Desktop\MARS4.5 ejercicios\proyecto1\holaoriginal.txt
    li $a1, 1024                # Tamaño máximo del buffer
    syscall                     # Llamada al sistema para leer el string


    la $t0, buffer            # Dirección del buffer donde se almacenó el nombre
    li $t1, 0                 # Índice inicial
    
remove_newline:
    lb   $t2, 0($t0)            # Cargar el siguiente byte del buffer
    beq  $t2, 0, check_next     # Si es el fin del string, terminar
    addi $t1, $t1, 1            # Incrementar el índice
    addi $t0, $t0, 1            # Avanzar al siguiente byte
    j    remove_newline         # Repetir el ciclo

check_next:
    subi $t0, $t0, 1            # Retroceder un byte
    lb   $t2, 0($t0)            # Cargar el último byte del buffer
    li   $t3, 10                # Carácter de nueva línea (ASCII 10)
    bne  $t2, $t3, skip_null    # Si no es nueva línea, saltar
    sb   $zero, 0($t0)          # Si es nueva línea, reemplazar con NULL

skip_null:

    # Modificar el nombre del archivo a cifrado
    la $t0, buffer              # Dirección del buffer con la ruta original
    la $t1, encoded_buffer      # Dirección del buffer para la ruta cifrada
    li $t2, 0                   # Índice para la nueva ruta
find_extension:
    lb $t3, 0($t0)              # Leer byte de la ruta original
    beq $t3, 0, add_cifrado     # Si es fin de cadena, añadir "_cifrado.txt"
    sb $t3, 0($t1)              # Copiar byte a la nueva ruta
    addi $t0, $t0, 1            # Avanzar al siguiente byte en la ruta original
    addi $t1, $t1, 1            # Avanzar al siguiente byte en la nueva ruta
    j find_extension            # Repetir el ciclo

add_cifrado:
    la $t3, _cifrado            # Cadena "_cifrado.txt"
add_cifrado_loop:
    lb $t4, 0($t3)              # Leer byte de "_cifrado.txt"
    beq $t4, 0, end_cifrado     # Si es fin de cadena, terminar
    sb $t4, 0($t1)              # Copiar byte a la nueva ruta
    addi $t3, $t3, 1            # Avanzar al siguiente byte en "_cifrado.txt"
    addi $t1, $t1, 1            # Avanzar al siguiente byte en la nueva ruta
    j add_cifrado_loop          # Repetir el ciclo
end_cifrado:
    sb $zero, 0($t1)            # Añadir NULL al final de la cadena


    # Abrir el archivo original
    li   $v0, 13          # llamada del sistema para abrir archivo
    la   $a0, buffer      # nombre del archivo de entrada
    li   $a1, 0           # bandera para lectura
    li   $a2, 0           # modo es ignorado
    syscall               # abrir archivo
    move $s0, $v0         # guardar descriptor de archivo
    
    # Leer desde el archivo recién abierto
    li   $v0, 14          # llamada del sistema para leer desde archivo
    move $a0, $s0         # descriptor de archivo
    la   $a1, buffer1     # dirección del buffer desde el cual leer
    li   $a2, 1398101        # longitud del buffer
    syscall               # leer desde archivo
    move $s1, $v0         # guardar el número de bytes leídos


    
########################################################################################################################          
########################################################################################################################
 #######################################################################################################################          
########################################################################################################################   
    # Cerrar el archivo original
    li $v0, 16
    move $a0, $s0
    syscall
    
    
    li $t4, 0                   # Contador de líneas
    la $t5, buffer1              # Dirección del buffer
 

imprimir_lineas:
    beq $t4, 5, fin_imprimir    # Si se han impreso 5 líneas, terminar
    lb  $t7, ($t5)             # Leer byte del buffer
    beq $t7, 0, fin_imprimir    # Si es el fin del buffer, terminar
    li  $v0, 11                 # Código del servicio para imprimir carácter
    move $a0, $t7               # Carácter a imprimir
    syscall                     # Llamada al sistema para imprimir
    beq $t7, 10, nueva_linea    # Si es nueva línea, incrementar contador
    add $t5, $t5, 1            # Avanzar al siguiente byte
    j imprimir_lineas           # Repetir el ciclo

nueva_linea:
    add $t4, $t4, 1            # Incrementar contador de líneas
    add $t5, $t5, 1            # Avanzar al siguiente byte
    j imprimir_lineas           # Repetir el ciclo

fin_imprimir:
    
########################################################################################################################          
########################################################################################################################          
########################################################################################################################
########################################################################################################################
       # DEPURACION  
       #li $v0, 10            
       #syscall    
       
########################################################################################################################          
########################################################################################################################
########################################################################################################################          
########################################################################################################################
    
    # Solicitar al usuario la clave de cifrado
    li   $v0, 4
    la   $a0, key_prompt
    syscall

    # Leer la clave de cifrado ingresada por el usuario
    li   $v0, 5
    syscall
    move $t4, $v0  # Guardar la clave de cifrado



    # Cifrar utilizando el cifrado César
    la $a0, buffer1
    la $a1, encoded
    move $a2, $s1
    move $a3, $t4
    jal caesar_cipher

########################################################################################################################          
########################################################################################################################
########################################################################################################################          
########################################################################################################################

    # Crear el archivo cifrado
    
    li   $v0, 13
    la   $a0, encoded_buffer
    li   $a1, 1           # Escritura
    li   $a2, 0           # Modo solo lectura
    syscall
    move $t2, $v0         # Guardar el descriptor del archivo cifrado
    
        # Escribir el resultado cifrado al archivo
    li $v0, 15
    move $a0, $t2
    la $a1, encoded  
    move $a2, $s1
    syscall


    # Imprimir el contenido del buffer cifrado para verificar DEPURACION
    li  $v0, 4          
    la  $a0, encoded    
    syscall


    # Cerrar el archivo cifrado
    li $v0, 16
    move $a0, $t2
    syscall
    
    
    # Terminar programa
    li $v0, 10            # llamada del sistema para salir
    syscall               # salir
    
    
########################################################################################################################          
########################################################################################################################
########################################################################################################################          
########################################################################################################################

# Esta es la función de cifrado César para encriptar el nombre del archivo
caesar_cipher:
    # $a0 -> dirección del buffer de entrada (nombre del archivo)
    # $a1 -> dirección del buffer de salida (nombre encriptado)
    # $a2 -> número de caracteres a encriptar (hasta el '.')
    # $a3 -> clave de cifrado
    move $t0, $a0    # buffer de entrada
    move $t1, $a1    # buffer de salida
    move $t2, $a2    # número de caracteres
    move $t3, $a3    # clave de cifrado

caesar_loop:
    beqz $t2, caesar_end        # Si no hay más caracteres, termina
    lb $t4, 0($t0)              # Leer un byte del buffer de entrada
    beq $t4, 46, caesar_end     # Si es '.', termina (extensión comienza)

    # Si el byte es una letra minúscula
    li $t5, 'a'
    li $t6, 'z'
    blt $t4, $t5, check_uppercase
    bgt $t4, $t6, check_uppercase
    add $t4, $t4, $t3
    sub $t4, $t4, $t5
    rem $t4, $t4, 26
    add $t4, $t4, $t5
    b check_write

check_uppercase:
    # Si el byte es una letra mayúscula
    li $t5, 'A'
    li $t6, 'Z'
    blt $t4, $t5, check_digit
    bgt $t4, $t6, check_digit
    add $t4, $t4, $t3
    sub $t4, $t4, $t5
    rem $t4, $t4, 26
    add $t4, $t4, $t5
    b check_write

check_digit:
    # Si el byte es un dígito
    li $t5, '9'
    li $t6, '0'
    blt $t4, $t5, write_original
    bgt $t4, $t6, write_original
    add $t4, $t4, $t3
    sub $t4, $t4, $t5
    rem $t4, $t4, 10
    add $t4, $t4, $t5
    b check_write

write_original:
    # No es letra ni dígito, no cifrar
    addi $t4, $t4, 0

check_write:
    # Escribir el byte cifrado en el buffer de salida
    sb $t4, 0($t1)
    addi $t0, $t0, 1
    addi $t1, $t1, 1
    addi $t2, $t2, -1
    j caesar_loop

caesar_end:
    jr $ra
