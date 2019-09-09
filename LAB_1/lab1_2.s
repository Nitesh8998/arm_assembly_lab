@============================================================================
@ *lab1_2.s*
@ Description: ARM Code to simulate behaviour of bitwise AND instruction
@              for r2 and complement of r3. (ANDN r1,r2,!r3)
@============================================================================
@============================================================================
@
@ EDIT HISTORY FOR MODULE
@
@ $Header: $
@
@ when          who                    what, where, why
@ -----------   -------------------    -----------------------
@ 7 Sep 2019    Swapneel Pimparkar     Added and Tested Logic 1
@ 7 Sep 2019    Swapneel Pimparkar     (Bengaluru) First Draft
@============================================================================

@------------------------------------------------------------------------------
@ Logic: EX-OR is extensively used for complementing and then ADD is used.
@        Short version of the EOR and AND instructions are used.
@------------------------------------------------------------------------------

@ Text Section Begins
.text

@ Global labels declared. For description of logic_x please refer above comments.
@ related to associated logic.

    .global _START
    .global _END
    .global _LOGIC_1
@    .global _INPUT1
@    .global _INPUT2

@_INPUT1: .word 15
@_INPUT2: .word 5

_START:
    MOV R2, #0xF
    MOV R3, #0xB
    
@ Alternatively we can use LDR instructions too instead of MOV.
@    LDR R2, =_INPUT1
@    LDR R3, =_INPUT2

_LOGIC_1:
@ Complement R3
    EORS R3,R3,#0xFF
@ AND with R2 and store result in R1    
    ANDS  R1,R2,R3
    
_END:
@ End the program
.end
