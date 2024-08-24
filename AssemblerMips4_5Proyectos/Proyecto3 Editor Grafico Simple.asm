.data
    pantalla:         .space  524288        
    puntero:     .word   0x0000ff00  # VERDE
    bgcolor:        .word   0x00000000      
    arriba:             .word   0x000000ff#0x010000ff    # Azul claro
    abajo:           .word   0x010000ff#0x020000ff     # Azul claro
    izquierda:           .word  0x020000ff #0x030000ff   # Azul claro 
    derecha:          .word   0x030000ff #0x040000ff  # Azul claro

    colorazul:       .word  0x0000FF       # Azul
    colorrojo:        .word  0xFF0000       # Rojo
    colorverde:      .word  0x00FF00       # Verde
    coloramarillo:     .word  0xFFFF00       # Amarillo
    #colornegro:     .word  0x00000000       # negro
.text
    la   $t0, pantalla       
    add  $t0, $t0, 243072     
    add  $s1, $t0, $zero     # cargar el posicionamiento del puntero
    
    lw   $t1, puntero    
    sw  $t1, 0($t0)       # pasamos el puntero y el posicionamiento en pantalla

gameLoop:
    lw  $t0, 0xffff0004         # obtener las teclas del usuario

    li  $v0, 32          
    li  $a0, 50           # sleep 50ms
    syscall

    beq $t0, 119, moverArriba      # tecla == 'w' en ascii 119
    beq $t0, 115, moverAbajo    # tecla == 's' en ascii 115
    beq $t0, 97, moverIzquierda     # tecla == 'a' en ascii 97
    beq $t0, 100, moverDerecha   # tecl == 'd' en ascii 100
    

    beq $t0, 49, ColorAzul           # tecla '1'
    beq $t0, 50, ColorRojo           # tecla '2'
    beq $t0, 51, ColorVerde           # tecla '3'
    beq $t0, 52, ColorAmarillo           # tecla '4'
    
    beq $t0, 120, Letrax# tecla x

    j   gameLoop                

####################################################setear colores#################################################
ColorAzul:
    lw $t1, colorazul
    sw $t1, bgcolor
    j ActualizarPosicionamiento

ColorRojo:
    lw $t1, colorrojo
    sw $t1, bgcolor
    j ActualizarPosicionamiento

ColorVerde:
    lw $t1, colorverde
    sw $t1, bgcolor
    j ActualizarPosicionamiento

ColorAmarillo:
    lw $t1, coloramarillo
    sw $t1, bgcolor
    j ActualizarPosicionamiento
    
Letrax:
    lw $t1, colorazul
    sw $t1, bgcolor
    j ActualizarPosicionamiento

####################################################setear movimiento lectura de teclas#################################################
moverArriba:

    beq $s3, $t1, ActualizarPosicionamiento      

    lw  $s3, arriba                 
    j   ActualizarPosicionamiento              
moverAbajo:

    beq $s3, $t1, ActualizarPosicionamiento    

    lw  $s3, abajo               
    j   ActualizarPosicionamiento              
moverIzquierda:
    lw      $t1, derecha              
    beq     $s3, $t1, ActualizarPosicionamiento    
    beqz    $s3, gameLoop           
                                    

    lw  $s3, izquierda              
    j   ActualizarPosicionamiento              
moverDerecha:
    lw  $t1, izquierda               
    beq $s3, $t1, ActualizarPosicionamiento    

    lw  $s3, derecha              
    j   ActualizarPosicionamiento             

####################################################Realizar el movimiento#################################################		
############################################PUNTERO NORMAL#################################################					
ActualizarPosicionamiento:

    lw  $t0, 0($s1)             # cargamos el pixel en la pantalla s1 es el valor del buffer
    add $t0, $t0, $s3           # agregamos el valor de las direcciones en memoria en el buffer  
    sw  $t0, 0($s1)             # put value back
    
    lw  $t0, 0($s1)             # obtenemos los valores anteriores de las w,s,d,a obtenidos en memoria y pasarlos al buffer
    li  $t1, 0xff000000
    and $t0, $t0, $t1           # obetenemos los pixeles del puntero para moverlos a la siguiente posicion                              
    
    lw  $t1, bgcolor            # setear los colores de w,a,s,d en negro a la pantalla
    sw  $t1, 0($s1)             # setear el color de el movimiento w,a,s,d en el .data en negro 
    
    lw  $t0, arriba
    beq $s3, $t0, moverPunteroArriba
    lw  $t0, abajo
    beq $s3, $t0, moverPunteroAbajo
    lw  $t0, izquierda
    beq $s3, $t0, moverPunteroIzquierda
    lw  $t0, derecha
    beq $s3, $t0, moverPunteroDerecha
    
moverPunteroArriba:
    add $s1, $s1, -2048          # mover 512 pixeles por 4 = -2048 hacia arriba
    j   MoverPuntero
moverPunteroAbajo:
    add $s1, $s1, 2048           # mover 512 pixeles por 4 = 2048 hacia abajo
    j   MoverPuntero
moverPunteroIzquierda:
    add $s1, $s1, -4            # mover un pixel hacia atras -4
    j   MoverPuntero
moverPunteroDerecha:
    add $s1, $s1, 4             # mover un pixel hacia adelante +4
    j   MoverPuntero  
  
			
MoverPuntero:
    lw  $t1, puntero     # cargamos el puntero
    
    sw  $t1, 0($s1)         # cargamos el puntero en pantalla
    
    j gameLoop
############################################PUNTERO NORMAL#######################################					

