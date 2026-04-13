section .data
fmt_in  db "%d", 0
fmt_out db "%d ", 0

section .bss
n   resd 1
arr resd 10000

section .text
global main
extern scanf
extern printf

main:
    push ebx
    push esi

    push n
    push fmt_in
    call scanf
    add esp, 8

    xor esi, esi

read_loop:
    mov eax, [n]
    cmp esi, eax
    jge start_print

    lea eax, [arr + esi*4]
    push eax
    push fmt_in
    call scanf
    add esp, 8

    inc esi
    jmp read_loop

start_print:
    mov esi, [n]
    dec esi

print_loop:
    cmp esi, -1
    je finish

    push dword [arr + esi*4]
    push fmt_out
    call printf
    add esp, 8

    dec esi
    jmp print_loop

finish:
    pop esi
    pop ebx
    xor eax, eax
    ret