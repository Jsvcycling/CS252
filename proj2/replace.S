@ replace.S: routine to replace a character in a string with another character

         .global replace
         .text
replace: stmfd sp!, {v1-v8, lr}
         mov v1, #0
         mov v2, #0
loop:    ldrb v3, [a1, v1]
         cmp a2, v3
         streqb a3, [a1, v1]
         addeq v2, v2, #1
         add v1, v1, #1
         cmp v3, #0
         bne loop
         mov a1, v2
         ldmfd sp!, {v1-v8, pc}
         .end
