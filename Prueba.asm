;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with: 
;assemble: -->> nasm -f win64 -o Prueba.o Prueba.asm -l Prueba.lst
;link:	   -->> gcc -o Prueba Prueba.o
;run:      -->> Prueba
;debugger: -->> x64dbg Prueba
;path C:\Asembler\MinGW64\bin
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: Prueba.asm (nombre programa)
extern printf,scanf

segment .data

datos DB -9, 0xA5, 'T', 4, "X3t"
segment .bss
d resd 1
;Resultado 233
;eax = 33
;edx = 
cociente resd 1 
residuo resd 1
segment .text
global main
main:

MOV ESI, datos+6
MOV AL, [ESI+EDX*1-3]
PUSH -5
XOR AL, 0x0C
PUSH RAX
CALL EE1
MOV ECX, [ESP]
MOV [ESI+EDX*1-3], AL
NOP ;-->> 2da. NO
ADD ESP, 8
RET

EE1:
    PUSH RBP
	MOV EBP, ESP
	CALL EE2
	MOV EBX, [EBP+8]
	SHR EBX, 2
	IMUL EAX, [EBP+12]
	POP RBP
RET

EE2: PUSH RBP
	MOV EBP, ESP
	SUB ESP, 8
	MOV dword [EBP-4], 5
	MOV EAX, [EBP-4]
	SHL EAX, 2
	MOV [EBP-8], EAX
	NOP ;-->> 1ra. NO OPERACION
	MOV ESP, EBP
	POP RBP
RET
