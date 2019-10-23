  @ BSS section
      .bss


  @ DATA SECTION
      .data
str1: .asciz "BAT" ;
str2: .asciz "CAT";
greater: .word 0x00000000;


  @ TEXT section
      .text

.globl _main

_main:
			ldr r0, =str1 ; 			//address of str1 loaded in r0
			ldr r6, =str2 ; 			//address of str1 loaded in r0
			ldr r1, [r0], #4
			ldr r7, [r6], #4 ; 			//address of str1 loaded in r0
			mov r2, #0x000000ff
			
		loop1:  and r3, r2, r1
			and r8, r2, r7
			cmp r3, #0x00
			bne loop2
			cmp r8, #0x00
			beq loop3
			
		loop2:	mov r1, r1, lsr #8
			mov r7, r7, lsr #8
			cmp r3, r8			
			beq loop1
			bgt loop3
			mov r4, #0xffffffff
			b loop4
			
		loop3:	mov r4, #0x00000000;
		loop4:	ldr r5, =greater
			str r4, [r5]
			
			