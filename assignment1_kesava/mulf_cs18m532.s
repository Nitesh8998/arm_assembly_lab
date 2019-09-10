/******************************************************************************
* file: mulf_cs18m532.s                                                       *
* Assembly code for fast multiplication r1=r2*54                              *
******************************************************************************/

@ BSS section
.bss
ret_val: .word

@ DATA SECTION
.data
in_val: .word -10

@ TEXT section
.text

.global _main

_main:
    LDR   r0, =in_val       @ Get address of inputs
	LDR   r2, [r0]          @ Load input values
	MOV   r3, #54			@ 54= 0x110110
	ADD   r1, r2, LSL #5
	ADD   r1, r2, LSL #4
	ADD   r1, r2, LSL #2
	ADD   r1, r2, LSL #1
	LDR   r5, =ret_val		@ Get address of output
	STR	  r1, [r5]          @ Store result r1
	SWI   0x11
	