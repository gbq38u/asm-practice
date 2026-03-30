section .data
    x   dd 0
    y   dd 25
    t   dd 19
    xp  dd 0

section .text
global _start
_start:
    mov dword [xp], t
    mov eax, [xp]        
    mov ebx, [eax]      
    mov [x], ebx    
    mov ebx, [y]        
    mov [eax], ebx 
