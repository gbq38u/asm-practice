section .data
    a db 7
    x db 2
    q db 0
    r db 0
section .text
global _start
_start:
    mov al, [a]  
    xor ah, ah   
    div byte [x]     
    mov [q], al
    mov [r], ah