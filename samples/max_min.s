@ BSS section
    .bss
z: .word

@ DATA SECTION
    .data
data_items: .word 10, 4, 28, 100, 8, 0

@ TEXT section
    .text

.global _main
                
_main:

        LDR r5, =data_items       ; @store data_items into r2
        LDR r2, [r5]              ; @copy first index into r1,r2,r3
        LDR r1, [r5]              ; @r1 will eventually contain min value and r3 will contain max value in the array.
        LDR r3, [r5]              
        MOV r0, #0                ; @initialize r0 used as iterator to 0
        MOV r4, #0                ; @used to store the number of integers in data

LOOP: 
        CMP  r2, #0
        BEQ  END
        CMP  r1, r2               ; @compare if data index is less than value in r1
        BGT  STORE_MIN_VAL
        CMP  r3, r2
        BLT STORE_MAX_VAL
        B INCRVAL

STORE_MIN_VAL:

        MOV r1, r2;
        B INCRVAL

STORE_MAX_VAL:

        MOV r3, r2;
        B INCRVAL

INCRVAL:
        ADD r0, #4
        LDR r2, [r5, r0]
        B LOOP
END:
