@ int2hex.S: routine to convert integer to hex string.

    .global int2hex
    .text
@ Our primary method (NB: this is a recursive function)
int2hex: stmfd sp!, {v1-v8, lr}
    @ Our original integer
    mov v1, a1
    
    @ Allocate our resulting buffer
    mov a1, #11
    bl malloc
    mov v2, a1
    
    @ Setup our character counter
    mov v3, #0
    
    @ Add the '0x' characters to the beginning of our buffer
    mov v4, #48
    strb v4, [v2, v3]
    add v3, v3, #1
    mov v4, #120
    strb v4, [v2, v3]
    add v3, v3, #1
    
    mov v5, #0
    
@ Loop through each 4-bit segment from MSB to LSB
loop: lsl v2, v1, v5
    lsr v2, v2, #60
    bl addchar
    add v3, v3, #1
    add v5, v5, #4
    
    @ Check to see if we are done yet.
    cmp v5, #64
    bne loop
    
    ldmfd sp!, {v1-v8, pc}
    
addchar:
    mov v4, #48

    @ Convert to '0'
    cmp v2, #0
    moveq v4, #48
    
    @ Convert to '1'
    cmp v2, #1
    moveq v4, #49
    
    @ Convert to '2'
    cmp v2, #2
    moveq v4, #50
    
    @ Convert to '3'
    cmp v2, #3
    moveq v4, #51
    
    @ Convert to '4'
    cmp v2, #4
    moveq v4, #52
    
    @ Convert to '5'
    cmp v2, #5
    moveq v4, #53
    
    @ Convert to '6'
    cmp v2, #6
    moveq v4, #54
    
    @ Convert to '7'
    cmp v2, #7
    moveq v4, #55
    
    @ Convert to '8'
    cmp v2, #8
    moveq v4, #56
    
    @ Convert to '9'
    cmp v2, #9
    moveq v4, #57
    
    @ Convert to 'A'
    cmp v2, #10
    moveq v4, #65
    
    @ Convert to 'B'
    cmp v2, #11
    moveq v4, #66
    
    @ Convert to 'C'
    cmp v2, #12
    moveq v4, #67
    
    @ Convert to 'D'
    cmp v2, #13
    moveq v4, #68
    
    @ Convert to 'E'
    cmp v2, #14
    moveq v4, #69
    
    @ Convert to 'F'
    cmp v2, #15
    moveq v4, #70
    
    strb v4, [v2, v3]
