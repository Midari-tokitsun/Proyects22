.data
squares:         .space  524288    # PANTALLA (BUFFER)  512*256*4  
colorletra:  .word 0x00ffff00      # Color colorletra para dibujar letras AMARILLO
negro: .word 0x00000000   # Color negro (para borrar) 



colornumeros:        .word  0x00ff0000       # Rojo
         # Almacena la posición actual eje X y Y
posicion_x: .word 0

posicion_y: .word 0

ancho_pantalla: .word 2028 # Ancho de la pantalla en píxeles 
altura_linea: .word 30720#22528 30720   # Altura en píxeles 512 x 50 = 25600


.text
#la $t0, squares        # Carga el color colorletra


    j   gameLoop          # Salta al bucle del juego

gameLoop:


    lw  $t0, 0xffff0004 # obtener lo teclado por el usuario

   li  $v0, 32         # syscall  sleep
    li  $a0, 40         # sleep  40ms 
    syscall

    
    beq $t0, 8, borrarletra  # tecla 'retroceso'
    
beq $t0, 65, LetraAmayuscula  # tecla 'A'
beq $t0, 66, LetraBmayuscula  # tecla 'B'
beq $t0, 67, LetraCmayuscula  # tecla 'C'
beq $t0, 68, LetraDmayuscula  # tecla 'D'
beq $t0, 69, LetraEmayuscula  # tecla 'E'
beq $t0, 70, LetraFmayuscula  # tecla 'F'
beq $t0, 71, LetraGmayuscula  # tecla 'G'
beq $t0, 72, LetraHmayuscula  # tecla 'H'
beq $t0, 73, LetraImayuscula  # tecla 'I'
beq $t0, 74, LetraJmayuscula  # tecla 'J'
beq $t0, 75, LetraKmayuscula  # tecla 'K'
beq $t0, 76, LetraLmayuscula  # tecla 'L'
beq $t0, 77, LetraMmayuscula  # tecla 'M'
beq $t0, 78, LetraNmayuscula  # tecla 'N'
beq $t0, 79, LetraOmayuscula  # tecla 'O'
beq $t0, 80, LetraPmayuscula  # tecla 'P'
#######3nuevaS##########PROBAR
beq $t0, 81, LetraQmayuscula  # tecla 'Q'
beq $t0, 82, LetraRmayuscula  # tecla 'R'
beq $t0, 83, LetraSmayuscula  # tecla 'S'
beq $t0, 84, LetraTmayuscula  # tecla 'T'
beq $t0, 85, LetraUmayuscula  # tecla 'U'
#################################
beq $t0, 88, LetraXmayuscula  # tecla 'X'
beq $t0, 89, LetraYmayuscula  # tecla 'Y'
beq $t0, 90, LetraZmayuscula  # tecla 'Z'
###############################################
beq $t0, 87, LetraWmayuscula  # tecla 'W'
beq $t0, 86, LetraVmayuscula  # tecla 'V'
###################################################### letras minusculas ############################################### son 26 total
beq $t0, 97, Letraaminuscula  # tecla 'a' 
beq $t0, 98, Letrabminuscula  # tecla 'b'
beq $t0, 99, Letracminuscula  # tecla 'c'

##################################################
beq $t0, 100, Letradminuscula  # tecla 'd'
beq $t0, 101, Letraeminuscula  # tecla 'e' 
beq $t0, 102, Letrafminuscula  # tecla 'f'
beq $t0, 103, Letragminuscula  # tecla 'g' 

###################################################
beq $t0, 104, Letrahminuscula  # tecla 'h'
beq $t0, 105, Letraiminuscula  # tecla 'i'
beq $t0, 106, Letrajminuscula  # tecla 'j'

#################################################
beq $t0, 108, Letralminuscula  # tecla 'l'
beq $t0, 109, Letramminuscula  # tecla 'm'
beq $t0, 110, Letranminuscula  # tecla 'n'
########################################################
beq $t0, 111, Letraominuscula  # tecla 'o'
######################################################### 
beq $t0, 112, Letrapminuscula  # tecla 'p'
beq $t0, 114, Letrarminuscula  # tecla 'r'
beq $t0, 118, Letravminuscula  # tecla 'v'
beq $t0, 117, Letrauminuscula  # tecla 'u'
#############################################################
beq $t0, 119, Letrawminuscula# tecla w
beq $t0, 120, Letraxminuscula# tecla x
beq $t0, 115, Letrasminuscula# tecla s
############################################################
beq $t0, 121, Letrayminuscula  # tecla 'y' 

beq $t0, 116, Letratminuscula  # tecla 't'
beq $t0, 113, Letraqminuscula  # tecla 'q' 

#################################################################################
beq $t0, 122, Letrazminuscula# tecla z 
beq $t0, 107, Letrakminuscula  # tecla 'k'
################################################################################# numeros 0-9 NUEVO
beq $t0, 48, numero0  # tecla del numero0
beq $t0, 49, numero1  # tecla del numero1
beq $t0, 50, numero2  # tecla del numero2
beq $t0, 51, numero3  # tecla del numero3
beq $t0, 52, numero4  # tecla del numero4
beq $t0, 53, numero5  # tecla del numero5
beq $t0, 54, numero6  # tecla del numero6
beq $t0, 55, numero7  # tecla del numero7
beq $t0, 56, numero8  # tecla del numero8
beq $t0, 57, numero9  # tecla del numero9
########################################################################################

 j   gameLoop 
 
borrarletra:
    li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    
    la  $a0, posicion_x   # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)       # Carga la posición horizontal actual
    la  $a1, posicion_y   # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)       # Carga la posición vertical actual

    # Verifica si la posición X es mayor que 0
    bgtz $t1, adjust_x    # Si la posición X es mayor que 0, ajusta posición X bgtz
    
check_y:
    # Si la posición X es 0, retrocede una línea
    blez $t6, no_move     # Si ya estamos en la primera línea, no moverse más hacia arriba

    la $t3, altura_linea
    lw $t3, 0($t3)        # Carga el valor de la altura de la línea (30720 píxeles)
    sub $t6, $t6, $t3     # Mueve la posición vertical una línea hacia arriba
    sw $t6, 0($a1)        # Guarda la nueva posición vertical

    la $t2, ancho_pantalla
    lw $t2, 0($t2)        # Carga el valor del ancho de la pantalla (2028 píxeles)
    sub $t1, $t2, 52      # Coloca la posición horizontal al final de la línea anterior
    addi $t1, $t1, 52     # Coloca la posición en la última letra 

    sw $t1, 0($a0)        # Guarda la nueva posición horizontal


adjust_x:
    addi $t1, $t1, -52    # Decrementa la posición en 52 píxeles
    sw $t1, 0($a0)        # Guarda la nueva posición horizontal

 

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6          # Añade la posición vertical
    
  lw $t2, negro        # Carga el color colorletra
########################## LINEA DEL FINAL     |
li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
     

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### RELLENADOR para el borrado
########################### LINEA DEL FINAL     |
li $t3, 40          # Alto de la línea vertical (ej: alto de pantalla)

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
     

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
########################### LINEA DEL FINAL     |
li $t3, 36          # Alto de la línea vertical (ej: alto de pantalla)

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
     

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
########################### LINEA DEL FINAL     |
li $t3, 32          # Alto de la línea vertical (ej: alto de pantalla)
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
     

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DEL FINAL     |
li $t3, 28          # Alto de la línea vertical (ej: alto de pantalla)

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
     

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

###########################
########################### LINEA DEL FINAL     |
li $t3, 24          # Alto de la línea vertical (ej: alto de pantalla)

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
     

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

###########################
########################### LINEA DEL FINAL     |
li $t3, 20          # Alto de la línea vertical (ej: alto de pantalla)

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
     

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

