; calculadora (suma, resta, división & multiplicación)
; https://schweigi.github.io/assembler-simulator/
; muestra resultados de hasta de 2 digitos
; ORDEN DE OUTPUTS: 
; 	1- suma
;	2- resta
;	3- división
;	4- multiplicación
; elaborado por Ericka Bermúdez
; clase Lenguaje Ensamblador UACH 

; ------------------- inicialización de variables ----------------
JMP start
NUM1:	DB 8	; debe de ser el número MAYOR o el programa fallará
NUM2:	DB 2	; debe de ser el número MENOR o el programa fallará

; ------------------- programa principal ----------------
start:
	MOV D, 232	; establecer otuput 
	
	; ### suma 
	CALL reset 	; 	
	CALL suma	; subprograma suma
	CALL impr	; subprograma para imprimir
	
	; ### resta
	CALL reset	;
	CALL resta	; subprograma resta
	CALL impr	; subprograma para imprimir
	
	; ### división
	CALL reset	;
	CALL div	; subprograma división
	CALL impr	; subprograma para imprimir
	
	; ### multiplicación 
	CALL reset	;
	CALL mult	; subprograma multiplicación
	CALL impr	; subprograma para imprimir
	
	HLT		; detener procesador

; ------------------- variables originales a reg. ----------------
; (quita los valores de los resultados)
reset:
	MOV A, [NUM1]	;
	MOV B, [NUM2]	;
	RET		; salir de reset


; ------------------- operaciones ------------------
suma:
	ADD A, B	; guardar suma en A
	RET		; termina suma

resta:
	SUB A, B	; guardar resta en A
	RET		; termina resta

div:
	DIV B		; guardar división A
	RET		; termina división

mult:
	MUL B		; guardar multiplicación en A
	RET		; termina multiplicación

; ------------------- impresión ----------------
impr:
	; ### primer digito 
	MOV C, A	; guardamos A en C
	DIV 10		; como imprimiremos en decimal div. /10
	MOV B, A	; guardamos en B
	ADD A, 48	; obtenemos ascii
	MOV [D], A	; se pasa a output
	INC D		; aumentamos D para el sig. número
	
	; ### segundo digito 
	MOV A, B	; guardamos B en A
	MUL 10		; por formato decimal	
	SUB C, A	; restamos A a C (obt. el 2ndo num)
	ADD C, 48	; obtenemos ascii
	
	MOV [D], C	; se pasa a output
	ADD D, 2	; aumentamos D incluyendo esp. blanco
	RET		; termina impresión

; ----------------- fuentes de ayuda ----------------
; https://gist.github.com/9nut/803aa74a8963c38bf216133001f553d0
; https://gist.github.com/topher6345/02a952fc41de5e2381da