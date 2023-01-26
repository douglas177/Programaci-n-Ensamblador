;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with: 
;assemble: -->> nasm -f win64 -o 1Examen.o 1Examen.asm -l 1Examen.lst
;link:	   -->> gcc -o 1Examen 1Examen.o
;run:      -->> 1Examen
;debugger: -->> x64dbg 1Examen
;path C:\Asembler\MinGW64\bin
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: 1Examen.asm (nombre programa)
extern printf,scanf

segment .data
a  DW   2,6
b  DW   -20

segment .bss

segment .text
global main
main:
	MOV AX,[a]
	MOV BX ,[a+2]
	ADD AX,BX
	MOV CX, 2
	CWD
	IDIV CX
	SUB BX,DX
	IMUL BX,2
	IMUL BX
	DEC AX
	SUB AX,3
	SHL AX,2
	MOV BX, [b]
	SAR BX,2

ret


