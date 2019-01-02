global _start

section .text
_start:
    ; NOT
    mov rax, qword [var2]
    not rax

    mov rbx, qword [var1]
    not rbx

    ; AND
    mov rax, qword [var2]
    mov rbx, qword [var1]
    and rbx, rax
    
    mov rbx, qword [var1]
    and rbx, qword [var1]

    ; OR
    mov rax, qword [var2]
    mov rbx, qword [var1]
    or rbx, rax

    mov rbx, qword [var1]
    or rbx, qword [var1]

    ; XOR
    mov rax, 0x1010101010101010
    mov rbx, 0x0101010101010101
    xor rax, rbx

    xor rax, rax
    
    xor qword [var1], rax

    ; exit gracefully
    mov rax, 0x3c
    mov rdi, 0
    syscall

section .data
    var1 dq 0x1111111111111111
    var2 dq 0x0
