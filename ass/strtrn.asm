section        .text
    global        _start
    
_start:
    mov esi,R1
    mov edi,R2
    mov ecx,R0

debut:
    inc esi
    loop debut

suite:

    mov ecx,(R0_bis-R0-2)

debut_trn:
    mov eax,[esi]
    mov [edi],eax
    inc esi
    inc edi
    loop debut_trn

suite_2:
    mov esi,R1
    mov ecx,R0
    
fin_trn:
    mov eax,[esi]
    mov [edi],eax
    inc esi
    inc edi
    loop fin_trn

fin:     
    mov eax,'\0'
    mov [edi],eax
    push dword R0_bis
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
    R0 equ 4
    R0_bis equ $ - R1 
    R2 times R0 db 0