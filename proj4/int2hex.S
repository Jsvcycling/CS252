@ int2hex.S: routine to convert integer to hex string.

    .global int2hex
    .text
@ Our primary method (NB: this is a recursive function)
int2hex: stmfd sp!, {v1-v8, lr}
    mov v1, a1

    @ Allocate our output buffer
    mov a1, #11
    bl malloc
    mov v2, a1

    @ Calculate the base-16 remainder
    mov v4, v1
    and v4, v4, #16

    @ Check to see if there is a remainder
    sub v6, v1, v4
    cmp v6, #0

    @ If there is no remainder
    moveq a1, v6
    bleq tochar

    @ If there is a remainder
    movne a1, v1
    subne a1, a1, v5
    mov v7, #16
    sdivne a1, a1, v7
    blne int2hex
    mov v2, a1
    mov a1, v4
    bl tochar
    mov a2, a1
    mov a1, v2
    bl strcat
    mov v2, a1

    @ Return
    mov a1, v2

    ldmfd sp!, {v1-v8, pc}

tochar: stmfd sp!, {v1-v8, lr}
    @ Conver to '0'
    cmp a1, #0
    moveq a1, #48

    @ Convert to '1'
    cmp a1, #1
    moveq

    @ Convert to 'A'
    cmp a1, #10
    moveq a1, #65

    @ Convert to 'B'
    cmp a1, #11
    moveq a1, #66

    @ Convert to 'C'
    cmp a1, #12
    moveq a1, #67

    @ Convert to 'D'
    cmp a1, #13
    moveq a1, #68

    @ Convert to 'E'
    cmp a1, #14
    moveq a1, #69

    @ Convert to 'F'
    cmp a1, #15
    moveq a1, #70

    ldmfd sp!, {v1-v8, pc}
    .end
