@/******************************************************************************
@* file: Problem3.s
@* author: Ananya Barat
@* Guide: Prof. Madhumutyam IITM, PACE
@******************************************************************************/
	@ BSS section
      .bss
sum: .word

	@ DATA SECTION
      .data
number: .word 51234

	@ TEXT section - MULF r 1 , r 2 , #54
      .text

.globl _main

_main:



		MOV r2, #3            @loading decimal 3 in r2 for checking 
		MOV r1, r2, LSL#5     @r1 = (2^5) *r2
		MOV r3, r2, LSL#4     @r3 = (2^4) *r2
		MOV r4, r2, LSL#2     @r4 = (2^2) *r2
		MOV r5, r2, LSL#1     @r5 = (2^1) *r2
		ADD r6, r1, r3  
		ADD r6, r6, r4
		ADD r6, r6, r5        @r6 = r1 +r5 +r3 +r4
		MOV r1, r6
.end
