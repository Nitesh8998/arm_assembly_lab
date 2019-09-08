/******************************************************************************
* file: DIVF.s
* description: brief sample program for ARM SIM DIVF
* author: Venkatesh Ravipati
* Guide: Prof. Madhumutyam IITM, PACE
******************************************************************************/

/*
  DIVF r1, r2 , #45
*/



  @ BSS section
      .bss
z: .word

  @ DATA SECTION
      .data
a: .word 1800
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
     MOV r7, #1     ; //initilize r7 to 1 for bit counter
     CMP r3, #0     ; // bail out if divider is 0
     BEQ END     
LOOP:ADD r4, r4, #1 ; //count number of Left sifts
     LSL r5, r3, r4 ; //right shift multipler
     CMP r2, r5     ; //compare divident and shifted divider, 
     BPL  LOOP      ; //if +ve we can still shft 
     LSR r5, r5, #1 ; //if -ve, we need to move back one step 
     SUB r4, r4, #1 ; //number of shifts -1
     SUB r2, r2, r5 ; //divident - divider  shifted by r4 times
     LSL r8, r7, r4 ; //divisor path 1 << by r4 times
     ADD r6, r6, r8 ; //ADD all partial factors
     CMP r2, r3     ; //repeat this until multiplier equal to 0 
     MOV r4, #0
     BPL LOOP
END: MOV r1,r6