###########################
########################### LINEA DEL FINAL     |
li $t3, 16          # Alto de la línea vertical (ej: alto de pantalla)

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
     

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

###########################
########################### LINEA DEL FINAL     |
li $t3, 12          # Alto de la línea vertical (ej: alto de pantalla)

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
     

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

###########################
########################### LINEA DEL FINAL     |
li $t3, 8          # Alto de la línea vertical (ej: alto de pantalla)

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
     

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

###########################
########################### LINEA DEL FINAL     |
li $t3, 4          # Alto de la línea vertical (ej: alto de pantalla)

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
     

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

###########################
########################### LINEA DEL FINAL     |
li $t3, 0          # Alto de la línea vertical (ej: alto de pantalla)

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
     

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
     add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048 #NUEVO

###########################


no_move:
j gameLoop                # Vuelve al bucle principal del juego

LetraAmayuscula:
    li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    
    la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6          # Añade la posición vertical
     lw $t2, colorletra        # Carga el color colorletra

    li $t3, 0             # Inicializa el desplazamiento
 ########################### LINEA DE ARRIBA hacia arriba -

   # Línea superior horizontal
    lw $t2, negro        # Carga el color colorletra
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
     lw $t2, colorletra        # Carga el color colorletra
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    # Línea vertical izquierda
    li $t3, 2048
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    add $t4, $t0, $t3
    sw $t2, 0($t4)

    # Línea horizontal central
    li $t3, 12288
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    # Línea vertical derecha
    li $t3, 44
    lw $t2, negro        # Carga el color colorletra
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
    lw $t2, colorletra        # Carga el color colorletra
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    add $t4, $t0, $t3
    sw $t2, 0($t4)


# Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap     # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap:
    sw $t1, 0($a0)  

    j   gameLoop          # Regresa al bucle del juego
     
LetraBmayuscula:    
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento

     lw $t2, colorletra        # Carga el color colorletra

    li  $t3, 0            # Inicializa el desplazamiento

    # Dibuja la letra 'B'
  ########################### LINEA DE ARRIBA hacia arriba -

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    lw $t2, negro        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
###########################
########################### LINEA DEL INICIO hacia abajo |
li $t3, 2048   
    lw $t2, colorletra        # Carga el color colorletra 
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288
    lw $t2, colorletra        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    lw $t2, negro        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    lw $t2, colorletra        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
     

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

lw $t2, negro        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
lw $t2, colorletra        # Carga el color colorletra   
 
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B


li $t3, 22528

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################

###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap1    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap1:
    sw $t1, 0($a0)  
j gameLoop


LetraCmayuscula:
    li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    
    la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6          # Añade la posición vertical
    lw $t1, colorletra        # Carga el color colorletra

    li  $t2, 0            # Inicializa el desplazamiento

    # Dibuja la letra 'C'
    # Línea superior horizontal
 
   lw $t1,negro #squares para ver como va la letra
 add $t3, $t0,$t2
  sw $t1, ($t3)
add $t2, $t2,4


  add $t3, $t0,$t2
  sw $t1, ($t3)
add $t2, $t2,4

  lw $t1,colorletra #squares para ver como va la letra
  add $t3, $t0,$t2
  sw $t1, ($t3)
add $t2, $t2,4

  add $t3, $t0,$t2
  sw $t1, ($t3)
add $t2, $t2,4

  add $t3, $t0,$t2
  sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4


add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4
###########################
########################### LINEA DEL INICIO hacia abajo |
li $t2, 2048   

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048
      

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048
    
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048
        
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048


add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048
      
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048
    
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048

  lw $t1,negro #squares para ver como va la letra
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048
########################### LINEA DE ENMEDIO -


########################### LINEA DEL FINAL     |
li $t2, 44     
lw $t1,negro #squares para ver como va la letra     # Alto de la línea vertical (ej: alto de pantalla)
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048
      

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048
    
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048
        
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048
      
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048
    
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048


add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048
###########################
li $t2, 22528

lw $t1,negro #squares para ver como va la letra
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

lw $t1,colorletra #squares para ver como va la letra
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

lw $t1,negro #squares para ver como va la letra
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4
##########################
# Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap2     # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap2:
    sw $t1, 0($a0)  

    j   gameLoop          # Regresa al bucle del juego

LetraEmayuscula:
  
 li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    lw  $t2, colorletra   # Carga el color colorletra

    li  $t3, 0            # Inicializa el desplazamiento

    # Dibuja la letra 'B'
      lw  $t2, negro   # Carga el color colorletra
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  ########################### LINEA DE ARRIBA hacia arriba -
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  lw  $t2, colorletra   # Carga el color colorletra
   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
########################### LINEA DEL INICIO hacia abajo |

li $t3, 2048    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

  lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288
  lw  $t2, colorletra   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
  lw  $t2, negro   # Carga el color colorletra
li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
        
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B
  lw  $t2, colorletra   # Carga el color colorletra

li $t3, 22528

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4



 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap3    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap3:
    sw $t1, 0($a0)  
j gameLoop


LetraOmayuscula:

 li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    
    la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6          # Añade la posición vertical
    lw  $t2, colorletra   # Carga el color colorletra

    li  $t2, 0            # Inicializa el desplazamiento
 ########################### LINEA DE ARRIBA hacia arriba -
 
lw $t1,negro #squares para ver como va la letra
 add $t3, $t0,$t2
  sw $t1, ($t3)
add $t2, $t2,4


  add $t3, $t0,$t2
  sw $t1, ($t3)
add $t2, $t2,4

    lw  $t1, colorletra   # Carga el color colorletra
  add $t3, $t0,$t2
  sw $t1, ($t3)
add $t2, $t2,4

  add $t3, $t0,$t2
  sw $t1, ($t3)
add $t2, $t2,4

  add $t3, $t0,$t2
  sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

lw $t1,negro #squares para ver como va la letra
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4
###########################
########################### LINEA DEL INICIO hacia abajo |
li $t2, 2048   
lw $t1,negro #squares para ver como va la letra 
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048
      
    lw  $t1, colorletra   # Carga el color colorletra
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048
    
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048
        
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048


add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048
      
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048
    
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048

lw $t1,negro #squares para ver como va la letra
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048
########################### LINEA DE ENMEDIO -


########################### LINEA DEL FINAL     |
li $t2, 44     
lw $t1,negro #squares para ver como va la letra     # Alto de la línea vertical (ej: alto de pantalla)
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048
      
    lw  $t1, colorletra   # Carga el color colorletra
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048
    
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048
        
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048
      
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048
    
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048
###########################
li $t2, 22528


lw $t1,negro #squares para ver como va la letra
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

    lw  $t1, colorletra   # Carga el color colorletra
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

lw $t1,negro #squares para ver como va la letra
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4
##########################

la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap4    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap4:
    sw $t1, 0($a0)  
j gameLoop
#######################################################

LetraDmayuscula:

 li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    
    la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6          # Añade la posición vertical
    lw  $t2, colorletra   # Carga el color colorletra

    li  $t2, 0            # Inicializa el desplazamiento
  ########################### ########################### 
lw $t1,colorletra #squares para ver como va la letra     # Alto de la línea vertical (ej: alto de pantalla)
    li  $t2, 0            # Inicializa el desplazamiento

add $t3, $t0,$t2
  sw $t1, ($t3)
add $t2, $t2,4


  add $t3, $t0,$t2
  sw $t1, ($t3)
add $t2, $t2,4


  add $t3, $t0,$t2
  sw $t1, ($t3)
add $t2, $t2,4

  add $t3, $t0,$t2
  sw $t1, ($t3)
add $t2, $t2,4

  add $t3, $t0,$t2
  sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

