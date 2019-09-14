/******************************************************************************
* file: largest_and_smallest (Lab2)
* author: Badrinath (CS18M527)
* Guide: Prof. Madhumutyam IITM, PACE
******************************************************************************/

  @ BSS section
      .bss
sum: .word

  @ DATA SECTION
      .data
       data_items: .word 10, 4, 28, 100, 8, 0 ;@0 is used to terminate the data

  @ TEXT section
      .text

.globl _main
    

//========================================================================================
// Output - r1 -> total count of integers without including delimiting 0
//          r2 -> maximum integer in the list
//          r3 -> minimum integer in the list
//========================================================================================


_main:
     // Get the base address of the data 
     // Assume r1 -> count, 
     // r2 -> largest integer
     // r3->smallest integer

     // Intialize all the regs

     mov r0, #0
     mov r1, #0
     mov r4, #0
     mov r5, #0


      // ============================================================================
      // r4 -> contains the data section address where the integers are stored
      // r5 -> contains the current value to be compared
      // load to r5 and increment the pointer
      // check if the current value is "0" which means the end of the list, ie end marker
      // r1 -> contains the count of integers (excluding the end marker 0)
      // ============================================================================
      ldr r4, =data_items
      // first assume the lesser number is always the first one in the array
      // and the greater is also first one in the array
      ldr r3, [r4]
      // avoid mem access, r3 already has our value
      mov r2, r3 

continue_loop:  

      // update the base pointer r4 for next read, the address of the array
      ldr r5,[r4],#4 

      // check for the end of the list 0
      cmp r5, #0 
      beq  count_end

      add r1,r1,#1
      // compare against the current largest
      // If r5 is larger than current larget in r2
      // then make r5 as current greatest
      cmp r5, r2
      movgt r2, r5 


      // compare against the current smallest
      // If r5 is larger than current smallest in r3
      // then make r5 as current smallest
     
      cmp r5, r3
      movle r3, r5

      // check for the minimal
      // minimal works as follows
      // Go back to start  
      b continue_loop 

count_end:
     // Self loop to inspect the register contents
     b .
.end
