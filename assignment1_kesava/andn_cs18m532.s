/******************************************************************************
* file: andn_cs18m532.s                                                        *
* Assembly code for Bit-wise and of r2 and !r3 (compliment of r3)             *
******************************************************************************/

@ BSS section
.bss
andn_val: .word

@ DATA SECTION
.data
val1: .word 0x1010
val2: .word 0x0101

@ TEXT section
.text

.global _main

_main:
    LDR   r0, =val1         @ Get address of inputs
	LDR   r1, =val2
    LDR   r2, [r0]          @ Load input values
	LDR   r3, [r1]
	MVN   r3, r3            @ Complement r3
    AND   r4, r2, r3 	 	@ r4 = r2 & r3 as r3 is already complemented
	LDR   r5, =andn_val		@ Get address of output
	STR	  r4, [r5]          @ Store result r4
	SWI   0x11
	