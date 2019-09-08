/******************************************************************************
* file: XNOR.s
* description: brief sample program for ARM SIM XNOR
* author: Venkatesh Ravipati
* Guide: Prof. Madhumutyam IITM, PACE
******************************************************************************/

/*
  XNOR r1, r2 , r3
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
     LDR r3, [r4]   ; //get value of b into r3
     EOR r4, r2, r3 ; //XOR r2 ans r3, value in r4
     MVN r1, r4     ; //move negation of r4 in to r1.
     