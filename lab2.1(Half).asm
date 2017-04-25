;; 8. Задано двойное слово. Подсчитать, сколько байт в нем являются палиндромами.


; si - 10
; ax, bx, si, dx - для работы цикла
; cx - для хранения byte текущего
; di - для ответа
; bp - для сдвига byte

.model small
.data 
	; num dd 60
    num dd 49980
    ; res dw ?
    ; num dw -1

.code
.486
    mov ax, @data
    mov ds, ax 

    mov eax, num
    xor di, di

next_byte:
    xor bx, bx
    mov si, 2
    mov cl, al

    test cx, 00000001b
    jnz not_null
    not cl
    mov al, cl  

not_null:

circle: 
	xchg ax, bx
	mul si
	xchg ax, bx
	xor dx, dx
	div si
	add bx, dx
	or ax, ax
	jnz circle
	cmp bx, cx ; Сравниваем с исходным

	jnz no_poly
	add di, 1

no_poly:
	
	shr eax, 8

	or eax, eax
	jnz next_byte



    mov ah, 4ch
    int 21h
end