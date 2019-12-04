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
@		add r2, r2, #2
		push {r2}					@push starting address of array into stack
@		sub r2, r2, #2
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
		
		bl search					@branch to fibonacci sub routine
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
	   
	   mov r6, #4
	   eor r7, r7
	   mov r1, r1, lsr #1
loop:		
		cmp r1, #0
		mov r5, #-1
		ble _end
		add r7, r1, r7
		b loop2
loop1:
		cmp r1, #0
		mov r5, #-1
		ble _end
		sub r7, r7, r1
loop2:
		mul r4, r7, r6
	   ldr r3, [r2, r4]
	   cmp r0, r3
	   mov r5, r7
	   beq _end
	   mov r1, r1, lsr #1
	   bgt greater
	   b loop1
greater:
	   b loop
	   
	   

_end:   
		ldr r1, [sp], #-12		@point stack to lr
		LDMIA SP!, {PC}			@return stack content to registers
		
		
n: .word 0
	
