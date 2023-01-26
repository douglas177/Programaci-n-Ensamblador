;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc -o P1 P1.o
;run:      -->> P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: P1.asm (nombre programa)

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas

a dd 220030081
b dd 123415
c dd 12345678
d dd 0x12345


		
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar

x resd 1


segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones

NEG dword [b] ;b=-b
mov eax,[b]   ;eax =-b
NOT dword [c] ;c=~c
SUB eax,[c]   ;eax=eax-(~c) 
SAR dword [d],5  ;d=d>>5

XOR eax,[d]      ;eax=eax^d
SAL dword [a],3   ;a=a<<3
mov ebx,[a]       ;ebx=a

OR ebx,eax        ;ebx=ebx | eax
SAL dword [b],2   ;b= b<<2

OR ebx,[b]        ;ebx=ebx | b
mov [x],ebx       ;x=ebx





	
ret
;---------------------------------------
;..........subrutinas....................	



