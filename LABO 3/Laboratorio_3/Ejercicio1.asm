org 100h

section .text

    XOR AX, AX
    XOR BX, BX
    MOV word CX, 4d
    JMP sumatoria

sumatoria:
    MOV byte BL,[numeros+DI]
    ADD AL,BL
    INC DI
    LOOP sumatoria
total:
    XOR BX, BX  
    MOV BX, 8d
    DIV BX
    MOV byte [20Ah], AL

exit:
    int 25h

section .data

numeros DB 3,4,1,7