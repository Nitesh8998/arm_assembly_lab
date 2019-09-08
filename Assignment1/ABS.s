/******************************************************************************
* file: ABD.s
* description: brief sample program for ARM SIM ABS
* author: Venkatesh Ravipati
* Guide: Prof. Madhumutyam IITM, PACE
******************************************************************************/

/*
  ABS r1, r2 
*/



  @ BSS section
      .bss
z: .word

  @ DATA SECTION
      .data
a: .word -10 


  @ TEXT section
      .text

.globl _main


_main:

     LDR r4, =a     ; //get the address of a
     LDR r2, [r4]   ; //get value of a into r2
     MOV r3, #-1    ; //initilize r3 with -1
     CMP r2, #0     ; //Compare r2 with zero 
     BPL END        ; //if +ve jump brach to END and if -ve get 2's complement to get absolute number
     EOR r2,r2,r3   ; //XOR with 0xffffffff will give 1's complement  
     ADD r2,r2,#1   ; //2's complement = 1's complement + 1 
END: MOV r1,r2      ; //move final result in to r1
