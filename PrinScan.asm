;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with: 
;assemble: -->> nasm -f win64 -o PrinScan.o PrinScan.asm -l PrinScan.lst
;link:	   -->> gcc -o PrinScan PrinScan.o
;run:      -->> PrinScan
;debugger: -->> x64dbg PrinScan
;path C:\Asembler\MinGW64\bin
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: PrinScan.asm (nombre programa)
extern printf,scanf, gets, strlen

segment .data
mensaje db "Introducir Numero",10,0
mensaje1 db"El numero es: %d",10,0
format db "%d",0
segment .bss
num resb 1
segment .text
global main
main:

sub rsp,0x20

	mov rcx,mensaje
	call printf
	
	
	mov rcx,format
	mov rdx,num
	call scanf
	
	
	mov rcx,mensaje1
	mov rdx,[num]
	call printf
	
add rsp, 0x20

ret