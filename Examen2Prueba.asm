;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with: 
;assemble: -->> nasm -f win64 -o Examen2Prueba.o Examen2Prueba.asm -l Examen2Prueba.lst
;link:	   -->> gcc -o Examen2Prueba Examen2Prueba.o
;run:      -->> Examen2Prueba
;debugger: -->> x64dbg Examen2Prueba
;path C:\Asembler\MinGW64\bin
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: Examen2Prueba.asm (nombre programa)
extern printf,scanf

segment .data;34.227     R = 4889 HEX 1319
a dq 101,1,-312,1,50,-95,25,4592
b dq 1
c dq -1
segment .bss
promedio resq 1
segment .text
global main
main:
	XOR RAX,RAX
	XOR RBX,RBX
	XOR RCX,RCX
	XOR RDX,RDX
	XOR R10,R10
	
	MOV RCX,a
VOLVER:
	
	MOV RAX,[RCX + RBX * 8]
	CMP RBX,8
	JZ SALIR
	IMUL QWORD[b]
	ADD RAX,[c]
	
	ADD R10,RAX
	INC RBX
	JMP VOLVER
SALIR:
	DEC RBX
	MOV RAX,R10
	CDQ
	IDIV EBX
	
	MOV [promedio],RAX

ret




