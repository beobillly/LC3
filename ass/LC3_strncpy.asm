; @param R1 adresse de la chaîne source
; @param R2 adresse de la chaine destination
; @return R2
        .ORIG      x3000
 
        
        AND        R4, R4, 0
        ST         R4, i
        LEA        R1,SRC
        LEA        R2,COPY
 
TEST    LD         R4,i
        LD         R0,LIMIT
        NOT        R0,R0     
        ADD        R0,R0,1
        ADD        R4,R4,R0

        BRzp       END       

        LDR        R3,R1,0
        STR        R3,R2,0
        ADD        R1,R1,1
        ADD        R2,R2,1

        INCR       LD  R4,i   
        ADD        R4,R4,1 
        ST         R4,i  

        BR TEST
        END
        HALT
 
SRC     .STRINGZ   "culcul"

i       .FILL      0
LIMIT   .FILL      4
COPY    .BLKW      32

 
        .END