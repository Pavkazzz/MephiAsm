.model small
.stack 100h
.data
.386
    inpstr db 'aad qw a qwe qwea$' ; исходная строка
    strlen db 17
    concat db ' '
    res dd 0.0
    curspace db 0
    curpos dw 0
    razr dd 10

.code 
    mov ax,@data
    mov ds,ax
    mov es,ax

    xor dx, dx
    lea si, inpstr

    xor bx, bx
    mov bl, concat

    xor cx,cx
    mov cl, strlen

    mov edx, 10

    finit
    fld res

walk:
	lodsb
	cmp al, bl

	jnz nspace
	add curspace, 1
nspace: 

	; Вещественная часть
	cmp curspace, 1
	jnz nfsdel

	fild curpos
	faddp st(1), st(0)
	mov curpos, 0 

	add curspace, 1
	jmp nfspace

	; Остаток
nfsdel:
	cmp curspace, 3
	jnz nfspace

	sub curpos, 1

	fild curpos
	fild razr

	fdiv
	faddp st(1), st(0)

	mov eax, 10
	imul edx, eax
	mov razr, edx
	; mul razr, dx
	; mov razr
	mov curpos, 0
	mov curspace, 2
nfspace:	

	add curpos, 1
	loop walk

	; Последнее слово
	sub curpos, 1

	fild curpos
	fild razr

	fdiv
	faddp st(1), st(0)


	pop res

	mov ah, 4ch
    int 21h
end

