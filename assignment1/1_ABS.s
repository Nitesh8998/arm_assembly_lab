


.global _main

_main:
      @Prog - 5
      @ABS r1, r2 @abs value of r2 in r1
      @logic:
      @inputs are stored in R2 and R3, Output is in R1 
      @masks 0x7 and 0xf are selected based on the MSB of 5 and 9 
      
      MOV r2, #-5
      MOV r4, #-1
      MOV r3, #0
      CMP r2, r3
      BLT label1
      MOV r1, r2
      B END
      label1:    MUL r1, r2,r4
      END: