


.global _main

_main:
      @Prog - 2
      @ANDN r1, r2, r3
      @logic: r1 = r2 . !r3
      @inputs are stored in R2 and R3, Output is in R1 
      @mask 0x7(111) is selected based on the position of msb in r3, here is it 5 (101)
      MOV r2, #3
      MOV r3, #5
      
      MOV r4, #0x7
      BIC r3, r4, r3
      AND r1, r2, r3


