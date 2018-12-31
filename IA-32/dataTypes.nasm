global _start

section .text
_start:

    ; print hello
    mov eax, 0x4
    mov ebx, 0x1
    mov ecx, message
    mov edx, len
    int 0x80

    ; exit gracefully
    mov eax, 0x1
    mov ebx, 0x5
    int 0x80    

section .data

    var1: db 0xAA
    var2: db 0xBB, 0xCC, 0xDD
    var3: dw 0xEE
    var4: dd 0xAABBCCDD
    var5: dd 0x112233
    var6: times 6 db 0xFF

    message: db "Hello World!",0xA
    len: equ $-message

section .bss

    var7: resb 100 ; 100 bytes
    var8: resw 20 ; 20*2b = 40bytes


