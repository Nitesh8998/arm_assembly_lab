  @ BSS section
      .bss


  @ DATA SECTION
      .data
str1: .asciz "CS6600" ;
str2: .asciz "A" ;
present: .word 0x00000000;


  @ TEXT section
      .text

.globl _main

_main:
			mov r9, #0
			ldr r0, =str1 ; 			@address of str1 loaded in r0
			ldr r6, =str2 ; 			@address of str1 loaded in r0
			ldr r1, [r0]
			
			mov r2, #0x000000ff
			
		loop3:	ldrb r7, [r6], #-1 ; 			@address of str1 loaded in r0
			cmp r7, #0
			beq done
			b loop3
		done: swi 0x11
			.end