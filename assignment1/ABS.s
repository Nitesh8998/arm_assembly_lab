
  @ BSS section
      .bss
sum: .word

  @ DATA SECTION
      .data

 a: .word -1

  @ TEXT section
      .text

.globl _main

_main:

        @ you can write your own code here
		@ Absolute Value 1 ABS r1, r2 
		@ Absolute value of r2 in r1

        LDR r4, =a
        LDR r2,[r4]
		MOV r1, #0
		CMP r2, #0
		MOVGE r1, r2
		SUBLT r1, r1, r2
		b out

 out:
		SWI 0x11