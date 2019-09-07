  @Performs And not operation - ANDN r1,r2,r3

  @ BSS section
      .bss
z: .word

  @ DATA SECTION
      .data
a: .word 5234 
b: .word 5124 

  @ TEXT section
      .text

.global _main

	 
_main:

     LDR r4, =a     ; @ Get the address of a
     LDR r2, [r4]   ; @ Load value of a into regiser r2
     LDR r4, =b     ; @ Get the address of b
     LDR r3, [r4]   ; @ Load value of b into register r3
     MVN r4, r3     ; @ Complement the bits of r3 and move the result to r4 using Move not instuction
     AND r1, r2, r4 ; @ Perform AND operation
	
    @ Note: This can be done with a single BIC operation instead
