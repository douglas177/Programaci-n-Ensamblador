;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with: 
;assemble: -->> nasm -f win64 -o Multiplo.o Multiplo.asm -l Multiplo.lst
;link:	   -->> gcc -o Multiplo Multiplo.o
;run:      -->> Multiplo
;debugger: -->> x64dbg Multiplo
;path C:\Asembler\MinGW64\bin
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: Multiplo.asm (nombre programa)
extern printf,scanf

segment .data
arreglo1 dd 10,15,20,25,30,0
k dw 2
segment .bss
arreglo2 resd 1
segment .text
global main
main:

	xor rax,rax
	xor rbx,rbx
	xor rcx,rcx
	xor r10,r10
	xor r12,r12
	xor r8,r8
	
	;403010  403014
volver:	
	cmp r8b,100
	jz MasDeCien
	
	mov r10,arreglo1	
	mov eax,[r10 + rcx]
	cmp eax,0;0 CZ = 1
	jz Termino ; 1
	cwd
	idiv dword[k]; 10/2
	;eax  = 5 
	;edx = 0
	cmp edx,0 ; CZ = 1 CZ = 0
	jnz EsImpar ; 0
	;407030  407034
	mov eax,[r10 + rcx]
	Mov [arreglo2 + r12 * 4],eax
	inc r12
EsImpar:	
	add rcx,4
	inc r8b
	jmp volver
Termino:
MasDeCien:
ret