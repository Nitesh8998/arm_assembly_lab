/******************************************************************************
                       CS18M502 - Sivalingam Periasamy
 ******************************************************************************/
@ XNOR assembly program.
MOV r2, #2 @ Load the value 2 into register r2
MOV r3, #3 @ Load the value 3 into register r3
EOR r1, r2, r3 @ XOR r2 and r3 and store the result in r1
MVN r1, r1  @ Negate r1 and store in r1
