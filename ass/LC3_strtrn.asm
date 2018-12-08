; @param R1 adresse de la chaîne source
; @param R2 adresse de la chaine destination
; @return R2
        .ORIG      x3000
 
        LEA        R1,SRC
        LEA        R2,COPY
        LD         R0,DEC
        ADD        R1,R1,R0
        LD         R4,FIN

LOOP_D  LDR        R3,R1,0
        STR        R3,R2,0
        BRZ        DONE_D
        ADD        R4,R4,1
        ADD        R1,R1,1
        ADD        R2,R2,1
        BRNZP      LOOP_D

DONE_D  LEA        R1,SRC
        
LOOP    LDR        R3,R1,0
        STR        R3,R2,0
        ADD        R4,R4,-1
        BRNZ       DONE
        ADD        R1,R1,1
        ADD        R2,R2,1
        BRNZP      LOOP
 
DONE    HALT

DEC     .FILL      4
SRC     .STRINGZ   "culcul"
COPY    .BLKW      32
FIN     .FILL      2
        .END