;boot.asm


[ORG 0x7C00]
[BITS 16]

start:
    mov ax, 0
    mov ds, ax
    mov es, ax
    mov si, msg
    mov ah, 0x0E

print_loop:
    lodsb
    cmp al, 0
    je halt
    int 0x10
    jmp print_loop

halt:
    cli
    hlt
    jmp halt

msg:
    db "Hello,World!", 0 

times 510-($-$$) db 0
dw 0xAA55
