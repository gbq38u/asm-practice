%include "io.inc"

section .data
    msg db "Result:", 0

section .bss
    sym     resb 1
    s_num   resd 1
    u_num   resd 1

section .text
global CMAIN
CMAIN:
    ; ввести символ
    GET_CHAR [sym]

    ; ввести число со знаком
    GET_DEC 4, [s_num]

    ; ввести число без знака
    GET_UDEC 4, [u_num]

    ; вывести строку
    PRINT_STRING msg
    NEWLINE

    ; вывести символ
    PRINT_CHAR [sym]
    NEWLINE

    ; вывести число со знаком
    PRINT_DEC 4, [s_num]
    NEWLINE

    ; вывести число без знака
    PRINT_UDEC 4, [u_num]
    NEWLINE

    xor eax, eax
    ret