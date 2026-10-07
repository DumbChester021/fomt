    .INCLUDE "asm/macro.inc"
    .SYNTAX UNIFIED

    thumb_func_start func_08035380
func_08035380: @ 0x08035380
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #0xbc
    adds r6, r0, #0
    ldr r5, [r6]
    ldr r1, [r6, #0x38]
    cmp r1, #0
    bne .L08035398
    b .L080358F8
.L08035398:
    adds r0, #0x3c
    ldrb r0, [r0]
    ldr r1, [r1, #8]
    lsls r0, r0, #2
    adds r0, r0, r1
    ldr r0, [r0]
    str r0, [sp, #0x70]
    cmp r0, #0
    bne .L080353AC
    b .L080358F8
.L080353AC:
    adds r0, r6, #0
    adds r0, #0x3d
    ldrb r1, [r0]
    str r0, [sp, #0xb0]
    ldr r0, [sp, #0x70]
    ldrh r0, [r0]
    cmp r1, r0
    blo .L080353BE
    b .L080358F8
.L080353BE:
    lsls r1, r1, #3
    ldr r2, [sp, #0x70]
    ldr r0, [r2, #4]
    adds r7, r0, r1
    ldr r3, [r7, #4]
    str r3, [sp, #0x74]
    cmp r3, #0
    bne .L080353D0
    b .L080358F8
.L080353D0:
    ldr r0, [r5]
    movs r4, #0xa2
    lsls r4, r4, #1
    adds r0, r0, r4
    ldr r1, [r0]
    adds r0, r5, #0
    bl _call_via_r1
    ldrh r3, [r0, #0xa]
    lsls r0, r3, #0x1b
    lsrs r0, r0, #0x1b
    subs r2, r0, #6
    cmp r2, #0
    bge .L080353EE
    adds r2, #0x18
.L080353EE:
    lsls r1, r2, #4
    subs r1, r1, r2
    lsls r1, r1, #2
    lsls r0, r3, #0x15
    lsrs r0, r0, #0x1a
    adds r1, r1, r0
    movs r0, #0
    str r0, [sp, #0x78]
    ldr r2, [sp, #0x74]
    ldr r3, [r2]
    cmp r3, #0
    bne .L08035408
    b .L080358C0
.L08035408:
    ldrh r4, [r2, #4]
    cmp r4, #0
    bne .L08035410
    b .L080358C0
.L08035410:
    adds r0, r6, #0
    adds r0, #0x3e
    ldrb r2, [r0]
    str r0, [sp, #0xb4]
    cmp r2, r4
    blo .L0803541E
    b .L080358F8
.L0803541E:
    ldr r4, [sp, #0x74]
    ldrb r0, [r4, #0xb]
    lsls r0, r0, #0x1b
    cmp r0, #0
    bge .L0803542A
    b .L08035638
.L0803542A:
    lsls r0, r2, #3
    adds r3, r3, r0
    str r3, [sp, #0x7c]
    movs r1, #0
    ldrb r0, [r3, #4]
    lsls r0, r0, #0x1f
    cmp r0, #0
    bne .L0803543C
    movs r1, #1
.L0803543C:
    mov r8, r1
    ldr r0, [r6, #8]
    str r0, [sp]
    ldr r0, [r6, #0xc]
    str r0, [sp, #8]
    ldr r0, [r6, #0x18]
    str r0, [sp, #4]
    ldr r0, [r6, #0x1c]
    str r0, [sp, #0xc]
    cmp r1, #0
    beq .L0803545C
    mov sl, sp
    mov r7, sp
    adds r7, #4
    str r7, [sp, #0x80]
    b .L08035466
.L0803545C:
    add r0, sp, #8
    mov sl, r0
    mov r1, sp
    adds r1, #0xc
    str r1, [sp, #0x80]
.L08035466:
    mov r2, sl
    ldr r1, [r2]
    asrs r3, r1, #0x10
    str r3, [sp, #0x84]
    ldr r4, [sp, #0x80]
    ldr r0, [r4]
    adds r1, r1, r0
    str r1, [sp, #0x88]
    asrs r7, r1, #0x10
    str r7, [sp, #0x8c]
    subs r7, r7, r3
    movs r3, #0
    adds r0, r6, #0
    adds r0, #0x40
    ldrh r2, [r0]
    ldr r1, .L080354AC @ =0x000002EE
    str r0, [sp, #0xb8]
    cmp r2, r1
    blt .L0803548E
    movs r3, #1
.L0803548E:
    movs r0, #1
    str r0, [sp, #0x90]
    adds r0, r6, #0
    adds r0, #0x3f
    ldrb r2, [r0]
    adds r1, r0, #0
    cmp r2, #0
    beq .L080354BE
    movs r4, #0
    str r4, [sp, #0x90]
    cmp r3, #0
    beq .L080354B0
    strb r4, [r1]
    b .L080354B4
    .align 2, 0
.L080354AC: .4byte 0x000002EE
.L080354B0:
    subs r0, r2, #1
    strb r0, [r1]
.L080354B4:
    ldrb r0, [r1]
    cmp r0, #0
    bne .L080354BE
    movs r1, #1
    str r1, [sp, #0x78]
.L080354BE:
    cmp r3, #0
    bne .L080355A0
    cmp r7, #0
    beq .L080355A0
    ldr r0, [r5]
    ldr r2, [r0, #0x40]
    adds r0, r5, #0
    movs r1, #0
    bl _call_via_r2
    adds r4, r0, #0
    cmp r4, #0
    beq .L080355A0
    ldrh r0, [r4, #4]
    ldrh r2, [r6, #4]
    cmp r0, r2
    bne .L080355A0
    ldr r1, [r6, #0x14]
    add r0, sp, #0x10
    ldr r2, [r1, #0xc]
    adds r1, r6, #0
    bl _call_via_r2
    ldr r0, [sp, #0x10]
    ldr r1, [sp, #0x14]
    str r0, [sp, #0x18]
    str r1, [sp, #0x1c]
    add r5, sp, #0x18
    ldr r1, [r4, #0x14]
    add r0, sp, #0x20
    ldr r2, [r1, #0xc]
    adds r1, r4, #0
    bl _call_via_r2
    ldr r0, [sp, #0x20]
    ldr r1, [sp, #0x24]
    str r0, [sp, #0x28]
    str r1, [sp, #0x2c]
    add r4, sp, #0x28
    mov r3, r8
    cmp r3, #0
    beq .L08035518
    adds r2, r7, #0
    movs r7, #0
    b .L0803551A
.L08035518:
    movs r2, #0
.L0803551A:
    mov sb, r7
    movs r1, #0
    ldrsh r0, [r5, r1]
    mov ip, r0
    movs r3, #4
    ldrsh r1, [r4, r3]
    subs r1, r0, r1
    movs r7, #0
    ldrsh r0, [r4, r7]
    movs r7, #4
    ldrsh r3, [r5, r7]
    mov r8, r3
    subs r0, r0, r3
    ands r1, r0
    movs r0, #2
    ldrsh r7, [r5, r0]
    movs r3, #6
    ldrsh r0, [r4, r3]
    subs r0, r7, r0
    ands r1, r0
    movs r3, #2
    ldrsh r0, [r4, r3]
    movs r3, #6
    ldrsh r5, [r5, r3]
    subs r0, r0, r5
    ands r1, r0
    cmp r1, #0
    blt .L080355A0
    add r3, sp, #0x30
    mov r1, ip
    adds r0, r2, r1
    strh r0, [r3]
    mov r1, sb
    adds r0, r1, r7
    strh r0, [r3, #2]
    mov r7, r8
    adds r0, r2, r7
    strh r0, [r3, #4]
    adds r0, r1, r5
    strh r0, [r3, #6]
    movs r0, #0
    ldrsh r1, [r3, r0]
    movs r2, #4
    ldrsh r0, [r4, r2]
    subs r1, r1, r0
    movs r5, #0
    ldrsh r0, [r4, r5]
    movs r7, #4
    ldrsh r2, [r3, r7]
    subs r0, r0, r2
    ands r1, r0
    movs r2, #2
    ldrsh r0, [r3, r2]
    movs r5, #6
    ldrsh r2, [r4, r5]
    subs r0, r0, r2
    ands r1, r0
    movs r7, #2
    ldrsh r0, [r4, r7]
    movs r4, #6
    ldrsh r2, [r3, r4]
    subs r0, r0, r2
    ands r1, r0
    cmp r1, #0
    bge .L080355A0
    movs r5, #0
    str r5, [sp, #0x90]
.L080355A0:
    ldr r7, [sp, #0x90]
    cmp r7, #0
    beq .L0803562E
    ldr r1, [sp, #0x7c]
    movs r2, #2
    ldrsh r0, [r1, r2]
    ldr r3, [sp, #0x84]
    cmp r3, r0
    beq .L080355D0
    ldr r4, [sp, #0x8c]
    cmp r4, r0
    beq .L080355D0
    movs r1, #0
    cmp r0, r3
    bge .L080355C0
    movs r1, #1
.L080355C0:
    ldr r5, [sp, #0x8c]
    cmp r0, r5
    bge .L080355CC
    cmp r1, #0
    beq .L080355D0
    b .L08035616
.L080355CC:
    cmp r1, #0
    beq .L08035616
.L080355D0:
    lsls r0, r0, #0x10
    mov r7, sl
    str r0, [r7]
    movs r1, #0
    ldr r0, [sp, #0x80]
    str r1, [r0]
    ldr r2, [sp, #0xb4]
    ldrb r0, [r2]
    adds r0, #1
    strb r0, [r2]
    lsls r0, r0, #0x18
    lsrs r0, r0, #0x18
    ldr r3, [sp, #0x74]
    ldrh r3, [r3, #4]
    cmp r0, r3
    bhs .L080355F6
    movs r4, #1
    str r4, [sp, #0x78]
    b .L0803561C
.L080355F6:
    ldr r5, [sp, #0xb0]
    ldrb r0, [r5]
    adds r0, #1
    ldr r7, [sp, #0x70]
    ldrh r7, [r7]
    cmp r0, r7
    blt .L08035606
    b .L080358F8
.L08035606:
    ldr r0, [sp, #0xb4]
    strb r1, [r0]
    ldrb r0, [r5]
    adds r0, #1
    strb r0, [r5]
    movs r1, #2
    str r1, [sp, #0x78]
    b .L0803561C
.L08035616:
    ldr r2, [sp, #0x88]
    mov r3, sl
    str r2, [r3]
.L0803561C:
    ldr r0, [sp]
    str r0, [r6, #8]
    ldr r0, [sp, #8]
    str r0, [r6, #0xc]
    ldr r0, [sp, #4]
    str r0, [r6, #0x18]
    ldr r0, [sp, #0xc]
    str r0, [r6, #0x1c]
    b .L080358E6
.L0803562E:
    ldr r4, [sp, #0xb8]
    ldrh r0, [r4]
    adds r0, #1
    strh r0, [r4]
    b .L080358E6
.L08035638:
    lsls r0, r2, #3
    adds r3, r3, r0
    str r3, [sp, #0x94]
    movs r2, #0
    ldrb r0, [r3, #6]
    lsls r0, r0, #0x1d
    cmp r0, #0
    blt .L0803564A
    movs r2, #1
.L0803564A:
    mov r8, r2
    movs r2, #0
    ldr r3, [sp, #0xb0]
    ldrb r0, [r3]
    adds r0, #1
    ldr r4, [sp, #0x70]
    ldrh r4, [r4]
    cmp r0, r4
    bge .L08035664
    ldrh r7, [r7, #8]
    cmp r1, r7
    blo .L08035664
    movs r2, #1
.L08035664:
    mov sl, r2
    cmp r2, #0
    beq .L08035682
    ldrh r4, [r6, #4]
    ldr r0, [r5]
    ldr r1, [r0, #0x14]
    adds r0, r5, #0
    bl _call_via_r1
    cmp r4, r0
    beq .L08035682
    movs r0, #0
    ldr r5, [sp, #0xb4]
    strb r0, [r5]
    b .L080358AC
.L08035682:
    adds r1, r6, #0
    adds r1, #0x40
    ldrh r0, [r1]
    str r1, [sp, #0xb8]
    cmp r0, #0
    beq .L08035690
    b .L08035874
.L08035690:
    ldr r0, [r6, #8]
    str r0, [sp, #0x38]
    ldr r0, [r6, #0xc]
    str r0, [sp, #0x40]
    ldr r0, [r6, #0x18]
    str r0, [sp, #0x3c]
    ldr r0, [r6, #0x1c]
    str r0, [sp, #0x44]
    mov r1, r8
    cmp r1, #0
    beq .L080356B4
    mov r2, sp
    adds r2, #0x38
    str r2, [sp, #0x98]
    mov r3, sp
    adds r3, #0x3c
    str r3, [sp, #0x9c]
    b .L080356C0
.L080356B4:
    mov r4, sp
    adds r4, #0x40
    str r4, [sp, #0x98]
    mov r7, sp
    adds r7, #0x44
    str r7, [sp, #0x9c]
.L080356C0:
    ldr r1, [sp, #0x98]
    ldr r0, [r1]
    asrs r2, r0, #0x10
    str r2, [sp, #0xa0]
    ldr r3, [sp, #0x9c]
    ldr r1, [r3]
    adds r0, r0, r1
    str r0, [sp, #0xa4]
    asrs r4, r0, #0x10
    str r4, [sp, #0xa8]
    subs r7, r4, r2
    movs r0, #1
    str r0, [sp, #0xac]
    adds r0, r6, #0
    adds r0, #0x3f
    ldrb r2, [r0]
    adds r1, r0, #0
    cmp r2, #0
    beq .L08035702
    movs r3, #0
    str r3, [sp, #0xac]
    mov r4, sl
    cmp r4, #0
    beq .L080356F4
    strb r3, [r1]
    b .L080356F8
.L080356F4:
    subs r0, r2, #1
    strb r0, [r1]
.L080356F8:
    ldrb r0, [r1]
    cmp r0, #0
    bne .L08035702
    movs r1, #1
    str r1, [sp, #0x78]
.L08035702:
    mov r2, sl
    cmp r2, #0
    bne .L080357E8
    cmp r7, #0
    beq .L080357E8
    ldr r0, [r5]
    ldr r2, [r0, #0x40]
    adds r0, r5, #0
    movs r1, #0
    bl _call_via_r2
    adds r4, r0, #0
    cmp r4, #0
    beq .L080357E8
    ldrh r0, [r4, #4]
    ldrh r3, [r6, #4]
    cmp r0, r3
    bne .L080357E8
    ldr r1, [r6, #0x14]
    add r0, sp, #0x48
    ldr r2, [r1, #0xc]
    adds r1, r6, #0
    bl _call_via_r2
    ldr r0, [sp, #0x48]
    ldr r1, [sp, #0x4c]
    str r0, [sp, #0x50]
    str r1, [sp, #0x54]
    add r5, sp, #0x50
    ldr r1, [r4, #0x14]
    add r0, sp, #0x58
    ldr r2, [r1, #0xc]
    adds r1, r4, #0
    bl _call_via_r2
    ldr r0, [sp, #0x58]
    ldr r1, [sp, #0x5c]
    str r0, [sp, #0x60]
    str r1, [sp, #0x64]
    add r4, sp, #0x60
    mov r0, r8
    cmp r0, #0
    beq .L08035760
    adds r2, r7, #0
    movs r1, #0
    mov sb, r1
    b .L08035764
.L08035760:
    movs r2, #0
    mov sb, r7
.L08035764:
    movs r7, #0
    ldrsh r3, [r5, r7]
    mov r8, r3
    movs r0, #4
    ldrsh r1, [r4, r0]
    subs r1, r3, r1
    movs r3, #0
    ldrsh r0, [r4, r3]
    movs r3, #4
    ldrsh r7, [r5, r3]
    mov ip, r7
    subs r0, r0, r7
    ands r1, r0
    movs r0, #2
    ldrsh r7, [r5, r0]
    movs r3, #6
    ldrsh r0, [r4, r3]
    subs r0, r7, r0
    ands r1, r0
    movs r3, #2
    ldrsh r0, [r4, r3]
    movs r3, #6
    ldrsh r5, [r5, r3]
    subs r0, r0, r5
    ands r1, r0
    cmp r1, #0
    blt .L080357E8
    add r3, sp, #0x68
    mov r1, r8
    adds r0, r2, r1
    strh r0, [r3]
    mov r1, sb
    adds r0, r1, r7
    strh r0, [r3, #2]
    mov r7, ip
    adds r0, r2, r7
    strh r0, [r3, #4]
    adds r0, r1, r5
    strh r0, [r3, #6]
    movs r0, #0
    ldrsh r1, [r3, r0]
    movs r2, #4
    ldrsh r0, [r4, r2]
    subs r1, r1, r0
    movs r5, #0
    ldrsh r0, [r4, r5]
    movs r7, #4
    ldrsh r2, [r3, r7]
    subs r0, r0, r2
    ands r1, r0
    movs r2, #2
    ldrsh r0, [r3, r2]
    movs r5, #6
    ldrsh r2, [r4, r5]
    subs r0, r0, r2
    ands r1, r0
    movs r7, #2
    ldrsh r0, [r4, r7]
    movs r4, #6
    ldrsh r2, [r3, r4]
    subs r0, r0, r2
    ands r1, r0
    cmp r1, #0
    bge .L080357E8
    movs r5, #0
    str r5, [sp, #0xac]
.L080357E8:
    ldr r7, [sp, #0xac]
    cmp r7, #0
    beq .L080358E6
    ldr r0, [sp, #0x94]
    movs r1, #0
    ldrsh r2, [r0, r1]
    ldr r3, [sp, #0xa8]
    cmp r3, r2
    beq .L08035806
    ldr r4, [sp, #0xa0]
    subs r0, r2, r4
    subs r1, r2, r3
    eors r0, r1
    cmp r0, #0
    bge .L0803585C
.L08035806:
    lsls r0, r2, #0x10
    ldr r5, [sp, #0x98]
    str r0, [r5]
    movs r1, #0
    ldr r7, [sp, #0x9c]
    str r1, [r7]
    mov r0, sl
    cmp r0, #0
    bne .L08035820
    ldr r2, [sp, #0x94]
    ldrh r0, [r2, #4]
    cmp r0, #0
    bne .L08035850
.L08035820:
    ldr r3, [sp, #0xb4]
    ldrb r0, [r3]
    adds r0, #1
    strb r0, [r3]
    lsls r0, r0, #0x18
    lsrs r0, r0, #0x18
    ldr r4, [sp, #0x74]
    ldrh r4, [r4, #4]
    cmp r0, r4
    blo .L0803584A
    strb r1, [r3]
    mov r5, sl
    cmp r5, #0
    beq .L08035844
    ldr r7, [sp, #0xb0]
    ldrb r0, [r7]
    adds r0, #1
    strb r0, [r7]
.L08035844:
    movs r0, #2
    str r0, [sp, #0x78]
    b .L08035862
.L0803584A:
    movs r1, #1
    str r1, [sp, #0x78]
    b .L08035862
.L08035850:
    movs r0, #1
    ldr r2, [sp, #0xb8]
    strh r0, [r2]
    movs r3, #1
    str r3, [sp, #0x78]
    b .L08035862
.L0803585C:
    ldr r4, [sp, #0xa4]
    ldr r5, [sp, #0x98]
    str r4, [r5]
.L08035862:
    ldr r0, [sp, #0x38]
    str r0, [r6, #8]
    ldr r0, [sp, #0x40]
    str r0, [r6, #0xc]
    ldr r0, [sp, #0x3c]
    str r0, [r6, #0x18]
    ldr r0, [sp, #0x44]
    str r0, [r6, #0x1c]
    b .L080358E6
.L08035874:
    mov r7, sl
    cmp r7, #0
    bne .L0803588A
    adds r0, #1
    strh r0, [r1]
    lsls r0, r0, #0x10
    lsrs r0, r0, #0x10
    ldr r2, [sp, #0x94]
    ldrh r2, [r2, #4]
    cmp r0, r2
    bls .L080358E6
.L0803588A:
    movs r0, #0
    strh r0, [r1]
    ldr r3, [sp, #0xb4]
    ldrb r0, [r3]
    adds r0, #1
    strb r0, [r3]
    lsls r0, r0, #0x18
    lsrs r0, r0, #0x18
    ldr r4, [sp, #0x74]
    ldrh r4, [r4, #4]
    cmp r0, r4
    blo .L080358BA
    movs r0, #0
    strb r0, [r3]
    mov r5, sl
    cmp r5, #0
    beq .L080358B4
.L080358AC:
    ldr r7, [sp, #0xb0]
    ldrb r0, [r7]
    adds r0, #1
    strb r0, [r7]
.L080358B4:
    movs r0, #2
    str r0, [sp, #0x78]
    b .L080358EC
.L080358BA:
    movs r1, #1
    str r1, [sp, #0x78]
    b .L080358EC
.L080358C0:
    ldr r2, [sp, #0xb0]
    ldrb r0, [r2]
    adds r0, #1
    ldr r3, [sp, #0x70]
    ldrh r3, [r3]
    cmp r0, r3
    bge .L080358E6
    ldrh r7, [r7, #8]
    cmp r1, r7
    blo .L080358E6
    adds r1, r6, #0
    adds r1, #0x3e
    movs r0, #0
    strb r0, [r1]
    ldrb r0, [r2]
    adds r0, #1
    strb r0, [r2]
    movs r4, #2
    str r4, [sp, #0x78]
.L080358E6:
    ldr r5, [sp, #0x78]
    cmp r5, #0
    ble .L080358F8
.L080358EC:
    ldr r0, [r6, #0x14]
    ldr r2, [r0, #0x3c]
    adds r0, r6, #0
    ldr r1, [sp, #0x78]
    bl _call_via_r2
.L080358F8:
    add sp, #0xbc
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0

    thumb_func_start func_08035908
func_08035908: @ 0x08035908
    push {r4, r5, r6, lr}
    adds r4, r0, #0
    adds r5, r1, #0
    adds r0, #0x44
    ldrh r6, [r0]
    cmp r5, r6
    beq .L0803593A
    strh r5, [r0]
    ldr r0, [r4, #0x14]
    ldr r1, [r0, #0x28]
    adds r0, r4, #0
    bl _call_via_r1
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0803593A
    ldrh r0, [r4, #0x22]
    cmp r0, r6
    bne .L0803593A
    cmp r0, r5
    beq .L0803593A
    adds r0, r4, #0
    adds r1, r5, #0
    bl SetAnim__12AActorEntityUi
.L0803593A:
    pop {r4, r5, r6}
    pop {r0}
    bx r0

    thumb_func_start func_08035940
func_08035940: @ 0x08035940
    push {r4, r5, r6, lr}
    adds r4, r0, #0
    adds r5, r1, #0
    adds r0, #0x46
    ldrh r6, [r0]
    cmp r5, r6
    beq .L08035972
    strh r5, [r0]
    ldr r0, [r4, #0x14]
    ldr r1, [r0, #0x28]
    adds r0, r4, #0
    bl _call_via_r1
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08035972
    ldrh r0, [r4, #0x22]
    cmp r0, r6
    bne .L08035972
    cmp r0, r5
    beq .L08035972
    adds r0, r4, #0
    adds r1, r5, #0
    bl SetAnim__12AActorEntityUi
.L08035972:
    pop {r4, r5, r6}
    pop {r0}
    bx r0

    thumb_func_start func_08035978
func_08035978: @ 0x08035978
    push {r4, r5, r6, r7, lr}
    mov r7, r8
    push {r7}
    adds r4, r0, #0
    ldr r0, [r4, #0x14]
    ldr r1, [r0, #0x28]
    adds r0, r4, #0
    bl _call_via_r1
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08035A3A
    ldr r1, [r4, #0x38]
    cmp r1, #0
    beq .L08035A3A
    adds r0, r4, #0
    adds r0, #0x3c
    ldrb r0, [r0]
    ldr r1, [r1, #8]
    lsls r0, r0, #2
    adds r0, r0, r1
    ldr r6, [r0]
    cmp r6, #0
    beq .L08035A3A
    adds r0, r4, #0
    adds r0, #0x3d
    ldrb r1, [r0]
    mov r8, r0
    ldrh r0, [r6]
    cmp r1, r0
    bhs .L08035A3A
    lsls r1, r1, #3
    ldr r0, [r6, #4]
    adds r7, r0, r1
    ldr r5, [r7, #4]
    cmp r5, #0
    beq .L08035A3A
    ldr r0, [r4]
    ldr r1, [r0]
    movs r2, #0xa2
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldrh r1, [r0, #0xa]
    lsls r0, r1, #0x1b
    lsrs r0, r0, #0x1b
    subs r2, r0, #6
    cmp r2, #0
    bge .L080359E0
    adds r2, #0x18
.L080359E0:
    lsls r0, r2, #4
    subs r0, r0, r2
    lsls r0, r0, #2
    lsls r1, r1, #0x15
    lsrs r1, r1, #0x1a
    adds r1, r0, r1
    ldr r0, [r5]
    cmp r0, #0
    beq .L08035A20
    ldrh r2, [r5, #4]
    cmp r2, #0
    beq .L08035A20
    adds r0, r4, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, r2
    bhs .L08035A3A
    ldrb r0, [r5, #0xb]
    lsls r0, r0, #0x1b
    cmp r0, #0
    blt .L08035A20
    movs r2, #0
    adds r0, r4, #0
    adds r0, #0x40
    ldrh r1, [r0]
    ldr r0, .L08035A1C @ =0x000002EE
    cmp r1, r0
    blt .L08035A36
    b .L08035A34
    .align 2, 0
.L08035A1C: .4byte 0x000002EE
.L08035A20:
    movs r2, #0
    mov r3, r8
    ldrb r0, [r3]
    adds r0, #1
    ldrh r6, [r6]
    cmp r0, r6
    bge .L08035A36
    ldrh r7, [r7, #8]
    cmp r1, r7
    blo .L08035A36
.L08035A34:
    movs r2, #1
.L08035A36:
    adds r0, r2, #0
    b .L08035A3C
.L08035A3A:
    movs r0, #0
.L08035A3C:
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_08035A48
func_08035A48: @ 0x08035A48
    push {r4, r5, lr}
    adds r4, r0, #0
    adds r3, r1, #0
    ldrh r1, [r4, #4]
    ldrh r0, [r3]
    lsls r0, r0, #0x16
    lsrs r0, r0, #0x16
    cmp r1, r0
    bne .L08035AD6
    movs r0, #0xa
    ldrsh r2, [r4, r0]
    ldrb r1, [r3, #1]
    lsrs r1, r1, #2
    ldrh r0, [r3, #2]
    ldr r5, .L08035ADC @ =0x000003FF
    ands r0, r5
    lsls r0, r0, #6
    orrs r0, r1
    lsls r0, r0, #0x10
    asrs r0, r0, #0x10
    subs r0, r0, r2
    cmp r0, #0
    bge .L08035A78
    rsbs r0, r0, #0
.L08035A78:
    cmp r0, #0x97
    bgt .L08035AD6
    movs r0, #0xe
    ldrsh r2, [r4, r0]
    ldrb r1, [r3, #3]
    lsrs r1, r1, #2
    ldrh r0, [r3, #4]
    ands r0, r5
    lsls r0, r0, #6
    orrs r0, r1
    lsls r0, r0, #0x10
    asrs r0, r0, #0x10
    subs r0, r0, r2
    cmp r0, #0
    bge .L08035A98
    rsbs r0, r0, #0
.L08035A98:
    cmp r0, #0x6f
    bgt .L08035AD6
    adds r0, r4, #0
    bl func_08035978
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08035AD6
    ldr r0, [r4, #0x14]
    ldr r1, [r0, #0x28]
    adds r0, r4, #0
    bl _call_via_r1
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08035AD6
    adds r0, r4, #0
    movs r1, #2
    movs r2, #0
    bl func_08032384
    adds r1, r4, #0
    adds r1, #0x3f
    movs r0, #0x78
    strb r0, [r1]
    ldr r0, [r4, #0x14]
    ldr r2, [r0, #0x3c]
    adds r0, r4, #0
    movs r1, #1
    bl _call_via_r2
.L08035AD6:
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L08035ADC: .4byte 0x000003FF

    thumb_func_start func_08035AE0
func_08035AE0: @ 0x08035AE0
    push {lr}
    adds r1, r0, #0
    movs r2, #0
    ldrh r0, [r1, #4]
    cmp r0, #0x1d
    bne .L08035AF6
    movs r3, #0xe
    ldrsh r0, [r1, r3]
    cmp r0, #0x37
    bgt .L08035AF6
    movs r2, #1
.L08035AF6:
    adds r0, r2, #0
    pop {r1}
    bx r1


    .section .text.after_npc_resident_run1, "ax", %progbits

    thumb_func_start func_08035C04
func_08035C04: @ 0x08035C04
    push {r4, r5, r6, r7, lr}
    mov r7, r8
    push {r7}
    adds r4, r0, #0
    ldr r7, .L08035C48 @ =0x0000022F
    ldr r0, .L08035C4C @ =0x00000233
    mov r8, r0
    ldr r5, [r4, #0x34]
    ldr r1, .L08035C50 @ =0x00001CD4
    adds r6, r5, r1
    adds r0, r6, #0
    bl func_080A0490
    cmp r0, #3
    bne .L08035C94
    ldrh r0, [r4, #4]
    cmp r0, #0x1d
    bne .L08035C94
    adds r0, r4, #0
    bl func_08035AE0
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08035C42
    ldr r2, .L08035C54 @ =0x0000216B
    adds r0, r5, r2
    ldrb r0, [r0]
    lsls r0, r0, #0x19
    lsrs r0, r0, #0x1e
    cmp r0, #1
    bne .L08035C5C
.L08035C42:
    ldr r7, .L08035C58 @ =0x0000023F
    b .L08035C94
    .align 2, 0
.L08035C48: .4byte 0x0000022F
.L08035C4C: .4byte 0x00000233
.L08035C50: .4byte 0x00001CD4
.L08035C54: .4byte 0x0000216B
.L08035C58: .4byte 0x0000023F
.L08035C5C:
    adds r0, r6, #0
    bl func_080A0384
    cmp r0, #0
    beq .L08035C94
    bl func_0809EAD8
    cmp r0, #0x3b
    bhi .L08035C94
    ldr r0, [r4]
    ldr r1, [r0]
    movs r2, #0xa2
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    adds r1, r0, #0
    adds r1, #0xa
    adds r0, r5, #0
    bl func_08034C64
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08035C94
    ldr r7, .L08035CB0 @ =0x00000247
    ldr r0, .L08035CB4 @ =0x0000024B
    mov r8, r0
.L08035C94:
    adds r0, r4, #0
    adds r1, r7, #0
    bl func_08035908
    adds r0, r4, #0
    mov r1, r8
    bl func_08035940
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08035CB0: .4byte 0x00000247
.L08035CB4: .4byte 0x0000024B

    thumb_func_start func_08035CB8
func_08035CB8: @ 0x08035CB8
    push {r4, r5, lr}
    adds r5, r0, #0
    adds r4, r1, #0
    bl func_08034F00
    cmp r4, #1
    ble .L08035CCC
    adds r0, r5, #0
    bl func_08035C04
.L08035CCC:
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0

    .section .text.after_npc_resident_run2, "ax", %progbits

    thumb_func_start func_08036084
func_08036084: @ 0x08036084
    push {r4, r5, r6, r7, lr}
    mov r7, r8
    push {r7}
    adds r4, r0, #0
    ldr r7, .L080360C8 @ =0x00000813
    ldr r0, .L080360CC @ =0x00000817
    mov r8, r0
    ldr r5, [r4, #0x34]
    ldr r1, .L080360D0 @ =0x00001CD4
    adds r6, r5, r1
    adds r0, r6, #0
    bl func_080A0490
    cmp r0, #0xc
    bne .L08036114
    ldrh r0, [r4, #4]
    cmp r0, #0x1d
    bne .L08036114
    adds r0, r4, #0
    bl func_08035AE0
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L080360C2
    ldr r2, .L080360D4 @ =0x0000216C
    adds r0, r5, r2
    ldrb r0, [r0]
    lsls r0, r0, #0x19
    lsrs r0, r0, #0x1e
    cmp r0, #1
    bne .L080360DC
.L080360C2:
    ldr r7, .L080360D8 @ =0x00000827
    b .L08036114
    .align 2, 0
.L080360C8: .4byte 0x00000813
.L080360CC: .4byte 0x00000817
.L080360D0: .4byte 0x00001CD4
.L080360D4: .4byte 0x0000216C
.L080360D8: .4byte 0x00000827
.L080360DC:
    adds r0, r6, #0
    bl func_080A0384
    cmp r0, #0
    beq .L08036114
    bl func_0809EAD8
    cmp r0, #0x3b
    bhi .L08036114
    ldr r0, [r4]
    ldr r1, [r0]
    movs r2, #0xa2
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    adds r1, r0, #0
    adds r1, #0xa
    adds r0, r5, #0
    bl func_08034C64
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08036114
    ldr r7, .L08036130 @ =0x0000082F
    ldr r0, .L08036134 @ =0x00000833
    mov r8, r0
.L08036114:
    adds r0, r4, #0
    adds r1, r7, #0
    bl func_08035908
    adds r0, r4, #0
    mov r1, r8
    bl func_08035940
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08036130: .4byte 0x0000082F
.L08036134: .4byte 0x00000833

    thumb_func_start func_08036138
func_08036138: @ 0x08036138
    push {r4, r5, lr}
    adds r5, r0, #0
    adds r4, r1, #0
    bl func_08034F00
    cmp r4, #1
    ble .L0803614C
    adds r0, r5, #0
    bl func_08036084
.L0803614C:
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0

    .section .text.after_npc_resident_run3, "ax", %progbits

    thumb_func_start func_08036430
func_08036430: @ 0x08036430
    push {r4, r5, r6, r7, lr}
    mov r7, r8
    push {r7}
    adds r4, r0, #0
    ldr r7, .L08036474 @ =0x00000691
    ldr r0, .L08036478 @ =0x00000695
    mov r8, r0
    ldr r5, [r4, #0x34]
    ldr r1, .L0803647C @ =0x00001CD4
    adds r6, r5, r1
    adds r0, r6, #0
    bl func_080A0490
    cmp r0, #0x13
    bne .L080364C0
    ldrh r0, [r4, #4]
    cmp r0, #0x1d
    bne .L080364C0
    adds r0, r4, #0
    bl func_08035AE0
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0803646E
    ldr r2, .L08036480 @ =0x0000216C
    adds r0, r5, r2
    ldrb r0, [r0]
    lsls r0, r0, #0x1b
    lsrs r0, r0, #0x1e
    cmp r0, #1
    bne .L08036488
.L0803646E:
    ldr r7, .L08036484 @ =0x000006A1
    b .L080364C0
    .align 2, 0
.L08036474: .4byte 0x00000691
.L08036478: .4byte 0x00000695
.L0803647C: .4byte 0x00001CD4
.L08036480: .4byte 0x0000216C
.L08036484: .4byte 0x000006A1
.L08036488:
    adds r0, r6, #0
    bl func_080A0384
    cmp r0, #0
    beq .L080364C0
    bl func_0809EAD8
    cmp r0, #0x3b
    bhi .L080364C0
    ldr r0, [r4]
    ldr r1, [r0]
    movs r2, #0xa2
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    adds r1, r0, #0
    adds r1, #0xa
    adds r0, r5, #0
    bl func_08034C64
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L080364C0
    ldr r7, .L080364DC @ =0x000006AD
    ldr r0, .L080364E0 @ =0x000006B1
    mov r8, r0
.L080364C0:
    adds r0, r4, #0
    adds r1, r7, #0
    bl func_08035908
    adds r0, r4, #0
    mov r1, r8
    bl func_08035940
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L080364DC: .4byte 0x000006AD
.L080364E0: .4byte 0x000006B1

    thumb_func_start func_080364E4
func_080364E4: @ 0x080364E4
    push {r4, r5, lr}
    adds r5, r0, #0
    adds r4, r1, #0
    bl func_08034F00
    cmp r4, #1
    ble .L080364F8
    adds r0, r5, #0
    bl func_08036430
.L080364F8:
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0

    .section .text.after_npc_resident_run4, "ax", %progbits

    thumb_func_start func_080365CC
func_080365CC: @ 0x080365CC
    push {r4, r5, r6, r7, lr}
    mov r7, r8
    push {r7}
    adds r4, r0, #0
    ldr r7, .L08036610 @ =0x00000884
    ldr r0, .L08036614 @ =0x00000888
    mov r8, r0
    ldr r5, [r4, #0x34]
    ldr r1, .L08036618 @ =0x00001CD4
    adds r6, r5, r1
    adds r0, r6, #0
    bl func_080A0490
    cmp r0, #0x15
    bne .L0803665C
    ldrh r0, [r4, #4]
    cmp r0, #0x1d
    bne .L0803665C
    adds r0, r4, #0
    bl func_08035AE0
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0803660A
    ldr r2, .L0803661C @ =0x0000216C
    adds r0, r5, r2
    ldrb r0, [r0]
    lsls r0, r0, #0x1d
    lsrs r0, r0, #0x1e
    cmp r0, #1
    bne .L08036624
.L0803660A:
    ldr r7, .L08036620 @ =0x0000089C
    b .L0803665C
    .align 2, 0
.L08036610: .4byte 0x00000884
.L08036614: .4byte 0x00000888
.L08036618: .4byte 0x00001CD4
.L0803661C: .4byte 0x0000216C
.L08036620: .4byte 0x0000089C
.L08036624:
    adds r0, r6, #0
    bl func_080A0384
    cmp r0, #0
    beq .L0803665C
    bl func_0809EAD8
    cmp r0, #0x3b
    bhi .L0803665C
    ldr r0, [r4]
    ldr r1, [r0]
    movs r2, #0xa2
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    adds r1, r0, #0
    adds r1, #0xa
    adds r0, r5, #0
    bl func_08034C64
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0803665C
    ldr r7, .L08036678 @ =0x00000894
    ldr r0, .L0803667C @ =0x00000898
    mov r8, r0
.L0803665C:
    adds r0, r4, #0
    adds r1, r7, #0
    bl func_08035908
    adds r0, r4, #0
    mov r1, r8
    bl func_08035940
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08036678: .4byte 0x00000894
.L0803667C: .4byte 0x00000898

    thumb_func_start func_08036680
func_08036680: @ 0x08036680
    push {r4, r5, lr}
    adds r5, r0, #0
    adds r4, r1, #0
    bl func_08034F00
    cmp r4, #1
    ble .L08036694
    adds r0, r5, #0
    bl func_080365CC
.L08036694:
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0

    .section .text.after_npc_resident_run5, "ax", %progbits

    thumb_func_start func_08036768
func_08036768: @ 0x08036768
    push {r4, r5, lr}
    adds r4, r0, #0
    ldr r1, .L080367A0 @ =0x0000027B
    movs r5, #2
    ldr r0, [r4, #0x34]
    ldr r2, .L080367A4 @ =0x00002181
    adds r0, r0, r2
    ldrb r0, [r0]
    lsls r0, r0, #0x1e
    lsrs r0, r0, #0x1e
    cmp r0, #1
    bne .L08036784
    adds r1, #0x18
    movs r5, #1
.L08036784:
    adds r0, r4, #0
    bl func_08035908
    adds r0, r4, #0
    ldr r1, .L080367A8 @ =0x0000027F
    bl func_08035940
    adds r0, r4, #0
    adds r0, #0x21
    strb r5, [r0]
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L080367A0: .4byte 0x0000027B
.L080367A4: .4byte 0x00002181
.L080367A8: .4byte 0x0000027F

    thumb_func_start func_080367AC
func_080367AC: @ 0x080367AC
    push {r4, r5, lr}
    adds r5, r0, #0
    adds r4, r1, #0
    bl func_08034F00
    cmp r4, #1
    ble .L080367C0
    adds r0, r5, #0
    bl func_08036768
.L080367C0:
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0

    .section .text.after_npc_resident_run6, "ax", %progbits

    thumb_func_start func_08036900
func_08036900: @ 0x08036900
    push {r4, r5, r6, r7, lr}
    mov r7, r8
    push {r7}
    adds r4, r0, #0
    ldr r7, .L08036950 @ =0x000007BE
    ldr r0, .L08036954 @ =0x000007C2
    mov r8, r0
    ldr r5, [r4, #0x34]
    ldr r1, .L08036958 @ =0x00001CD4
    adds r6, r5, r1
    adds r0, r6, #0
    bl func_080A0490
    cmp r0, #0x19
    bne .L080369A0
    ldrh r0, [r4, #4]
    cmp r0, #0x1d
    bne .L080369A0
    adds r0, r4, #0
    bl func_08035AE0
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0803694A
    ldr r2, .L0803695C @ =0x0000216B
    adds r0, r5, r2
    ldrb r2, [r0]
    lsrs r2, r2, #7
    ldr r1, .L08036960 @ =0x0000216C
    adds r0, r5, r1
    ldrb r0, [r0]
    movs r1, #1
    ands r0, r1
    lsls r0, r0, #1
    orrs r0, r2
    cmp r0, #1
    bne .L08036968
.L0803694A:
    ldr r7, .L08036964 @ =0x000007D2
    b .L080369A0
    .align 2, 0
.L08036950: .4byte 0x000007BE
.L08036954: .4byte 0x000007C2
.L08036958: .4byte 0x00001CD4
.L0803695C: .4byte 0x0000216B
.L08036960: .4byte 0x0000216C
.L08036964: .4byte 0x000007D2
.L08036968:
    adds r0, r6, #0
    bl func_080A0384
    cmp r0, #0
    beq .L080369A0
    bl func_0809EAD8
    cmp r0, #0x3b
    bhi .L080369A0
    ldr r0, [r4]
    ldr r1, [r0]
    movs r2, #0xa2
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    adds r1, r0, #0
    adds r1, #0xa
    adds r0, r5, #0
    bl func_08034C64
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L080369A0
    ldr r7, .L080369BC @ =0x000007CA
    ldr r0, .L080369C0 @ =0x000007CE
    mov r8, r0
.L080369A0:
    adds r0, r4, #0
    adds r1, r7, #0
    bl func_08035908
    adds r0, r4, #0
    mov r1, r8
    bl func_08035940
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L080369BC: .4byte 0x000007CA
.L080369C0: .4byte 0x000007CE

    thumb_func_start func_080369C4
func_080369C4: @ 0x080369C4
    push {r4, r5, lr}
    adds r5, r0, #0
    adds r4, r1, #0
    bl func_08034F00
    cmp r4, #1
    ble .L080369D8
    adds r0, r5, #0
    bl func_08036900
.L080369D8:
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0

    .section .text.after_npc_resident_run7, "ax", %progbits

    thumb_func_start func_08036AB4
func_08036AB4: @ 0x08036AB4
    push {r4, r5, lr}
    adds r4, r0, #0
    ldr r1, .L08036AD0 @ =0x000009D3
    ldr r5, .L08036AD4 @ =0x000009D7
    ldrh r0, [r4, #4]
    adds r2, r0, #0
    cmp r0, #0x11
    beq .L08036AE0
    cmp r0, #0x11
    bgt .L08036AD8
    cmp r0, #7
    beq .L08036AE0
    b .L08036AE4
    .align 2, 0
.L08036AD0: .4byte 0x000009D3
.L08036AD4: .4byte 0x000009D7
.L08036AD8:
    cmp r2, #0x1d
    beq .L08036AE0
    cmp r2, #0x25
    bne .L08036AE4
.L08036AE0:
    ldr r1, .L08036AF8 @ =0x000009DF
    ldr r5, .L08036AFC @ =0x000009E3
.L08036AE4:
    adds r0, r4, #0
    bl func_08035908
    adds r0, r4, #0
    adds r1, r5, #0
    bl func_08035940
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L08036AF8: .4byte 0x000009DF
.L08036AFC: .4byte 0x000009E3

    thumb_func_start func_08036B00
func_08036B00: @ 0x08036B00
    push {r4, r5, lr}
    adds r5, r0, #0
    adds r4, r1, #0
    bl func_08034F00
    cmp r4, #1
    ble .L08036B14
    adds r0, r5, #0
    bl func_08036AB4
.L08036B14:
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0

    .section .text.after_npc_resident_run8, "ax", %progbits

    thumb_func_start func_08036BB0
func_08036BB0: @ 0x08036BB0
    push {r4, r5, r6, lr}
    adds r4, r0, #0
    movs r0, #0xa
    ldrsh r5, [r4, r0]
    movs r2, #0xe
    ldrsh r6, [r4, r2]
    adds r0, r4, #0
    bl func_08034EB4
    ldrh r0, [r4, #4]
    cmp r0, #2
    bne .L08036BF0
    cmp r5, #0xf4
    bne .L08036BD0
    cmp r6, #0xab
    beq .L08036BF0
.L08036BD0:
    movs r1, #0xa
    ldrsh r0, [r4, r1]
    movs r2, #0xe
    ldrsh r1, [r4, r2]
    cmp r0, #0xf4
    bne .L08036BF0
    cmp r1, #0xab
    bne .L08036BF0
    ldr r0, [r4]
    ldr r1, [r0]
    movs r2, #0x8a
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
.L08036BF0:
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_08036BF8
func_08036BF8: @ 0x08036BF8
    push {r4, r5, r6, r7, lr}
    adds r5, r0, #0
    adds r4, r1, #0
    movs r0, #0xa
    ldrsh r6, [r5, r0]
    movs r1, #0xe
    ldrsh r7, [r5, r1]
    adds r0, r5, #0
    adds r1, r4, #0
    bl func_08034F00
    cmp r4, #1
    ble .L08036C40
    ldrh r0, [r5, #4]
    cmp r0, #2
    bne .L08036C40
    cmp r6, #0xf4
    bne .L08036C20
    cmp r7, #0xab
    beq .L08036C40
.L08036C20:
    movs r2, #0xa
    ldrsh r0, [r5, r2]
    movs r2, #0xe
    ldrsh r1, [r5, r2]
    cmp r0, #0xf4
    bne .L08036C40
    cmp r1, #0xab
    bne .L08036C40
    ldr r0, [r5]
    ldr r1, [r0]
    movs r2, #0x8a
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
.L08036C40:
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0

    .section .text.after_npc_special_run1, "ax", %progbits

    thumb_func_start func_08036E70
func_08036E70: @ 0x08036E70
    push {r4, r5, r6, r7, lr}
    adds r4, r0, #0
    ldr r0, [r4, #0x34]
    ldr r1, .L08036EA0 @ =0x00001CD4
    adds r0, r0, r1
    bl func_080A0384
    adds r6, r0, #0
    cmp r0, #0
    beq .L08036EE0
    ldr r5, .L08036EA4 @ =0x00000267
    ldr r7, .L08036EA8 @ =0x0000026F
    bl func_0809EAD8
    cmp r0, #0x3b
    bhi .L08036EAC
    adds r0, r4, #0
    bl func_08035AE0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08036ED0
    movs r5, #0xc
    b .L08036ED0
    .align 2, 0
.L08036EA0: .4byte 0x00001CD4
.L08036EA4: .4byte 0x00000267
.L08036EA8: .4byte 0x0000026F
.L08036EAC:
    adds r0, r4, #0
    bl func_08035AE0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08036EC0
    ldr r5, .L08036EBC @ =0x00000277
    b .L08036ED0
    .align 2, 0
.L08036EBC: .4byte 0x00000277
.L08036EC0:
    adds r0, r6, #0
    bl func_0809EAE0
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08036ED0
    ldr r5, .L08036EE8 @ =0x0000026B
    ldr r7, .L08036EEC @ =0x00000273
.L08036ED0:
    adds r0, r4, #0
    adds r1, r5, #0
    bl func_08035908
    adds r0, r4, #0
    adds r1, r7, #0
    bl func_08035940
.L08036EE0:
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08036EE8: .4byte 0x0000026B
.L08036EEC: .4byte 0x00000273
    .section .text.after_npc_special_run2, "ax", %progbits

    thumb_func_start func_08036F0C
func_08036F0C: @ 0x08036F0C
    .incbin "baserom.gba", 0x36F0C, 0x5C

    thumb_func_start func_08036F68
func_08036F68: @ 0x08036F68
    .incbin "baserom.gba", 0x36F68, 0xA0

    .section .text.after_entity_locbound_run1, "ax", %progbits

    thumb_func_start func_08037098
func_08037098: @ 0x08037098
    push {r4, r5, lr}
    adds r3, r0, #0
    movs r4, #0
    movs r5, #0
    adds r0, #0x20
    ldrb r0, [r0]
    adds r2, r0, #0
    cmp r0, #1
    beq .L080370C2
    cmp r0, #1
    bgt .L080370B4
    cmp r0, #0
    beq .L080370BE
    b .L080370CC
.L080370B4:
    cmp r2, #2
    beq .L080370C6
    cmp r2, #3
    beq .L080370CA
    b .L080370CC
.L080370BE:
    adds r5, r1, #0
    b .L080370CC
.L080370C2:
    rsbs r5, r1, #0
    b .L080370CC
.L080370C6:
    rsbs r4, r1, #0
    b .L080370CC
.L080370CA:
    adds r4, r1, #0
.L080370CC:
    str r4, [r3, #0x18]
    str r5, [r3, #0x1c]
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L080370D8:
    .byte 0x10, 0xB5, 0x00, 0x69, 0x00, 0x28, 0x16, 0xD0
    .byte 0x00, 0x24, 0x02, 0x1C, 0x30, 0x32, 0x00, 0x21, 0xD0, 0x89, 0x00, 0x28, 0x04, 0xD0, 0x10, 0x20
    .byte 0x11, 0x5E, 0x48, 0x42, 0x08, 0x43, 0xC1, 0x0F, 0x00, 0x29, 0x05, 0xD0, 0x10, 0x1C, 0x27, 0xF0
    .byte 0xC9, 0xFB, 0x00, 0x06, 0x00, 0x28, 0x00, 0xD0, 0x01, 0x24, 0x20, 0x1C, 0x00, 0xE0, 0x01, 0x20
    .byte 0x10, 0xBC, 0x02, 0xBC, 0x08, 0x47, 0x00, 0x00

    thumb_func_start func_08037118
func_08037118: @ 0x08037118
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #4
    adds r7, r0, #0
    adds r4, r1, #0
    ldr r1, [r7, #8]
    ldr r2, [r7, #0xc]
    ldr r0, [r7, #0x18]
    adds r0, r0, r1
    mov sb, r0
    ldr r0, [r7, #0x1c]
    adds r0, r0, r2
    mov r8, r0
    asrs r1, r1, #0x10
    str r1, [sp]
    asrs r6, r2, #0x10
    asrs r0, r0, #0x10
    subs r5, r0, r6
    mov r1, sb
    asrs r0, r1, #0x10
    ldr r1, [sp]
    subs r1, r0, r1
    mov sl, r1
    cmp r5, #0
    ble .L08037182
    ldr r1, [r4]
    ldr r0, [r4, #0x28]
    cmp r1, r0
    ble .L08037162
    adds r0, r4, #0
    bl func_080AB85C
    ldr r0, [r4]
    b .L08037164
.L08037162:
    adds r0, r1, #0
.L08037164:
    cmp r5, r0
    ble .L08037182
    ldr r1, [r4]
    ldr r0, [r4, #0x28]
    cmp r1, r0
    ble .L0803717A
    adds r0, r4, #0
    bl func_080AB85C
    ldr r0, [r4]
    b .L0803717C
.L0803717A:
    adds r0, r1, #0
.L0803717C:
    adds r0, r6, r0
    lsls r0, r0, #0x10
    mov r8, r0
.L08037182:
    cmp r5, #0
    bge .L080371B8
    ldr r1, [r4, #4]
    ldr r0, [r4, #0x28]
    cmn r1, r0
    bge .L08037198
    adds r0, r4, #0
    bl func_080AB8D0
    ldr r0, [r4, #4]
    b .L0803719A
.L08037198:
    adds r0, r1, #0
.L0803719A:
    cmp r5, r0
    bge .L080371B8
    ldr r1, [r4, #4]
    ldr r0, [r4, #0x28]
    cmn r1, r0
    bge .L080371B0
    adds r0, r4, #0
    bl func_080AB8D0
    ldr r0, [r4, #4]
    b .L080371B2
.L080371B0:
    adds r0, r1, #0
.L080371B2:
    adds r0, r6, r0
    lsls r0, r0, #0x10
    mov r8, r0
.L080371B8:
    mov r0, sl
    cmp r0, #0
    bge .L080371F2
    ldr r1, [r4, #8]
    ldr r0, [r4, #0x28]
    cmn r1, r0
    bge .L080371D0
    adds r0, r4, #0
    bl func_080AB948
    ldr r0, [r4, #8]
    b .L080371D2
.L080371D0:
    adds r0, r1, #0
.L080371D2:
    cmp sl, r0
    bge .L080371F2
    ldr r1, [r4, #8]
    ldr r0, [r4, #0x28]
    cmn r1, r0
    bge .L080371E8
    adds r0, r4, #0
    bl func_080AB948
    ldr r0, [r4, #8]
    b .L080371EA
.L080371E8:
    adds r0, r1, #0
.L080371EA:
    ldr r1, [sp]
    adds r0, r1, r0
    lsls r0, r0, #0x10
    mov sb, r0
.L080371F2:
    mov r0, sl
    cmp r0, #0
    ble .L0803722C
    ldr r1, [r4, #0xc]
    ldr r0, [r4, #0x28]
    cmp r1, r0
    ble .L0803720A
    adds r0, r4, #0
    bl func_080AB9C4
    ldr r0, [r4, #0xc]
    b .L0803720C
.L0803720A:
    adds r0, r1, #0
.L0803720C:
    cmp sl, r0
    ble .L0803722C
    ldr r1, [r4, #0xc]
    ldr r0, [r4, #0x28]
    cmp r1, r0
    ble .L08037222
    adds r0, r4, #0
    bl func_080AB9C4
    ldr r0, [r4, #0xc]
    b .L08037224
.L08037222:
    adds r0, r1, #0
.L08037224:
    ldr r1, [sp]
    adds r0, r1, r0
    lsls r0, r0, #0x10
    mov sb, r0
.L0803722C:
    mov r0, sb
    str r0, [r7, #8]
    mov r1, r8
    str r1, [r7, #0xc]
    add sp, #4
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0

    .section .text.after_entity_locbound_run1b, "ax", %progbits

.L08037250:
    .byte 0x82, 0xB0, 0x6B, 0x46, 0x00, 0x21, 0x6A, 0x46, 0x11, 0x80, 0x59, 0x80, 0x99, 0x80, 0xD9, 0x80
    .byte 0x00, 0x99, 0x01, 0x9A, 0x41, 0x63, 0x82, 0x63, 0x02, 0xB0, 0x70, 0x47

    thumb_func_start func_0803726C
func_0803726C: @ 0x0803726C
    push {r4, r5, r6, r7, lr}
    mov r7, sb
    mov r6, r8
    push {r6, r7}
    sub sp, #0x60
    adds r7, r0, #0
    ldr r4, [r7]
    ldrh r0, [r7, #4]
    mov r8, r0
    ldr r0, [r4]
    ldr r1, [r0, #0x14]
    adds r0, r4, #0
    bl _call_via_r1
    cmp r0, r8
    beq .L0803728E
    b .L08037402
.L0803728E:
    ldr r1, [r4]
    mov r0, sp
    ldr r3, [r1, #0x34]
    adds r1, r4, #0
    mov r2, r8
    bl _call_via_r3
    ldr r1, [r7, #0x14]
    add r0, sp, #0x40
    ldr r2, [r1, #0xc]
    adds r1, r7, #0
    bl _call_via_r2
    ldr r1, [sp, #0x40]
    ldr r2, [sp, #0x44]
    str r1, [sp, #0x58]
    str r2, [sp, #0x5c]
    add r4, sp, #0xc
    movs r2, #0x20
    mov sb, r2
    movs r5, #0
    movs r1, #0x21
    str r1, [sp, #0xc]
    movs r0, #0x21
    rsbs r0, r0, #0
    str r0, [r4, #4]
    str r0, [r4, #8]
    str r1, [r4, #0xc]
    add r1, sp, #0x20
    mov r0, sp
    ldm r0!, {r2, r3, r6}
    stm r1!, {r2, r3, r6}
    ldr r0, [sp, #0x58]
    ldr r1, [sp, #0x5c]
    str r0, [sp, #0x2c]
    str r1, [sp, #0x30]
    mov r1, sb
    str r1, [r4, #0x28]
    str r5, [r4, #0x2c]
    str r5, [r4, #0x30]
    ldr r0, [r7]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0
    bl _call_via_r2
    adds r3, r0, #0
    mov sb, r4
    cmp r3, #0
    beq .L08037310
    ldrh r0, [r3, #4]
    cmp r0, r8
    bne .L08037310
    ldr r1, [r3, #0x14]
    add r4, sp, #0x48
    adds r0, r4, #0
    ldr r2, [r1, #0xc]
    adds r1, r3, #0
    bl _call_via_r2
    mov r0, sb
    adds r1, r4, #0
    movs r2, #0
    bl func_080ABA90
.L08037310:
    ldr r0, [r7]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x4a
    bl _call_via_r2
    adds r3, r0, #0
    cmp r3, #0
    beq .L08037340
    ldrh r0, [r3, #4]
    cmp r0, r8
    bne .L08037340
    ldr r1, [r3, #0x14]
    add r4, sp, #0x50
    adds r0, r4, #0
    ldr r2, [r1, #0xc]
    adds r1, r3, #0
    bl _call_via_r2
    mov r0, sb
    adds r1, r4, #0
    movs r2, #0
    bl func_080ABA90
.L08037340:
    adds r2, r7, #0
    adds r2, #0x34
    movs r3, #4
    ldrsh r0, [r2, r3]
    movs r6, #0x34
    ldrsh r1, [r7, r6]
    subs r0, r0, r1
    cmp r0, #0
    ble .L0803736A
    movs r1, #6
    ldrsh r0, [r2, r1]
    movs r3, #2
    ldrsh r1, [r2, r3]
    subs r0, r0, r1
    cmp r0, #0
    ble .L0803736A
    mov r0, sb
    adds r1, r2, #0
    movs r2, #0
    bl func_080ABA90
.L0803736A:
    ldrh r4, [r7, #0x3e]
    cmp r4, #0
    beq .L080373EC
    ldr r5, [r7, #0x18]
    ldr r6, [r7, #0x1c]
    cmp r5, #0
    bge .L08037390
    ldr r1, [sp, #0x14]
    ldr r0, [sp, #0x34]
    cmn r1, r0
    bge .L0803738A
    add r0, sp, #0xc
    bl func_080AB948
    ldr r0, [sp, #0x14]
    b .L0803738C
.L0803738A:
    adds r0, r1, #0
.L0803738C:
    cmp r0, #0
    bge .L080373E4
.L08037390:
    cmp r5, #0
    ble .L080373AC
    ldr r1, [sp, #0x18]
    ldr r0, [sp, #0x34]
    cmp r1, r0
    ble .L080373A6
    add r0, sp, #0xc
    bl func_080AB9C4
    ldr r0, [sp, #0x18]
    b .L080373A8
.L080373A6:
    adds r0, r1, #0
.L080373A8:
    cmp r0, #0
    ble .L080373E4
.L080373AC:
    cmp r6, #0
    bge .L080373C8
    ldr r1, [sp, #0x10]
    ldr r0, [sp, #0x34]
    cmn r1, r0
    bge .L080373C2
    add r0, sp, #0xc
    bl func_080AB8D0
    ldr r0, [sp, #0x10]
    b .L080373C4
.L080373C2:
    adds r0, r1, #0
.L080373C4:
    cmp r0, #0
    bge .L080373E4
.L080373C8:
    cmp r6, #0
    ble .L080373E8
    ldr r1, [sp, #0xc]
    ldr r0, [sp, #0x34]
    cmp r1, r0
    ble .L080373DE
    add r0, sp, #0xc
    bl func_080AB85C
    ldr r0, [sp, #0xc]
    b .L080373E0
.L080373DE:
    adds r0, r1, #0
.L080373E0:
    cmp r0, #0
    bgt .L080373E8
.L080373E4:
    movs r4, #0
    b .L080373F8
.L080373E8:
    subs r4, #1
    b .L080373F8
.L080373EC:
    ldr r0, [r7, #0x14]
    ldr r1, [r0, #0x40]
    adds r0, r7, #0
    bl _call_via_r1
    adds r4, r0, #0
.L080373F8:
    strh r4, [r7, #0x3e]
    adds r0, r7, #0
    mov r1, sb
    bl func_08037118
.L08037402:
    ldrh r0, [r7, #0x24]
    cmp r0, #0
    beq .L0803740C
    subs r0, #1
    b .L0803740E
.L0803740C:
    ldrh r0, [r7, #0x26]
.L0803740E:
    strh r0, [r7, #0x24]
    ldr r2, [r7, #0x10]
    cmp r2, #0
    beq .L08037420
    ldr r0, [r2, #4]
    ldr r1, [r0, #0xc]
    adds r0, r2, #0
    bl _call_via_r1
.L08037420:
    add sp, #0x60
    pop {r3, r4}
    mov r8, r3
    mov sb, r4
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0

    .section .text.after_entity_locbound_run2, "ax", %progbits

    thumb_func_start func_08037494
func_08037494: @ 0x08037494
    push {r4, r5, r6, r7, lr}
    adds r6, r0, #0
    ldr r0, [r6]
    ldr r1, [r0]
    movs r2, #0xa2
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldrb r0, [r0, #0xa]
    lsls r0, r0, #0x1b
    lsrs r0, r0, #0x1b
    movs r1, #0
    subs r0, #6
    cmp r0, #0xe
    bls .L080374B8
    movs r1, #1
.L080374B8:
    lsls r4, r1, #2
    adds r4, r4, r1
    lsls r4, r4, #2
    ldr r0, .L08037538 @ =gUnk_080F1538
    adds r4, r4, r0
    adds r0, r4, #0
    movs r1, #5
    bl func_080AB82C
    lsls r1, r0, #2
    adds r4, r4, r1
    adds r7, r0, #0
    movs r5, #0x3c
    ldrb r0, [r4, #2]
    muls r0, r5, r0
    bl func_080AB788
    ldrb r1, [r4, #1]
    muls r1, r5, r1
    adds r5, r1, r0
    movs r0, #4
    bl func_080AB788
    adds r1, r0, #0
    cmp r1, #0
    beq .L08037508
    cmp r1, #3
    beq .L08037508
    adds r4, r6, #0
    adds r4, #0x20
    ldrb r0, [r4]
    bl func_080AB7A4
    adds r1, r0, #0
    ldrb r0, [r4]
    cmp r0, r1
    beq .L08037508
    adds r0, r6, #0
    bl SetAnimFacing__12AActorEntityUi
.L08037508:
    adds r0, r6, #0
    adds r1, r7, #0
    bl func_08037628
    adds r1, r0, #0
    adds r0, r6, #0
    bl func_08037098
    adds r0, r6, #0
    adds r1, r7, #0
    bl func_08037618
    adds r1, r0, #0
    ldrh r0, [r6, #0x22]
    cmp r0, r1
    beq .L0803752E
    adds r0, r6, #0
    bl SetAnim__12AActorEntityUi
.L0803752E:
    adds r0, r5, #0
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    .align 2, 0
.L08037538: .4byte gUnk_080F1538

    .section .text.after_entity_locbound_run3, "ax", %progbits

    thumb_func_start func_08037568
func_08037568: @ 0x08037568
    push {r4, r5, lr}
    mov r5, r8
    push {r5}
    sub sp, #8
    adds r4, r0, #0
    ldr r0, [r4]
    ldr r1, [r0]
    movs r2, #0xa2
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    adds r1, r0, #0
    adds r5, r1, #0
    ldrb r0, [r1, #0xa]
    lsls r0, r0, #0x1b
    lsrs r0, r0, #0x1b
    subs r0, #6
    cmp r0, #9
    bhi .L08037600
    ldrb r2, [r1, #8]
    lsls r2, r2, #0x1d
    lsrs r2, r2, #0x1d
    ldrb r3, [r1, #9]
    lsls r0, r3, #0x1e
    lsrs r0, r0, #0x1e
    lsls r3, r3, #0x19
    lsrs r3, r3, #0x1b
    adds r2, #6
    lsls r1, r0, #4
    subs r1, r1, r0
    lsls r1, r1, #1
    lsls r0, r2, #4
    subs r0, r0, r2
    lsls r0, r0, #3
    adds r1, r1, r0
    adds r3, r3, r1
    cmp r3, #6
    bls .L080375C2
    adds r0, r3, #0
    movs r1, #7
    bl __umodsi3
    adds r3, r0, #0
.L080375C2:
    movs r0, #7
    ands r3, r0
    cmp r3, #0
    beq .L08037600
    ldr r0, [r5]
    cmp r0, #0
    bne .L08037600
    adds r0, r4, #0
    adds r0, #0x44
    ldrb r1, [r0]
    lsls r1, r1, #0x1e
    lsrs r1, r1, #0x1e
    mov r0, sp
    bl func_080A17A0
    adds r0, r4, #0
    mov r1, sp
    bl SetLocation__12AActorEntityRC13ActorLocation
    adds r0, r4, #0
    movs r1, #0
    bl func_08037618
    adds r1, r0, #0
    ldrh r0, [r4, #0x22]
    cmp r0, r1
    beq .L0803760A
    adds r0, r4, #0
    bl SetAnim__12AActorEntityUi
    b .L0803760A
.L08037600:
    adds r0, r4, #0
    movs r1, #0x8d
    lsls r1, r1, #2
    bl SetMap__7AEntityUi
.L0803760A:
    add sp, #8
    pop {r3}
    mov r8, r3
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0

    .section .text.after_entity_locbound_run3b, "ax", %progbits

    thumb_func_start func_0803763C
func_0803763C: @ 0x0803763C
    push {r4, r5, r6, r7, lr}
    adds r6, r0, #0
    ldr r0, [r6]
    ldr r1, [r0]
    movs r2, #0xa2
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldrb r0, [r0, #0xa]
    lsls r0, r0, #0x1b
    lsrs r0, r0, #0x1b
    movs r1, #0
    subs r0, #6
    cmp r0, #0xe
    bls .L08037660
    movs r1, #1
.L08037660:
    lsls r4, r1, #3
    subs r4, r4, r1
    lsls r4, r4, #2
    ldr r0, .L080376E0 @ =gUnk_080F156C
    adds r4, r4, r0
    adds r0, r4, #0
    movs r1, #7
    bl func_080AB82C
    lsls r1, r0, #2
    adds r4, r4, r1
    adds r7, r0, #0
    movs r5, #0x3c
    ldrb r0, [r4, #2]
    muls r0, r5, r0
    bl func_080AB788
    ldrb r1, [r4, #1]
    muls r1, r5, r1
    adds r5, r1, r0
    movs r0, #4
    bl func_080AB788
    adds r1, r0, #0
    cmp r1, #0
    beq .L080376B0
    cmp r1, #3
    beq .L080376B0
    adds r4, r6, #0
    adds r4, #0x20
    ldrb r0, [r4]
    bl func_080AB7A4
    adds r1, r0, #0
    ldrb r0, [r4]
    cmp r0, r1
    beq .L080376B0
    adds r0, r6, #0
    bl SetAnimFacing__12AActorEntityUi
.L080376B0:
    adds r0, r6, #0
    adds r1, r7, #0
    bl func_080377D4
    adds r1, r0, #0
    adds r0, r6, #0
    bl func_08037098
    adds r0, r6, #0
    adds r1, r7, #0
    bl func_080377C4
    adds r1, r0, #0
    ldrh r0, [r6, #0x22]
    cmp r0, r1
    beq .L080376D6
    adds r0, r6, #0
    bl SetAnim__12AActorEntityUi
.L080376D6:
    adds r0, r5, #0
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    .align 2, 0
.L080376E0: .4byte gUnk_080F156C

    .section .text.after_entity_locbound_run4, "ax", %progbits

    thumb_func_start func_08037714
func_08037714: @ 0x08037714
    push {r4, r5, lr}
    mov r5, r8
    push {r5}
    sub sp, #8
    adds r4, r0, #0
    ldr r0, [r4]
    ldr r1, [r0]
    movs r2, #0xa2
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    adds r1, r0, #0
    adds r5, r1, #0
    ldrb r0, [r1, #0xa]
    lsls r0, r0, #0x1b
    lsrs r0, r0, #0x1b
    subs r0, #6
    cmp r0, #9
    bhi .L080377AC
    ldrb r2, [r1, #8]
    lsls r2, r2, #0x1d
    lsrs r2, r2, #0x1d
    ldrb r3, [r1, #9]
    lsls r0, r3, #0x1e
    lsrs r0, r0, #0x1e
    lsls r3, r3, #0x19
    lsrs r3, r3, #0x1b
    adds r2, #6
    lsls r1, r0, #4
    subs r1, r1, r0
    lsls r1, r1, #1
    lsls r0, r2, #4
    subs r0, r0, r2
    lsls r0, r0, #3
    adds r1, r1, r0
    adds r3, r3, r1
    cmp r3, #6
    bls .L0803776E
    adds r0, r3, #0
    movs r1, #7
    bl __umodsi3
    adds r3, r0, #0
.L0803776E:
    movs r0, #7
    ands r3, r0
    cmp r3, #1
    beq .L080377AC
    ldr r0, [r5]
    cmp r0, #0
    bne .L080377AC
    adds r0, r4, #0
    adds r0, #0x44
    ldrb r1, [r0]
    lsls r1, r1, #0x1e
    lsrs r1, r1, #0x1e
    mov r0, sp
    bl func_080A1890
    adds r0, r4, #0
    mov r1, sp
    bl SetLocation__12AActorEntityRC13ActorLocation
    adds r0, r4, #0
    movs r1, #0
    bl func_080377C4
    adds r1, r0, #0
    ldrh r0, [r4, #0x22]
    cmp r0, r1
    beq .L080377B6
    adds r0, r4, #0
    bl SetAnim__12AActorEntityUi
    b .L080377B6
.L080377AC:
    adds r0, r4, #0
    movs r1, #0x8d
    lsls r1, r1, #2
    bl SetMap__7AEntityUi
.L080377B6:
    add sp, #8
    pop {r3}
    mov r8, r3
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0

    .section .text.after_entity_locbound_run4b, "ax", %progbits

    thumb_func_start func_080377E8
func_080377E8: @ 0x080377E8
    push {r4, r5, r6, r7, lr}
    adds r6, r0, #0
    ldr r0, [r6]
    ldr r1, [r0]
    movs r2, #0xa2
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldrb r0, [r0, #0xa]
    lsls r0, r0, #0x1b
    lsrs r0, r0, #0x1b
    movs r4, #0
    subs r0, #6
    cmp r0, #0xe
    bls .L0803780C
    movs r4, #1
.L0803780C:
    movs r0, #0x34
    muls r4, r0, r4
    ldr r0, .L08037888 @ =gUnk_080F15B4
    adds r4, r4, r0
    adds r0, r4, #0
    movs r1, #0xd
    bl func_080AB82C
    lsls r1, r0, #2
    adds r4, r4, r1
    adds r7, r0, #0
    movs r5, #0x3c
    ldrb r0, [r4, #2]
    muls r0, r5, r0
    bl func_080AB788
    ldrb r1, [r4, #1]
    muls r1, r5, r1
    adds r5, r1, r0
    movs r0, #4
    bl func_080AB788
    adds r1, r0, #0
    cmp r1, #0
    beq .L0803785A
    cmp r1, #3
    beq .L0803785A
    adds r4, r6, #0
    adds r4, #0x20
    ldrb r0, [r4]
    bl func_080AB7A4
    adds r1, r0, #0
    ldrb r0, [r4]
    cmp r0, r1
    beq .L0803785A
    adds r0, r6, #0
    bl SetAnimFacing__12AActorEntityUi
.L0803785A:
    adds r0, r6, #0
    adds r1, r7, #0
    bl func_080378FC
    adds r1, r0, #0
    adds r0, r6, #0
    bl func_08037098
    adds r0, r6, #0
    adds r1, r7, #0
    bl func_080378EC
    adds r1, r0, #0
    ldrh r0, [r6, #0x22]
    cmp r0, r1
    beq .L08037880
    adds r0, r6, #0
    bl SetAnim__12AActorEntityUi
.L08037880:
    adds r0, r5, #0
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    .align 2, 0
.L08037888: .4byte gUnk_080F15B4

    .section .text.after_entity_locbound_run5, "ax", %progbits

    thumb_func_start func_08037958
func_08037958: @ 0x08037958
    push {r4, r5, r6, r7, lr}
    adds r6, r0, #0
    ldr r5, .L080379D4 @ =gUnk_080F1638
    adds r0, r5, #0
    movs r1, #3
    bl func_080AB82C
    lsls r4, r0, #2
    adds r4, r4, r5
    adds r7, r0, #0
    movs r5, #0x3c
    ldrb r0, [r4, #2]
    muls r0, r5, r0
    bl func_080AB788
    ldrb r1, [r4, #1]
    muls r1, r5, r1
    adds r5, r1, r0
    movs r0, #4
    bl func_080AB788
    adds r1, r0, #0
    cmp r1, #0
    beq .L080379A4
    cmp r1, #3
    beq .L080379A4
    adds r4, r6, #0
    adds r4, #0x20
    ldrb r0, [r4]
    bl func_080AB7A4
    adds r1, r0, #0
    ldrb r0, [r4]
    cmp r0, r1
    beq .L080379A4
    adds r0, r6, #0
    bl SetAnimFacing__12AActorEntityUi
.L080379A4:
    adds r0, r6, #0
    adds r1, r7, #0
    bl func_08037A48
    adds r1, r0, #0
    adds r0, r6, #0
    bl func_08037098
    adds r0, r6, #0
    adds r1, r7, #0
    bl func_08037A38
    adds r1, r0, #0
    ldrh r0, [r6, #0x22]
    cmp r0, r1
    beq .L080379CA
    adds r0, r6, #0
    bl SetAnim__12AActorEntityUi
.L080379CA:
    adds r0, r5, #0
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    .align 2, 0
.L080379D4: .4byte gUnk_080F1638

    .section .text.after_entity_locbound_run6, "ax", %progbits

    thumb_func_start func_08037A5C
func_08037A5C: @ 0x08037A5C
    push {r4, r5, r6, lr}
    mov r6, r8
    push {r6}
    sub sp, #0xc
    adds r6, r0, #0
    mov r8, r1
    adds r4, r2, #0
    movs r0, #0x48
    bl __builtin_new
    adds r5, r0, #0
    movs r0, #0
    str r0, [sp]
    adds r0, r5, #0
    adds r1, r6, #0
    mov r2, r8
    ldr r3, .L08037AC8 @ =0x0000071C
    bl func_08037008
    ldr r0, .L08037ACC @ =vtable_unk_080E72E4
    str r0, [r5, #0x14]
    adds r2, r5, #0
    adds r2, #0x44
    movs r0, #3
    ands r4, r0
    ldrb r1, [r2]
    movs r0, #4
    rsbs r0, r0, #0
    ands r0, r1
    orrs r0, r4
    strb r0, [r2]
    add r2, sp, #4
    movs r1, #0xb0
    lsls r1, r1, #1
    movs r3, #0xd8
    adds r0, r2, #0
    strh r1, [r0]
    strh r3, [r2, #2]
    adds r1, #0x38
    strh r1, [r2, #4]
    movs r0, #0xe8
    strh r0, [r2, #6]
    adds r0, r5, #0
    adds r1, r2, #0
    bl func_08037244
    adds r0, r5, #0
    add sp, #0xc
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6}
    pop {r1}
    bx r1
    .align 2, 0
.L08037AC8: .4byte 0x0000071C
.L08037ACC: .4byte vtable_unk_080E72E4

    thumb_func_start func_08037AD0
func_08037AD0: @ 0x08037AD0
    push {r4, r5, r6, lr}
    mov r6, r8
    push {r6}
    sub sp, #0xc
    adds r6, r0, #0
    mov r8, r1
    adds r4, r2, #0
    movs r0, #0x48
    bl __builtin_new
    adds r5, r0, #0
    movs r0, #0xb
    str r0, [sp]
    adds r0, r5, #0
    adds r1, r6, #0
    mov r2, r8
    movs r3, #0xab
    lsls r3, r3, #2
    bl func_08037008
    ldr r0, .L08037B44 @ =vtable_unk_080E72A0
    str r0, [r5, #0x14]
    adds r2, r5, #0
    adds r2, #0x44
    movs r0, #3
    ands r4, r0
    ldrb r1, [r2]
    movs r0, #4
    rsbs r0, r0, #0
    ands r0, r1
    orrs r0, r4
    strb r0, [r2]
    add r3, sp, #4
    movs r1, #0xe6
    lsls r1, r1, #2
    movs r2, #0x90
    lsls r2, r2, #1
    adds r0, r3, #0
    strh r1, [r0]
    strh r2, [r3, #2]
    movs r0, #0xa4
    lsls r0, r0, #1
    adds r1, r1, r0
    strh r1, [r3, #4]
    adds r2, #8
    strh r2, [r3, #6]
    adds r0, r5, #0
    adds r1, r3, #0
    bl func_08037244
    adds r0, r5, #0
    add sp, #0xc
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6}
    pop {r1}
    bx r1
    .align 2, 0
.L08037B44: .4byte vtable_unk_080E72A0

    thumb_func_start func_08037B48
func_08037B48: @ 0x08037B48
    push {r4, r5, r6, lr}
    sub sp, #4
    adds r5, r0, #0
    adds r6, r1, #0
    movs r0, #0x44
    bl __builtin_new
    adds r4, r0, #0
    movs r0, #0xc
    str r0, [sp]
    adds r0, r4, #0
    adds r1, r5, #0
    adds r2, r6, #0
    ldr r3, .L08037B78 @ =0x00000379
    bl func_08037008
    ldr r0, .L08037B7C @ =vtable_unk_080E725C
    str r0, [r4, #0x14]
    adds r0, r4, #0
    add sp, #4
    pop {r4, r5, r6}
    pop {r1}
    bx r1
    .align 2, 0
.L08037B78: .4byte 0x00000379
.L08037B7C: .4byte vtable_unk_080E725C

    thumb_func_start func_08037B80
func_08037B80: @ 0x08037B80
    push {r4, r5, r6, lr}
    sub sp, #4
    adds r5, r0, #0
    adds r6, r1, #0
    movs r0, #0x44
    bl __builtin_new
    adds r4, r0, #0
    movs r0, #0xa
    str r0, [sp]
    adds r0, r4, #0
    adds r1, r5, #0
    adds r2, r6, #0
    ldr r3, .L08037BB0 @ =0x00000207
    bl func_08037008
    ldr r0, .L08037BB4 @ =vtable_unk_080E7218
    str r0, [r4, #0x14]
    adds r0, r4, #0
    add sp, #4
    pop {r4, r5, r6}
    pop {r1}
    bx r1
    .align 2, 0
.L08037BB0: .4byte 0x00000207
.L08037BB4: .4byte vtable_unk_080E7218
    .section .text.after_entity_locbound_run8, "ax", %progbits

    thumb_func_start func_08037C08
func_08037C08: @ 0x08037C08
    .incbin "baserom.gba", 0x37C08, 0x60

    thumb_func_start func_08037C68
func_08037C68: @ 0x08037C68
    .incbin "baserom.gba", 0x37C68, 0x5C

    thumb_func_start func_08037CC4
func_08037CC4: @ 0x08037CC4
    push {r4, lr}
    adds r4, r0, #0
    bl __7AEntityP10GameObjectRC8Location
    ldr r0, .L08037CD8 @ =vtable_unk_080E7444
    str r0, [r4, #0x14]
    adds r0, r4, #0
    pop {r4}
    pop {r1}
    bx r1
    .align 2, 0
.L08037CD8: .4byte vtable_unk_080E7444
.L08037CDC:
    .byte 0x0A, 0x23, 0xCA, 0x5E
    .byte 0x0E, 0x23, 0xC9, 0x5E, 0x02, 0x80, 0x01, 0x31, 0x41, 0x80, 0x82, 0x80, 0xC1, 0x80, 0x70, 0x47

    thumb_func_start func_08037CF0
func_08037CF0: @ 0x08037CF0
    push {r4, lr}
    adds r4, r0, #0
    movs r0, #0x54
    bl __builtin_new
    adds r1, r4, #0
    bl func_08037D08
    pop {r4}
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_08037D08
func_08037D08: @ 0x08037D08
    push {r4, r5, r6, r7, lr}
    sub sp, #8
    adds r7, r0, #0
    adds r4, r1, #0
    str r4, [r7]
    ldr r0, .L08037D68 @ =vtable_unk_080E7478
    str r0, [r7, #4]
    ldr r0, [r4]
    ldr r1, [r0]
    ldr r1, [r1, #0x64]
    bl _call_via_r1
    adds r5, r0, #0
    ldr r1, [r4]
    adds r4, r7, #0
    adds r4, #8
    adds r0, r4, #0
    movs r2, #2
    movs r3, #0xa
    bl func_080A4740
    ldr r0, .L08037D6C @ =vtable_unk_080E602C
    str r0, [r4, #0x24]
    adds r6, r7, #0
    adds r6, #0x30
    ldr r4, [r5]
    mov r0, sp
    ldr r3, [r4, #0xc]
    adds r1, r5, #0
    movs r2, #0x7d
    bl _call_via_r3
    ldr r0, [sp]
    ldrh r2, [r0]
    adds r0, r6, #0
    ldr r3, [r4, #0x10]
    adds r1, r5, #0
    bl _call_via_r3
    adds r1, r7, #0
    adds r1, #0x50
    movs r0, #1
    strb r0, [r1]
    adds r0, r7, #0
    add sp, #8
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    .align 2, 0
.L08037D68: .4byte vtable_unk_080E7478
.L08037D6C: .4byte vtable_unk_080E602C
.L08037D70:
    .byte 0x70, 0x47, 0x00, 0x00

    thumb_func_start func_08037D74
func_08037D74: @ 0x08037D74
    push {r4, r5, r6, r7, lr}
    mov r7, r8
    push {r7}
    sub sp, #0x1c
    adds r4, r0, #0
    ldr r3, [r4]
    movs r0, #0xa
    ldrsh r2, [r3, r0]
    movs r5, #0xc
    ldrsh r0, [r1, r5]
    subs r2, r2, r0
    mov r8, r2
    movs r0, #0xe
    ldrsh r2, [r3, r0]
    movs r3, #0xe
    ldrsh r0, [r1, r3]
    subs r0, r2, r0
    mov ip, r0
    ldr r0, [r1]
    ldr r3, [r1, #8]
    str r0, [sp, #0x14]
    str r3, [sp, #0x18]
    movs r0, #0x80
    lsls r0, r0, #8
    subs r7, r0, r2
    adds r5, r4, #0
    adds r5, #8
    adds r6, r4, #0
    adds r6, #0x30
    ldr r2, [r4, #8]
    ldr r1, [r4, #0x10]
    rsbs r0, r1, #0
    orrs r0, r1
    cmp r0, #0
    bge .L08037DE0
    ldrh r0, [r5, #0xc]
    adds r1, r4, #0
    adds r1, #0x18
    str r7, [sp]
    str r6, [sp, #4]
    str r2, [sp, #8]
    str r0, [sp, #0xc]
    str r1, [sp, #0x10]
    adds r0, r3, #0
    mov r1, r8
    mov r2, ip
    movs r3, #0xaa
    ldr r4, .L08037DDC @ =func_030004DC
    bl _call_via_r4
    b .L08037DE2
    .align 2, 0
.L08037DDC: .4byte func_030004DC
.L08037DE0:
    movs r0, #0
.L08037DE2:
    cmp r0, #0
    beq .L08037E0C
    adds r4, r5, #0
    adds r4, #0x48
    ldrb r0, [r4]
    cmp r0, #0
    beq .L08037E0C
    ldr r1, [sp, #0x14]
    adds r2, r6, #0
    adds r2, #8
    adds r0, r5, #0
    bl func_080A480C
    adds r1, r6, #0
    adds r1, #0x10
    adds r0, r5, #0
    movs r2, #1
    bl func_080A4944
    movs r0, #0
    strb r0, [r4]
.L08037E0C:
    add sp, #0x1c
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0

    thumb_func_start func_08037E18
func_08037E18: @ 0x08037E18
    push {r4, r5, r6, lr}
    sub sp, #8
    adds r4, r0, #0
    adds r5, r1, #0
    adds r6, r2, #0
    mov r0, sp
    adds r1, r6, #0
    bl func_0800FFE0
    adds r0, r4, #0
    adds r1, r5, #0
    mov r2, sp
    bl __7AEntityP10GameObjectRC8Location
    ldr r0, .L08037E44 @ =vtable_unk_080E73FC
    str r0, [r4, #0x14]
    str r6, [r4, #0x18]
    adds r0, r4, #0
    add sp, #8
    pop {r4, r5, r6}
    pop {r1}
    bx r1
    .align 2, 0
.L08037E44: .4byte vtable_unk_080E73FC

    thumb_func_start func_08037E48
func_08037E48: @ 0x08037E48
    push {r4, r5, r6, lr}
    sub sp, #8
    adds r5, r0, #0
    adds r6, r1, #0
    ldr r0, .L08037E94 @ =vtable_unk_080E73FC
    str r0, [r5, #0x14]
    ldr r4, [r5, #0x18]
    mov r0, sp
    adds r1, r5, #0
    bl GetLocation__C7AEntity
    adds r0, r4, #0
    mov r1, sp
    bl func_08010014
    ldr r0, .L08037E98 @ =__vt_7AEntity
    str r0, [r5, #0x14]
    ldr r1, [r5, #0x10]
    cmp r1, #0
    beq .L08037E7C
    ldr r0, [r1, #4]
    ldr r2, [r0, #8]
    adds r0, r1, #0
    movs r1, #3
    bl _call_via_r2
.L08037E7C:
    movs r0, #1
    ands r0, r6
    cmp r0, #0
    beq .L08037E8A
    adds r0, r5, #0
    bl __builtin_delete
.L08037E8A:
    add sp, #8
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L08037E94: .4byte vtable_unk_080E73FC
.L08037E98: .4byte __vt_7AEntity

    thumb_func_start func_08037E9C
func_08037E9C: @ 0x08037E9C
    push {r4, lr}
    adds r4, r0, #0
    movs r0, #0x58
    bl __builtin_new
    adds r1, r4, #0
    bl func_08037EF0
    pop {r4}
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_08037EB4
func_08037EB4: @ 0x08037EB4
    push {r4, lr}
    adds r4, r0, #0
    ldr r0, [r4, #0x18]
    ldrb r1, [r1]
    bl func_0800FFF4
    ldr r0, [r4, #0x10]
    cmp r0, #0
    beq .L08037ECA
    bl func_08037F74
.L08037ECA:
    pop {r4}
    pop {r0}
    bx r0

    thumb_func_start func_08037ED0
func_08037ED0: @ 0x08037ED0
    push {r4, lr}
    movs r3, #0xa
    ldrsh r2, [r1, r3]
    movs r4, #0xe
    ldrsh r3, [r1, r4]
    subs r1, r2, #7
    strh r1, [r0]
    subs r1, r3, #4
    strh r1, [r0, #2]
    adds r2, #7
    strh r2, [r0, #4]
    adds r3, #5
    strh r3, [r0, #6]
    pop {r4}
    pop {r2}
    bx r2

    thumb_func_start func_08037EF0
func_08037EF0: @ 0x08037EF0
    push {r4, r5, r6, r7, lr}
    sub sp, #8
    adds r7, r0, #0
    adds r4, r1, #0
    str r4, [r7]
    ldr r0, .L08037F58 @ =vtable_unk_080E7430
    str r0, [r7, #4]
    ldr r0, [r4]
    ldr r1, [r0]
    ldr r1, [r1, #0x64]
    bl _call_via_r1
    adds r5, r0, #0
    ldr r1, [r4]
    adds r4, r7, #0
    adds r4, #8
    adds r0, r4, #0
    movs r2, #2
    movs r3, #8
    bl func_080A4740
    ldr r0, .L08037F5C @ =vtable_unk_080E602C
    str r0, [r4, #0x24]
    adds r6, r7, #0
    adds r6, #0x30
    ldr r4, [r5]
    mov r0, sp
    ldr r3, [r4, #0xc]
    adds r1, r5, #0
    movs r2, #0x35
    bl _call_via_r3
    ldr r0, [sp]
    ldrh r2, [r0]
    adds r0, r6, #0
    ldr r3, [r4, #0x10]
    adds r1, r5, #0
    bl _call_via_r3
    adds r1, r7, #0
    adds r1, #0x50
    movs r2, #0
    movs r0, #1
    strb r0, [r1]
    adds r0, r7, #0
    adds r0, #0x54
    strb r2, [r0]
    adds r0, r7, #0
    add sp, #8
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    .align 2, 0
.L08037F58: .4byte vtable_unk_080E7430
.L08037F5C: .4byte vtable_unk_080E602C

    thumb_func_start func_08037F60
func_08037F60: @ 0x08037F60
    push {lr}
    adds r1, r0, #0
    adds r1, #0x54
    ldrb r0, [r1]
    cmp r0, #0
    beq .L08037F70
    subs r0, #1
    strb r0, [r1]
.L08037F70:
    pop {r0}
    bx r0

    thumb_func_start func_08037F74
func_08037F74: @ 0x08037F74
    adds r0, #0x54
    movs r1, #0xa
    strb r1, [r0]
    bx lr

    thumb_func_start func_08037F7C
func_08037F7C: @ 0x08037F7C
    push {r4, r5, r6, r7, lr}
    mov r7, r8
    push {r7}
    sub sp, #0x1c
    adds r4, r0, #0
    ldr r3, [r4]
    movs r0, #0xa
    ldrsh r2, [r3, r0]
    movs r5, #0xc
    ldrsh r0, [r1, r5]
    subs r2, r2, r0
    mov r8, r2
    movs r0, #0xe
    ldrsh r3, [r3, r0]
    movs r2, #0xe
    ldrsh r0, [r1, r2]
    subs r2, r3, r0
    ldr r0, [r1]
    ldr r1, [r1, #8]
    mov ip, r1
    str r0, [sp, #0x14]
    str r1, [sp, #0x18]
    adds r0, r4, #0
    adds r0, #0x54
    ldrb r0, [r0]
    cmp r0, #0
    beq .L08037FB4
    subs r2, #2
.L08037FB4:
    movs r0, #0x80
    lsls r0, r0, #8
    subs r7, r0, r3
    adds r5, r4, #0
    adds r5, #8
    adds r6, r4, #0
    adds r6, #0x30
    ldr r3, [r4, #8]
    ldr r1, [r4, #0x10]
    rsbs r0, r1, #0
    orrs r0, r1
    cmp r0, #0
    bge .L08037FF0
    ldrh r0, [r5, #0xc]
    adds r1, r4, #0
    adds r1, #0x18
    str r7, [sp]
    str r6, [sp, #4]
    str r3, [sp, #8]
    str r0, [sp, #0xc]
    str r1, [sp, #0x10]
    mov r0, ip
    mov r1, r8
    movs r3, #0xaa
    ldr r4, .L08037FEC @ =func_030004DC
    bl _call_via_r4
    b .L08037FF2
    .align 2, 0
.L08037FEC: .4byte func_030004DC
.L08037FF0:
    movs r0, #0
.L08037FF2:
    cmp r0, #0
    beq .L0803801C
    adds r4, r5, #0
    adds r4, #0x48
    ldrb r0, [r4]
    cmp r0, #0
    beq .L0803801C
    ldr r1, [sp, #0x14]
    adds r2, r6, #0
    adds r2, #8
    adds r0, r5, #0
    bl func_080A480C
    adds r1, r6, #0
    adds r1, #0x10
    adds r0, r5, #0
    movs r2, #1
    bl func_080A4944
    movs r0, #0
    strb r0, [r4]
.L0803801C:
    add sp, #0x1c
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0

    .section .text.after_ball_ctor, "ax", %progbits


    .section .text.after_ball_run1, "ax", %progbits

    thumb_func_start func_08038110
func_08038110: @ 0x08038110
    push {r4, r5, r6, r7, lr}
    mov r7, r8
    push {r7}
    sub sp, #0x44
    adds r6, r0, #0
    adds r4, r6, #0
    adds r4, #0x25
    ldrb r0, [r4]
    cmp r0, #0
    bne .L08038126
    b .L080382F4
.L08038126:
    ldr r7, [r6]
    ldrh r2, [r6, #4]
    ldr r1, [r7]
    mov r0, sp
    ldr r3, [r1, #0x34]
    adds r1, r7, #0
    bl _call_via_r3
    mov r8, sp
    ldr r1, [r6, #0x20]
    ldr r0, .L080381A0 @ =0xFFFFB85D
    adds r1, r1, r0
    str r1, [r6, #0x20]
    ldr r0, [r6, #0x1c]
    adds r0, r0, r1
    str r0, [r6, #0x1c]
    cmp r0, #0
    bgt .L0803814C
    b .L0803825C
.L0803814C:
    ldr r1, [r6, #0x14]
    add r0, sp, #0x34
    ldr r2, [r1, #0xc]
    adds r1, r6, #0
    bl _call_via_r2
    ldr r1, [sp, #0x34]
    ldr r2, [sp, #0x38]
    str r1, [sp, #0x3c]
    str r2, [sp, #0x40]
    add r5, sp, #0xc
    movs r2, #0x20
    mov r8, r2
    movs r1, #0x21
    str r1, [sp, #0xc]
    movs r0, #0x21
    rsbs r0, r0, #0
    str r0, [r5, #4]
    str r0, [r5, #8]
    str r1, [r5, #0xc]
    add r1, sp, #0x1c
    mov r0, sp
    ldm r0!, {r2, r3, r4}
    stm r1!, {r2, r3, r4}
    ldr r3, [sp, #0x3c]
    ldr r4, [sp, #0x40]
    str r3, [sp, #0x28]
    str r4, [sp, #0x2c]
    mov r4, r8
    str r4, [r5, #0x24]
    ldr r4, [r6, #8]
    ldr r7, [r6, #0xc]
    adds r0, r6, #0
    adds r0, #0x24
    ldrb r0, [r0]
    cmp r0, #1
    beq .L080381AE
    cmp r0, #1
    bgt .L080381A4
    cmp r0, #0
    beq .L080381D4
    b .L08038250
    .align 2, 0
.L080381A0: .4byte 0xFFFFB85D
.L080381A4:
    cmp r0, #2
    beq .L08038230
    cmp r0, #3
    beq .L08038204
    b .L08038250
.L080381AE:
    ldr r1, [sp, #0x10]
    ldr r0, [sp, #0x30]
    cmn r1, r0
    bge .L080381C0
    adds r0, r5, #0
    bl func_080ABBC4
    ldr r0, [sp, #0x10]
    b .L080381C2
.L080381C0:
    adds r0, r1, #0
.L080381C2:
    lsls r1, r0, #0x10
    ldr r0, .L080381D0 @ =0xFFFE38E4
    cmp r1, r0
    bgt .L080381F0
    ldr r5, .L080381D0 @ =0xFFFE38E4
    adds r7, r7, r5
    b .L08038250
    .align 2, 0
.L080381D0: .4byte 0xFFFE38E4
.L080381D4:
    ldr r1, [sp, #0xc]
    ldr r0, [sp, #0x30]
    cmp r1, r0
    ble .L080381E6
    adds r0, r5, #0
    bl func_080ABBA0
    ldr r0, [sp, #0xc]
    b .L080381E8
.L080381E6:
    adds r0, r1, #0
.L080381E8:
    lsls r1, r0, #0x10
    ldr r0, .L080381F4 @ =0x0001C71B
    cmp r1, r0
    bgt .L080381F8
.L080381F0:
    adds r7, r7, r1
    b .L08038250
    .align 2, 0
.L080381F4: .4byte 0x0001C71B
.L080381F8:
    ldr r0, .L08038200 @ =0x0001C71C
    adds r7, r7, r0
    b .L08038250
    .align 2, 0
.L08038200: .4byte 0x0001C71C
.L08038204:
    ldr r1, [sp, #0x18]
    ldr r0, [sp, #0x30]
    cmp r1, r0
    ble .L08038216
    adds r0, r5, #0
    bl func_080ABC14
    ldr r0, [sp, #0x18]
    b .L08038218
.L08038216:
    adds r0, r1, #0
.L08038218:
    lsls r1, r0, #0x10
    ldr r0, .L08038228 @ =0x0001C71B
    cmp r1, r0
    ble .L08038222
    ldr r1, .L0803822C @ =0x0001C71C
.L08038222:
    adds r4, r4, r1
    b .L08038250
    .align 2, 0
.L08038228: .4byte 0x0001C71B
.L0803822C: .4byte 0x0001C71C
.L08038230:
    ldr r1, [sp, #0x14]
    ldr r0, [sp, #0x30]
    cmn r1, r0
    bge .L08038242
    adds r0, r5, #0
    bl func_080ABBEC
    ldr r0, [sp, #0x14]
    b .L08038244
.L08038242:
    adds r0, r1, #0
.L08038244:
    lsls r1, r0, #0x10
    ldr r0, .L08038258 @ =0xFFFE38E4
    cmp r1, r0
    bgt .L08038222
    ldr r2, .L08038258 @ =0xFFFE38E4
    adds r4, r4, r2
.L08038250:
    str r4, [r6, #8]
    str r7, [r6, #0xc]
    b .L080382F4
    .align 2, 0
.L08038258: .4byte 0xFFFE38E4
.L0803825C:
    movs r0, #0
    str r0, [r6, #0x1c]
    strb r0, [r4]
    add r4, sp, #0xc
    adds r0, r4, #0
    adds r1, r6, #0
    bl GetLocation__C7AEntity
    ldr r0, [r6, #0x18]
    adds r1, r4, #0
    movs r2, #6
    bl memcpy
    ldr r0, [r6, #8]
    ldr r1, [r6, #0xc]
    asrs r0, r0, #0x13
    mov ip, r0
    asrs r3, r1, #0x13
    ldr r1, [sp]
    mov r5, r8
    ldrh r0, [r5, #8]
    cmp r1, #0
    beq .L080382A8
    cmp ip, r0
    bhi .L080382A8
    ldrh r2, [r5, #0xa]
    cmp r3, r2
    bhi .L080382A8
    ldr r2, [sp, #4]
    muls r0, r3, r0
    add r0, ip
    cmp r2, #0
    beq .L080382A2
    adds r0, r2, r0
    ldrb r0, [r0]
.L080382A2:
    lsls r0, r0, #2
    adds r0, r1, r0
    b .L080382AA
.L080382A8:
    movs r0, #0
.L080382AA:
    cmp r0, #0
    bne .L080382C2
    ldr r0, [r7]
    movs r3, #0x9e
    lsls r3, r3, #1
    adds r0, r0, r3
    ldr r2, [r0]
    adds r0, r7, #0
    movs r1, #1
    bl _call_via_r2
    b .L080382F4
.L080382C2:
    ldr r0, [r0]
    lsls r0, r0, #0x1e
    cmp r0, #0
    bge .L080382DE
    ldr r0, [r7]
    movs r4, #0x9e
    lsls r4, r4, #1
    adds r0, r0, r4
    ldr r2, [r0]
    adds r0, r7, #0
    movs r1, #0
    bl _call_via_r2
    b .L080382F4
.L080382DE:
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2b
    bl _call_via_r2
    cmp r0, #0
    beq .L080382F4
    adds r1, r4, #0
    bl func_0802151C
.L080382F4:
    add sp, #0x44
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0

    .section .text.after_ball_run2, "ax", %progbits


    thumb_func_start func_08038398
func_08038398: @ 0x08038398
    push {r4, r5, r6, lr}
    adds r5, r0, #0
    movs r3, #0x15
    ldr r4, .L080383B4 @ =0xFFFFFCC8
    adds r0, r1, r4
    cmp r0, #0x3d
    bls .L080383A8
    b .L080384CA
.L080383A8:
    lsls r0, r0, #2
    ldr r1, .L080383B8 @ =.L080383BC
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L080383B4: .4byte 0xFFFFFCC8
.L080383B8: .4byte .L080383BC
.L080383BC: @ jump table
    .4byte .L080384CA @ case 0
    .4byte .L080384CA @ case 1
    .4byte .L080384CA @ case 2
    .4byte .L080384CA @ case 3
    .4byte .L080384B4 @ case 4
    .4byte .L080384CA @ case 5
    .4byte .L080384CA @ case 6
    .4byte .L080384CA @ case 7
    .4byte .L080384B8 @ case 8
    .4byte .L080384CA @ case 9
    .4byte .L080384CA @ case 10
    .4byte .L080384CA @ case 11
    .4byte .L080384BC @ case 12
    .4byte .L080384CA @ case 13
    .4byte .L080384CA @ case 14
    .4byte .L080384CA @ case 15
    .4byte .L080384C0 @ case 16
    .4byte .L080384CA @ case 17
    .4byte .L080384CA @ case 18
    .4byte .L080384CA @ case 19
    .4byte .L080384C4 @ case 20
    .4byte .L080384CA @ case 21
    .4byte .L080384CA @ case 22
    .4byte .L080384CA @ case 23
    .4byte .L080384CA @ case 24
    .4byte .L080384CA @ case 25
    .4byte .L080384CA @ case 26
    .4byte .L080384CA @ case 27
    .4byte .L080384CA @ case 28
    .4byte .L080384CA @ case 29
    .4byte .L080384CA @ case 30
    .4byte .L080384CA @ case 31
    .4byte .L080384CA @ case 32
    .4byte .L080384CA @ case 33
    .4byte .L080384CA @ case 34
    .4byte .L080384CA @ case 35
    .4byte .L080384CA @ case 36
    .4byte .L080384CA @ case 37
    .4byte .L080384CA @ case 38
    .4byte .L080384CA @ case 39
    .4byte .L080384CA @ case 40
    .4byte .L080384CA @ case 41
    .4byte .L080384CA @ case 42
    .4byte .L080384CA @ case 43
    .4byte .L080384CA @ case 44
    .4byte .L080384CA @ case 45
    .4byte .L080384CA @ case 46
    .4byte .L080384CA @ case 47
    .4byte .L080384CA @ case 48
    .4byte .L080384CA @ case 49
    .4byte .L080384CA @ case 50
    .4byte .L080384CA @ case 51
    .4byte .L080384CA @ case 52
    .4byte .L080384CA @ case 53
    .4byte .L080384CA @ case 54
    .4byte .L080384CA @ case 55
    .4byte .L080384CA @ case 56
    .4byte .L080384CA @ case 57
    .4byte .L080384CA @ case 58
    .4byte .L080384CA @ case 59
    .4byte .L080384CA @ case 60
    .4byte .L080384C8 @ case 61
.L080384B4:
    movs r3, #0x19
    b .L080384CA
.L080384B8:
    movs r3, #0x1d
    b .L080384CA
.L080384BC:
    movs r3, #0x21
    b .L080384CA
.L080384C0:
    movs r3, #0x25
    b .L080384CA
.L080384C4:
    movs r3, #0x29
    b .L080384CA
.L080384C8:
    movs r3, #0x2d
.L080384CA:
    adds r1, r3, r2
    adds r6, r1, #0
    ldrh r0, [r5, #0x28]
    cmp r1, r0
    beq .L080384F6
    ldr r4, [r5, #0x10]
    cmp r4, #0
    beq .L080384F4
    adds r0, r4, #0
    adds r0, #0x30
    bl func_0805E860
    adds r0, r4, #0
    adds r0, #0x44
    movs r2, #0
    movs r1, #1
    strb r1, [r0]
    adds r0, #2
    strb r2, [r0]
    adds r0, #1
    strb r1, [r0]
.L080384F4:
    strh r6, [r5, #0x28]
.L080384F6:
    pop {r4, r5, r6}
    pop {r0}
    bx r0

    .section .text.after_ball_reset_dog_play, "ax", %progbits
    thumb_func_start func_0803853C
func_0803853C: @ 0x0803853C
    push {r4, r5, r6, lr}
    sub sp, #0xc
    adds r6, r0, #0
    adds r4, r1, #0
    str r4, [r6]
    ldr r0, .L0803857C @ =vtable_unk_080E73E8
    str r0, [r6, #4]
    ldr r0, [r4]
    ldr r1, [r0]
    ldr r1, [r1, #0x64]
    bl _call_via_r1
    adds r1, r0, #0
    ldr r3, [r4]
    adds r0, r6, #0
    adds r0, #8
    ldrh r2, [r4, #0x28]
    movs r4, #2
    str r4, [sp]
    movs r4, #7
    str r4, [sp, #4]
    add r5, sp, #8
    movs r4, #0
    strb r4, [r5]
    bl func_080A4A00
    adds r0, r6, #0
    add sp, #0xc
    pop {r4, r5, r6}
    pop {r1}
    bx r1
    .align 2, 0
.L0803857C: .4byte vtable_unk_080E73E8

    .section .text.after_ball_controller_update, "ax", %progbits

    thumb_func_start func_080385B0
func_080385B0: @ 0x080385B0
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #0x50
    adds r5, r0, #0
    mov sl, r1
    ldr r0, [r5]
    mov sb, r0
    movs r1, #0xa
    ldrsh r6, [r0, r1]
    mov r2, sl
    movs r3, #0xc
    ldrsh r0, [r2, r3]
    subs r0, r6, r0
    str r0, [sp, #0x3c]
    mov r0, sb
    movs r1, #0xe
    ldrsh r4, [r0, r1]
    movs r3, #0xe
    ldrsh r0, [r2, r3]
    subs r0, r4, r0
    str r0, [sp, #0x40]
    mov r0, sb
    adds r0, #0x26
    ldrb r0, [r0]
    str r0, [sp, #0x44]
    movs r0, #0x80
    lsls r0, r0, #8
    subs r0, r0, r4
    mov r8, r0
    ldr r0, [sp, #0x44]
    cmp r0, #0
    beq .L080385FC
    movs r1, #1
    rsbs r1, r1, #0
    add r8, r1
.L080385FC:
    add r0, sp, #0x34
    mov r2, sl
    ldr r1, [r2]
    ldr r2, [r2, #8]
    str r1, [sp, #0x34]
    str r2, [r0, #4]
    ldr r3, [sp, #0x40]
    str r3, [sp, #0x48]
    movs r7, #2
    ldr r0, [sp, #0x44]
    cmp r0, #0
    bne .L08038646
    mov r0, sb
    bl func_0803836C
    ldr r1, [sp, #0x40]
    subs r1, r1, r0
    str r1, [sp, #0x48]
    cmp r0, #0xf
    ble .L08038646
    mov r2, sb
    ldrh r0, [r2, #4]
    cmp r0, #8
    bgt .L08038644
    cmp r0, #2
    bne .L08038646
    ldr r3, .L080386AC @ =0xFFFFFEF0
    adds r1, r6, r3
    ldr r0, .L080386B0 @ =0x000002AF
    cmp r1, r0
    bhi .L08038646
    cmp r4, #0xaf
    ble .L08038646
    subs r0, #0x60
    cmp r4, r0
    bgt .L08038646
.L08038644:
    movs r7, #1
.L08038646:
    adds r6, r5, #0
    adds r6, #8
    mov r0, sp
    adds r0, #0x34
    str r0, [sp, #0x4c]
    adds r0, r7, #0
    lsls r4, r0, #2
    orrs r4, r0
    lsls r1, r0, #4
    orrs r4, r1
    lsls r0, r0, #6
    orrs r4, r0
    ldr r1, [r5, #0x30]
    ldr r3, [r1]
    ldrh r2, [r5, #0x3c]
    lsls r2, r2, #2
    ldr r0, [r5, #0x34]
    adds r0, r0, r2
    ldrh r2, [r0]
    add r0, sp, #0x14
    ldr r3, [r3, #0x10]
    bl _call_via_r3
    add r7, sp, #0x14
    ldr r1, [sp, #0x4c]
    ldr r3, [r1, #4]
    ldr r2, [r5, #8]
    ldr r1, [r5, #0x10]
    rsbs r0, r1, #0
    orrs r0, r1
    cmp r0, #0
    bge .L080386B8
    ldrh r0, [r6, #0xc]
    adds r1, r5, #0
    adds r1, #0x18
    mov r5, r8
    str r5, [sp]
    adds r5, r7, #0
    str r5, [sp, #4]
    str r2, [sp, #8]
    str r0, [sp, #0xc]
    str r1, [sp, #0x10]
    adds r0, r3, #0
    ldr r1, [sp, #0x3c]
    ldr r2, [sp, #0x48]
    adds r3, r4, #0
    ldr r4, .L080386B4 @ =func_030004DC
    bl _call_via_r4
    b .L080386BA
    .align 2, 0
.L080386AC: .4byte 0xFFFFFEF0
.L080386B0: .4byte 0x000002AF
.L080386B4: .4byte func_030004DC
.L080386B8:
    movs r0, #0
.L080386BA:
    cmp r0, #0
    beq .L0803870E
    adds r0, r6, #0
    adds r0, #0x3c
    ldrb r1, [r0]
    adds r5, r0, #0
    cmp r1, #0
    beq .L0803870E
    ldr r0, [sp, #0x4c]
    ldr r1, [r0]
    adds r2, r7, #0
    adds r2, #8
    adds r0, r6, #0
    bl func_080A480C
    adds r0, r6, #0
    adds r0, #0x3d
    ldrb r0, [r0]
    cmp r0, #0
    beq .L080386F0
    adds r1, r7, #0
    adds r1, #0x10
    adds r0, r6, #0
    movs r2, #1
    bl func_080A4944
    b .L0803870A
.L080386F0:
    adds r4, r6, #0
    adds r4, #0x3e
    ldrb r0, [r4]
    cmp r0, #0
    bne .L0803870A
    adds r1, r7, #0
    adds r1, #0x10
    adds r0, r6, #0
    movs r2, #1
    bl func_080A4944
    movs r0, #1
    strb r0, [r4]
.L0803870A:
    movs r0, #0
    strb r0, [r5]
.L0803870E:
    ldr r1, [sp, #0x44]
    cmp r1, #0
    bne .L08038730
    mov r2, sb
    ldr r0, [r2]
    ldr r1, [r0]
    ldr r1, [r1, #0x58]
    bl _call_via_r1
    mov r3, sl
    ldr r1, [r3, #8]
    ldr r5, [sp, #0x44]
    str r5, [sp]
    ldr r2, [sp, #0x3c]
    ldr r3, [sp, #0x40]
    bl func_0803AE58
.L08038730:
    add sp, #0x50
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0

    .section .text.after_entity38740_0c, "ax", %progbits
    thumb_func_start func_08038820
func_08038820: @ 0x08038820
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #8
    adds r7, r0, #0
    mov sb, r1
    str r1, [r7]
    ldr r0, .L0803889C @ =vtable_unk_080E736C
    str r0, [r7, #4]
    ldr r0, [r1, #0x18]
    adds r0, #0x54
    ldrb r0, [r0]
    lsls r0, r0, #0x19
    lsrs r0, r0, #0x1e
    mov sl, r0
    cmp r0, #1
    bne .L080388A4
    movs r0, #0x4c
    bl __builtin_new
    adds r6, r0, #0
    mov r0, sb
    ldr r4, [r0]
    ldr r0, [r4]
    ldr r1, [r0, #0x74]
    adds r0, r4, #0
    bl _call_via_r1
    adds r5, r0, #0
    adds r0, r6, #0
    adds r1, r4, #0
    movs r2, #6
    movs r3, #0x1b
    bl func_080A4740
    ldr r0, .L080388A0 @ =vtable_unk_080E602C
    str r0, [r6, #0x24]
    movs r1, #0x28
    adds r1, r1, r6
    mov r8, r1
    ldr r4, [r5]
    mov r0, sp
    ldr r3, [r4, #0xc]
    adds r1, r5, #0
    movs r2, #0
    bl _call_via_r3
    ldr r0, [sp]
    ldrh r2, [r0]
    mov r0, r8
    ldr r3, [r4, #0x10]
    adds r1, r5, #0
    bl _call_via_r3
    adds r0, r6, #0
    adds r0, #0x48
    mov r5, sl
    strb r5, [r0]
    b .L080388A6
    .align 2, 0
.L0803889C: .4byte vtable_unk_080E736C
.L080388A0: .4byte vtable_unk_080E602C
.L080388A4:
    movs r6, #0
.L080388A6:
    str r6, [r7, #8]
    movs r0, #0
    str r0, [r7, #0xc]
    str r0, [r7, #0x10]
    adds r4, r7, #0
    adds r4, #0x14
    str r0, [r7, #0x14]
    movs r0, #0xca
    lsls r0, r0, #1
    bl __builtin_new
    adds r3, r0, #0
    ldr r0, [r7]
    ldr r1, [r0]
    movs r2, #0
    mov r5, sb
    ldr r0, [r5, #0x18]
    adds r0, #0x5d
    ldrb r0, [r0]
    lsls r0, r0, #0x1c
    lsrs r0, r0, #0x1e
    cmp r0, #1
    bne .L080388D6
    movs r2, #1
.L080388D6:
    adds r0, r3, #0
    bl func_080DCB7C
    mov sb, r4
    mov r8, r0
    ldr r6, [r7, #0x14]
    cmp r8, r6
    beq .L08038910
    cmp r6, #0
    beq .L08038910
    ldr r1, [r6]
    lsls r0, r1, #2
    adds r0, r0, r1
    lsls r0, r0, #4
    adds r0, #4
    adds r5, r6, r0
    adds r4, r6, #4
    cmp r4, r5
    beq .L0803890A
.L080388FC:
    adds r0, r4, #0
    movs r1, #2
    bl func_080A47B4
    adds r4, #0x50
    cmp r4, r5
    bne .L080388FC
.L0803890A:
    adds r0, r6, #0
    bl __builtin_delete
.L08038910:
    mov r0, r8
    mov r1, sb
    str r0, [r1]
    adds r0, r7, #0
    add sp, #8
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1

    thumb_func_start func_08038928
func_08038928: @ 0x08038928
    push {r4, r5, r6, r7, lr}
    mov r7, sb
    mov r6, r8
    push {r6, r7}
    sub sp, #4
    mov r8, r0
    ldr r0, [r0, #0x14]
    cmp r0, #0
    beq .L0803898A
    adds r6, r0, #0
    movs r7, #0
    ldr r0, [r6]
    cmp r7, r0
    bhs .L0803898A
    adds r4, r6, #0
    adds r4, #0x40
    adds r5, r6, #0
    adds r5, #0x2c
.L0803894C:
    ldrb r0, [r4, #3]
    cmp r0, #0
    bne .L08038964
    adds r0, r5, #0
    bl func_0805E8F0
    lsls r0, r0, #0x1e
    cmp r0, #0
    bge .L08038968
    movs r0, #1
    strb r0, [r4]
    b .L08038968
.L08038964:
    movs r0, #0
    strb r0, [r4, #3]
.L08038968:
    ldr r1, [r4, #4]
    ldr r0, [r4, #0xc]
    subs r1, r1, r0
    str r1, [r4, #4]
    ldrb r0, [r4, #0x10]
    lsls r0, r0, #0x10
    cmn r1, r0
    bge .L0803897E
    movs r0, #0xf0
    lsls r0, r0, #0x11
    str r0, [r4, #4]
.L0803897E:
    adds r4, #0x50
    adds r5, #0x50
    adds r7, #1
    ldr r0, [r6]
    cmp r7, r0
    blo .L0803894C
.L0803898A:
    mov r0, r8
    ldr r1, [r0, #0xc]
    cmp r1, #0
    beq .L080389B2
    adds r3, r1, #0
    adds r3, #0x50
    ldrb r0, [r3]
    cmp r0, #0
    beq .L080389B2
    ldr r0, [r1, #0x4c]
    ldr r2, .L080389F4 @ =0xFFFF8000
    adds r0, r0, r2
    str r0, [r1, #0x4c]
    movs r2, #0xa8
    lsls r2, r2, #0x10
    cmp r0, r2
    bgt .L080389B2
    str r2, [r1, #0x4c]
    movs r0, #0
    strb r0, [r3]
.L080389B2:
    mov r1, r8
    ldr r0, [r1, #0x10]
    cmp r0, #0
    beq .L08038A60
    movs r2, #0
    movs r7, #0
    movs r1, #0xa2
    lsls r1, r1, #1
    adds r5, r0, r1
    adds r4, r0, #0
    adds r4, #0x2c
    adds r6, r0, #0
    adds r6, #0x43
.L080389CC:
    ldrb r1, [r5]
    cmp r1, #0
    bne .L08038A08
    ldrb r0, [r4, #0x17]
    cmp r0, #0
    bne .L080389F8
    adds r0, r4, #0
    str r2, [sp]
    bl func_0805E8F0
    adds r1, r0, #0
    lsls r0, r1, #0x1e
    ldr r2, [sp]
    cmp r0, #0
    bge .L080389EE
    movs r0, #1
    strb r0, [r4, #0x14]
.L080389EE:
    adds r0, r1, #0
    b .L080389FC
    .align 2, 0
.L080389F4: .4byte 0xFFFF8000
.L080389F8:
    strb r1, [r6]
    movs r0, #2
.L080389FC:
    lsls r0, r0, #0x1d
    cmp r0, #0
    bge .L08038A0A
    movs r0, #1
    strb r0, [r5]
    b .L08038A0A
.L08038A08:
    adds r2, #1
.L08038A0A:
    adds r5, #1
    adds r4, #0x40
    adds r6, #0x40
    adds r7, #1
    cmp r7, #4
    bls .L080389CC
    movs r0, #0
    cmp r2, #5
    bne .L08038A1E
    movs r0, #1
.L08038A1E:
    cmp r0, #0
    beq .L08038A60
    mov r7, r8
    adds r7, #0x10
    movs r2, #0
    mov sb, r2
    mov r0, r8
    ldr r6, [r0, #0x10]
    cmp sb, r6
    beq .L08038A5C
    cmp r6, #0
    beq .L08038A5C
    ldr r0, [r6]
    lsls r0, r0, #6
    adds r0, #4
    adds r5, r6, r0
    adds r4, r6, #4
    cmp r4, r5
    beq .L08038A56
.L08038A44:
    ldr r0, [r4, #0x24]
    ldr r2, [r0, #8]
    adds r0, r4, #0
    movs r1, #2
    bl _call_via_r2
    adds r4, #0x40
    cmp r4, r5
    bne .L08038A44
.L08038A56:
    adds r0, r6, #0
    bl __builtin_delete
.L08038A5C:
    mov r1, sb
    str r1, [r7]
.L08038A60:
    add sp, #4
    pop {r3, r4}
    mov r8, r3
    mov sb, r4
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_08038A70
func_08038A70: @ 0x08038A70
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #0x8c
    str r0, [sp, #0x5c]
    movs r2, #0xc
    ldrsh r0, [r1, r2]
    str r0, [sp, #0x60]
    movs r2, #0xe
    ldrsh r0, [r1, r2]
    str r0, [sp, #0x64]
    ldr r0, [r1]
    ldr r1, [r1, #8]
    str r0, [sp, #0x34]
    str r1, [sp, #0x38]
    ldr r1, [sp, #0x5c]
    ldr r0, [r1, #0x14]
    cmp r0, #0
    bne .L08038A9C
    b .L08038BA2
.L08038A9C:
    str r0, [sp, #0x68]
    ldr r0, [sp, #0x34]
    ldr r1, [sp, #0x38]
    str r0, [sp, #0x6c]
    str r1, [sp, #0x70]
    movs r1, #0
    str r1, [sp, #0x74]
    ldr r2, [sp, #0x68]
    ldr r0, [r2]
    cmp r1, r0
    bhs .L08038BA2
    adds r5, r2, #0
    adds r5, #0x40
    adds r2, #0x14
    str r2, [sp, #0x88]
    ldr r6, [sp, #0x68]
    adds r6, #4
.L08038ABE:
    ldr r0, [sp, #0x6c]
    ldr r1, [sp, #0x70]
    str r0, [sp, #0x3c]
    str r1, [sp, #0x40]
    ldrb r0, [r5, #0x11]
    cmp r0, #0
    beq .L08038B86
    movs r1, #6
    ldrsh r0, [r5, r1]
    ldr r2, [sp, #0x60]
    subs r2, r0, r2
    mov sb, r2
    movs r1, #8
    ldrsh r0, [r5, r1]
    ldr r2, [sp, #0x64]
    subs r4, r0, r2
    ldr r0, .L08038B30 @ =0x00007FFF
    mov sl, r0
    add r1, sp, #0x3c
    mov r8, r1
    ldr r1, [r6, #0x28]
    ldr r3, [r1]
    ldrh r2, [r6, #0x34]
    lsls r2, r2, #2
    ldr r0, [r6, #0x2c]
    adds r0, r0, r2
    ldrh r2, [r0]
    add r0, sp, #0x14
    ldr r3, [r3, #0x10]
    bl _call_via_r3
    add r7, sp, #0x14
    mov r2, r8
    ldr r3, [r2, #4]
    ldr r2, [r6]
    ldr r1, [r6, #8]
    rsbs r0, r1, #0
    orrs r0, r1
    cmp r0, #0
    bge .L08038B38
    ldrh r0, [r6, #0xc]
    mov r1, sl
    str r1, [sp]
    adds r1, r7, #0
    str r1, [sp, #4]
    str r2, [sp, #8]
    str r0, [sp, #0xc]
    ldr r2, [sp, #0x88]
    str r2, [sp, #0x10]
    adds r0, r3, #0
    mov r1, sb
    adds r2, r4, #0
    movs r3, #0xff
    ldr r4, .L08038B34 @ =func_030004DC
    bl _call_via_r4
    b .L08038B3A
    .align 2, 0
.L08038B30: .4byte 0x00007FFF
.L08038B34: .4byte func_030004DC
.L08038B38:
    movs r0, #0
.L08038B3A:
    cmp r0, #0
    beq .L08038B82
    ldrb r0, [r5]
    adds r4, r5, #0
    cmp r0, #0
    beq .L08038B82
    mov r0, r8
    ldr r1, [r0]
    adds r2, r7, #0
    adds r2, #8
    adds r0, r6, #0
    bl func_080A480C
    ldrb r0, [r5, #1]
    cmp r0, #0
    beq .L08038B68
    adds r1, r7, #0
    adds r1, #0x10
    adds r0, r6, #0
    movs r2, #1
    bl func_080A4944
    b .L08038B7E
.L08038B68:
    ldrb r0, [r5, #2]
    cmp r0, #0
    bne .L08038B7E
    adds r1, r7, #0
    adds r1, #0x10
    adds r0, r6, #0
    movs r2, #1
    bl func_080A4944
    movs r0, #1
    strb r0, [r5, #2]
.L08038B7E:
    movs r0, #0
    strb r0, [r4]
.L08038B82:
    movs r0, #0
    b .L08038B88
.L08038B86:
    movs r0, #1
.L08038B88:
    strb r0, [r5, #0x11]
    adds r5, #0x50
    ldr r1, [sp, #0x88]
    adds r1, #0x50
    str r1, [sp, #0x88]
    adds r6, #0x50
    ldr r2, [sp, #0x74]
    adds r2, #1
    str r2, [sp, #0x74]
    ldr r1, [sp, #0x68]
    ldr r0, [r1]
    cmp r2, r0
    blo .L08038ABE
.L08038BA2:
    ldr r2, [sp, #0x5c]
    ldr r0, [r2, #8]
    cmp r0, #0
    beq .L08038C30
    adds r5, r0, #0
    ldr r0, [sp, #0x34]
    ldr r1, [sp, #0x38]
    str r0, [sp, #0x44]
    str r1, [sp, #0x48]
    movs r0, #0x96
    lsls r0, r0, #1
    ldr r1, [sp, #0x60]
    subs r1, r0, r1
    mov sb, r1
    movs r0, #0x64
    ldr r2, [sp, #0x64]
    subs r2, r0, r2
    mov r8, r2
    add r7, sp, #0x44
    adds r6, r5, #0
    adds r6, #0x28
    ldr r4, [r7, #4]
    adds r0, r5, #0
    ldm r0!, {r3}
    ldr r1, [r0, #4]
    rsbs r0, r1, #0
    orrs r0, r1
    cmp r0, #0
    bge .L08038C04
    ldrh r1, [r5, #0xc]
    adds r2, r5, #0
    adds r2, #0x10
    movs r0, #0x80
    lsls r0, r0, #8
    str r0, [sp]
    str r6, [sp, #4]
    str r3, [sp, #8]
    str r1, [sp, #0xc]
    str r2, [sp, #0x10]
    adds r0, r4, #0
    mov r1, sb
    mov r2, r8
    movs r3, #0xff
    ldr r4, .L08038C00 @ =func_030004DC
    bl _call_via_r4
    b .L08038C06
    .align 2, 0
.L08038C00: .4byte func_030004DC
.L08038C04:
    movs r0, #0
.L08038C06:
    cmp r0, #0
    beq .L08038C30
    adds r4, r5, #0
    adds r4, #0x48
    ldrb r0, [r4]
    cmp r0, #0
    beq .L08038C30
    ldr r1, [r7]
    adds r2, r6, #0
    adds r2, #8
    adds r0, r5, #0
    bl func_080A480C
    adds r1, r6, #0
    adds r1, #0x10
    adds r0, r5, #0
    movs r2, #1
    bl func_080A4944
    movs r0, #0
    strb r0, [r4]
.L08038C30:
    ldr r1, [sp, #0x5c]
    ldr r0, [r1, #0xc]
    cmp r0, #0
    beq .L08038CC8
    adds r5, r0, #0
    ldr r0, [sp, #0x34]
    ldr r1, [sp, #0x38]
    str r0, [sp, #0x4c]
    str r1, [sp, #0x50]
    adds r0, r5, #0
    adds r0, #0x51
    ldrb r0, [r0]
    lsls r0, r0, #3
    ldr r1, [sp, #0x60]
    subs r1, #0xf0
    subs r0, r0, r1
    mov sb, r0
    ldr r0, [r5, #0x4c]
    asrs r0, r0, #0x10
    ldr r2, [sp, #0x64]
    subs r2, r0, r2
    mov r8, r2
    add r7, sp, #0x4c
    adds r6, r5, #0
    adds r6, #0x28
    ldr r4, [r7, #4]
    adds r0, r5, #0
    ldm r0!, {r3}
    ldr r1, [r0, #4]
    rsbs r0, r1, #0
    orrs r0, r1
    cmp r0, #0
    bge .L08038C9C
    ldrh r1, [r5, #0xc]
    adds r2, r5, #0
    adds r2, #0x10
    movs r0, #0x80
    lsls r0, r0, #8
    str r0, [sp]
    str r6, [sp, #4]
    str r3, [sp, #8]
    str r1, [sp, #0xc]
    str r2, [sp, #0x10]
    adds r0, r4, #0
    mov r1, sb
    mov r2, r8
    movs r3, #0xff
    ldr r4, .L08038C98 @ =func_030004DC
    bl _call_via_r4
    b .L08038C9E
    .align 2, 0
.L08038C98: .4byte func_030004DC
.L08038C9C:
    movs r0, #0
.L08038C9E:
    cmp r0, #0
    beq .L08038CC8
    adds r4, r5, #0
    adds r4, #0x48
    ldrb r0, [r4]
    cmp r0, #0
    beq .L08038CC8
    ldr r1, [r7]
    adds r2, r6, #0
    adds r2, #8
    adds r0, r5, #0
    bl func_080A480C
    adds r1, r6, #0
    adds r1, #0x10
    adds r0, r5, #0
    movs r2, #0
    bl func_080A4944
    movs r0, #0
    strb r0, [r4]
.L08038CC8:
    ldr r1, [sp, #0x5c]
    ldr r0, [r1, #0x10]
    cmp r0, #0
    bne .L08038CD2
    b .L08038DE0
.L08038CD2:
    str r0, [sp, #0x78]
    ldr r0, [sp, #0x34]
    ldr r1, [sp, #0x38]
    str r0, [sp, #0x54]
    str r1, [sp, #0x58]
    movs r2, #0
    str r2, [sp, #0x7c]
    ldr r0, [sp, #0x78]
    adds r0, #0x14
    str r0, [sp, #0x80]
    ldr r1, .L08038D68 @ =gUnk_080F165E
    str r1, [sp, #0x84]
    ldr r5, [sp, #0x78]
    adds r5, #4
.L08038CEE:
    ldr r2, [sp, #0x78]
    movs r1, #0xa2
    lsls r1, r1, #1
    adds r0, r2, r1
    ldr r2, [sp, #0x7c]
    adds r0, r0, r2
    ldrb r0, [r0]
    cmp r0, #0
    bne .L08038DC8
    ldr r1, [sp, #0x84]
    ldrh r0, [r1]
    ldr r2, [sp, #0x60]
    subs r2, r0, r2
    mov sb, r2
    ldrh r0, [r1, #2]
    ldr r1, [sp, #0x64]
    subs r4, r0, r1
    adds r6, r5, #0
    movs r2, #0x80
    lsls r2, r2, #8
    mov sl, r2
    add r0, sp, #0x54
    mov r8, r0
    ldr r1, [r5, #0x28]
    ldr r3, [r1]
    ldrh r2, [r5, #0x34]
    lsls r2, r2, #2
    ldr r0, [r5, #0x2c]
    adds r0, r0, r2
    ldrh r2, [r0]
    add r0, sp, #0x14
    ldr r3, [r3, #0x10]
    bl _call_via_r3
    add r7, sp, #0x14
    mov r1, r8
    ldr r3, [r1, #4]
    ldr r2, [r5]
    ldr r1, [r5, #8]
    rsbs r0, r1, #0
    orrs r0, r1
    cmp r0, #0
    bge .L08038D70
    ldrh r0, [r5, #0xc]
    mov r1, sl
    str r1, [sp]
    adds r1, r7, #0
    str r1, [sp, #4]
    str r2, [sp, #8]
    str r0, [sp, #0xc]
    ldr r2, [sp, #0x80]
    str r2, [sp, #0x10]
    adds r0, r3, #0
    mov r1, sb
    adds r2, r4, #0
    movs r3, #0xff
    ldr r4, .L08038D6C @ =func_030004DC
    bl _call_via_r4
    b .L08038D72
    .align 2, 0
.L08038D68: .4byte gUnk_080F165E
.L08038D6C: .4byte func_030004DC
.L08038D70:
    movs r0, #0
.L08038D72:
    cmp r0, #0
    beq .L08038DC8
    adds r0, r6, #0
    adds r0, #0x3c
    ldrb r1, [r0]
    mov sb, r0
    cmp r1, #0
    beq .L08038DC8
    mov r0, r8
    ldr r1, [r0]
    adds r2, r7, #0
    adds r2, #8
    adds r0, r6, #0
    bl func_080A480C
    adds r0, r6, #0
    adds r0, #0x3d
    ldrb r0, [r0]
    cmp r0, #0
    beq .L08038DA8
    adds r1, r7, #0
    adds r1, #0x10
    adds r0, r6, #0
    movs r2, #1
    bl func_080A4944
    b .L08038DC2
.L08038DA8:
    adds r4, r6, #0
    adds r4, #0x3e
    ldrb r0, [r4]
    cmp r0, #0
    bne .L08038DC2
    adds r1, r7, #0
    adds r1, #0x10
    adds r0, r6, #0
    movs r2, #1
    bl func_080A4944
    movs r0, #1
    strb r0, [r4]
.L08038DC2:
    movs r0, #0
    mov r1, sb
    strb r0, [r1]
.L08038DC8:
    ldr r2, [sp, #0x80]
    adds r2, #0x40
    str r2, [sp, #0x80]
    ldr r0, [sp, #0x84]
    adds r0, #4
    str r0, [sp, #0x84]
    adds r5, #0x40
    ldr r1, [sp, #0x7c]
    adds r1, #1
    str r1, [sp, #0x7c]
    cmp r1, #4
    bls .L08038CEE
.L08038DE0:
    add sp, #0x8c
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0

    thumb_func_start func_08038DF0
func_08038DF0: @ 0x08038DF0
    push {r4, r5, r6, r7, lr}
    mov r7, r8
    push {r7}
    sub sp, #8
    mov r8, r0
    movs r0, #0x54
    bl __builtin_new
    adds r7, r0, #0
    mov r1, r8
    ldr r0, [r1]
    ldr r4, [r0]
    ldr r0, [r4]
    ldr r1, [r0, #0x70]
    adds r0, r4, #0
    bl _call_via_r1
    adds r5, r0, #0
    adds r0, r7, #0
    adds r1, r4, #0
    movs r2, #6
    movs r3, #0x1b
    bl func_080A4740
    ldr r0, .L08038E8C @ =vtable_unk_080E602C
    str r0, [r7, #0x24]
    adds r6, r7, #0
    adds r6, #0x28
    ldr r4, [r5]
    mov r0, sp
    ldr r3, [r4, #0xc]
    adds r1, r5, #0
    movs r2, #0
    bl _call_via_r3
    ldr r0, [sp]
    ldrh r2, [r0]
    adds r0, r6, #0
    ldr r3, [r4, #0x10]
    adds r1, r5, #0
    bl _call_via_r3
    adds r1, r7, #0
    adds r1, #0x48
    movs r2, #0
    movs r0, #1
    strb r0, [r1]
    movs r0, #0x90
    lsls r0, r0, #0x11
    str r0, [r7, #0x4c]
    adds r0, r7, #0
    adds r0, #0x50
    strb r2, [r0]
    adds r0, #1
    strb r2, [r0]
    mov r5, r8
    adds r5, #0xc
    adds r6, r7, #0
    mov r0, r8
    ldr r4, [r0, #0xc]
    cmp r6, r4
    beq .L08038E7E
    cmp r4, #0
    beq .L08038E7E
    adds r0, r4, #0
    movs r1, #2
    bl func_080A47B4
    adds r0, r4, #0
    bl __builtin_delete
.L08038E7E:
    str r6, [r5]
    add sp, #8
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08038E8C: .4byte vtable_unk_080E602C

    .section .text.after_entity38740_eb8, "ax", %progbits
    thumb_func_start func_08038EE0
func_08038EE0: @ 0x08038EE0
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #0x4c
    mov sb, r0
    movs r0, #0xa6
    lsls r0, r0, #1
    bl __builtin_new
    mov r2, sb
    ldr r1, [r2]
    adds r5, r0, #0
    ldr r6, [r1]
    movs r0, #0
    str r0, [r5]
    mov sl, r0
    add r3, sp, #8
    mov r8, r3
.L08038F08:
    mov r7, sl
    lsls r0, r7, #2
    ldr r1, .L08038F14 @ =.L08038F18
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L08038F14: .4byte .L08038F18
.L08038F18: @ jump table
    .4byte .L08038F2C @ case 0
    .4byte .L08038F4C @ case 1
    .4byte .L08038F4C @ case 2
    .4byte .L08038FDC @ case 3
    .4byte .L08038FDC @ case 4
.L08038F2C:
    ldr r0, [r6]
    ldr r1, [r0, #0x78]
    adds r0, r6, #0
    bl _call_via_r1
    adds r1, r0, #0
    movs r0, #4
    str r0, [sp]
    movs r0, #0x1c
    str r0, [sp, #4]
    movs r0, #0
    mov r2, r8
    strb r0, [r2]
    add r0, sp, #0xc
    movs r2, #2
    b .L08038F6A
.L08038F4C:
    ldr r0, [r6]
    ldr r1, [r0, #0x78]
    adds r0, r6, #0
    bl _call_via_r1
    adds r1, r0, #0
    movs r0, #4
    str r0, [sp]
    movs r0, #0x1c
    str r0, [sp, #4]
    movs r0, #0
    mov r2, r8
    strb r0, [r2]
    add r0, sp, #0xc
    movs r2, #1
.L08038F6A:
    adds r3, r6, #0
    bl func_080A4A00
    ldr r0, [r5]
    cmp r0, #4
    bhi .L08038FCC
    lsls r0, r0, #6
    adds r0, #4
    adds r4, r5, r0
    cmp r4, #0
    beq .L08038FC6
    adds r0, r4, #0
    add r1, sp, #0xc
    bl func_080DC840
    ldr r0, .L08038FD8 @ =vtable_unk_080E681C
    str r0, [r4, #0x24]
    adds r1, r4, #0
    adds r1, #0x28
    add r0, sp, #0x34
    ldm r0!, {r2, r3, r7}
    stm r1!, {r2, r3, r7}
    ldm r0!, {r3, r7}
    stm r1!, {r3, r7}
    add r0, sp, #0x48
    ldrb r1, [r0]
    adds r0, r4, #0
    adds r0, #0x3c
    strb r1, [r0]
    mov r0, sp
    adds r0, #0x49
    ldrb r0, [r0]
    adds r1, r4, #0
    adds r1, #0x3d
    strb r0, [r1]
    mov r0, sp
    adds r0, #0x4a
    ldrb r0, [r0]
    adds r1, #1
    strb r0, [r1]
    mov r0, sp
    adds r0, #0x4b
    ldrb r1, [r0]
    adds r0, r4, #0
    adds r0, #0x3f
    strb r1, [r0]
.L08038FC6:
    ldr r0, [r5]
    adds r0, #1
    str r0, [r5]
.L08038FCC:
    add r0, sp, #0xc
    movs r1, #2
    bl func_080A47B4
    b .L08039064
    .align 2, 0
.L08038FD8: .4byte vtable_unk_080E681C
.L08038FDC:
    ldr r0, [r6]
    ldr r1, [r0, #0x78]
    adds r0, r6, #0
    bl _call_via_r1
    adds r1, r0, #0
    movs r0, #4
    str r0, [sp]
    movs r0, #0x1c
    str r0, [sp, #4]
    movs r0, #0
    mov r2, r8
    strb r0, [r2]
    add r0, sp, #0xc
    movs r2, #0
    adds r3, r6, #0
    bl func_080A4A00
    ldr r0, [r5]
    cmp r0, #4
    bhi .L0803905C
    lsls r0, r0, #6
    adds r0, #4
    adds r4, r5, r0
    cmp r4, #0
    beq .L08039056
    adds r0, r4, #0
    add r1, sp, #0xc
    bl func_080DC840
    ldr r0, .L080390CC @ =vtable_unk_080E681C
    str r0, [r4, #0x24]
    adds r1, r4, #0
    adds r1, #0x28
    add r0, sp, #0x34
    ldm r0!, {r2, r3, r7}
    stm r1!, {r2, r3, r7}
    ldm r0!, {r3, r7}
    stm r1!, {r3, r7}
    add r0, sp, #0x48
    ldrb r1, [r0]
    adds r0, r4, #0
    adds r0, #0x3c
    strb r1, [r0]
    mov r0, sp
    adds r0, #0x49
    ldrb r0, [r0]
    adds r1, r4, #0
    adds r1, #0x3d
    strb r0, [r1]
    mov r0, sp
    adds r0, #0x4a
    ldrb r0, [r0]
    adds r1, #1
    strb r0, [r1]
    mov r0, sp
    adds r0, #0x4b
    ldrb r1, [r0]
    adds r0, r4, #0
    adds r0, #0x3f
    strb r1, [r0]
.L08039056:
    ldr r0, [r5]
    adds r0, #1
    str r0, [r5]
.L0803905C:
    add r0, sp, #0xc
    movs r1, #2
    bl func_080A47B4
.L08039064:
    movs r1, #0xa2
    lsls r1, r1, #1
    adds r0, r5, r1
    add r0, sl
    movs r1, #0
    strb r1, [r0]
    movs r2, #1
    add sl, r2
    mov r3, sl
    cmp r3, #4
    bhi .L0803907C
    b .L08038F08
.L0803907C:
    movs r7, #0x10
    add r7, sb
    mov r8, r7
    adds r7, r5, #0
    mov r0, sb
    ldr r6, [r0, #0x10]
    cmp r7, r6
    beq .L080390B6
    cmp r6, #0
    beq .L080390B6
    ldr r0, [r6]
    lsls r0, r0, #6
    adds r0, #4
    adds r5, r6, r0
    adds r4, r6, #4
    cmp r4, r5
    beq .L080390B0
.L0803909E:
    ldr r0, [r4, #0x24]
    ldr r2, [r0, #8]
    adds r0, r4, #0
    movs r1, #2
    bl _call_via_r2
    adds r4, #0x40
    cmp r4, r5
    bne .L0803909E
.L080390B0:
    adds r0, r6, #0
    bl __builtin_delete
.L080390B6:
    mov r1, r8
    str r7, [r1]
    add sp, #0x4c
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L080390CC: .4byte vtable_unk_080E681C

    .section .text.after_entity38740_390d0, "ax", %progbits
.L080390DC:
    .byte 0x10, 0xB5, 0x04, 0x1C
    .byte 0x30, 0x30, 0x25, 0xF0, 0xBD, 0xFB, 0x20, 0x1C, 0x44, 0x30, 0x00, 0x22, 0x01, 0x21, 0x01, 0x70
    .byte 0x02, 0x30, 0x02, 0x70, 0x01, 0x30, 0x01, 0x70, 0x10, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00
    .byte 0x26, 0x30, 0x00, 0x78, 0x70, 0x47, 0x00, 0x00, 0xCB, 0x1F, 0x03, 0x80, 0x13, 0x1F, 0x43, 0x80
    .byte 0x07, 0x31, 0x81, 0x80, 0x05, 0x32, 0xC2, 0x80, 0x70, 0x47, 0x00, 0x00, 0x00, 0xB5, 0x80, 0x69
    .byte 0xD6, 0xF7, 0x56, 0xFF, 0x00, 0x21, 0x1E, 0x28, 0x00, 0xD1, 0x01, 0x21, 0x08, 0x1C, 0x02, 0xBC
    .byte 0x08, 0x47, 0x00, 0x00

    .section .text.after_entity39134, "ax", %progbits
    .section .text.after_entity391c0, "ax", %progbits
    .section .text.after_entity39200, "ax", %progbits
    thumb_func_start func_08039204
func_08039204: @ 0x08039204
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #0x18
    adds r5, r1, #0
    str r2, [sp, #0x10]
    ldr r0, [r5, #0x34]
    mov r8, r0
    mov r1, r8
    adds r1, #0x10
    str r1, [sp, #0x14]
    mov r2, r8
    ldrh r4, [r2, #0x10]
    cmp r4, #0
    beq .L08039228
    subs r4, #1
.L08039228:
    ldrh r3, [r5, #4]
    mov ip, r3
    movs r1, #0xa
    ldrsh r0, [r5, r1]
    mov sb, r0
    movs r2, #0xe
    ldrsh r7, [r5, r2]
    movs r0, #0xb0
    lsls r0, r0, #1
    cmp r7, r0
    ble .L0803924A
    add r3, sp, #8
    movs r1, #0x84
    lsls r1, r1, #1
    movs r2, #0xb4
    lsls r2, r2, #2
    b .L08039254
.L0803924A:
    add r3, sp, #8
    movs r1, #0xaa
    lsls r1, r1, #1
    movs r2, #0x10
    rsbs r2, r2, #0
.L08039254:
    adds r0, r3, #0
    strh r1, [r0]
    strh r2, [r3, #2]
    add r1, sp, #8
    adds r0, r1, #0
    movs r2, #0
    ldrsh r3, [r0, r2]
    mov sl, r3
    movs r3, #2
    ldrsh r6, [r1, r3]
    mov r0, ip
    cmp r0, #2
    bne .L080392EA
    mov r1, sl
    mov r2, sb
    subs r0, r1, r2
    cmp r0, #0
    bge .L0803927A
    rsbs r0, r0, #0
.L0803927A:
    cmp r0, #0xf
    bgt .L0803928A
    subs r0, r6, r7
    cmp r0, #0
    bge .L08039286
    rsbs r0, r0, #0
.L08039286:
    cmp r0, #0xf
    ble .L080392EA
.L0803928A:
    cmp r4, #0
    bne .L080392E4
    mov r0, sb
    adds r1, r7, #0
    bl func_080391C0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L080392B6
    movs r1, #0
    cmp r7, r6
    blt .L080392A4
    movs r1, #1
.L080392A4:
    adds r0, r5, #0
    adds r0, #0x20
    ldrb r0, [r0]
    cmp r0, r1
    beq .L080392DC
    adds r0, r5, #0
    bl SetAnimFacing__12AActorEntityUi
    b .L080392DC
.L080392B6:
    adds r4, r5, #0
    adds r4, #0x20
    ldrb r0, [r4]
    ldr r3, [sp, #0x10]
    str r3, [sp]
    str r0, [sp, #4]
    mov r0, sb
    adds r1, r7, #0
    mov r2, sl
    adds r3, r6, #0
    bl func_080ABC40
    adds r1, r0, #0
    ldrb r0, [r4]
    cmp r0, r1
    beq .L080392DC
    adds r0, r5, #0
    bl SetAnimFacing__12AActorEntityUi
.L080392DC:
    movs r0, #0x1e
    bl func_080AB788
    adds r4, r0, #1
.L080392E4:
    ldr r0, [sp, #0x14]
    strh r4, [r0]
    b .L080392FC
.L080392EA:
    adds r0, r5, #0
    movs r1, #0x8d
    lsls r1, r1, #2
    bl SetMap__7AEntityUi
    add r1, sp, #0xc
    mov r0, r8
    bl func_0809C098
.L080392FC:
    add sp, #0x18
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0

    .section .text.after_entity3930c, "ax", %progbits
    thumb_func_start func_08039310
func_08039310: @ 0x08039310
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #0x2c
    adds r5, r1, #0
    str r2, [sp, #0x1c]
    ldr r0, [r5, #0x34]
    str r0, [sp, #0x20]
    adds r0, #0x10
    mov r8, r0
    ldr r3, [r5]
    ldrb r1, [r0, #6]
    str r1, [sp, #0x24]
    ldr r2, [sp, #0x20]
    ldrh r6, [r2, #0x10]
    cmp r6, #0
    beq .L08039344
    subs r6, #1
    cmp r6, #0
    bne .L08039344
    cmp r1, #0
    beq .L08039344
    subs r1, #1
    str r1, [sp, #0x24]
.L08039344:
    ldr r0, [r3]
    mov r2, r8
    ldrb r1, [r2, #7]
    ldr r2, [r0, #0x40]
    adds r0, r3, #0
    bl _call_via_r2
    adds r4, r0, #0
    cmp r4, #0
    bne .L0803935A
    b .L08039488
.L0803935A:
    ldrh r0, [r4, #4]
    ldrh r3, [r5, #4]
    cmp r0, r3
    beq .L08039364
    b .L08039488
.L08039364:
    ldr r0, [r4, #0x14]
    ldr r1, [r0, #0x60]
    adds r0, r4, #0
    bl _call_via_r1
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08039376
    b .L08039488
.L08039376:
    movs r0, #0xa
    ldrsh r2, [r5, r0]
    movs r1, #0xe
    ldrsh r7, [r5, r1]
    movs r0, #0xa
    ldrsh r3, [r4, r0]
    mov sl, r3
    movs r3, #0xe
    ldrsh r1, [r4, r3]
    mov sb, r1
    ldr r0, [sp, #0x24]
    cmp r0, #0
    beq .L08039444
    mov r1, sl
    subs r0, r1, r2
    cmp r0, #0
    bge .L0803939A
    rsbs r0, r0, #0
.L0803939A:
    cmp r0, #0xf
    bgt .L080393AC
    mov r3, sb
    subs r0, r3, r7
    cmp r0, #0
    bge .L080393A8
    rsbs r0, r0, #0
.L080393A8:
    cmp r0, #0xf
    ble .L08039444
.L080393AC:
    cmp r6, #0
    beq .L080393D4
    mov r1, r8
    movs r3, #2
    ldrsh r0, [r1, r3]
    subs r0, r0, r2
    cmp r0, #0
    bge .L080393BE
    rsbs r0, r0, #0
.L080393BE:
    cmp r0, #0xf
    bgt .L08039438
    mov r1, r8
    movs r3, #4
    ldrsh r0, [r1, r3]
    subs r0, r0, r7
    cmp r0, #0
    bge .L080393D0
    rsbs r0, r0, #0
.L080393D0:
    cmp r0, #0xf
    bgt .L08039438
.L080393D4:
    adds r0, r2, #0
    adds r1, r7, #0
    str r2, [sp, #0x28]
    bl func_080391C0
    lsls r0, r0, #0x18
    ldr r2, [sp, #0x28]
    cmp r0, #0
    beq .L08039400
    movs r1, #0
    cmp r7, sb
    blt .L080393EE
    movs r1, #1
.L080393EE:
    adds r0, r5, #0
    adds r0, #0x20
    ldrb r0, [r0]
    cmp r0, r1
    beq .L08039426
    adds r0, r5, #0
    bl SetAnimFacing__12AActorEntityUi
    b .L08039426
.L08039400:
    adds r4, r5, #0
    adds r4, #0x20
    ldrb r0, [r4]
    ldr r6, [sp, #0x1c]
    str r6, [sp]
    str r0, [sp, #4]
    adds r0, r2, #0
    adds r1, r7, #0
    mov r2, sl
    mov r3, sb
    bl func_080ABC40
    adds r1, r0, #0
    ldrb r0, [r4]
    cmp r0, r1
    beq .L08039426
    adds r0, r5, #0
    bl SetAnimFacing__12AActorEntityUi
.L08039426:
    movs r0, #0x1e
    bl func_080AB788
    adds r6, r0, #1
    mov r1, sl
    mov r0, r8
    strh r1, [r0, #2]
    mov r2, sb
    strh r2, [r0, #4]
.L08039438:
    add r3, sp, #0x24
    ldrb r0, [r3]
    mov r3, r8
    strb r0, [r3, #6]
    strh r6, [r3]
    b .L08039548
.L08039444:
    ldr r1, .L0803947C @ =0xFFFF0000
    ldr r0, [sp, #8]
    ands r0, r1
    movs r1, #0x24
    orrs r0, r1
    ldr r1, .L08039480 @ =0xFF00FFFF
    ands r0, r1
    movs r1, #0x80
    lsls r1, r1, #9
    orrs r0, r1
    str r0, [sp, #8]
    mov r6, r8
    ldrb r1, [r6, #7]
    lsls r1, r1, #0x18
    ldr r2, .L08039484 @ =0x00FFFFFF
    ands r0, r2
    orrs r0, r1
    str r0, [sp, #8]
    ldr r0, [sp, #0x20]
    add r1, sp, #8
    bl func_0809C0BC
    adds r0, r5, #0
    movs r1, #0xab
    bl func_080200C4
    b .L08039548
    .align 2, 0
.L0803947C: .4byte 0xFFFF0000
.L08039480: .4byte 0xFF00FFFF
.L08039484: .4byte 0x00FFFFFF
.L08039488:
    ldr r4, [r5, #0x34]
    movs r6, #0x64
    adds r0, r4, #0
    bl func_0809C060
    cmp r0, #0
    beq .L080394AA
    ldr r0, [r5]
    ldrh r1, [r5, #4]
    movs r3, #0xa
    ldrsh r2, [r5, r3]
    movs r6, #0xe
    ldrsh r3, [r5, r6]
    bl func_08039134
    adds r6, r0, #0
    b .L080394B2
.L080394AA:
    adds r0, r5, #0
    movs r1, #0xaa
    bl func_080200C4
.L080394B2:
    cmp r6, #0x64
    beq .L08039534
    movs r0, #0x64
    bl func_080AB788
    cmp r0, #0x45
    bhi .L080394FC
    ldr r1, .L080394F0 @ =0xFFFF0000
    ldr r0, [sp, #0xc]
    ands r0, r1
    str r0, [sp, #0xc]
    movs r0, #8
    bl func_080AB788
    adds r0, #3
    lsls r0, r0, #0x18
    lsrs r0, r0, #8
    ldr r3, .L080394F4 @ =0xFF00FFFF
    add r1, sp, #0xc
    ldr r2, [r1, #4]
    ands r2, r3
    orrs r2, r0
    lsls r3, r6, #0x18
    ldr r0, .L080394F8 @ =0x00FFFFFF
    ands r2, r0
    orrs r2, r3
    str r2, [r1, #4]
    adds r0, r4, #0
    bl func_0809C0AC
    b .L08039548
    .align 2, 0
.L080394F0: .4byte 0xFFFF0000
.L080394F4: .4byte 0xFF00FFFF
.L080394F8: .4byte 0x00FFFFFF
.L080394FC:
    movs r0, #0x3c
    bl func_080AB788
    adds r0, #0x78
    lsls r0, r0, #0x10
    lsrs r0, r0, #0x10
    ldr r2, .L08039528 @ =0xFFFF0000
    ldr r1, [sp, #0x14]
    ands r1, r2
    orrs r1, r0
    ldr r0, .L0803952C @ =0xFF00FFFF
    ands r1, r0
    lsls r2, r6, #0x18
    ldr r0, .L08039530 @ =0x00FFFFFF
    ands r1, r0
    orrs r1, r2
    str r1, [sp, #0x14]
    add r1, sp, #0x14
    adds r0, r4, #0
    bl func_0809C0BC
    b .L08039548
    .align 2, 0
.L08039528: .4byte 0xFFFF0000
.L0803952C: .4byte 0xFF00FFFF
.L08039530: .4byte 0x00FFFFFF
.L08039534:
    ldr r1, .L08039558 @ =0xFFFF0000
    ldr r0, [sp, #0x18]
    ands r0, r1
    movs r1, #0xb4
    orrs r0, r1
    str r0, [sp, #0x18]
    add r1, sp, #0x18
    adds r0, r4, #0
    bl func_0809C0A0
.L08039548:
    add sp, #0x2c
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08039558: .4byte 0xFFFF0000

    thumb_func_start func_0803955C
func_0803955C: @ 0x0803955C
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #0x10
    adds r5, r1, #0
    ldr r0, [r5, #0x34]
    mov r8, r0
    mov r6, r8
    adds r6, #0x10
    mov r1, r8
    ldrh r4, [r1, #0x10]
    cmp r4, #0
    beq .L08039582
    subs r4, #1
    cmp r4, #0
    beq .L08039582
    b .L080396E2
.L08039582:
    ldrb r0, [r6, #2]
    cmp r0, #0
    bne .L0803958A
    b .L080396D4
.L0803958A:
    ldr r4, [r5]
    ldrh r7, [r5, #4]
    movs r3, #0xa
    ldrsh r2, [r5, r3]
    mov sb, r2
    movs r1, #0xe
    ldrsh r0, [r5, r1]
    mov sl, r0
    adds r0, r4, #0
    adds r1, r7, #0
    mov r3, sl
    bl func_08039134
    adds r1, r0, #0
    cmp r1, #0x64
    bne .L080395AC
    ldrb r1, [r6, #3]
.L080395AC:
    ldr r0, [r4]
    ldr r2, [r0, #0x40]
    adds r0, r4, #0
    bl _call_via_r2
    adds r4, r0, #0
    cmp r4, #0
    beq .L08039602
    ldrh r0, [r4, #4]
    cmp r0, r7
    bne .L08039602
    ldr r0, [r4, #0x14]
    ldr r1, [r0, #0x60]
    adds r0, r4, #0
    bl _call_via_r1
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08039602
    movs r2, #0xa
    ldrsh r0, [r4, r2]
    movs r3, #0xe
    ldrsh r1, [r4, r3]
    mov r6, sb
    subs r0, r0, r6
    cmp r0, #0
    bge .L080395E4
    rsbs r0, r0, #0
.L080395E4:
    cmp r0, #0xf
    bgt .L08039602
    mov r0, sl
    subs r3, r1, r0
    cmp r3, #0
    bge .L080395F2
    rsbs r3, r3, #0
.L080395F2:
    cmp r3, #0xf
    bgt .L08039602
    ldr r0, [r4, #0x14]
    adds r0, #0x80
    ldr r1, [r0]
    adds r0, r4, #0
    bl _call_via_r1
.L08039602:
    mov r0, r8
    movs r1, #4
    bl func_0809C068
    ldr r4, [r5, #0x34]
    movs r6, #0x64
    adds r0, r4, #0
    bl func_0809C060
    cmp r0, #0
    beq .L0803962C
    ldr r0, [r5]
    ldrh r1, [r5, #4]
    movs r3, #0xa
    ldrsh r2, [r5, r3]
    movs r6, #0xe
    ldrsh r3, [r5, r6]
    bl func_08039134
    adds r6, r0, #0
    b .L08039634
.L0803962C:
    adds r0, r5, #0
    movs r1, #0xaa
    bl func_080200C4
.L08039634:
    cmp r6, #0x64
    beq .L080396B8
    movs r0, #0x64
    bl func_080AB788
    cmp r0, #0x45
    bhi .L08039680
    ldr r1, .L08039674 @ =0xFFFF0000
    ldr r0, [sp]
    ands r0, r1
    str r0, [sp]
    movs r0, #8
    bl func_080AB788
    adds r0, #3
    lsls r0, r0, #0x18
    lsrs r0, r0, #8
    ldr r2, .L08039678 @ =0xFF00FFFF
    ldr r1, [sp, #4]
    ands r1, r2
    orrs r1, r0
    lsls r2, r6, #0x18
    ldr r0, .L0803967C @ =0x00FFFFFF
    ands r1, r0
    orrs r1, r2
    str r1, [sp, #4]
    adds r0, r4, #0
    mov r1, sp
    bl func_0809C0AC
    b .L080396E4
    .align 2, 0
.L08039674: .4byte 0xFFFF0000
.L08039678: .4byte 0xFF00FFFF
.L0803967C: .4byte 0x00FFFFFF
.L08039680:
    movs r0, #0x3c
    bl func_080AB788
    adds r0, #0x78
    lsls r0, r0, #0x10
    lsrs r0, r0, #0x10
    ldr r2, .L080396AC @ =0xFFFF0000
    ldr r1, [sp, #8]
    ands r1, r2
    orrs r1, r0
    ldr r0, .L080396B0 @ =0xFF00FFFF
    ands r1, r0
    lsls r2, r6, #0x18
    ldr r0, .L080396B4 @ =0x00FFFFFF
    ands r1, r0
    orrs r1, r2
    str r1, [sp, #8]
    add r1, sp, #8
    adds r0, r4, #0
    bl func_0809C0BC
    b .L080396E4
    .align 2, 0
.L080396AC: .4byte 0xFFFF0000
.L080396B0: .4byte 0xFF00FFFF
.L080396B4: .4byte 0x00FFFFFF
.L080396B8:
    ldr r1, .L080396D0 @ =0xFFFF0000
    ldr r0, [sp, #0xc]
    ands r0, r1
    movs r1, #0xb4
    orrs r0, r1
    str r0, [sp, #0xc]
    add r1, sp, #0xc
    adds r0, r4, #0
    bl func_0809C0A0
    b .L080396E4
    .align 2, 0
.L080396D0: .4byte 0xFFFF0000
.L080396D4:
    movs r4, #0x24
    movs r0, #1
    strb r0, [r6, #2]
    adds r0, r5, #0
    movs r1, #0xab
    bl func_080200C4
.L080396E2:
    strh r4, [r6]
.L080396E4:
    add sp, #0x10
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0

    .section .text.after_entity396f4, "ax", %progbits
    thumb_func_start func_08039708
func_08039708: @ 0x08039708
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #0x18
    adds r6, r1, #0
    mov sl, r2
    ldr r0, [r6, #0x34]
    movs r1, #0x10
    adds r1, r1, r0
    mov sb, r1
    ldr r3, [r6]
    ldrh r2, [r0, #0x10]
    mov r8, r2
    cmp r2, #0
    beq .L08039730
    movs r4, #1
    rsbs r4, r4, #0
    add r8, r4
.L08039730:
    ldr r1, [r0, #0x10]
    lsls r0, r1, #9
    lsrs r7, r0, #0x19
    cmp r7, #0
    beq .L0803973C
    subs r7, #1
.L0803973C:
    mov r5, sb
    ldrb r4, [r5, #3]
    cmp r4, #0
    beq .L08039746
    subs r4, #1
.L08039746:
    mov r0, r8
    cmp r0, #0
    beq .L080397C6
    ldr r2, [r3]
    lsls r0, r1, #8
    movs r1, #0
    cmp r0, #0
    bge .L08039758
    movs r1, #0x2b
.L08039758:
    ldr r2, [r2, #0x40]
    adds r0, r3, #0
    bl _call_via_r2
    adds r3, r0, #0
    cmp r3, #0
    beq .L080397C6
    ldrh r0, [r3, #4]
    ldrh r1, [r6, #4]
    cmp r0, r1
    bne .L080397C6
    cmp r4, #0
    bne .L080397AC
    movs r2, #0xa
    ldrsh r0, [r6, r2]
    movs r4, #0xe
    ldrsh r1, [r6, r4]
    movs r5, #0xa
    ldrsh r2, [r3, r5]
    movs r4, #0xe
    ldrsh r3, [r3, r4]
    adds r5, r6, #0
    adds r5, #0x20
    ldrb r4, [r5]
    mov ip, r4
    mov r4, sl
    str r4, [sp]
    mov r4, ip
    str r4, [sp, #4]
    bl func_080ABE58
    adds r1, r0, #0
    ldrb r0, [r5]
    cmp r0, r1
    beq .L080397A4
    adds r0, r6, #0
    bl SetAnimFacing__12AActorEntityUi
.L080397A4:
    movs r0, #0x1e
    bl func_080AB788
    adds r4, r0, #1
.L080397AC:
    mov r0, r8
    mov r5, sb
    strh r0, [r5]
    movs r0, #0x7f
    ands r7, r0
    ldrb r1, [r5, #2]
    movs r0, #0x80
    rsbs r0, r0, #0
    ands r0, r1
    orrs r0, r7
    strb r0, [r5, #2]
    strb r4, [r5, #3]
    b .L0803988C
.L080397C6:
    adds r0, r6, #0
    bl func_080323C8
    ldr r4, [r6, #0x34]
    movs r5, #0x64
    adds r0, r4, #0
    bl func_0809C060
    cmp r0, #0
    beq .L080397EE
    ldr r0, [r6]
    ldrh r1, [r6, #4]
    movs r3, #0xa
    ldrsh r2, [r6, r3]
    movs r5, #0xe
    ldrsh r3, [r6, r5]
    bl func_08039134
    adds r5, r0, #0
    b .L080397F6
.L080397EE:
    adds r0, r6, #0
    movs r1, #0xaa
    bl func_080200C4
.L080397F6:
    cmp r5, #0x64
    beq .L08039878
    movs r0, #0x64
    bl func_080AB788
    cmp r0, #0x45
    bhi .L08039840
    ldr r1, .L08039834 @ =0xFFFF0000
    ldr r0, [sp, #8]
    ands r0, r1
    str r0, [sp, #8]
    movs r0, #8
    bl func_080AB788
    adds r0, #3
    lsls r0, r0, #0x18
    lsrs r0, r0, #8
    ldr r2, .L08039838 @ =0xFF00FFFF
    ldr r1, [sp, #0xc]
    ands r1, r2
    orrs r1, r0
    lsls r2, r5, #0x18
    ldr r0, .L0803983C @ =0x00FFFFFF
    ands r1, r0
    orrs r1, r2
    str r1, [sp, #0xc]
    adds r0, r4, #0
    add r1, sp, #8
    bl func_0809C0AC
    b .L0803988C
    .align 2, 0
.L08039834: .4byte 0xFFFF0000
.L08039838: .4byte 0xFF00FFFF
.L0803983C: .4byte 0x00FFFFFF
.L08039840:
    movs r0, #0x3c
    bl func_080AB788
    adds r0, #0x78
    lsls r0, r0, #0x10
    lsrs r0, r0, #0x10
    ldr r2, .L0803986C @ =0xFFFF0000
    ldr r1, [sp, #0x10]
    ands r1, r2
    orrs r1, r0
    ldr r0, .L08039870 @ =0xFF00FFFF
    ands r1, r0
    lsls r2, r5, #0x18
    ldr r0, .L08039874 @ =0x00FFFFFF
    ands r1, r0
    orrs r1, r2
    str r1, [sp, #0x10]
    add r1, sp, #0x10
    adds r0, r4, #0
    bl func_0809C0BC
    b .L0803988C
    .align 2, 0
.L0803986C: .4byte 0xFFFF0000
.L08039870: .4byte 0xFF00FFFF
.L08039874: .4byte 0x00FFFFFF
.L08039878:
    ldr r1, .L0803989C @ =0xFFFF0000
    ldr r0, [sp, #0x14]
    ands r0, r1
    movs r1, #0xb4
    orrs r0, r1
    str r0, [sp, #0x14]
    add r1, sp, #0x14
    adds r0, r4, #0
    bl func_0809C0A0
.L0803988C:
    add sp, #0x18
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L0803989C: .4byte 0xFFFF0000
    .section .text.after_entity398a0, "ax", %progbits

    .section .text.after_entity39a30, "ax", %progbits
    .section .text.after_entity39a5c, "ax", %progbits
    .section .text.after_entity39d98, "ax", %progbits
    .section .text.after_entity39e18, "ax", %progbits
    .section .text.after_entity39e8c, "ax", %progbits
    thumb_func_start func_08039E98
func_08039E98: @ 0x08039E98
    push {r4, r5, r6, r7, lr}
    mov r7, sb
    mov r6, r8
    push {r6, r7}
    sub sp, #0x14
    adds r7, r0, #0
    adds r6, r1, #0
    adds r5, r2, #0
    mov sb, r3
    ldr r0, .L08039F30 @ =vtable_unk_080E76BC
    str r0, [r7, #0x4c]
    str r6, [r7]
    movs r4, #0
    strh r5, [r7, #4]
    ldr r0, [r6]
    ldr r1, [r0, #0x68]
    adds r0, r6, #0
    bl _call_via_r1
    adds r1, r0, #0
    adds r0, r7, #0
    adds r0, #8
    movs r2, #3
    str r2, [sp]
    movs r2, #0x1b
    str r2, [sp, #4]
    add r2, sp, #8
    strb r4, [r2]
    adds r2, r5, #0
    adds r3, r6, #0
    bl func_080A4A00
    mov r0, sb
    cmp r0, #1
    bne .L08039F3C
    movs r0, #0x4c
    bl __builtin_new
    adds r5, r0, #0
    ldr r0, [r6]
    ldr r1, [r0, #0x68]
    adds r0, r6, #0
    bl _call_via_r1
    adds r4, r0, #0
    adds r0, r5, #0
    adds r1, r6, #0
    movs r2, #2
    movs r3, #0xf
    bl func_080A4740
    ldr r0, .L08039F34 @ =vtable_unk_080E602C
    str r0, [r5, #0x24]
    movs r1, #0x28
    adds r1, r1, r5
    mov r8, r1
    ldr r6, [r4]
    add r0, sp, #0xc
    ldr r3, [r6, #0xc]
    adds r1, r4, #0
    ldr r2, .L08039F38 @ =0x0000091A
    bl _call_via_r3
    ldr r0, [sp, #0xc]
    ldrh r2, [r0]
    mov r0, r8
    ldr r3, [r6, #0x10]
    adds r1, r4, #0
    bl _call_via_r3
    adds r0, r5, #0
    adds r0, #0x48
    mov r1, sb
    strb r1, [r0]
    b .L08039F3E
    .align 2, 0
.L08039F30: .4byte vtable_unk_080E76BC
.L08039F34: .4byte vtable_unk_080E602C
.L08039F38: .4byte 0x0000091A
.L08039F3C:
    movs r5, #0
.L08039F3E:
    str r5, [r7, #0x48]
    adds r0, r7, #0
    add sp, #0x14
    pop {r3, r4}
    mov r8, r3
    mov sb, r4
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1

    .section .text.after_entity39f50, "ax", %progbits
    thumb_func_start func_08039F90
func_08039F90: @ 0x08039F90
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #0x48
    mov sl, r0
    adds r4, r1, #0
    mov sb, r2
    mov r8, r3
    ldr r5, [sp, #0x68]
    ldr r6, [sp, #0x6c]
    ldr r7, [sp, #0x70]
    ldr r0, [r4]
    ldr r1, [r0, #0x18]
    adds r0, r4, #0
    bl _call_via_r1
    subs r5, r5, r0
    str r5, [sp, #0x3c]
    ldr r0, [r4]
    ldr r1, [r0, #0x1c]
    adds r0, r4, #0
    bl _call_via_r1
    subs r0, r6, r0
    str r0, [sp, #0x40]
    movs r0, #0x80
    lsls r0, r0, #8
    subs r0, r0, r6
    str r0, [sp, #0x44]
    add r0, sp, #0x34
    mov r1, r8
    str r1, [sp, #0x34]
    mov r3, sb
    str r3, [r0, #4]
    adds r5, r7, #0
    mov sb, r0
    cmp r5, #0
    bge .L08039FE2
    rsbs r7, r5, #0
.L08039FE2:
    ldr r4, [sp, #0x40]
    subs r4, r4, r7
    mov r8, r4
    mov r6, sl
    adds r6, #8
    movs r0, #3
    ldr r7, [sp, #0x74]
    ands r0, r7
    lsls r4, r0, #2
    orrs r4, r0
    lsls r1, r0, #4
    orrs r4, r1
    lsls r0, r0, #6
    orrs r4, r0
    mov r0, sl
    ldr r1, [r0, #0x30]
    ldr r3, [r1]
    ldrh r2, [r0, #0x3c]
    lsls r2, r2, #2
    ldr r0, [r0, #0x34]
    adds r0, r0, r2
    ldrh r2, [r0]
    add r0, sp, #0x14
    ldr r3, [r3, #0x10]
    bl _call_via_r3
    add r7, sp, #0x14
    mov r1, sb
    ldr r1, [r1, #4]
    mov ip, r1
    mov r3, sl
    ldr r2, [r3, #8]
    ldr r1, [r3, #0x10]
    rsbs r0, r1, #0
    orrs r0, r1
    cmp r0, #0
    bge .L0803A054
    ldrh r0, [r6, #0xc]
    mov r1, sl
    adds r1, #0x18
    ldr r3, [sp, #0x44]
    str r3, [sp]
    adds r3, r7, #0
    str r3, [sp, #4]
    str r2, [sp, #8]
    str r0, [sp, #0xc]
    str r1, [sp, #0x10]
    mov r0, ip
    ldr r1, [sp, #0x3c]
    mov r2, r8
    adds r3, r4, #0
    ldr r4, .L0803A050 @ =func_030004DC
    bl _call_via_r4
    b .L0803A056
    .align 2, 0
.L0803A050: .4byte func_030004DC
.L0803A054:
    movs r0, #0
.L0803A056:
    cmp r0, #0
    beq .L0803A0AA
    adds r0, r6, #0
    adds r0, #0x3c
    ldrb r1, [r0]
    mov r8, r0
    cmp r1, #0
    beq .L0803A0AA
    ldr r1, [sp, #0x34]
    adds r2, r7, #0
    adds r2, #8
    adds r0, r6, #0
    bl func_080A480C
    adds r0, r6, #0
    adds r0, #0x3d
    ldrb r0, [r0]
    cmp r0, #0
    beq .L0803A08A
    adds r1, r7, #0
    adds r1, #0x10
    adds r0, r6, #0
    movs r2, #1
    bl func_080A4944
    b .L0803A0A4
.L0803A08A:
    adds r4, r6, #0
    adds r4, #0x3e
    ldrb r0, [r4]
    cmp r0, #0
    bne .L0803A0A4
    adds r1, r7, #0
    adds r1, #0x10
    adds r0, r6, #0
    movs r2, #1
    bl func_080A4944
    movs r0, #1
    strb r0, [r4]
.L0803A0A4:
    movs r0, #0
    mov r4, r8
    strb r0, [r4]
.L0803A0AA:
    mov r7, sl
    ldr r0, [r7, #0x48]
    cmp r0, #0
    beq .L0803A134
    cmp r5, #0
    blt .L0803A134
    adds r6, r0, #0
    mov r5, sb
    movs r0, #3
    ldr r1, [sp, #0x74]
    ands r0, r1
    lsls r3, r0, #2
    orrs r3, r0
    lsls r1, r0, #4
    orrs r3, r1
    lsls r0, r0, #6
    orrs r3, r0
    adds r7, r6, #0
    adds r7, #0x28
    ldr r4, [r5, #4]
    mov r8, r4
    adds r0, r6, #0
    ldm r0!, {r2}
    ldr r1, [r0, #4]
    rsbs r0, r1, #0
    orrs r0, r1
    cmp r0, #0
    bge .L0803A108
    ldrh r0, [r6, #0xc]
    adds r1, r6, #0
    adds r1, #0x10
    ldr r4, [sp, #0x44]
    str r4, [sp]
    str r7, [sp, #4]
    str r2, [sp, #8]
    str r0, [sp, #0xc]
    str r1, [sp, #0x10]
    mov r0, r8
    ldr r1, [sp, #0x3c]
    ldr r2, [sp, #0x40]
    ldr r4, .L0803A104 @ =func_030004DC
    bl _call_via_r4
    b .L0803A10A
    .align 2, 0
.L0803A104: .4byte func_030004DC
.L0803A108:
    movs r0, #0
.L0803A10A:
    cmp r0, #0
    beq .L0803A134
    adds r4, r6, #0
    adds r4, #0x48
    ldrb r0, [r4]
    cmp r0, #0
    beq .L0803A134
    ldr r1, [r5]
    adds r2, r7, #0
    adds r2, #8
    adds r0, r6, #0
    bl func_080A480C
    adds r1, r7, #0
    adds r1, #0x10
    adds r0, r6, #0
    movs r2, #1
    bl func_080A4944
    movs r0, #0
    strb r0, [r4]
.L0803A134:
    add sp, #0x48
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0

    .section .text.after_entity3a144, "ax", %progbits
    thumb_func_start func_0803A180
func_0803A180: @ 0x0803A180
    push {r4, r5, r6, r7, lr}
    mov r7, sb
    mov r6, r8
    push {r6, r7}
    sub sp, #0x48
    mov r8, r0
    adds r4, r1, #0
    adds r5, r2, #0
    movs r0, #0
    mov sb, r0
    mov r2, r8
    ldr r1, [r2]
    ldr r2, [r1]
    mov r0, sp
    ldr r3, [r2, #0x34]
    movs r2, #0
    bl _call_via_r3
    movs r6, #4
    ldrsh r1, [r4, r6]
    movs r7, #6
    ldrsh r3, [r4, r7]
    add r2, sp, #0x40
    adds r0, r1, #0
    subs r0, #8
    strh r0, [r2]
    adds r0, r3, #0
    subs r0, #8
    strh r0, [r2, #2]
    adds r1, #8
    strh r1, [r2, #4]
    adds r3, #8
    strh r3, [r2, #6]
    add r3, sp, #0xc
    movs r0, #0x20
    mov ip, r0
    movs r1, #0x21
    str r1, [sp, #0xc]
    subs r0, #0x41
    str r0, [r3, #4]
    str r0, [r3, #8]
    str r1, [r3, #0xc]
    add r1, sp, #0x20
    mov r0, sp
    ldm r0!, {r2, r6, r7}
    stm r1!, {r2, r6, r7}
    ldr r0, [sp, #0x40]
    ldr r1, [sp, #0x44]
    str r0, [sp, #0x2c]
    str r1, [sp, #0x30]
    mov r0, ip
    str r0, [r3, #0x28]
    mov r1, sb
    str r1, [r3, #0x2c]
    str r1, [r3, #0x30]
    movs r0, #0x12
    ldrsb r0, [r4, r0]
    cmp r0, #0
    beq .L0803A2A6
    cmp r0, #1
    bne .L0803A2A6
    ldr r0, [r4]
    cmp r0, #1
    beq .L0803A234
    cmp r0, #1
    bgt .L0803A20A
    cmp r0, #0
    beq .L0803A214
    b .L0803A2A2
.L0803A20A:
    cmp r0, #2
    beq .L0803A254
    cmp r0, #3
    beq .L0803A274
    b .L0803A2A2
.L0803A214:
    ldr r1, [sp, #0xc]
    ldr r0, [sp, #0x34]
    cmp r1, r0
    ble .L0803A226
    adds r0, r3, #0
    bl func_080AB85C
    ldr r0, [sp, #0xc]
    b .L0803A228
.L0803A226:
    adds r0, r1, #0
.L0803A228:
    cmp r0, #1
    ble .L0803A2A2
    ldr r0, [r4, #0xc]
    adds r0, r0, r5
    str r0, [r4, #0xc]
    b .L0803A2A6
.L0803A234:
    ldr r1, [sp, #0x10]
    ldr r0, [sp, #0x34]
    cmn r1, r0
    bge .L0803A244
    adds r0, r3, #0
    bl func_080AB8D0
    ldr r1, [sp, #0x10]
.L0803A244:
    movs r0, #1
    rsbs r0, r0, #0
    cmp r1, r0
    bge .L0803A2A2
    ldr r0, [r4, #0xc]
    subs r0, r0, r5
    str r0, [r4, #0xc]
    b .L0803A2A6
.L0803A254:
    ldr r1, [sp, #0x14]
    ldr r0, [sp, #0x34]
    cmn r1, r0
    bge .L0803A264
    adds r0, r3, #0
    bl func_080AB948
    ldr r1, [sp, #0x14]
.L0803A264:
    movs r0, #1
    rsbs r0, r0, #0
    cmp r1, r0
    bge .L0803A2A2
    ldr r0, [r4, #8]
    subs r0, r0, r5
    str r0, [r4, #8]
    b .L0803A2A6
.L0803A274:
    ldr r1, [sp, #0x18]
    ldr r0, [sp, #0x34]
    cmp r1, r0
    ble .L0803A286
    adds r0, r3, #0
    bl func_080AB9C4
    ldr r0, [sp, #0x18]
    b .L0803A288
.L0803A286:
    adds r0, r1, #0
.L0803A288:
    cmp r0, #1
    ble .L0803A2A2
    ldr r0, [r4, #8]
    adds r0, r0, r5
    str r0, [r4, #8]
    asrs r0, r0, #0x10
    movs r1, #0x91
    lsls r1, r1, #2
    cmp r0, r1
    ble .L0803A2A6
    movs r0, #0x91
    lsls r0, r0, #0x12
    str r0, [r4, #8]
.L0803A2A2:
    movs r0, #0
    strh r0, [r4, #0x10]
.L0803A2A6:
    movs r2, #0xa
    ldrsh r0, [r4, r2]
    strh r0, [r4, #4]
    movs r6, #0xe
    ldrsh r0, [r4, r6]
    strh r0, [r4, #6]
    mov r1, r8
    adds r1, #0x47
    ldrb r0, [r1]
    cmp r0, #0
    bne .L0803A2D2
    mov r0, r8
    adds r0, #0x30
    bl func_0805E8F0
    lsls r0, r0, #0x1e
    cmp r0, #0
    bge .L0803A2D6
    mov r1, r8
    adds r1, #0x44
    movs r0, #1
    b .L0803A2D4
.L0803A2D2:
    movs r0, #0
.L0803A2D4:
    strb r0, [r1]
.L0803A2D6:
    ldrh r0, [r4, #0x10]
    subs r0, #1
    strh r0, [r4, #0x10]
    lsls r0, r0, #0x10
    cmp r0, #0
    bge .L0803A310
    movs r0, #3
    bl func_080AB788
    lsls r0, r0, #0x10
    asrs r1, r0, #0x10
    cmp r1, #3
    bne .L0803A2F6
    movs r0, #0
    strb r0, [r4, #0x12]
    b .L0803A302
.L0803A2F6:
    movs r0, #1
    strb r0, [r4, #0x12]
    ldr r0, [r4]
    bl func_080AB7A4
    str r0, [r4]
.L0803A302:
    movs r0, #0x1f
    bl func_080AB788
    adds r0, #0x10
    strh r0, [r4, #0x10]
    movs r7, #1
    mov sb, r7
.L0803A310:
    mov r0, sb
    add sp, #0x48
    pop {r3, r4}
    mov r8, r3
    mov sb, r4
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1

    .section .text.after_entity3a350, "ax", %progbits
    thumb_func_start func_0803A394
func_0803A394: @ 0x0803A394
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #8
    adds r6, r0, #0
    mov r8, r1
    adds r5, r2, #0
    lsls r3, r3, #0x18
    lsrs r3, r3, #0x18
    mov sb, r3
    ldr r7, .L0803A3E4 @ =gUnk_080F1904
    cmp r3, #0
    bne .L0803A3B4
    ldr r7, .L0803A3E8 @ =gUnk_080F18D2
.L0803A3B4:
    movs r0, #4
    mov sl, r0
    mov r1, sb
    cmp r1, #0
    bne .L0803A3C2
    movs r2, #0xa
    mov sl, r2
.L0803A3C2:
    movs r0, #0x63
    bl func_080AB788
    lsls r0, r0, #0x10
    lsrs r4, r0, #0x10
    movs r3, #0
    str r3, [sp]
    movs r0, #0
    str r0, [sp, #4]
    mov ip, r0
    cmp r5, #1
    beq .L0803A3FC
    cmp r5, #1
    bgt .L0803A3EC
    cmp r5, #0
    beq .L0803A3F6
    b .L0803A40C
    .align 2, 0
.L0803A3E4: .4byte gUnk_080F1904
.L0803A3E8: .4byte gUnk_080F18D2
.L0803A3EC:
    cmp r5, #2
    beq .L0803A402
    cmp r5, #3
    beq .L0803A408
    b .L0803A40C
.L0803A3F6:
    movs r1, #0
    mov ip, r1
    b .L0803A40C
.L0803A3FC:
    movs r2, #1
    mov ip, r2
    b .L0803A40C
.L0803A402:
    movs r3, #2
    mov ip, r3
    b .L0803A40C
.L0803A408:
    movs r5, #3
    mov ip, r5
.L0803A40C:
    movs r3, #0
    cmp r3, sl
    bge .L0803A458
    lsls r0, r4, #0x10
    asrs r0, r0, #0x10
    mov r2, ip
    adds r1, r7, r2
    ldrb r1, [r1]
    cmp r0, r1
    bge .L0803A428
    str r3, [sp]
    ldrb r5, [r7, #4]
    str r5, [sp, #4]
    b .L0803A458
.L0803A428:
    lsls r0, r3, #2
    adds r0, r0, r3
    adds r0, r0, r7
    add r0, ip
    ldrb r0, [r0]
    subs r0, r4, r0
    lsls r0, r0, #0x10
    lsrs r4, r0, #0x10
    adds r3, #1
    cmp r3, sl
    bge .L0803A458
    lsls r0, r4, #0x10
    asrs r0, r0, #0x10
    lsls r1, r3, #2
    adds r1, r1, r3
    adds r2, r1, r7
    mov r5, ip
    adds r1, r2, r5
    ldrb r1, [r1]
    cmp r0, r1
    bge .L0803A428
    str r3, [sp]
    ldrb r2, [r2, #4]
    str r2, [sp, #4]
.L0803A458:
    ldr r0, [sp]
    cmp r0, #0
    beq .L0803A468
    mov r1, sb
    cmp r1, #0
    beq .L0803A468
    adds r0, #9
    str r0, [sp]
.L0803A468:
    ldr r2, [sp, #4]
    cmp r2, #1
    ble .L0803A47A
    adds r0, r2, #0
    subs r0, #1
    bl func_080AB788
    adds r0, #1
    str r0, [sp, #4]
.L0803A47A:
    ldr r3, [sp, #4]
    cmp r3, #0
    bgt .L0803A482
    b .L0803A782
.L0803A482:
    movs r0, #0xc4
    lsls r0, r0, #1
    bl func_080AB788
    adds r5, r0, #0
    adds r5, #0xb8
    cmp r5, #0xef
    bgt .L0803A4A0
    movs r0, #0x38
    bl func_080AB788
    movs r1, #0xf8
    lsls r1, r1, #1
    adds r7, r0, r1
    b .L0803A4AC
.L0803A4A0:
    movs r0, #0x30
    bl func_080AB788
    movs r2, #0x8a
    lsls r2, r2, #2
    adds r7, r0, r2
.L0803A4AC:
    ldr r0, [sp]
    subs r0, #1
    cmp r0, #0xb
    bls .L0803A4B6
    b .L0803A776
.L0803A4B6:
    lsls r0, r0, #2
    ldr r1, .L0803A4C0 @ =.L0803A4C4
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L0803A4C0: .4byte .L0803A4C4
.L0803A4C4: @ jump table
    .4byte .L0803A4F4 @ case 0
    .4byte .L0803A55C @ case 1
    .4byte .L0803A578 @ case 2
    .4byte .L0803A598 @ case 3
    .4byte .L0803A5B8 @ case 4
    .4byte .L0803A608 @ case 5
    .4byte .L0803A670 @ case 6
    .4byte .L0803A690 @ case 7
    .4byte .L0803A6B0 @ case 8
    .4byte .L0803A6D0 @ case 9
    .4byte .L0803A6F0 @ case 10
    .4byte .L0803A710 @ case 11
.L0803A4F4:
    movs r0, #0x64
    bl __builtin_new
    adds r4, r0, #0
    mov r1, r8
    ldr r2, .L0803A554 @ =0x000009B6
    movs r3, #1
    bl func_08039E98
    ldr r0, .L0803A558 @ =vtable_unk_080E76A4
.L0803A508:
    str r0, [r4, #0x4c]
    movs r1, #0
    str r1, [r4, #0x50]
    adds r2, r4, #0
    adds r2, #0x54
    movs r3, #0
    strh r5, [r2]
    adds r5, r4, #0
    adds r5, #0x56
    strh r7, [r5]
    adds r0, r4, #0
    adds r0, #0x60
    strh r1, [r0]
    adds r0, #2
    strb r3, [r0]
    movs r3, #0
    ldrsh r0, [r2, r3]
    lsls r0, r0, #0x10
    str r0, [r4, #0x58]
    movs r1, #0
    ldrsh r0, [r5, r1]
    lsls r0, r0, #0x10
    str r0, [r4, #0x5c]
.L0803A536:
    adds r1, r6, #0
    adds r1, #8
    ldr r0, [r6, #8]
    cmp r0, #2
    bls .L0803A542
    b .L0803A776
.L0803A542:
    lsls r0, r0, #2
    adds r0, #4
    adds r0, r1, r0
    cmp r0, #0
    bne .L0803A54E
    b .L0803A770
.L0803A54E:
    str r4, [r0]
    b .L0803A770
    .align 2, 0
.L0803A554: .4byte 0x000009B6
.L0803A558: .4byte vtable_unk_080E76A4
.L0803A55C:
    movs r0, #0x64
    bl __builtin_new
    adds r4, r0, #0
    mov r1, r8
    movs r2, #0x10
    movs r3, #1
    bl func_08039E98
    ldr r0, .L0803A574 @ =vtable_unk_080E768C
    b .L0803A508
    .align 2, 0
.L0803A574: .4byte vtable_unk_080E768C
.L0803A578:
    movs r0, #0x64
    bl __builtin_new
    adds r4, r0, #0
    mov r1, r8
    ldr r2, .L0803A590 @ =0x000003DB
    movs r3, #1
    bl func_08039E98
    ldr r0, .L0803A594 @ =vtable_unk_080E7674
    b .L0803A508
    .align 2, 0
.L0803A590: .4byte 0x000003DB
.L0803A594: .4byte vtable_unk_080E7674
.L0803A598:
    movs r0, #0x64
    bl __builtin_new
    adds r4, r0, #0
    mov r1, r8
    ldr r2, .L0803A5B0 @ =0x00000806
    movs r3, #1
    bl func_08039E98
    ldr r0, .L0803A5B4 @ =vtable_unk_080E765C
    b .L0803A508
    .align 2, 0
.L0803A5B0: .4byte 0x00000806
.L0803A5B4: .4byte vtable_unk_080E765C
.L0803A5B8:
    movs r0, #0x6c
    bl __builtin_new
    adds r4, r0, #0
    mov r1, r8
    ldr r2, .L0803A600 @ =0x00000202
    movs r3, #1
    bl func_08039E98
    ldr r0, .L0803A604 @ =vtable_unk_080E7644
    str r0, [r4, #0x4c]
    movs r1, #0
    str r1, [r4, #0x50]
    adds r2, r4, #0
    adds r2, #0x54
    movs r3, #0
    strh r5, [r2]
    adds r5, r4, #0
    adds r5, #0x56
    strh r7, [r5]
    adds r0, r4, #0
    adds r0, #0x60
    strh r1, [r0]
    adds r0, #2
    strb r3, [r0]
    movs r3, #0
    ldrsh r0, [r2, r3]
    lsls r0, r0, #0x10
    str r0, [r4, #0x58]
    movs r2, #0
    ldrsh r0, [r5, r2]
    lsls r0, r0, #0x10
    str r0, [r4, #0x5c]
    str r1, [r4, #0x68]
    b .L0803A536
    .align 2, 0
.L0803A600: .4byte 0x00000202
.L0803A604: .4byte vtable_unk_080E7644
.L0803A608:
    movs r0, #0x88
    bl __builtin_new
    adds r5, r0, #0
    mov r1, r8
    movs r2, #0xa9
    lsls r2, r2, #2
    movs r3, #1
    bl func_08039E98
    ldr r0, .L0803A66C @ =vtable_unk_080E762C
    str r0, [r5, #0x4c]
    movs r4, #0
    str r4, [r5, #0x50]
    adds r1, r5, #0
    adds r1, #0x50
    adds r0, r5, #0
    movs r2, #1
    rsbs r2, r2, #0
    bl func_0803A144
    adds r1, r5, #0
    adds r1, #0x78
    strb r0, [r1]
    adds r1, #1
    movs r0, #0xff
    strb r0, [r1]
    adds r0, r5, #0
    adds r0, #0x60
    movs r1, #0
    strh r4, [r0]
    adds r0, #2
    strb r1, [r0]
    subs r0, #0xe
    movs r3, #0
    ldrsh r0, [r0, r3]
    lsls r0, r0, #0x10
    str r0, [r5, #0x58]
    adds r0, r5, #0
    adds r0, #0x56
    movs r1, #0
    ldrsh r0, [r0, r1]
    lsls r0, r0, #0x10
    str r0, [r5, #0x5c]
    adds r1, r5, #0
    adds r1, #0x84
    movs r0, #0xf8
    strb r0, [r1]
    b .L0803A75A
    .align 2, 0
.L0803A66C: .4byte vtable_unk_080E762C
.L0803A670:
    movs r0, #0x64
    bl __builtin_new
    adds r4, r0, #0
    mov r1, r8
    ldr r2, .L0803A688 @ =0x0000087B
    movs r3, #1
    bl func_08039E98
    ldr r0, .L0803A68C @ =vtable_unk_080E7614
    b .L0803A508
    .align 2, 0
.L0803A688: .4byte 0x0000087B
.L0803A68C: .4byte vtable_unk_080E7614
.L0803A690:
    movs r0, #0x64
    bl __builtin_new
    adds r4, r0, #0
    mov r1, r8
    ldr r2, .L0803A6A8 @ =0x0000065C
    movs r3, #1
    bl func_08039E98
    ldr r0, .L0803A6AC @ =vtable_unk_080E75FC
    b .L0803A508
    .align 2, 0
.L0803A6A8: .4byte 0x0000065C
.L0803A6AC: .4byte vtable_unk_080E75FC
.L0803A6B0:
    movs r0, #0x64
    bl __builtin_new
    adds r4, r0, #0
    mov r1, r8
    ldr r2, .L0803A6C8 @ =0x000008F9
    movs r3, #1
    bl func_08039E98
    ldr r0, .L0803A6CC @ =vtable_unk_080E75E4
    b .L0803A508
    .align 2, 0
.L0803A6C8: .4byte 0x000008F9
.L0803A6CC: .4byte vtable_unk_080E75E4
.L0803A6D0:
    movs r0, #0x64
    bl __builtin_new
    adds r4, r0, #0
    mov r1, r8
    ldr r2, .L0803A6E8 @ =0x000009A9
    movs r3, #1
    bl func_08039E98
    ldr r0, .L0803A6EC @ =vtable_unk_080E75CC
    b .L0803A508
    .align 2, 0
.L0803A6E8: .4byte 0x000009A9
.L0803A6EC: .4byte vtable_unk_080E75CC
.L0803A6F0:
    movs r0, #0x64
    bl __builtin_new
    adds r4, r0, #0
    mov r1, r8
    ldr r2, .L0803A708 @ =0x000008FD
    movs r3, #1
    bl func_08039E98
    ldr r0, .L0803A70C @ =vtable_unk_080E75B4
    b .L0803A508
    .align 2, 0
.L0803A708: .4byte 0x000008FD
.L0803A70C: .4byte vtable_unk_080E75B4
.L0803A710:
    movs r0, #0x64
    bl __builtin_new
    adds r5, r0, #0
    mov r1, r8
    movs r2, #0x15
    movs r3, #0
    bl func_08039E98
    ldr r0, .L0803A794 @ =vtable_unk_080E759C
    str r0, [r5, #0x4c]
    movs r4, #0
    str r4, [r5, #0x50]
    adds r1, r5, #0
    adds r1, #0x50
    adds r0, r5, #0
    movs r2, #1
    rsbs r2, r2, #0
    bl func_0803A144
    adds r0, r5, #0
    adds r0, #0x60
    movs r1, #0
    strh r4, [r0]
    adds r0, #2
    strb r1, [r0]
    subs r0, #0xe
    movs r2, #0
    ldrsh r0, [r0, r2]
    lsls r0, r0, #0x10
    str r0, [r5, #0x58]
    adds r0, r5, #0
    adds r0, #0x56
    movs r3, #0
    ldrsh r0, [r0, r3]
    lsls r0, r0, #0x10
    str r0, [r5, #0x5c]
.L0803A75A:
    adds r1, r6, #0
    adds r1, #8
    ldr r0, [r6, #8]
    cmp r0, #2
    bhi .L0803A776
    lsls r0, r0, #2
    adds r0, #4
    adds r0, r1, r0
    cmp r0, #0
    beq .L0803A770
    str r5, [r0]
.L0803A770:
    ldr r0, [r6, #8]
    adds r0, #1
    str r0, [r6, #8]
.L0803A776:
    ldr r5, [sp, #4]
    subs r5, #1
    str r5, [sp, #4]
    cmp r5, #0
    ble .L0803A782
    b .L0803A482
.L0803A782:
    add sp, #8
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L0803A794: .4byte vtable_unk_080E759C
