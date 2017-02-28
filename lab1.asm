; (5 * (a^2 + b)^2 + a * (2 * c - d^2)^2)
; / (4 * e^2)

.model small
.data 
    a dw 5
    b dw 7
    c dw 3
    d dw 2
    e dw 6
    x dw ?
    y dw ?
.code
.486
    mov ax, @data
    mov ds, ax 
    
    mov ax, a
    imul a    ; ax = a * a
    add ax, b ; ax = a^2 + b
    imul ax   ; ax = (a^2 + b)^2

    mov bx, ax
    mov al, 5
    mul bx   ; ax = 5 * (a^2 + b)^2
    mov cx, ax

    ; правая часть числителя
    mov ax, d
    mul d    ; ax = d^2
    mov bx, ax

    mov ax, 2
    imul c    ; ax = c*2

    sub ax, bx ; ax = (2 * c - d^2)
    imul ax    ; ax = (2 * c - d^2)^2
    imul a     ; ax = a * (2 * c - d^2)^2

    add ax, cx 
    mov bx, ax

    ;; Знаменатель
    mov ax, e
    imul e ;; ax = e^2

    mov ax, 4
    imul ax   ; ax = 4 * e^2 ???

    xchg ax, bx
    cwd ; ax -> (dx;ax)
    idiv bx ; частное: ax, остаток: dx
    mov x, ax
    mov y, dx
    mov ah, 4ch
    int 21h
end