lw $t1,negro #squares para ver como va la letra     # Alto de la línea vertical (ej: alto de pantalla)
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4
###########################
########################### LINEA DEL INICIO hacia abajo |
li $t2, 2048   
lw $t1,colorletra #squares para ver como va la letra     # Alto de la línea vertical (ej: alto de pantalla)
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048
      

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048
    
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048
        
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048


add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048
      
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048
    
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048


add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048

lw $t1,negro #squares para ver como va la letra     # Alto de la línea vertical (ej: alto de pantalla)
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048
########################### LINEA DE ENMEDIO -


########################### LINEA DEL FINAL     |
li $t2, 44     
lw $t1,negro #squares para ver como va la letra     # Alto de la línea vertical (ej: alto de pantalla)
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048
      
lw $t1,colorletra #squares para ver como va la letra     # Alto de la línea vertical (ej: alto de pantalla)
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048
    
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048
        
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048
      
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048
    
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048

lw $t1,negro #squares para ver como va la letra     # Alto de la línea vertical (ej: alto de pantalla)
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,2048
###########################
li $t2, 22528
lw $t1,colorletra #squares para ver como va la letra     # Alto de la línea vertical (ej: alto de pantalla)
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4


add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

lw $t1,negro #squares para ver como va la letra     # Alto de la línea vertical (ej: alto de pantalla)
add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4

add $t3, $t0,$t2
sw $t1, ($t3)
add $t2, $t2,4
##########################

 ###########################  ########################### 
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap5    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap5:
   sw $t1, 0($a0)  
j gameLoop


##########################################################
LetraFmayuscula:    
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################


   lw  $t2, colorletra   # Carga el color colorletra

    li  $t3, 0            # Inicializa el desplazamiento

    # Dibuja la letra 'B'

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  ########################### LINEA DE ARRIBA hacia arriba -
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
########################### LINEA DEL INICIO hacia abajo |

li $t3, 2048    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288
  lw  $t2, colorletra   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  lw  $t2, negro   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
  lw  $t2, negro   # Carga el color colorletra
li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
        
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B
  lw  $t2, colorletra   # Carga el color colorletra

li $t3, 22528

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4



 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  
###########################
###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap6    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap6:
    sw $t1, 0($a0)  
j gameLoop
###############################################################################################################################

LetraGmayuscula:    
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################

 lw  $t2, colorletra   # Carga el color colorletra

    li  $t3, 0            # Inicializa el desplazamiento

    # Dibuja la letra 'B'

  lw  $t2, negro   # Carga el color colorletra
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  ########################### LINEA DE ARRIBA hacia arriba -
    lw  $t2, colorletra   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
########################### LINEA DEL INICIO hacia abajo |

li $t3, 2048    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

  lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288
  lw  $t2, colorletra   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  lw  $t2, negro   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  lw  $t2, colorletra   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
  lw  $t2, negro   # Carga el color colorletra
li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
        
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


  lw  $t2, colorletra   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B

  lw  $t2, negro   # Carga el color colorletra
li $t3, 22528

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  lw  $t2, colorletra   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4



 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap7    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap7:
    sw $t1, 0($a0)  
j gameLoop

###########################################################################################################
LetraHmayuscula:    
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################
 lw  $t2, colorletra   # Carga el color colorletra

    li  $t3, 0            # Inicializa el desplazamiento

    # Dibuja la letra 'B'

  lw  $t2, negro   # Carga el color colorletra
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  ########################### LINEA DE ARRIBA hacia arriba -

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
########################### LINEA DEL INICIO hacia abajo |
  lw  $t2, colorletra   # Carga el color colorletra
li $t3, 2048    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
  lw  $t2, negro   # Carga el color colorletra
li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

  lw  $t2, colorletra   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
        
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B

li $t3, 22528

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  lw  $t2, colorletra   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap8    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap8:
    sw $t1, 0($a0)  
j gameLoop
#######################################################################################################################

LetraImayuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################
   lw  $t2, colorletra   # Carga el color colorletra

    li  $t3, 0            # Inicializa el desplazamiento

    # Dibuja la letra 'I'


    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  ########################### LINEA DE ARRIBA hacia arriba -

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
########################### LINEA DEL INICIO hacia abajo |
  lw  $t2, negro   # Carga el color colorletra
li $t3, 2048    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
  lw  $t2, colorletra   # Carga el color colorletra
li $t3, 24          # Alto de la línea vertical (ej: alto de pantalla)
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
        
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B
  lw  $t2, colorletra   # Carga el color colorletra
li $t3, 22528

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap9    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap9:
    sw $t1, 0($a0)  
j gameLoop

########################################################################################################

LetraJmayuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################
  lw  $t2, colorletra   # Carga el color colorletra

    li  $t3, 0            # Inicializa el desplazamiento

    # Dibuja la letra 'I'


    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  ########################### LINEA DE ARRIBA hacia arriba -

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
########################### LINEA DEL INICIO hacia abajo |
  lw  $t2, negro   # Carga el color colorletra
li $t3, 2048    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
  lw  $t2, colorletra   # Carga el color colorletra
li $t3, 24          # Alto de la línea vertical (ej: alto de pantalla)
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
        
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B
  lw  $t2, colorletra   # Carga el color colorletra
li $t3, 22528

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap10    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap10:
    sw $t1, 0($a0)  
j gameLoop

###############################################################################################################

LetraTmayuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################
 
 lw  $t2, colorletra   # Carga el color colorletra

    li  $t3, 0            # Inicializa el desplazamiento

    # Dibuja la letra 'T'


    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  ########################### LINEA DE ARRIBA hacia arriba -

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
########################### LINEA DEL INICIO hacia abajo |
  lw  $t2, negro   # Carga el color colorletra
li $t3, 2048    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
  lw  $t2, colorletra   # Carga el color colorletra
li $t3, 24          # Alto de la línea vertical (ej: alto de pantalla)
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
        
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B
  lw  $t2, negro   # Carga el color colorletra
li $t3, 22528

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap11    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap11:
    sw $t1, 0($a0)  
j gameLoop
#################################################################################################

LetraKmayuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################
  lw  $t2, colorletra   # Carga el color colorletra

    li  $t3, 0            # Inicializa el desplazamiento

    # Dibuja la letra 'B'

  lw  $t2, negro   # Carga el color colorletra
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  ########################### LINEA DE ARRIBA hacia arriba -

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
########################### LINEA DEL INICIO hacia abajo |
  lw  $t2, colorletra   # Carga el color colorletra
li $t3, 2048    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


lw  $t2, negro   # Carga el color colorletra     
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
  lw  $t2, negro   # Carga el color colorletra
li $t3, 32          # Alto de la línea vertical (ej: alto de pantalla)
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

  lw  $t2, colorletra   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
        
lw  $t2, negro   # Carga el color colorletra     
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
 

lw  $t2, colorletra   # Carga el color colorletra     
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B

li $t3, 22528

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  lw  $t2, colorletra   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
 
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap12    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap12:
    sw $t1, 0($a0)  
j gameLoop
#################################################################################################

LetraLmayuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################


 lw  $t2, colorletra   # Carga el color colorletra

    li  $t3, 0            # Inicializa el desplazamiento

    # Dibuja la letra 'L'
      lw  $t2, negro   # Carga el color colorletra
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  ########################### LINEA DE ARRIBA hacia arriba -
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
########################### LINEA DEL INICIO hacia abajo |
  lw  $t2, colorletra   # Carga el color colorletra
li $t3, 2048    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

  lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288
  lw  $t2, colorletra   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  lw  $t2, negro   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
  lw  $t2, negro   # Carga el color colorletra
li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
        
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B
  lw  $t2, colorletra   # Carga el color colorletra

li $t3, 22528

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4



 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################

 
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap13    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap13:
    sw $t1, 0($a0)  
j gameLoop

################################################################################################################

LetraMmayuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################
lw  $t2, colorletra   # Carga el color colorletra

    li  $t3, 0            # Inicializa el desplazamiento

    # Dibuja la letra 'I'


    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  ########################### LINEA DE ARRIBA hacia arriba -

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
########################### LINEA DEL INICIO hacia abajo |
  lw  $t2, negro   # Carga el color colorletra
li $t3, 2048    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
  lw  $t2, colorletra   # Carga el color colorletra
li $t3, 24          # Alto de la línea vertical (ej: alto de pantalla)
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
        
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B
  lw  $t2, colorletra   # Carga el color colorletra
li $t3, 44

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
####################################################

li $t3, 2048    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

###########################

###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap14    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap14:
    sw $t1, 0($a0)  
j gameLoop

###################################

LetraNmayuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################
lw  $t2, colorletra   # Carga el color colorletra

    li  $t3, 0            # Inicializa el desplazamiento

    # Dibuja la letra 'N'


 ###########################
 lw  $t2, colorletra   # Carga el color colorletra

    li  $t3, 0            # Inicializa el desplazamiento

    # Dibuja la letra 'I'


    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052
  ########################### LINEA DE ARRIBA hacia arriba -

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052


   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052

###########################
########################### LINEA DEL INICIO hacia abajo |
  lw  $t2, negro   # Carga el color colorletra
li $t3, 2048    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |

###########################256*50+100 ultima linea para formar la B
  lw  $t2, colorletra   # Carga el color colorletra
li $t3, 44

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
####################################################

li $t3, 2048    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap15    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap15:
    sw $t1, 0($a0)  
j gameLoop

##############################################################################################################

LetraPmayuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################

lw  $t2, colorletra   # Carga el color colorletra

    li  $t3, 0            # Inicializa el desplazamiento

    # Dibuja la letra 'I'


    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  ########################### LINEA DE ARRIBA hacia arriba -

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
########################### LINEA DEL INICIO hacia abajo |
  lw  $t2, colorletra   # Carga el color colorletra
li $t3, 2048    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
  lw  $t2, colorletra   # Carga el color colorletra
li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
        
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
      lw  $t2, negro   # Carga el color colorletra

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B

li $t3, 22528
  lw  $t2, colorletra   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap16    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap16:
    sw $t1, 0($a0)  
j gameLoop

################################################################################################

LetraQmayuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################
lw  $t2, colorletra   # Carga el color colorletra

    li  $t3, 0            # Inicializa el desplazamiento

    # Dibuja la letra 'I'


    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  ########################### LINEA DE ARRIBA hacia arriba -

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
########################### LINEA DEL INICIO hacia abajo |

li $t3, 2048    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 0

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052

lw  $t2, colorletra   # Carga el color colorletra

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052

########################### LINEA DEL FINAL     |
lw  $t2, colorletra   # Carga el color colorletra
li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
        
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B
lw  $t2, colorletra   # Carga el color colorletra
li $t3, 22528

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    lw  $t2, colorletra   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap17    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap17:
    sw $t1, 0($a0)  
j gameLoop

############################################################################################

LetraRmayuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################
lw  $t2, colorletra   # Carga el color colorletra

    li  $t3, 0            # Inicializa el desplazamiento

    # Dibuja la letra 'I'


    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  ########################### LINEA DE ARRIBA hacia arriba -

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
          lw  $t2, negro   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
########################### LINEA DEL INICIO hacia abajo |
      lw  $t2, colorletra   # Carga el color colorletra
li $t3, 2048    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

      lw  $t2, negro   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
          lw  $t2, negro   # Carga el color colorletra
li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      
lw  $t2, colorletra   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
        
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
      lw  $t2, negro   # Carga el color colorletra

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      
            lw  $t2, colorletra   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B

li $t3, 22528

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
      lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
      lw  $t2, colorletra   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap18    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap18:
    sw $t1, 0($a0)  
j gameLoop

###############################################################################################

LetraSmayuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################
lw  $t2, colorletra   # Carga el color colorletra

    li  $t3, 0            # Inicializa el desplazamiento

    # Dibuja la letra 'I'

          lw  $t2, negro   # Carga el color colorletra
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  ########################### LINEA DE ARRIBA hacia arriba -
          lw  $t2, colorletra   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
########################### LINEA DEL INICIO hacia abajo |
      lw  $t2, colorletra   # Carga el color colorletra
li $t3, 2048    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288
lw  $t2, colorletra   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
          lw  $t2, negro   # Carga el color colorletra
li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
        
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      
lw  $t2, colorletra   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B

li $t3, 22528

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap19    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap19:
    sw $t1, 0($a0)  
j gameLoop
#############################################################################################

LetraUmayuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################
lw  $t2, colorletra   # Carga el color colorletra

    li  $t3, 0            # Inicializa el desplazamiento

    # Dibuja la letra 'I'

lw  $t2, negro   # Carga el color colorletra
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  ########################### LINEA DE ARRIBA hacia arriba -

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
########################### LINEA DEL INICIO hacia abajo |
lw  $t2, colorletra   # Carga el color colorletra
li $t3, 2048    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288
lw  $t2, colorletra   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw  $t2, negro   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |

li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

lw  $t2, colorletra   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
        
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B

li $t3, 22528
lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
lw  $t2, colorletra   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap20    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap20:
    sw $t1, 0($a0)  
j gameLoop
#######################################################################################################

LetraXmayuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################
lw  $t2, colorletra   # Carga el color colorletra

    li  $t3, 0            # Inicializa el desplazamiento

    # Dibuja la letra 'I'


    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052
  ########################### LINEA DE ARRIBA hacia arriba -

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052


   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052

###########################
########################### LINEA DEL INICIO hacia abajo |
lw  $t2, negro   # Carga el color colorletra
li $t3, 2048    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288
lw  $t2, negro   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
lw  $t2, colorletra   # Carga el color colorletra
li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2044


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2044
      

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2044
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2044

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2044
        
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2044
    


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2044
      

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2044
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2044

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2044

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2044


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2044
###########################256*50+100 ultima linea para formar la B

li $t3, 22528
lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap21    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap21:
    sw $t1, 0($a0)  
j gameLoop
############################################################################################
LetraYmayuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################
lw  $t2, colorletra   # Carga el color colorletra

    li  $t3, 0            # Inicializa el desplazamiento

    # Dibuja la letra 'I'


    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  ########################### LINEA DE ARRIBA hacia arriba -
lw  $t2, negro   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
########################### LINEA DEL INICIO hacia abajo |
lw  $t2, colorletra   # Carga el color colorletra
li $t3, 2048    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw  $t2, colorletra   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |

li $t3, 24          # Alto de la línea vertical (ej: alto de pantalla)
lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
        
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
lw  $t2, colorletra   # Carga el color colorletra

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B
lw  $t2, colorletra   # Carga el color colorletra
li $t3, 44

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

lw  $t2, negro   # Carga el color colorletra

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap22    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap22:
    sw $t1, 0($a0)  
j gameLoop
#############################################################################################
LetraZmayuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################
lw  $t2, colorletra   # Carga el color colorletra

    li  $t3, 0            # Inicializa el desplazamiento

    # Dibuja la letra 'I'


    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  ########################### LINEA DE ARRIBA hacia arriba -

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
########################### LINEA DEL INICIO hacia abajo |
lw  $t2, negro   # Carga el color colorletra
li $t3, 2048    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288
lw  $t2, negro   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
lw  $t2, colorletra   # Carga el color colorletra
li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2044


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2044
      

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2044
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2044

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2044
        
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2044
    


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2044
      

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2044
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2044

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2044

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2044


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2044
###########################256*50+100 ultima linea para formar la B

li $t3, 22528

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap23    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap23:
    sw $t1, 0($a0)  
