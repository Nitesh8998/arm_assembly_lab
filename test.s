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
