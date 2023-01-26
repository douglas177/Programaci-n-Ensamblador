;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with: 
;assemble: -->> nasm -f win64 -o Examen1Prueba.o Examen1Prueba.asm -l Examen1Prueba.lst
;link:	   -->> gcc -o Examen1Prueba Examen1Prueba.o
;run:      -->> Examen1Prueba
;debugger: -->> x64dbg Examen1Prueba
;path C:\Asembler\MinGW64\bin
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: Examen1Prueba.asm (nombre programa)
extern printf,scanf

segment .data;34.227     R = 4889 HEX 1319
a DD 1151,1,319,-2200,20764,1,-609,1,11990,-55
segment .bss
Promedio resd 1
segment .text
global main
main:
		xor rax,rax
		xor rbx,rbx
		xor rcx,rcx
		xor rdx,rdx
		xor r10,r10
		xor r11,r11
Volver:		
		MOV eax,[a+ebx]
		cmp eax,0
		jz EsCero
		MOV edx,eax
		
		shl edx,1
		JC Negativo
		ADD r10d,eax
		inc r11w
Negativo:
		add ebx,4
		jmp Volver
EsCero:		
		Mov eax,r10d
		cdq
		div r11w
		
		MOV [Promedio],eax
	
ret











