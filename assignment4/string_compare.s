  @ BSS section
      .bss


  @ DATA SECTION
      .data
str1: .asciz "CAT" ;
str2: .asciz "BAT";
greater: .word 0x00000000;


  @ TEXT section
      .text

.globl _main

_main:
			ldr r0, =str1 ; 				@address of str1 loaded in r0
			ldr r6, =str2 ; 				@address of str1 loaded in r0
			
		loop1:  ldrb r3, [r0], #1			@load char into registers and loop for comparison
			ldrb r8, [r6], #1
			
			cmp r3, #0x00					@if char is null character exit
			bne loop2
			cmp r8, #0x00
			beq loop3
			
		loop2:	cmp r3, r8					@comparing chars
			beq loop1
			bgt loop3						@if not equal then jumping to print result
			mov r4, #0xffffffff				@set all fs if string1<string2
			b loop4
			
		loop3:	mov r4, #0x00000000;
		loop4:	ldr r5, =greater
			strb r4, [r5], #1
			strb r4, [r5], #1
			strb r4, [r5], #1
			strb r4, [r5], #1
			
			