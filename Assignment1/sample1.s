
/******************************************************************************
* file: sample1.s
* description: brief sample program for ARM SIM
* author: G S Nitesh Narayana
* Guide: Prof. Madhumutyam IITM, PACE
******************************************************************************/

/*

z = (a << 2) | (b & 15);
  
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

     LDR r4, =a   ; get the address of a
     LDR r0, [r4] ; get value of a
     MOV r0, r0, LSL #2 ; perform shift
     LDR r4, =b
     LDR r1, [r4] ; get value b
     AND r1, r1, #15 ; perform AND
     ORR r1, r0, r1
     LDR r4, =z
     STR r1, [r4]
