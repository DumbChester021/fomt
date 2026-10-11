    .INCLUDE "asm/macro.inc"
    .SYNTAX UNIFIED

    @ this is the continuation of rucksack_item
    @ and other model stuff

    .section .text.after_saved_buffer_accessors, "ax", %progbits
    .section .text.after_saved_buffer_set_location, "ax", %progbits
    thumb_func_start func_08010024
func_08010024: @ 0x08010024
    push {r4, r5, lr}
    adds r3, r0, #0
    adds r5, r3, #4
    ldr r0, [r3]
    adds r0, #4
    adds r0, r3, r0
    adds r2, r0, #0
    adds r1, r5, #0
    ldr r4, [r3]
    cmp r1, r2
    beq .L08010040
.L0801003A:
    adds r1, #1
    cmp r1, r2
    bne .L0801003A
.L08010040:
    subs r0, r0, r5
    subs r0, r4, r0
    str r0, [r3]
    pop {r4, r5}
    pop {r0}
    bx r0
