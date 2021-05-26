       org 100h

        section .text
        
        mov BP,arrNumber
        call StoreArr

        int 20h
        
        section .data
arrNumber db 01,02,03,04,05,06,07,08,09,10

StoreArr:
    xor SI,SI

while:
    mov AL,[BP+SI]
    mov dl, al
    
    cmp AL,10
    je end

    mov bl,01h
    and AL,bl
    
    cmp AL,01h  
    jnz PAR
    
    mov [0320H+SI],dl
    
    inc SI
    jmp while

PAR:
    mov [0300H+SI],dl

    inc SI
    jmp while

end:
ret 