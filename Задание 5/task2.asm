section .data
    A dw 254
    B dw 250
section .text
global _start
_start:
    mov al, [A]
    mov bl, [B]
    add al, bl
    mov [A], al
    mov al, [A+1]
    mov bl, [B+1]
    adc al, bl
    mov [A+1], al