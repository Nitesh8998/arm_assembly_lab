@DIVF r1, r2, #45  
@Method used : Considering 45 is constant, we can write r2*45 = r2*(1/45)
@1/45 = 0.022222... =  0.0000010110110000010101...
@so splitting it into powers of 2 = (2^-6 + 2^-8 + 2^-9 + 2^-11...)
@r1 = r2/45 = r2 * (1/45) = r2 * (2^-6 + 2^-8 + 2^-9 + 2^-11...)
@Gives Approximate value but is faster compared to normal repeated substraction method	

.global _main


_main:
	
	MOV r2, #500  @Input1
	MOV r3, #45  @Constant Input
	
	MOV r1, r2, ASR #6  	@2^-6
	ADD r1, r1, r2, ASR #8  @2^-8
	ADD r1, r1, r2, ASR #9  @2^-9
	ADD r1, r1, r2, ASR #11 @2^-11  
	ADD r1, r1, r2, ASR #12  @2^-12
	ADD r1, r1, r2, ASR #18  @2^-18
	ADD r1, r1, r2, ASR #20 @2^-20
	ADD r1, r1, r2, ASR #22 @2^-22
	
	@Output is stored in r1