j gameLoop
#########################################################################################################
#############################################################################################
LetraVmayuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################
lw  $t2, colorletra   # Carga el color colorletra

    li  $t3, 0            # Inicializa el desplazamiento

    # Dibuja la letra 'V'

lw  $t2, negro   # Carga el color colorletra
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  ########################### LINEA DE ARRIBA hacia arriba -

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
########################### LINEA DEL INICIO hacia abajo |
lw  $t2, colorletra   # Carga el color colorletra
li $t3, 2056    # para el eje x
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048 # para el eje y

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288
lw  $t2, negro   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw  $t2, colorletra   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  
lw  $t2, negro   # Carga el color colorletra  
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |

li $t3, 36          # Alto de la línea vertical (ej: alto de pantalla)
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

lw  $t2, colorletra   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
        
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B

li $t3, 22528
lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
lw  $t2, colorletra   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap24    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap24:
    sw $t1, 0($a0)  
j gameLoop
#########################################################################################################
LetraWmayuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################
lw  $t2, colorletra   # Carga el color colorletra



    # Dibuja la letra 'W'
li $t3, 24          # Alto de la línea vertical (ej: alto de pantalla)
    lw  $t2, negro   # Carga el color colorletra
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
  ########################### LINEA DE ARRIBA hacia arriba -

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
    lw  $t2, colorletra   # Carga el color colorletra
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

###########################
########################### LINEA DEL INICIO hacia abajo |
lw  $t2, colorletra   # Carga el color colorletra
li $t3, 2048    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288
lw  $t2, colorletra   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw  $t2, negro   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |

li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

lw  $t2, colorletra   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
        
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B

li $t3, 22528
lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
lw  $t2, colorletra   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap25    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap25:
    sw $t1, 0($a0)  
j gameLoop
#########################################################################################################

#########################################################################################################
Letraaminuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################


     lw $t2, negro        # Carga el color colorletra
   li $t3, 2048             # Inicializa el desplazamiento
 ########################### LINEA DE ARRIBA hacia arriba -

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
     lw $t2, colorletra        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
###########################
########################### LINEA DEL INICIO hacia abajo |
li $t3, 16   
    lw $t2, negro        # Carga el color colorletra 
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 lw $t2, colorletra        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

        lw $t2, colorletra        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    lw $t2, colorletra        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
     

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B


li $t3, 22528
lw $t2, negro        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw $t2, colorletra        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################

###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap26    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap26:
    sw $t1, 0($a0)  
j gameLoop
#########################################################################################################
#########################################################################################################
Letrabminuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################


    lw $t2, negro        # Carga el color colorletra
   li $t3, 2048             # Inicializa el desplazamiento
 ########################### LINEA DE ARRIBA hacia arriba -

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
###########################
########################### LINEA DEL INICIO hacia abajo |
li $t3, 16   
    lw $t2, colorletra        # Carga el color colorletra 
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 lw $t2, colorletra        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

        lw $t2, colorletra        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
     

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

     lw $t2, colorletra        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B


li $t3, 22528
lw $t2, negro        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw $t2, colorletra        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################

###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap27    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap27:
    sw $t1, 0($a0)  
j gameLoop
#########################################################################################################
#########################################################################################################
Letracminuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################

     lw $t2, colorletra        # Carga el color colorletra
   li $t3, 0             # Inicializa el desplazamiento
 ########################### LINEA DE ARRIBA hacia arriba -
     lw $t2, negro        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
###########################
########################### LINEA DEL INICIO hacia abajo |
li $t3, 2048   
     lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

     lw $t2, colorletra        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 2048

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    lw $t2, negro        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

        lw $t2, colorletra        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
         lw $t2, colorletra        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

         lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
     

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048



 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


         lw $t2, colorletra        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B


li $t3, 22528
lw $t2, negro        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw $t2, colorletra        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw $t2, negro        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap28    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap28:
    sw $t1, 0($a0)  
j gameLoop
#########################################################################################################

#########################################################################################################
Letraominuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################

     lw $t2, colorletra        # Carga el color colorletra
   li $t3, 0             # Inicializa el desplazamiento
 ########################### LINEA DE ARRIBA hacia arriba -
     lw $t2, negro        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
###########################
########################### LINEA DEL INICIO hacia abajo |
li $t3, 2048   
     lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

     lw $t2, colorletra        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 2048

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

        lw $t2, colorletra        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
         lw $t2, colorletra        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
     

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048



 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


         lw $t2, colorletra        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B


li $t3, 22528
lw $t2, negro        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw $t2, colorletra        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw $t2, negro        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap29    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap29:
    sw $t1, 0($a0)  
j gameLoop
#########################################################################################################

#########################################################################################################
Letradminuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################


     lw $t2, negro        # Carga el color colorletra
   li $t3, 2048             # Inicializa el desplazamiento
 ########################### LINEA DE ARRIBA hacia arriba -

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
###########################
########################### LINEA DEL INICIO hacia abajo |
li $t3, 16   
    lw $t2, negro        # Carga el color colorletra 
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

     lw $t2, colorletra        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

        lw $t2, colorletra        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
    lw $t2, colorletra        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
     

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B


li $t3, 22528
lw $t2, negro        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw $t2, colorletra        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap30    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap30:
    sw $t1, 0($a0)  
j gameLoop
#########################################################################################################
#########################################################################################################
Letraeminuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################
      lw $t2, negro        # Carga el color colorletra
   li $t3, 2048             # Inicializa el desplazamiento
 ########################### LINEA DE ARRIBA hacia arriba -

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
     lw $t2, colorletra        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
###########################
########################### LINEA DEL INICIO hacia abajo |
li $t3, 16   
    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

          lw $t2, colorletra        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

        lw $t2, colorletra        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    lw $t2, colorletra        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
     

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B


li $t3, 22528
lw $t2, negro        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw $t2, colorletra        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap31    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap31:
    sw $t1, 0($a0)  
j gameLoop
#########################################################################################################

#########################################################################################################
Letrafminuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################
 ########################### LINEA DE ARRIBA hacia arriba -
    li $t3, 20             # Inicializa el desplazamiento
    lw $t2, colorletra        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################
########################### LINEA DEL INICIO hacia abajo |
li $t3, 2048   
    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288
    lw $t2, negro        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

        lw $t2, colorletra        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4



  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    lw $t2, negro        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
li $t3, 16          # Alto de la línea vertical (ej: alto de pantalla)

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    lw $t2, colorletra        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
     

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

         lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
###########################256*50+100 ultima linea para formar la B


li $t3, 22528

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4



 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw $t2, colorletra        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw $t2, negro        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap32    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap32:
    sw $t1, 0($a0)  
j gameLoop
#########################################################################################################

#########################################################################################################
Letragminuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################

      lw $t2, negro        # Carga el color colorletra
   li $t3, 2048             # Inicializa el desplazamiento
 ########################### LINEA DE ARRIBA hacia arriba -

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
     lw $t2, colorletra        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    lw $t2, negro        # Carga el color colorletra 
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
###########################
########################### LINEA DEL INICIO hacia abajo |
li $t3, 16   

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 lw $t2, colorletra        # Carga el color colorletra 
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

        lw $t2, colorletra        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    lw $t2, colorletra        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
     

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B


li $t3, 22528
lw $t2, negro        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw $t2, colorletra        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 lw $t2, negro        # Carga el color colorletra 
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################

###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap33    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap33:
    sw $t1, 0($a0)  
j gameLoop
#########################################################################################################

#########################################################################################################
Letrahminuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################

    lw $t2, negro        # Carga el color colorletra
   li $t3, 2048             # Inicializa el desplazamiento
 ########################### LINEA DE ARRIBA hacia arriba -

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
###########################
########################### LINEA DEL INICIO hacia abajo |
li $t3, 16   
    lw $t2, colorletra        # Carga el color colorletra 
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

        lw $t2, colorletra        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
     

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

    lw $t2, colorletra        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B


