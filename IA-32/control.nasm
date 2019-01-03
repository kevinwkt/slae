global _start

section .text
_start:
    jmp Begin 

NeverExecute:
    mov eax, 0x10
    xor ebx, ebx

Begin:
    mov eax, 0x5

PrintHW:
    push eax
    
    ; Print hello world using write syscall
    mov eax, 0x4
    mov ebx, 1
    mov ecx, message    
    mov edx, len
    int 0x80

    pop eax
    dec eax
    jnz PrintHW
    
    ; exit gracefully
    mov eax, 0x1
    mov ebx, 0xa
    int 0x80

section .data
    message db "Hello World! "
    len equ $-message
