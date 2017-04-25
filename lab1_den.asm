.model small
.data
a dw 1;слово 8 bit
b dw 3;слово 8 bit
c dw 3;слово 8 bit
d dw 2;слово 8 bit
e dw 4;слово 8 bit
x dw ?
y dw ?
.code
.486
mov ax,@data
mov ds,ax; перенос ax в ds

mov ax,d;	перенос переменной d в al 8 bit
mul ax;		первое действие d^2 результат ax 16 bit
mov bx,ax;	перенос в bx
mov al,2
mul c; 		второе действие 2*с результат в ax 16 bit
sub ax,bx; 	третье действие результат в ax 16 bit
mov bx,ax;	РЕЗУЛЬТАТ 3 ДЕЙСТВИЯ BX
;конец 3 действия

;4 действие - степень
mov ax,a;
mov cx, ax
mul ax
mul cx;		в тории результат AX
mov cx,ax;	сократим разрядность WTF
		;	РЕЗУЛЬТАТ 4 ДЕЙСТВИЯ CX

;5 действие - умножение
mov ax,7
mul cx;	результат 4 действия на 7
mov cx,ax;	РЕЗУЛЬТАТ 5 ДЕЙСТВИЯ CX

;6 действие - умножение
mov ax,3
mul bx;	результат 3 действия на 3 результат 6 ДЕЙСТВИЯ в AX 16 bit

;7 действие - сложение
add AX,CX;	результат 7 ДЕЙСТВИЯ в AX 16 bit
mov BX,AX;	результат 7 ДЕЙСТВИЯ в BX 16 bit

;8 действие - умножение
mov ax,3
mov dx,e;
mul dx;	результат 8 ДЕЙСТВИЯ в AX 16 bit

;9 действие - сложение
add AX,a;	А нет ли тут конфликта?

;10 действие - деление BX/AX
xchg ax,bx; поменять местами
cwd
idiv bx
mov x,ax
mov y,dx

mov ah,4ch; завершение программы
int 21h
end