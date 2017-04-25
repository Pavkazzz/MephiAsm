; 8 вар
; Дана матрица N*N. Заполнить все положительные элементы максимальным значением, а отрицательные – минимальным.

.model small
.data

mas dw 1, 2, 3
    dw 4, -1, 6
    dw 7, 8, 9

n dw 3
i dw 0
j dw 0

max dw ?
min dw ?

; ax - хранение
; bx - строка
; dx - столбец
; cx - цикл

    
.code
.486
    mov ax, @data
    mov ds, ax

    xor ax, ax
    xor bx, bx
    xor cx, cx
    mov bx, i
    mov dx, j
    mov cx, n
    xor si, si
    mov si, mas
    mov max, si
    mov min, si
    mov si, n

walk:
    mov ax, mas[bx]
    add bx, 2

    cmp ax, min
    jge aftermin
    mov min, ax

aftermin:
    cmp ax, max
    jle aftermax
    mov max, ax
aftermax:

    loop walk
    mov cx, n
    add dx, 1
    cmp dx, n
    jnz walk


    mov bx, i
    mov dx, j
    mov cx, n
    xor si, si
work:
    mov ax, mas[bx]
    cmp ax, 0

    jge aftermax2     ; <
    mov si, min
    mov mas[bx], si
aftermax2:

    jle aftermin2     ; >
    mov si, max
    mov mas[bx], si
aftermin2:

    add bx, 2
    loop work
    mov cx, n
    add dx, 1
    cmp dx, n
    jnz work

    mov ah, 4ch
    int 21h
end
