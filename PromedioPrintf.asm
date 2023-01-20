;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with:
;assemble: -->> nasm -f win64 -o PromedioPrintf.o PromedioPrintf.asm -l PromedioPrintf.lst
;link:	   -->> gcc -o PromedioPrintf PromedioPrintf.o
;run:      -->> PromedioPrintf
;debugger: -->> x64dbg PromedioPrintf
;path C:\Asembler\MinGW64\bin
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: PromedioPrintf.asm (nombre programa)
extern printf,scanf, gets, strlen
; 

; Programa que Suma todo los valores de un arreglo mayores a 50 y menores o iguales 2000



;
segment .data
arreglo dw 30,40,52,50,100,2000,20,2001
num db 7
mensaje db "El Promedio es: %d,%d",0

;MsjMinutos db " ", 0

format db "%d",0
segment .bss
Promedio resw 1
segment .text
global main
main:
xor rax,rax
xor rbx,rbx
xor rcx,rcx
xor rdx,rdx 
xor r10,r10
xor r11,r11 

 
mov rcx,arreglo
mov dl,[num]
call promediar
mov [Promedio],ax

xor r8,r8
mov r8w,r12w
xor rdx,rdx
sub RSP,0x20
	mov rcx,mensaje
	mov dx,[Promedio]

	call printf
add RSP,0x20
ret

promediar:
	volver:
		mov r11w,[rcx + rax * 2]
		cmp r11w,51
		js saltar
		cmp r11w,2001
		jns saltar
	
			add ebx,r11d
			inc r10w
	
	saltar:
		inc rax
		cmp dx,ax
		jz fin
		jmp volver
	fin:
		xor rax,rax
		mov eax,ebx
		mov r12w,dx
		cwd
		div r10w
		

ret 
