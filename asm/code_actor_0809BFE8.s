    .INCLUDE "asm/macro.inc"
    .SYNTAX UNIFIED

    thumb_func_start func_0809C420
func_0809C420: @ 0x0809C420
    push {lr}
    adds r2, r0, #0
    adds r0, r2, r1
    ldrb r0, [r0]
    cmp r0, #0
    beq .L0809C43E
    cmp r1, #0
    beq .L0809C434
    cmp r1, #3
    bne .L0809C43E
.L0809C434:
    adds r0, r2, #0
    adds r0, #0xc
    adds r0, r0, r1
    movs r1, #0
    strb r1, [r0]
.L0809C43E:
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_0809C444
func_0809C444: @ 0x0809C444
    push {r4, r5, lr}
    adds r4, r0, #0
    movs r5, #0
    bl func_0809C22C
    adds r1, r0, #0
    adds r0, r4, r1
    ldrb r0, [r0]
    cmp r0, #0
    beq .L0809C46A
    cmp r1, #0
    beq .L0809C460
    cmp r1, #3
    bne .L0809C46A
.L0809C460:
    adds r0, r4, #0
    bl func_0809C3E0
    lsls r0, r0, #0x18
    lsrs r5, r0, #0x18
.L0809C46A:
    adds r0, r5, #0
    pop {r4, r5}
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_0809C474
func_0809C474: @ 0x0809C474
    push {r4, r5, r6, lr}
    adds r5, r0, #0
    bl func_0809C22C
    adds r4, r0, #0
    movs r6, #0
    adds r0, r5, r4
    ldrb r0, [r0]
    cmp r0, #0
    beq .L0809C4AC
    cmp r4, #1
    beq .L0809C490
    cmp r4, #4
    bne .L0809C49C
.L0809C490:
    adds r0, r5, #0
    adds r1, r4, #0
    bl func_0809C3E0
    lsls r0, r0, #0x18
    lsrs r6, r0, #0x18
.L0809C49C:
    cmp r4, #0
    beq .L0809C4A4
    cmp r4, #3
    bne .L0809C4AC
.L0809C4A4:
    adds r0, r5, #0
    adds r1, r4, #0
    bl func_0809C420
.L0809C4AC:
    adds r0, r6, #0
    pop {r4, r5, r6}
    pop {r1}
    bx r1

    thumb_func_start func_0809C4B4
func_0809C4B4: @ 0x0809C4B4
    push {r4, lr}
    adds r4, r0, #0
    bl func_0809C22C
    adds r1, r0, #0
    movs r2, #0
    adds r0, r4, r1
    ldrb r0, [r0]
    cmp r0, #0
    beq .L0809C4DA
    cmp r1, #5
    beq .L0809C4D0
    cmp r1, #2
    bne .L0809C4DA
.L0809C4D0:
    adds r0, r4, #0
    bl func_0809C3E0
    lsls r0, r0, #0x18
    lsrs r2, r0, #0x18
.L0809C4DA:
    adds r0, r2, #0
    pop {r4}
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_0809C4E4
func_0809C4E4: @ 0x0809C4E4
    movs r1, #0
    str r1, [r0]
    bx lr
    .align 2, 0
.L0809C4EC:
    .byte 0x00, 0xB5, 0x03, 0x1C
    .byte 0x00, 0x22, 0x0D, 0x29, 0x08, 0xD8, 0x1F, 0x20, 0x08, 0x40, 0x01, 0x22, 0x82, 0x40, 0x19, 0x68
    .byte 0x11, 0x40, 0x48, 0x42, 0x08, 0x43, 0xC2, 0x0F, 0x01, 0x20, 0x50, 0x40, 0x02, 0xBC, 0x08, 0x47

    thumb_func_start func_0809C510
func_0809C510: @ 0x0809C510
    push {r4, r5, r6, lr}
    adds r5, r0, #0
    adds r4, r2, #0
    lsls r3, r3, #0x18
    lsrs r3, r3, #0x18
    adds r6, r3, #0
    movs r0, #0
    cmp r4, #0xd
    bhi .L0809C534
    movs r0, #0x1f
    ands r0, r4
    movs r2, #1
    lsls r2, r0
    ldr r1, [r1]
    ands r1, r2
    rsbs r0, r1, #0
    orrs r0, r1
    lsrs r0, r0, #0x1f