li $t3, 22528
lw $t2, negro        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
lw $t2, colorletra        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw $t2, colorletra        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################

###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap34    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap34:
    sw $t1, 0($a0)  
j gameLoop
#########################################################################################################
#########################################################################################################
Letraiminuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################


 ########################### LINEA DE ARRIBA hacia arriba -
    li $t3, 20             # Inicializa el desplazamiento
    lw $t2, negro        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    lw $t2, colorletra        # Carga el color colorletra
   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    lw $t2, negro        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    lw $t2, colorletra        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################
########################### LINEA DEL INICIO hacia abajo |
li $t3, 2048   
    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288
    lw $t2, negro        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

        lw $t2, colorletra        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

        lw $t2, negro        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
     

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B


li $t3, 22528

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw $t2, negro        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4



 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap35    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap35:
    sw $t1, 0($a0)  
j gameLoop
#########################################################################################################

#########################################################################################################
Letrajminuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################


 ########################### LINEA DE ARRIBA hacia arriba -
    li $t3, 20             # Inicializa el desplazamiento
    lw $t2, negro        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    lw $t2, colorletra        # Carga el color colorletra
   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################
########################### LINEA DEL INICIO hacia abajo |
li $t3, 2048   
    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288
    lw $t2, negro        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

        lw $t2, colorletra        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

        lw $t2, negro        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
     

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B


li $t3, 22528

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw $t2, colorletra        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4



 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap36    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap36:
    sw $t1, 0($a0)  
j gameLoop
#########################################################################################################

#########################################################################################################
Letralminuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################
 ########################### LINEA DE ARRIBA hacia arriba -
    li $t3, 20             # Inicializa el desplazamiento
    lw $t2, colorletra        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################
########################### LINEA DEL INICIO hacia abajo |
li $t3, 2048   
    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288
    lw $t2, negro        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

        lw $t2, colorletra        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

        lw $t2, negro        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
     

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B


li $t3, 22528

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw $t2, negro        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4



 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    lw $t2, colorletra        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################

###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap37    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap37:
    sw $t1, 0($a0)  
j gameLoop
#########################################################################################################

#########################################################################################################
Letramminuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################

 ########################### LINEA DE ARRIBA hacia arriba -
    li $t3, 20             # Inicializa el desplazamiento
    lw $t2, negro        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    lw $t2, colorletra        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################
########################### LINEA DEL INICIO hacia abajo |
li $t3, 2048   
    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    lw $t2, colorletra        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288
    lw $t2, colorletra        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
     

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
    lw $t2, colorletra        # Carga el color colorletra
 
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B


li $t3, 22528

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw $t2, negro        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4



 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    lw $t2, colorletra        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################

###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap38    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap38:
    sw $t1, 0($a0)  
j gameLoop
#########################################################################################################

#########################################################################################################
Letranminuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################

    lw $t2, colorletra        # Carga el color colorletra
   li $t3, 0             # Inicializa el desplazamiento
 ########################### LINEA DE ARRIBA hacia arriba -
    lw $t2, negro        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
###########################
########################### LINEA DEL INICIO hacia abajo |
li $t3, 2048   
    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    lw $t2, colorletra        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288
    lw $t2, colorletra        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
     

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
    lw $t2, colorletra        # Carga el color colorletra
 
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B


li $t3, 22528

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw $t2, negro        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4



 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    lw $t2, colorletra        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap39    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap39:
    sw $t1, 0($a0)  
j gameLoop
#########################################################################################################

#########################################################################################################
Letratminuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################


 ########################### LINEA DE ARRIBA hacia arriba -
    li $t3, 20             # Inicializa el desplazamiento
    lw $t2, colorletra        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################
########################### LINEA DEL INICIO hacia abajo |
li $t3, 2048   
    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288
    lw $t2, negro        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
        lw $t2, colorletra        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
     

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B


li $t3, 22528

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw $t2, negro        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4



 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    lw $t2, colorletra        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap40    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap40:
    sw $t1, 0($a0)  
j gameLoop
#########################################################################################################

#########################################################################################################
Letraqminuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################

    lw $t2, negro        # Carga el color colorletra
   li $t3, 2048             # Inicializa el desplazamiento
 ########################### LINEA DE ARRIBA hacia arriba -

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
     lw $t2, colorletra        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    lw $t2, negro        # Carga el color colorletra 
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
###########################
########################### LINEA DEL INICIO hacia abajo |
li $t3, 16   

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 lw $t2, colorletra        # Carga el color colorletra 
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

        lw $t2, colorletra        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    lw $t2, colorletra        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
     

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B


li $t3, 22528
lw $t2, negro        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw $t2, colorletra        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
###########################

###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap41    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap41:
    sw $t1, 0($a0)  
j gameLoop
#########################################################################################################

#########################################################################################################
Letrayminuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################
 
    lw $t2, negro        # Carga el color colorletra
   li $t3, 2048             # Inicializa el desplazamiento
 ########################### LINEA DE ARRIBA hacia arriba -

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
     lw $t2, negro        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    lw $t2, negro        # Carga el color colorletra 
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
###########################
########################### LINEA DEL INICIO hacia abajo |
li $t3, 16   

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 lw $t2, colorletra        # Carga el color colorletra 
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

        lw $t2, colorletra        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    lw $t2, colorletra        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
     

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B


li $t3, 22528
lw $t2, negro        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw $t2, colorletra        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 lw $t2, negro        # Carga el color colorletra 
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap42    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap42:
    sw $t1, 0($a0)  
j gameLoop
#########################################################################################################

#########################################################################################################
Letrapminuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################
 ########################### LINEA DE enmedio hacia abajo pa la P
      lw $t2, negro        # Carga el color colorletra
   li $t3, 2048             # Inicializa el desplazamiento
 ########################### LINEA DE ARRIBA hacia arriba -

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
     lw $t2, colorletra        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
###########################
########################### LINEA DEL INICIO hacia abajo |
li $t3, 16   
    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

          lw $t2, colorletra        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

        lw $t2, colorletra        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    lw $t2, colorletra        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
     

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B


li $t3, 22528
lw $t2, negro        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
lw $t2, colorletra        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw $t2, negro        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap43    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap43:
    sw $t1, 0($a0)  
j gameLoop
#########################################################################################################

#########################################################################################################
Letrarminuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################
 ########################### LINEA DE ARRIBA hacia arriba -
    li $t3, 20             # Inicializa el desplazamiento
    lw $t2, negro        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
    lw $t2, colorletra        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################
########################### LINEA DEL INICIO hacia abajo |
li $t3, 22528   
    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    lw $t2, colorletra        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DE ENMEDIO -
li $t3, 12288
    lw $t2, negro        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


lw $t2, colorletra        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
 lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
     

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

lw $t2, colorletra        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
    
lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B
li $t3, 0

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4



 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap44    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap44:
    sw $t1, 0($a0)  
j gameLoop
#########################################################################################################

#########################################################################################################
Letravminuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################

 #lw  $t2, colorletra   # Carga el color colorletra

    li  $t3, 0            # Inicializa el desplazamiento

    # Dibuja la letra 'V'

lw  $t2, negro   # Carga el color colorletra
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  ########################### LINEA DE ARRIBA hacia arriba -

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
########################### LINEA DEL INICIO hacia abajo |

li $t3, 2056    # para el eje x
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048 # para el eje y

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    lw  $t2, colorletra   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288
lw  $t2, negro   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw  $t2, colorletra   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  
lw  $t2, negro   # Carga el color colorletra  
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |

