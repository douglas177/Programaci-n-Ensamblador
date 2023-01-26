;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with: 
;assemble: -->> nasm -f win64 -o 2Examen.o 2Examen.asm -l 2Examen.lst
;link:	   -->> gcc -o 2Examen 2Examen.o
;run:      -->> 2Examen
;debugger: -->> x64dbg 2Examen
;path C:\Asembler\MinGW64\bin
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: 2Examen.asm (nombre programa)
extern printf,scanf

segment .data
DATO1   DB     -5,'K',-15,'s',-25


segment .bss

segment .text
global main
main:
	MOV RBX, DATO1+4
	MOV CL, 1
	MOV AL,[DATO1+1]
L2:	CMP [RBX],AL
	JC L1
	MOV Al,[RBX]
L1: DEC RBX
	INC CL 
	CMP CL,4
	JNZ L2
	OR AL, 0x3E
	MOV [RBX],AL


ret