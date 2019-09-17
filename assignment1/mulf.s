/******************************************************************************
                       CS18M502 - Sivalingam Periasamy
 ******************************************************************************/
@ MULF assembly program.
MOV r2, #3  @ Load the value 2 into register r2
@MOV r3, #54 @ Load the value 54 into register r3
	    @ 54 - [2^5+2^4+2^2+2^1]
MOV r1, r2, LSL #5
ADD r1, r1, r2, LSL #4
ADD r1, r1, r2, LSL #2
ADD r1, r1, r2, LSL #1
