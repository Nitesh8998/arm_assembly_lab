/******************************************************************************
                       CS18M502 - Sivalingam Periasamy
 ******************************************************************************/
@ ABS assembly program.
MOV r2, #-10    @ Load the value -3 into register r2
CMP r2, #0	@ Compare if value greater than zero
BGE retain	@ If Greater than Zero go to retain section
MVN r2, r2      @ 1's complement (Negation)
ADD r2, r2, #1  @ 2's complement (Abs)
retain:
	MOV r1, r2