;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with:
;assemble: -->> nasm -f win64 -o Examen2Valores.o Examen2Valores.asm -l Examen2Valores.lst
;link:	   -->> gcc -o Examen2Valores Examen2Valores.o
;run:      -->> Examen2Valores
;debugger: -->> x64dbg Examen2Valores
;path C:\Asembler\MinGW64\bin
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: Examen2Valores.asm (nombre programa)
extern printf,scanf, gets, Examen2Valores
msjA db "Ingresar el Valor de a: ",0
msjB db "Ingresar el Valor de b: ",0
msjC db "Ingresar el Valor de c: ",0
msjX db "El valor de x es: %d",0
fmt db "%d",0
segment .data

segment .bss
a resd 1
b resd 1
c resd 1
x resd 1

segment .text
global main
main:




xor rax,rax
xor rbx,rbx
xor rcx,rcx
xor rdx,rdx
xor r8,r8
xor r9,r9
xor r10,r10
xor r11,r11
xor r12,r12
xor r13,r13
xor r14,r14

sub rsp,0x20
	
	mov rcx,msjA
	call printf
	
	mov rcx,fmt
	mov rdx,a
	call scanf
	
	mov rcx,msjB
	call printf
	
	mov rcx,fmt
	mov rdx,b
	call scanf
	
	mov rcx,msjC
	call printf
	
	mov rcx,fmt
	mov rdx,c
	call scanf
	
add rsp,0x20


mov eax,-30
mov r8d,1  ; a

cdq
imul r8d

mov r9d,2   ;b
shr r9d,3

sub eax,r9d ; eax = ((-30)*(-a)-(b>>3))
mov r12d,eax; r12d = ((-30)*(-a)-(b>>3))

xor rax,rax

mov r10d,2 ;b

mov eax,r10d
mov r11d,3 ;c
cdq
idiv r11w
;rdx = ((-b)%c)

mov r9d,2 ; b
	; a & b
and r8d,r9d ; r8d = a & b

xor rax,rax
mov eax,r8d
mov r13d,edx ;r13d = ((-b)%c)
cdq
idiv r13w

; eax = (a & b)/((-b)%c)

mov r14d,3  ;
not r14d 
or r14d,eax ;r14d =-c | (a & b)/((-b)%c)


xor r12d,r14d  ;  ((-30)*(-a)-(b>>3)) xor    -c | (a & b)/((-b)%c)

mov [x],r12d

sub rsp,0x20

	mov rcx, msjX
	mov rdx, [x]
	call printf

add rsp,0x20
ret