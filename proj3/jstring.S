@ jstring.S: routine to concatenate two strings

    .global jstring
    .text
@ v1 -> pointer to first buffer
@ v2 -> pointer to second buffer
@ v3 -> length of first buffer
jstring: stmfd sp!, {v1-v8, lr}
    mov v1, a1
    mov v2, a2

    @ Get the length of the first buffer
    bl strlen
    mov v3, a1

    @ Get the length of the second buffer
    mov a1, v2
    bl strlen

    @ Allocate the resulting buffer
    add a1, a1, v3
    bl malloc

    @ Prepare to copy the data from the first buffer
    mov v4, #0

@ Copy the contents of the first buffer to the result
buf1: ldrb v3, [v1, v4]
    cmp v3, #0
    strneb v3, [a1, v4]
    addne v4, v4, #1
    bne buf1

    @ Prepare to copy the data from the second buffer
    mov v5, #0

@ Copy the content of the second buffer to the result
buf2: ldrb v3, [v2, v5]
    cmp v3, #0
    strneb v3, [a1, v4]
    addne v4, v4, #1
    addne v5, v5, #1
    bne buf2

    ldmfd sp!, {v1-v8, pc}
    .end
