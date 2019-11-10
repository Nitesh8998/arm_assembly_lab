  @ BSS section
      .bss


  @ DATA SECTION
      .data
STRING: .asciz "11010710" ;
NUMBER: .word 0x00000000;
ERROR:	.word 0x0;


  @ TEXT section
      .text

.globl _main

_main:
	ldr r9, =NUMBER
	ldr r0, =STRING				@address of str1 loaded in r0			
loop4:	ldrb r1, [r0], #1			@load char into registers and loop for comparison
	cmp r1, #0
	beq store
	mov r3, r3, lsl #1
	cmp r1, #0x30
	beq loop4
	cmp r1, #0x31
	beq loop2
	mov r2, #0xff
	ldr r8, =ERROR
	strb r2, [r8]
	b loop3
loop2:	add r3, r3, #1
	b loop4
store:	strb r3, [r9]
loop3:	swi 0x11
	.end
	
	
	
			