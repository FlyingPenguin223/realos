[org 0x7c00]
[bits 16]

mov ax,0

mov ds,ax
mov es,ax

mov bx,0x9000
mov ss,bx
mov sp,ax

call load_kernel

call kernel_start

jmp $

%include "include/disk.asm"

load_kernel:
mov bx, kernel_start ; bx -> destination
mov dh, 1            ; dh -> num sectors
call disk_load
ret

times 510 - ($ - $$) db 0
dw 0xaa55

kernel_start:

mov ah, 0x0e
mov al, 'a'
int 0x10

jmp $


times 10000 db 0
