; programa para encontrar char en cadena y su posición
; https://schweigi.github.io/assembler-simulator/
; ORDEN DE OUTPUTS: 
; 	1- cadena HASTA que encuentra el char buscado
;	2- la posición donde se encontró el char
; elaborado por Ericka Bermúdez
; clase Lenguaje Ensamblador UACH 

	JMP start

hello: DB "Hello World!" ; Variable
       DB 0	; String terminator

pos:
	DB 1	; guardará la posición donde se encuentra char

; ---------------- programa principal ---------------
start:
	MOV C, hello    ; Point to var 
	MOV D, 232	; Point to output
	CALL imprs	; imprimir cadena hasta char
	CALL imprc	; imprimir contador
        HLT             ; Stop execution

; ---------------- subprog. para impr. cadena hasta char -----------
imprs:			; 
	PUSH A
	PUSH B
	MOV B, 'r'	; guardamos el char para encontrar a B
.loop:
	; ### aumentar contador  		
	MOV A, [pos]	; obtener pos
	ADD A, 1	; añadir uno
	MOV [pos], A	; guardar en pos
	; ### fin de aumentar contador
	MOV A, [C]	; obtener el char del string
	MOV [D], A	; pasar a output
	INC C
	INC D 
	CMP B, [C]	; checar si se llegó al final (0)
	JNZ .loop	; volver a hacer loop si no 

	POP B
	POP A
	RET		; salir de loop

; ---------------- subprog. para impr. posición de char -----------
imprc:			
	PUSH A
	PUSH B
	INC D 		; espacio en blanco
	MOV A, [pos]	; guardamos el char para encontrar a B
	ADD A, 48	; obtenemos ascii
	MOV [D], A	; pasar a output

; ----------------- fuentes de ayuda ----------------
; https://schweigi.github.io/assembler-simulator/ (hello world)