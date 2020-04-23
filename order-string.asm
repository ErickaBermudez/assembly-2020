; programa para ordenar un string
; https://schweigi.github.io/assembler-simulator/
; ORDEN DE OUTPUTS: 
; 	1- cadena ordenada
; elaborado por Ericka Bermúdez
; clase Lenguaje Ensamblador UACH 
	
	JMP start

cadena:	DB "xbcya" ; cadena a ordenar
	DB 0	; terminador de la cadena

; ----------------- programa principal ----------------

start:	
	MOV C, cadena	; guardamos dir. inic. cadena en C
	ADD C, 5	; long. de la cadena, CAMBIAR si cambia cad

; ### loop para la comparación

lpSt:	DEC C		; bajamos uno para la compar. (quit. 0)
	MOV D, cadena	; guardar dir. cadena en D

orden:	MOV A, [D]	; pasa a A el valor de la cadena[i]
	CMP A, [D+1]	; comp. con el sig. valor y 0 si son iguales
	JNAE contin	; no hacer el cambio si B > A
	; ### hacer el cambio
	MOV B, [D+1]	; c = s[i];
	MOV [D+1], A	; s[i] = s[j];
	MOV [D], B	; s[j] = c;
	; ### termina hacer el cambio

; ### continuar
contin:	INC D		; pasamos al siguiente char de cad
	CMP D, C	; ver si ya termin. las compar. para i act.
	JB orden	; si es positivo (>) nos quedan, repite
	CMP C, cadena   ; compara y 0 si son iguales
	JNB lpSt;	; volver a hacer el loop si not <
	CALL imp	; imprimir cadena ya ordenada
	HLT		; terminar programa

; -------------------- subprog. para imprimir ----------------
imp:	MOV D, 232
	MOV B, 0
	MOV C, cadena
lpImp:	MOV A, [C]
	MOV [D], A
	INC C
	INC D
	CMP B, [C]
	JNZ lpImp
	RET
; ----------------- fuentes de ayuda ----------------
; https://schweigi.github.io/assembler-simulator/ (print)