global _start

section .text

HelloWorldProc:
    ; print hello world using syscall
    mov eax, 0x4
    mov ebx, 1
    mov ecx, message
    mov edx, len
    int 0x80
    ret     ; return to next instruction before call

_start:
    mov ecx, 0x10

PrintHelloWorld:
    ; call the print and loop
    push ecx
    call HelloWorldProc
    pop ecx
    loop PrintHelloWorld

    ; exit gracefully
    mov eax, 1
    mov ebx, 10
    int 0x80

section .data
    message db "Hello World!", 0xa
    len equ $-message

