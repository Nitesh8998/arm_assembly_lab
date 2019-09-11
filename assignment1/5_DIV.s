


.global _main

_main:
      @Prog - 4
      @DIV r1, r2, #45
      @logic: repreated substraction
      @inputs are stored in R2 and R3, Output Quo in R1 and Rem in R2 
      @masks 0x7 and 0xf are selected based on the MSB of 5 and 9 
      
      MOV r2, #91
      MOV r3, #45


      MOV r6, #0
      MOV r1, #0
      @consider r4 as result

      loop:
      @check if 0 and end
      CMP r2, r6
      BEQ end
      
      CMP r2, r3
      BLT end
      SUB r2, r2, r3
      ADD r4, r4, #1

      B loop
      end:
      MOV r1, r4


