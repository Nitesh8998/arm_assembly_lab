/******************************************************************************
* file: abs_cs18m532.s                                                        *
* Assembly code for ABS implementation                                        *
******************************************************************************/

/*
@params 
1: input number
@return 
absolute value
*/

@ BSS section
.bss
abs_val: .word

@ DATA SECTION
.data
val: .word -32

@ TEXT section
.text

.global _main

_main:
    LDR   r0, =val          @ Get address of input
    LDR   r1, [r0]          @ Load input value to r1
    CMP   r1, #0            @ Compare with 0 and set the negate flag
    RSBMI r1, r1, #0        @ Reverse Substract,if neg flag is set
    LDR   r2, =abs_val      @ Get address of return value
    STR   r1, [r2]          @ store absolute value into return value
out:
	SWI 0x11