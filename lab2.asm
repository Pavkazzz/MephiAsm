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

    mov ecx, num
    xor di, di

next_byte:
    xor bx, bx
    xor ax, ax
    mov si, 2
    mov al, cl

    test al, 00000001b
    jnz not_null
    not al
    mov cl, al  

not_null:

circle: 
    xchg ax, bx
    mul si
    xchg ax, bx
    div si
    or ax, ax
    jnz circle
    cmp bl, cl ; Сравниваем с исходным

    jnz no_poly
    add di, 1

no_poly:
    
    shr ecx, 8

    or ecx, ecx
    jnz next_byte



    mov ah, 4ch
    int 21h
end