.L0809C534:
    cmp r0, #0
    beq .L0809C574
    cmp r4, #0xd
    bne .L0809C554
    cmp r3, #0
    beq .L0809C554
    ldr r0, .L0809C54C @ =gUnk_081036D4
    adds r0, #0x9c
    ldrb r1, [r0, #8]
    ldrb r2, [r0, #9]
    ldr r0, .L0809C550 @ =gUnk_081070AC
    b .L0809C5A0
    .align 2, 0
.L0809C54C: .4byte gUnk_081036D4
.L0809C550: .4byte gUnk_081070AC
.L0809C554:
    ldr r2, .L0809C570 @ =gUnk_081036D4
    lsls r0, r4, #1
    adds r0, r0, r4
    lsls r0, r0, #2
    adds r1, r2, #4
    adds r1, r0, r1
    adds r0, r0, r2
    ldrb r2, [r0, #8]
    ldrb r3, [r0, #9]
    ldr r0, [r1]
    str r0, [r5]
    str r2, [r5, #4]
    str r3, [r5, #8]
    b .L0809C5A6
    .align 2, 0
.L0809C570: .4byte gUnk_081036D4
.L0809C574:
    cmp r4, #0xd
    bne .L0809C590
    cmp r6, #0
    beq .L0809C590
    ldr r0, .L0809C588 @ =gUnk_081036D4
    adds r0, #0x9c
    ldrb r1, [r0, #8]
    ldrb r2, [r0, #9]
    ldr r0, .L0809C58C @ =gUnk_08107094
    b .L0809C5A0
    .align 2, 0
.L0809C588: .4byte gUnk_081036D4
.L0809C58C: .4byte gUnk_08107094
.L0809C590:
    ldr r1, .L0809C5B0 @ =gUnk_081036D4
    lsls r0, r4, #1
    adds r0, r0, r4
    lsls r0, r0, #2
    adds r0, r0, r1
    ldrb r1, [r0, #8]
    ldrb r2, [r0, #9]
    ldr r0, [r0]
.L0809C5A0:
    str r0, [r5]
    str r1, [r5, #4]
    str r2, [r5, #8]
.L0809C5A6:
    adds r0, r5, #0
    pop {r4, r5, r6}
    pop {r1}
    bx r1
    .align 2, 0
.L0809C5B0: .4byte gUnk_081036D4

    thumb_func_start func_0809C5B4
func_0809C5B4: @ 0x0809C5B4
    push {lr}
    adds r2, r0, #0
    cmp r1, #0xd
    bhi .L0809C5CA
    movs r0, #0x1f
    ands r0, r1
    movs r1, #1
    lsls r1, r0
    ldr r0, [r2]
    orrs r0, r1
    str r0, [r2]
.L0809C5CA:
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_0809C5D0
func_0809C5D0: @ 0x0809C5D0
    push {lr}
    adds r2, r0, #0
    cmp r1, #0xd
    bhi .L0809C5E6
    movs r0, #0x1f
    ands r0, r1
    movs r1, #1
    lsls r1, r0
    ldr r0, [r2]
    bics r0, r1
    str r0, [r2]
.L0809C5E6:
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_0809C5EC
func_0809C5EC: @ 0x0809C5EC
    movs r1, #0
    str r1, [r0]
    bx lr
    .align 2, 0

    thumb_func_start func_0809C5F4
func_0809C5F4: @ 0x0809C5F4
    ldr r1, [r0]
    rsbs r0, r1, #0
    orrs r0, r1
    lsrs r0, r0, #0x1f
    bx lr
    .align 2, 0

    thumb_func_start func_0809C600
func_0809C600: @ 0x0809C600
    push {r4, r5, lr}
    sub sp, #4
    adds r5, r0, #0
    mov r0, sp
    strh r1, [r0]
    adds r0, r5, #4
    ldr r4, [r5]
    lsls r4, r4, #1
    adds r4, #4
    adds r4, r5, r4
    adds r1, r4, #0
    mov r2, sp
    bl func_080E3DB4
    cmp r0, r4
    bne .L0809C63C
    mov r2, sp
    ldr r0, [r5]
    adds r3, r0, #0
    cmp r0, #2
    bhi .L0809C63C
    lsls r0, r0, #1
    adds r0, #4
    adds r1, r5, r0
    cmp r1, #0
    beq .L0809C638
    ldrh r0, [r2]
    strh r0, [r1]
.L0809C638:
    adds r0, r3, #1
    str r0, [r5]
.L0809C63C:
    add sp, #4
    pop {r4, r5}
    pop {r0}
    bx r0

    thumb_func_start func_0809C644
func_0809C644: @ 0x0809C644
    push {r4, r5, lr}
    sub sp, #4
    adds r5, r0, #0
    mov r0, sp
    strh r1, [r0]
    adds r0, r5, #4
    ldr r4, [r5]
    lsls r4, r4, #1
    adds r4, #4
    adds r4, r5, r4
    adds r1, r4, #0
    mov r2, sp
    bl func_080E3E28
    adds r3, r0, #0
    cmp r3, r4
    beq .L0809C68A
    ldr r0, [r5]
    cmp r0, #0
    beq .L0809C68A
    lsls r0, r0, #1
    adds r0, #4
    adds r0, r5, r0
    adds r1, r3, #2
    cmp r1, r0
    beq .L0809C684
    cmp r0, r1
    beq .L0809C684
    subs r2, r0, r1
    adds r0, r3, #0
    bl memmove
.L0809C684:
    ldr r0, [r5]
    subs r0, #1
    str r0, [r5]
.L0809C68A:
    add sp, #4
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_0809C694
func_0809C694: @ 0x0809C694
    push {lr}
    lsls r1, r1, #0x10
    lsrs r1, r1, #0x10
    movs r2, #0
    ldrh r0, [r0, #0xc]
    cmp r0, r1
    bne .L0809C6A4
    movs r2, #1
.L0809C6A4:
    adds r0, r2, #0
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_0809C6AC
func_0809C6AC: @ 0x0809C6AC
    strh r1, [r0, #0xc]
    bx lr

    thumb_func_start func_0809C6B0
func_0809C6B0: @ 0x0809C6B0
    ldr r1, .L0809C6B8 @ =0x0000FFFF
    strh r1, [r0, #0xc]
    bx lr
    .align 2, 0
.L0809C6B8: .4byte 0x0000FFFF

    thumb_func_start func_0809C6BC
func_0809C6BC: @ 0x0809C6BC
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #4
    adds r7, r0, #0
    movs r0, #0
    str r0, [r7]
    ldr r0, .L0809CAB8 @ =0x0000FFFF
    strh r0, [r7, #0xc]
    movs r5, #7
    rsbs r5, r5, #0
    movs r0, #0
    strb r0, [r7, #0xe]
    subs r0, #3
    mov sb, r0
    movs r4, #0x19
    rsbs r4, r4, #0
    movs r0, #0
    strb r0, [r7, #0xf]
    strb r0, [r7, #0x10]
    ldrb r1, [r7, #0x11]
    subs r0, #2
    ands r0, r1
    mov r1, sb
    ands r0, r1
    movs r2, #5
    rsbs r2, r2, #0
    ands r0, r2
    movs r1, #9
    rsbs r1, r1, #0
    ands r0, r1
    subs r2, #0xc
    ands r0, r2
    movs r3, #0x61
    rsbs r3, r3, #0
    ands r0, r3
    strb r0, [r7, #0x11]
    ldr r0, [r7, #0x10]
    ldr r1, .L0809CABC @ =0xFFFE7FFF
    mov r8, r1
    ands r0, r1
    str r0, [r7, #0x10]
    ldrb r1, [r7, #0x12]
    adds r0, r5, #0
    ands r0, r1
    ands r0, r4
    ands r0, r3
    strb r0, [r7, #0x12]
    ldrh r1, [r7, #0x12]
    ldr r6, .L0809CAC0 @ =0xFFFFFE7F
    adds r0, r6, #0
    ands r0, r1
    strh r0, [r7, #0x12]
    ldrb r1, [r7, #0x13]
    adds r0, r5, #0
    ands r0, r1
    ands r0, r4
    ands r0, r3
    movs r2, #0x7f
    ands r0, r2
    strb r0, [r7, #0x13]
    ldrb r1, [r7, #0x14]
    movs r0, #2
    rsbs r0, r0, #0
    ands r0, r1
    ands r0, r5
    ands r0, r4
    ands r0, r3
    strb r0, [r7, #0x14]
    ldrh r1, [r7, #0x14]
    adds r0, r6, #0
    ands r0, r1
    strh r0, [r7, #0x14]
    ldrb r1, [r7, #0x15]
    adds r0, r5, #0
    ands r0, r1
    ands r0, r4
    ands r0, r3
    strb r0, [r7, #0x15]
    ldr r0, [r7, #0x14]
    mov r1, r8
    ands r0, r1
    str r0, [r7, #0x14]
    ldrb r1, [r7, #0x16]
    adds r0, r5, #0
    ands r0, r1
    ands r0, r4
    ands r0, r3
    strb r0, [r7, #0x16]
    ldrh r1, [r7, #0x16]
    adds r0, r6, #0
    ands r0, r1
    strh r0, [r7, #0x16]
    ldrb r1, [r7, #0x17]
    adds r0, r5, #0
    ands r0, r1
    ands r0, r4
    ands r0, r3
    ands r0, r2
    strb r0, [r7, #0x17]
    ldrb r1, [r7, #0x18]
    movs r0, #2
    rsbs r0, r0, #0
    ands r0, r1
    ands r0, r5
    ands r0, r4
    ands r0, r3
    strb r0, [r7, #0x18]
    ldrh r1, [r7, #0x18]
    adds r0, r6, #0
    ands r0, r1
    strh r0, [r7, #0x18]
    ldrb r1, [r7, #0x19]
    adds r0, r5, #0
    ands r0, r1
    ands r0, r4
    ands r0, r3
    strb r0, [r7, #0x19]
    ldr r0, [r7, #0x18]
    mov r2, r8
    ands r0, r2
    str r0, [r7, #0x18]
    ldrb r1, [r7, #0x1a]
    adds r0, r5, #0
    ands r0, r1
    ands r0, r4
    ands r0, r3
    strb r0, [r7, #0x1a]
    ldrh r1, [r7, #0x1a]
    adds r0, r6, #0
    ands r0, r1
    strh r0, [r7, #0x1a]
    ldrb r1, [r7, #0x1b]
    adds r0, r5, #0
    ands r0, r1
    ands r0, r4
    ands r0, r3
    movs r1, #0x7f
    ands r0, r1
    strb r0, [r7, #0x1b]
    ldrb r1, [r7, #0x1c]
    movs r0, #2
    rsbs r0, r0, #0
    ands r0, r1
    ands r0, r5
    ands r0, r4
    ands r0, r3
    strb r0, [r7, #0x1c]
    ldrh r1, [r7, #0x1c]
    adds r0, r6, #0
    ands r0, r1
    strh r0, [r7, #0x1c]
    ldrb r1, [r7, #0x1d]
    adds r0, r5, #0
    ands r0, r1
    ands r0, r4
    ands r0, r3
    strb r0, [r7, #0x1d]
    ldr r0, [r7, #0x1c]
    ands r0, r2
    str r0, [r7, #0x1c]
    ldrb r1, [r7, #0x1e]
    adds r0, r5, #0
    ands r0, r1
    ands r0, r4
    ands r0, r3
    strb r0, [r7, #0x1e]
    ldrh r1, [r7, #0x1e]
    adds r0, r6, #0
    ands r0, r1
    strh r0, [r7, #0x1e]
    ldrb r1, [r7, #0x1f]
    adds r0, r5, #0
    ands r0, r1
    ands r0, r4
    ands r0, r3
    movs r2, #0x7f
    ands r0, r2
    strb r0, [r7, #0x1f]
    adds r2, r7, #0
    adds r2, #0x20
    ldrb r1, [r2]
    movs r0, #2
    rsbs r0, r0, #0
    ands r0, r1
    ands r0, r5
    ands r0, r4
    ands r0, r3
    strb r0, [r2]
    ldrh r1, [r7, #0x20]
    adds r0, r6, #0
    ands r0, r1
    strh r0, [r7, #0x20]
    adds r2, #1
    ldrb r1, [r2]
    adds r0, r5, #0
    ands r0, r1
    ands r0, r4
    ands r0, r3
    strb r0, [r2]
    ldr r0, [r7, #0x20]
    mov r1, r8
    ands r0, r1
    str r0, [r7, #0x20]
    adds r2, #1
    ldrb r1, [r2]
    adds r0, r5, #0
    ands r0, r1
    ands r0, r4
    movs r1, #0x21
    rsbs r1, r1, #0
    ands r0, r1
    subs r1, #0x20
    ands r0, r1
    strb r0, [r2]
    adds r2, #1
    ldrb r1, [r2]
    movs r0, #0xf
    ands r0, r1
    strb r0, [r2]
    adds r2, #1
    ldrb r1, [r2]
    movs r0, #8
    rsbs r0, r0, #0
    ands r0, r1
    ands r0, r4
    ands r0, r3
    strb r0, [r2]
    ldrh r1, [r7, #0x24]
    adds r0, r6, #0
    ands r0, r1
    strh r0, [r7, #0x24]
    adds r2, #1
    ldrb r1, [r2]
    adds r0, r5, #0
    ands r0, r1
    ands r0, r4
    ands r0, r3
    movs r1, #0x7f
    ands r0, r1
    strb r0, [r2]
    adds r1, r7, #0
    adds r1, #0x26
    movs r2, #4
    rsbs r2, r2, #0
    mov sl, r2
    movs r0, #0
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    adds r2, r7, #0
    adds r2, #0x2a
    ldrb r1, [r2]
    adds r0, r5, #0
    ands r0, r1
    ands r0, r4
    ands r0, r3
    strb r0, [r2]
    ldrh r1, [r7, #0x2a]
    adds r0, r6, #0
    ands r0, r1
    strh r0, [r7, #0x2a]
    adds r2, #1
    ldrb r1, [r2]
    adds r0, r5, #0
    ands r0, r1
    movs r1, #9
    rsbs r1, r1, #0
    ands r0, r1
    subs r1, #0x28
    ands r0, r1
    movs r1, #0x3f
    ands r0, r1
    strb r0, [r2]
    adds r1, r7, #0
    adds r1, #0x2c
    movs r0, #0
    strb r0, [r1]
    adds r2, #2
    ldrb r1, [r2]
    mov r0, sl
    ands r0, r1
    movs r1, #0xd
    rsbs r1, r1, #0
    ands r0, r1
    subs r1, #0x24
    ands r0, r1
    strb r0, [r2]
    ldr r0, [r7, #0x2c]
    ldr r2, .L0809CAC4 @ =0xFFFC3FFF
    mov ip, r2
    ands r0, r2
    str r0, [r7, #0x2c]
    adds r2, r7, #0
    adds r2, #0x2e
    ldrb r1, [r2]
    movs r0, #5
    rsbs r0, r0, #0
    ands r0, r1
    ands r0, r4
    ands r0, r3
    movs r1, #0x7f
    ands r0, r1
    strb r0, [r2]
    adds r1, r7, #0
    adds r1, #0x2f
    movs r0, #0
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    adds r2, #8
    ldrb r1, [r2]
    mov r0, sl
    ands r0, r1
    movs r1, #5
    rsbs r1, r1, #0
    ands r0, r1
    ands r0, r4
    ands r0, r3
    strb r0, [r2]
    ldrh r1, [r7, #0x36]
    adds r0, r6, #0
    ands r0, r1
    strh r0, [r7, #0x36]
    adds r2, #1
    ldrb r1, [r2]
    adds r0, r5, #0
    ands r0, r1
    ands r0, r4
    ands r0, r3
    movs r1, #0x7f
    ands r0, r1
    strb r0, [r2]
    adds r1, r7, #0
    adds r1, #0x38
    movs r0, #0
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    adds r2, #3
    ldrb r1, [r2]
    mov r0, sl
    ands r0, r1
    movs r1, #0x1d
    rsbs r1, r1, #0
    ands r0, r1
    ands r0, r3
    strb r0, [r2]
    ldrh r1, [r7, #0x3a]
    adds r0, r6, #0
    ands r0, r1
    strh r0, [r7, #0x3a]
    adds r2, #1
    ldrb r1, [r2]
    adds r0, r5, #0
    ands r0, r1
    ands r0, r4
    ands r0, r3
    movs r1, #0x7f
    ands r0, r1
    strb r0, [r2]
    adds r2, #1
    ldrb r1, [r2]
    movs r0, #2
    rsbs r0, r0, #0
    ands r0, r1
    ands r0, r5
    ands r0, r4
    ands r0, r3
    strb r0, [r2]
    ldrh r1, [r7, #0x3c]
    ldr r0, .L0809CAC8 @ =0xFFFFFC7F
    ands r0, r1
    strh r0, [r7, #0x3c]
    adds r2, #1
    ldrb r1, [r2]
    movs r0, #0xd
    rsbs r0, r0, #0
    ands r0, r1
    movs r1, #0x31
    rsbs r1, r1, #0
    ands r0, r1
    strb r0, [r2]
    ldr r0, [r7, #0x3c]
    mov r2, ip
    ands r0, r2
    str r0, [r7, #0x3c]
    adds r2, r7, #0
    adds r2, #0x3e
    ldrb r1, [r2]
    movs r0, #0xd
    rsbs r0, r0, #0
    ands r0, r1
    movs r1, #0x31
    rsbs r1, r1, #0
    ands r0, r1
    movs r1, #0x3f
    ands r0, r1
    strb r0, [r2]
    adds r1, r7, #0
    adds r1, #0x3f
    movs r0, #0
    strb r0, [r1]
    adds r2, #2
    ldrb r1, [r2]
    subs r0, #2
    ands r0, r1
    ands r0, r5
    ands r0, r4
    ands r0, r3
    strb r0, [r2]
    ldrh r1, [r2]
    adds r0, r6, #0
    ands r0, r1
    strh r0, [r2]
    adds r2, #1
    ldrb r1, [r2]
    adds r0, r5, #0
    ands r0, r1
    ands r0, r4
    strb r0, [r2]
    ldr r0, [r7, #0x40]
    ldr r1, .L0809CACC @ =0xFFFE1FFF
    ands r0, r1
    str r0, [r7, #0x40]
    adds r2, #1
    ldrb r1, [r2]
    adds r0, r5, #0
    ands r0, r1
    ands r0, r4
    movs r1, #0x21
    rsbs r1, r1, #0
    ands r0, r1
    movs r1, #0x3f
    ands r0, r1
    strb r0, [r2]
    adds r1, r7, #0
    adds r1, #0x43
    movs r0, #0
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    adds r2, #0xb
    ldrb r1, [r2]
    mov r0, sl
    ands r0, r1
    movs r1, #5
    rsbs r1, r1, #0
    ands r0, r1
    subs r1, #4
    ands r0, r1
    subs r1, #8
    ands r0, r1
    subs r1, #0x10
    ands r0, r1
    subs r1, #0x20
    ands r0, r1
    strb r0, [r2]
    ldr r0, [r7, #0x4c]
    mov r2, r8
    ands r0, r2
    str r0, [r7, #0x4c]
    adds r2, r7, #0
    adds r2, #0x4e
    ldrb r1, [r2]
    mov r0, sb
    ands r0, r1
    movs r1, #0xd
    rsbs r1, r1, #0
    ands r0, r1
    subs r1, #4
    ands r0, r1
    ands r0, r3
    strb r0, [r2]
    ldrh r1, [r2]
    adds r0, r6, #0
    ands r0, r1
    b .L0809CAD0
    .align 2, 0
.L0809CAB8: .4byte 0x0000FFFF
.L0809CABC: .4byte 0xFFFE7FFF
.L0809CAC0: .4byte 0xFFFFFE7F
.L0809CAC4: .4byte 0xFFFC3FFF
.L0809CAC8: .4byte 0xFFFFFC7F
.L0809CACC: .4byte 0xFFFE1FFF
.L0809CAD0:
    strh r0, [r2]
    adds r2, #1
    ldrb r1, [r2]
    movs r0, #0xf
    rsbs r0, r0, #0
    ands r0, r1
    movs r1, #0x31
    rsbs r1, r1, #0
    ands r0, r1
    subs r1, #0x10
    ands r0, r1
    movs r1, #0x7f
    ands r0, r1
    strb r0, [r2]
    adds r1, r7, #0
    adds r1, #0x50
    movs r0, #0
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    adds r2, #3
    ldrb r1, [r2]
    subs r0, #2
    ands r0, r1
    ands r0, r5
    movs r1, #9
    rsbs r1, r1, #0
    ands r0, r1
    subs r1, #0x28
    ands r0, r1
    strb r0, [r2]
    ldrh r1, [r2]
    ldr r0, .L0809CD5C @ =0xFFFFFE3F
    ands r0, r1
    strh r0, [r2]
    adds r2, #1
    ldrb r1, [r2]
    adds r0, r5, #0
    ands r0, r1
    movs r1, #9
    rsbs r1, r1, #0
    ands r0, r1
    subs r1, #0x28
    ands r0, r1
    movs r1, #0x3f
    ands r0, r1
    strb r0, [r2]
    adds r1, r7, #0
    adds r1, #0x54
    movs r0, #0
    strb r0, [r1]
    adds r1, #1
    movs r2, #0x3f
    mov r8, r2
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    adds r2, r7, #0
    adds r2, #0x59
    ldrb r1, [r2]
    mov r0, sl
    ands r0, r1
    movs r1, #5
    rsbs r1, r1, #0
    ands r0, r1
    ands r0, r4
    ands r0, r3
    strb r0, [r2]
    ldr r0, [r7, #0x58]
    ldr r1, .L0809CD60 @ =0xFFFC7FFF
    ands r0, r1
    str r0, [r7, #0x58]
    adds r1, r7, #0
    adds r1, #0x5a
    ldrh r0, [r1]
    ands r6, r0
    strh r6, [r1]
    adds r2, #2
    ldrb r1, [r2]
    adds r0, r5, #0
    ands r0, r1
    ands r0, r4
    ands r0, r3
    movs r1, #0x7f
    ands r0, r1
    strb r0, [r2]
    adds r1, r7, #0
    adds r1, #0x5c
    movs r0, #0
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    adds r1, #1
    ldrb r0, [r1]
    mov r2, sl
    ands r2, r0
    movs r0, #0xd
    rsbs r0, r0, #0
    ands r2, r0
    subs r0, #0x24
    ands r2, r0
    strb r2, [r1]
    ldrh r2, [r1]
    ldr r3, .L0809CD64 @ =0xFFFFC03F
    adds r0, r3, #0
    ands r0, r2
    strh r0, [r1]
    ldr r0, [r7, #0x68]
    ldr r6, .L0809CD68 @ =0xFFC03FFF
    ands r0, r6
    str r0, [r7, #0x68]
    adds r2, r7, #0
    adds r2, #0x6a
    ldrh r1, [r2]
    adds r0, r3, #0
    ands r0, r1
    strh r0, [r2]
    adds r2, #1
    ldrb r1, [r2]
    mov r0, r8
    ands r0, r1
    strb r0, [r2]
    adds r1, r7, #0
    adds r1, #0x6c
    ldrb r2, [r1]
    subs r4, #0x27
    adds r0, r4, #0
    ands r0, r2
    strb r0, [r1]
    ldrh r2, [r1]
    adds r0, r3, #0
    ands r0, r2
    strh r0, [r1]
    ldr r0, [r7, #0x6c]
    ands r0, r6
    str r0, [r7, #0x6c]
    adds r2, r7, #0
    adds r2, #0x6e
    ldrh r1, [r2]
    adds r0, r3, #0
    ands r0, r1
    strh r0, [r2]
    adds r2, #1
    ldrb r1, [r2]
    mov r0, r8
    ands r0, r1
    strb r0, [r2]
    adds r1, r7, #0
    adds r1, #0x70
    ldrb r2, [r1]
    adds r0, r4, #0
    ands r0, r2
    strb r0, [r1]
    ldrh r2, [r1]
    adds r0, r3, #0
    ands r0, r2
    strh r0, [r1]
    ldr r0, [r7, #0x70]
    ands r0, r6
    str r0, [r7, #0x70]
    adds r1, #2
    ldrh r0, [r1]
    ands r3, r0
    strh r3, [r1]
    adds r1, #1
    ldrb r0, [r1]
    mov r2, r8
    ands r2, r0
    strb r2, [r1]
    adds r1, #1
    ldrb r0, [r1]
    ands r4, r0
    strb r4, [r1]
    ldrh r2, [r1]
    ldr r0, .L0809CD5C @ =0xFFFFFE3F
    ands r0, r2
    strh r0, [r1]
    adds r1, #1
    ldrb r0, [r1]
    ands r5, r0
    movs r0, #9
    rsbs r0, r0, #0
    ands r5, r0
    movs r2, #0x11
    rsbs r2, r2, #0
    ands r5, r2
    subs r0, #0x18
    ands r5, r0
    subs r2, #0x30
    ands r5, r2
    movs r0, #0x7f
    ands r5, r0
    strb r5, [r1]
    adds r2, r7, #0
    adds r2, #0x76
    ldrb r1, [r2]
    subs r0, #0x81
    ands r0, r1
    mov r1, sb
    ands r0, r1
    movs r1, #5
    rsbs r1, r1, #0
    ands r0, r1
    subs r1, #4
    ands r0, r1
    subs r1, #8
    ands r0, r1
    subs r1, #0x10
    ands r0, r1
    subs r1, #0x20
    ands r0, r1
    strb r0, [r2]
    ldrh r1, [r2]
    ldr r0, .L0809CD6C @ =0xFFFFF87F
    ands r0, r1
    strh r0, [r2]
    adds r2, #1
    ldrb r1, [r2]
    movs r0, #0x79
    rsbs r0, r0, #0
    ands r0, r1
    movs r1, #0x7f
    ands r0, r1
    strb r0, [r2]
    adds r1, r7, #0
    adds r1, #0x78
    movs r0, #0
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    adds r2, #3
    ldrb r0, [r2]
    movs r1, #2
    rsbs r1, r1, #0
    ands r1, r0
    strb r1, [r2]
    ldrh r1, [r2]
    ldr r0, .L0809CD70 @ =0xFFFFFE01
    ands r0, r1
    strh r0, [r2]
    adds r1, r7, #0
    adds r1, #0x7b
    ldrb r0, [r1]
    mov r2, sb
    ands r2, r0
    movs r0, #5
    rsbs r0, r0, #0
    ands r2, r0
    movs r6, #9
    rsbs r6, r6, #0
    ands r2, r6
    movs r5, #0x11
    rsbs r5, r5, #0
    ands r2, r5
    movs r4, #0x21
    rsbs r4, r4, #0
    ands r2, r4
    movs r3, #0x41
    rsbs r3, r3, #0
    ands r2, r3
    movs r0, #0x7f
    ands r2, r0
    strb r2, [r1]
    adds r1, #1
    movs r2, #5
    rsbs r2, r2, #0
    movs r0, #0
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    movs r1, #0x7e
    adds r1, r1, r7
    mov r8, r1
    ldrb r1, [r1]
    subs r0, #4
    ands r0, r1
    ands r0, r2
    ands r0, r6
    ands r0, r5
    ands r0, r4
    ands r0, r3
    mov r2, r8
    strb r0, [r2]
    ldrh r1, [r2]
    ldr r0, .L0809CD74 @ =0xFFFFFC7F
    ands r0, r1
    strh r0, [r2]
    adds r2, r7, #0
    adds r2, #0x7f
    ldrb r1, [r2]
    movs r0, #3
    ands r0, r1
    strb r0, [r2]
    adds r0, r7, #0
    add sp, #4
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    .align 2, 0
.L0809CD5C: .4byte 0xFFFFFE3F
.L0809CD60: .4byte 0xFFFC7FFF
.L0809CD64: .4byte 0xFFFFC03F
.L0809CD68: .4byte 0xFFC03FFF
.L0809CD6C: .4byte 0xFFFFF87F
.L0809CD70: .4byte 0xFFFFFE01
.L0809CD74: .4byte 0xFFFFFC7F

    thumb_func_start func_0809CD78
func_0809CD78: @ 0x0809CD78
    push {r4, lr}
    adds r1, r0, #0
    movs r2, #0x3a
    movs r3, #0
    movs r4, #1
    rsbs r4, r4, #0
.L0809CD84:
    str r3, [r1]
    str r3, [r1, #4]
    adds r1, #8
    subs r2, #1
    cmp r2, r4
    bne .L0809CD84
    pop {r4}
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_0809CD98
func_0809CD98: @ 0x0809CD98
    push {r4, r5, r6, lr}
    adds r4, r0, #0
    adds r5, r2, #0
    movs r6, #0
    lsls r2, r1, #3
    adds r1, r4, r2
    ldr r3, [r1]
    ldr r0, .L0809CDC8 @ =0x3B9AC9FF
    cmp r3, r0
    bhi .L0809CDB0
    adds r0, r3, #1
    str r0, [r1]
.L0809CDB0:
    adds r0, r4, #4
    adds r1, r0, r2
    ldr r0, [r1]
    cmp r5, r0
    bls .L0809CDBE
    str r5, [r1]
    movs r6, #1
.L0809CDBE:
    adds r0, r6, #0
    pop {r4, r5, r6}
    pop {r1}
    bx r1
    .align 2, 0
.L0809CDC8: .4byte 0x3B9AC9FF

    thumb_func_start func_0809CDCC
func_0809CDCC: @ 0x0809CDCC
    push {lr}
    movs r3, #1
    movs r2, #8
    adds r1, r0, #0
    adds r1, #0x40
.L0809CDD6:
    ldr r0, [r1]
    cmp r0, #0
    bne .L0809CDDE
    movs r3, #0
.L0809CDDE:
    adds r1, #8
    adds r2, #1
    cmp r2, #0x3a
    bls .L0809CDD6
    adds r0, r3, #0
    pop {r1}
    bx r1

    thumb_func_start func_0809CDEC
func_0809CDEC: @ 0x0809CDEC
    push {r4, lr}
    movs r2, #0
    movs r3, #8
    ldr r4, .L0809CE14 @ =0x3B9AC9FF
    adds r1, r0, #0
    adds r1, #0x40
.L0809CDF8:
    ldr r0, [r1]
    adds r2, r2, r0
    cmp r2, r4
    bls .L0809CE02
    ldr r2, .L0809CE18 @ =0x3B9ACA00
.L0809CE02:
    adds r1, #8
    adds r3, #1
    cmp r3, #0x3a
    bls .L0809CDF8
    adds r0, r2, #0
    pop {r4}
    pop {r1}
    bx r1
    .align 2, 0
.L0809CE14: .4byte 0x3B9AC9FF
.L0809CE18: .4byte 0x3B9ACA00

    thumb_func_start func_0809CE1C
func_0809CE1C: @ 0x0809CE1C
    lsls r1, r1, #3
    adds r0, r0, r1
    ldr r0, [r0]
    bx lr

    thumb_func_start func_0809CE24
func_0809CE24: @ 0x0809CE24
    lsls r1, r1, #3
    adds r0, #4
    adds r0, r0, r1
    ldr r0, [r0]
    bx lr
    .align 2, 0

    thumb_func_start func_0809CE30
func_0809CE30: @ 0x0809CE30
    push {lr}
    adds r0, r1, #0
    subs r0, #0x35
    cmp r0, #5
    bhi .L0809CE60
    lsls r0, r0, #2
    ldr r1, .L0809CE44 @ =.L0809CE48
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L0809CE44: .4byte .L0809CE48
.L0809CE48: @ jump table
    .4byte .L0809CE60 @ case 0
    .4byte .L0809CE64 @ case 1
    .4byte .L0809CE68 @ case 2
    .4byte .L0809CE6C @ case 3
    .4byte .L0809CE70 @ case 4
    .4byte .L0809CE74 @ case 5
.L0809CE60:
    movs r0, #0xfc
    b .L0809CE76
.L0809CE64:
    movs r0, #0xf9
    b .L0809CE76
.L0809CE68:
    movs r0, #0xfe
    b .L0809CE76
.L0809CE6C:
    movs r0, #0xfd
    b .L0809CE76
.L0809CE70:
    movs r0, #0xfa
    b .L0809CE76
.L0809CE74:
    movs r0, #0xfb
.L0809CE76:
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_0809CE7C
func_0809CE7C: @ 0x0809CE7C
    ldr r0, .L0809CE88 @ =gUnk_08103A18
    lsls r1, r1, #2
    adds r1, r1, r0
    ldr r0, [r1]
    bx lr
    .align 2, 0
.L0809CE88: .4byte gUnk_08103A18

    thumb_func_start func_0809CE8C
func_0809CE8C: @ 0x0809CE8C
    push {r4, r5, r6, r7, lr}
    mov r7, r8
    push {r7}
    adds r7, r0, #0
    movs r0, #0
    str r0, [r7]
    ldr r0, .L0809CF24 @ =0x00000624
    adds r2, r7, r0
    movs r0, #2
    rsbs r0, r0, #0
    movs r3, #3
    rsbs r3, r3, #0
    movs r4, #5
    rsbs r4, r4, #0
    movs r5, #9
    rsbs r5, r5, #0
    movs r6, #0x11
    rsbs r6, r6, #0
    movs r1, #0x21
    rsbs r1, r1, #0
    mov r8, r1
    movs r1, #0
    strb r1, [r2]
    ldr r1, .L0809CF28 @ =0x00000625
    adds r2, r7, r1
    movs r1, #0
    strb r1, [r2]
    ldr r1, .L0809CF2C @ =0x00000626
    adds r2, r7, r1
    ldrb r1, [r2]
    ands r0, r1
    ands r0, r3
    ands r0, r4
    ands r0, r5
    ands r0, r6
    mov r1, r8
    ands r0, r1
    strb r0, [r2]
    movs r0, #0
    movs r1, #0x10
    rsbs r1, r1, #0
    mov r8, r1
    ldr r6, .L0809CF30 @ =0xFFFFFC0F
    movs r5, #3
.L0809CEE4:
    movs r3, #0
    lsls r1, r0, #3
    adds r4, r0, #1
    subs r1, r1, r0
    lsls r1, r1, #3
    adds r0, r7, #4
    adds r2, r1, r0
.L0809CEF2:
    ldrb r1, [r2]
    mov r0, r8
    ands r0, r1
    strb r0, [r2]
    ldrh r1, [r2]
    adds r0, r6, #0
    ands r0, r1
    strh r0, [r2]
    ldrb r1, [r2, #1]
    adds r0, r5, #0
    ands r0, r1
    strb r0, [r2, #1]
    adds r2, #2
    adds r3, #1
    cmp r3, #0x1b
    bls .L0809CEF2
    adds r0, r4, #0
    cmp r0, #0x1b
    bls .L0809CEE4
    adds r0, r7, #0
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    .align 2, 0
.L0809CF24: .4byte 0x00000624
.L0809CF28: .4byte 0x00000625
.L0809CF2C: .4byte 0x00000626
.L0809CF30: .4byte 0xFFFFFC0F

    thumb_func_start func_0809CF34
func_0809CF34: @ 0x0809CF34
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #0x3c
    str r0, [sp, #0x34]
    adds r6, r1, #0
    str r2, [sp, #0x38]
    mov r8, r3
    ldr r0, [sp, #0x60]
    mov sb, r0
    add r1, sp, #0x30
    movs r0, #0
    strb r0, [r1]
    strb r0, [r1, #1]
    mov r0, sp
    movs r2, #0xb
    movs r1, #0
    movs r3, #1
    rsbs r3, r3, #0
.L0809CF5E:
    strb r1, [r0]
    strb r1, [r0, #1]
    adds r0, #4
    subs r2, #1
    cmp r2, r3
    bne .L0809CF5E
    movs r0, #0
    movs r1, #0x10
    rsbs r1, r1, #0
    mov ip, r1
    ldr r7, .L0809CFDC @ =0xFFFFFC0F
    movs r5, #3
.L0809CF76:
    movs r3, #0
    lsls r1, r0, #3
    adds r4, r0, #1
    subs r1, r1, r0
    lsls r1, r1, #3
    adds r0, r6, #4
    adds r2, r1, r0
.L0809CF84:
    ldrb r1, [r2]
    mov r0, ip
    ands r0, r1
    strb r0, [r2]
    ldrh r1, [r2]
    adds r0, r7, #0
    ands r0, r1
    strh r0, [r2]
    ldrb r1, [r2, #1]
    adds r0, r5, #0
    ands r0, r1
    strb r0, [r2, #1]
    adds r2, #2
    adds r3, #1
    cmp r3, #0x1b
    bls .L0809CF84
    adds r0, r4, #0
    cmp r0, #0x1b
    bls .L0809CF76
    ldr r0, [sp, #0x5c]
    cmp r0, #0
    beq .L0809CFC4
    movs r1, #0
    cmp r1, sb
    bhs .L0809CFC4
    adds r3, r0, #0
    mov r2, sp
.L0809CFBA:
    ldm r3!, {r0}
    stm r2!, {r0}
    adds r1, #1
    cmp r1, sb
    blo .L0809CFBA
.L0809CFC4:
    movs r3, #0xff
    mov r1, sp
.L0809CFC8:
    ldrb r2, [r1]
    subs r0, r2, #2
    lsls r0, r0, #0x18
    lsrs r0, r0, #0x18
    cmp r0, #0x37
    bls .L0809CFE0
    adds r0, r2, #0
    orrs r0, r3
    b .L0809CFE6
    .align 2, 0
.L0809CFDC: .4byte 0xFFFFFC0F
.L0809CFE0:
    ldrb r0, [r1]
    subs r0, #2
    asrs r0, r0, #1
.L0809CFE6:
    strb r0, [r1]
    ldrb r2, [r1, #1]
    subs r0, r2, #7
    lsls r0, r0, #0x18
    lsrs r0, r0, #0x18
    cmp r0, #0x37
    bls .L0809CFFA
    adds r0, r2, #0
    orrs r0, r3
    b .L0809D000
.L0809CFFA:
    ldrb r0, [r1, #1]
    subs r0, #7
    asrs r0, r0, #1
.L0809D000:
    strb r0, [r1, #1]
    adds r1, #4
    add r0, sp, #0x2c
    cmp r1, r0
    ble .L0809CFC8
    mov r1, r8
    cmp r1, #0
    bne .L0809D016
    str r1, [r6]
    movs r0, #0x14
    b .L0809D05E
.L0809D016:
    mov r1, r8
    cmp r1, #9
    bne .L0809D02C
    ldr r0, [sp, #0x38]
    cmp r0, #1
    bne .L0809D02C
    movs r0, #4
    str r0, [r6]
    movs r1, #0x28
    mov sl, r1
    b .L0809D060
.L0809D02C:
    mov r0, r8
    movs r1, #5
    bl __umodsi3
    cmp r0, #0
    bne .L0809D042
    movs r0, #1
    str r0, [r6]
    movs r0, #0x96
    lsls r0, r0, #1
    b .L0809D05E
.L0809D042:
    mov r0, r8
    movs r1, #3
    bl __umodsi3
    cmp r0, #0
    bne .L0809D058
    movs r0, #2
    str r0, [r6]
    movs r1, #0x64
    mov sl, r1
    b .L0809D060
.L0809D058:
    movs r0, #3
    str r0, [r6]
    movs r0, #0x1e
.L0809D05E:
    mov sl, r0
.L0809D060:
    mov r1, r8
    cmp r1, #0
    beq .L0809D10E
    bl rand
    adds r4, r0, #0
    adds r0, r6, #0
    bl func_0809D8A4
    adds r1, r0, #0
    asrs r4, r4, #8
    subs r1, #2
    adds r0, r4, #0
    bl __umodsi3
    mov sb, r0
    mov r5, sb
    adds r5, #1
    bl rand
    adds r4, r0, #0
    adds r0, r6, #0
    bl func_0809D8B8
    adds r1, r0, #0
    asrs r4, r4, #8
    subs r1, #2
    adds r0, r4, #0
    bl __umodsi3
    adds r7, r0, #0
    adds r4, r7, #1
    lsls r2, r5, #1
    lsls r0, r4, #3
    subs r0, r0, r4
    lsls r0, r0, #3
    adds r2, r2, r0
    adds r2, r6, r2
    ldrb r1, [r2, #4]
    movs r0, #0x10
    rsbs r0, r0, #0
    ands r0, r1
    movs r1, #3
    orrs r0, r1
    strb r0, [r2, #4]
    bl rand
    asrs r1, r0, #8
    movs r0, #3
    ands r1, r0
    movs r0, #2
    ands r0, r1
    cmp r0, #0
    beq .L0809D0DC
    movs r0, #1
    ands r1, r0
    cmp r1, #0
    beq .L0809D0D8
    mov r5, sb
    b .L0809D0EA
.L0809D0D8:
    adds r5, #1
    b .L0809D0EA
.L0809D0DC:
    movs r0, #1
    ands r1, r0
    cmp r1, #0
    beq .L0809D0E8
    adds r4, r7, #0
    b .L0809D0EA
.L0809D0E8:
    adds r4, #1
.L0809D0EA:
    add r0, sp, #0x30
    strb r5, [r0]
    strb r4, [r0, #1]
    ldrb r1, [r0]
    lsls r1, r1, #1
    ldrb r2, [r0, #1]
    lsls r0, r2, #3
    subs r0, r0, r2
    lsls r0, r0, #3
    adds r1, r1, r0
    adds r1, r6, r1
    ldrb r2, [r1, #4]
    movs r0, #0x10
    rsbs r0, r0, #0
    ands r0, r2
    movs r2, #1
    orrs r0, r2
    strb r0, [r1, #4]
.L0809D10E:
    ldr r1, [sp, #0x38]
    cmp r1, #0
    bne .L0809D122
    adds r0, r6, #0
    mov r1, r8
    mov r2, sl
    mov r3, sp
    bl func_0809D168
    b .L0809D12E
.L0809D122:
    adds r0, r6, #0
    mov r1, r8
    mov r2, sl
    mov r3, sp
    bl func_0809D500
.L0809D12E:
    mov r0, r8
    cmp r0, #0
    beq .L0809D150
    add r0, sp, #0x30
    ldrb r1, [r0]
    lsls r1, r1, #1
    ldrb r2, [r0, #1]
    lsls r0, r2, #3
    subs r0, r0, r2
    lsls r0, r0, #3
    adds r1, r1, r0
    adds r1, r6, r1
    ldrb r2, [r1, #4]
    movs r0, #0x10
    rsbs r0, r0, #0
    ands r0, r2
    strb r0, [r1, #4]
.L0809D150:
    ldr r0, [sp, #0x30]
    ldr r1, [sp, #0x34]
    str r0, [r1]
    ldr r0, [sp, #0x34]
    add sp, #0x3c
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1

    thumb_func_start func_0809D168
func_0809D168: @ 0x0809D168
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #0x28
    mov sl, r0
    str r1, [sp]
    str r2, [sp, #4]
    str r3, [sp, #8]
    bl func_0809D8A4
    str r0, [sp, #0xc]
    mov r0, sl
    bl func_0809D8B8
    str r0, [sp, #0x10]
    mov r0, sl
    ldr r1, [sp]
    bl func_0809D418
    str r0, [sp, #0x14]
    bl rand
    asrs r0, r0, #4
    ldr r1, [sp, #0x10]
    ldr r2, [sp, #0xc]
    adds r4, r1, #0
    muls r4, r2, r4
    adds r1, r4, #0
    bl __umodsi3
    str r0, [sp, #0x18]
    movs r5, #0
    cmp r5, r4
    blo .L0809D1B2
    b .L0809D2DA
.L0809D1B2:
    str r4, [sp, #0x1c]
.L0809D1B4:
    ldr r3, [sp, #0x18]
    adds r4, r3, r5
    ldr r0, [sp, #0x1c]
    cmp r4, r0
    blo .L0809D1C0
    subs r4, r4, r0
.L0809D1C0:
    adds r0, r4, #0
    ldr r1, [sp, #0xc]
    bl __umodsi3
    mov r8, r0
    adds r0, r4, #0
    ldr r1, [sp, #0xc]
    bl __udivsi3
    adds r7, r0, #0
    mov r1, r8
    lsls r0, r1, #1
    lsls r1, r7, #3
    subs r1, r1, r7
    lsls r1, r1, #3
    adds r0, r0, r1
    add r0, sl
    ldrb r0, [r0, #4]
    lsls r0, r0, #0x1c
    lsrs r0, r0, #0x1c
    adds r5, #1
    str r5, [sp, #0x24]
    cmp r0, #1
    bgt .L0809D2D0
    bl rand
    asrs r2, r0, #4
    movs r0, #0xff
    ands r2, r0
    movs r3, #0
    ldr r4, [sp, #0x14]
    lsls r6, r4, #2
    ldr r4, .L0809D268 @ =gUnk_08103F98
.L0809D202:
    ldr r1, [sp, #0x14]
    adds r0, r6, r1
    adds r0, r3, r0
    adds r1, r0, r4
    ldrb r0, [r1]
    cmp r0, #0
    beq .L0809D2CA
    cmp r2, r0
    bge .L0809D2C4
    ldr r1, .L0809D26C @ =gUnk_08103F84
    lsls r0, r3, #2
    adds r0, r0, r1
    ldr r3, [r0]
    mov r2, r8
    lsls r2, r2, #1
    mov sb, r2
    lsls r4, r7, #3
    mov ip, r4
    cmp r3, #1
    bne .L0809D2AC
    cmp r7, #0
    beq .L0809D2A0
    ldr r0, [sp, #0x10]
    subs r0, #1
    cmp r7, r0
    bhs .L0809D2A0
    mov r0, r8
    cmp r0, #0
    beq .L0809D2A0
    ldr r0, [sp, #0xc]
    subs r0, #1
    cmp r8, r0
    bhs .L0809D2A0
    subs r4, r7, #1
    adds r6, r7, #2
    cmp r4, r6
    bge .L0809D2AC
    lsls r0, r4, #3
    subs r0, r0, r4
    lsls r5, r0, #3
.L0809D252:
    cmp r4, #0
    blt .L0809D296
    ldr r1, [sp, #0x10]
    cmp r4, r1
    bge .L0809D296
    mov r2, r8
    subs r2, #1
    mov r1, r8
    adds r1, #2
    b .L0809D272
    .align 2, 0
.L0809D268: .4byte gUnk_08103F98
.L0809D26C: .4byte gUnk_08103F84
.L0809D270:
    adds r2, #1
.L0809D272:
    cmp r2, r1
    bge .L0809D292
    cmp r2, #0
    bge .L0809D280
    ldr r0, [sp, #0xc]
    cmp r2, r0
    bge .L0809D270
.L0809D280:
    lsls r0, r2, #1
    adds r0, r0, r5
    add r0, sl
    ldrb r0, [r0, #4]
    lsls r0, r0, #0x1c
    lsrs r0, r0, #0x1c
    cmp r0, #3
    bne .L0809D270
    movs r3, #0
.L0809D292:
    cmp r3, #0
    beq .L0809D2AC
.L0809D296:
    adds r5, #0x38
    adds r4, #1
    cmp r4, r6
    blt .L0809D252
    b .L0809D2AC
.L0809D2A0:
    movs r3, #0
    mov r1, r8
    lsls r1, r1, #1
    mov sb, r1
    lsls r2, r7, #3
    mov ip, r2
.L0809D2AC:
    mov r4, ip
    subs r1, r4, r7
    lsls r1, r1, #3
    add r1, sb
    add r1, sl
    lsls r3, r3, #2
    ldrb r2, [r1, #5]
    movs r0, #3
    ands r0, r2
    orrs r0, r3
    strb r0, [r1, #5]
    b .L0809D2D0
.L0809D2C4:
    subs r2, r2, r0
    cmp r2, #0
    blt .L0809D2D0
.L0809D2CA:
    adds r3, #1
    cmp r3, #4
    ble .L0809D202
.L0809D2D0:
    ldr r5, [sp, #0x24]
    ldr r0, [sp, #0x1c]
    cmp r5, r0
    bhs .L0809D2DA
    b .L0809D1B4
.L0809D2DA:
    mov r0, sl
    ldr r1, [sp]
    bl func_0809D470
    str r0, [sp, #0x14]
    ldr r1, [sp, #4]
    cmp r1, #0
    bgt .L0809D2EC
    b .L0809D402
.L0809D2EC:
    movs r2, #0
    mov r8, r2
    movs r3, #1
    mov sb, r3
    ldr r4, [sp, #4]
    subs r4, #1
    str r4, [sp, #0x20]
.L0809D2FA:
    bl rand
    asrs r0, r0, #8
    ldr r1, [sp, #0xc]
    bl __umodsi3
    adds r4, r0, #0
    bl rand
    asrs r0, r0, #8
    ldr r1, [sp, #0x10]
    bl __umodsi3
    adds r7, r0, #0
    lsls r1, r4, #1
    lsls r0, r7, #3
    subs r0, r0, r7
    lsls r0, r0, #3
    adds r1, r1, r0
    add r1, sl
    ldrb r0, [r1, #4]
    lsls r0, r0, #0x1c
    cmp r0, #0
    bne .L0809D3E6
    movs r0, #1
    mov r8, r0
    movs r2, #0
    ldr r1, [sp, #8]
    ldrb r0, [r1]
    cmp r0, r4
    bne .L0809D370
    ldrb r0, [r1, #1]
    cmp r0, r7
    bne .L0809D370
    mov r8, r2
    b .L0809D38C
.L0809D342:
    subs r3, r5, r7
    lsls r3, r3, #3
    adds r3, r4, r3
    add r3, sl
    ldr r1, .L0809D368 @ =gUnk_08103FE4
    mov r2, ip
    lsls r0, r2, #2
    adds r0, r0, r1
    ldr r2, [r0]
    movs r0, #0x3f
    ands r2, r0
    lsls r2, r2, #4
    ldrh r0, [r3, #4]
    ldr r4, .L0809D36C @ =0xFFFFFC0F
    adds r1, r4, #0
    ands r0, r1
    orrs r0, r2
    strh r0, [r3, #4]
    b .L0809D3E6
    .align 2, 0
.L0809D368: .4byte gUnk_08103FE4
.L0809D36C: .4byte 0xFFFFFC0F
.L0809D370:
    adds r2, #1
    cmp r2, #0xb
    bgt .L0809D38C
    lsls r0, r2, #2
    ldr r3, [sp, #8]
    adds r1, r0, r3
    ldrb r0, [r1]
    cmp r0, r4
    bne .L0809D370
    ldrb r0, [r1, #1]
    cmp r0, r7
    bne .L0809D370
    movs r0, #0
    mov r8, r0
.L0809D38C:
    mov r1, r8
    cmp r1, #1
    bne .L0809D3E6
    lsls r4, r4, #1
    lsls r5, r7, #3
    subs r1, r5, r7
    lsls r1, r1, #3
    adds r1, r4, r1
    add r1, sl
    ldrb r0, [r1, #4]
    movs r3, #0x10
    rsbs r3, r3, #0
    adds r2, r3, #0
    ands r0, r2
    movs r2, #4
    orrs r0, r2
    strb r0, [r1, #4]
    bl rand
    asrs r2, r0, #8
    movs r0, #0xff
    ands r2, r0
    movs r0, #0
    mov ip, r0
    ldr r1, [sp, #0x14]
    lsls r6, r1, #2
    ldr r1, .L0809D414 @ =gUnk_0810400C
    ldr r3, [sp, #0x14]
    adds r0, r6, r3
    lsls r0, r0, #1
    adds r1, r0, r1
.L0809D3CA:
    ldrb r0, [r1]
    cmp r0, #0
    beq .L0809D3DA
    cmp r2, r0
    blt .L0809D342
    subs r2, r2, r0
    cmp r2, #0
    blt .L0809D3E6
.L0809D3DA:
    adds r1, #1
    movs r0, #1
    add ip, r0
    mov r3, ip
    cmp r3, #9
    ble .L0809D3CA
.L0809D3E6:
    mov r4, r8
    cmp r4, #0
    bne .L0809D3F8
    movs r0, #1
    add sb, r0
    mov r1, sb
    cmp r1, #9
    bgt .L0809D3F8
    b .L0809D2FA
.L0809D3F8:
    ldr r2, [sp, #0x20]
    str r2, [sp, #4]
    cmp r2, #0
    ble .L0809D402
    b .L0809D2EC
.L0809D402:
    add sp, #0x28
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L0809D414: .4byte gUnk_0810400C

    thumb_func_start func_0809D418
func_0809D418: @ 0x0809D418
    push {lr}
    movs r0, #0
    cmp r1, #0
    beq .L0809D46C
    cmp r1, #9
    bhi .L0809D428
    movs r0, #1
    b .L0809D46C
.L0809D428:
    cmp r1, #0x63
    bhi .L0809D442
    movs r0, #2
    movs r2, #0x14
    cmp r1, #0x14
    blo .L0809D46C
.L0809D434:
    adds r0, #1
    adds r2, #0x14
    cmp r2, #0x63
    bhi .L0809D46C
    cmp r1, r2
    bhs .L0809D434
    b .L0809D46C
.L0809D442:
    cmp r1, #0x64
    bne .L0809D44A
    movs r0, #7
    b .L0809D46C
.L0809D44A:
    cmp r1, #0xf9
    bhi .L0809D464
    movs r0, #8
    movs r2, #0x82
    cmp r1, #0x82
    blo .L0809D46C
.L0809D456:
    adds r0, #1
    adds r2, #0x1e
    cmp r2, #0xf9
    bhi .L0809D46C
    cmp r1, r2
    bhs .L0809D456
    b .L0809D46C
.L0809D464:
    movs r0, #0xe
    cmp r1, #0xfe
    bhi .L0809D46C
    movs r0, #0xd
.L0809D46C:
    pop {r1}
    bx r1

    thumb_func_start func_0809D470
func_0809D470: @ 0x0809D470
    push {lr}
    cmp r1, #0x98
    beq .L0809D4D2
    cmp r1, #0x98
    bhi .L0809D4A0
    cmp r1, #0x28
    beq .L0809D4CE
    cmp r1, #0x28
    bhi .L0809D48C
    cmp r1, #0x14
    beq .L0809D4C6
    cmp r1, #0x1e
    beq .L0809D4CA
    b .L0809D4DA
.L0809D48C:
    cmp r1, #0x66
    beq .L0809D4D2
    cmp r1, #0x66
    bhi .L0809D49A
    cmp r1, #0x3c
    beq .L0809D4D2
    b .L0809D4DA
.L0809D49A:
    cmp r1, #0x7b
    beq .L0809D4D2
    b .L0809D4DA
.L0809D4A0:
    cmp r1, #0xbe
    beq .L0809D4D2
    cmp r1, #0xbe
    bhi .L0809D4B2
    cmp r1, #0x9b
    beq .L0809D4D2
    cmp r1, #0xab
    beq .L0809D4D2
    b .L0809D4DA
.L0809D4B2:
    cmp r1, #0xde
    beq .L0809D4D2
    cmp r1, #0xde
    bhi .L0809D4C0
    cmp r1, #0xca
    beq .L0809D4D2
    b .L0809D4DA
.L0809D4C0:
    cmp r1, #0xff
    beq .L0809D4D6
    b .L0809D4DA
.L0809D4C6:
    movs r0, #0xc
    b .L0809D4FA
.L0809D4CA:
    movs r0, #0xe
    b .L0809D4FA
.L0809D4CE:
    movs r0, #0x10
    b .L0809D4FA
.L0809D4D2:
    movs r0, #0x12
    b .L0809D4FA
.L0809D4D6:
    movs r0, #0x14
    b .L0809D4FA
.L0809D4DA:
    adds r0, r1, #0
    cmp r0, #0xa
    bls .L0809D4FA
    movs r0, #0xb
    cmp r1, #0x13
    bls .L0809D4FA
    movs r0, #0xd
    cmp r1, #0x1d
    bls .L0809D4FA
    movs r0, #0xf
    cmp r1, #0x27
    bls .L0809D4FA
    movs r0, #0x13
    cmp r1, #0xe6
    bhi .L0809D4FA
    movs r0, #0x11
.L0809D4FA:
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_0809D500
func_0809D500: @ 0x0809D500
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #0x28
    mov sl, r0
    str r1, [sp]
    str r2, [sp, #4]
    str r3, [sp, #8]
    bl func_0809D8A4
    str r0, [sp, #0xc]
    mov r0, sl
    bl func_0809D8B8
    str r0, [sp, #0x10]
    mov r0, sl
    ldr r1, [sp]
    bl func_0809D79C
    str r0, [sp, #0x14]
    bl rand
    asrs r0, r0, #4
    ldr r1, [sp, #0x10]
    ldr r2, [sp, #0xc]
    adds r4, r1, #0
    muls r4, r2, r4
    adds r1, r4, #0
    bl __umodsi3
    str r0, [sp, #0x18]
    movs r5, #0
    cmp r5, r4
    blo .L0809D54A
    b .L0809D66A
.L0809D54A:
    str r4, [sp, #0x1c]
.L0809D54C:
    ldr r3, [sp, #0x18]
    adds r4, r3, r5
    ldr r0, [sp, #0x1c]
    cmp r4, r0
    blo .L0809D558
    subs r4, r4, r0
.L0809D558:
    adds r0, r4, #0
    ldr r1, [sp, #0xc]
    bl __umodsi3
    adds r7, r0, #0
    adds r0, r4, #0
    ldr r1, [sp, #0xc]
    bl __udivsi3
    adds r6, r0, #0
    lsls r0, r7, #1
    lsls r1, r6, #3
    subs r1, r1, r6
    lsls r1, r1, #3
    adds r0, r0, r1
    add r0, sl
    ldrb r0, [r0, #4]
    lsls r0, r0, #0x1c
    lsrs r0, r0, #0x1c
    adds r5, #1
    str r5, [sp, #0x24]
    cmp r0, #1
    bgt .L0809D660
    bl rand
    asrs r2, r0, #4
    movs r0, #0xff
    ands r2, r0
    movs r3, #0
    ldr r1, [sp, #0x14]
    lsls r0, r1, #2
    ldr r1, .L0809D5F8 @ =gUnk_08103B38
    ldr r4, [sp, #0x14]
    adds r0, r0, r4
    lsls r0, r0, #1
    adds r1, r0, r1
.L0809D5A0:
    ldrb r0, [r1]
    cmp r0, #0
    beq .L0809D658
    cmp r2, r0
    bge .L0809D652
    ldr r1, .L0809D5FC @ =gUnk_08103B10
    lsls r0, r3, #2
    adds r0, r0, r1
    ldr r3, [r0]
    lsls r0, r7, #1
    mov sb, r0
    lsls r1, r6, #3
    mov r8, r1
    cmp r3, #1
    bne .L0809D63A
    cmp r6, #0
    beq .L0809D630
    ldr r0, [sp, #0x10]
    subs r0, #1
    cmp r6, r0
    bhs .L0809D630
    cmp r7, #0
    beq .L0809D630
    ldr r0, [sp, #0xc]
    subs r0, #1
    cmp r7, r0
    bhs .L0809D630
    subs r4, r6, #1
    adds r2, r6, #2
    mov ip, r2
    cmp r4, ip
    bge .L0809D63A
    lsls r0, r4, #3
    subs r0, r0, r4
    lsls r5, r0, #3
.L0809D5E6:
    cmp r4, #0
    blt .L0809D626
    ldr r0, [sp, #0x10]
    cmp r4, r0
    bge .L0809D626
    subs r2, r7, #1
    adds r1, r7, #2
    b .L0809D602
    .align 2, 0
.L0809D5F8: .4byte gUnk_08103B38
.L0809D5FC: .4byte gUnk_08103B10
.L0809D600:
    adds r2, #1
.L0809D602:
    cmp r2, r1
    bge .L0809D622
    cmp r2, #0
    bge .L0809D610
    ldr r0, [sp, #0xc]
    cmp r2, r0
    bge .L0809D600
.L0809D610:
    lsls r0, r2, #1
    adds r0, r0, r5
    add r0, sl
    ldrb r0, [r0, #4]
    lsls r0, r0, #0x1c
    lsrs r0, r0, #0x1c
    cmp r0, #3
    bne .L0809D600
    movs r3, #0
.L0809D622:
    cmp r3, #0
    beq .L0809D63A
.L0809D626:
    adds r5, #0x38
    adds r4, #1
    cmp r4, ip
    blt .L0809D5E6
    b .L0809D63A
.L0809D630:
    movs r3, #0
    lsls r7, r7, #1
    mov sb, r7
    lsls r1, r6, #3
    mov r8, r1
.L0809D63A:
    mov r2, r8
    subs r1, r2, r6
    lsls r1, r1, #3
    add r1, sb
    add r1, sl
    lsls r3, r3, #2
    ldrb r2, [r1, #5]
    movs r0, #3
    ands r0, r2
    orrs r0, r3
    strb r0, [r1, #5]
    b .L0809D660
.L0809D652:
    subs r2, r2, r0
    cmp r2, #0
    blt .L0809D660
.L0809D658:
    adds r1, #1
    adds r3, #1
    cmp r3, #9
    ble .L0809D5A0
.L0809D660:
    ldr r5, [sp, #0x24]
    ldr r3, [sp, #0x1c]
    cmp r5, r3
    bhs .L0809D66A
    b .L0809D54C
.L0809D66A:
    mov r0, sl
    ldr r1, [sp]
    bl func_0809D7D8
    str r0, [sp, #0x14]
    ldr r4, [sp, #4]
    cmp r4, #0
    bgt .L0809D67C
    b .L0809D788
.L0809D67C:
    movs r0, #0
    mov r8, r0
    movs r1, #1
    mov sb, r1
    ldr r2, [sp, #4]
    subs r2, #1
    str r2, [sp, #0x20]
.L0809D68A:
    bl rand
    asrs r0, r0, #8
    ldr r1, [sp, #0xc]
    bl __umodsi3
    adds r4, r0, #0
    bl rand
    asrs r0, r0, #8
    ldr r1, [sp, #0x10]
    bl __umodsi3
    adds r6, r0, #0
    lsls r1, r4, #1
    lsls r0, r6, #3
    subs r0, r0, r6
    lsls r0, r0, #3
    adds r1, r1, r0
    add r1, sl
    ldrb r0, [r1, #4]
    lsls r0, r0, #0x1c
    cmp r0, #0
    bne .L0809D76E
    movs r3, #1
    mov r8, r3
    movs r2, #0
    ldr r1, [sp, #8]
    ldrb r0, [r1]
    cmp r0, r4
    bne .L0809D700
    ldrb r0, [r1, #1]
    cmp r0, r6
    bne .L0809D700
    mov r8, r2
    b .L0809D71C
.L0809D6D2:
    subs r3, r5, r6
    lsls r3, r3, #3
    adds r3, r4, r3
    add r3, sl
    ldr r1, .L0809D6F8 @ =gUnk_08103C3C
    lsls r0, r7, #2
    adds r0, r0, r1
    ldr r2, [r0]
    movs r0, #0x3f
    ands r2, r0
    lsls r2, r2, #4
    ldrh r0, [r3, #4]
    ldr r4, .L0809D6FC @ =0xFFFFFC0F
    adds r1, r4, #0
    ands r0, r1
    orrs r0, r2
    strh r0, [r3, #4]
    b .L0809D76E
    .align 2, 0
.L0809D6F8: .4byte gUnk_08103C3C
.L0809D6FC: .4byte 0xFFFFFC0F
.L0809D700:
    adds r2, #1
    cmp r2, #0xb
    bgt .L0809D71C
    lsls r0, r2, #2
    ldr r3, [sp, #8]
    adds r1, r0, r3
    ldrb r0, [r1]
    cmp r0, r4
    bne .L0809D700
    ldrb r0, [r1, #1]
    cmp r0, r6
    bne .L0809D700
    movs r0, #0
    mov r8, r0
.L0809D71C:
    mov r1, r8
    cmp r1, #1
    bne .L0809D76E
    lsls r4, r4, #1
    lsls r5, r6, #3
    subs r1, r5, r6
    lsls r1, r1, #3
    adds r1, r4, r1
    add r1, sl
    ldrb r0, [r1, #4]
    movs r3, #0x10
    rsbs r3, r3, #0
    adds r2, r3, #0
    ands r0, r2
    movs r2, #4
    orrs r0, r2
    strb r0, [r1, #4]
    bl rand
    asrs r2, r0, #8
    movs r0, #0xff
    ands r2, r0
    movs r7, #0
    ldr r1, .L0809D798 @ =gUnk_08103C74
    ldr r3, [sp, #0x14]
    lsls r0, r3, #3
    subs r0, r0, r3
    lsls r0, r0, #1
    adds r1, r0, r1
.L0809D756:
    ldrb r0, [r1]
    cmp r0, #0
    beq .L0809D766
    cmp r2, r0
    blt .L0809D6D2
    subs r2, r2, r0
    cmp r2, #0
    blt .L0809D76E
.L0809D766:
    adds r1, #1
    adds r7, #1
    cmp r7, #0xd
    ble .L0809D756
.L0809D76E:
    mov r4, r8
    cmp r4, #0
    bne .L0809D77E
    movs r0, #1
    add sb, r0
    mov r1, sb
    cmp r1, #9
    ble .L0809D68A
.L0809D77E:
    ldr r2, [sp, #0x20]
    str r2, [sp, #4]
    cmp r2, #0
    ble .L0809D788
    b .L0809D67C
.L0809D788:
    add sp, #0x28
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L0809D798: .4byte gUnk_08103C74

    thumb_func_start func_0809D79C
func_0809D79C: @ 0x0809D79C
    push {lr}
    adds r0, r1, #0
    cmp r0, #9
    bls .L0809D7D2
    movs r0, #0x19
    cmp r1, #0xff
    beq .L0809D7D2
    movs r0, #0x18
    cmp r1, #0x4f
    bhi .L0809D7D2
    movs r0, #0xa
    movs r2, #0x13
    cmp r1, #0x13
    blo .L0809D7D2
    cmp r1, #0x13
    bne .L0809D7C0
    movs r0, #0xb
    b .L0809D7D2
.L0809D7C0:
    adds r0, #2
    adds r2, #0xa
    cmp r2, #0x4f
    bhi .L0809D7D2
    cmp r1, r2
    blo .L0809D7D2
    cmp r1, r2
    bne .L0809D7C0
    adds r0, #1
.L0809D7D2:
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_0809D7D8
func_0809D7D8: @ 0x0809D7D8
    push {lr}
    adds r0, r1, #0
    cmp r0, #0x78
    beq .L0809D866
    cmp r0, #0x78
    bhi .L0809D81C
    cmp r0, #0x46
    beq .L0809D856
    cmp r0, #0x46
    bhi .L0809D804
    cmp r0, #0x28
    beq .L0809D85A
    cmp r0, #0x28
    bhi .L0809D7FA
    cmp r0, #0x1e
    beq .L0809D856
    b .L0809D86A
.L0809D7FA:
    cmp r0, #0x32
    beq .L0809D85E
    cmp r0, #0x3c
    beq .L0809D85A
    b .L0809D86A
.L0809D804:
    cmp r0, #0x5a
    beq .L0809D856
    cmp r0, #0x5a
    bhi .L0809D812
    cmp r0, #0x50
    beq .L0809D85A
    b .L0809D86A
.L0809D812:
    cmp r0, #0x64
    beq .L0809D85E
    cmp r0, #0x6e
    beq .L0809D862
    b .L0809D86A
.L0809D81C:
    cmp r0, #0xaa
    beq .L0809D862
    cmp r0, #0xaa
    bhi .L0809D83C
    cmp r0, #0x8c
    beq .L0809D866
    cmp r0, #0x8c
    bhi .L0809D832
    cmp r0, #0x82
    beq .L0809D862
    b .L0809D86A
.L0809D832:
    cmp r0, #0x96
    beq .L0809D85E
    cmp r0, #0xa0
    beq .L0809D866
    b .L0809D86A
.L0809D83C:
    cmp r0, #0xbe
    beq .L0809D862
    cmp r0, #0xbe
    bhi .L0809D84A
    cmp r0, #0xb4
    beq .L0809D866
    b .L0809D86A
.L0809D84A:
    cmp r0, #0xc8
    beq .L0809D85E
    cmp r0, #0xff
    bne .L0809D86A
    movs r0, #0x37
    b .L0809D89A
.L0809D856:
    movs r0, #0x1e
    b .L0809D89A
.L0809D85A:
    movs r0, #0x1f
    b .L0809D89A
.L0809D85E:
    movs r0, #0x20
    b .L0809D89A
.L0809D862:
    movs r0, #0x2a
    b .L0809D89A
.L0809D866:
    movs r0, #0x2b
    b .L0809D89A
.L0809D86A:
    cmp r0, #0x14
    bls .L0809D89A
    cmp r0, #0xfa
    bls .L0809D876
    movs r0, #0x36
    b .L0809D89A
.L0809D876:
    cmp r0, #0x63
    bhi .L0809D884
    movs r1, #0xa
    bl __umodsi3
    adds r0, #0x14
    b .L0809D89A
.L0809D884:
    cmp r0, #0xc7
    bhi .L0809D892
    movs r1, #0xa
    bl __umodsi3
    adds r0, #0x20
    b .L0809D89A
.L0809D892:
    movs r1, #0xa
    bl __umodsi3
    adds r0, #0x2b
.L0809D89A:
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_0809D8A0
func_0809D8A0: @ 0x0809D8A0
    ldr r0, [r0]
    bx lr

    thumb_func_start func_0809D8A4
func_0809D8A4: @ 0x0809D8A4
    push {lr}
    movs r1, #0xd
    ldr r0, [r0]
    cmp r0, #1
    bne .L0809D8B0
    movs r1, #0x1c
.L0809D8B0:
    adds r0, r1, #0
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_0809D8B8
func_0809D8B8: @ 0x0809D8B8
    push {lr}
    movs r1, #6
    ldr r0, [r0]
    cmp r0, #1
    bne .L0809D8C6
    movs r1, #0x1c
    b .L0809D8CC
.L0809D8C6:
    cmp r0, #2
    bne .L0809D8CC
    movs r1, #0xe
.L0809D8CC:
    adds r0, r1, #0
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_0809D8D4
func_0809D8D4: @ 0x0809D8D4
    lsls r1, r1, #1
    lsls r3, r2, #3
    subs r3, r3, r2
    lsls r3, r3, #3
    adds r1, r1, r3
    adds r0, r0, r1
    ldrb r0, [r0, #4]
    lsls r0, r0, #0x1c
    lsrs r0, r0, #0x1c
    bx lr

    thumb_func_start func_0809D8E8
func_0809D8E8: @ 0x0809D8E8
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #8
    adds r6, r0, #0
    mov sl, r2
    adds r2, r3, #0
    movs r0, #0
    str r0, [sp]
    lsls r7, r1, #1
    mov r1, sl
    lsls r3, r1, #3
    subs r0, r3, r1
    lsls r0, r0, #3
    adds r0, r7, r0
    adds r4, r6, r0
    ldrb r0, [r4, #4]
    lsls r0, r0, #0x1c
    cmp r0, #0
    bne .L0809D9A2
    ldrb r1, [r4, #5]
    lsrs r1, r1, #2
    adds r0, r6, #0
    str r3, [sp, #4]
    bl func_0809DA00
    str r0, [sp]
    ldr r3, [sp, #4]
    cmp r0, #1
    bne .L0809D97C
    ldrb r0, [r4, #4]
    movs r1, #0x10
    rsbs r1, r1, #0
    ands r1, r0
    movs r0, #2
    orrs r1, r0
    strb r1, [r4, #4]
    movs r2, #0
    str r2, [sp]
    movs r5, #0
    mov sb, r7
    mov r8, r3
    b .L0809D970
.L0809D942:
    movs r4, #0
    adds r7, r5, #1
    b .L0809D964
.L0809D948:
    lsls r0, r4, #1
    lsls r1, r5, #3
    subs r1, r1, r5
    lsls r1, r1, #3
    adds r0, r0, r1
    adds r2, r6, r0
    ldrb r1, [r2, #5]
    lsrs r0, r1, #2
    cmp r0, #1
    bne .L0809D962
    movs r0, #3
    ands r0, r1
    strb r0, [r2, #5]
.L0809D962:
    adds r4, #1
.L0809D964:
    adds r0, r6, #0
    bl func_0809D8A4
    cmp r4, r0
    blt .L0809D948
    adds r5, r7, #0
.L0809D970:
    adds r0, r6, #0
    bl func_0809D8B8
    cmp r5, r0
    blt .L0809D942
    b .L0809D98E
.L0809D97C:
    ldrb r0, [r4, #4]
    movs r1, #0x10
    rsbs r1, r1, #0
    ands r1, r0
    movs r0, #1
    orrs r1, r0
    strb r1, [r4, #4]
    mov sb, r7
    mov r8, r3
.L0809D98E:
    mov r1, r8
    mov r2, sl
    subs r0, r1, r2
    lsls r0, r0, #3
    add r0, sb
    adds r0, r6, r0
    ldrb r2, [r0, #5]
    movs r1, #3
    ands r1, r2
    strb r1, [r0, #5]
.L0809D9A2:
    ldr r0, [sp]
    add sp, #8
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1

    thumb_func_start func_0809D9B4
func_0809D9B4: @ 0x0809D9B4
    push {r4, r5, r6, lr}
    adds r5, r0, #0
    movs r6, #0
    lsls r1, r1, #1
    lsls r0, r2, #3
    subs r0, r0, r2
    lsls r0, r0, #3
    adds r1, r1, r0
    adds r4, r5, r1
    ldrb r0, [r4, #4]
    lsls r0, r0, #0x1c
    lsrs r0, r0, #0x1c
    cmp r0, #4
    bne .L0809D9F2
    ldrh r1, [r4, #4]
    lsls r1, r1, #0x16
    lsrs r1, r1, #0x1a
    adds r0, r5, #0
    adds r2, r3, #0
    bl func_0809DA00
    adds r6, r0, #0
    ldrb r1, [r4, #4]
    movs r0, #0x10
    rsbs r0, r0, #0
    ands r0, r1
    strb r0, [r4, #4]
    ldrh r1, [r4, #4]
    ldr r0, .L0809D9FC @ =0xFFFFFC0F
    ands r0, r1
    strh r0, [r4, #4]
.L0809D9F2:
    adds r0, r6, #0
    pop {r4, r5, r6}
    pop {r1}
    bx r1
    .align 2, 0
.L0809D9FC: .4byte 0xFFFFFC0F

    thumb_func_start func_0809DA00
func_0809DA00: @ 0x0809DA00
    push {r4, r5, r6, r7, lr}
    mov r7, r8
    push {r7}
    sub sp, #0x10
    adds r5, r0, #0
    mov r8, r1
    adds r6, r2, #0
    mov r0, r8
    subs r0, #3
    cmp r0, #0x1f
    bls .L0809DA18
    b .L0809DF1C
.L0809DA18:
    lsls r0, r0, #2
    ldr r1, .L0809DA24 @ =.L0809DA28
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L0809DA24: .4byte .L0809DA28
.L0809DA28: @ jump table
    .4byte .L0809DAA8 @ case 0
    .4byte .L0809DB02 @ case 1
    .4byte .L0809DB02 @ case 2
    .4byte .L0809DB02 @ case 3
    .4byte .L0809DB02 @ case 4
    .4byte .L0809DB02 @ case 5
    .4byte .L0809DB02 @ case 6
    .4byte .L0809DB9C @ case 7
    .4byte .L0809DF1C @ case 8
    .4byte .L0809DF1C @ case 9
    .4byte .L0809DF1C @ case 10
    .4byte .L0809DF1C @ case 11
    .4byte .L0809DF1C @ case 12
    .4byte .L0809DF1C @ case 13
    .4byte .L0809DF1C @ case 14
    .4byte .L0809DF1C @ case 15
    .4byte .L0809DF1C @ case 16
    .4byte .L0809DF1C @ case 17
    .4byte .L0809DF1C @ case 18
    .4byte .L0809DF1C @ case 19
    .4byte .L0809DBFC @ case 20
    .4byte .L0809DF1C @ case 21
    .4byte .L0809DF1C @ case 22
    .4byte .L0809DF1C @ case 23
    .4byte .L0809DF1C @ case 24
    .4byte .L0809DF1C @ case 25
    .4byte .L0809DF1C @ case 26
    .4byte .L0809DF1C @ case 27
    .4byte .L0809DF1C @ case 28
    .4byte .L0809DC36 @ case 29
    .4byte .L0809DDA6 @ case 30
    .4byte .L0809DEFC @ case 31
.L0809DAA8:
    ldr r0, .L0809DAD4 @ =0x00001BD8
    adds r1, r6, r0
    mov r0, sp
    bl func_0800E924
    mov r0, sp
    ldrh r0, [r0]
    lsls r0, r0, #0x16
    ldr r1, .L0809DAD8 @ =0x4CC00000
    cmp r0, r1
    bgt .L0809DAE0
    ldr r1, .L0809DADC @ =0x00000625
    adds r2, r5, r1
    ldrb r1, [r2]
    movs r0, #4
    ands r0, r1
    cmp r0, #0
    beq .L0809DACE
    b .L0809DC30
.L0809DACE:
    movs r0, #4
    b .L0809DAF0
    .align 2, 0
.L0809DAD4: .4byte 0x00001BD8
.L0809DAD8: .4byte 0x4CC00000
.L0809DADC: .4byte 0x00000625
.L0809DAE0:
    ldr r0, .L0809DAF8 @ =0x00000624
    adds r2, r5, r0
    ldrb r1, [r2]
    movs r0, #1
    ands r0, r1
    cmp r0, #0
    bne .L0809DAFC
    movs r0, #1
.L0809DAF0:
    orrs r0, r1
    strb r0, [r2]
    b .L0809DF1C
    .align 2, 0
.L0809DAF8: .4byte 0x00000624
.L0809DAFC:
    movs r1, #0
    mov r8, r1
    b .L0809DF1C
.L0809DB02:
    movs r4, #0
    ldr r2, .L0809DB50 @ =0x00001C38
    adds r0, r6, r2
    bl GetFirstFreeToolSlot__C8Rucksack
    movs r1, #1
    rsbs r1, r1, #0
    cmp r0, r1
    bne .L0809DB16
    movs r4, #1
.L0809DB16:
    ldr r1, .L0809DB54 @ =0x00001DAC
    adds r0, r6, r1
    bl func_0809ED04
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0809DB26
    movs r4, #1
.L0809DB26:
    adds r0, r5, #0
    mov r1, r8
    adds r2, r6, #0
    bl func_0809DF2C
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0809DB38
    movs r4, #1
.L0809DB38:
    cmp r4, #1
    beq .L0809DC30
    movs r1, #0x51
    mov r0, r8
    subs r0, #4
    cmp r0, #5
    bhi .L0809DB8A
    lsls r0, r0, #2
    ldr r1, .L0809DB58 @ =.L0809DB5C
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L0809DB50: .4byte 0x00001C38
.L0809DB54: .4byte 0x00001DAC
.L0809DB58: .4byte .L0809DB5C
.L0809DB5C: @ jump table
    .4byte .L0809DB74 @ case 0
    .4byte .L0809DB78 @ case 1
    .4byte .L0809DB7C @ case 2
    .4byte .L0809DB80 @ case 3
    .4byte .L0809DB84 @ case 4
    .4byte .L0809DB88 @ case 5
.L0809DB74:
    movs r1, #5
    b .L0809DB8A
.L0809DB78:
    movs r1, #0xd
    b .L0809DB8A
.L0809DB7C:
    movs r1, #0x15
    b .L0809DB8A
.L0809DB80:
    movs r1, #0x1d
    b .L0809DB8A
.L0809DB84:
    movs r1, #0x25
    b .L0809DB8A
.L0809DB88:
    movs r1, #0x2d
.L0809DB8A:
    cmp r1, #0x51
    bne .L0809DB90
    b .L0809DF1C
.L0809DB90:
    movs r2, #0xd2
    lsls r2, r2, #6
    adds r0, r6, r2
    bl func_0809C3BC
    b .L0809DF1C
.L0809DB9C:
    movs r7, #0
    movs r3, #0xc8
    str r3, [sp, #8]
    ldrb r0, [r6, #0x10]
    lsrs r2, r0, #3
    lsls r1, r2, #3
    subs r1, r1, r2
    lsls r0, r0, #0x1d
    lsrs r0, r0, #0x1d
    adds r1, r1, r0
    str r1, [sp, #0xc]
    add r2, sp, #0xc
    add r0, sp, #8
    cmp r3, r1
    bls .L0809DBBC
    adds r0, r2, #0
.L0809DBBC:
    ldr r0, [r0]
    cmp r0, #2
    bhi .L0809DBC4
    movs r7, #1
.L0809DBC4:
    ldr r0, .L0809DBF4 @ =0x00000625
    adds r4, r5, r0
    ldrb r1, [r4]
    movs r0, #0x10
    ands r0, r1
    cmp r0, #0
    beq .L0809DBD4
    movs r7, #1
.L0809DBD4:
    ldr r1, .L0809DBF8 @ =0x00001C38
    adds r0, r6, r1
    bl GetFirstFreeToolSlot__C8Rucksack
    movs r1, #1
    rsbs r1, r1, #0
    cmp r0, r1
    bne .L0809DBE6
    movs r7, #1
.L0809DBE6:
    cmp r7, #0
    bne .L0809DC30
    ldrb r0, [r4]
    movs r1, #0x10
    orrs r0, r1
    strb r0, [r4]
    b .L0809DF1C
    .align 2, 0
.L0809DBF4: .4byte 0x00000625
.L0809DBF8: .4byte 0x00001C38
.L0809DBFC:
    movs r7, #0
    movs r1, #0xd2
    lsls r1, r1, #6
    adds r0, r6, r1
    bl func_0809C38C
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0809DC10
    movs r7, #1
.L0809DC10:
    movs r4, #4
.L0809DC12:
    adds r0, r5, #0
    adds r1, r4, #0
    adds r2, r6, #0
    bl func_0809DF2C
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0809DC24
    movs r7, #1
.L0809DC24:
    adds r4, #1
    cmp r4, #9
    ble .L0809DC12
    cmp r7, #1
    beq .L0809DC30
    b .L0809DF1C
.L0809DC30:
    movs r2, #0
    mov r8, r2
    b .L0809DF1C
.L0809DC36:
    movs r4, #0
    movs r1, #0xfa
    lsls r1, r1, #1
    adds r0, r6, r1
    bl GetShelf__9FarmHouse
    cmp r0, #0
    bne .L0809DC48
    movs r4, #1
.L0809DC48:
    adds r0, r5, #0
    bl func_0809DFAC
    lsls r0, r0, #0x18
    lsrs r0, r0, #0x18
    cmp r0, #8
    bne .L0809DC68
    ldr r2, .L0809DC98 @ =0x00001C38
    adds r0, r6, r2
    bl GetFirstFreeToolSlot__C8Rucksack
    movs r1, #1
    rsbs r1, r1, #0
    cmp r0, r1
    bne .L0809DC68
    movs r4, #1
.L0809DC68:
    cmp r4, #0
    beq .L0809DC6E
    b .L0809DD9E
.L0809DC6E:
    ldr r0, .L0809DC9C @ =0x00001BD8
    adds r1, r6, r0
    mov r0, sp
    bl func_0800E924
    mov r0, sp
    ldrh r0, [r0]
    lsls r0, r0, #0x16
    lsrs r0, r0, #0x16
    subs r0, #0x34
    cmp r0, #0x9b
    beq .L0809DD20
    cmp r0, #0x9b
    bgt .L0809DCAA
    cmp r0, #0x66
    beq .L0809DCD8
    cmp r0, #0x66
    bgt .L0809DCA0
    cmp r0, #0x3c
    beq .L0809DCC2
    b .L0809DD9C
    .align 2, 0
.L0809DC98: .4byte 0x00001C38
.L0809DC9C: .4byte 0x00001BD8
.L0809DCA0:
    cmp r0, #0x7b
    beq .L0809DCF0
    cmp r0, #0x98
    beq .L0809DD08
    b .L0809DD9C
.L0809DCAA:
    cmp r0, #0xbe
    beq .L0809DD50
    cmp r0, #0xbe
    bgt .L0809DCB8
    cmp r0, #0xab
    beq .L0809DD38
    b .L0809DD9C
.L0809DCB8:
    cmp r0, #0xca
    beq .L0809DD68
    cmp r0, #0xde
    beq .L0809DD80
    b .L0809DD9C
.L0809DCC2:
    ldr r2, .L0809DCD4 @ =0x00000625
    adds r1, r5, r2
    ldrb r2, [r1]
    movs r0, #0x20
    ands r0, r2
    cmp r0, #0
    beq .L0809DD8E
    b .L0809DD9C
    .align 2, 0
.L0809DCD4: .4byte 0x00000625
.L0809DCD8:
    ldr r0, .L0809DCEC @ =0x00000625
    adds r1, r5, r0
    ldrb r2, [r1]
    movs r0, #0x40
    ands r0, r2
    cmp r0, #0
    bne .L0809DD9C
    movs r0, #0x40
    b .L0809DD90
    .align 2, 0
.L0809DCEC: .4byte 0x00000625
.L0809DCF0:
    ldr r2, .L0809DD04 @ =0x00000625
    adds r1, r5, r2
    ldrb r2, [r1]
    movs r0, #0x80
    ands r0, r2
    cmp r0, #0
    bne .L0809DD9C
    movs r0, #0x80
    b .L0809DD90
    .align 2, 0
.L0809DD04: .4byte 0x00000625
.L0809DD08:
    ldr r0, .L0809DD1C @ =0x00000626
    adds r1, r5, r0
    ldrb r2, [r1]
    movs r0, #1
    ands r0, r2
    cmp r0, #0
    bne .L0809DD9C
    movs r0, #1
    b .L0809DD90
    .align 2, 0
.L0809DD1C: .4byte 0x00000626
.L0809DD20:
    ldr r2, .L0809DD34 @ =0x00000626
    adds r1, r5, r2
    ldrb r2, [r1]
    movs r0, #2
    ands r0, r2
    cmp r0, #0
    bne .L0809DD9C
    movs r0, #2
    b .L0809DD90
    .align 2, 0
.L0809DD34: .4byte 0x00000626
.L0809DD38:
    ldr r0, .L0809DD4C @ =0x00000626
    adds r1, r5, r0
    ldrb r2, [r1]
    movs r0, #4
    ands r0, r2
    cmp r0, #0
    bne .L0809DD9C
    movs r0, #4
    b .L0809DD90
    .align 2, 0
.L0809DD4C: .4byte 0x00000626
.L0809DD50:
    ldr r2, .L0809DD64 @ =0x00000626
    adds r1, r5, r2
    ldrb r2, [r1]
    movs r0, #8
    ands r0, r2
    cmp r0, #0
    bne .L0809DD9C
    movs r0, #8
    b .L0809DD90
    .align 2, 0
.L0809DD64: .4byte 0x00000626
.L0809DD68:
    ldr r0, .L0809DD7C @ =0x00000626
    adds r1, r5, r0
    ldrb r2, [r1]
    movs r0, #0x10
    ands r0, r2
    cmp r0, #0
    bne .L0809DD9C
    movs r0, #0x10
    b .L0809DD90
    .align 2, 0
.L0809DD7C: .4byte 0x00000626
.L0809DD80:
    ldr r2, .L0809DD98 @ =0x00000626
.L0809DD82:
    adds r1, r5, r2
    ldrb r2, [r1]
    movs r0, #0x20
    ands r0, r2
    cmp r0, #0
    bne .L0809DD9C
.L0809DD8E:
    movs r0, #0x20
.L0809DD90:
    orrs r0, r2
    strb r0, [r1]
    b .L0809DD9E
    .align 2, 0
.L0809DD98: .4byte 0x00000626
.L0809DD9C:
    movs r4, #1
.L0809DD9E:
    cmp r4, #1
    beq .L0809DDA4
    b .L0809DF1C
.L0809DDA4:
    b .L0809DF18
.L0809DDA6:
    movs r4, #0
    movs r1, #0xfa
    lsls r1, r1, #1
    adds r0, r6, r1
    bl GetShelf__9FarmHouse
    cmp r0, #0
    bne .L0809DDB8
    movs r4, #1
.L0809DDB8:
    adds r0, r5, #0
    bl func_0809E02C
    lsls r0, r0, #0x18
    lsrs r0, r0, #0x18
    cmp r0, #8
    bne .L0809DDD8
    ldr r2, .L0809DE08 @ =0x00001C38
    adds r0, r6, r2
    bl GetFirstFreeToolSlot__C8Rucksack
    movs r1, #1
    rsbs r1, r1, #0
    cmp r0, r1
    bne .L0809DDD8
    movs r4, #1
.L0809DDD8:
    cmp r4, #0
    bne .L0809DD9E
    ldr r0, .L0809DE0C @ =0x00001BD8
    adds r1, r6, r0
    mov r0, sp
    bl func_0800E924
    mov r0, sp
    ldrh r0, [r0]
    lsls r0, r0, #0x16
    lsrs r0, r0, #0x16
    ldr r1, .L0809DE10 @ =0xFFFFFECC
    adds r0, r0, r1
    cmp r0, #0x78
    beq .L0809DE94
    cmp r0, #0x78
    bgt .L0809DE1E
    cmp r0, #0x28
    beq .L0809DE4C
    cmp r0, #0x28
    bgt .L0809DE14
    cmp r0, #0
    beq .L0809DE36
    b .L0809DD9C
    .align 2, 0
.L0809DE08: .4byte 0x00001C38
.L0809DE0C: .4byte 0x00001BD8
.L0809DE10: .4byte 0xFFFFFECC
.L0809DE14:
    cmp r0, #0x3c
    beq .L0809DE64
    cmp r0, #0x50
    beq .L0809DE7C
    b .L0809DD9C
.L0809DE1E:
    cmp r0, #0xa0
    beq .L0809DEB4
    cmp r0, #0xa0
    bgt .L0809DE2C
    cmp r0, #0x8c
    beq .L0809DE9C
    b .L0809DD9C
.L0809DE2C:
    cmp r0, #0xb4
    beq .L0809DECC
    cmp r0, #0xff
    beq .L0809DEE4
    b .L0809DD9C
.L0809DE36:
    ldr r2, .L0809DE48 @ =0x00000624
    adds r1, r5, r2
    ldrb r2, [r1]
    movs r0, #2
    ands r0, r2
    cmp r0, #0
    beq .L0809DEF4
    b .L0809DD9C
    .align 2, 0
.L0809DE48: .4byte 0x00000624
.L0809DE4C:
    ldr r0, .L0809DE60 @ =0x00000624
    adds r1, r5, r0
    ldrb r2, [r1]
    movs r0, #4
    ands r0, r2
    cmp r0, #0
    bne .L0809DD9C
    movs r0, #4
    b .L0809DD90
    .align 2, 0
.L0809DE60: .4byte 0x00000624
.L0809DE64:
    ldr r2, .L0809DE78 @ =0x00000624
    adds r1, r5, r2
    ldrb r2, [r1]
    movs r0, #8
    ands r0, r2
    cmp r0, #0
    bne .L0809DD9C
    movs r0, #8
    b .L0809DD90
    .align 2, 0
.L0809DE78: .4byte 0x00000624
.L0809DE7C:
    ldr r0, .L0809DE90 @ =0x00000624
    adds r1, r5, r0
    ldrb r2, [r1]
    movs r0, #0x10
    ands r0, r2
    cmp r0, #0
    bne .L0809DD9C
    movs r0, #0x10
    b .L0809DD90
    .align 2, 0
.L0809DE90: .4byte 0x00000624
.L0809DE94:
    ldr r2, .L0809DE98 @ =0x00000624
    b .L0809DD82
    .align 2, 0
.L0809DE98: .4byte 0x00000624
.L0809DE9C:
    ldr r0, .L0809DEB0 @ =0x00000624
    adds r1, r5, r0
    ldrb r2, [r1]
    movs r0, #0x40
    ands r0, r2
    cmp r0, #0
    beq .L0809DEAC
    b .L0809DD9C
.L0809DEAC:
    movs r0, #0x40
    b .L0809DD90
    .align 2, 0
.L0809DEB0: .4byte 0x00000624
.L0809DEB4:
    ldr r2, .L0809DEC8 @ =0x00000624
    adds r1, r5, r2
    ldrb r2, [r1]
    movs r0, #0x80
    ands r0, r2
    cmp r0, #0
    beq .L0809DEC4
    b .L0809DD9C
.L0809DEC4:
    movs r0, #0x80
    b .L0809DD90
    .align 2, 0
.L0809DEC8: .4byte 0x00000624
.L0809DECC:
    ldr r0, .L0809DEE0 @ =0x00000625
    adds r1, r5, r0
    ldrb r2, [r1]
    movs r0, #1
    ands r0, r2
    cmp r0, #0
    beq .L0809DEDC
    b .L0809DD9C
.L0809DEDC:
    movs r0, #1
    b .L0809DD90
    .align 2, 0
.L0809DEE0: .4byte 0x00000625
.L0809DEE4:
    ldr r2, .L0809DEF8 @ =0x00000625
    adds r1, r5, r2
    ldrb r2, [r1]
    movs r0, #2
    ands r0, r2
    cmp r0, #0
    beq .L0809DEF4
    b .L0809DD9C
.L0809DEF4:
    movs r0, #2
    b .L0809DD90
    .align 2, 0
.L0809DEF8: .4byte 0x00000625
.L0809DEFC:
    ldr r2, .L0809DF14 @ =0x00000625
    adds r1, r5, r2
    ldrb r2, [r1]
    movs r0, #8
    ands r0, r2
    cmp r0, #0
    bne .L0809DF18
    movs r0, #8
    orrs r0, r2
    strb r0, [r1]
    b .L0809DF1C
    .align 2, 0
.L0809DF14: .4byte 0x00000625
.L0809DF18:
    movs r0, #0
    mov r8, r0
.L0809DF1C:
    mov r0, r8
    add sp, #0x10
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_0809DF2C
func_0809DF2C: @ 0x0809DF2C
    push {r4, r5, r6, r7, lr}
    adds r7, r2, #0
    movs r6, #0
    movs r4, #0x51
    subs r0, r1, #4
    cmp r0, #5
    bhi .L0809DF76
    lsls r0, r0, #2
    ldr r1, .L0809DF44 @ =.L0809DF48
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L0809DF44: .4byte .L0809DF48
.L0809DF48: @ jump table
    .4byte .L0809DF60 @ case 0
    .4byte .L0809DF64 @ case 1
    .4byte .L0809DF68 @ case 2
    .4byte .L0809DF6C @ case 3
    .4byte .L0809DF70 @ case 4
    .4byte .L0809DF74 @ case 5
.L0809DF60:
    movs r4, #5
    b .L0809DF76
.L0809DF64:
    movs r4, #0xd
    b .L0809DF76
.L0809DF68:
    movs r4, #0x15
    b .L0809DF76
.L0809DF6C:
    movs r4, #0x1d
    b .L0809DF76
.L0809DF70:
    movs r4, #0x25
    b .L0809DF76
.L0809DF74:
    movs r4, #0x2d
.L0809DF76:
    cmp r4, #0x50
    bgt .L0809DFA0
    ldr r1, .L0809DFA8 @ =0x00001C38
    adds r0, r7, r1
    adds r1, r4, #0
    bl GetFirstSlotWithTool__C8RucksackUi
    movs r5, #1
    rsbs r5, r5, #0
    cmp r0, r5
    beq .L0809DF8E
    movs r6, #1
.L0809DF8E:
    movs r1, #0xe0
    lsls r1, r1, #2
    adds r0, r7, r1
    adds r1, r4, #0
    bl GetFirstSlotWith__C9ToolChestUi
    cmp r0, r5
    beq .L0809DFA0
    movs r6, #1
.L0809DFA0:
    adds r0, r6, #0
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    .align 2, 0
.L0809DFA8: .4byte 0x00001C38

    thumb_func_start func_0809DFAC
func_0809DFAC: @ 0x0809DFAC
    push {lr}
    adds r3, r0, #0
    ldr r1, .L0809E024 @ =0x00000625
    adds r0, r3, r1
    ldrb r2, [r0]
    lsls r0, r2, #0x1a
    lsrs r1, r0, #0x1f
    lsls r0, r2, #0x19
    cmp r0, #0
    bge .L0809DFC2
    adds r1, #1
.L0809DFC2:
    lsrs r0, r2, #7
    cmp r0, #0
    beq .L0809DFCE
    adds r0, r1, #1
    lsls r0, r0, #0x18
    lsrs r1, r0, #0x18
.L0809DFCE:
    ldr r2, .L0809E028 @ =0x00000626
    adds r0, r3, r2
    ldrb r2, [r0]
    lsls r0, r2, #0x1f
    cmp r0, #0
    beq .L0809DFE0
    adds r0, r1, #1
    lsls r0, r0, #0x18
    lsrs r1, r0, #0x18
.L0809DFE0:
    lsls r0, r2, #0x1e
    cmp r0, #0
    bge .L0809DFEC
    adds r0, r1, #1
    lsls r0, r0, #0x18
    lsrs r1, r0, #0x18
.L0809DFEC:
    lsls r0, r2, #0x1d
    cmp r0, #0
    bge .L0809DFF8
    adds r0, r1, #1
    lsls r0, r0, #0x18
    lsrs r1, r0, #0x18
.L0809DFF8:
    lsls r0, r2, #0x1c
    cmp r0, #0
    bge .L0809E004
    adds r0, r1, #1
    lsls r0, r0, #0x18
    lsrs r1, r0, #0x18
.L0809E004:
    lsls r0, r2, #0x1b
    cmp r0, #0
    bge .L0809E010
    adds r0, r1, #1
    lsls r0, r0, #0x18
    lsrs r1, r0, #0x18
.L0809E010:
    lsls r0, r2, #0x1a
    cmp r0, #0
    bge .L0809E01C
    adds r0, r1, #1
    lsls r0, r0, #0x18
    lsrs r1, r0, #0x18
.L0809E01C:
    adds r0, r1, #0
    pop {r1}
    bx r1
    .align 2, 0
.L0809E024: .4byte 0x00000625
.L0809E028: .4byte 0x00000626

    thumb_func_start func_0809E02C
func_0809E02C: @ 0x0809E02C
    push {lr}
    adds r3, r0, #0
    ldr r1, .L0809E0A4 @ =0x00000624
    adds r0, r3, r1
    ldrb r2, [r0]
    lsls r0, r2, #0x1e
    lsrs r1, r0, #0x1f
    lsls r0, r2, #0x1d
    cmp r0, #0
    bge .L0809E042
    adds r1, #1
.L0809E042:
    lsls r0, r2, #0x1c
    cmp r0, #0
    bge .L0809E04E
    adds r0, r1, #1
    lsls r0, r0, #0x18
    lsrs r1, r0, #0x18
.L0809E04E:
    lsls r0, r2, #0x1b
    cmp r0, #0
    bge .L0809E05A
    adds r0, r1, #1
    lsls r0, r0, #0x18
    lsrs r1, r0, #0x18
.L0809E05A:
    lsls r0, r2, #0x1a
    cmp r0, #0
    bge .L0809E066
    adds r0, r1, #1
    lsls r0, r0, #0x18
    lsrs r1, r0, #0x18
.L0809E066:
    lsls r0, r2, #0x19
    cmp r0, #0
    bge .L0809E072
    adds r0, r1, #1
    lsls r0, r0, #0x18
    lsrs r1, r0, #0x18
.L0809E072:
    lsrs r0, r2, #7
    cmp r0, #0
    beq .L0809E07E
    adds r0, r1, #1
    lsls r0, r0, #0x18
    lsrs r1, r0, #0x18
.L0809E07E:
    ldr r2, .L0809E0A8 @ =0x00000625
    adds r0, r3, r2
    ldrb r2, [r0]
    lsls r0, r2, #0x1f
    cmp r0, #0
    beq .L0809E090
    adds r0, r1, #1
    lsls r0, r0, #0x18
    lsrs r1, r0, #0x18
.L0809E090:
    lsls r0, r2, #0x1e
    cmp r0, #0
    bge .L0809E09C
    adds r0, r1, #1
    lsls r0, r0, #0x18
    lsrs r1, r0, #0x18
.L0809E09C:
    adds r0, r1, #0
    pop {r1}
    bx r1
    .align 2, 0
.L0809E0A4: .4byte 0x00000624
.L0809E0A8: .4byte 0x00000625

    thumb_func_start func_0809E0AC
func_0809E0AC: @ 0x0809E0AC
    push {lr}
    lsls r3, r2, #3
    subs r3, r3, r2
    lsls r3, r3, #3
    adds r3, #4
    adds r0, r0, r3
    lsls r1, r1, #1
    adds r0, r0, r1
    ldrh r0, [r0]
    lsls r0, r0, #0x1c
    lsrs r0, r0, #0x1c
    cmp r0, #4
    bhi .L0809E110
    lsls r0, r0, #2
    ldr r1, .L0809E0D0 @ =.L0809E0D4
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L0809E0D0: .4byte .L0809E0D4
.L0809E0D4: @ jump table
    .4byte .L0809E0E8 @ case 0
    .4byte .L0809E0F0 @ case 1
    .4byte .L0809E0F8 @ case 2
    .4byte .L0809E100 @ case 3
    .4byte .L0809E108 @ case 4
.L0809E0E8:
    ldr r0, .L0809E0EC @ =gUnk_086DC3C4
    b .L0809E112
    .align 2, 0
.L0809E0EC: .4byte gUnk_086DC3C4
.L0809E0F0:
    ldr r0, .L0809E0F4 @ =gUnk_086DC3D0
    b .L0809E112
    .align 2, 0
.L0809E0F4: .4byte gUnk_086DC3D0
.L0809E0F8:
    ldr r0, .L0809E0FC @ =gUnk_086DC3DC
    b .L0809E112
    .align 2, 0
.L0809E0FC: .4byte gUnk_086DC3DC
.L0809E100:
    ldr r0, .L0809E104 @ =gUnk_086DC3E8
    b .L0809E112
    .align 2, 0
.L0809E104: .4byte gUnk_086DC3E8
.L0809E108:
    ldr r0, .L0809E10C @ =gUnk_086DC3F4
    b .L0809E112
    .align 2, 0
.L0809E10C: .4byte gUnk_086DC3F4
.L0809E110:
    movs r0, #0
.L0809E112:
    pop {r1}
    bx r1
    .align 2, 0
.L0809E118:
    .byte 0xF0, 0xB5, 0x81, 0xB0, 0x05, 0x1C, 0x0F, 0x1C
    .byte 0x00, 0x26, 0x1E, 0xE0, 0x00, 0x24, 0x73, 0x1C, 0x13, 0xE0, 0x62, 0x00, 0xF0, 0x00, 0x80, 0x1B
    .byte 0xC0, 0x00, 0x12, 0x18, 0xAA, 0x18, 0x90, 0x88, 0x80, 0x05, 0x80, 0x0E, 0x38, 0x18, 0x01, 0x78
    .byte 0x01, 0x31, 0x01, 0x70, 0x51, 0x79, 0x89, 0x08, 0x79, 0x18, 0x08, 0x78, 0x01, 0x30, 0x08, 0x70
    .byte 0x01, 0x34, 0x28, 0x1C, 0x00, 0x93, 0xFF, 0xF7, 0xA5, 0xFB, 0x00, 0x9B, 0x84, 0x42, 0xE4, 0xD3
    .byte 0x1E, 0x1C, 0x28, 0x1C, 0xFF, 0xF7, 0xA8, 0xFB, 0x86, 0x42, 0xDB, 0xD3, 0x01, 0xB0, 0xF0, 0xBC
    .byte 0x01, 0xBC, 0x00, 0x47

    thumb_func_start func_0809E174
func_0809E174: @ 0x0809E174
    ldr r1, .L0809E180 @ =0x00000624
    adds r0, r0, r1
    ldrb r0, [r0]
    lsls r0, r0, #0x1f
    lsrs r0, r0, #0x1f
    bx lr
    .align 2, 0
.L0809E180: .4byte 0x00000624

    thumb_func_start func_0809E184
func_0809E184: @ 0x0809E184
    ldr r1, .L0809E190 @ =0x00000625
    adds r0, r0, r1
    ldrb r0, [r0]
    lsls r0, r0, #0x1d
    lsrs r0, r0, #0x1f
    bx lr
    .align 2, 0
.L0809E190: .4byte 0x00000625

    thumb_func_start func_0809E194
func_0809E194: @ 0x0809E194
    ldr r1, .L0809E1A0 @ =0x00000625
    adds r0, r0, r1
    ldrb r0, [r0]
    lsls r0, r0, #0x1c
    lsrs r0, r0, #0x1f
    bx lr
    .align 2, 0
.L0809E1A0: .4byte 0x00000625

    thumb_func_start func_0809E1A4
func_0809E1A4: @ 0x0809E1A4
    ldr r1, .L0809E1B0 @ =0x00000625
    adds r0, r0, r1
    ldrb r0, [r0]
    lsls r0, r0, #0x1b
    lsrs r0, r0, #0x1f
    bx lr
    .align 2, 0
.L0809E1B0: .4byte 0x00000625
.L0809E1B4:
    .byte 0xF0, 0xB5, 0x84, 0xB0, 0x07, 0x1C, 0x0E, 0x1C, 0x1F, 0x48, 0x15, 0x18
    .byte 0x68, 0x46, 0x29, 0x1C, 0x70, 0xF7, 0xAE, 0xFB, 0x68, 0x46, 0x00, 0x88, 0x80, 0x05, 0x1C, 0x49
    .byte 0x88, 0x42, 0x41, 0xDD, 0x02, 0xAC, 0x20, 0x1C, 0x29, 0x1C, 0x70, 0xF7, 0xA3, 0xFB, 0x20, 0x88
    .byte 0x80, 0x05, 0x80, 0x0D, 0x17, 0x49, 0x44, 0x18, 0x38, 0x1C, 0x21, 0x1C, 0xFF, 0xF7, 0xD6, 0xFA
    .byte 0x02, 0x1C, 0x15, 0x49, 0x90, 0x00, 0x80, 0x18, 0x40, 0x00, 0x42, 0x18, 0x13, 0x4D, 0x04, 0x23
    .byte 0x01, 0xCD, 0x30, 0x18, 0x11, 0x78, 0x01, 0x70, 0x01, 0x32, 0x01, 0x3B, 0x00, 0x2B, 0xF7, 0xDA
    .byte 0x38, 0x1C, 0x21, 0x1C, 0xFF, 0xF7, 0xE0, 0xFA, 0x02, 0x1C, 0x0D, 0x49, 0xD0, 0x00, 0x80, 0x1A
    .byte 0x40, 0x00, 0x42, 0x18, 0x0B, 0x4C, 0x09, 0x23, 0x01, 0xCC, 0x30, 0x18, 0x11, 0x78, 0x01, 0x70
    .byte 0x01, 0x32, 0x01, 0x3B, 0x00, 0x2B, 0xF7, 0xDA, 0x3F, 0xE0, 0x00, 0x00, 0xD8, 0x1B, 0x00, 0x00
    .byte 0x00, 0x00, 0xC0, 0x4C, 0xCC, 0xFE, 0xFF, 0xFF, 0x38, 0x3B, 0x10, 0x08, 0x10, 0x3B, 0x10, 0x08
    .byte 0x74, 0x3C, 0x10, 0x08, 0x3C, 0x3C, 0x10, 0x08, 0x02, 0xAC, 0x20, 0x1C, 0x29, 0x1C, 0x70, 0xF7
    .byte 0x61, 0xFB, 0x20, 0x88, 0x80, 0x05, 0x80, 0x0D, 0x04, 0x1C, 0x34, 0x3C, 0x38, 0x1C, 0x21, 0x1C
    .byte 0xFF, 0xF7, 0xD2, 0xF8, 0x02, 0x1C, 0x13, 0x49, 0x90, 0x00, 0x80, 0x18, 0x42, 0x18, 0x12, 0x4D
    .byte 0x09, 0x23, 0x01, 0xCD, 0x30, 0x18, 0x11, 0x78, 0x01, 0x70, 0x01, 0x32, 0x01, 0x3B, 0x00, 0x2B
    .byte 0xF7, 0xDA, 0x38, 0x1C, 0x21, 0x1C, 0xFF, 0xF7, 0xEB, 0xF8, 0x02, 0x1C, 0x0B, 0x49, 0x90, 0x00
    .byte 0x80, 0x18, 0x40, 0x00, 0x42, 0x18, 0x0A, 0x4C, 0x0D, 0x23, 0x01, 0xCC, 0x30, 0x18, 0x11, 0x78
    .byte 0x01, 0x70, 0x01, 0x32, 0x01, 0x3B, 0x00, 0x2B, 0xF7, 0xDA, 0x04, 0xB0, 0xF0, 0xBC, 0x01, 0xBC
    .byte 0x00, 0x47, 0x00, 0x00, 0x98, 0x3F, 0x10, 0x08, 0x84, 0x3F, 0x10, 0x08, 0x0C, 0x40, 0x10, 0x08
    .byte 0xE4, 0x3F, 0x10, 0x08
