section        .text
    global        _start
	  
_start:
    mov esi,R1
    mov edi,R2
    mov ecx,R0
debut:
    mov eax,[esi]
    mov [edi],eax
    inc esi
    inc edi
    loop debut
fin:       
    push dword R0
    push dword R2
    call write_screen
    add esp,8

    mov eax,1
    int 80h

    mov        eax,1
    int        0x80

write_screen:
	        push ebp
	        mov ebp,esp

	        mov eax,4
	        mov ebx,1
	        mov ecx,[ebp + 8]
	        mov edx,[ebp + 12]
	        int 80h
	
	        mov esp,ebp
	        pop ebp
	        ret
    
section .data
    R1 db "premiere chaine",0x0A
    R0 equ $ - R1
    R2 times R0 db 0