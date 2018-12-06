.ORIG x0000
	AND R0,R0,0	 ;
	LEA R0,cons2     ;R0<-3
	NOP

cons1:	.FILL 14
cons2:	.FILL 15
cons3:  .FILL 16

.END
