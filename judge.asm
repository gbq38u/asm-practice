default rel
section .data
fmt_in   db "%ld %ld", 0
fmt_out  db "%ld", 10, 0
msg_zero db "division by zero", 10, 0
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
    mov rbx, [b]
    cmp rbx, 0
    je div_zero
    mov rax, [a]
    cqo
    idiv rbx
    lea rdi, [fmt_out]
    mov rsi, rax
    xor eax, eax
    call printf
    xor eax, eax
    add rsp, 8
    ret
div_zero:
    lea rdi, [msg_zero]
    xor eax, eax
    call printf
    xor eax, eax
    add rsp, 8
    ret