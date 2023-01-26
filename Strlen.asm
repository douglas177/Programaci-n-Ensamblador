;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with:
;assemble: -->> nasm -f win64 -o Strlen.o Strlen.asm -l Strlen.lst
;link:	   -->> gcc -o Strlen Strlen.o
;run:      -->> Strlen
;debugger: -->> x64dbg Strlen
;path C:\Asembler\MinGW64\bin
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: Strlen.asm (nombre programa)
extern printf,scanf, gets, strlen

segment .data
arreglo1 dd 1,3,4,3,6,7,3,10,0
NoExisteMsj db 10,10,"***** Elemento a eliminar no encontrado *****",10,10,0
msj db "Insertar",0
msj1 db 10,10,"** Elemento Eliminado **",10,10,0
fmt db "%d",0
segment .bss
variable resd 1
arreglo2 resd 100

segment .text
global main
main:

sub rsp, 0x20
	mov rcx,msj
	call strlen
	
	mov rcx,fmt
	mov rdx,rax
	call printf
	
add rsp, 0x20
ret