/******************************************************************************
                       CS18M502 - Sivalingam Periasamy
 ******************************************************************************/
@ DIV assembly program.
MOV r1, #0    @ Load the value 0 into register r1
MOV r2, #360  @ Load the value 360 into register r2
loop:         @loop until r2 > 45
	SUB r2, r2, #45
	ADD r1, #1

check:
	CMP r2, #45
	BGE loop
