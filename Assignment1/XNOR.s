@XNOR r1, r2, r3
@Method used r1 = r2&r3 | ~r2 & ~r3 


.global _main


_main:
	
	MOV r2, #3 	@Input1
	MOV r3, #6  @Input2
	
	@Find Greatest number	
	CMP r2,r3
	MOVLE r4, r3


	@Find Mask for r4
	ORR r4, r4, LSR #1
	ORR r4, r4, LSR #2
	ORR r4, r4, LSR #4
	ORR r4, r4, LSR #8
	ORR r4, r4, LSR #16

	@Get ones complement of r2
	EOR r6, r2, r4
	@Get ones complement of r3
	EOR r7, r3, r4


	AND r8, r2, r3 
	AND r9, r6, r7 
	ORR r1, r8, r9  @Final output is stored in r1