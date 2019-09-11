


.global _main

_main:
      @Prog - 1
      @XNOR r1, r2, r3
      @logic: r1 = (r2 . r3) + (!r2 . !r3)
      @inputs are stored in R2 and R3, Output is in R1 
      @masks 0x7 and 0xf are selected based on the MSB of 5 and 9 
      
      MOV r2, #5
      MOV r3, #9
      AND r1, r2, r3
      MOV r5, #7
      BIC r2, r5, r2
      MOV r5, #0xf
      BIC r3, r5, r3
      AND r4, r2, r3

      ORR r1, r1, r4


