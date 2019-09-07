  @ Performs xnor operation - XNOR r1,r2,r3

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
     LDR r4, =b	    ; @ Get the address of b
     LDR r3, [r4]   ; @ Load value of b into register r3
     EOR r4, r2, r3 ; @ Perform xor operation and store the result into register r4
     MVN r1, r4	    ; @ Complement the bits of r4 and move the result to r1 using Move not instuction
