;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with:
;assemble: -->> nasm -f win64 -o InsertScanF.o InsertScanF.asm -l InsertScanF.lst
;link:	   -->> gcc -o InsertScanF InsertScanF.o
;run:      -->> InsertScanF
;debugger: -->> x64dbg InsertScanF
;path C:\Asembler\MinGW64\bin
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: InsertScanF.asm (nombre programa)
extern printf,scanf, gets, strlen

segment .data
mensaje1 db "Escribir el numero de datos que va a ingresar ",10,0
mensaje db "Ingresar el siguiente dato: ",10,0

;MsjMinutos db " ", 0

format db "%d",0
segment .bss
Arreglo resq 10
Dimension resw 1
segment .text
global main
main:
xor rax,rax
xor rbx,rbx
xor rcx,rcx
xor rdx,rdx 
xor r10,r10
xor r11,r11 

sub rsp,0x20

	mov rcx,mensaje1
	call printf
	
	mov rcx,format
	mov rdx,Dimension
	call scanf
volver:	
	
	inc rax
	mov rcx,mensaje
	call printf
	
	dec rax
	mov rcx, format
	mov rdx, Arreglo
	call scanf
	
	inc rax
	cmp rax,[Dimension]
	jnz volver
	
add rsp,0x20

ret 
