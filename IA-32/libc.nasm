extern printf
extern exit

global main

section .text
main:
    push message
    call printf
    add esp, 0x4        ; adjust the stack
    
    ; call exit
    mov eax, 0xa
    call exit

section .data
    message db "Hello World", 0xa, 0x0
    len equ $-message
