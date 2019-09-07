@/******************************************************************************
@* file: Problem1.s
@* author: Ananya Barat
@* Guide: Prof. Madhumutyam IITM, PACE
@******************************************************************************/
	@ BSS section
      .bss
sum: .word

	@ DATA SECTION
      .data
number: .word 51234

	@ TEXT section - XNOR r1, r2, r3
      .text

.globl _main

_main:


MOV r2 , #2 @ loading r2 = 0000 0000 0000 0000 0000 0000 0000 0010 for testing
MOV r3 , #4 @ loading r3 = 0000 0000 0000 0000 0000 0000 0000 0100 for testing
EOR r4, r2, r3 @take XOR of r2 and r3
MVN r1, r4   @invert bits r1 =1111 1111 1111 1111 1111 1111 1111 1001 = 0xfffffff9
.end