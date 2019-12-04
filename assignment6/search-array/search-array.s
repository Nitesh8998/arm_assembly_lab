  @ BSS section
      .bss


  @ DATA SECTION
      .data
input: .word 0
output: .word
searchN: .word
sizeofarray: .asciz "enter the number of elements in array: "
elemofarray: .asciz "enter the elements of array, each element followed by enter: "
searchelement: .asciz "enter the number to search: "
putoutput: .asciz "output is: "


  @ TEXT section
      .text

.globl _main

_main:
		eor r0, r0						@set r0=0, to read/write
		ldr r1, =sizeofarray				@message prompt
		swi 0x69						@output message to enter the value of N
		ldr r0, =n               	@get the input address
		ldr r0, [r0]                   
		swi 0x6c						@interrupt to read keyboard input
		
		mov r2, r0
		eor r0, r0
		ldr r1, =elemofarray				@message prompt
		swi 0x69					@interrupt to read keyboard input
		ldr r1, =input
		push {r1}					@push size of array into stack
		push {r2}					@push starting address of array into stack
fillarray:
		ldr r0, =n               	@get the input address
		ldr r0, [r0]                   
		swi 0x6c						@interrupt to read keyboard input
		str r0, [r1], #4
		sub r2, r2, #1
		cmp r2, #0
		bgt fillarray
		
		eor r0, r0
		ldr r1, =searchelement				@message prompt
		swi 0x69					@interrupt to read keyboard input
		ldr r0, =n               	@get the input address
		ldr r0, [r0]                   
		swi 0x6c
		
		bl search					@branch to search sub routine
		ldr r1, =output
		str r5, [r1]
		eor r0, r0
		ldr r1, =putoutput
		swi 0x69
		mov r1, r5                      @r1 contains OUTPUT
		swi 0x6b
		swi 0x011
		
search:                         
	   STMDB SP!, {LR}  		@store registers and lr in stack
	   ldr r1, [sp], #4
	   ldr r1, [sp], #4			@load size of array from stack to register
	   ldr r2, [sp], #4			@load starting address of array from stack to register
	   
	   eor r6, r6
loop:
		add r6, r6, #1			@loop through compare and find match
	   ldr r3, [r2], #4
	   cmp r3, r0
	   mov r5, r6
	   beq _end
	   mov r5, #-1
	   subs r1, r1, #1
	   bgt loop
_end:   
		ldr r1, [sp], #-12		@point stack to lr
		LDMIA SP!, {PC}			@return stack content to registers
		
		
n: .word 0
	
