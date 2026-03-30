section .data
msg db "Hello",10
len equ $-msg

section .bss
buf  resb 100
char resb 1

section .text
global _start

_start:

; вывести строку
mov eax,4
mov ebx,1
mov ecx,msg
mov edx,len
int 0x80

; ввести строку
mov eax,3
mov ebx,0
mov ecx,buf
mov edx,100
int 0x80

; вывести строку
mov eax,4
mov ebx,1
mov ecx,buf
mov edx,100
int 0x80

; выход
mov eax,1
xor ebx,ebx
int 0x80