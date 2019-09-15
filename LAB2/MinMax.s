@ BSS section
      .bss
z: .word
@ DATA SECTION
.data
data_item:  .word 3423423,42,28,100,8,2342,4234,4234,44,0 
max:	    .word 
min:	    .word
increment:	    .word  
	   
@ TEXT section
    .text

.global _main


_main:

     LDR r4, =data_item   ; @get the address of data_item
     LDR r2, [r4] ; @get value of first item
     ADD r4,r4,#4;
     LDR r3, [r4] ; @get value of second item
     MOV   r5,r2; 
     CMP   r5,r3;
     MOVGT r5,r3;  ;@store Min  value in r5
     MOV   r6,r2;
     CMP   r6,r3;
     MOVLT r6,r3;  @store Max value in r6
     MOV   r7,#2;  @store Increment value in r7
    

check: 
      ADD r4,r4,#4;	      
      LDR r1, [r4] ;          @get value of next item
      cmp R1,#0               @Compare and exit if the item is equal to 0
      BNE loop                @ if R1 is not equal to 0 jump to the loop 
      B _exit                 @ else exit

loop:
     CMP r5,r1;		@Compare retrieved item with r5	
     MOVGT r5,r1;	;@store Min value in r5   
     CMP r6,r1;		@Compare retrieved item with r6	
     MOVLT r6,r1;	;@store max value in r5   
     ADD r7,r7,#1;	@Increment value in r7
     B check
 _exit: 
     LDR r4, =min  ; @store the min value
     STR r5, [r4] 
     LDR r4, =max  ; @store the maxvalue
     STR r6, [r4] 
     LDR r4, =increment   ; @store the increment value
     STR r7, [r4] 
  