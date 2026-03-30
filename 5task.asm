section .data
    A  db '1','2','3'
    nl db 10

section .text
global _start

_start:
    ; сохранить первый элемент
    mov al, [A]

    ; сдвиг влево
    mov bl, [A+1]
    mov [A], bl

    mov bl, [A+2]
    mov [A+1], bl

    mov [A+2], al

    ; вывести массив
    mov eax, 4
    mov ebx, 1
    mov ecx, A
    mov edx, 3
    int 0x80

    ; перевод строки
    mov eax, 4
    mov ebx, 1
    mov ecx, nl
    mov edx, 1
    int 0x80

    ; выход
    mov eax, 1
    xor ebx, ebx
    int 0x80