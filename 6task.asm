%include "io.inc"

section .text
global CMAIN
CMAIN:
    ; 5684 / 4
    mov eax, 5684
    mov ebx, 4
    xor edx, edx
    div ebx
    mov ecx, eax

    ; 357 / 3
    mov eax, 357
    mov ebx, 3
    xor edx, edx
    div ebx
    add ecx, eax

    ; 245 / 5
    mov eax, 245
    mov ebx, 5
    xor edx, edx
    div ebx
    add ecx, eax

    ; умножить сумму на 3
    imul ecx, 3

    ; печать результата
    PRINT_UDEC 4, ecx
    NEWLINE

    xor eax, eax
    ret