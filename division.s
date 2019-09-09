/******************************************************************************
* file: division.s
* author: Badrinath CS18M527
******************************************************************************/

/*
   assignment 1 
   different sections are as shown
*/

  @ BSS section
      .bss
sum: .word

  @ DATA SECTION
      .data
number: .word 51234

  @ TEXT section
      .text

.globl _main



_main:


 // division
 //Load R2 - value with say 100
 //Immendiate value  45
 //R3 is used as the loop counter and do repeated addition (Quotient)
 //R2 will contain the reminder


 MOV	R2, #0x100
 MOV	R3, #45
 //Clear R1 to store the result
 MOV	R1, #0x00000000

 //
 //compare the divident(R2) and divisor (R3)
 //Check for divide by 0 (ie R3) == 0
 //if R2 < R3, then Q = 0
 //R3 > R2 and if R3-R2 makes R3 lesser than 0,
 //discard the substraction and break
 //Else continue the substraction


 //Do the comparision of the divisor by 0
 CMP	R3, R1
 BEQ	sub_end


 //This is the substraction loop
 sub_loop:
 ADD	R1, R1, #1

 //		Substract will set carry if divident becomes
 //		lesser than divisor
 //		keep looping
 SUBS	R2, R2, R3
 BCS	sub_loop

 //		We would have made extra substract of divisor
 //		from divident if we are here, the remainder
 //		and quoteint needs to be corrected to original
 //		remainder - add one divisor value
 //		quotient substract 1 quotient value.
 //		This is because we increment the quotient count
 //		while entering the sub_loop.

 ADD	R2,R2,R3
 SUB	R1, R1, #1

 sub_end:

.end
