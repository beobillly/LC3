
	section .text
	        global _start
               
	_start:
	        push dword msg_len
	        push dword msg
	        call write_screen
	        add esp,8
       
	        mov eax,1
	        int 80h

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
	        msg db "coucou",0x0A
	        msg_len equ $ - msg