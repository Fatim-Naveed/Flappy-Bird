[org 0x0100]
jmp start

start:
	
	;call background
	call bird

mov ax, 0x4c00 ; terminate program
int 0x21


	
bird:
	mov ah, 0   ; set display mode function.
mov al, 13h ; mode 13h = 320x200 pixels, 256 colors.
int 10h     ; set it!
;hide blinking text cursor:
mov ch, 32
mov ah, 1
int 10h
; show standard blinking text cursor:
mov ch, 6
mov cl, 7
mov ah, 1
int 10h
; show box-shaped blinking text cursor:
mov ch, 0
mov cl, 7
mov ah, 1
int 10h

ret
; note: some bioses required CL to be >=7,
; otherwise wrong cursor shapes are displayed.