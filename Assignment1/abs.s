  @ Performs absolute operation - ABS r1,r2

  @ BSS section
      .bss
z: .word

  @ DATA SECTION
      .data
a: .word -5234 

  @ TEXT section
      .text

.global _main

	 
_main:

     LDR r4, =a		  ; @ Get the address of a
     LDR r2, [r4]	  ; @ Load value of a into regiser r2
	 CMP r2, #0	      ; @ Performs [r2] - #0 and sets the flags in CPSR
	 RSBMI r1, r2, #0 ; @ Performs reverse subtraction only if negative flag is set in CPSR i.e. r1 <- #0 - [r2]
