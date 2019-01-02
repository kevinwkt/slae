global _start

section .text
_start:
    mov eax, 0x66778899
    mov ebx, 0x0
    mov ecx, 0x0

    ; push and pop
    
    ; register push and pop
    ; 16 bit values
    push ax
    pop bx
    
    ; 32 bit values
    push eax
    pop ecx

    ; memory push and pop
    push word [sample]
    pop ecx

    push dword [sample]
    pop edx

    ; exit the program gracefully
    mov eax, 1
    mov ebx, 0
    int 0x80

section .data
    sample: db 0xaa, 0xbb, 0xcc, 0xdd
