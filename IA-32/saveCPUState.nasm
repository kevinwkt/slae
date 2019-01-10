global _start

section .text
HelloWorldProc:
    push ebp
    mov ebp, esp
    
    ; print hello world using syscall
    mov eax, 0x4
    mov ebx, 0x1
    mov ecx, message
    mov edx, len
    int 0x80

    ; mov esp, ebp
    ; pop ebp

    leave 
    ret

_start:
    mov ecx, 0x10

PrintHelloWorld:
    ; preserve registers and stack
    pushad 
    pushfd

    call HelloWorldProc

    ; recover registers and stack
    popfd
    popad

    ; Call printHelloWorld until ecx == 0
    loop PrintHelloWorld

    mov eax, 1
    mov ebx, 10
    int 0x80   

section .data
    message db "Hello World"
    len equ $-message
