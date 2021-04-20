        org     100h

        section .text

        xor AX,AX
        xor BX,BX
        xor CX,CX
        xor DX,DX


        
   
        
        ;Direccionamiento directo
        ;copiar el valor 200h a AX
        xor     AX,AX
        mov     byte [200h], 6ah
        mov     AX, [200h]
        ;Copiar el valor de 201h a CX indrecto por registro
        xor     BX,BX
        mov     byte [201h], 67h
        mov     BX, 201h
        mov     CX, [BX]
        ;Copiar el valor de 202h DX usando indirc base mas indice
        xor     BX,BX
        mov     byte [202h], 6dh
        mov     BX, 202h
        mov     DX, [BX + SI]
        ;Copiar el valor de 203h a DI usando dirc relativo por registro.
        mov     byte [203h], 76h
        mov     DI, [SI + 3h]
        
        int 20h