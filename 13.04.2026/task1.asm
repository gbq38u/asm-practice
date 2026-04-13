section .data
    x   dd 0
    y   dd 25
    t   dd 19
    xp  dd 0
    fmt db "%d %d", 10, 0
section .text
    global main
    extern printf
main:
    mov dword [xp], t
    mov eax, [xp]
    mov ebx, [eax]
    mov [x], ebx
    mov eax, [y]
    mov ebx, [xp]
    mov [ebx], eax
    push dword [ebx]
    push dword [x]
    push fmt
    call printf
    add esp, 12
    xor eax, eax
    ret