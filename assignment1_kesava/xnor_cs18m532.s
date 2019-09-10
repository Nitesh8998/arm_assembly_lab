/******************************************************************************
* file: xnor_cs18m532.s                                                       *
* Assembly code for XNOR r1,r2,r3 i.e r1=!(r2 ^ r3)                           *
******************************************************************************/

@ BSS section
.bss
ret_val: .word

@ DATA SECTION
.data
val1: .word 0x12
val2: .word 0x43

@ TEXT section
.text

.global _main

_main:
    LDR   r0, =val1         @ Get address of inputs
	LDR   r2, [r0]          @ Load input values
	LDR   r0, =val2
	LDR   r3, [r0]
	EOR   r1, r2, r3        @ r2^r3
    MVN   r1, r1            @ !(r2^r3)	
	LDR   r4, =ret_val		@ Get address of output
	STR	  r1, [r4]          @ Store result r1
	SWI   0x11
	