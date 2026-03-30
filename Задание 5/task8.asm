section .data
    a db 10, 0, 0
    b db 20, 0, 0
    c db 3,  0, 0
section .bss
    d resb 3
section .text
global _start
_start:
    mov al, [b]
    mov [d], al
    mov al, [b+1]
    mov [d+1], al
    mov al, [b+2]
    mov [d+2], al
    sub byte [d], 1
    sbb byte [d+1], 0
    sbb byte [d+2], 0
    mov al, [a]
    add [d], al
    mov al, [a+1]
    adc [d+1], al
    mov al, [a+2]
    adc [d+2], al
    mov al, [c]
    sub [d], al
    mov al, [c+1]
    sbb [d+1], al
    mov al, [c+2]
    sbb [d+2], al