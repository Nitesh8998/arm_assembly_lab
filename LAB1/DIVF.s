 MOV     R1,#225;
 MOV     R2,#45;

 MOV      R0,#0;
 MOV      R3,#1;
                    
step1:
 CMP      R2,R1;
 MOVLS    R2,R2,LSL#1;
 MOVLS    R3,R3,LSL#1;
 BLS      step1;
 
step2:
 CMP       R1,R2;      
 SUBCS     R1,R1,R2;
 ADDCS     R0,R0,R3;
 MOVS      R3,R3,LSR#1;
 MOVCC     R2,R2,LSR#1;
 BCC       step2;@result\quotient is stored in R0

