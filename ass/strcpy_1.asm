strcpy  movem.l R2-R1,-(sp)
.loop   move.b (R1)+,(R2)+
        bne.s .loop
        movem.l (sp)+,R2-R1
        rts