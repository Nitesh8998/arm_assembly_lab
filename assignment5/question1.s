  @ BSS section
      .bss


  @ DATA SECTION
      .data
A_DIGIT: .word 0x43 ;
H_DIGIT: .byte ;


  @ TEXT section
      .text

.globl _main

_main:
	
	ldr r0, =A_DIGIT
	ldr r1, [r0]
	cmp r1, #0x41
	bge loop1
	sub r2, r1, #0x30
	b loop2
	loop1: sub r2, r1, #0x37
	loop2: ldr r3, =H_DIGIT
	strb r2, [r3]
	swi 0x11
	.end
