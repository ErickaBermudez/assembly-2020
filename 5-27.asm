
; programa para encontrar en que posicion se encuentra el primer valor alto (1) de un valor hexadecimal
; El problema 27 del cap. 5 del libro The AVR Microcontroller and Embedded Systems Using Assembly and C: Using Arduino UNO & Atmel Studio
; http://nicerland.com/
; AtmelStudio con ATmega32
; ORDEN DE OUTPUTS: 
; 	1 - posicion en la que se encontro el primer valor alto
; elaborado por Ericka Bermudez
; clase Lenguaje Ensamblador UACH 

	SBI DDRB, 1		; bit 1 del puerto B es output
	LDI R20,0x68	; R20 0 el valor a enviar
	LDI R21, 0x00	; para guardar la posicion
	LDI R22, 0x01	; UNO
	
	CLC				; limpiamos la bandera del carry
	LDI R16, 8		; el numero de bits que vamos a utilizar

AGAIN:
	ADD R21, R22	; contador de la posicion
	ROR R20			; mandamos el LSB a la bandera de C
	BRCS FND		; si C = 1 encontramos ya el high
	JMP NEXT		; vamos al siguiente
NEXT:
	DEC R16			; decrementa R16 (los 8 bits)
	BRNE AGAIN		; si R16 no es cero entonces hacemos el ciclo de nuevo
HERE: 
	OUT PORTB, R21	; imprimimos la posicion en la que lo encontramos
	JMP FND			; terminamos

; output para 0x68: 0x04