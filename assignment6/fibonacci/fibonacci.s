  @ BSS section
      .bss


  @ DATA SECTION
      .data
getInput: .asciz "enter the value of N to compute Nth fibonacci number: "
input: .word  2;
output: .word;

  @ TEXT section
      .text

.globl _main

_main:
		eor r0, r0						@set r0=0, to read/write
		ldr r1, =getInput				@message prompt
		swi 0x69						@output message to enter the value of N
		ldr r0, =N               	@get the input address
		ldr r0, [r0]                   
		swi 0x6c						@interrupt to read keyboard input
		bl fibonacci					@branch to fibonacci sub routine
		ldr r1, =output
		strb r0, [r1]
		mov r2, r0
		eor r0, r0
		mov r1, r2                      @r1 contains OUTPUT
		swi 0x6b
		swi 0x011
		
fibonacci:                         
	   stmdb sp!, {r4,r5,lr}  		@store registers and lr in stack
	   mov r4, r0                		@move r0 to r4 for r0 to store intermediate output
	   cmp r0, #2                		@check if n<=2
	   mov r0, #1                		@return 1 if n<=2
	   ble _end               		@end of current recursion, return to previous recursion
	   sub r0, r4, #2            		@n=n-2
	   bl fibonacci                    	@call fibonacci(n)
	   mov r5, r0                		@n-2 output stored in r5
	   sub r0, r4, #1            		@compute n=n-1
	   bl fibonacci                    	@fibonacci(n)
	   add r0, r0, r5            		@fibonacci(n-2) + fibonacci(n-1)
_end:                    
		ldmia sp!, {r4,r5,pc}			@return stack content to registers
		
		
N: .word 0
	
