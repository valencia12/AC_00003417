.model small
.stack
.data

    cadena1 db 10 dup(' '),'$'
    cadena2 db 10 dup(' '),'$'
    msj1 db 'Las cadenas SI son iguales$'
    msj2 db 'Las cadenas NO son iguales$'

.code
.startup

    mov ah,06h         ; peticion de recorrido de la pantalla
    mov al,00h         ; indica la pantalla completa
    mov bh,07h         ; attributos de color y fondo 7 blanco 0 negro
    mov cx,0000h       ; esquina superior izquierda renglon columna
    mov dx,184fh       ; esquina inferior derecha renglon columna
    int 10h 

    lea SI,cadena1
    mov cx,10
 regresa:
    mov ah,07h
    int 21h
    cmp al,13
    je termina
    mov [SI],al
    inc SI
    mov dl,al
    mov ah,02h
    int 21h
    loop regresa

termina:
    lea SI,cadena2
    mov cx,10
regresa2:
    mov ah,07h
    int 21h
    cmp al,13
    je termina2
    mov [SI],al
    inc SI
    mov dl,al
    mov ah,02h
    int 21h
    loop regresa2

termina2:

    push ES
    mov AX,DS
    mov ES,AX
    mov cx,10
    lea SI,cadena1
    lea DI,cadena2
    repe cmpsb
    JNE no_igual
    jmp igual
    pop ES

 no_igual:
    lea DX,msj2
    jmp fin

igual:
    lea DX,msj1

fin:
    mov ah,09h
    int 21h

.exit
end