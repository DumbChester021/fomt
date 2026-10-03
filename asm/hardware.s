    .INCLUDE "asm/macro.inc"
    .SYNTAX UNIFIED

    thumb_func_start func_0800736C
func_0800736C: @ 0x0800736C
    push {r4, r5, lr}
    ldr r0, .L080073CC @ =gUnk_03000404
    ldr r2, [r0]
    ldr r3, [r2]
    adds r5, r3, #0
    cmp r3, #0
    beq .L080073D4
    ldr r0, [r3]
    str r0, [r2]
    cmp r3, #0
    beq .L080073D4
    subs r0, r3, #4
    subs r0, r0, r2
    asrs r4, r0, #2
    cmp r4, #0xf
    bhi .L0800739A
    movs r0, #0x1f
    ands r0, r4
    movs r1, #1
    lsls r1, r0
    ldr r0, [r2, #0x44]
    orrs r0, r1
    str r0, [r2, #0x44]
.L0800739A:
    adds r1, r2, #0
    adds r1, #0x48
    ldrh r0, [r1]
    adds r0, #1
    strh r0, [r1]
    movs r0, #1
    strh r0, [r3]
    adds r1, #2
    ldrh r0, [r1]
    adds r0, #1
    ldr r2, .L080073D0 @ =0x0000FFFF
    cmp r0, r2
    bls .L080073B6
    movs r0, #1
.L080073B6:
    strh r0, [r5, #2]
    strh r0, [r1]
    movs r1, #0xf
    ldrh r0, [r5, #2]
    ands r0, r2
    lsls r0, r0, #4
    adds r2, r4, #0
    ands r2, r1
    orrs r2, r0
    b .L080073D6
    .align 2, 0
.L080073CC: .4byte gUnk_03000404
.L080073D0: .4byte 0x0000FFFF
.L080073D4:
    movs r2, #0
.L080073D6:
    adds r0, r2, #0
    pop {r4, r5}
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_080073E0
func_080073E0: @ 0x080073E0
    push {r4, r5, lr}
    adds r4, r1, #0
    ldr r0, .L08007458 @ =gUnk_03000404
    ldr r3, [r0]
    cmp r4, #0
    beq .L08007450
    lsls r0, r4, #0x1c
    lsrs r2, r0, #0x1c
    adds r5, r2, #0
    movs r0, #0
    cmp r2, #0xf
    bhi .L08007406
    movs r0, #1
    lsls r0, r2
    ldr r1, [r3, #0x44]
    ands r1, r0
    rsbs r0, r1, #0
    orrs r0, r1
    lsrs r0, r0, #0x1f
.L08007406:
    cmp r0, #0
    beq .L08007450
    lsls r0, r2, #2
    adds r0, #4
    adds r1, r3, r0
    movs r2, #0
    lsls r0, r4, #0xc
    lsrs r0, r0, #0x10
    ldrh r4, [r1, #2]
    cmp r0, r4
    bne .L0800741E
    movs r2, #1
.L0800741E:
    cmp r2, #0
    beq .L08007450
    ldrh r0, [r1]
    subs r0, #1
    strh r0, [r1]
    lsls r0, r0, #0x10
    lsrs r0, r0, #0x10
    cmp r0, #0
    bne .L08007450
    strh r0, [r1, #2]
    ldr r0, [r3]
    str r0, [r1]
    str r1, [r3]
    cmp r5, #0xf
    bhi .L08007446
    movs r1, #1
    lsls r1, r5
    ldr r0, [r3, #0x44]
    bics r0, r1
    str r0, [r3, #0x44]
.L08007446:
    adds r1, r3, #0
    adds r1, #0x48
    ldrh r0, [r1]
    subs r0, #1
    strh r0, [r1]
.L08007450:
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L08007458: .4byte gUnk_03000404

    thumb_func_start func_0800745C
func_0800745C: @ 0x0800745C
    push {r4, lr}
    adds r3, r1, #0
    ldr r0, .L080074B0 @ =gUnk_03000404
    ldr r2, [r0]
    cmp r3, #0
    beq .L080074B6
    lsls r0, r3, #0x1c
    lsrs r1, r0, #0x1c
    adds r4, r1, #0
    movs r0, #0
    cmp r1, #0xf
    bhi .L08007482
    movs r0, #1
    lsls r0, r1
    ldr r1, [r2, #0x44]
    ands r1, r0
    rsbs r0, r1, #0
    orrs r0, r1
    lsrs r0, r0, #0x1f
.L08007482:
    cmp r0, #0
    beq .L080074B6
    lsls r0, r4, #2
    adds r0, #4
    adds r1, r2, r0
    movs r2, #0
    lsls r0, r3, #0xc
    lsrs r0, r0, #0x10
    ldrh r4, [r1, #2]
    cmp r0, r4
    bne .L0800749A
    movs r2, #1
.L0800749A:
    cmp r2, #0
    beq .L080074B6
    ldrh r2, [r1]
    adds r0, r2, #1
    strh r0, [r1]
    lsls r0, r0, #0x10
    cmp r0, #0
    beq .L080074B4
    adds r0, r3, #0
    b .L080074B8
    .align 2, 0
.L080074B0: .4byte gUnk_03000404
.L080074B4:
    strh r2, [r1]
.L080074B6:
    movs r0, #0
.L080074B8:
    pop {r4}
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_080074C0
func_080074C0: @ 0x080074C0
    push {r4, r5, lr}
    adds r3, r1, #0
    ldr r0, .L0800750C @ =gUnk_03000404
    ldr r4, [r0]
    cmp r3, #0
    beq .L08007502
    lsls r0, r3, #0x1c
    lsrs r2, r0, #0x1c
    adds r5, r2, #0
    movs r0, #0
    cmp r2, #0xf
    bhi .L080074E6
    movs r0, #1
    lsls r0, r2
    ldr r1, [r4, #0x44]
    ands r1, r0
    rsbs r0, r1, #0
    orrs r0, r1
    lsrs r0, r0, #0x1f
.L080074E6:
    cmp r0, #0
    beq .L08007502
    lsls r1, r2, #2
    adds r1, r1, r4
    movs r2, #0
    lsls r0, r3, #0xc
    lsrs r0, r0, #0x10
    ldrh r1, [r1, #6]
    cmp r0, r1
    bne .L080074FC
    movs r2, #1
.L080074FC:
    adds r0, r5, #0
    cmp r2, #0
    bne .L08007506
.L08007502:
    movs r0, #1
    rsbs r0, r0, #0
.L08007506:
    pop {r4, r5}
    pop {r1}
    bx r1
    .align 2, 0
.L0800750C: .4byte gUnk_03000404

    thumb_func_start func_08007510
func_08007510: @ 0x08007510
    push {r4, lr}
    adds r2, r1, #0
    ldr r0, .L08007558 @ =gUnk_03000404
    ldr r3, [r0]
    cmp r2, #0
    beq .L0800755C
    lsls r0, r2, #0x1c
    lsrs r1, r0, #0x1c
    adds r4, r1, #0
    movs r0, #0
    cmp r1, #0xf
    bhi .L08007536
    movs r0, #1
    lsls r0, r1
    ldr r1, [r3, #0x44]
    ands r1, r0
    rsbs r0, r1, #0
    orrs r0, r1
    lsrs r0, r0, #0x1f
.L08007536:
    cmp r0, #0
    beq .L0800755C
    lsls r0, r4, #2
    adds r0, #4
    adds r1, r3, r0
    movs r3, #0
    lsls r0, r2, #0xc
    lsrs r0, r0, #0x10
    ldrh r2, [r1, #2]
    cmp r0, r2
    bne .L0800754E
    movs r3, #1
.L0800754E:
    cmp r3, #0
    beq .L0800755C
    ldrh r0, [r1]
    b .L0800755E
    .align 2, 0
.L08007558: .4byte gUnk_03000404
.L0800755C:
    movs r0, #0
.L0800755E:
    pop {r4}
    pop {r1}
    bx r1
.L08007564:
    .byte 0x02, 0x48, 0x00, 0x68, 0x48, 0x30, 0x00, 0x88, 0x70, 0x47, 0x00, 0x00
    .byte 0x04, 0x04, 0x00, 0x03, 0x10, 0x20, 0x70, 0x47, 0xF0, 0xB5, 0x57, 0x46, 0x4E, 0x46, 0x45, 0x46
    .byte 0xE0, 0xB4, 0x88, 0xB0, 0x05, 0x90, 0x0C, 0x1C, 0x14, 0x20, 0xF9, 0xF7, 0x23, 0xF8, 0x07, 0x1C
    .byte 0x00, 0x20, 0x38, 0x60, 0x78, 0x60, 0x39, 0x1C, 0x08, 0x31, 0x48, 0x60, 0x26, 0x78, 0x38, 0x1C
    .byte 0x31, 0x1C, 0xCF, 0xF0, 0x09, 0xFC, 0x70, 0x1E, 0x00, 0x06, 0x06, 0x0E, 0xFF, 0x2E, 0x00, 0xD1
    .byte 0x9F, 0xE0, 0x01, 0xA8, 0x81, 0x46, 0x48, 0x46, 0xFF, 0xF7, 0xB6, 0xFD, 0x48, 0x46, 0xFF, 0xF7
    .byte 0xD5, 0xFE, 0x02, 0x90, 0x7C, 0x68, 0xF8, 0x68, 0x84, 0x42, 0x10, 0xD0, 0x00, 0x2C, 0x08, 0xD0
    .byte 0x20, 0x1C, 0xFF, 0xF7, 0xA9, 0xFD, 0x4A, 0x46, 0x51, 0x68, 0x20, 0x1C, 0xFF, 0xF7, 0x3E, 0xFF
    .byte 0x60, 0x60, 0x78, 0x68, 0x08, 0x30, 0x78, 0x60, 0x01, 0x3E, 0x07, 0x96, 0x73, 0xE0, 0xA0, 0x46
    .byte 0x01, 0x20, 0x04, 0x90, 0x39, 0x68, 0x60, 0x1A, 0xC4, 0x10, 0x03, 0x94, 0x04, 0xAA, 0x03, 0xA8
    .byte 0x01, 0x2C, 0x00, 0xD2, 0x10, 0x1C, 0x00, 0x68, 0x20, 0x18, 0x00, 0x28, 0x0B, 0xD0, 0xC4, 0x00
    .byte 0x20, 0x1C, 0xC8, 0xF0, 0xF1, 0xFD, 0x06, 0x94, 0x00, 0x28, 0x02, 0xD1, 0x20, 0x1C, 0xCC, 0xF0
    .byte 0xCF, 0xFA, 0x39, 0x68, 0x02, 0xE0, 0x00, 0x20, 0x00, 0x22, 0x06, 0x92, 0x05, 0x1C, 0xAA, 0x46
    .byte 0x0D, 0x1C, 0x54, 0x46, 0x01, 0x3E, 0x07, 0x96, 0x45, 0x45, 0x0D, 0xD0, 0x00, 0x2C, 0x07, 0xD0
    .byte 0x20, 0x1C, 0xFF, 0xF7, 0x71, 0xFD, 0x69, 0x68, 0x20, 0x1C, 0xFF, 0xF7, 0x07, 0xFF, 0x60, 0x60
    .byte 0x08, 0x35, 0x08, 0x34, 0x45, 0x45, 0xF1, 0xD1, 0x25, 0x1C, 0x04, 0x98, 0x01, 0x28, 0x0C, 0xD1
    .byte 0x00, 0x2D, 0x08, 0xD0, 0x28, 0x1C, 0xFF, 0xF7, 0x5F, 0xFD, 0x48, 0x46, 0x41, 0x68, 0x28, 0x1C
    .byte 0xFF, 0xF7, 0xF4, 0xFE, 0x68, 0x60, 0x08, 0x35, 0x13, 0xE0, 0x06, 0x1C, 0x2C, 0x1C, 0x00, 0x2E
    .byte 0x0E, 0xD0, 0x00, 0x2C, 0x08, 0xD0, 0x20, 0x1C, 0xFF, 0xF7, 0x4E, 0xFD, 0x4A, 0x46, 0x51, 0x68
    .byte 0x20, 0x1C, 0xFF, 0xF7, 0xE3, 0xFE, 0x60, 0x60, 0x01, 0x3E, 0x08, 0x34, 0x00, 0x2E, 0xF0, 0xD1
    .byte 0x25, 0x1C, 0x7E, 0x68, 0x3C, 0x68, 0xB4, 0x42, 0x0A, 0xD0, 0x61, 0x68, 0x20, 0x1C, 0xFF, 0xF7
    .byte 0x97, 0xFE, 0x20, 0x1C, 0x02, 0x21, 0xFF, 0xF7, 0x65, 0xFD, 0x08, 0x34, 0xB4, 0x42, 0xF4, 0xD1
    .byte 0x38, 0x68, 0x00, 0x28, 0x01, 0xD0, 0xC8, 0xF0, 0xCB, 0xFD, 0x06, 0x98, 0x50, 0x44, 0x51, 0x46
    .byte 0x39, 0x60, 0x7D, 0x60, 0xF8, 0x60, 0x02, 0x99, 0x48, 0x46, 0xFF, 0xF7, 0x81, 0xFE, 0x48, 0x46
    .byte 0x02, 0x21, 0xFF, 0xF7, 0x4F, 0xFD, 0x07, 0x9A, 0x10, 0x06, 0x06, 0x0E, 0xFF, 0x2E, 0x00, 0xD0
    .byte 0x61, 0xE7, 0x38, 0x68, 0x38, 0x61, 0x05, 0x98, 0x07, 0x60, 0x08, 0xB0, 0x38, 0xBC, 0x98, 0x46
    .byte 0xA1, 0x46, 0xAA, 0x46, 0xF0, 0xBC, 0x02, 0xBC, 0x08, 0x47, 0x00, 0x00

    thumb_func_start func_0800770C
func_0800770C: @ 0x0800770C
    movs r1, #0
    str r1, [r0]
    bx lr
    .align 2, 0

    thumb_func_start func_08007714
func_08007714: @ 0x08007714
    push {r4, r5, r6, r7, lr}
    mov r7, r8
    push {r7}
    adds r7, r0, #0
    mov r8, r1
    ldr r0, [r7]
    cmp r0, #0
    beq .L08007754
    adds r6, r0, #0
    ldr r5, [r6, #4]
    ldr r4, [r6]
    cmp r4, r5
    beq .L08007744
.L0800772E:
    ldr r1, [r4, #4]
    adds r0, r4, #0
    bl func_080073E0
    adds r0, r4, #0
    movs r1, #2
    bl func_08007184
    adds r4, #8
    cmp r4, r5
    bne .L0800772E
.L08007744:
    ldr r0, [r6]
    cmp r0, #0
    beq .L0800774E
    bl free
.L0800774E:
    adds r0, r6, #0
    bl __builtin_delete
.L08007754:
    movs r0, #1
    mov r1, r8
    ands r0, r1
    cmp r0, #0
    beq .L08007764
    adds r0, r7, #0
    bl __builtin_delete
.L08007764:
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_08007770
func_08007770: @ 0x08007770
    push {r4, r5, r6, r7, lr}
    mov r7, sb
    mov r6, r8
    push {r6, r7}
    adds r7, r0, #0
    ldr r1, [r1]
    cmp r1, #0
    beq .L080077BE
    adds r6, r1, #0
    ldr r0, [r6, #4]
    mov r8, r0
    ldr r4, [r6, #0x10]
    cmp r4, r8
    beq .L080077A8
    mov sb, r4
.L0800778E:
    adds r5, r4, #0
    adds r4, #8
    cmp r4, r8
    bne .L08007798
    ldr r4, [r6]
.L08007798:
    ldr r1, [r5, #4]
    adds r0, r5, #0
    bl func_08007510
    cmp r0, #1
    beq .L080077B8
    cmp r4, sb
    bne .L0800778E
.L080077A8:
    adds r0, r7, #0
    bl func_08007128
    ldr r1, [r4, #4]
    adds r0, r7, #0
    bl func_0800745C
    b .L080077CA
.L080077B8:
    str r4, [r6, #0x10]
    adds r4, r5, #0
    b .L080077A8
.L080077BE:
    adds r0, r7, #0
    bl func_08007128
    adds r0, r7, #0
    bl func_0800736C
.L080077CA:
    str r0, [r7, #4]
    adds r0, r7, #0
    pop {r3, r4}
    mov r8, r3
    mov sb, r4
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_080077DC
func_080077DC: @ 0x080077DC
    push {r4, r5, lr}
    adds r5, r0, #0
    adds r4, r1, #0
    movs r1, #0
    ldr r3, [r5]
    adds r0, r3, #1
    cmp r0, #0
    bne .L080077EE
    movs r1, #1
.L080077EE:
    cmp r1, #0
    bne .L0800783A
    movs r0, #0
    cmp r3, #0
    bne .L080077FA
    movs r0, #1
.L080077FA:
    cmp r0, #0
    beq .L0800781A
    movs r0, #1
    adds r1, r0, #0
    lsls r1, r4
    lsls r0, r1
    subs r0, #1
    orrs r3, r0
    str r3, [r5]
    movs r0, #0
    b .L0800783C
.L08007810:
    ldr r0, [r5]
    orrs r0, r1
    str r0, [r5]
    adds r0, r4, #0
    b .L0800783C
.L0800781A:
    cmp r4, #4
    bhi .L0800783A
    movs r0, #1
    adds r2, r0, #0
    lsls r2, r4
    movs r4, #0
    lsls r0, r2
    subs r1, r0, #1
.L0800782A:
    adds r0, r3, #0
    ands r0, r1
    cmp r0, #0
    beq .L08007810
    adds r4, r4, r2
    lsls r1, r2
    cmp r1, #0
    bne .L0800782A
.L0800783A:
    movs r0, #0x20
.L0800783C:
    pop {r4, r5}
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_08007844
func_08007844: @ 0x08007844
    push {r4, lr}
    adds r3, r0, #0
    adds r4, r1, #0
    cmp r2, #4
    bhi .L08007864
    movs r1, #1
    adds r0, r1, #0
    lsls r0, r2
    lsls r1, r0
    subs r1, #1
    movs r0, #0x1f
    ands r0, r4
    lsls r1, r0
    ldr r0, [r3]
    bics r0, r1
    b .L0800786A
.L08007864:
    cmp r2, #5
    bne .L0800786C
    movs r0, #0
.L0800786A:
    str r0, [r3]
.L0800786C:
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0

    .section .text.after_resource_handle_ctor, "ax", %progbits

.L080079D0:
    .byte 0x03, 0x49, 0x0A, 0x68, 0x03, 0x49, 0x52, 0x18, 0x11, 0x68, 0x01, 0x31, 0x11, 0x60, 0x70, 0x47
    .byte 0x08, 0x04, 0x00, 0x03, 0x24, 0x09, 0x00, 0x00

    .section .text.after_resource_handle_dtor, "ax", %progbits

    thumb_func_start func_08007A28
func_08007A28: @ 0x08007A28
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #0x18
    str r1, [sp]
    str r2, [sp, #4]
    ldr r0, .L08007B44 @ =gUnk_03000408
    ldr r5, [r0]
    ldr r0, .L08007B48 @ =0x0000092A
    adds r4, r5, r0
    ldrh r0, [r4]
    cmp r0, #0
    beq .L08007A5A
    ldr r1, .L08007B4C @ =0x00000824
    adds r0, r5, r1
    ldr r2, .L08007B50 @ =0x00000928
    adds r1, r5, r2
    ldrh r1, [r1]
    ldrh r2, [r4]
    bl func_08007F84
    movs r0, #0
    strh r0, [r4]
.L08007A5A:
    ldr r0, [sp, #4]
    cmp r0, #0
    beq .L08007B32
    ldr r1, [sp]
    adds r1, r1, r0
    str r1, [sp, #8]
    movs r7, #0
    movs r2, #0x92
    lsls r2, r2, #4
    adds r0, r5, r2
    ldrh r1, [r0]
    str r4, [sp, #0x14]
    subs r2, #0xfc
    adds r2, r5, r2
    str r2, [sp, #0xc]
    ldr r2, .L08007B50 @ =0x00000928
    adds r2, r5, r2
    str r2, [sp, #0x10]
    mov sl, r0
    cmp r1, #0
    beq .L08007B18
    movs r0, #0x24
    adds r0, r0, r5
    mov r8, r0
    mov r6, r8
.L08007A8C:
    movs r0, #0
    cmp r7, #0xff
    bhi .L08007AAA
    lsrs r1, r7, #5
    lsls r1, r1, #2
    adds r1, r5, r1
    movs r0, #0x1f
    ands r0, r7
    movs r2, #1
    lsls r2, r0
    ldr r1, [r1]
    ands r1, r2
    rsbs r0, r1, #0
    orrs r0, r1
    lsrs r0, r0, #0x1f
.L08007AAA:
    cmp r0, #0
    beq .L08007B04
    ldrh r0, [r6]
    lsls r4, r0, #0x16
    lsrs r3, r4, #0x16
    ldrb r0, [r6, #1]
    lsls r2, r0, #0x1a
    lsrs r1, r2, #0x1c
    movs r0, #1
    mov sb, r0
    lsls r0, r1
    adds r0, r3, r0
    ldr r1, [sp]
    cmp r1, r0
    bhs .L08007B04
    ldr r0, [sp, #8]
    cmp r3, r0
    bhs .L08007B04
    adds r1, r3, #0
    lsrs r2, r2, #0x1c
    ldr r0, [sp, #0xc]
    bl func_080080A0
    movs r0, #0
    strh r0, [r6, #4]
    ldr r0, [r5, #0x20]
    str r0, [r6]
    mov r1, r8
    str r1, [r5, #0x20]
    cmp r7, #0xff
    bhi .L08007AFC
    lsrs r2, r7, #5
    lsls r2, r2, #2
    adds r2, r5, r2
    movs r0, #0x1f
    ands r0, r7
    mov r1, sb
    lsls r1, r0
    ldr r0, [r2]
    bics r0, r1
    str r0, [r2]
.L08007AFC:
    mov r2, sl
    ldrh r0, [r2]
    subs r0, #1
    strh r0, [r2]
.L08007B04:
    adds r6, #8
    movs r0, #8
    add r8, r0
    adds r7, #1
    mov r1, sl
    ldrh r0, [r1]
    cmp r0, #0
    beq .L08007B18
    cmp r7, #0xff
    bls .L08007A8C
.L08007B18:
    ldr r0, [sp, #0xc]
    ldr r1, [sp]
    ldr r2, [sp, #4]
    bl func_08007EE8
    mov r2, sp
    ldrh r0, [r2]
    ldr r2, [sp, #0x10]
    strh r0, [r2]
    mov r1, sp
    ldrh r2, [r1, #4]
    ldr r1, [sp, #0x14]
    strh r2, [r1]
.L08007B32:
    add sp, #0x18
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08007B44: .4byte gUnk_03000408
.L08007B48: .4byte 0x0000092A
.L08007B4C: .4byte 0x00000824
.L08007B50: .4byte 0x00000928

    .section .text.after_resource_handle_ops, "ax", %progbits

.L08007E8C:
    .byte 0x03, 0x48, 0x00, 0x68
    .byte 0x92, 0x21, 0x09, 0x01, 0x40, 0x18, 0x00, 0x88, 0x70, 0x47, 0x00, 0x00, 0x08, 0x04, 0x00, 0x03
    .byte 0x80, 0x20, 0x40, 0x00, 0x70, 0x47, 0x00, 0x00

    .section .text.after_resource_block_reset, "ax", %progbits

    thumb_func_start func_08008020
func_08008020: @ 0x08008020
    push {r4, r5, r6, r7, lr}
    sub sp, #4
    adds r6, r0, #0
    adds r7, r1, #0
    cmp r7, #9
    bhi .L0800807E
    movs r3, #0
    adds r4, r6, #4
.L08008030:
    ldrb r5, [r4]
    cmp r5, #0
    bne .L08008074
    adds r0, r4, #0
    adds r1, r7, #0
    str r3, [sp]
    bl func_080D7568
    adds r2, r0, #0
    movs r1, #0
    ldr r0, .L08008070 @ =0x000001FF
    ldr r3, [sp]
    cmp r2, r0
    bhi .L0800804E
    movs r1, #1
.L0800804E:
    cmp r1, #0
    beq .L08008074
    strb r5, [r6, #1]
    movs r1, #0
    ldrb r0, [r6, #4]
    cmp r0, #0
    beq .L08008066
    adds r0, r6, #0
    adds r0, #0x80
    ldrb r0, [r0]
    rsbs r0, r0, #0
    lsrs r1, r0, #0x1f
.L08008066:
    strb r1, [r6]
    lsls r0, r3, #9
    orrs r0, r2
    b .L08008096
    .align 2, 0
.L08008070: .4byte 0x000001FF
.L08008074:
    adds r4, #0x7c
    adds r3, #1
    cmp r3, #1
    ble .L08008030
    b .L08008092
.L0800807E:
    cmp r7, #0xa
    bne .L08008092
    ldrb r0, [r6, #1]
    cmp r0, #0
    beq .L08008092
    adds r0, r6, #0
    bl func_08007EA8
    movs r0, #0
    b .L08008096
.L08008092:
    movs r0, #0x80
    lsls r0, r0, #3
.L08008096:
    add sp, #4
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    .align 2, 0

    .section .text.after_resource_block_free, "ax", %progbits

.L080080EC:
    .byte 0x40, 0x78, 0x70, 0x47
    .byte 0x00, 0x78, 0x70, 0x47, 0xF0, 0xB5, 0x57, 0x46, 0x4E, 0x46, 0x45, 0x46, 0xE0, 0xB4, 0x82, 0xB0
    .byte 0x00, 0x90, 0x00, 0x20, 0x00, 0x99, 0x08, 0x70, 0x01, 0x20, 0x48, 0x70, 0x04, 0x31, 0x01, 0x23
    .byte 0x00, 0x27, 0x9C, 0x46, 0x01, 0x26, 0x76, 0x42, 0x0F, 0x70, 0x60, 0x46, 0x48, 0x70, 0x08, 0x1D
    .byte 0x01, 0x22, 0x7C, 0x31, 0x8A, 0x46, 0x01, 0x3B, 0x01, 0x93, 0x07, 0x70, 0x61, 0x46, 0x41, 0x70
    .byte 0x01, 0x1D, 0x01, 0x23, 0x3C, 0x30, 0x80, 0x46, 0x01, 0x3A, 0x91, 0x46, 0x0F, 0x70, 0x60, 0x46
    .byte 0x48, 0x70, 0x08, 0x1D, 0x01, 0x22, 0x0C, 0x1C, 0x1C, 0x34, 0x5D, 0x1E, 0x07, 0x70, 0x61, 0x46
    .byte 0x41, 0x70, 0x03, 0x1D, 0x01, 0x21, 0x0C, 0x30, 0x01, 0x3A, 0x80, 0xC3, 0x01, 0x39, 0xB1, 0x42
    .byte 0xFB, 0xD1, 0xB2, 0x42, 0xF2, 0xD1, 0x21, 0x1C, 0x2B, 0x1C, 0xB3, 0x42, 0xE6, 0xD1, 0x40, 0x46
    .byte 0x4A, 0x46, 0xB2, 0x42, 0xD9, 0xD1, 0x51, 0x46, 0x01, 0x9B, 0xB3, 0x42, 0xCC, 0xD1, 0x00, 0x98
    .byte 0x02, 0xB0, 0x38, 0xBC, 0x98, 0x46, 0xA1, 0x46, 0xAA, 0x46, 0xF0, 0xBC, 0x02, 0xBC, 0x08, 0x47
    .byte 0xF0, 0xB5, 0x57, 0x46, 0x4E, 0x46, 0x45, 0x46, 0xE0, 0xB4, 0x8C, 0xB0, 0x05, 0x90, 0x06, 0x91
    .byte 0xA0, 0x20, 0xF8, 0xF7, 0x17, 0xFA, 0x07, 0x90, 0x01, 0x1C, 0x07, 0x23, 0x00, 0x22, 0x01, 0x24
    .byte 0x64, 0x42, 0x0A, 0x60, 0x4A, 0x60, 0x08, 0x1C, 0x08, 0x30, 0x42, 0x60, 0x14, 0x31, 0x01, 0x3B
    .byte 0xA3, 0x42, 0xF6, 0xD1, 0x00, 0x20, 0x08, 0x90, 0x06, 0x99, 0x08, 0x9A, 0x88, 0x18, 0x91, 0x00
    .byte 0x89, 0x18, 0x89, 0x00, 0x07, 0x9A, 0x8F, 0x18, 0x06, 0x78, 0x38, 0x1C, 0x31, 0x1C, 0xCF, 0xF0
    .byte 0xA5, 0xFA, 0x70, 0x1E, 0x00, 0x06, 0x06, 0x0E, 0x08, 0x98, 0x01, 0x30, 0x09, 0x90, 0xFF, 0x2E
    .byte 0x00, 0xD1, 0xA0, 0xE0, 0x01, 0xA9, 0x89, 0x46, 0x48, 0x46, 0xFF, 0xF7, 0x3B, 0xFB, 0x48, 0x46
    .byte 0x08, 0x99, 0xFF, 0xF7, 0xA7, 0xFC, 0x02, 0x90, 0x7C, 0x68, 0xF8, 0x68, 0x84, 0x42, 0x10, 0xD0
    .byte 0x00, 0x2C, 0x08, 0xD0, 0x20, 0x1C, 0xFF, 0xF7, 0x2D, 0xFB, 0x4A, 0x46, 0x51, 0x68, 0x20, 0x1C
    .byte 0xFF, 0xF7, 0x5A, 0xFD, 0x60, 0x60, 0x78, 0x68, 0x08, 0x30, 0x78, 0x60, 0x01, 0x3E, 0x0A, 0x96
    .byte 0x73, 0xE0, 0xA0, 0x46, 0x01, 0x20, 0x04, 0x90, 0x39, 0x68, 0x60, 0x1A, 0xC4, 0x10, 0x03, 0x94
    .byte 0x04, 0xAA, 0x03, 0xA8, 0x01, 0x2C, 0x00, 0xD2, 0x10, 0x1C, 0x00, 0x68, 0x20, 0x18, 0x00, 0x28
    .byte 0x0B, 0xD0, 0xC4, 0x00, 0x20, 0x1C, 0xC7, 0xF0, 0xCF, 0xFF, 0x0B, 0x94, 0x00, 0x28, 0x02, 0xD1
    .byte 0x20, 0x1C, 0xCB, 0xF0, 0xAD, 0xFC, 0x39, 0x68, 0x02, 0xE0, 0x00, 0x20, 0x00, 0x22, 0x0B, 0x92
    .byte 0x05, 0x1C, 0xAA, 0x46, 0x0D, 0x1C, 0x54, 0x46, 0x01, 0x3E, 0x0A, 0x96, 0x45, 0x45, 0x0D, 0xD0
    .byte 0x00, 0x2C, 0x07, 0xD0, 0x20, 0x1C, 0xFF, 0xF7, 0xF5, 0xFA, 0x69, 0x68, 0x20, 0x1C, 0xFF, 0xF7
    .byte 0x23, 0xFD, 0x60, 0x60, 0x08, 0x35, 0x08, 0x34, 0x45, 0x45, 0xF1, 0xD1, 0x25, 0x1C, 0x04, 0x98
    .byte 0x01, 0x28, 0x0C, 0xD1, 0x00, 0x2D, 0x08, 0xD0, 0x28, 0x1C, 0xFF, 0xF7, 0xE3, 0xFA, 0x48, 0x46
    .byte 0x41, 0x68, 0x28, 0x1C, 0xFF, 0xF7, 0x10, 0xFD, 0x68, 0x60, 0x08, 0x35, 0x13, 0xE0, 0x06, 0x1C
    .byte 0x2C, 0x1C, 0x00, 0x2E, 0x0E, 0xD0, 0x00, 0x2C, 0x08, 0xD0, 0x20, 0x1C, 0xFF, 0xF7, 0xD2, 0xFA
    .byte 0x4A, 0x46, 0x51, 0x68, 0x20, 0x1C, 0xFF, 0xF7, 0xFF, 0xFC, 0x60, 0x60, 0x01, 0x3E, 0x08, 0x34
    .byte 0x00, 0x2E, 0xF0, 0xD1, 0x25, 0x1C, 0x7E, 0x68, 0x3C, 0x68, 0xB4, 0x42, 0x0A, 0xD0, 0x61, 0x68
    .byte 0x20, 0x1C, 0xFF, 0xF7, 0x99, 0xFC, 0x20, 0x1C, 0x02, 0x21, 0xFF, 0xF7, 0x75, 0xFB, 0x08, 0x34
    .byte 0xB4, 0x42, 0xF4, 0xD1, 0x38, 0x68, 0x00, 0x28, 0x01, 0xD0, 0xC7, 0xF0, 0xA9, 0xFF, 0x0B, 0x98
    .byte 0x50, 0x44, 0x51, 0x46, 0x39, 0x60, 0x7D, 0x60, 0xF8, 0x60, 0x02, 0x99, 0x48, 0x46, 0xFF, 0xF7
    .byte 0x83, 0xFC, 0x48, 0x46, 0x02, 0x21, 0xFF, 0xF7, 0x5F, 0xFB, 0x0A, 0x9A, 0x10, 0x06, 0x06, 0x0E
    .byte 0xFF, 0x2E, 0x00, 0xD0, 0x60, 0xE7, 0x38, 0x68, 0x38, 0x61, 0x09, 0x98, 0x08, 0x90, 0x07, 0x28
    .byte 0x00, 0xD8, 0x41, 0xE7, 0x07, 0x99, 0x05, 0x9A, 0x11, 0x60, 0x10, 0x1C, 0x0C, 0xB0, 0x38, 0xBC
    .byte 0x98, 0x46, 0xA1, 0x46, 0xAA, 0x46, 0xF0, 0xBC, 0x02, 0xBC, 0x08, 0x47

    thumb_func_start func_0800835C
func_0800835C: @ 0x0800835C
    movs r1, #0
    str r1, [r0]
    bx lr
    .align 2, 0

    thumb_func_start func_08008364
func_08008364: @ 0x08008364
    push {r4, r5, r6, r7, lr}
    mov r7, sb
    mov r6, r8
    push {r6, r7}
    mov r8, r0
    mov sb, r1
    ldr r0, [r0]
    cmp r0, #0
    beq .L080083B2
    adds r7, r0, #0
    adds r5, r7, #0
    adds r5, #0xa0
.L0800837C:
    cmp r7, r5
    beq .L080083AC
    subs r5, #0x14
    ldr r6, [r5, #4]
    ldr r4, [r5]
    cmp r4, r6
    beq .L080083A0
.L0800838A:
    ldr r1, [r4, #4]
    adds r0, r4, #0
    bl func_08007C28
    adds r0, r4, #0
    movs r1, #2
    bl func_080079E8
    adds r4, #8
    cmp r4, r6
    bne .L0800838A
.L080083A0:
    ldr r0, [r5]
    cmp r0, #0
    beq .L0800837C
    bl free
    b .L0800837C
.L080083AC:
    adds r0, r7, #0
    bl __builtin_delete
.L080083B2:
    movs r0, #1
    mov r1, sb
    ands r0, r1
    cmp r0, #0
    beq .L080083C2
    mov r0, r8
    bl __builtin_delete
.L080083C2:
    pop {r3, r4}
    mov r8, r3
    mov sb, r4
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_080083D0
func_080083D0: @ 0x080083D0
    push {r4, r5, r6, r7, lr}
    mov r7, sb
    mov r6, r8
    push {r6, r7}
    adds r7, r0, #0
    adds r4, r2, #0
    ldr r1, [r1]
    cmp r1, #0
    beq .L08008426
    lsls r0, r4, #2
    adds r0, r0, r4
    lsls r0, r0, #2
    adds r6, r0, r1
    ldr r0, [r6, #4]
    mov r8, r0
    ldr r4, [r6, #0x10]
    cmp r4, r8
    beq .L08008410
    mov sb, r4
.L080083F6:
    adds r5, r4, #0
    adds r4, #8
    cmp r4, r8
    bne .L08008400
    ldr r4, [r6]
.L08008400:
    ldr r1, [r5, #4]
    adds r0, r5, #0
    bl func_08007E24
    cmp r0, #1
    beq .L08008420
    cmp r4, sb
    bne .L080083F6
.L08008410:
    adds r0, r7, #0
    bl func_08007874
    ldr r1, [r4, #4]
    adds r0, r7, #0
    bl func_08007CD8
    b .L08008434
.L08008420:
    str r4, [r6, #0x10]
    adds r4, r5, #0
    b .L08008410
.L08008426:
    adds r0, r7, #0
    bl func_08007874
    adds r0, r7, #0
    adds r1, r4, #0
    bl func_08007B54
.L08008434:
    str r0, [r7, #4]
    adds r0, r7, #0
    pop {r3, r4}
    mov r8, r3
    mov sb, r4
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1

    thumb_func_start func_08008444
func_08008444: @ 0x08008444
    push {r4, r5, r6, lr}
    sub sp, #4
    adds r6, r0, #0
    ldr r0, .L080084C4 @ =vtable_unk_080E5B00
    str r0, [r6, #4]
    movs r0, #0x96
    lsls r0, r0, #3
    bl __builtin_new
    adds r4, r0, #0
    movs r1, #0x1e
    movs r2, #4
    bl func_080091A4
    movs r5, #0
    str r5, [r4, #0x24]
    str r5, [r4, #0x28]
    adds r0, r4, #0
    adds r0, #0x2c
    str r5, [r0, #4]
    adds r0, #8
    bl func_080096B0
    adds r0, r4, #0
    adds r0, #0x8c
    movs r1, #0
    movs r2, #0x20
    bl func_08009744
    movs r1, #0x92
    lsls r1, r1, #3
    adds r0, r4, r1
    bl func_08008980
    ldr r3, .L080084C8 @ =0x00000494
    adds r2, r4, r3
    str r5, [r2]
    str r5, [r2, #4]
    ldr r0, .L080084CC @ =vtable_unk_080E5BB4
    str r0, [r2, #8]
    ldr r0, .L080084D0 @ =0x000004A4
    adds r1, r4, r0
    str r1, [r2, #0xc]
    str r5, [r1]
    str r5, [r1, #4]
    ldr r0, .L080084D4 @ =vtable_unk_080E5BD8
    str r0, [r1, #8]
    adds r3, #0xc
    adds r0, r4, r3
    str r0, [r2, #0x10]
    str r1, [r2, #0x14]
    ldrh r0, [r4, #0x38]
    movs r1, #8
    orrs r0, r1
    strh r0, [r4, #0x38]
    ldr r1, .L080084D8 @ =0x04000004
    strh r0, [r1]
    str r4, [r6]
    adds r0, r6, #0
    add sp, #4
    pop {r4, r5, r6}
    pop {r1}
    bx r1
    .align 2, 0
.L080084C4: .4byte vtable_unk_080E5B00
.L080084C8: .4byte 0x00000494
.L080084CC: .4byte vtable_unk_080E5BB4
.L080084D0: .4byte 0x000004A4
.L080084D4: .4byte vtable_unk_080E5BD8
.L080084D8: .4byte 0x04000004

    thumb_func_start func_080084DC
func_080084DC: @ 0x080084DC
    push {r4, r5, r6, lr}
    sub sp, #4
    adds r6, r0, #0
    adds r4, r1, #0
    ldr r0, .L0800855C @ =vtable_unk_080E5B00
    str r0, [r6, #4]
    movs r0, #0x96
    lsls r0, r0, #3
    bl __builtin_new
    adds r5, r0, #0
    ldrh r1, [r4]
    ldrh r2, [r4, #2]
    bl func_080091A4
    movs r4, #0
    str r4, [r5, #0x24]
    str r4, [r5, #0x28]
    adds r0, r5, #0
    adds r0, #0x2c
    str r4, [r0, #4]
    adds r0, #8
    bl func_080096B0
    adds r0, r5, #0
    adds r0, #0x8c
    movs r1, #0
    movs r2, #0x20
    bl func_08009744
    movs r1, #0x92
    lsls r1, r1, #3
    adds r0, r5, r1
    bl func_08008980
    ldr r3, .L08008560 @ =0x00000494
    adds r2, r5, r3
    str r4, [r2]
    str r4, [r2, #4]
    ldr r0, .L08008564 @ =vtable_unk_080E5BB4
    str r0, [r2, #8]
    ldr r0, .L08008568 @ =0x000004A4
    adds r1, r5, r0
    str r1, [r2, #0xc]
    str r4, [r1]
    str r4, [r1, #4]
    ldr r0, .L0800856C @ =vtable_unk_080E5BD8
    str r0, [r1, #8]
    adds r3, #0xc
    adds r0, r5, r3
    str r0, [r2, #0x10]
    str r1, [r2, #0x14]
    ldrh r0, [r5, #0x38]
    movs r1, #8
    orrs r0, r1
    strh r0, [r5, #0x38]
    ldr r1, .L08008570 @ =0x04000004
    strh r0, [r1]
    str r5, [r6]
    adds r0, r6, #0
    add sp, #4
    pop {r4, r5, r6}
    pop {r1}
    bx r1
    .align 2, 0
.L0800855C: .4byte vtable_unk_080E5B00
.L08008560: .4byte 0x00000494
.L08008564: .4byte vtable_unk_080E5BB4
.L08008568: .4byte 0x000004A4
.L0800856C: .4byte vtable_unk_080E5BD8
.L08008570: .4byte 0x04000004

    thumb_func_start func_08008574
func_08008574: @ 0x08008574
    push {r4, r5, r6, lr}
    mov r6, r8
    push {r6}
    sub sp, #4
    adds r6, r0, #0
    mov r8, r1
    ldr r0, .L08008600 @ =vtable_unk_080E5B00
    str r0, [r6, #4]
    movs r0, #0x96
    lsls r0, r0, #3
    bl __builtin_new
    adds r4, r0, #0
    movs r1, #0x1e
    movs r2, #4
    bl func_080091A4
    movs r5, #0
    str r5, [r4, #0x24]
    str r5, [r4, #0x28]
    adds r0, r4, #0
    adds r0, #0x2c
    str r5, [r0, #4]
    adds r0, #8
    bl func_080096B0
    adds r0, r4, #0
    adds r0, #0x8c
    mov r2, r8
    ldrb r1, [r2]
    ldrb r2, [r2, #1]
    bl func_08009744
    movs r3, #0x92
    lsls r3, r3, #3
    adds r0, r4, r3
    bl func_08008980
    ldr r0, .L08008604 @ =0x00000494
    adds r2, r4, r0
    str r5, [r2]
    str r5, [r2, #4]
    ldr r0, .L08008608 @ =vtable_unk_080E5BB4
    str r0, [r2, #8]
    ldr r3, .L0800860C @ =0x000004A4
    adds r1, r4, r3
    str r1, [r2, #0xc]
    str r5, [r1]
    str r5, [r1, #4]
    ldr r0, .L08008610 @ =vtable_unk_080E5BD8
    str r0, [r1, #8]
    subs r3, #4
    adds r0, r4, r3
    str r0, [r2, #0x10]
    str r1, [r2, #0x14]
    ldrh r0, [r4, #0x38]
    movs r1, #8
    orrs r0, r1
    strh r0, [r4, #0x38]
    ldr r1, .L08008614 @ =0x04000004
    strh r0, [r1]
    str r4, [r6]
    adds r0, r6, #0
    add sp, #4
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6}
    pop {r1}
    bx r1
    .align 2, 0
.L08008600: .4byte vtable_unk_080E5B00
.L08008604: .4byte 0x00000494
.L08008608: .4byte vtable_unk_080E5BB4
.L0800860C: .4byte 0x000004A4
.L08008610: .4byte vtable_unk_080E5BD8
.L08008614: .4byte 0x04000004
.L08008618:
    .byte 0x70, 0xB5, 0x46, 0x46, 0x40, 0xB4, 0x81, 0xB0
    .byte 0x06, 0x1C, 0x0D, 0x1C, 0x90, 0x46, 0x1F, 0x48, 0x70, 0x60, 0x96, 0x20, 0xC0, 0x00, 0xF7, 0xF7
    .byte 0xD1, 0xFF, 0x04, 0x1C, 0x29, 0x88, 0x6A, 0x88, 0x00, 0xF0, 0xB4, 0xFD, 0x00, 0x25, 0x65, 0x62
    .byte 0xA5, 0x62, 0x20, 0x1C, 0x2C, 0x30, 0x45, 0x60, 0x08, 0x30, 0x01, 0xF0, 0x31, 0xF8, 0x20, 0x1C
    .byte 0x8C, 0x30, 0x42, 0x46, 0x11, 0x78, 0x52, 0x78, 0x01, 0xF0, 0x74, 0xF8, 0x92, 0x23, 0xDB, 0x00
    .byte 0xE0, 0x18, 0x00, 0xF0, 0x8D, 0xF9, 0x10, 0x48, 0x22, 0x18, 0x15, 0x60, 0x55, 0x60, 0x0F, 0x48
    .byte 0x90, 0x60, 0x0F, 0x4B, 0xE1, 0x18, 0xD1, 0x60, 0x0D, 0x60, 0x4D, 0x60, 0x0D, 0x48, 0x88, 0x60
    .byte 0x04, 0x3B, 0xE0, 0x18, 0x10, 0x61, 0x51, 0x61, 0x20, 0x8F, 0x08, 0x21, 0x08, 0x43, 0x20, 0x87
    .byte 0x09, 0x49, 0x08, 0x80, 0x34, 0x60, 0x30, 0x1C, 0x01, 0xB0, 0x08, 0xBC, 0x98, 0x46, 0x70, 0xBC
    .byte 0x02, 0xBC, 0x08, 0x47, 0x00, 0x5B, 0x0E, 0x08, 0x94, 0x04, 0x00, 0x00, 0xB4, 0x5B, 0x0E, 0x08
    .byte 0xA4, 0x04, 0x00, 0x00, 0xD8, 0x5B, 0x0E, 0x08, 0x04, 0x00, 0x00, 0x04

    thumb_func_start func_080086BC
func_080086BC: @ 0x080086BC
    push {r4, r5, r6, lr}
    adds r5, r0, #0
    adds r6, r1, #0
    ldr r0, .L0800871C @ =vtable_unk_080E5B00
    str r0, [r5, #4]
    ldr r0, [r5]
    cmp r0, #0
    beq .L08008706
    adds r4, r0, #0
    ldr r1, .L08008720 @ =0x00000494
    adds r0, r4, r1
    movs r1, #2
    bl func_080098DC
    movs r1, #0x92
    lsls r1, r1, #3
    adds r0, r4, r1
    movs r1, #2
    bl func_08008A68
    adds r0, r4, #0
    adds r0, #0x24
    ldr r2, [r0, #4]
    ldr r1, [r4, #0x24]
    cmp r1, r2
    beq .L080086F6
.L080086F0:
    adds r1, #0x10
    cmp r1, r2
    bne .L080086F0
.L080086F6:
    ldr r0, [r0]
    cmp r0, #0
    beq .L08008700
    bl free
.L08008700:
    adds r0, r4, #0
    bl __builtin_delete
.L08008706:
    movs r0, #1
    ands r0, r6
    cmp r0, #0
    beq .L08008714
    adds r0, r5, #0
    bl __builtin_delete
.L08008714:
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L0800871C: .4byte vtable_unk_080E5B00
.L08008720: .4byte 0x00000494

    thumb_func_start func_08008724
func_08008724: @ 0x08008724
    push {r4, lr}
    sub sp, #0x10
    ldr r4, [r0]
    adds r3, r4, #0
    adds r3, #0x34
    movs r2, #0
    ldrh r0, [r4, #0x34]
    movs r1, #0x80
    orrs r0, r1
    strh r0, [r4, #0x34]
    str r2, [sp]
    str r2, [sp, #4]
    ldr r0, .L08008770 @ =vtable_unk_080E5AF0
    str r0, [sp, #8]
    str r3, [sp, #0xc]
    movs r0, #0x92
    lsls r0, r0, #3
    adds r4, r4, r0
    adds r0, r4, #0
    bl func_08008AE0
    ldr r1, [r0, #8]
    ldr r2, [r1, #0x10]
    mov r1, sp
    bl _call_via_r2
    adds r0, r4, #0
    bl func_08008AF0
    mov r0, sp
    movs r1, #2
    bl func_080098AC
    add sp, #0x10
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L08008770: .4byte vtable_unk_080E5AF0
.L08008774:
    .byte 0x10, 0xB5, 0x84, 0xB0, 0x04, 0x68, 0x23, 0x1C, 0x34, 0x33, 0x00, 0x22
    .byte 0xA1, 0x8E, 0x0F, 0x48, 0x08, 0x40, 0xA0, 0x86, 0x00, 0x92, 0x01, 0x92, 0x0D, 0x48, 0x02, 0x90
    .byte 0x03, 0x93, 0x92, 0x20, 0xC0, 0x00, 0x24, 0x18, 0x20, 0x1C, 0x00, 0xF0, 0xA1, 0xF9, 0x81, 0x68
    .byte 0x0A, 0x69, 0x69, 0x46, 0xCB, 0xF0, 0xB6, 0xF8, 0x20, 0x1C, 0x00, 0xF0, 0xA1, 0xF9, 0x68, 0x46
    .byte 0x02, 0x21, 0x01, 0xF0, 0x7B, 0xF8, 0x04, 0xB0, 0x10, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00
    .byte 0x7F, 0xFF, 0x00, 0x00, 0xF0, 0x5A, 0x0E, 0x08

    thumb_func_start func_080087C8
func_080087C8: @ 0x080087C8
    push {r4, r5, r6, lr}
    mov r6, r8
    push {r6}
    sub sp, #0x4c
    ldr r5, [r0]
    adds r2, r5, #0
    adds r2, #0x34
    ldr r3, .L0800889C @ =vtable_unk_080E5BE8
    movs r1, #0
    str r1, [sp]
    str r1, [sp, #4]
    ldr r0, .L080088A0 @ =vtable_unk_080E5AF0
    str r0, [sp, #8]
    str r2, [sp, #0xc]
    add r0, sp, #0x10
    mov r8, r0
    adds r2, #0x58
    str r1, [sp, #0x10]
    str r1, [r0, #4]
    ldr r0, .L080088A4 @ =vtable_unk_080E5AE0
    str r0, [sp, #0x18]
    str r2, [sp, #0x1c]
    add r6, sp, #0x20
    subs r2, #0x68
    str r1, [sp, #0x20]
    str r1, [r6, #4]
    ldr r0, .L080088A8 @ =vtable_unk_080E5AD0
    str r0, [sp, #0x28]
    str r2, [sp, #0x2c]
    add r4, sp, #0x30
    str r1, [sp, #0x30]
    str r1, [r4, #4]
    ldr r0, .L080088AC @ =vtable_unk_080E5BB4
    str r0, [sp, #0x38]
    add r2, sp, #0x40
    str r2, [r4, #0xc]
    str r3, [sp, #0x48]
    str r1, [sp, #0x40]
    str r1, [r2, #4]
    ldr r0, .L080088B0 @ =vtable_unk_080E5BD8
    str r0, [r2, #8]
    add r0, sp, #0x3c
    str r0, [r4, #0x10]
    str r2, [r4, #0x14]
    ldr r0, .L080088B4 @ =0x00000494
    adds r1, r5, r0
    adds r0, r4, #0
    bl func_08009940
    adds r0, r4, #0
    mov r1, sp
    bl func_08009940
    adds r0, r4, #0
    adds r1, r6, #0
    bl func_08009940
    adds r0, r4, #0
    mov r1, r8
    bl func_08009940
    movs r0, #0x92
    lsls r0, r0, #3
    adds r5, r5, r0
    adds r0, r5, #0
    bl func_08008AE0
    ldr r1, [r0, #8]
    ldr r2, [r1, #0x10]
    adds r1, r4, #0
    bl _call_via_r2
    adds r0, r5, #0
    bl func_08008AF0
    adds r0, r5, #0
    bl func_08008AE0
    ldr r1, [r0, #8]
    ldr r2, [r1, #0x14]
    adds r1, r4, #0
    bl _call_via_r2
    adds r0, r4, #0
    movs r1, #2
    bl func_080098DC
    adds r0, r6, #0
    movs r1, #2
    bl func_080098AC
    mov r0, r8
    movs r1, #2
    bl func_080098AC
    mov r0, sp
    movs r1, #2
    bl func_080098AC
    add sp, #0x4c
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L0800889C: .4byte vtable_unk_080E5BE8
.L080088A0: .4byte vtable_unk_080E5AF0
.L080088A4: .4byte vtable_unk_080E5AE0
.L080088A8: .4byte vtable_unk_080E5AD0
.L080088AC: .4byte vtable_unk_080E5BB4
.L080088B0: .4byte vtable_unk_080E5BD8
.L080088B4: .4byte 0x00000494

    thumb_func_start func_080088B8
func_080088B8: @ 0x080088B8
    push {lr}
    ldr r0, [r0]
    bl func_08009268
    pop {r0}
    bx r0

    thumb_func_start func_080088C4
func_080088C4: @ 0x080088C4
    ldr r0, [r0]
    ldrh r0, [r0]
    bx lr
    .align 2, 0

    thumb_func_start func_080088CC
func_080088CC: @ 0x080088CC
    ldr r0, [r0]
    ldrh r0, [r0, #4]
    bx lr
    .align 2, 0

    thumb_func_start func_080088D4
func_080088D4: @ 0x080088D4
    ldr r0, [r0]
    ldrh r0, [r0, #8]
    bx lr
    .align 2, 0

    .section .text.after_hardware_get_context, "ax", %progbits

.L080088E0:
    .byte 0x00, 0xB5, 0x09, 0x04, 0x09, 0x0C, 0x00, 0x68, 0x00, 0xF0, 0xEE, 0xFC, 0x01, 0xBC, 0x00, 0x47
    .byte 0x00, 0xB5, 0x09, 0x04, 0x09, 0x0C, 0x00, 0x68, 0x00, 0xF0, 0x00, 0xFD, 0x01, 0xBC, 0x00, 0x47
    .byte 0x00, 0x68, 0x40, 0x89, 0x70, 0x47, 0x00, 0x00, 0x00, 0x68, 0x80, 0x89, 0x70, 0x47, 0x00, 0x00

    .section .text.after_hardware_accessors, "ax", %progbits

.L08008928:
    .byte 0x00, 0x68, 0x24, 0x30, 0x70, 0x47, 0x00, 0x00
    .byte 0x00, 0x68, 0x34, 0x30, 0x70, 0x47, 0x00, 0x00, 0x00, 0x68, 0x8C, 0x30, 0x70, 0x47, 0x00, 0x00

    .section .text.after_hardware_vblank_callbacks, "ax", %progbits
    thumb_func_start func_0800894C
func_0800894C: @ 0x0800894C
    push {lr}
    ldr r0, [r0]
    movs r1, #0x92
    lsls r1, r1, #3
    adds r0, r0, r1
    bl func_08008AE0
    pop {r1}
    bx r1
    .align 2, 0
.L08008960:
    .byte 0x00, 0x68, 0x01, 0x49, 0x40, 0x18, 0x70, 0x47, 0x94, 0x04, 0x00, 0x00, 0x00, 0xB5, 0x00, 0x68
    .byte 0x92, 0x21, 0xC9, 0x00, 0x40, 0x18, 0x00, 0xF0, 0xB3, 0xF8, 0x02, 0xBC, 0x08, 0x47, 0x00, 0x00

    thumb_func_start func_08008980
func_08008980: @ 0x08008980
    push {r4, r5, r6, r7, lr}
    mov r7, sb
    mov r6, r8
    push {r6, r7}
    sub sp, #4
    mov sb, r0
    movs r0, #0x6c
    bl __builtin_new
    adds r6, r0, #0
    movs r2, #0
    str r2, [r6]
    str r2, [r6, #4]
    ldr r0, .L08008A4C @ =vtable_unk_080E5B70
    str r0, [r6, #8]
    adds r5, r6, #0
    adds r5, #0xc
    str r2, [r6, #0xc]
    str r2, [r5, #4]
    ldr r0, .L08008A50 @ =vtable_unk_080E5BB4
    mov ip, r0
    str r0, [r5, #8]
    adds r1, r6, #0
    adds r1, #0x1c
    str r1, [r5, #0xc]
    str r2, [r6, #0x1c]
    str r2, [r1, #4]
    ldr r4, .L08008A54 @ =vtable_unk_080E5BD8
    str r4, [r1, #8]
    adds r0, r6, #0
    adds r0, #0x18
    str r0, [r5, #0x10]
    str r1, [r5, #0x14]
    ldr r3, .L08008A58 @ =vtable_unk_080E5B90
    str r3, [r5, #8]
    movs r1, #0x28
    adds r1, r1, r6
    mov r8, r1
    str r2, [r6, #0x28]
    str r2, [r1, #4]
    ldr r0, .L08008A5C @ =vtable_unk_080E5B60
    str r0, [r1, #8]
    adds r7, r6, #0
    adds r7, #0x34
    str r2, [r6, #0x34]
    str r2, [r7, #4]
    mov r0, ip
    str r0, [r7, #8]
    adds r1, r6, #0
    adds r1, #0x44
    str r1, [r7, #0xc]
    str r2, [r6, #0x44]
    str r2, [r1, #4]
    str r4, [r1, #8]
    adds r0, r6, #0
    adds r0, #0x40
    str r0, [r7, #0x10]
    str r1, [r7, #0x14]
    str r3, [r7, #8]
    adds r0, #0x10
    str r7, [sp]
    mov r1, sp
    bl func_080D78F8
    ldr r0, .L08008A60 @ =vtable_unk_080E5B0C
    str r0, [r7, #0x30]
    ldr r0, .L08008A64 @ =vtable_unk_080E5B18
    str r0, [r7, #8]
    adds r4, r6, #0
    adds r4, #0x68
    bl func_08008D9C
    movs r1, #1
    eors r0, r1
    strb r0, [r4]
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08008A20
    bl func_08008D84
.L08008A20:
    adds r0, r7, #0
    adds r1, r6, #0
    bl func_080095C0
    adds r0, r7, #0
    adds r1, r5, #0
    bl func_080095C0
    adds r0, r7, #0
    mov r1, r8
    bl func_080095C0
    mov r1, sb
    str r6, [r1]
    mov r0, sb
    add sp, #4
    pop {r3, r4}
    mov r8, r3
    mov sb, r4
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    .align 2, 0
.L08008A4C: .4byte vtable_unk_080E5B70
.L08008A50: .4byte vtable_unk_080E5BB4
.L08008A54: .4byte vtable_unk_080E5BD8
.L08008A58: .4byte vtable_unk_080E5B90
.L08008A5C: .4byte vtable_unk_080E5B60
.L08008A60: .4byte vtable_unk_080E5B0C
.L08008A64: .4byte vtable_unk_080E5B18

    thumb_func_start func_08008A68
func_08008A68: @ 0x08008A68
    push {r4, r5, r6, r7, lr}
    adds r6, r0, #0
    adds r7, r1, #0
    ldr r5, [r6]
    cmp r5, #0
    beq .L08008AC2
    adds r0, r5, #0
    adds r0, #0x68
    ldrb r0, [r0]
    cmp r0, #0
    beq .L08008A82
    bl func_08008D90
.L08008A82:
    adds r4, r5, #0
    adds r4, #0x34
    ldr r0, .L08008AD8 @ =vtable_unk_080E5B0C
    str r0, [r4, #0x30]
    ldr r0, .L08008ADC @ =vtable_unk_080E5B18
    str r0, [r4, #8]
    adds r0, r5, #0
    adds r0, #0x50
    movs r1, #0
    bl func_080D7944
    adds r0, r4, #0
    movs r1, #2
    bl func_0800959C
    adds r0, r5, #0
    adds r0, #0x28
    movs r1, #2
    bl func_080098AC
    adds r0, r5, #0
    adds r0, #0xc
    movs r1, #2
    bl func_0800959C
    adds r0, r5, #0
    movs r1, #2
    bl func_080098AC
    adds r0, r5, #0
    bl __builtin_delete
.L08008AC2:
    movs r0, #1
    ands r0, r7
    cmp r0, #0
    beq .L08008AD0
    adds r0, r6, #0
    bl __builtin_delete
.L08008AD0:
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08008AD8: .4byte vtable_unk_080E5B0C
.L08008ADC: .4byte vtable_unk_080E5B18

    thumb_func_start func_08008AE0
func_08008AE0: @ 0x08008AE0
    ldr r0, [r0]
    adds r0, #0xc
    bx lr
    .align 2, 0
.L08008AE8:
    .byte 0x00, 0x68, 0x0C, 0x30, 0x70, 0x47, 0x00, 0x00

    thumb_func_start func_08008AF0
func_08008AF0: @ 0x08008AF0
    push {lr}
    movs r0, #1
    bl func_08000568
    pop {r0}
    bx r0

    thumb_func_start func_08008AFC
func_08008AFC: @ 0x08008AFC
    push {lr}
    bl m4aSoundInit
    bl m4aSoundVSyncOff
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_08008B0C
func_08008B0C: @ 0x08008B0C
    push {lr}
    bl m4aSoundVSync
    movs r0, #1
    pop {r1}
    bx r1

    thumb_func_start func_08008B18
func_08008B18: @ 0x08008B18
    push {lr}
    bl m4aSoundMain
    movs r0, #1
    pop {r1}
    bx r1

    thumb_func_start func_08008B24
func_08008B24: @ 0x08008B24
    push {lr}
    adds r2, r0, #0
    ldr r0, .L08008B4C @ =0x00000005
    lsls r0, r0, #0x10
    lsrs r1, r0, #0x10
    cmp r2, r1
    blo .L08008B3A
    adds r0, r2, #0
    bl __umodsi3
    adds r2, r0, #0
.L08008B3A:
    ldr r0, .L08008B50 @ =gMusicPlayerTable
    lsls r1, r2, #1
    adds r1, r1, r2
    lsls r1, r1, #2
    adds r1, r1, r0
    ldr r0, [r1]
    pop {r1}
    bx r1
    .align 2, 0
.L08008B4C: .4byte 0x00000005
.L08008B50: .4byte gMusicPlayerTable

    thumb_func_start func_08008B54
func_08008B54: @ 0x08008B54
    push {r4, lr}
    adds r4, r0, #0
    lsls r0, r1, #0x18
    lsrs r0, r0, #0x18
    bl func_08008B24
    str r0, [r4]
    adds r0, r4, #0
    pop {r4}
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_08008B6C
func_08008B6C: @ 0x08008B6C
    push {lr}
    lsls r1, r1, #0x10
    ldr r0, [r0]
    ldr r2, .L08008B84 @ =gSongTable
    lsrs r1, r1, #0xd
    adds r1, r1, r2
    ldr r1, [r1]
    bl m4aMPlayStart
    pop {r0}
    bx r0
    .align 2, 0
.L08008B84: .4byte gSongTable

    thumb_func_start func_08008B88
func_08008B88: @ 0x08008B88
    push {lr}
    lsls r1, r1, #0x10
    ldr r2, .L08008BAC @ =gSongTable
    lsrs r1, r1, #0xd
    adds r1, r1, r2
    ldr r1, [r1]
    ldr r2, [r0]
    ldr r0, [r2]
    cmp r0, r1
    bne .L08008BA2
    ldr r0, [r2, #4]
    cmp r0, #0
    bge .L08008BA8
.L08008BA2:
    adds r0, r2, #0
    bl m4aMPlayStart
.L08008BA8:
    pop {r0}
    bx r0
    .align 2, 0
.L08008BAC: .4byte gSongTable

    thumb_func_start func_08008BB0
func_08008BB0: @ 0x08008BB0
    push {lr}
    lsls r1, r1, #0x10
    ldr r2, .L08008BCC @ =gSongTable
    lsrs r1, r1, #0xd
    adds r1, r1, r2
    ldr r1, [r1]
    ldr r2, [r0]
    ldr r0, [r2]
    cmp r0, r1
    beq .L08008BD0
    adds r0, r2, #0
    bl m4aMPlayStart
    b .L08008BDC
    .align 2, 0
.L08008BCC: .4byte gSongTable
.L08008BD0:
    ldr r0, [r2, #4]
    cmp r0, #0
    bge .L08008BDC
    adds r0, r2, #0
    bl m4aMPlayContinue
.L08008BDC:
    pop {r0}
    bx r0

    thumb_func_start func_08008BE0
func_08008BE0: @ 0x08008BE0
    push {lr}
    ldr r0, [r0]
    bl m4aMPlayStop
    pop {r0}
    bx r0
.L08008BEC:
    .byte 0x00, 0xB5, 0x00, 0x68
    .byte 0xC9, 0xF0, 0x22, 0xFC, 0x01, 0xBC, 0x00, 0x47

    thumb_func_start func_08008BF8
func_08008BF8: @ 0x08008BF8
    push {lr}
    lsls r1, r1, #0x10
    lsrs r1, r1, #0x10
    ldr r0, [r0]
    bl m4aMPlayFadeOut
    pop {r0}
    bx r0
.L08008C08:
    .byte 0x00, 0xB5, 0x09, 0x04, 0x09, 0x0C, 0x00, 0x68
    .byte 0xC9, 0xF0, 0x36, 0xFC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0xB5, 0x09, 0x04, 0x09, 0x0C, 0x00, 0x68
    .byte 0xC9, 0xF0, 0x3E, 0xFC, 0x01, 0xBC, 0x00, 0x47

    thumb_func_start func_08008C28
func_08008C28: @ 0x08008C28
    push {lr}
    lsls r1, r1, #0x10
    lsrs r1, r1, #0x10
    ldr r0, [r0]
    bl m4aMPlayTempoControl
    pop {r0}
    bx r0

    thumb_func_start func_08008C38
func_08008C38: @ 0x08008C38
    push {lr}
    adds r3, r1, #0
    adds r1, r2, #0
    lsls r3, r3, #0x10
    lsrs r3, r3, #0x10
    lsls r1, r1, #0x10
    lsrs r1, r1, #0x10
    ldr r0, [r0]
    adds r2, r3, #0
    bl m4aMPlayVolumeControl
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_08008C54
func_08008C54: @ 0x08008C54
    push {lr}
    adds r3, r1, #0
    adds r1, r2, #0
    lsls r1, r1, #0x10
    lsrs r1, r1, #0x10
    ldr r0, [r0]
    lsls r3, r3, #0x10
    asrs r3, r3, #0x10
    adds r2, r3, #0
    bl m4aMPlayPitchControl
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_08008C70
func_08008C70: @ 0x08008C70
    push {lr}
    adds r3, r1, #0
    adds r1, r2, #0
    lsls r1, r1, #0x10
    lsrs r1, r1, #0x10
    ldr r0, [r0]
    lsls r3, r3, #0x18
    asrs r3, r3, #0x18
    adds r2, r3, #0
    bl m4aMPlayPanpotControl
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_08008C8C
func_08008C8C: @ 0x08008C8C
    push {lr}
    adds r3, r1, #0
    adds r1, r2, #0
    lsls r3, r3, #0x18
    lsrs r3, r3, #0x18
    lsls r1, r1, #0x10
    lsrs r1, r1, #0x10
    ldr r0, [r0]
    adds r2, r3, #0
    bl m4aMPlayModDepthSet
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_08008CA8
func_08008CA8: @ 0x08008CA8
    push {lr}
    adds r3, r1, #0
    adds r1, r2, #0
    lsls r3, r3, #0x18
    lsrs r3, r3, #0x18
    lsls r1, r1, #0x10
    lsrs r1, r1, #0x10
    ldr r0, [r0]
    adds r2, r3, #0
    bl m4aMPlayLFOSpeedSet
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_08008CC4
func_08008CC4: @ 0x08008CC4
    push {lr}
    ldr r0, [r0]
    bl m4aMPlayImmInit
    pop {r0}
    bx r0

    thumb_func_start func_08008CD0
func_08008CD0: @ 0x08008CD0
    ldr r0, [r0]
    ldr r0, [r0, #4]
    lsrs r0, r0, #0x1f
    movs r1, #1
    eors r0, r1
    bx lr
.L08008CDC:
    .byte 0x00, 0x68, 0x80, 0x88
    .byte 0x70, 0x47, 0x00, 0x00, 0x00, 0x68, 0x00, 0x7A, 0x70, 0x47, 0x00, 0x00, 0x00, 0x68, 0x40, 0x7A
    .byte 0x70, 0x47, 0x00, 0x00, 0x00, 0x68, 0xC0, 0x68, 0x70, 0x47, 0x00, 0x00, 0x00, 0xB5, 0x81, 0xB0
    .byte 0x68, 0x46, 0x00, 0x21, 0xFF, 0xF7, 0x26, 0xFF, 0x00, 0x98, 0x01, 0xB0, 0x02, 0xBC, 0x08, 0x47
    .byte 0x00, 0xB5, 0x81, 0xB0, 0x04, 0x49, 0x09, 0x06, 0x09, 0x0E, 0x68, 0x46, 0xFF, 0xF7, 0x1A, 0xFF
    .byte 0x00, 0x98, 0x01, 0xB0, 0x02, 0xBC, 0x08, 0x47, 0x05, 0x00, 0x00, 0x00, 0x01, 0x68, 0x40, 0x31
    .byte 0x01, 0x60, 0x70, 0x47, 0x01, 0x68, 0x40, 0x39, 0x01, 0x60, 0x70, 0x47

    thumb_func_start func_08008D3C
func_08008D3C: @ 0x08008D3C
    push {lr}
    sub sp, #4
    lsls r0, r0, #0x10
    ldr r1, .L08008D58 @ =gSongTable
    lsrs r0, r0, #0xd
    adds r0, r0, r1
    ldrb r1, [r0, #4]
    mov r0, sp
    bl func_08008B54
    ldr r0, [sp]
    add sp, #4
    pop {r1}
    bx r1
    .align 2, 0
.L08008D58: .4byte gSongTable
.L08008D5C:
    .byte 0x00, 0x04, 0x03, 0x49
    .byte 0x40, 0x0B, 0x40, 0x18, 0x00, 0x68, 0x00, 0x78, 0x70, 0x47, 0x00, 0x00, 0xF0, 0xAB, 0x13, 0x08
    .byte 0x00, 0x04, 0x03, 0x49, 0x40, 0x0B, 0x40, 0x18, 0x00, 0x68, 0x80, 0x78, 0x70, 0x47, 0x00, 0x00
    .byte 0xF0, 0xAB, 0x13, 0x08

    thumb_func_start func_08008D84
func_08008D84: @ 0x08008D84
    push {lr}
    bl m4aSoundVSyncOn
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_08008D90
func_08008D90: @ 0x08008D90
    push {lr}
    bl m4aSoundVSyncOff
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_08008D9C
func_08008D9C: @ 0x08008D9C
    ldr r0, .L08008DA4 @ =0x040000C4
    ldr r0, [r0]
    lsrs r0, r0, #0x1f
    bx lr
    .align 2, 0
.L08008DA4: .4byte 0x040000C4

    thumb_func_start func_08008DA8
func_08008DA8: @ 0x08008DA8
    push {lr}
    lsls r0, r0, #0x10
    lsrs r0, r0, #0x10
    bl m4aSongNumStart
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_08008DB8
func_08008DB8: @ 0x08008DB8
    push {lr}
    lsls r0, r0, #0x10
    lsrs r0, r0, #0x10
    bl m4aSongNumStartOrChange
    pop {r0}
    bx r0
    .align 2, 0
.L08008DC8:
    .byte 0x00, 0xB5, 0x00, 0x04, 0x00, 0x0C, 0xC9, 0xF0
    .byte 0xBF, 0xFA, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0x00, 0xB5, 0x00, 0x04, 0x00, 0x0C, 0xC9, 0xF0
    .byte 0xE1, 0xFA, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00

    thumb_func_start func_08008DE8
func_08008DE8: @ 0x08008DE8
    push {lr}
    bl m4aMPlayAllStop
    pop {r0}
    bx r0
    .align 2, 0
.L08008DF4:
    .byte 0x00, 0xB5, 0x00, 0x04, 0x00, 0x0C, 0xC9, 0xF0, 0xED, 0xFA, 0x01, 0xBC
    .byte 0x00, 0x47, 0x00, 0x00, 0x00, 0xB5, 0xC9, 0xF0, 0x1D, 0xFB, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00
    .byte 0x01, 0x48, 0x00, 0x06, 0x00, 0x0E, 0x70, 0x47, 0x05, 0x00, 0x00, 0x00, 0x01, 0x48, 0x00, 0x06
    .byte 0x00, 0x0E, 0x70, 0x47, 0xD3, 0x00, 0x00, 0x00, 0x00, 0xB5, 0x00, 0x2A, 0x15, 0xD0, 0x01, 0x43
    .byte 0x11, 0x43, 0x01, 0x20, 0x08, 0x40, 0x00, 0x28, 0x0F, 0xD1, 0x03, 0x20, 0x01, 0x40, 0x00, 0x29
    .byte 0x05, 0xD1, 0x90, 0x03, 0x02, 0x0C, 0x84, 0x20, 0x00, 0x06, 0x02, 0x43, 0x06, 0xE0, 0xD0, 0x03
    .byte 0x02, 0x0C, 0x80, 0x20, 0x00, 0x06, 0x02, 0x43, 0x00, 0xE0, 0x00, 0x22, 0x10, 0x1C, 0x02, 0xBC
    .byte 0x08, 0x47, 0x00, 0x00

    .section .text.after_hardware_transfer_setup, "ax", %progbits
.L08008FB8:
    .byte 0x10, 0xB5, 0x81, 0xB0, 0x02, 0x1C, 0x54, 0x68
    .byte 0x10, 0x68, 0x01, 0x28, 0x01, 0xD1, 0x00, 0x94, 0x6C, 0x46, 0x91, 0x68, 0xD2, 0x68, 0x04, 0x4B
    .byte 0x20, 0x1C, 0xC7, 0xF0, 0x73, 0xFF, 0x01, 0xB0, 0x10, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00
    .byte 0xD4, 0x00, 0x00, 0x04

    .section .text.after_hardware_transfer_execute, "ax", %progbits
.L0800901C:
    .byte 0xF0, 0xB5, 0x82, 0xB0
    .byte 0x01, 0x1C, 0x4C, 0x68, 0x08, 0x68, 0x01, 0x28, 0x01, 0xD1, 0x00, 0x94, 0x6C, 0x46, 0xCE, 0x68
    .byte 0x8F, 0x68, 0x80, 0x20, 0xC0, 0x04, 0x30, 0x40, 0x00, 0x28, 0x21, 0xD0, 0x0F, 0x4D, 0x35, 0x40
    .byte 0x07, 0x23, 0x2B, 0x40, 0xED, 0x1A, 0x00, 0x2D, 0x01, 0xD1, 0x00, 0x2B, 0x10, 0xD1, 0xF2, 0x1A
    .byte 0x20, 0x1C, 0x39, 0x1C, 0x01, 0x93, 0xCA, 0xF0, 0x79, 0xFB, 0xA9, 0x00, 0x7F, 0x18, 0x80, 0x20
    .byte 0x40, 0x04, 0x30, 0x40, 0x01, 0x9B, 0x00, 0x28, 0x00, 0xD1, 0x64, 0x18, 0x00, 0x2B, 0x0C, 0xD0
    .byte 0x72, 0x1B, 0x20, 0x1C, 0x39, 0x1C, 0xCA, 0xF0, 0x6B, 0xFB, 0x06, 0xE0, 0xFF, 0xFF, 0x00, 0x00
    .byte 0x20, 0x1C, 0x39, 0x1C, 0x32, 0x1C, 0xCA, 0xF0, 0x63, 0xFB, 0x02, 0xB0, 0xF0, 0xBC, 0x01, 0xBC
    .byte 0x00, 0x47, 0x00, 0x00

    thumb_func_start func_08009094
func_08009094: @ 0x08009094
    push {r4, r5, r6, r7, lr}
    mov r7, sb
    mov r6, r8
    push {r6, r7}
    sub sp, #8
    mov sb, r1
    adds r7, r0, #0
    cmp r7, sb
    beq .L0800911C
.L080090A6:
    ldr r4, [r7, #4]
    ldr r0, [r7]
    cmp r0, #1
    bne .L080090B2
    str r4, [sp]
    mov r4, sp
.L080090B2:
    ldr r6, [r7, #0xc]
    ldr r3, [r7, #8]
    movs r0, #0x80
    lsls r0, r0, #0x13
    ands r0, r6
    cmp r0, #0
    beq .L0800910C
    ldr r5, .L08009108 @ =0x0000FFFF
    ands r5, r6
    movs r0, #7
    mov r8, r0
    ands r0, r5
    mov r8, r0
    subs r5, r5, r0
    cmp r5, #0
    bne .L080090D6
    cmp r0, #0
    bne .L080090FC
.L080090D6:
    mov r0, r8
    subs r2, r6, r0
    adds r0, r4, #0
    adds r1, r3, #0
    str r3, [sp, #4]
    bl CpuFastSet
    lsls r1, r5, #2
    ldr r3, [sp, #4]
    adds r3, r3, r1
    movs r0, #0x80
    lsls r0, r0, #0x11
    ands r0, r6
    cmp r0, #0
    bne .L080090F6
    adds r4, r4, r1
.L080090F6:
    mov r0, r8
    cmp r0, #0
    beq .L08009116
.L080090FC:
    subs r2, r6, r5
    adds r0, r4, #0
    adds r1, r3, #0
    bl CpuSet
    b .L08009116
    .align 2, 0
.L08009108: .4byte 0x0000FFFF
.L0800910C:
    adds r0, r4, #0
    adds r1, r3, #0
    adds r2, r6, #0
    bl CpuSet
.L08009116:
    adds r7, #0x10
    cmp r7, sb
    bne .L080090A6
.L0800911C:
    add sp, #8
    pop {r3, r4}
    mov r8, r3
    mov sb, r4
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0

    .section .text.after_key_input, "ax", %progbits

    thumb_func_start func_080091A4
func_080091A4: @ 0x080091A4
    push {r4, r5, r6, lr}
    sub sp, #4
    adds r6, r0, #0
    adds r4, r1, #0
    adds r5, r2, #0
    lsls r4, r4, #0x10
    lsrs r4, r4, #0x10
    lsls r5, r5, #0x10
    lsrs r5, r5, #0x10
    bl func_08009168
    ldrh r0, [r6, #4]
    movs r1, #0
    strh r0, [r6, #8]
    strh r4, [r6, #0xa]
    strh r5, [r6, #0xc]
    str r1, [sp]
    adds r0, r6, #0
    adds r0, #0xe
    adds r1, r6, #0
    adds r1, #0x22
    cmp r0, r1
    beq .L080091DC
    movs r2, #0
.L080091D4:
    strh r2, [r0]
    adds r0, #2
    cmp r0, r1
    bne .L080091D4
.L080091DC:
    adds r0, r6, #0
    add sp, #4
    pop {r4, r5, r6}
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_080091E8
func_080091E8: @ 0x080091E8
    push {r4, lr}
    sub sp, #4
    adds r4, r0, #0
    bl func_0800917C
    ldrh r0, [r4, #4]
    movs r1, #0
    strh r0, [r4, #8]
    movs r0, #0x1e
    strh r0, [r4, #0xa]
    movs r0, #4
    strh r0, [r4, #0xc]
    str r1, [sp]
    adds r0, r4, #0
    adds r0, #0xe
    adds r1, r4, #0
    adds r1, #0x22
    cmp r0, r1
    beq .L08009218
    movs r2, #0
.L08009210:
    strh r2, [r0]
    adds r0, #2
    cmp r0, r1
    bne .L08009210
.L08009218:
    adds r0, r4, #0
    add sp, #4
    pop {r4}
    pop {r1}
    bx r1
    .align 2, 0
.L08009224:
    .byte 0x70, 0xB5, 0x81, 0xB0, 0x06, 0x1C, 0x0C, 0x1C, 0x15, 0x1C, 0x19, 0x1C
    .byte 0x24, 0x04, 0x24, 0x0C, 0x2D, 0x04, 0x2D, 0x0C, 0xFF, 0xF7, 0xA0, 0xFF, 0xB0, 0x88, 0x00, 0x21
    .byte 0x30, 0x81, 0x74, 0x81, 0xB5, 0x81, 0x00, 0x91, 0x30, 0x1C, 0x0E, 0x30, 0x31, 0x1C, 0x22, 0x31
    .byte 0x88, 0x42, 0x04, 0xD0, 0x00, 0x22, 0x02, 0x80, 0x02, 0x30, 0x88, 0x42, 0xFB, 0xD1, 0x30, 0x1C
    .byte 0x01, 0xB0, 0x70, 0xBC, 0x02, 0xBC, 0x08, 0x47

    thumb_func_start func_08009268
func_08009268: @ 0x08009268
    push {r4, r5, r6, r7, lr}
    mov r7, r8
    push {r7}
    adds r4, r0, #0
    bl func_08009190
    mov ip, r0
    ldrh r0, [r4]
    mov r8, r0
    ldrh r6, [r4, #0xc]
    ldrh r5, [r4, #0xa]
    movs r3, #0
    movs r2, #0x80
    lsls r2, r2, #2
    adds r1, r4, #0
    adds r1, #0x20
.L08009288:
    mov r0, r8
    ands r0, r2
    cmp r0, #0
    beq .L080092B0
    mov r0, ip
    ands r0, r2
    cmp r0, #0
    bne .L080092AA
    movs r7, #0
    ldrsh r0, [r1, r7]
    cmp r0, r5
    beq .L080092A4
    adds r0, #1
    b .L080092AE
.L080092A4:
    orrs r3, r2
    subs r0, r0, r6
    b .L080092AE
.L080092AA:
    orrs r3, r2
    movs r0, #0
.L080092AE:
    strh r0, [r1]
.L080092B0:
    subs r1, #2
    lsrs r2, r2, #1
    cmp r2, #0
    bne .L08009288
    strh r3, [r4, #8]
    adds r0, r3, #0
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_080092C8
func_080092C8: @ 0x080092C8
    push {r4, r5, r6, lr}
    adds r4, r0, #0
    lsls r1, r1, #0x10
    lsrs r6, r1, #0x10
    ldrh r5, [r4]
    movs r3, #0x80
    lsls r3, r3, #2
    adds r2, r4, #0
    adds r2, #0x20
    ldrh r0, [r4, #0xa]
    subs r1, r6, r0
.L080092DE:
    adds r0, r5, #0
    ands r0, r3
    cmp r0, #0
    beq .L080092EC
    ldrh r0, [r2]
    adds r0, r0, r1
    strh r0, [r2]
.L080092EC:
    subs r2, #2
    lsrs r3, r3, #1
    cmp r3, #0
    bne .L080092DE
    strh r6, [r4, #0xa]
    pop {r4, r5, r6}
    pop {r0}
    bx r0

    thumb_func_start func_080092FC
func_080092FC: @ 0x080092FC
    strh r1, [r0, #0xc]
    bx lr

    thumb_func_start func_08009300
func_08009300: @ 0x08009300
    push {r4, r5, lr}
    adds r5, r0, #0
    adds r4, r1, #0
    movs r0, #0x10
    bl __builtin_new
    str r4, [r0]
    movs r2, #0
    movs r1, #0
    strh r1, [r0, #4]
    str r1, [r0, #8]
    strb r2, [r0, #0xc]
    strh r1, [r0, #0xe]
    str r0, [r5]
    adds r0, r5, #0
    pop {r4, r5}
    pop {r1}
    bx r1

    thumb_func_start func_08009324
func_08009324: @ 0x08009324
    push {r4, r5, lr}
    adds r5, r0, #0
    adds r4, r1, #0
    ldr r0, [r5]
    bl __builtin_delete
    movs r0, #1
    ands r0, r4
    cmp r0, #0
    beq .L0800933E
    adds r0, r5, #0
    bl __builtin_delete
.L0800933E:
    pop {r4, r5}
    pop {r0}
    bx r0

    thumb_func_start func_08009344
func_08009344: @ 0x08009344
    ldr r2, [r0]
    ldr r0, [r2]
    str r1, [r2]
    bx lr

    thumb_func_start func_0800934C
func_0800934C: @ 0x0800934C
    push {r4, lr}
    adds r4, r2, #0
    ldr r2, [r0]
    lsls r1, r1, #0x10
    asrs r0, r1, #0x10
    cmp r0, #0
    bge .L0800935C
    rsbs r0, r0, #0
.L0800935C:
    rsbs r0, r0, #0
    rsbs r1, r3, #0
    orrs r1, r3
    lsrs r1, r1, #0x1f
    strh r0, [r2, #4]
    str r4, [r2, #8]
    strb r1, [r2, #0xc]
    ldr r0, .L08009374 @ =0x0000FFFF
    strh r0, [r2, #0xe]
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L08009374: .4byte 0x0000FFFF

    thumb_func_start func_08009378
func_08009378: @ 0x08009378
    push {r4, r5, lr}
    adds r5, r2, #0
    adds r4, r3, #0
    ldr r3, [r0]
    lsls r1, r1, #0x10
    asrs r2, r1, #0x10
    cmp r2, #0
    bge .L0800938A
    rsbs r2, r2, #0
.L0800938A:
    rsbs r0, r4, #0
    orrs r0, r4
    lsrs r0, r0, #0x1f
    movs r1, #0
    strh r2, [r3, #4]
    str r5, [r3, #8]
    strb r0, [r3, #0xc]
    strh r1, [r3, #0xe]
    pop {r4, r5}
    pop {r0}
    bx r0

    thumb_func_start func_080093A0
func_080093A0: @ 0x080093A0
    ldr r2, [r0]
    ldrh r0, [r2, #4]
    strh r1, [r2, #4]
    lsls r0, r0, #0x10
    asrs r0, r0, #0x10
    bx lr

    thumb_func_start func_080093AC
func_080093AC: @ 0x080093AC
    push {r4, r5, r6, r7, lr}
    ldr r5, [r0]
    movs r0, #4
    ldrsh r7, [r5, r0]
    cmp r7, #0
    beq .L0800949C
    ldrh r4, [r5, #0xe]
    ldr r0, [r5, #8]
    cmp r0, #0
    beq .L08009422
    movs r6, #0
    cmp r0, #1
    beq .L080093CE
    cmp r0, #2
    bne .L080093D0
    movs r6, #0xc0
    b .L080093D0
.L080093CE:
    movs r6, #0x80
.L080093D0:
    ldr r3, [r5]
    cmp r3, #0
    beq .L080093DC
    adds r2, r3, #0
    adds r2, #0x50
    b .L080093DE
.L080093DC:
    ldr r2, .L080093F4 @ =0x04000050
.L080093DE:
    ldrh r1, [r2]
    ldr r0, .L080093F8 @ =0x0000FF3F
    ands r0, r1
    orrs r0, r6
    strh r0, [r2]
    cmp r3, #0
    beq .L080093FC
    adds r1, r3, #0
    adds r1, #0x54
    b .L080093FE
    .align 2, 0
.L080093F4: .4byte 0x04000050
.L080093F8: .4byte 0x0000FF3F
.L080093FC:
    ldr r1, .L08009408 @ =0x04000054
.L080093FE:
    ldr r0, .L0800940C @ =0x0000FFFE
    cmp r4, r0
    bls .L08009410
    movs r0, #0x10
    b .L08009420
    .align 2, 0
.L08009408: .4byte 0x04000054
.L0800940C: .4byte 0x0000FFFE
.L08009410:
    cmp r4, #0
    bne .L08009418
    movs r0, #0
    b .L08009420
.L08009418:
    lsls r0, r4, #4
    subs r0, r0, r4
    lsrs r0, r0, #0x10
    adds r0, #1
.L08009420:
    strh r0, [r1]
.L08009422:
    ldrb r0, [r5, #0xc]
    cmp r0, #0
    beq .L08009460
    ldr r0, .L08009434 @ =0x0000FFFE
    cmp r4, r0
    bls .L08009438
    movs r1, #0xf
    b .L0800944A
    .align 2, 0
.L08009434: .4byte 0x0000FFFE
.L08009438:
    cmp r4, #0
    bne .L08009440
    movs r1, #0
    b .L0800944A
.L08009440:
    lsls r0, r4, #3
    subs r0, r0, r4
    lsls r0, r0, #1
    lsrs r0, r0, #0x10
    adds r1, r0, #1
.L0800944A:
    lsls r0, r1, #4
    orrs r1, r0
    lsls r0, r1, #8
    orrs r1, r0
    ldr r0, [r5]
    cmp r0, #0
    beq .L0800945C
    adds r0, #0x4c
    b .L0800945E
.L0800945C:
    ldr r0, .L0800946C @ =0x0400004C
.L0800945E:
    strh r1, [r0]
.L08009460:
    cmp r7, #0
    blt .L08009474
    ldr r0, .L08009470 @ =0x0000FFFF
    cmp r4, r0
    beq .L08009478
    b .L0800947E
    .align 2, 0
.L0800946C: .4byte 0x0400004C
.L08009470: .4byte 0x0000FFFF
.L08009474:
    cmp r4, #0
    bne .L0800947E
.L08009478:
    movs r0, #0
    strh r0, [r5, #4]
    b .L0800949E
.L0800947E:
    adds r0, r4, r7
    cmp r0, #0
    bge .L08009488
    movs r0, #0
    b .L08009490
.L08009488:
    ldr r1, .L08009498 @ =0x0000FFFF
    cmp r0, r1
    ble .L08009490
    adds r0, r1, #0
.L08009490:
    strh r0, [r5, #0xe]
    movs r0, #1
    b .L0800949E
    .align 2, 0
.L08009498: .4byte 0x0000FFFF
.L0800949C:
    movs r0, #0
.L0800949E:
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1

    thumb_func_start func_080094A4
func_080094A4: @ 0x080094A4
    ldr r0, [r0]
    movs r1, #4
    ldrsh r0, [r0, r1]
    bx lr

    thumb_func_start func_080094AC
func_080094AC: @ 0x080094AC
    push {lr}
    adds r0, #0xc
    bl func_080093AC
    pop {r1}
    bx r1

    thumb_func_start func_080094B8
func_080094B8: @ 0x080094B8
    push {r4, r5, lr}
    adds r4, r0, #0
    adds r5, r1, #0
    ldr r0, .L080094DC @ =vtable_unk_080E5B80
    str r0, [r4, #8]
    adds r0, r4, #0
    adds r0, #0xc
    movs r1, #2
    bl func_08009324
    adds r0, r4, #0
    adds r1, r5, #0
    bl func_080098AC
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L080094DC: .4byte vtable_unk_080E5B80
.L080094E0:
    .byte 0x00, 0xB5, 0x0C, 0x30, 0xFF, 0xF7, 0xDE, 0xFF, 0x01, 0x1C, 0x09, 0x04, 0x09, 0x14, 0x48, 0x42
    .byte 0x08, 0x43, 0xC0, 0x0F, 0x02, 0xBC, 0x08, 0x47, 0x00, 0xB5, 0x0C, 0x30, 0xFF, 0xF7, 0xD2, 0xFF
    .byte 0x00, 0x04, 0x00, 0x14, 0x02, 0xBC, 0x08, 0x47, 0x00, 0xB5, 0x0C, 0x30, 0x09, 0x04, 0x09, 0x14
    .byte 0xFF, 0xF7, 0x46, 0xFF

    thumb_func_start func_08009514
func_08009514: @ 0x08009514
    lsls r0, r0, #0x10
    asrs r0, r0, #0x10
    pop {r1}
    bx r1
.L0800951C:
    .byte 0x00, 0xB5, 0x0C, 0x30
    .byte 0x09, 0x04, 0x09, 0x14, 0xFF, 0xF7, 0x28, 0xFF, 0x01, 0xBC, 0x00, 0x47, 0x00, 0xB5, 0x0C, 0x30
    .byte 0x09, 0x04, 0x09, 0x14, 0xFF, 0xF7, 0x0A, 0xFF, 0x01, 0xBC, 0x00, 0x47, 0x00, 0xB5, 0x0C, 0x30
    .byte 0xFF, 0xF7, 0x00, 0xFF, 0x02, 0xBC, 0x08, 0x47, 0x10, 0xB5, 0x04, 0x1C, 0x00, 0x20, 0x20, 0x60
    .byte 0x60, 0x60, 0x05, 0x48, 0xA0, 0x60, 0x20, 0x1C, 0x0C, 0x30, 0xFF, 0xF7, 0xD1, 0xFE, 0x20, 0x1C
    .byte 0x10, 0xBC, 0x02, 0xBC, 0x08, 0x47, 0x00, 0x00, 0x80, 0x5B, 0x0E, 0x08

    thumb_func_start func_0800956C
func_0800956C: @ 0x0800956C
    push {r4, r5, r6, lr}
    sub sp, #4
    adds r6, r0, #0
    mov r5, sp
    movs r4, #1
    movs r0, #1
    bl func_08000528
    ands r4, r0
    strh r4, [r5]
    adds r0, r6, #0
    bl func_08009984
    mov r1, sp
    ldrh r0, [r1]
    cmp r0, #0
    beq .L08009592
    bl func_080004F4
.L08009592:
    add sp, #4
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_0800959C
func_0800959C: @ 0x0800959C
    push {r4, r5, lr}
    adds r4, r0, #0
    adds r5, r1, #0
    ldr r0, .L080095BC @ =vtable_unk_080E5B90
    str r0, [r4, #8]
    adds r0, r4, #0
    bl func_0800956C
    adds r0, r4, #0
    adds r1, r5, #0
    bl func_080098DC
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L080095BC: .4byte vtable_unk_080E5B90

    thumb_func_start func_080095C0
func_080095C0: @ 0x080095C0
    push {r4, r5, r6, lr}
    mov r6, r8
    push {r6}
    sub sp, #4
    adds r6, r0, #0
    mov r8, r1
    mov r5, sp
    movs r4, #1
    movs r0, #1
    bl func_08000528
    ands r4, r0
    strh r4, [r5]
    adds r0, r6, #0
    mov r1, r8
    bl func_08009940
    mov r1, sp
    ldrh r0, [r1]
    cmp r0, #0
    beq .L080095EE
    bl func_080004F4
.L080095EE:
    add sp, #4
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_080095FC
func_080095FC: @ 0x080095FC
    push {r4, r5, r6, lr}
    mov r6, r8
    push {r6}
    sub sp, #4
    adds r6, r0, #0
    mov r8, r1
    mov r5, sp
    movs r4, #1
    movs r0, #1
    bl func_08000528
    ands r4, r0
    strh r4, [r5]
    adds r0, r6, #0
    mov r1, r8
    bl func_08009968
    mov r1, sp
    ldrh r0, [r1]
    cmp r0, #0
    beq .L0800962A
    bl func_080004F4
.L0800962A:
    add sp, #4
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_08009638
func_08009638: @ 0x08009638
    push {r4, r5, r6, lr}
    mov r6, r8
    push {r6}
    sub sp, #4
    adds r6, r0, #0
    mov r8, r1
    mov r5, sp
    movs r4, #1
    movs r0, #1
    bl func_08000528
    ands r4, r0
    strh r4, [r5]
    adds r0, r6, #0
    mov r1, r8
    bl func_080099B0
    mov r1, sp
    ldrh r0, [r1]
    cmp r0, #0
    beq .L08009666
    bl func_080004F4
.L08009666:
    add sp, #4
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_08009674
func_08009674: @ 0x08009674
    push {r4, r5, r6, lr}
    mov r6, r8
    push {r6}
    sub sp, #4
    adds r6, r0, #0
    mov r8, r1
    mov r5, sp
    movs r4, #1
    movs r0, #1
    bl func_08000528
    ands r4, r0
    strh r4, [r5]
    adds r0, r6, #0
    mov r1, r8
    bl func_080099D4
    mov r1, sp
    ldrh r0, [r1]
    cmp r0, #0
    beq .L080096A2
    bl func_080004F4
.L080096A2:
    add sp, #4
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_080096B0
func_080096B0: @ 0x080096B0
    push {r4, lr}
    sub sp, #4
    adds r4, r0, #0
    mov r1, sp
    movs r0, #0
    strh r0, [r1]
    ldr r2, .L080096EC @ =0x0100002B
    mov r0, sp
    adds r1, r4, #0
    bl CpuSet
    movs r0, #0x80
    str r0, [r4]
    movs r0, #0
    movs r1, #0x80
    lsls r1, r1, #1
    strh r1, [r4, #0x20]
    strh r0, [r4, #0x22]
    strh r0, [r4, #0x24]
    strh r1, [r4, #0x26]
    strh r1, [r4, #0x30]
    strh r0, [r4, #0x32]
    strh r0, [r4, #0x34]
    strh r1, [r4, #0x36]
    adds r0, r4, #0
    add sp, #4
    pop {r4}
    pop {r1}
    bx r1
    .align 2, 0
.L080096EC: .4byte 0x0100002B

    thumb_func_start func_080096F0
func_080096F0: @ 0x080096F0
    push {r4, lr}
    adds r4, r0, #0
    movs r1, #0x80
    lsls r1, r1, #0x13
    movs r2, #0x54
    bl func_08008E64
    ldr r1, .L0800970C @ =0x04000054
    adds r4, #0x54
    ldrh r0, [r4]
    strh r0, [r1]
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L0800970C: .4byte 0x04000054
.L08009710:
    .byte 0x10, 0xB5, 0x04, 0x1C, 0x80, 0x21, 0xC9, 0x04, 0x10, 0x22, 0xCA, 0xF0, 0x17, 0xF8, 0x20, 0x1C
    .byte 0x40, 0x30, 0x05, 0x49, 0x05, 0x4A, 0xCA, 0xF0, 0x13, 0xF8, 0x05, 0x49, 0xA0, 0x8A, 0x08, 0x80
    .byte 0x10, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0x40, 0x00, 0x00, 0x04, 0x05, 0x00, 0x00, 0x04
    .byte 0x14, 0x00, 0x00, 0x04

    thumb_func_start func_08009744
func_08009744: @ 0x08009744
    push {lr}
    adds r3, r0, #0
    lsls r1, r1, #0x18
    lsrs r1, r1, #0x18
    lsls r2, r2, #0x18
    lsrs r2, r2, #0x18
    movs r0, #0x7f
    ands r1, r0
    strb r1, [r3, #1]
    strb r1, [r3]
    movs r0, #0x1f
    ands r2, r0
    strb r2, [r3, #3]
    strb r2, [r3, #2]
    adds r0, r3, #4
    ldr r2, .L08009778 @ =0x00000404
    adds r1, r3, r2
    movs r2, #2
.L08009768:
    strb r2, [r0, #1]
    adds r0, #8
    cmp r0, r1
    bne .L08009768
    adds r0, r3, #0
    pop {r1}
    bx r1
    .align 2, 0
.L08009778: .4byte 0x00000404

    thumb_func_start func_0800977C
func_0800977C: @ 0x0800977C
    push {lr}
    adds r0, #4
    movs r1, #0xe0
    lsls r1, r1, #0x13
    movs r2, #0x80
    lsls r2, r2, #3
    bl func_08008E64
    pop {r0}
    bx r0
.L08009790:
    .byte 0x00, 0xB5, 0x04, 0x30, 0xE0, 0x21, 0xC9, 0x04, 0x80, 0x22, 0x52, 0x00, 0xC9, 0xF0, 0xD6, 0xFF
    .byte 0x01, 0xBC, 0x00, 0x47

    thumb_func_start func_080097A4
func_080097A4: @ 0x080097A4
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    mov sl, r0
    mov r3, sl
    adds r3, #4
    movs r4, #0xe0
    lsls r4, r4, #0x13
    mov r1, sl
    ldrb r0, [r1]
    lsls r0, r0, #3
    adds r0, #4
    adds r6, r1, r0
    movs r5, #0
    movs r7, #0x80
    lsls r7, r7, #3
    mov sb, r7
    ldr r0, .L0800982C @ =0x00000FFF
    mov r8, r0
.L080097CE:
    mov r1, sl
    adds r1, #4
    cmp r1, r6
    beq .L080097FC
    movs r7, #0xc0
    lsls r7, r7, #4
    mov ip, r7
.L080097DC:
    ldrh r2, [r1, #4]
    adds r0, r2, #0
    mov r7, ip
    ands r0, r7
    cmp r0, r5
    bne .L080097F6
    ldr r0, [r1]
    str r0, [r4]
    strh r2, [r4, #4]
    ldrh r0, [r3, #6]
    strh r0, [r4, #6]
    adds r3, #8
    adds r4, #8
.L080097F6:
    adds r1, #8
    cmp r1, r6
    bne .L080097DC
.L080097FC:
    add r5, sb
    cmp r5, r8
    bls .L080097CE
    ldr r0, .L08009830 @ =0x07000400
    cmp r4, r0
    beq .L0800981C
    movs r2, #0x80
    lsls r2, r2, #2
    adds r1, r0, #0
.L0800980E:
    str r2, [r4]
    ldrh r0, [r3, #6]
    strh r0, [r4, #6]
    adds r3, #8
    adds r4, #8
    cmp r4, r1
    bne .L0800980E
.L0800981C:
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L0800982C: .4byte 0x00000FFF
.L08009830: .4byte 0x07000400

    thumb_func_start func_08009834
func_08009834: @ 0x08009834
    push {r4, lr}
    adds r2, r0, #0
    ldrb r4, [r2]
    ldrb r3, [r2, #1]
    cmp r4, r3
    bls .L08009856
    lsls r0, r3, #3
    adds r0, #4
    adds r1, r2, r0
    lsls r0, r4, #3
    adds r0, #4
    adds r0, r2, r0
    movs r4, #2
.L0800984E:
    strb r4, [r1, #1]
    adds r1, #8
    cmp r1, r0
    bne .L0800984E
.L08009856:
    strb r3, [r2]
    ldrb r0, [r2, #3]
    strb r0, [r2, #2]
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_08009864
func_08009864: @ 0x08009864
    push {r4, lr}
    adds r4, r0, #0
    bl func_0800977C
    adds r0, r4, #0
    bl func_08009834
    pop {r4}
    pop {r0}
    bx r0
.L08009878:
    .byte 0x10, 0xB5, 0x04, 0x1C, 0x20, 0x1D, 0xE0, 0x21
    .byte 0xC9, 0x04, 0x80, 0x22, 0x52, 0x00, 0xC9, 0xF0, 0x61, 0xFF, 0x20, 0x1C, 0xFF, 0xF7, 0xD2, 0xFF
    .byte 0x10, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0x10, 0xB5, 0x04, 0x1C, 0xFF, 0xF7, 0x82, 0xFF
    .byte 0x20, 0x1C, 0xFF, 0xF7, 0xC7, 0xFF, 0x10, 0xBC, 0x01, 0xBC, 0x00, 0x47

    .section .text.after_intrusive_callback_node_destroy, "ax", %progbits
.L080098D8:
    .byte 0x01, 0x20, 0x70, 0x47

    .section .text.after_intrusive_callback_list_destroy, "ax", %progbits

    thumb_func_start func_08009908
func_08009908: @ 0x08009908
    push {r4, r5, r6, r7, lr}
    adds r6, r0, #0
    ldr r5, [r6, #0xc]
    adds r7, r6, #0
    adds r7, #0x10
.L08009912:
    cmp r5, r7
    beq .L08009938
    adds r4, r5, #0
    ldr r5, [r5, #4]
    ldr r0, [r4, #8]
    ldr r1, [r0, #8]
    adds r0, r4, #0
    bl _call_via_r1
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08009912
    ldr r0, [r6, #8]
    ldr r2, [r0, #0x14]
    adds r0, r6, #0
    adds r1, r4, #0
    bl _call_via_r2
    b .L08009912
.L08009938:
    movs r0, #1
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1

    .section .text.after_intrusive_callback_list_append, "ax", %progbits
    .align 2, 0

    .section .text.after_intrusive_callback_list_remove, "ax", %progbits
    .align 2, 0

    .section .text.after_intrusive_callback_list_clear, "ax", %progbits

    thumb_func_start func_080099B0
func_080099B0: @ 0x080099B0
    adds r3, r1, #0
    ldr r2, [r0, #0x10]
    ldr r1, [r3, #0xc]
    str r1, [r2]
    ldr r1, [r3, #0xc]
    str r2, [r1]
    ldr r2, [r3, #0x10]
    adds r1, r0, #0
    adds r1, #0x10
    str r1, [r2]
    str r2, [r0, #0x10]
    adds r0, r3, #0
    adds r0, #0x10
    str r0, [r3, #0xc]
    subs r0, #4
    str r0, [r3, #0x10]
    bx lr
    .align 2, 0

    thumb_func_start func_080099D4
func_080099D4: @ 0x080099D4
    ldr r3, [r0, #0xc]
    ldr r2, [r1, #0xc]
    str r2, [r0, #0xc]
    str r3, [r1, #0xc]
    ldr r2, [r0, #0x10]
    ldr r1, [r1, #0x10]
    ldr r3, [r2]
    ldr r0, [r1]
    str r0, [r2]
    str r3, [r1]
    bx lr
    .align 2, 0
.L080099EC:
    .byte 0x00, 0xB5, 0x00, 0x22
    .byte 0x01, 0x1C, 0x10, 0x31, 0xC0, 0x68, 0x88, 0x42, 0x00, 0xD1, 0x01, 0x22, 0x10, 0x1C, 0x02, 0xBC
    .byte 0x08, 0x47, 0x00, 0x00, 0x00, 0x23, 0x03, 0x60, 0x43, 0x60, 0x06, 0x49, 0x81, 0x60, 0x02, 0x1C
    .byte 0x10, 0x32, 0xC2, 0x60, 0x53, 0x60, 0x04, 0x49, 0x91, 0x60, 0x01, 0x1C, 0x0C, 0x31, 0x01, 0x61
    .byte 0x42, 0x61, 0x70, 0x47, 0xB4, 0x5B, 0x0E, 0x08, 0xD8, 0x5B, 0x0E, 0x08, 0x01, 0x68, 0x48, 0x42
    .byte 0x08, 0x43, 0xC0, 0x0F, 0x70, 0x47, 0x00, 0x00, 0x02, 0x49, 0x81, 0x60, 0x00, 0x21, 0x01, 0x60
    .byte 0x41, 0x60, 0x70, 0x47, 0xE8, 0x5B, 0x0E, 0x08
