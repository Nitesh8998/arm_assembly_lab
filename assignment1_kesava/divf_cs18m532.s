/******************************************************************************
* file: divf_cs18m532.s                                                       *
* Assembly code for Fast division, r1 = r2/45                                 *
******************************************************************************/

@ BSS section
.bss
ret_val: .word

@ DATA SECTION
.data
in_val: .word -906

@ TEXT section
.text

.global _main

_main:
    LDR   r0, =in_val       @ Get address of inputs
	LDR   r2, [r0]          @ Load input values
	MOV   r3, #45
	MOV   r4, #1
	MOV   r1, #0

	CMP   r2, #0			@ Compare if the input is negative
	MOVMI r3, #-45   		@ initialise and branch to loop_neg if the input is negative
	MOVMI r4, #-1
	BMI   loop_neg
	
loop_pos:
    CMP   r2, r3
	BLT	  out				@ branch if r2 is less than r3
	SUB   r2, r2, r3
	ADD   r1, r1, r4
	B	  loop_pos

loop_neg:
	CMP   r2, r3
	BGT	  out               @ branch out if r2 is greater than r3
	SUB   r2, r2, r3
	ADD   r1, r1, r4
	B     loop_neg

out:	
	LDR   r5, =ret_val		@ Get address of output
	STR	  r1, [r5]          @ Store result r1
	SWI   0x11
	