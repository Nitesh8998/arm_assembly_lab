@/******************************************************************************
@* file: Problem2.s
@* author: Ananya Barat
@* Guide: Prof. Madhumutyam IITM, PACE
@******************************************************************************/
	@ BSS section
      .bss
sum: .word

	@ DATA SECTION
      .data
number: .word 51234

	@ TEXT section - ANDN r 1 , r 2 , r 3
      .text

.globl _main


_main:

MOV r2, #4
MOV r3, #8
MVN r4, r3
AND r1, r2 , r4

.end