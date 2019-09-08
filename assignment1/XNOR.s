
  @ BSS section
      .bss
sum: .word

  @ DATA SECTION
      .data
number: .word 51234 
a: .word 0
b: .word 0
c: .word -15
d: .word -1

  @ TEXT section
      .text

.globl _main

_main:

        @ you can write your own code here
		@ XNOR r1, r2, r3
		@ compute "AB" , "A'B'" and OR "AB" and "A'B'"
        LDR r1, =number
        LDR r4, =a
        LDR r2,[r4]
        LDR r5, =b
        LDR r3,[r5]
        AND r4, r2, r3 @computing "r2r3"
		LDR r6, =d
		LDR r8, [r6]
		LDR r7, =d
		LDR r9, [r7]
		BIC r8, r8, r2 @r2 complement
		BIC r9, r9, r3 @r3 complement
		AND r5, r8, r9 @computing " r2'r3'"
		EOR r1, r4, r5 @Bitwise OR of "r2r3" and " r2'r3'"
		SWI 0x11
