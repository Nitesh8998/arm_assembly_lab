@ XNOR r1 , r2 , r3 - Performs XNOR and stores in r1

@ BSS section
      .bss
z: .word

  @ DATA SECTION
      .data
a: .word 5234 
b: .word 5124 

  @ TEXT section
      .text

.globl _main


_main:

     LDR r4, =a   ; @get the address of a
     LDR r3, [r4] ; @get value of a
     LDR r0, =b
     LDR r2, [r0] ; @get value b 
	 EOR r1, r2, r3 ; @xor of r2,r3
	 MVN r1, r1
	 
