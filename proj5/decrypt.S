@ decrypt.S: A Caesar Cipher decryption function.

    .global init
    .global decrypt
    .text

@ Our shared buffer.
Buffer: .fill 4, 1, 0

@ Our initialization function:
init: stmfd sp!, {v1-v8, lr}

    @ Get the string length and allocate correctly sized
    bl strlen
    bl malloc

    @ Store the resulting pointer in our Buffer label.
    str a1, Buffer

    ldmfd sp!, {v1-v8, pc}

decrypt: stmfd sp!, {v1-v8, lr}

    @ Prepare all our variables.
    ldr v1, Buffer
    mov v2, a1
    mov v6, a2

    @ Get the input length.
    bl strlen
    mov v3, a1

    @ Define our counter
    mov v4, #0

loop: ldrb v5, [v2, v4]

    @ Check to make sure the character isn't a space.
    cmp v5, #32
    subne v5, v5, v6

    @ Check to make sure our characters stay in bounds.
    cmpne v5, #65
    addlt v5, v5, #26

    @ Store our transformed character.
    strb v5, [v1, v4]
    add v4, v4, #1

    @ Check if there are still characters left to process.
    cmp v4, v3
    blt loop

    @ Add null-character to end of string.
    mov v5, #0
    strb v5, [v1, v4]

    @ Move the buffer pointer to the output register.
    mov a1, v1

    ldmfd sp!, {v1-v8, pc}
