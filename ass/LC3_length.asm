; @param R0 adresse de la chaîne 
; @return R0 longueur de la chaîne
	.ORIG x3000
	LEA R0,chaine	; Chargement dans R0 de l'adresse de la chaîne
	NOT R1,R0       ; R1 = -R0
	ADD R1,R1,1
loop:	LDR R2,R0,0     ; Chargement dans R2 du caractère pointé par R0
	BRz fini        ; Test de fin de chaîne
	ADD R0,R0,1	; Incrémentation du pointeur : p++
	BR loop
fini:	ADD R0,R0,R1    ; Calcul de la différence q-p
chaine:	.STRINGZ "Hello World"
	.END
