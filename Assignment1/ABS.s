@ABS r1, r2
@Gives the absolute value for r2 and stores in r1
@Method Get the sign bit or MSB and XORed with r2(given number) and again subtract the sign bit since -ve number is saved as twos complement.
@r1 = ( r2 XOR (r2>>31) ) - (r2>>31) 

.global _main


_main:

	MOV r2, #-6  @Input
	EOR r3, r2, r2, ASR #31  
	SUB r1, r3, r2, ASR #31

	@Output / absolute value of r2 is saved in r1