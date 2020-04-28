; programa encontrar el número mayor
; https://schweigi.github.io/assembler-simulator/
; ORDEN DE OUTPUTS: 
; 	1- número mayor encontrado
; elaborado por Ericka Bermúdez
; clase Lenguaje Ensamblador UACH 
	JMP start
; ------------ declaración de números en ASCII (48-57) ---------
; ### aquí se pueden añadir cuantos valores sean necesarios en ascii
nums:  	DB 49	; 1
	DB 51	; 3
	DB 56	; 8
	DB 50	; 2
	DB 55	; 7
	DB 0

; ------------ programa principal ---------------
	
start: 	MOV A, nums	; movemos todos los números a A
	MOV B, 0	; movemos un 0 a B porque no podemos
			; hacer la comparación directa
	
	MOV D, [A]	; inicializamos el #mayor con el primero
	CALL loop	; loop para encontrar el mayor

; ------------ loop para encontrar el mayor -------------

	

; ### ver si terminamos el programa
loop:   CMP B, [A]	; compara B con num actual
	JZ print	; si 0 (son 0s) termina

	INC A		; pasamos al siguiente 
	MOV C, D	; para comparaciones
	SUB C, [A]	; resta al mayor núm. actual
	JB  change	; si el resultado anterior < entonces
			; tenemos nuevo número mayor, cambia 	
	JMP loop	; vuelve a hacer el loop con el sig. núm
change: MOV D, [A]	; guarda el nuevo num mayor en D
	JMP loop	; vuelve al ciclo
	
print:	MOV A, 232	; pasa al output
	MOV [A],D	; imprime
	HLT		; termina el programa