.ORIG x3000

	AND R0,R0,0
	BRz fun1
	ADD R0,R0,10
	

fun1:	ADD R0,R0,1
	BRp fun2
	

fun2:	ADD R0,R0,1
	BRz fin
	ADD R0,R0,-3
	BRn fun3
	

fun3:	ADD R0,R0,-1
fin: 	NOP
	
.END
