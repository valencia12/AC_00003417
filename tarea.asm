        org     100h

        section .text

        mov     byte [200h], "J"
        mov     byte [201h], "G"
        mov     byte [202h], "M"
        mov     byte [203h], "V"
        
        ;Direccionamiento directo
        mov     AX, 200h
        mov     CX, [201h]
        mov     DX, [202h + DI]
        mov     DI, [SI + 203h]

        int 20h