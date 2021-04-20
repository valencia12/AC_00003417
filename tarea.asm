        org     100h

        section .text

        xor AX,AX
        xor BX,BX
        xor CX,CX
        xor DX,DX


        mov     byte [200h], "J"
        mov     byte [201h], "G"
        mov     byte [202h], "M"
        mov     byte [203h], "V"
        
        ;Direccionamiento directo
        ;copiar el valor 200h a AX
        xor     AX,AX
        mov     AX, [200h]
        ;Copiar el valor de 201h a CX indrecto por registro
        xor     BX,BX
        mov     BX, [201h]
        mov     CX, [BX]
        ;Copiar el valor de 202h DX usando indirc base mas indice
        xor     BX,BX
        mov     BX, [202h]
        mov     DX, [BX + DI]
        ;Copiar el valor de 203h a DI usando dirc relativo por registro.
        mov     DI, [SI + 203h]
        
        int 20h