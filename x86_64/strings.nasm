global _start

section .text
_start:
    ; movs b/w/d/q
    ; moves from rsi to rdi
    cld
    lea rsi, [HelloWorld]
    lea rdi, [Copy]
    movsq

    ; moves from rsi to rdi byte by byte rcx times using rep
    cld
    lea rsi, [HelloWorld]
    xor rax, rax
    mov qword [Copy], rax
    lea rdi, [Copy]
    mov rcx, len
    rep movsb

    ; stos b/w/d/q
    ; stores whatever in rax to what rdi points to
    mov rax, 0x123456789abcdef
    lea rdi, [var1]
    stosq

    ; lods b/w/d/q
    ; loads from what rsi points to to rax
    xor rax, rax
    lea rsi, [var1]
    lodsq
    
    ; exit gracefully
    mov rax, 0x3c
    mov rdi, 0
    syscall

section .data
    HelloWorld db "Hello World"
    len equ $-HelloWorld

section .bss
    Copy resb len
    var1 resb 8
