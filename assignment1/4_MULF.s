


.global _main

_main:
      @Prog - 3
      @MULF r1, r2, #45
      @logic: Fast multiplication
      @inputs are stored in R2 and R3, Output is in R1 
      
      MOV r2, #2
      MOV r3, #45
      MOV r6, #0
      @consider r4 as result
      loop:
      AND r5, r2, #1
      
      CMP r5, r6
      BEQ dontadd
      ADD r4, r4, r3
      dontadd:
      LSL r3, r3, #1
      LSR r2, r2, #1

      @check if 0 and end
      CMP r2, r6
      BEQ end

      B loop
      end:
      MOV r1, r4
