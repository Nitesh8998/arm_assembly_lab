@test

Approach 1:
ASR R1, R0, #31         ; 1 cycle
ADD R0, R0, R1          ; 1 cycle
EOR R0, R0, R1          ; 1 cycle
                        ; total: 3 cycles
Approach 2:
ADD R1, R0, R0, ASR #31 ; 1 cycle
EOR R0, R1, R0, ASR #31 ; 1 cycle
                        ; total: 2 cycles


Documentation for Division program:
To perform r2/r3:
Repeatedly perform r3<<32, r3<<31... and r2<<1...
While doing this repetetive LSL, compare the values with r2 and 
substract the shifted value from r2 and decrement r2 accordinly.
After subtraction, update the quotient as per the shift made with 1 (1 << shifts count ) made to compute LSL value.

By adding all the shift based values using left shift with value 1, quotient can be computed.

These shifts and comparisons will be continued till shift count reaches 0.
or till dividend becomes smaller than divisor. 