li $t3, 36          # Alto de la línea vertical (ej: alto de pantalla)
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    lw  $t2, colorletra   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
        
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B

li $t3, 22528
lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
lw  $t2, colorletra   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################

###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap45    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap45:
    sw $t1, 0($a0)  
j gameLoop
#########################################################################################################

#########################################################################################################
Letrauminuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################

     lw $t2, colorletra        # Carga el color colorletra
   li $t3, 0             # Inicializa el desplazamiento
 ########################### LINEA DE ARRIBA hacia arriba -
    lw $t2, negro        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
###########################
########################### LINEA DEL INICIO hacia abajo |
li $t3, 2048   
    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

         lw $t2, colorletra        # Carga el color colorletra 
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288
    lw $t2, colorletra        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    lw $t2, negro        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    lw $t2, colorletra        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
lw $t2, colorletra        # Carga el color colorletra

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
     

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
lw $t2, negro        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B


li $t3, 22528
lw $t2, negro        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw $t2, colorletra        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4



 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw $t2, negro        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################

###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap46    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap46:
    sw $t1, 0($a0)  
j gameLoop
#########################################################################################################

#########################################################################################################
Letrawminuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################

     lw $t2, negro        # Carga el color colorletra
   li $t3, 20             # Inicializa el desplazamiento
 ########################### LINEA DE ARRIBA hacia arriba -

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

     lw $t2, colorletra        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################
########################### LINEA DEL INICIO hacia abajo |
li $t3, 2048   
    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

         lw $t2, colorletra        # Carga el color colorletra 
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288
    lw $t2, colorletra        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    lw $t2, negro        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    lw $t2, colorletra        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
     
lw $t2, colorletra        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
lw $t2, negro        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B


li $t3, 22528
lw $t2, negro        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw $t2, colorletra        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4



 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw $t2, negro        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap47    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap47:
    sw $t1, 0($a0)  
j gameLoop
#########################################################################################################

#########################################################################################################
Letraxminuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################
lw  $t2, negro   # Carga el color colorletra

    li  $t3, 0            # Inicializa el desplazamiento

    # Dibuja la letra 'x' minuscula


    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052
  ########################### LINEA DE ARRIBA hacia arriba -

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052


   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052

lw  $t2, colorletra   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2052

###########################
########################### LINEA DEL INICIO hacia abajo |
lw  $t2, negro   # Carga el color colorletra
li $t3, 2048    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288
lw  $t2, negro   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
lw  $t2, negro   # Carga el color colorletra
li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2044


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2044
      

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2044
    
lw  $t2, colorletra   # Carga el color colorletra        
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2044

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2044
        

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2044
    


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2044
      

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2044
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2044

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2044

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2044


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2044
###########################256*50+100 ultima linea para formar la B

li $t3, 22528
lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################

###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap48    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap48:
    sw $t1, 0($a0)  
j gameLoop
#########################################################################################################

#########################################################################################################
Letrasminuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################


 ########################### LINEA DE ARRIBA hacia arriba -
    li $t3, 20             # Inicializa el desplazamiento
    lw $t2, colorletra        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    lw $t2, negro        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    lw $t2, colorletra        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################
########################### LINEA DEL INICIO hacia abajo |
li $t3, 22528   
    lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    lw $t2, colorletra        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DE ENMEDIO -
li $t3, 12288
    lw $t2, negro        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


            lw $t2, colorletra        # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
         lw $t2, negro        # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
     

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
    lw $t2, colorletra        # Carga el color colorletra

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B

        lw $t2, negro        # Carga el color colorletra
li $t3, 0

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4



 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw $t2, colorletra        # Carga el color colorletra   
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


###########################
###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap49    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap49:
    sw $t1, 0($a0)  
j gameLoop
#########################################################################################################

#########################################################################################################
Letrazminuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################

lw  $t2, negro   # Carga el color colorletra

    li  $t3, 0            # Inicializa el desplazamiento

    # Dibuja la letra 'z'


    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  ########################### LINEA DE ARRIBA hacia arriba -

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
########################### LINEA DEL INICIO hacia abajo |
lw  $t2, negro   # Carga el color colorletra
li $t3, 2048    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 10240
lw  $t2, colorletra   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
lw  $t2, colorletra   # Carga el color colorletra
li $t3, 10284          # Alto de la línea vertical (ej: alto de pantalla)
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2040


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2040
      

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2040
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2040

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2040
        
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2040
    
lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2040
      

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2040
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2040

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2040

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2040


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2040
###########################256*50+100 ultima linea para formar la B

li $t3, 22528
lw  $t2, colorletra   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap50    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap50:
    sw $t1, 0($a0)  
j gameLoop
#########################################################################################################

#########################################################################################################
Letrakminuscula:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################

#lw  $t2, colorletra   # Carga el color colorletra

    li  $t3, 0            # Inicializa el desplazamiento



  lw  $t2, negro   # Carga el color colorletra
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  ########################### LINEA DE ARRIBA hacia arriba -

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
########################### LINEA DEL INICIO hacia abajo |

li $t3, 2048    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

lw  $t2, colorletra   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4



  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw  $t2, negro   # Carga el color colorletra     
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |

li $t3, 32          # Alto de la línea vertical (ej: alto de pantalla)
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      
        lw  $t2, colorletra   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
        

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

lw  $t2, negro   # Carga el color colorletra     
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
 

lw  $t2, colorletra   # Carga el color colorletra     
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B

li $t3, 22528

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  lw  $t2, colorletra   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap51    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap51:
    sw $t1, 0($a0)  
j gameLoop
#########################################################################################################

#########################################################################################################
numero0:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################


lw  $t2, colornumeros   # Carga el color colorletra

    li  $t3, 0            # Inicializa el desplazamiento


    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  ########################### LINEA DE ARRIBA hacia arriba -

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
########################### LINEA DEL INICIO hacia abajo |

li $t3, 2048    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288
lw  $t2, negro   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |

li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

lw  $t2, colornumeros   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
        
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
    lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      
    lw  $t2, colornumeros   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B

li $t3, 22528
lw  $t2, colornumeros   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap52    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap52:
    sw $t1, 0($a0)  
j gameLoop
#########################################################################################################

#########################################################################################################
numero1:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################
   lw  $t2, negro   # Carga el color colorletra
    li  $t3, 0            # Inicializa el desplazamiento

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  ########################### LINEA DE ARRIBA hacia arriba -

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

   lw  $t2, colornumeros   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
   lw  $t2, negro   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
########################### LINEA DEL INICIO hacia abajo |
  lw  $t2, negro   # Carga el color colorletra
li $t3, 2048    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |
  lw  $t2, colornumeros   # Carga el color colorletra
li $t3, 24          # Alto de la línea vertical (ej: alto de pantalla)
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
        
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B
  lw  $t2, negro   # Carga el color colorletra
li $t3, 22528

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  lw  $t2, colornumeros   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap53    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap53:
    sw $t1, 0($a0)  
j gameLoop
#########################################################################################################

#########################################################################################################
numero2:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################
#lw  $t2, colorletra   # Carga el color colorletra
    li  $t3, 0            # Inicializa el desplazamiento

          lw  $t2, negro   # Carga el color colorletra
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  ########################### LINEA DE ARRIBA hacia arriba -
          lw  $t2, colornumeros   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
########################### LINEA DEL INICIO hacia abajo |
      lw  $t2, negro   # Carga el color colorletra
li $t3, 2048    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

lw  $t2, colornumeros   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw  $t2, colornumeros   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |

li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

          lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      
          lw  $t2, colornumeros   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
        
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B
lw  $t2, colornumeros   # Carga el color colorletra
li $t3, 22528

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap54    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap54:
    sw $t1, 0($a0)  
