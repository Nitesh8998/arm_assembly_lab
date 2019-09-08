@MULF r1, r2, #45
@Method used : Considering 45 is constant, so splitting it into powers of 2
@r1 = r2*45 = r2*(2^5 + 2^3 + 2^2 + 2^0) 


.global _main


_main:
	
	MOV r2, #25  @Input1
	MOV r3, #45  @Constant Input
	

	ADD r4, r2, r2, LSL #5  @2^5 + 2^0
	ADD r5, r4, r2, LSL #3  @2^3
	ADD r1, r5, r2, LSL #2  @2^2  
	@Output is stored in r1
	
 