@============================================================================
@ *lab1_5.s*
@ Description: ARM Code to get the absolute value.
@              ABS r1, r2 @absolute value of r2 in r1
@============================================================================
@============================================================================
@
@ EDIT HISTORY FOR MODULE
@
@ $Header: $
@
@ when          who                    what, where, why
@ -----------   -------------------    ---------------------------------
@ 9 Sep 2019    Swapneel Pimparkar     Added and Tested Logic 2.
@ 9 Sep 2019    Swapneel Pimparkar     (Bengaluru) First Draft (Logic 1)
@============================================================================

@------------------------------------------------------------------------------
@ Logic: The absolute number can be determined through multiple options.
@        (1) Using ADD and EX-OR
@        (2) Using Compare (for negative) & adjust sign (by subtracting from 0)
@
@ Note: Small Integer Numbers are assumed for demonstration purpose.
@       Output is in Register R1
@------------------------------------------------------------------------------

@ Text Section Begins
.text

@ Global labels declared. For description of logic_x please refer above comments.
@ related to associated logic.

    .global _START
    .global _END
    .global _LOGIC_1_POS
    .global _LOGIC_2_POS
    .global _LOGIC_1_NEG
    .global _LOGIC_2_NEG
    .global _LOOP

_START:

@First With Positive Number: 25
    MOV     R2, #25
    
_LOGIC_1_POS:
    ADD     R1, R2, R2, ASR R2
    EOR     R1, R1, R2, ASR R2 
    
_LOGIC_2_POS:
    
    CMP     R2, #0
    RSBLT   R1, R2, #0  @If the [R2] is +ve, then this line will not execute.

@Now, we will experiment with Negative Number (-25)
@Exactly same instruction set as above but executed with -ve number.

    MOV     R2, #-25

_LOGIC_1_NEG:
    ADD     R1, R2, R2, ASR R2
    EOR     R1, R1, R2, ASR R2
    
_LOGIC_2_NEG:
    CMP     R2, #0
    RSBLT   R1, R2, #0  @If the [R2] is +ve, then this line will not execute.

_END:
@ End the program
.end
