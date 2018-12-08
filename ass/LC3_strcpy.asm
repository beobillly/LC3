; @param R1 adresse de la chaîne source
; @param R2 adresse de la chaine destination
; @return R2
        .ORIG      x3000
 
        LEA        R1,SRC
        LEA        R2,COPY
 
LOOP    LDR        R3,R1,0
        STR        R3,R2,0
        BRZ        DONE
        ADD        R1,R1,1
        ADD        R2,R2,1
        BRNZP      LOOP
 
DONE    LEA        R0,COPY
        PUTS
 
        HALT
 
SRC     .STRINGZ   "culcul"
 
COPY    .BLKW      128
 
        .END