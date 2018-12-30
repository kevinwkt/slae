; Hello World ASM

global _start

section .text

_start:
    ; print
    mov eax, 0x4
    mov ebx, 0x1
    mov ecx, message
    mov edx, len
    int 0x80 ;syscall in x86

    ; exit
    mov eax, 0x1
    mov ebx, 0x5
    int 0x80

section .data
    
    message: db "Hello World!"
    len: equ $-message
