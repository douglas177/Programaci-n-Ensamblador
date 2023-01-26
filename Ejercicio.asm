;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with: 
;assemble: -->> nasm -f win64 -o Ejercicio.o Ejercicio.asm -l Ejercicio.lst
;link:	   -->> gcc -o Ejercicio Ejercicio.o
;run:      -->> Ejercicio
;debugger: -->> x64dbg Ejercicio
;path C:\Asembler\MinGW64\bin
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: Ejercicio.asm (nombre programa)
;registro: Ejercicio
;nombres y apellidos: 

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
 a dd 220001548
 b dd 123415
 c dd 13308976
 d dd 0x12345      ; 74565
 
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar
 x resd 1
segment .text 
global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones
; >> << Shift Aritmeticos
; >>> <<< Shift Lógicos
; ^ XOR
; ~ NOT  C1   0000 0010 = 1111 1101
; - NEG  C2	  0000 0010 = 1111 1101 + 1 = 1111 1110
; & AND  Multiplicacion 0 * 1
;x = (a<<3) & (b-(~c))
;x = (x>>2) | (d^e)
;x = ~x

	xor eax, eax
	xor ebx, ebx
	xor ecx, ecx
	xor edx, edx

	
	NOT dword [c]         ; c=~c
	
	SAL dword[a],3        ; a = (a<<3)
	MOV eax,[a]            ; eax=a;
	
	mov ebx,b            ; ebx=b
	SUB ebx,[c]          ;  ebx=b-(-c)
	 
	AND eax,ebx         ;(a<<3) & (b-(~c)
	
	mov [x],eax         ;x = (a<<3) & (b-(~c))
	
	SAR [x],2           ; x>>2
	MOV eax, dword[x]   ; eax=x;
	mov edx,[d]          ; edx=d;
	AND edx,dword[e]    ; d^e;
	
	XOR eax,edx      ;   (x>>2) | (d^e)
	NOT eax;            eax=~x
	
	mov [x],eax;
	


ret
;----------------------------------------
;..........subrutinas....................	

