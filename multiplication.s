/******************************************************************************
* file: multiplication.s
* student : Badrinath.D CS18m527
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
xnorop1: .word 0x5555
snorop2: .word 0xaaaa

  @ TEXT section
      .text

.globl _main



_main:

/*
    Multiplication
*/

  // Multiplication
  //  Load R2 - value with say 0x100
  //  Immendiate value 54
  //  R3 is used as the loop counter and do repeated addition

 MOV R2, #0x100
 MOV R3, #54
 //  Clear R1 to store the result
 MOV R1, #0x00000000

add_loop:
 ADD R1, R1, R2
 // Substract R3, the counter
 SUBS R3,R3,#1
 BNE add_loop // jmp to add_loop, BNE sets to 0

// Result updated in R1
 MOV R3, R1

 //Load R2 - value with say 100
 //Immendiate value  45
 //R3 is used as the loop counter and do repeated addition (Quotient)
 //R2 will contain the reminder


 MOV	R2, #0x100
 MOV	R3, #45
 //Clear R1 to store the result
 MOV	R1, #0x00000000

.end
