%macro NEWLINE 0
    push eax
    push ebx
    push ecx
    push edx

    mov eax,4
    mov ebx,1
    mov ecx, newline
    mov edx,1
    int 0x80

    pop edx
    pop ecx
    pop ebx
    pop eax
%endmacro


%macro PRINT_CHAR 1
    push eax
    push ebx
    push ecx
    push edx

    mov eax,4
    mov ebx,1
    mov ecx,%1
    mov edx,1
    int 0x80

    pop edx
    pop ecx
    pop ebx
    pop eax
%endmacro


%macro PRINT_STRING 1
    push eax
    push ebx
    push ecx
    push edx

    mov eax,4
    mov ebx,1
    mov ecx,%1
    mov edx,256
    int 0x80

    pop edx
    pop ecx
    pop ebx
    pop eax
%endmacro


%macro GET_CHAR 1
    push eax
    push ebx
    push ecx
    push edx

    mov eax,3
    mov ebx,0
    mov ecx,%1
    mov edx,1
    int 0x80

    pop edx
    pop ecx
    pop ebx
    pop eax
%endmacro


%macro GET_DEC 2
    push eax
    push ebx
    push ecx
    push edx

    mov eax,3
    mov ebx,0
    mov ecx,%2
    mov edx,16
    int 0x80

    pop edx
    pop ecx
    pop ebx
    pop eax
%endmacro


%macro GET_UDEC 2
    push eax
    push ebx
    push ecx
    push edx

    mov eax,3
    mov ebx,0
    mov ecx,%2
    mov edx,16
    int 0x80

    pop edx
    pop ecx
    pop ebx
    pop eax
%endmacro


%macro PRINT_DEC 2
    push eax
    push ebx
    push ecx
    push edx

    mov eax,%2
    call print_number

    pop edx
    pop ecx
    pop ebx
    pop eax
%endmacro


%macro PRINT_UDEC 2
    push eax
    push ebx
    push ecx
    push edx

    mov eax,%2
    call print_number

    pop edx
    pop ecx
    pop ebx
    pop eax
%endmacro


print_number:
    push ebx
    push ecx
    push edx

    mov ecx,10
    xor edx,edx
    div ecx

    add dl,'0'
    push dx

    cmp eax,0
    jne print_number

print_loop:
    pop dx
    mov [digit],dl

    mov eax,4
    mov ebx,1
    mov ecx,digit
    mov edx,1
    int 0x80

    cmp esp,ebp
    jne print_loop

    pop edx
    pop ecx
    pop ebx
    ret


section .data
newline db 10
digit   db 0