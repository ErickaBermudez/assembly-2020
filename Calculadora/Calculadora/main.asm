; programa para hacer operaciones básicas de suma, resta, multiplicación y división
; AtmelStudio con ATmega32
; ORDEN DE OUTPUTS: 
; 	1- suma
;	2- resta
;	3- multiplicación
;	4- división
; elaborado por Ericka Bermúdez
; clase Lenguaje Ensamblador UACH 

Start:
	; Inicialización
	LDI R16, 4;
	LDI R17, 2;

	; SUMA 
	MOV R18, R16; // para guardar el resultado
    ADD R18, R17;
	OUT PORTB, R18;

	; RESTA
	MOV R19, R16; // para guardar el resultado
    SUB R19, R17;
	OUT PORTB, R19;

	; MULTIPLICACIÓN
	; multiplicación guarda en R0/R1
	MUL R16, R17;
	OUT PORTB, R0;

	; DIVISIÓN
	MOV R21, R16; para guardar el resultado
	CLR R22; cociente de nuestra división

	div:	INC R22;
			SUB R21, R17;
			BRCC div; If C = 0 then PC ? PC + k + 1, else PC ? PC + 1
			DEC R22;
			ADD R21, R17;
	OUT PORTB, R22;
