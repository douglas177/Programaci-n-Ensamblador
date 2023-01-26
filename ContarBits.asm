;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with: 
;assemble: -->> nasm -f win64 -o ContarBits.o ContarBits.asm -l ContarBits.lst
;link:	   -->> gcc -o ContarBits ContarBits.o
;run:      -->> ContarBits
;debugger: -->> x64dbg ContarBits
;path C:\Asembler\MinGW64\bin
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: ContarBits.asm (nombre programa)
extern printf,scanf

segment .data
a db 3,2,3,4,5
segment .bss
Paridad resb 1
segment .text
global main
main:

	xor rax,rax
	xor rbx,rbx
	xor rcx,rcx
	xor rdx,rdx

	mov rax,a
Siguiente:
	cmp bl,50
	jz MasDe50
	mov dl,[rax+rbx]
	cmp dl,0
	jz NoMasNumeros
volver:
	cmp dl,0
	jz NumeroEnCero
	shr dl,1
	jnc EsCero
	inc cl
EsCero:
	jmp volver
NumeroEnCero:
	inc rbx
	jmp Siguiente
	
NoMasNumeros:
	shr cl,1
	jnc ParidadPar
	mov byte[Paridad],0
	jmp fin
ParidadPar:
	mov byte[Paridad],1
fin:
MasDe50:
ret
