section .data
    a   dw 12
    b   dw -5
    fmt db "r = %d", 10, 0
section .bss
    r   resd 1
section .text
global _start

_start:
    mov ax, [a]
    sub ax, [b]    
    mov bx, [a]
    add bx, [b]     
    imul bx
    mov word [r], ax
    mov word [r+2], dx