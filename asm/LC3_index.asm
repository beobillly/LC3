; @param R2 adresse du caractere 
; @param R1 adresse de la chaine
; @return R0 adresse de la premiere occurrence du caractère
	.ORIG x3000
	LEA R1,chaine	; Chargement dans R1 de l'adresse de la chaîne
	LD R2,caract	; Chargement dans R2 du code ASCII de 'l'
	AND R0,R0,0     ; Mise à 0 du compteur
	NOT R2,R2       ; Calcul de l'opposé de R2
	ADD R2,R2,1	    ; R2 = -R2
loop:	LDR R3,R1,0     ; Chargement dans R3 du caractère pointé par R1
	BRz fini        ; Test de fin de chaîne
	ADD R3,R3,R2    ; Comparaison avec 'l'
	BRnp suite      ; Non égalité
	HALT
suite:	ADD R1,R1,1	; Incrémentation du pointeur
        ADD R0,R0,1     ; Incrémentation du compteur
	BR loop

fini:	AND R0,R0,0
        HALT
chaine:	.STRINGZ "Hello World"
caract:	.STRINGZ "w"
	.END
