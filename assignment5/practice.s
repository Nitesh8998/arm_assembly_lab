  @ BSS section
      .bss


  @ DATA SECTION
      .data
BCDNUM: .word 0x92529679 ;
H_DIGIT: .word;

  @ TEXT section
      .text

.globl _main

_main:
	mov r1, #0
	eor r3, r3, r3
	mov r5, #1
	mov r2, #10
	mov r9, #0x0000000f
	ldr r8, =BCDNUM
	ldr r7, [r8]
	loop1: and r6, r7, r9
	mov r7, r7, lsr #4
	cmp r7, #0
	bne loop2
	mov r1, #1
	loop2: mul r4, r6, r5
	add r3, r3, r4
	cmp r1, #1
	beq exit
	mul r5, r5, r2
	b loop1
	exit: ldr r1, =H_DIGIT
	str r3, [r1]
	swi 0x11
	.end