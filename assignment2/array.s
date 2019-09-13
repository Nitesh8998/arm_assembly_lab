
  @ BSS section
      .bss

  @ DATA SECTION
      .data

data_items: .word 10,4,28,100,8,0 @; 0 is	used to	terminate the data
maximum:    .word 0
minimum:    .word 0
count:      .word 0

  @ TEXT section
      .text

.globl _main

_main:

		@ Assembly	program	to compute the maximum and minimum values
        @ in  a	given set of non-zero unsigned integer numbers.	This program also	
		@ computes the total number of integers present in the set (other than
        @ the terminating 0). This program scan through all the
        @ elements of the set only once. Assumption is that, the memory locations starting at	
        @ address data_items contains the given	set	of integers.	

		LDR R3,=data_items        @Load address data_items into R3
		MOV R2,#0                 @Initialize the count value in register R2
		LDR R6,[R3]				  @Initialize maximum number in R6
		LDR R7,[R3]				  @Initialize minimum number in R7
		CMP R6, #0
		BEQ OUT
		ADD R2,R2,#1             @Increment loop counter R2
		ADD R3, R3, #4
LOOP:   LDR R4,[R3],#4            @Load next number from array into R4
		CMP R4, #0               @check for end of data items by comparing with 0
		BEQ OUT
		ADD R2,R2,#1             @Increment loop counter R2
		
		CMP R4,R6              @Compare new element with maximum number so far
		MOVHI R6,R4            @ update R6 with maximum number
		CMP R4,R7              @Compare new element with minimum in R7 so far
		MOVLS R7,R4            @ update R7 with minimum number

		B LOOP                 @Branch to loop.
OUT:
		LDR R5,=maximum        @Load address maximum into R5
		STR R6,[R5]            @Store R6 into maximum.
		LDR R5,=minimum        @Load address minimum into R5
		STR R7,[R5]            @Store R7 into minimum.
		LDR R5,=count          @Load address count into R5
		STR R2,[R5]            @Store R2 into count.
