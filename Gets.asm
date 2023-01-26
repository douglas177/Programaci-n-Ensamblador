;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with:
;assemble: -->> nasm -f win64 -o Gets.o Gets.asm -l Gets.lst
;link:	   -->> gcc -o Gets Gets.o
;run:      -->> Gets
;debugger: -->> x64dbg Gets
;path C:\Asembler\MinGW64\bin
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: Gets.asm (nombre programa)
extern printf,scanf, gets, strlen

segment .data
mensaje db "Ingresar Minuto ",10,0
MsjHora db "%d Horas ,%d Minutos",0
Msj db "Hora Invalida",10,10,0
;MsjMinutos db " ", 0

format db "%d",0
segment .bss
Minutos resd 1
segment .text
global main
main:
volver:
sub rsp,0x20
	mov rcx,mensaje
	call printf


	mov rcx,format
	mov rdx,Minutos
	call scanf

add rsp, 0x20
	cmp dword[Minutos], 0
	jge Saltar 
	
sub rsp,0x20
		
		mov rcx,Msj
		call printf

add rsp, 0x20
	jmp volver
Saltar:
	xor rax,rax
	xor rbx,rbx
	mov eax,[Minutos]
	mov bx, 60
	cdq
	div bx
	xor r10,r10
	mov r10,rdx
	mov rdx,rax
	
sub rsp,0x20

	mov rcx, MsjHora
;	mov rdx, rax
;	mov r8, MsjMinutos
	mov r8, r10
	call printf

add rsp, 0x20
ret

