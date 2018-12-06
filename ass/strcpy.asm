
	section        .text
		global        _start
	  
	_start:
		mov esi,strsrc
		mov edi,strdst
		mov ecx,strsrc_len
	debut:
		mov eax,[esi]
		mov [edi],eax
		inc esi
		inc edi
		loop debut
	fin:       
		mov        eax,1
		int        0x80
	  
	section .data
		strsrc db "premiere chaine",0x0A
		strsrc_len equ $ - strsrc
		strdst times strsrc_len db 0