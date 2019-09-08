  @ Performs fast division(not by repeated subtraction) operation - DIVF r1,r2,#45
  @ This gives the approximate quotient as 1/45 is a non terminating decimal	 
  @ A more accurate result can be obtained through repeated subtraction though this method is better performance wise 
  
  @ BSS section
      .bss
z: .word

  @ DATA SECTION
      .data
a: .word 5234 

  @ TEXT section
      .text

.global _main

	 
_main:

     LDR r4, =a              ; @ Get the address of a
     LDR r2, [r4]            ; @ Get value of a
     MOV r3, #45             ; @ 1/45 = 0.02222.. = 0.0000010110110000011.. in binary = 2^(-6) + 2^(-8) + 2^(-9) + 2^(-11)..
     MOV r1, r2, ASR #6      ; @ Divide by 2^6 
     ADD r1, r1, r2, ASR #8  ; @ Divide by 2^8 
     ADD r1, r1, r2, ASR #9  ; @ Divide by 2^9 
     ADD r1, r1, r2, ASR #11 ; @ Divide by 2^11
     ADD r1, r1, r2, ASR #17 ; @ Divide by 2^17
     ADD r1, r1, r2, ASR #18 ; @ Divide by 2^18	