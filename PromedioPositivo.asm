;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with: 
;assemble: -->> nasm -f win64 -o PromedioPositivo.o PromedioPositivo.asm -l PromedioPositivo.lst
;link:	   -->> gcc -o PromedioPositivo PromedioPositivo.o
;run:      -->> PromedioPositivo
;debugger: -->> x64dbg PromedioPositivo
;path C:\Asembler\MinGW64\bin
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: PromedioPositivo.asm (nombre programa)
extern printf,scanf

segment .data
arreglo dd 10,-20,1,40,-50,1,-70,80,1,100,0
segment .bss
;Resultado 233
;eax = 33
;edx = 
cociente resd 1 
residuo resd 1
segment .text
global main
main:
	
	xor rax,rax
	xor rbx,rbx
	xor rcx,rcx
	xor rdx,rdx
	xor r10,r10
	xor r11,r11
	xor r8,r8
volver:
	
	mov r10,arreglo
	mov eax,[r10 + rcx * 4];byte 1 word 2 double 4 quad 8
	;10,-20,1,40,-50,1,-70,80,1,100,0
	cmp eax,0 ; CZ = 1
	sub eax,0
	jz Termina; CZ = 1
	mov r11d, eax
	shl r11d,1
	jc EsNegativo
	;    0   10
	add ebx,eax
	inc r8w
EsNegativo:	
	inc rcx
	jmp volver
Termina:
	
	mov eax,ebx
	div r8w
	mov [cociente],eax
	mov [residuo],edx

ret