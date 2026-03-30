section .data
    a db 5
    b db -2
    c db 3
    d dw 7
section .bss
    z resw 1
section .text
global _start
_start:
    movsx ax, byte [a]     
    imul ax, 10       
    movsx bx, byte [a]     
    movsx cx, byte [b]     
    add bx, cx            
    cwd                 
    idiv bx            

    mov si, ax            

    movsx ax, byte [b]     
    imul ax, 10        
    movsx bx, byte [c]      
    add bx, [d]     

    cwd
    idiv bx           

    add ax, si
    mov [z], ax