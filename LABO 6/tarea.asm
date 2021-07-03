
; MAIN
	org 	100h

	section	.text

	
	mov 	DX, msg1
	call  	readChar

	; leer frase del teclado
	mov 	BP, setMess
	call  	readCadena

	int 	20h

	section	.data
 
 

;pass
pass 	db 	"george", "$"

msg1	db	"pass: ", "$"
msg2 	db 	"BIENVENIDO", "$"
msg3 	db 	"INCORRECTO", "$"

setMess 	times 	 6 	db	" " 
nc equ 6	

; FUNCIONES




WaitQe:
        mov     AH, 01h         
        int     21h
        ret

readCadena:
        xor     SI, SI          ; SI = 0
while:  
        call    WaitQe    ; retorna un caracter en AL
        cmp     AL, 0x0D        ; comparar AL con caracter EnterKey
        je      exit            ; si se oprimió la tecla Enter entonces se termina el while
        mov     [BP+SI], AL   	; guardar caracter en memoria
        inc     SI              
        jmp     while  
exit:
        mov     byte [BP + DI], "$" ; para agregar el $ al final
        jmp     limpiar
limpiar:
        xor     SI, SI              ; limpiar el contador
compararCadenas:
        cmp     SI, nc    ; contraseña debe ser de cinco caracteres por lo que se compara con este largo definido
        je      esIgual             ; si se llega a la última posición significa que todos los caracteres de la cadena son iguales a la contraseña
        mov     AL, [pass + SI]    ; se recorre la cadena de la llave en la posición que lleve SI
	cmp     [BP + SI], AL	    ; se compara con el caracter de la frase ingresada que este en la posición de SI guardada en la direccion BP 
        jne     noIgual             ; si un caracter es diferente entonces salta a la cadena de incorrecto
        inc     SI
        jmp     compararCadenas     ; while
esIgual:
    	mov 	DX, msg2        ;Bienvenido
    	jmp 	readChar
noIgual:
    	mov 	DX, msg3        ;Incorrecto
    	jmp 	readChar
readChar:
    	mov 	AH, 09h
    	int 	21h
    	ret

