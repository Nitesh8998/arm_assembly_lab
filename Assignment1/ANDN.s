/******************************************************************************
* file: ANDN.s
* description: brief sample program for ARM SIM ANDN
* author: Venkatesh Ravipati
* Guide: Prof. Madhumutyam IITM, PACE
******************************************************************************/

/*
  ANDN r1, r2 , r3
*/



  @ BSS section
      .bss
z: .word

  @ DATA SECTION
      .data
a: .word 5234 
b: .word 5124 

  @ TEXT section
      .text

.globl _main


_main:

     LDR r4, =a     ; //get the address of a
     LDR r2, [r4]   ; //get value of a in to r2
     LDR r4, =b     ; //get the address of a
     LDR r5, [r4]   ; //get value of b into r5
     MVN r3, r5     ; //move negation of r5 in to r3.
     AND r1, r2, r3 ; //AND r2 ans r3, value in r1
     