/******************************************************************************
* file: MULF.s
* description: brief sample program for ARM SIM MULF
* author: Venkatesh Ravipati
* Guide: Prof. Madhumutyam IITM, PACE
******************************************************************************/

/*
  MULF r1, r2 , r3
*/



  @ BSS section
      .bss
z: .word

  @ DATA SECTION
      .data
a: .word 1000 
b: .word 45 

  @ TEXT section
      .text

.globl _main


_main:

     MOV r3, #45    ; //load #45 to r3 register
     LDR r4, =a     ; //get the address of a
     LDR r2, [r4]   ; //get value of a into r2
     MOV r4, #-1    ; //initilize r4 to -1 for bit counter
     MOV r6, #0     ; //initilizr r6 to 0 for final output
LOOP:AND r1, r3, #1 ; //get the LSB in to r1
     LSR r3, r3, #1 ; //right shift multipler
     ADD r4, r4, #1 ; //count number of right sifts
     CMP r1, #0     ; //compare LSB with 0
     BEQ  LOOP      ; //if LSB equal to 0, go back to LOOP 
     LSL r5, r2, r4 ; //if LSB is not 0, multiply with 2 powers. r2* 2^r4 == r2 << r4
     ADD r6, r6, r5 ; //ADD all partial factors
     CMP r3, #0     ; //repeat this until multiplier equal to 0 
     BNE LOOP
     MOV r1,r6