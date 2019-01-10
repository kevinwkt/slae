global _start

section .text
_start:
    jmp Begin

NeverExecute:
    mov eax, 0x10
    xor ebx, ebx

Begin:
    mov ecx, 0x5

PrintHW:
    push ecx
    
    ; Print Hello World
    mov eax, 0x4
    mov ebx, 1
    mov ecx, message
    mov edx, len
    int 0x80

    pop ecx
    loop PrintHW
    
    ; sys_exit syscall
    mov eax, 0x1
    mov ebx, 0xa
    int 0x80

section .data
    message db "Hello World",0xa
    len equ $-message
