@ANDN r1, r2, r3
@ r1 = r2 & ~r3


.global _main


_main:
	MOV r2, #3  @Input 1
	MOV r3, #6  @Input 2
	MOV r4, r3
	

	@Find Mask for r3
	ORR r4, r4, LSR #1
	ORR r4, r4, LSR #2
	ORR r4, r4, LSR #4
	ORR r4, r4, LSR #8
	ORR r4, r4, LSR #16

	@Find ones complement of r3
	EOR r5, r3, r4

	AND r1, r2, r5  @Output value stored in r1 

