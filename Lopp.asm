;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with:
;assemble: -->> nasm -f win64 -o Lopp.o Lopp.asm -l Lopp.lst
;link:	   -->> gcc -o Lopp Lopp.o
;run:      -->> Lopp
;debugger: -->> x64dbg Lopp
;path C:\Asembler\MinGW64\bin
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: Lopp.asm (nombre programa)
extern printf,scanf, gets, strlen

segment .data
arreglo1 dd 1,3,4,3,6,7,3,10,0
NoExisteMsj db 10,10,"***** Elemento a eliminar no encontrado *****",10,10,0
msj db 10,10,"Insertar numero a eliminar: ",0
msj1 db 10,10,"** Elemento Eliminado **",10,10,0
fmt db "%d",0
segment .bss
variable resd 1
arreglo2 resd 100

segment .text
global main
main:
xor rax,rax
xor rbx,rbx
xor rcx,rcx
xor rcx,rcx
xor r9,r9
xor r15,r15


sub rsp,0x20

	mov rcx,msj
	call printf
	
	mov rcx,fmt
	mov rdx,variable
	call scanf
add rsp,0x20

mov rcx,arreglo1
mov rdx,arreglo2
mov r8,[variable]
call eliminar

sub rsp,0x20
	;    3   0
	cmp r15,0
	jne Existe
	
	mov rcx,NoExisteMsj
	call printf
	jmp salto
	Existe:
	mov rcx,msj1
	call printf
	salto:
add rsp,0x20	


ret


eliminar:
volver:


cmp [rcx],r8d
jne Noes
	inc r15
Noes:
cmp [rcx],r8d
je saltar
	mov r9d,[rcx]
	mov [rdx],r9d
	add rdx,4         	
saltar:
	add rcx,4
	cmp dword[rcx],0
	jne volver
ret
