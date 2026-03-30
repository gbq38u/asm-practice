section .bss
buf     resb 32
outbuf  resb 16
section .text
global main
main:
    mov rax, 0
    mov rdi, 0
    mov rsi, buf
    mov rdx, 32
    syscall
    xor rax, rax
    xor r8, r8
read_loop:
    mov bl, [buf + r8]
    cmp bl, '0'
    jb parse_done
    cmp bl, '9'
    ja parse_done
    imul rax, rax, 10
    sub bl, '0'
    movzx rbx, bl
    add rax, rbx
    inc r8
    jmp read_loop
parse_done:
    and rax, 65535
    cmp rax, 0
    jne convert
    mov byte [outbuf], '0'
    mov rax, 1
    mov rdi, 1
    mov rsi, outbuf
    mov rdx, 1
    syscall
    xor eax, eax
    ret
convert:
    mov r9, outbuf + 15
    xor rcx, rcx
convert_loop:
    xor rdx, rdx
    mov rbx, 10
    div rbx
    add dl, '0'
    dec r9
    mov [r9], dl
    inc rcx
    test rax, rax
    jnz convert_loop
    mov rax, 1
    mov rdi, 1
    mov rsi, r9
    mov rdx, rcx
    syscall
    xor eax, eax
    ret