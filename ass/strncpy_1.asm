strncpy movem.l R2-R1,-(sp)
        subq.l #1,R0
.loop   move.b (R1)+,(R2)+
        beq.s .ret
        dbra R0,.loop
.ret    movem.l (sp)+,R2-R1
        rts