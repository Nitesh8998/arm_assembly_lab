@============================================================================
@ *lab1_1.s*
@ Description: ARM Code to simulate behaviour of XNOR r1,r2,r3 instruction
@============================================================================
@============================================================================
@
@ EDIT HISTORY FOR MODULE
@
@ $Header: $
@
@ when          who                    what, where, why
@ -----------   -------------------    --------------------------
@ 7 Sep 2019    Swapneel Pimparkar     Added and Tested Logic 5
@ 7 Sep 2019    Swapneel Pimparkar     Added and Tested Logic 4
@ 7 Sep 2019    Swapneel Pimparkar     Added and Tested Logic 3
@ 7 Sep 2019    Swapneel Pimparkar     Added and Tested Logic 2
@ 7 Sep 2019    Swapneel Pimparkar     Added and Tested Logic 1
@ 7 Sep 2019    Swapneel Pimparkar     (Bengaluru) First Draft
@============================================================================

@------------------------------------------------------------------------------
@ Logic: Truth table of the XNOR is as follows:
@           A         B          A XNOR B
@          ----      ----        --------
@          FALSE     FALSE       TRUE
@          FALSE     TRUE        FALSE
@          TRUE      FALSE       FALSE
@          TRUE      TRUE        TRUE
@
@         This essentially means that when both the inputs are same then
@         output of the XNOR operation is TRUE.
@
@         This XNOR behaviour can be simulated multiple ways. 
@         [Here, considering both - bitwise and non-bitwise XNOR]
@
@         1. Take XOR of complement of register content. E.g. XOR r1,!r2,!r3
@         2. Compare (using CMP instruction) & if equal set r1.
@         3. Using Test Equal instruction (TEQ) appropriately.
@         4. Subtract r3 from r2 and if output is zero then set r1.
@         5. Another longer route is - take bitwise AND of r2 & r3, & compare
@            output with any input register r2 or r3. If same, then set r1.
@
@         All the above 5 options are tried out below and only the option that 
@         produces least amount of cycles is kept enabled. Remaining are 
@         commented out. But for evaluation purposes, the comments can be
@         removed and code can be tried out.
@         
@         NOTE: There are multiple ways in addition to above to carry out the
@               said operation (considering multiple addressing modes).
@               Only select options are used here to showcase the behaviour
@               and this is not an exhaustive & complete list of possibilities.
@               
@               We are storing logical value in R1 as a result of XNOR.
@               And not treating bit-wise XNOR here in this code.
@               Hence resultant value will be either 0 or 1.
@               However, program code can be easily modified to reflect bitwise
@               XNOR Operation.
@------------------------------------------------------------------------------

@ Text Section Begins
.text

@ Global labels declared. For description of logic_x please refer above comments.
@ related to associated logic.

    .global _START
    .global _END
    .global _EQUAL
    .global _NOT_EQUAL
    .global _LOGIC_1
    .global _LOGIC_2
    .global _LOGIC_3
    .global _LOGIC_4
    .global _LOGIC_5
@    .global _INPUT1
@    .global _INPUT2

@_INPUT1: .word 15
@_INPUT2: .word 5

_START:
    MOV R2, #0x86
    MOV R3, #0x85
    
@ Alternatively we can use LDR instructions too instead of MOV.
@    LDR R2, =_INPUT1
@    LDR R3, =_INPUT2
    
    
@_LOGIC_1:
@@ This is like complementing the register content - using XOR with 1.
@    EORS R2,R2,#0xFF
@    EORS R3,R3,#0xFF
@
@@ If both the register contents are same then output should be zero.
@    EORS R1,R2,R3
@    CMP R1, #0x00
@    BEQ _EQUAL
@    MOV R1,#0x0
@    B _NOT_EQUAL
    
    
@_LOGIC_2:
@    CMP R2,R3
@    BEQ _EQUAL
@    B _NOT_EQUAL
    
    
@_LOGIC_3:
@    TEQ R2,R3
@    BEQ _EQUAL
@    B _NOT_EQUAL

@_LOGIC_4:
@    SUBS R1,R2,R3
@    CMP R1, #0x00
@    BEQ _EQUAL
@    B _NOT_EQUAL

_LOGIC_5:
    ANDS R1,R2,R3
    CMP  R1,R2
    BEQ _EQUAL
    B _NOT_EQUAL
    
    
_EQUAL:
    MOV R1, #0x1
    B _END
    
_NOT_EQUAL:
    MOV R1, #0x00
    B _END    

_END:
@ End the program
.end
