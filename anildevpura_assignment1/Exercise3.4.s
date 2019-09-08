.global _main

_main:

@4. Fast division, r1 = r2/45
@Logic, division by substracting. 
@Note: This programs legs in performace if dividend is >>> then divisor.

	LDR r2, =134553 @Some value of r2
	LDR r3, =45 @given value
	MOV r1, #0 @finally value will be store in r1 hence initialized it with 0
	DLoop:
		mov r4,r2 @this will hold reminder
		subs r2,r3 @ substracting
		cmp r4,r3  @ Comparing with zero
		addge r1,#1 @ if r4 >= 0 then add (from Previous operation)
		cmp r4,r3  @ Comparing with zero, this will give celing value, i.e. 136/45 = 4. if 
		bge DLoop @branch if r4 is >= r3