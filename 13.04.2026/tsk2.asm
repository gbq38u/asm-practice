section .data
    A   dw 254
    B   dw 250
    fmt db "%d", 10, 0
section .bss
    RES resw 1
section .text
    global main
    extern printf
main:
    mov al, [A]
    mov bl, [B]
    add al, bl
    mov [RES], al

    mov al, [A+1]
    mov bl, [B+1]
    adc al, bl
    mov [RES+1], al

    movzx eax, word [RES]
    push eax
    push fmt
    call printf
    add esp, 8

    xor eax, eax
    ret