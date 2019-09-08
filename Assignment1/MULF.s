@MULF r1, r2, #45
@Method used : Considering 45 is constant, so splitting it into powers of 2
@r1 = r2*45 = r2*(2^5 + 2^3 + 2^2 + 2^0) 


.global _main


_main:
	
	MOV r2, #45  @Constant Input
	MOV r1, #25  @Input1

	ADD r3, r1, r1, LSL #5  @2^5 + 2^0
	ADD r4, r3, r1, LSL #3  @2^3
	ADD r1, r4, r1, LSL #2  @2^2  
	@Output is stored in r1
	
 