j gameLoop
#########################################################################################################

#########################################################################################################
numero3:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################
#lw  $t2, colorletra   # Carga el color colorletra
    li  $t3, 0            # Inicializa el desplazamiento

          lw  $t2, negro   # Carga el color colorletra
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  ########################### LINEA DE ARRIBA hacia arriba -
          lw  $t2, colornumeros   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
########################### LINEA DEL INICIO hacia abajo |
      lw  $t2, negro   # Carga el color colorletra
li $t3, 2048    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw  $t2, colornumeros   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

          lw  $t2, negro   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |

li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

          lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      
          lw  $t2, colornumeros   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
        
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      
lw  $t2, colornumeros   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B

li $t3, 22528
lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
lw  $t2, colornumeros   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap55    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap55:
    sw $t1, 0($a0)  
j gameLoop
#########################################################################################################

#########################################################################################################
numero4:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################
lw  $t2, colornumeros   # Carga el color colorletra
    li  $t3, 0            # Inicializa el desplazamiento

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  ########################### LINEA DE ARRIBA hacia arriba -
lw  $t2, negro   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
########################### LINEA DEL INICIO hacia abajo |
      lw  $t2, colornumeros   # Carga el color colorletra
li $t3, 2048    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


      lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw  $t2, colornumeros   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |

li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
        
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      
lw  $t2, colornumeros   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B

li $t3, 22528
lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
lw  $t2, colornumeros   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap56    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap56:
    sw $t1, 0($a0)  
j gameLoop
#########################################################################################################

#########################################################################################################
numero5:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################

    li  $t3, 0            # Inicializa el desplazamiento


          lw  $t2, negro   # Carga el color colorletra
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  ########################### LINEA DE ARRIBA hacia arriba -
          lw  $t2, colornumeros   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
########################### LINEA DEL INICIO hacia abajo |
      lw  $t2, colornumeros   # Carga el color colorletra
li $t3, 2048    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


      lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw  $t2, colornumeros   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

          lw  $t2, negro   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |

li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
        
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      
lw  $t2, colornumeros   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B

li $t3, 22528
lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
lw  $t2, colornumeros   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
      lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap57    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap57:
    sw $t1, 0($a0)  
j gameLoop
#########################################################################################################

#########################################################################################################
numero6:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################

#lw  $t2, colornumeros   # Carga el color colorletra

    li  $t3, 0            # Inicializa el desplazamiento

    # Dibuja la letra 'I'

          lw  $t2, negro   # Carga el color colorletra
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  ########################### LINEA DE ARRIBA hacia arriba -
          lw  $t2, colornumeros   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
########################### LINEA DEL INICIO hacia abajo |
      lw  $t2, colornumeros   # Carga el color colorletra
li $t3, 2048    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


      lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      lw  $t2, colornumeros   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw  $t2, colornumeros   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

          lw  $t2, negro   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |

li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
        
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      
lw  $t2, colornumeros   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B

li $t3, 22528
lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
lw  $t2, colornumeros   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap58    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap58:
    sw $t1, 0($a0)  
j gameLoop
#########################################################################################################

#########################################################################################################
numero7:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################


lw  $t2, colornumeros   # Carga el color colorletra

    li  $t3, 0            # Inicializa el desplazamiento


    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  ########################### LINEA DE ARRIBA hacia arriba -

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
########################### LINEA DEL INICIO hacia abajo |

li $t3, 2048    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288
lw  $t2, negro   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |

li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

lw  $t2, colornumeros   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
        
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
    lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      
    lw  $t2, colornumeros   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B

li $t3, 22528
lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap59    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap59:
    sw $t1, 0($a0)  
j gameLoop
#########################################################################################################

#########################################################################################################
numero8:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################
lw  $t2, colornumeros   # Carga el color colorletra

    li  $t3, 0            # Inicializa el desplazamiento

    # Dibuja la letra 'I'

          lw  $t2, negro   # Carga el color colorletra
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  ########################### LINEA DE ARRIBA hacia arriba -
          lw  $t2, colornumeros   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
########################### LINEA DEL INICIO hacia abajo |
      lw  $t2, colornumeros   # Carga el color colorletra
li $t3, 2048    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


      lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      lw  $t2, colornumeros   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw  $t2, colornumeros   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

          lw  $t2, negro   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |

li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

          lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      
          lw  $t2, colornumeros   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
        
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      
lw  $t2, colornumeros   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B

li $t3, 22528
lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
lw  $t2, colornumeros   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################

###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap60    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap60:
    sw $t1, 0($a0)  
j gameLoop
#########################################################################################################

#########################################################################################################
numero9:
li  $t0, 0  
    sw  $t0, 0xffff0004   # RESETEAR EL TECLADO PARA QUE NO OCURRA UN BUCLE INFINITO DE LA LETRA
    

     la  $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
    lw  $t1, 0($a0)            # Carga la posición horizontal actual
    la  $a1, posicion_y        # Carga la dirección de la variable 'posicion_y'
    lw  $t6, 0($a1)            # Carga la posición vertical actual

    la $t0, squares            # Carga la base del bitmap
    add $t0, $t0, $t1          # Calcula la posición en el bitmap
    add $t0, $t0, $t6   
    #lw $t1, colorletra        # Carga el color colorletra

    #li  $t3, 0            # Inicializa el desplazamiento
###########################

lw  $t2, colornumeros   # Carga el color colorletra

    li  $t3, 0            # Inicializa el desplazamiento

    # Dibuja la letra 'I'

          lw  $t2, negro   # Carga el color colorletra
    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  ########################### LINEA DE ARRIBA hacia arriba -
          lw  $t2, colornumeros   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


   add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

    add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
########################### LINEA DEL INICIO hacia abajo |
      lw  $t2, colornumeros   # Carga el color colorletra
li $t3, 2048    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


      lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

      
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

########################### LINEA DE ENMEDIO -
li $t3, 12288

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

lw  $t2, colornumeros   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

          lw  $t2, negro   # Carga el color colorletra
  add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

########################### LINEA DEL FINAL     |

li $t3, 44          # Alto de la línea vertical (ej: alto de pantalla)
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

          lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      
          lw  $t2, colornumeros   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
        
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
      
lw  $t2, colornumeros   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
    

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 2048
###########################256*50+100 ultima linea para formar la B

li $t3, 22528
lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
lw  $t2, colornumeros   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4


 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4
    
lw  $t2, negro   # Carga el color colorletra
 add $t4, $t0, $t3
    sw $t2, 0($t4)
    addi $t3, $t3, 4

###########################
###########################
###########################
  # Actualiza la posición para la próxima letra
la $a0, posicion_x        # Carga la dirección de la variable 'posicion_x'
lw $t1, 0($a0)            # Carga la posición horizontal actual
addi $t1, $t1, 52         # Incrementa la posición en 52 píxeles
sw $t1, 0($a0)            # Guarda la nueva posición horizontal

la $t2, ancho_pantalla
lw $t2, 0($t2)            # Carga el valor del ancho de la pantalla (512)

# Verifica si la nueva posición excede el valor para el salto de línea
blt $t1, $t2, no_wrap61    # Si la posición es menor, no hay salto de línea

# Saltar de línea
li $t1, 0                  # Reinicia la posición horizontal a 0
sw $t1, 0($a0)             # Guarda la nueva posición horizontal

la $t3, altura_linea
lw $t3, 0($t3)             # Carga el valor de la altura de la línea (1)
la $t4, posicion_y
lw $t5, 0($t4)             # Carga la posición vertical actual
add $t5, $t5, $t3          # Incrementa la posición vertical en la altura de una línea
sw $t5, 0($t4)             # Guarda la nueva posición vertical


   no_wrap61:
    sw $t1, 0($a0)  
j gameLoop
#########################################################################################################
