global _start

section .text
_start:
    ; copy string from what edi points to from what esi points to byte by byte 
    mov ecx, len
    lea esi, [source]
    lea edi, [destination]

    cld     ; clear direction flag
    rep movsb

    ; print hello world using syscall
    mov eax, 0x4
    mov ebx, 0x1
    mov ecx, destination
    mov edx, len
    int 0x80

    ; stringcmp using cmps b/w/d
    mov ecx, len
    lea esi, [source]
    lea edi, [comparison]
    repe cmpsb  ; Decrements ecx if byte is equal

    ; if all bytes are equal ecx should be 0.

    jz SetEqual ; Checks to see if everything was the same by checking ecx to jmp
    mov ecx, result2
    mov edx, result2Len
    jmp Print

SetEqual:
    mov ecx, result1
    mov edx, result1Len

Print:
    ; print syscall
    mov eax, 0x4
    mov ebx, 0x1
    int 0x80

    ; sys_exit syscall
    mov eax, 1
    mov ebx, 10
    int 0x80
    

section .data
    source db "Hello World!", 0xa
    len equ $-source
    
    comparison db "Hello"

    result1 db "Strings are equal", 0xa
    result1Len equ $-result1

    result2 db "Results are unequal", 0xa
    result2Len equ $-result2

section .bss    
    destination resb 100
