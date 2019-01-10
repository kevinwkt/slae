global _start

section .text
_start:
    ; scas b/w/d/q
    ; compares whats in rdi with rax
    ; if same, zero flag is set else not set
    cld
    mov rax, 0x123456789abcdef
    lea rdi, [var1]
    scasq

    lea rdi, [var2]
    scasq    

    ; cmps b/w/d/q
    ; compares what rdi points to with what rsi points
    ; zf is set if the same else not set
    cld
    lea rsi, [var1]
    lea rdi, [var3]
    cmpsq
    
    ; exit gracefully
    mov rax, 0x3c
    mov rdi, 0
    syscall

section .data
    var1 dq 0x1234567890abcdef
    var2 dq 0xfedcba1234567890
    var3 dq 0x1234567890abcdef
