@============================================================================
@ *lab1_3.s*
@ Description: ARM Code to simulate behaviour of Fast Division 
@              DIV r1, r2, #45
@              i.e. divide [r2] by 45.
@============================================================================
@============================================================================
@
@ EDIT HISTORY FOR MODULE
@
@ $Header: $
@
@ when          who                    what, where, why
@ -----------   -------------------    -----------------------
@ 9 Sep 2019    Swapneel Pimparkar     (Bengaluru) First Draft
@============================================================================

@------------------------------------------------------------------------------
@ Logic: Division is removing the parts. In other words, successive subtraction
@
@        We can reuse the code generated in previous exercise of multiplication
@        and just update the instructions that will add reciprocal effect.
@
@        Logic1: Multiply dividend by reciprocal of divior.
@        Logic2: Successive Division.
@        Logic3: Using Shift.
@
@ Note:  Assumed is Positive Integer Division only. Reminder is not computed.
@
@ Additional Reference used for learning purpose:
@        http://homepage.cs.uiowa.edu/~jones/bcd/divide.html
@------------------------------------------------------------------------------

@ Text Section Begins
.text

@ Global labels declared. 
@ related to associated logic.

    .global _START
    .global _END
    .global _LOOP_ONE
    .global _LOOP_TWO
    .global _COMMON
    
_START:
    MOV      R1,  #0     @Initialize R1. This will be our division.
    MOV      R2,  #100   @Some number say 100. This is dividend.
    MOV      R3,  #45    @This is divisor.
    MOV      R4,  #1     @Register for our use.

_LOOP_ONE:
 
@ Check for accidental division by zero. If yes, then simply terminate.
    CMP      R3,  #0     @Is divisor zero? For testing, we may put [R3]=0
    BEQ      _END
 
@ As we are here, we are good to go i.e. no division by zero will happen.

    CMP      R3,R2       @Compare the R3 and R2
    MOVLS    R3,R3,LSL#1 @Move R3 (logical left shift by 1) if lower or same. 
    MOVLS    R4,R4,LSL#1 @Move R4 (logical left shift by 1) if lower or same.
    BLS      _LOOP_ONE   @Branch if lower or same.
    
_LOOP_TWO:        
    CMP      R2,R3       @Compare R2 & R3
    SUBCS    R2,R2,R3    @Subtract R3 from R2
    ADDCS    R1,R1,R4    @Add the current bit in R4 to R1
    
    MOVS     R4,R4,LSR#1 @Shift R4 logical right by 1 position.
    MOVCC    R3,R3,LSR#1 @Shift divisor R3 logical right by 1 position.
    BCC      _LOOP_TWO   @Branch to _LOOP_TWO if Carry Clear.
    
_END:
@ End the program
.end
