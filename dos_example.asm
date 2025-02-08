section .data
    exit_code db 0 ;Exit code

section .text
    global _start

_start:
    mov ax, 5
	mov bx, 3
	add ax, bx
	cmp ax, 8
	je if_equal
	sub ax, 2
	jmp quit
	
if_equal:
	mov cx, ax
	sub cx, 5
	jmp quit
	
quit:
    ;DOS exit
    mov ah, 0x4C       ;Function code to terminate program
    mov al, [exit_code] ;Exit code
    int 0x21           ;Call DOS interrupt
