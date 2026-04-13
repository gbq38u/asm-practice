section .data
    x   db 2
    a   db 7
    fmt db "q=%d r=%d", 10, 0
section .bss
    q resb 1
    r resb 1
section .text
    global main
    extern printf
main:
    mov al, [x]
    mov bl, al
    imul bl
    mov bl, 10
    imul bl
    add al, 5
    mov bl, al
    mov al, [x]
    mov dl, al
    imul dl
    imul byte [x]
    neg al
    sub al, bl
    cbw
    idiv byte [a]
    mov [q], al
    mov [r], ah
    movsx eax, byte [r]
    push eax
    movsx eax, byte [q]
    push eax
    push fmt
    call printf
    add esp, 12
    xor eax, eax
    ret