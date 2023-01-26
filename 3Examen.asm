;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with: 
;assemble: -->> nasm -f win64 -o 3Examen.o 3Examen.asm -l 3Examen.lst
;link:	   -->> gcc -o 3Examen 3Examen.o
;run:      -->> 3Examen
;debugger: -->> x64dbg 3Examen
;path C:\Asembler\MinGW64\bin
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: 3Examen.asm (nombre programa)
extern printf,scanf

segment .data;54258ECB 57CBCC4
Registro DD 0x11;0001 0001  = 2
Carnet DD 0xF2 ; 1111 0010 = 5      7 

segment .bss
Total resb 1
;255 256 60
segment .text
global main
main:
	
	XOR RAX,RAX ; Registro
	XOR RBX,RBX ; Carnet
	XOR RCX,RCX ; contador = 2
	
	MOV EAX,[Registro]
	MOV EBX,[Carnet]

HayBits:
	SHR	EAX,1
	JNC NoEsUno
	INC CL ; CL++   CL = CL + 1
NoEsUno:	
	CMP EAX,0
	JNZ HayBits
	
	
	
HayBitsCarnet:
	SHR	EBX,1
	JNC NoEsUnoCarnet
	INC CL ; CL++   CL = CL + 1
NoEsUnoCarnet:	
	CMP EBX,0
	JNZ HayBitsCarnet
	
	MOV [Total],CL
	
ret


















;		xor rax,rax
;		xor rcx,rcx
;		Mov eax,[a]
;		
;HayBits:		
;		shr eax,1;0000 1111 =   0000 0111  CF = 1
;		jnc NoEsUno
;		inc cl
;NoEsUno:
;		cmp eax,0
;		jnz HayBits
;		
;		mov [resultado], cl
;		
;		mov eax,[]