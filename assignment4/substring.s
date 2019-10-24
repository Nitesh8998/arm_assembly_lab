  @ BSS section
      .bss


  @ DATA SECTION
      .data
str1: .asciz "CS6620" ;
str2: .asciz "SS" ;
present: .word 0x00000000;


  @ TEXT section
      .text

.globl _main

_main:
			mov r9, #0x00000000
			ldr r1, =str1 ; 						@address of str1 loaded in r0
						
			mov r2, #0x0;		
						
		loop3:	ldr r6, =str2 ;	 					@address of str1 loaded in r0
			mov r0, #0x00000000						@stores the matching index
		loop2:	ldrb r3, [r1], #1					@reading both string byte by byte
			ldrb r8, [r6], #1 ;		
						
			cmp r3, #0								@terminate after printing result if end of string
			beq loop5		
			cmp r8, #0			
			beq loop5		
						
			add r9, r9, #1							@keeping count of the length of string1
			cmp r3, r8								@comparing ith character of string1 with jth character of string2
			bne loop4								@if not equal jump to loop3 where string2 is reloaded to restart comparison
			cmp r0, #0								@if sting chars are equal checking r0 has already been assigned first mathing index
			bne loop2								@if not equal means that r0 already has the first matching index, hence skipping assignment
			mov r0, r9								@if equal the current index of string1 is assigned to r0 to mark the 1st index match substring
			b loop2									@branch to loop2
			
		loop4:	cmp r0, #0							@if not equal after some match in previous iteration, then super string index has to be restored
			beq loop3
			ldrb r3, [r1], #-1
			sub r9, r9, #1
			b loop3
		
		loop5:	cmp r8, #0							@if super string terminates before sub string then present variable has to be set to 0
				beq loop1		
				mov r0, #0
				
		loop1:	ldr r5, =present					@store output in memory
			strb r0, [r5]
			swi 0x11
			.end
			
			