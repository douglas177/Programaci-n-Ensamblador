;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with: 
;assemble: -->> nasm -f win64 -o Ejercicio2.o Ejercicio2.asm -l Ejercicio2.lst
;link:	   -->> gcc -o Ejercicio2 Ejercicio2.o
;run:      -->> Ejercicio2
;debugger: -->> x64dbg Ejercicio2
;path C:\Asembler\MinGW64\bin
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: Ejercicio2.asm (nombre programa)
extern printf,scanf

segment data
a  dd   1235
b  dd   456
c  dd   46
d  dd   5656

segment .bss
x resd 1

segment text
global main
main:

;X = (a<<3) | (-b-(~C)^(d>>5)) | (b<<2)

XOR eax,eax;
XOR ebx,ebx;
XOR ecx,ecx;
XOR edx,edx;

Sal dword[a],3       ;a=a<<3
mov eax,[a]     ;eax=a


mov ebx,[b]       ;ebx=b;
NOT dword[c]      ;c=~C
NEG ebx           ;ebx=-b;
SAR dword[d],5       ;d=d>>5 
sub ebx,[c]       ;-b-(~C)
AND  ebx,[d]      ;-b-(~C)^(d>>5)

Sal dword[b],2        ;b<<2
mov ecx,[b]      ;ecx=b<<2;

OR eax,ebx       ;eax=   (a<<3) | (-b-(~C)^(d>>5))  
OR eax,ecx       ;eax= (a<<3) | (-b-(~C)^(d>>5)) | (b<<2)

mov [x],eax;     ;;X = (a<<3) | (-b-(~C)^(d>>5)) | (b<<2)



ret


