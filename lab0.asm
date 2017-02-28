; ((A + B)^2) / (3*C)

.model small
.data 
    a db 5
    b db 7
    c db -3
    d dw ?
    e dw ?
.code
.486
    mov ax, @data
    mov ds, ax 
    mov al, a
    add al, b ; al = a + b
    imul al ; ax = al * al
    mov bx, ax
    mov al, 3
    imul c ;; ax = 3 * C
    xchg ax, bx
    cwd ; ax -> (dx;ax)
    idiv bx ; частное: ax, остаток: dx
    mov d, ax
    mov e, dx
    mov ah, 4ch
    int 21h
end