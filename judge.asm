default rel
section .data
fmt_in  db "%llu %llu", 0
fmt_out db "%s", 10, 0
yes_str db "YES", 0
no_str  db "NO", 0
section .bss
a resq 1
b resq 1
section .text
global main
extern scanf
extern printf
main:
    sub rsp, 8
    lea rdi, [fmt_in]
    lea rsi, [a]
    lea rdx, [b]
    xor eax, eax
    call scanf
    mov rax, [a]
    add rax, [b]
    jc overflow
    lea rdi, [fmt_out]
    lea rsi, [no_str]
    xor eax, eax
    call printf
    jmp finish
overflow:
    lea rdi, [fmt_out]
    lea rsi, [yes_str]
    xor eax, eax
    call printf
finish:
    xor eax, eax
    add rsp, 8
    ret