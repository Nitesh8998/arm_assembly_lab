/******************************************************************************
* file: xnor and  AND (wih negation for one operand) (Questions 1, 2)
* question 5 - ABS instruction effet
* author:  Badrinath. D (CS18M527)
******************************************************************************/

/*
   assignment 1 
   different sections are as shown
*/

  @ BSS section
      .bss
sum: .word

  @ DATA SECTION
      .data
      number: .word 51234
      xnorop1: .word 0x5555
      snorop2: .word 0xaaaa

  @ TEXT section
      .text

.globl _main



_main:

 /*
  *
  *  XNOR insturction
  * Result in R4
 */

  MOV		R1, #5
  MOV		R2, #5
  EOR		R3, R1, R2
  MVN		R4,R3


 /* 
  * Bitwise AND, result in R1
  */

  MVN R3, #80
  MOV R2, #90
  AND  R1,R2,R3






/*
 * ABS instruction
 * Given a negative number, invert and add 1 to negate the 
 * 2's complement representation
 * result in R1
 */
  MOV R2, #-2
  MVN R1, R2
  ADD R1, R1, #1 

.end
