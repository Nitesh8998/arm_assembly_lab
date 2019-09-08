
  @ BSS section
      .bss
sum: .word

  @ DATA SECTION
      .data

a: .word 0xFFFFFFFF
b: .word 0xFFFF0000
c: .word -15
d: .word -1

  @ TEXT section
      .text

.globl _main

_main:

        @ you can write your own code here
		@ Bit-wise and of r2 and !r3 (compliment of r3)
		@ ANDN r1,r2,r3
        LDR r4, =a
        LDR r2,[r4]
        LDR r5, =b
        LDR r3,[r5]
		LDR r7, =d
		LDR r9, [r7]
		BIC r9, r9, r3 @r3 complement
		MOV r3, r9
		AND r1, r2, r3 @computing " r2r3' "
		SWI 0x11
