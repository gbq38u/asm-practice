section .data
    x_low  db 34
    x_high db 2
    y      db 5
section .bss
    res resb 3      

section .text
global _start

_start:

    mov al, [x_low]
    mul byte [y]     
    mov [res], al        
    mov bl, ah          
    mov al, [x_high]
    mul byte [y]        

    add al, bl
    adc ah, 0
    mov [res+1], al
    mov [res+2], ah