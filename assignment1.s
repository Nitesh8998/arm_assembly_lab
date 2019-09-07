/******************************************************************************
* file: assignment1.s
* author: Prakash Tiwari CS18M513
* Guide: Prof. Madhumutyam IITM, PACE
******************************************************************************/

/*
To write an ARM code to simulate the behavior of the following instructions.
1. XNOR r1 , r2 , r3
2. Bit-wise and of r2 and !r3 (compliment of r3)
   ANDN r1 , r2 , r3
3. Fast multiplication i.e without MUL r1 = r2*54
   MULF r1 , r2 , #54
4. Fast division, r1 = r2/54
   DIV r1 , r2 , #54
5. Absolute Value
   ABS r1 , r2 @absolute value of r2 in r1
*/

  @ BSS section
      .bss
sum: .word

  @ DATA SECTION
      .data
a: .word 600
b: .word 200
c: .word -15

  @ TEXT section
      .text

.globl _main


_main:

   @ XNOR r1 , r2 , r3
   
   LDR r4, =a
   LDR r2,[r4]
   LDR r5, =b
   LDR r3,[r5]
   EORS r1,r2,r3
   MVN  r1,r1
   
   @ ANDN r1 , r2 , r3
   
   MVN r3,r3
   AND r1,r2,r3   

   @ MULF r1 , r2 , #54
   LDR r4, =a
   MOVS r3, #54
   MOVS r1,#0
   MOVS r5,#0

loop_mul:   
   LDR r2,[r4]
   CMP r3,#0
   BEQ exit_loop_mul
   TST r3,#1
   BEQ out_if
   LSL r2,r2,r5
   ADD r1,r1,r2
out_if:   
   ADDS r5,r5,#1
   ASRS r3,r3,#1
   b loop_mul

exit_loop_mul:   
   
   @ DIV r1 , r2 , #54
   
   LDR r4, =a
   LDR r2,[r4]
   MOVS r3, #54
   MOVS r1,#0
   
loop_div:   
   CMP r2,r3
   BLE exit_loop_div
   SUBS r2,r2,r3
   ADDS r1,r1,#1   
   b loop_div   

exit_loop_div:


@ ABS r1 , r2 @absolute value of r2 in r1
   LDR r6, =c
   LDR r2,[r6]
   CMP r2,#0
   BGE positive_no
   RSBS r2,r2,#0

positive_no:   
   STR r2,[r1]