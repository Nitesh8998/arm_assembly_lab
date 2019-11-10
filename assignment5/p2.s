@ BSS section
.bss
z: .word
@ DATA SECTION
.data

STRING: .asciz "10011001" 
NUMBER:  .word 0
ERROR:  .word 0
	   
@ TEXT section
    .text

.global _main


_main:
	LDR R1,=STRING 		; @get the address of String
	EOR R3,R3,R3	
	EOR R4,R4,R4
	EOR R7,R7,R7
	MOV R6,#8 		; @NIBBLE Counter
	MOV R8,#10		;@to increase by one digit
	
StringLOOP: 				; @FOR EACH CAHARACTER IN THE STRING
		LDRB R5,[R1],#1 	; @Load each character of the string
		CMP R5, #0		; @compare whether it is End of String
		BEQ Exit		; @Branch to Exit, if the String ends
		SUB R5,R5,#0X30		; @get the value of 0 or 1 			
		MUL R4,R6,R5		; @Multiply Nibble Counter with the binary value
		ADD R7,R7,R4		; @Add to get the Decimal Digit
		CMP R6, #1		; @compare whether it is 1
		BEQ NIBBLEDone		; @Branch to NIBBLEDone		
		MOV R6,R6,LSR#1		; @Decrement Nibble Variable
		B StringLOOP
NIBBLEDone:
		MUL R3,R3,R8 		;@Mulitply 10 to increase by 1 digit
		ADD R3,R3,R7		; @Add  
		EOR R7,R7,R7
		MOV R6,#8 		; @reset NIBBLE Counter
		B StringLOOP
		 		
Exit:
	LDR R6, =NUMBER		; @Load the address of NUMBER
	STR R3, [R6]		; @Store the result in NUMBER
	SWI 0x11
	.end