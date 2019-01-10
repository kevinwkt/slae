global _start

section .text

HelloWorldProc:
    ; print hello world through syscall
    mov rax, 1
    mov rdi, 1
    mov rsi, message 
    mov rdx, len
    syscall

    ret     ; to return to where rip was before

_start:
    mov rcx, 0x10

PrintHelloWorld:
    push rcx
    call HelloWorldProc
    pop rcx
    
    loop PrintHelloWorld

    ; exit gracefully
    mov rax, 60
    mov rdi, 11
    syscall

section .data
    message db "Hello World", 0xa
    len equ $-message
