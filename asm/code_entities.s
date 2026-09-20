    .INCLUDE "asm/macro.inc"
    .SYNTAX UNIFIED

    thumb_func_start func_08020060
func_08020060: @ 0x08020060
    push {r4, lr}
    adds r4, r0, #0
    ldr r0, [r4]
    ldr r1, [r0]
    ldr r1, [r1, #0x14]
    bl _call_via_r1
    movs r1, #0
    ldrh r4, [r4, #4]
    cmp r0, r4
    bne .L08020078
    movs r1, #1
.L08020078:
    adds r0, r1, #0
    pop {r4}
    pop {r1}
    bx r1

    thumb_func_start func_08020080
func_08020080: @ 0x08020080
    push {r4, r5, lr}
    adds r3, r0, #0
    movs r4, #0
    movs r5, #0
    cmp r1, #0
    beq .L080200B8
    adds r0, #0x20
    ldrb r0, [r0]
    adds r2, r0, #0
    cmp r0, #1
    beq .L080200AE
    cmp r0, #1
    bgt .L080200A0
    cmp r0, #0
    beq .L080200AA
    b .L080200B8
.L080200A0:
    cmp r2, #2
    beq .L080200B2
    cmp r2, #3
    beq .L080200B6
    b .L080200B8
.L080200AA:
    adds r5, r1, #0
    b .L080200B8
.L080200AE:
    rsbs r5, r1, #0
    b .L080200B8
.L080200B2:
    rsbs r4, r1, #0
    b .L080200B8
.L080200B6:
    adds r4, r1, #0
.L080200B8:
    str r4, [r3, #0x18]
    str r5, [r3, #0x1c]
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_080200C4
func_080200C4: @ 0x080200C4
    push {r4, r5, r6, r7, lr}
    mov r7, r8
    push {r7}
    adds r4, r0, #0
    mov r8, r1
    adds r6, r4, #0
    adds r6, #0x30
    ldrb r0, [r6]
    cmp r0, #0
    bne .L08020126
    adds r0, r4, #0
    bl func_08020060
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08020126
    ldr r0, [r4]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    adds r7, r6, #0
    mov r0, r8
    lsls r6, r0, #0x10
    cmp r4, r5
    beq .L08020118
.L08020102:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08020112
    ldr r0, [r4]
    b .L0802011C
.L08020112:
    adds r4, #4
    cmp r4, r5
    bne .L08020102
.L08020118:
    subs r0, r5, #4
    ldr r0, [r0]
.L0802011C:
    lsrs r1, r6, #0x10
    bl func_08008B6C
    movs r0, #1
    strb r0, [r7]
.L08020126:
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0

    thumb_func_start func_08020130
func_08020130: @ 0x08020130
    push {r4, lr}
    ldr r0, [r0, #0x10]
    cmp r0, #0
    beq .L08020166
    movs r4, #0
    adds r2, r0, #0
    adds r2, #0x30
    movs r1, #0
    ldrh r0, [r2, #0xe]
    cmp r0, #0
    beq .L08020150
    movs r0, #0x10
    ldrsh r1, [r2, r0]
    rsbs r0, r1, #0
    orrs r0, r1
    lsrs r1, r0, #0x1f
.L08020150:
    cmp r1, #0
    beq .L08020160
    adds r0, r2, #0
    bl func_0805E894
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08020162
.L08020160:
    movs r4, #1
.L08020162:
    adds r0, r4, #0
    b .L08020168
.L08020166:
    movs r0, #1
.L08020168:
    pop {r4}
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_08020170
func_08020170: @ 0x08020170
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #4
    adds r7, r0, #0
    ldr r2, [r7, #8]
    ldr r3, [r7, #0xc]
    ldr r0, [r7, #0x18]
    adds r0, r0, r2
    mov sl, r0
    ldr r0, [r7, #0x1c]
    adds r0, r0, r3
    mov sb, r0
    cmp r1, #0
    beq .L08020286
    adds r4, r1, #0
    asrs r2, r2, #0x10
    str r2, [sp]
    asrs r6, r3, #0x10
    asrs r0, r0, #0x10
    subs r5, r0, r6
    mov r1, sl
    asrs r0, r1, #0x10
    subs r2, r0, r2
    mov r8, r2
    cmp r5, #0
    ble .L080201DC
    ldr r1, [r4]
    ldr r0, [r4, #0x28]
    cmp r1, r0
    ble .L080201BC
    adds r0, r4, #0
    bl func_080AB85C
    ldr r0, [r4]
    b .L080201BE
.L080201BC:
    adds r0, r1, #0
.L080201BE:
    cmp r5, r0
    ble .L080201DC
    ldr r1, [r4]
    ldr r0, [r4, #0x28]
    cmp r1, r0
    ble .L080201D4
    adds r0, r4, #0
    bl func_080AB85C
    ldr r0, [r4]
    b .L080201D6
.L080201D4:
    adds r0, r1, #0
.L080201D6:
    adds r0, r6, r0
    lsls r0, r0, #0x10
    mov sb, r0
.L080201DC:
    cmp r5, #0
    bge .L08020212
    ldr r1, [r4, #4]
    ldr r0, [r4, #0x28]
    cmn r1, r0
    bge .L080201F2
    adds r0, r4, #0
    bl func_080AB8D0
    ldr r0, [r4, #4]
    b .L080201F4
.L080201F2:
    adds r0, r1, #0
.L080201F4:
    cmp r5, r0
    bge .L08020212
    ldr r1, [r4, #4]
    ldr r0, [r4, #0x28]
    cmn r1, r0
    bge .L0802020A
    adds r0, r4, #0
    bl func_080AB8D0
    ldr r0, [r4, #4]
    b .L0802020C
.L0802020A:
    adds r0, r1, #0
.L0802020C:
    adds r0, r6, r0
    lsls r0, r0, #0x10
    mov sb, r0
.L08020212:
    mov r0, r8
    cmp r0, #0
    bge .L0802024C
    ldr r1, [r4, #8]
    ldr r0, [r4, #0x28]
    cmn r1, r0
    bge .L0802022A
    adds r0, r4, #0
    bl func_080AB948
    ldr r0, [r4, #8]
    b .L0802022C
.L0802022A:
    adds r0, r1, #0
.L0802022C:
    cmp r8, r0
    bge .L0802024C
    ldr r1, [r4, #8]
    ldr r0, [r4, #0x28]
    cmn r1, r0
    bge .L08020242
    adds r0, r4, #0
    bl func_080AB948
    ldr r0, [r4, #8]
    b .L08020244
.L08020242:
    adds r0, r1, #0
.L08020244:
    ldr r1, [sp]
    adds r0, r1, r0
    lsls r0, r0, #0x10
    mov sl, r0
.L0802024C:
    mov r0, r8
    cmp r0, #0
    ble .L08020286
    ldr r1, [r4, #0xc]
    ldr r0, [r4, #0x28]
    cmp r1, r0
    ble .L08020264
    adds r0, r4, #0
    bl func_080AB9C4
    ldr r0, [r4, #0xc]
    b .L08020266
.L08020264:
    adds r0, r1, #0
.L08020266:
    cmp r8, r0
    ble .L08020286
    ldr r1, [r4, #0xc]
    ldr r0, [r4, #0x28]
    cmp r1, r0
    ble .L0802027C
    adds r0, r4, #0
    bl func_080AB9C4
    ldr r0, [r4, #0xc]
    b .L0802027E
.L0802027C:
    adds r0, r1, #0
.L0802027E:
    ldr r1, [sp]
    adds r0, r1, r0
    lsls r0, r0, #0x10
    mov sl, r0
.L08020286:
    mov r0, sl
    str r0, [r7, #8]
    mov r1, sb
    str r1, [r7, #0xc]
    add sp, #4
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_080202A0
func_080202A0: @ 0x080202A0
    push {r4, lr}
    movs r3, #0xa
    ldrsh r2, [r1, r3]
    movs r4, #0xe
    ldrsh r3, [r1, r4]
    subs r1, r2, #7
    strh r1, [r0]
    adds r1, r3, #0
    subs r1, #9
    strh r1, [r0, #2]
    adds r2, #7
    strh r2, [r0, #4]
    adds r3, #5
    strh r3, [r0, #6]
    pop {r4}
    pop {r2}
    bx r2
    .align 2, 0

    thumb_func_start func_080202C4
func_080202C4: @ 0x080202C4
    bx lr
    .align 2, 0

    thumb_func_start func_080202C8
func_080202C8: @ 0x080202C8
    bx lr
    .align 2, 0
.L080202CC:
    .byte 0x00, 0x20, 0x70, 0x47
    .byte 0x00, 0x20, 0x70, 0x47, 0x00, 0x20, 0x70, 0x47, 0x00, 0x20, 0x70, 0x47, 0x00, 0x20, 0x70, 0x47
    .byte 0x00, 0x20, 0x70, 0x47, 0x00, 0x20, 0x70, 0x47, 0x00, 0x20, 0x70, 0x47, 0x70, 0x47, 0x00, 0x00
    .byte 0x70, 0x47, 0x00, 0x00, 0x70, 0x47, 0x00, 0x00, 0x70, 0x47, 0x00, 0x00, 0x05, 0x20, 0x70, 0x47
    .byte 0x05, 0x20, 0x70, 0x47, 0x70, 0x47, 0x00, 0x00, 0x70, 0x47, 0x00, 0x00, 0x70, 0x47, 0x00, 0x00

    thumb_func_start func_08020310
func_08020310: @ 0x08020310
    push {r4, r5, r6, r7, lr}
    sub sp, #0xc
    adds r6, r0, #0
    adds r7, r1, #0
    adds r4, r2, #0
    adds r5, r3, #0
    add r0, sp, #4
    adds r1, r4, #0
    bl __5ActorRC5Actor
    movs r3, #0xd0
    lsls r3, r3, #2
    adds r0, r6, #0
    adds r1, r7, #0
    add r2, sp, #4
    bl func_08020038
    ldr r0, .L08020378 @ =vtable_unk_080E64C8
    str r0, [r6, #0x14]
    str r4, [r6, #0x34]
    str r5, [r6, #0x38]
    adds r1, r6, #0
    adds r1, #0x40
    movs r0, #0
    strb r0, [r1]
    ldr r0, [r4, #0x20]
    cmp r0, #5
    bne .L08020384
    ldr r0, [r7]
    ldr r2, [r0, #0x40]
    adds r0, r7, #0
    movs r1, #0x4b
    bl _call_via_r2
    adds r4, r0, #0
    cmp r4, #0
    beq .L08020384
    ldrh r0, [r4, #4]
    ldrh r1, [r6, #4]
    cmp r0, r1
    bne .L0802037C
    ldr r1, [r6, #8]
    ldr r2, [r6, #0xc]
    ldrh r3, [r6, #0x22]
    adds r0, r6, #0
    adds r0, #0x20
    ldrb r0, [r0]
    str r0, [sp]
    adds r0, r4, #0
    bl func_08038374
    b .L08020384
    .align 2, 0
.L08020378: .4byte vtable_unk_080E64C8
.L0802037C:
    adds r0, r6, #0
    movs r1, #0
    bl func_08020410
.L08020384:
    adds r0, r6, #0
    bl func_08021264
    adds r1, r0, #0
    adds r0, r6, #0
    adds r0, #0x20
    ldrb r2, [r0]
    adds r0, r6, #0
    bl func_080211E4
    adds r0, r6, #0
    add sp, #0xc
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    .align 2, 0
.L080203A4:
    .byte 0x70, 0xB5, 0x82, 0xB0, 0x05, 0x1C, 0x0E, 0x1C, 0x16, 0x48, 0x68, 0x61
    .byte 0x28, 0x1C, 0x40, 0x30, 0x00, 0x78, 0x00, 0x28, 0x07, 0xD0, 0x3C, 0x21, 0x68, 0x5E, 0x00, 0x04
    .byte 0xA8, 0x60, 0x3E, 0x21, 0x68, 0x5E, 0x00, 0x04, 0xE8, 0x60, 0x6C, 0x6B, 0x68, 0x46, 0x29, 0x1C
    .byte 0x11, 0xF0, 0xCE, 0xFE, 0x20, 0x1C, 0x69, 0x46, 0x7A, 0xF0, 0xA4, 0xFE, 0x0B, 0x48, 0x68, 0x61
    .byte 0x29, 0x69, 0x00, 0x29, 0x05, 0xD0, 0x48, 0x68, 0x82, 0x68, 0x08, 0x1C, 0x03, 0x21, 0xB3, 0xF0
    .byte 0x91, 0xFA, 0x01, 0x20, 0x30, 0x40, 0x00, 0x28, 0x02, 0xD0, 0x28, 0x1C, 0xE0, 0xF7, 0x04, 0xF9
    .byte 0x02, 0xB0, 0x70, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0xC8, 0x64, 0x0E, 0x08, 0x50, 0x62, 0x0E, 0x08

    thumb_func_start func_08020410
func_08020410: @ 0x08020410
    push {r4, r5, lr}
    sub sp, #4
    adds r4, r0, #0
    adds r5, r1, #0
    ldr r0, [r4, #0x34]
    ldr r0, [r0, #0x20]
    cmp r0, #5
    bne .L08020426
    adds r0, r4, #0
    bl func_080212C0
.L08020426:
    lsls r1, r5, #0x10
    lsrs r1, r1, #0x10
    ldr r2, .L08020458 @ =0xFFFF0000
    ldr r0, [sp]
    ands r0, r2
    orrs r0, r1
    ldr r1, .L0802045C @ =0xFF00FFFF
    ands r0, r1
    str r0, [sp]
    ldr r0, [r4, #0x34]
    mov r1, sp
    bl method_0809BB48__3DogPC15UnkBarnAnimal2C
    adds r0, r4, #0
    adds r0, #0x20
    ldrb r2, [r0]
    adds r0, r4, #0
    movs r1, #0
    bl func_080211E4
    add sp, #4
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L08020458: .4byte 0xFFFF0000
.L0802045C: .4byte 0xFF00FFFF

    thumb_func_start func_08020460
func_08020460: @ 0x08020460
    push {lr}
    movs r1, #0
    ldr r0, [r0, #0x34]
    ldr r0, [r0, #0x20]
    cmp r0, #5
    bne .L0802046E
    movs r1, #1
.L0802046E:
    adds r0, r1, #0
    pop {r1}
    bx r1
.L08020474:
    .byte 0x10, 0xB5, 0x04, 0x1C, 0x00, 0xF0, 0x28, 0xF8, 0x21, 0x1C, 0x30, 0x31
    .byte 0x00, 0x20, 0x08, 0x70, 0xA0, 0x8C, 0x00, 0x28, 0x01, 0xD0, 0x01, 0x38, 0x00, 0xE0, 0xE0, 0x8C
    .byte 0xA0, 0x84, 0x22, 0x69, 0x00, 0x2A, 0x04, 0xD0, 0x50, 0x68, 0xC1, 0x68, 0x10, 0x1C, 0xB3, 0xF0
    .byte 0x37, 0xFA, 0x10, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x30, 0xB5, 0x04, 0x1C, 0x0D, 0x1C, 0x11, 0xF0
    .byte 0x5F, 0xFF, 0x00, 0x06, 0x00, 0x28, 0x02, 0xD0, 0x20, 0x1C, 0x00, 0xF0, 0x07, 0xF8, 0x20, 0x1C
    .byte 0x29, 0x1C, 0x11, 0xF0, 0xB3, 0xFF, 0x30, 0xBC, 0x01, 0xBC, 0x00, 0x47

    thumb_func_start func_080204CC
func_080204CC: @ 0x080204CC
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #0xfc
    adds r6, r0, #0
    ldr r0, [r6]
    str r0, [sp, #0xd8]
    ldr r1, [r6, #0x34]
    mov sl, r1
    mov r0, sl
    bl GetGrowthStage__C3Dog
    adds r5, r0, #0
    ldrh r2, [r6, #4]
    str r2, [sp, #0xdc]
    ldr r3, [sp, #0xd8]
    ldr r1, [r3]
    add r0, sp, #8
    ldr r3, [r1, #0x34]
    ldr r1, [sp, #0xd8]
    bl _call_via_r3
    ldr r1, [r6, #0x14]
    add r4, sp, #0x7c
    adds r0, r4, #0
    ldr r2, [r1, #0xc]
    adds r1, r6, #0
    bl _call_via_r2
    movs r1, #0
    movs r0, #0
    mov r8, r4
    ldr r4, [sp, #0xdc]
    cmp r4, #8
    bgt .L08020518
    movs r0, #1
.L08020518:
    cmp r0, #0
    beq .L08020522
    cmp r5, #1
    bne .L08020522
    movs r1, #1
.L08020522:
    adds r2, r1, #0
    cmp r2, #0
    beq .L0802053C
    mov r7, r8
    movs r1, #4
    ldrsh r0, [r7, r1]
    add r1, sp, #0x7c
    movs r3, #0
    ldrsh r1, [r1, r3]
    subs r0, r0, r1
    adds r0, #0x10
    str r0, [sp, #0xe0]
    b .L08020540
.L0802053C:
    movs r4, #0
    str r4, [sp, #0xe0]
.L08020540:
    cmp r2, #0
    beq .L08020556
    mov r7, r8
    movs r1, #6
    ldrsh r0, [r7, r1]
    movs r2, #2
    ldrsh r1, [r7, r2]
    subs r0, r0, r1
    adds r0, #0x10
    str r0, [sp, #0xe4]
    b .L0802055A
.L08020556:
    movs r3, #0
    str r3, [sp, #0xe4]
.L0802055A:
    add r4, sp, #0x14
    movs r7, #0x21
    str r7, [sp, #0x14]
    movs r0, #0x21
    rsbs r0, r0, #0
    str r0, [r4, #4]
    str r0, [r4, #8]
    str r7, [r4, #0xc]
    add r1, sp, #0x28
    add r0, sp, #8
    ldm r0!, {r2, r3, r7}
    stm r1!, {r2, r3, r7}
    ldr r0, [sp, #0x7c]
    ldr r1, [sp, #0x80]
    str r0, [sp, #0x34]
    str r1, [sp, #0x38]
    movs r0, #0x20
    str r0, [r4, #0x28]
    ldr r1, [sp, #0xe0]
    str r1, [sp, #0x40]
    ldr r2, [sp, #0xe4]
    str r2, [sp, #0x44]
    ldr r3, [sp, #0xd8]
    ldr r0, [r3]
    ldr r2, [r0, #0x40]
    adds r0, r3, #0
    movs r1, #0
    bl _call_via_r2
    mov sb, r0
    ldr r7, [sp, #0xd8]
    ldr r0, [r7]
    ldr r2, [r0, #0x40]
    adds r0, r7, #0
    movs r1, #0x4a
    bl _call_via_r2
    adds r7, r0, #0
    movs r0, #0
    str r0, [sp, #0xe8]
    adds r0, r6, #0
    adds r0, #0x40
    ldrb r1, [r0]
    str r0, [sp, #0xf8]
    cmp r1, #0
    bne .L080205B8
    b .L080206EE
.L080205B8:
    movs r1, #0
    ldrh r0, [r6, #0x24]
    cmp r0, #0
    bne .L080205C2
    movs r1, #1
.L080205C2:
    cmp r1, #0
    bne .L080205C8
    b .L080206EE
.L080205C8:
    add r1, sp, #0xe8
    ldrb r2, [r1]
    ldr r1, [sp, #0xf8]
    strb r2, [r1]
    movs r2, #0x3c
    ldrsh r0, [r6, r2]
    lsls r0, r0, #0x10
    str r0, [r6, #8]
    movs r3, #0x3e
    ldrsh r0, [r6, r3]
    lsls r0, r0, #0x10
    str r0, [r6, #0xc]
    ldr r1, [r6, #0x14]
    add r4, sp, #0x84
    adds r0, r4, #0
    ldr r2, [r1, #0xc]
    adds r1, r6, #0
    bl _call_via_r2
    ldr r0, [r4]
    ldr r1, [r4, #4]
    str r0, [sp, #0x7c]
    str r1, [sp, #0x80]
    mov r4, r8
    movs r0, #4
    ldrsh r5, [r4, r0]
    movs r1, #0
    ldrsh r0, [r4, r1]
    subs r5, r5, r0
    adds r5, #0x10
    mov ip, r5
    movs r2, #6
    ldrsh r4, [r4, r2]
    mov r3, r8
    movs r5, #2
    ldrsh r0, [r3, r5]
    subs r4, r4, r0
    adds r4, #0x10
    mov r8, r4
    add r1, sp, #0x48
    movs r0, #0x21
    str r0, [sp, #0x48]
    movs r2, #0x21
    rsbs r2, r2, #0
    str r2, [r1, #4]
    str r2, [r1, #8]
    str r0, [r1, #0xc]
    add r2, sp, #0x5c
    add r0, sp, #8
    ldm r0!, {r3, r4, r5}
    stm r2!, {r3, r4, r5}
    ldr r2, [sp, #0x7c]
    ldr r3, [sp, #0x80]
    str r2, [sp, #0x68]
    str r3, [sp, #0x6c]
    movs r0, #0x20
    str r0, [r1, #0x28]
    mov r2, ip
    str r2, [sp, #0x74]
    mov r3, r8
    str r3, [sp, #0x78]
    add r0, sp, #0x14
    movs r2, #0x34
    bl memcpy
    mov r4, sb
    cmp r4, #0
    beq .L08020670
    ldrh r0, [r4, #4]
    ldr r5, [sp, #0xdc]
    cmp r0, r5
    bne .L08020670
    ldr r1, [r4, #0x14]
    add r4, sp, #0x8c
    adds r0, r4, #0
    ldr r2, [r1, #0xc]
    mov r1, sb
    bl _call_via_r2
    add r0, sp, #0x14
    adds r1, r4, #0
    movs r2, #1
    bl func_080ABA90
.L08020670:
    cmp r7, #0
    beq .L08020694
    ldrh r0, [r7, #4]
    ldr r1, [sp, #0xdc]
    cmp r0, r1
    bne .L08020694
    ldr r1, [r7, #0x14]
    add r4, sp, #0x94
    adds r0, r4, #0
    ldr r2, [r1, #0xc]
    adds r1, r7, #0
    bl _call_via_r2
    add r0, sp, #0x14
    adds r1, r4, #0
    movs r2, #0
    bl func_080ABA90
.L08020694:
    adds r0, r6, #0
    bl func_08021264
    adds r1, r0, #0
    adds r4, r6, #0
    adds r4, #0x20
    ldrb r2, [r4]
    adds r0, r6, #0
    bl func_080211E4
    mov r2, sl
    ldr r0, [r2, #0x20]
    cmp r0, #5
    beq .L080206B4
    bl .L080210A0
.L080206B4:
    ldr r3, [sp, #0xe8]
    cmp r3, #0
    bne .L080206D2
    ldr r5, [sp, #0xd8]
    ldr r0, [r5]
    ldr r2, [r0, #0x40]
    adds r0, r5, #0
    movs r1, #0x4b
    bl _call_via_r2
    str r0, [sp, #0xe8]
    cmp r0, #0
    bne .L080206D2
    bl .L080210A0
.L080206D2:
    ldr r7, [sp, #0xe8]
    ldrh r0, [r7, #4]
    ldr r1, [sp, #0xdc]
    cmp r0, r1
    beq .L080206E0
    bl .L080210A0
.L080206E0:
    ldrh r1, [r6, #0x22]
    ldrb r2, [r4]
    adds r0, r7, #0
    bl func_08038398
    bl .L080210A0
.L080206EE:
    mov r2, sb
    cmp r2, #0
    beq .L08020714
    ldrh r0, [r2, #4]
    ldr r3, [sp, #0xdc]
    cmp r0, r3
    bne .L08020714
    ldr r1, [r2, #0x14]
    add r4, sp, #0x9c
    adds r0, r4, #0
    ldr r2, [r1, #0xc]
    mov r1, sb
    bl _call_via_r2
    add r0, sp, #0x14
    adds r1, r4, #0
    movs r2, #1
    bl func_080ABA90
.L08020714:
    cmp r7, #0
    beq .L08020738
    ldrh r0, [r7, #4]
    ldr r4, [sp, #0xdc]
    cmp r0, r4
    bne .L08020738
    ldr r1, [r7, #0x14]
    add r4, sp, #0xa4
    adds r0, r4, #0
    ldr r2, [r1, #0xc]
    adds r1, r7, #0
    bl _call_via_r2
    add r0, sp, #0x14
    adds r1, r4, #0
    movs r2, #0
    bl func_080ABA90
.L08020738:
    ldr r7, [sp, #0xf8]
    ldrb r0, [r7]
    cmp r0, #0
    beq .L08020742
    b .L0802089A
.L08020742:
    cmp r5, #1
    beq .L08020748
    b .L0802089A
.L08020748:
    movs r1, #0xa
    ldrsh r0, [r6, r1]
    str r0, [sp, #0xec]
    movs r3, #0xe
    ldrsh r2, [r6, r3]
    str r2, [sp, #0xf0]
    ldr r4, [r6, #0x18]
    mov r8, r4
    ldr r7, [r6, #0x1c]
    adds r4, r0, #0
    adds r5, r2, #0
    cmp r7, #0
    ble .L08020794
    ldr r1, [sp, #0x14]
    ldr r0, [sp, #0x3c]
    cmp r1, r0
    ble .L08020774
    add r0, sp, #0x14
    bl func_080AB85C
    ldr r0, [sp, #0x14]
    b .L08020776
.L08020774:
    adds r0, r1, #0
.L08020776:
    cmp r0, #0
    bne .L08020794
    ldr r1, [sp, #0x14]
    ldr r0, [sp, #0x3c]
    cmp r1, r0
    ble .L08020788
    add r0, sp, #0x14
    bl func_080AB85C
.L08020788:
    add r1, sp, #0x24
    ldrb r0, [r1]
    cmp r0, #0
    beq .L08020794
    ldr r2, [sp, #0xe4]
    adds r5, r5, r2
.L08020794:
    cmp r7, #0
    bge .L080207CC
    ldr r1, [sp, #0x18]
    ldr r0, [sp, #0x3c]
    cmn r1, r0
    bge .L080207AA
    add r0, sp, #0x14
    bl func_080AB8D0
    ldr r0, [sp, #0x18]
    b .L080207AC
.L080207AA:
    adds r0, r1, #0
.L080207AC:
    cmp r0, #0
    bne .L080207CC
    ldr r1, [sp, #0x3c]
    ldr r0, [sp, #0x18]
    cmn r0, r1
    bge .L080207BE
    add r0, sp, #0x14
    bl func_080AB8D0
.L080207BE:
    movs r3, #0x25
    add r3, sp
    ldrb r0, [r3]
    cmp r0, #0
    beq .L080207CC
    ldr r7, [sp, #0xe4]
    subs r5, r5, r7
.L080207CC:
    mov r0, r8
    cmp r0, #0
    bge .L08020806
    ldr r1, [sp, #0x1c]
    ldr r0, [sp, #0x3c]
    cmn r1, r0
    bge .L080207E4
    add r0, sp, #0x14
    bl func_080AB948
    ldr r0, [sp, #0x1c]
    b .L080207E6
.L080207E4:
    adds r0, r1, #0
.L080207E6:
    cmp r0, #0
    bne .L08020806
    ldr r1, [sp, #0x3c]
    ldr r0, [sp, #0x1c]
    cmn r0, r1
    bge .L080207F8
    add r0, sp, #0x14
    bl func_080AB948
.L080207F8:
    movs r1, #0x26
    add r1, sp
    ldrb r0, [r1]
    cmp r0, #0
    beq .L08020806
    ldr r2, [sp, #0xe0]
    subs r4, r4, r2
.L08020806:
    mov r3, r8
    cmp r3, #0
    ble .L08020840
    ldr r1, [sp, #0x20]
    ldr r0, [sp, #0x3c]
    cmp r1, r0
    ble .L0802081E
    add r0, sp, #0x14
    bl func_080AB9C4
    ldr r0, [sp, #0x20]
    b .L08020820
.L0802081E:
    adds r0, r1, #0
.L08020820:
    cmp r0, #0
    bne .L08020840
    ldr r1, [sp, #0x20]
    ldr r0, [sp, #0x3c]
    cmp r1, r0
    ble .L08020832
    add r0, sp, #0x14
    bl func_080AB9C4
.L08020832:
    movs r7, #0x27
    add r7, sp
    ldrb r0, [r7]
    cmp r0, #0
    beq .L08020840
    ldr r0, [sp, #0xe0]
    adds r4, r4, r0
.L08020840:
    ldr r1, [sp, #0xec]
    cmp r4, r1
    bne .L0802084C
    ldr r2, [sp, #0xf0]
    cmp r5, r2
    beq .L0802089A
.L0802084C:
    strh r4, [r6, #0x3c]
    strh r5, [r6, #0x3e]
    movs r0, #1
    ldr r3, [sp, #0xf8]
    strb r0, [r3]
    adds r4, r6, #0
    adds r4, #0x20
    ldrb r2, [r4]
    adds r0, r6, #0
    movs r1, #0xc
    bl func_080211E4
    mov r5, sl
    ldr r0, [r5, #0x20]
    cmp r0, #5
    bne .L0802089A
    ldr r7, [sp, #0xe8]
    cmp r7, #0
    bne .L08020886
    ldr r1, [sp, #0xd8]
    ldr r0, [r1]
    ldr r2, [r0, #0x40]
    adds r0, r1, #0
    movs r1, #0x4b
    bl _call_via_r2
    str r0, [sp, #0xe8]
    cmp r0, #0
    beq .L0802089A
.L08020886:
    ldr r2, [sp, #0xe8]
    ldrh r0, [r2, #4]
    ldr r3, [sp, #0xdc]
    cmp r0, r3
    bne .L0802089A
    ldrh r1, [r6, #0x22]
    ldrb r2, [r4]
    ldr r0, [sp, #0xe8]
    bl func_08038398
.L0802089A:
    mov r4, sl
    ldr r0, [r4, #0x20]
    cmp r0, #6
    bls .L080208A6
    bl .L080210A0
.L080208A6:
    lsls r0, r0, #2
    ldr r1, .L080208B0 @ =.L080208B4
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L080208B0: .4byte .L080208B4
.L080208B4: @ jump table
    .4byte .L080208D0 @ case 0
    .4byte .L08020A54 @ case 1
    .4byte .L08020B38 @ case 2
    .4byte .L08020C14 @ case 3
    .4byte .L08020D38 @ case 4
    .4byte .L08020DE4 @ case 5
    .4byte .L08020F0C @ case 6
.L080208D0:
    movs r5, #0x24
    add r5, sl
    mov sb, r5
    mov r7, sl
    ldrh r4, [r7, #0x24]
    cmp r4, #0
    beq .L08020968
    ldr r5, [r6, #0x18]
    ldr r7, [r6, #0x1c]
    movs r0, #0
    mov r8, r0
    cmp r5, #0
    bge .L08020902
    ldr r1, [sp, #0x1c]
    ldr r0, [sp, #0x3c]
    cmn r1, r0
    bge .L080208FA
    add r0, sp, #0x14
    bl func_080AB948
    ldr r1, [sp, #0x1c]
.L080208FA:
    movs r0, #0x10
    rsbs r0, r0, #0
    cmp r1, r0
    bgt .L08020956
.L08020902:
    cmp r5, #0
    ble .L0802091E
    ldr r1, [sp, #0x20]
    ldr r0, [sp, #0x3c]
    cmp r1, r0
    ble .L08020918
    add r0, sp, #0x14
    bl func_080AB9C4
    ldr r0, [sp, #0x20]
    b .L0802091A
.L08020918:
    adds r0, r1, #0
.L0802091A:
    cmp r0, #0xf
    ble .L08020956
.L0802091E:
    cmp r7, #0
    bge .L0802093A
    ldr r1, [sp, #0x18]
    ldr r0, [sp, #0x3c]
    cmn r1, r0
    bge .L08020932
    add r0, sp, #0x14
    bl func_080AB8D0
    ldr r1, [sp, #0x18]
.L08020932:
    movs r0, #0x10
    rsbs r0, r0, #0
    cmp r1, r0
    bgt .L08020956
.L0802093A:
    cmp r7, #0
    ble .L0802095A
    ldr r1, [sp, #0x14]
    ldr r0, [sp, #0x3c]
    cmp r1, r0
    ble .L08020950
    add r0, sp, #0x14
    bl func_080AB85C
    ldr r0, [sp, #0x14]
    b .L08020952
.L08020950:
    adds r0, r1, #0
.L08020952:
    cmp r0, #0xf
    bgt .L0802095A
.L08020956:
    movs r1, #1
    mov r8, r1
.L0802095A:
    mov r2, r8
    cmp r2, #0
    beq .L08020964
    movs r4, #0
    b .L08020A48
.L08020964:
    subs r4, #1
    b .L08020A48
.L08020968:
    ldr r3, [sp, #0xf8]
    ldrb r0, [r3]
    cmp r0, #0
    bne .L08020A48
    adds r0, r6, #0
    bl func_08020130
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08020A48
    mov r0, sl
    bl GetGrowthStage__C3Dog
    cmp r0, #1
    bne .L080209C8
    ldr r4, [sp, #0xd8]
    ldr r0, [r4]
    ldr r2, [r0, #0x40]
    adds r0, r4, #0
    movs r1, #0x2d
    bl _call_via_r2
    cmp r0, #0
    beq .L080209C8
    ldrh r0, [r0, #4]
    ldr r5, [sp, #0xdc]
    cmp r0, r5
    bne .L080209C8
    adds r0, r6, #0
    movs r1, #0xa9
    bl func_080200C4
    ldr r2, .L080209C0 @ =0xFFFF0000
    add r1, sp, #0xac
    ldr r0, [r1]
    ands r0, r2
    ldr r2, .L080209C4 @ =0xFF00FFFF
    ands r0, r2
    str r0, [r1]
    mov r0, sl
    bl method_0809BB9C__3DogPC15UnkBarnAnimal2C
    b .L08020FD6
    .align 2, 0
.L080209C0: .4byte 0xFFFF0000
.L080209C4: .4byte 0xFF00FFFF
.L080209C8:
    ldr r7, [sp, #0xd8]
    ldr r0, [r7]
    movs r1, #0xa2
    lsls r1, r1, #1
    adds r0, r0, r1
    ldr r1, [r0]
    adds r0, r7, #0
    bl _call_via_r1
    ldrb r0, [r0, #0xa]
    lsls r0, r0, #0x1b
    lsrs r0, r0, #0x1b
    movs r4, #0
    subs r0, #6
    cmp r0, #0xe
    bls .L080209EA
    movs r4, #1
.L080209EA:
    mov r0, sl
    bl GetGrowthStage__C3Dog
    movs r1, #0x68
    muls r4, r1, r4
    movs r1, #0x34
    muls r0, r1, r0
    ldr r1, .L08020A50 @ =gUnk_080F0838
    adds r0, r0, r1
    adds r4, r4, r0
    adds r0, r4, #0
    movs r1, #0xd
    bl func_080AB82C
    adds r7, r0, #0
    lsls r0, r7, #2
    adds r4, r4, r0
    movs r5, #0x3c
    ldrb r0, [r4, #2]
    muls r0, r5, r0
    bl func_080AB788
    ldrb r1, [r4, #1]
    muls r1, r5, r1
    adds r4, r1, r0
    adds r0, r6, #0
    adds r0, #0x20
    ldrb r5, [r0]
    movs r0, #4
    bl func_080AB788
    adds r1, r0, #0
    cmp r1, #0
    beq .L08020A3A
    cmp r1, #3
    beq .L08020A3A
    adds r0, r5, #0
    bl func_080AB7A4
    adds r5, r0, #0
.L08020A3A:
    mov r2, sb
    strb r7, [r2, #2]
    adds r0, r6, #0
    adds r1, r7, #0
    adds r2, r5, #0
    bl func_080211E4
.L08020A48:
    mov r3, sb
    strh r4, [r3]
    b .L080210A0
    .align 2, 0
.L08020A50: .4byte gUnk_080F0838
.L08020A54:
    mov r4, sl
    adds r4, #0x24
    mov r7, sl
    ldrh r5, [r7, #0x24]
    cmp r5, #0
    beq .L08020A62
    subs r5, #1
.L08020A62:
    ldrh r2, [r4, #2]
    cmp r2, #0
    beq .L08020A6A
    subs r2, #1
.L08020A6A:
    ldr r1, [sp, #0xf8]
    ldrb r0, [r1]
    cmp r0, #0
    beq .L08020A7A
    mov r3, sl
    strh r5, [r3, #0x24]
    strh r2, [r4, #2]
    b .L080210A0
.L08020A7A:
    cmp r5, #0
    beq .L08020B1A
    mov r7, sb
    cmp r7, #0
    beq .L08020B1A
    ldrh r0, [r7, #4]
    ldr r1, [sp, #0xdc]
    cmp r0, r1
    bne .L08020B1A
    movs r7, #0xa
    ldrsh r3, [r6, r7]
    movs r0, #0xe
    ldrsh r1, [r6, r0]
    mov r7, sb
    movs r0, #0xa
    ldrsh r7, [r7, r0]
    mov r8, r7
    mov r7, sb
    movs r0, #0xe
    ldrsh r7, [r7, r0]
    mov sb, r7
    mov r7, r8
    subs r0, r7, r3
    cmp r0, #0
    bge .L08020AAE
    rsbs r0, r0, #0
.L08020AAE:
    cmp r0, #0xf
    bgt .L08020AC0
    mov r7, sb
    subs r0, r7, r1
    cmp r0, #0
    bge .L08020ABC
    rsbs r0, r0, #0
.L08020ABC:
    cmp r0, #0xf
    ble .L08020B1A
.L08020AC0:
    cmp r2, #0
    beq .L08020AE4
    movs r7, #4
    ldrsh r0, [r4, r7]
    subs r0, r0, r3
    cmp r0, #0
    bge .L08020AD0
    rsbs r0, r0, #0
.L08020AD0:
    cmp r0, #0xf
    bgt .L08020B14
    movs r7, #6
    ldrsh r0, [r4, r7]
    subs r0, r0, r1
    cmp r0, #0
    bge .L08020AE0
    rsbs r0, r0, #0
.L08020AE0:
    cmp r0, #0xf
    bgt .L08020B14
.L08020AE4:
    adds r0, r6, #0
    adds r0, #0x20
    ldrb r0, [r0]
    add r2, sp, #0x14
    str r2, [sp]
    str r0, [sp, #4]
    adds r0, r3, #0
    mov r2, r8
    mov r3, sb
    bl func_080ABC40
    adds r2, r0, #0
    adds r0, r6, #0
    movs r1, #2
    bl func_080211E4
    movs r0, #0x1e
    bl func_080AB788
    adds r2, r0, #1
    mov r3, r8
    strh r3, [r4, #4]
    mov r7, sb
    strh r7, [r4, #6]
.L08020B14:
    strh r5, [r4]
    strh r2, [r4, #2]
    b .L080210A0
.L08020B1A:
    ldr r2, .L08020B30 @ =0xFFFF0000
    add r1, sp, #0xb0
    ldr r0, [r1]
    ands r0, r2
    movs r2, #0xb4
    orrs r0, r2
    ldr r2, .L08020B34 @ =0xFF00FFFF
    ands r0, r2
    str r0, [r1]
    b .L08020FD0
    .align 2, 0
.L08020B30: .4byte 0xFFFF0000
.L08020B34: .4byte 0xFF00FFFF
.L08020B38:
    mov r7, sl
    adds r7, #0x24
    mov r0, sl
    ldrh r0, [r0, #0x24]
    mov r8, r0
    cmp r0, #0
    beq .L08020B4C
    movs r1, #1
    rsbs r1, r1, #0
    add r8, r1
.L08020B4C:
    mov r2, sl
    ldr r1, [r2, #0x24]
    lsls r0, r1, #9
    lsrs r5, r0, #0x19
    cmp r5, #0
    beq .L08020B5A
    subs r5, #1
.L08020B5A:
    ldrb r4, [r7, #3]
    cmp r4, #0
    beq .L08020B62
    subs r4, #1
.L08020B62:
    ldr r3, [sp, #0xf8]
    ldrb r0, [r3]
    cmp r0, #0
    beq .L08020B72
    mov r1, r8
    mov r0, sl
    strh r1, [r0, #0x24]
    b .L08020BDC
.L08020B72:
    mov r2, r8
    cmp r2, #0
    beq .L08020BF0
    lsls r0, r1, #8
    cmp r0, #0
    bge .L08020B90
    ldr r3, [sp, #0xd8]
    ldr r0, [r3]
    ldr r2, [r0, #0x40]
    adds r0, r3, #0
    movs r1, #0x2d
    bl _call_via_r2
    adds r3, r0, #0
    b .L08020B92
.L08020B90:
    mov r3, sb
.L08020B92:
    cmp r3, #0
    beq .L08020BF0
    ldrh r0, [r3, #4]
    ldr r1, [sp, #0xdc]
    cmp r0, r1
    bne .L08020BF0
    cmp r4, #0
    bne .L08020BD8
    movs r2, #0xa
    ldrsh r0, [r6, r2]
    movs r4, #0xe
    ldrsh r1, [r6, r4]
    movs r4, #0xa
    ldrsh r2, [r3, r4]
    movs r4, #0xe
    ldrsh r3, [r3, r4]
    adds r4, r6, #0
    adds r4, #0x20
    ldrb r4, [r4]
    mov sb, r4
    add r4, sp, #0x14
    str r4, [sp]
    mov r4, sb
    str r4, [sp, #4]
    bl func_080ABE58
    adds r2, r0, #0
    adds r0, r6, #0
    movs r1, #2
    bl func_080211E4
    movs r0, #0x1e
    bl func_080AB788
    adds r4, r0, #1
.L08020BD8:
    mov r0, r8
    strh r0, [r7]
.L08020BDC:
    movs r0, #0x7f
    ands r5, r0
    ldrb r1, [r7, #2]
    movs r0, #0x80
    rsbs r0, r0, #0
    ands r0, r1
    orrs r0, r5
    strb r0, [r7, #2]
    strb r4, [r7, #3]
    b .L080210A0
.L08020BF0:
    adds r0, r6, #0
    bl func_080323C8
    ldr r2, .L08020C0C @ =0xFFFF0000
    add r1, sp, #0xb4
    ldr r0, [r1]
    ands r0, r2
    movs r2, #0xb4
    orrs r0, r2
    ldr r2, .L08020C10 @ =0xFF00FFFF
    ands r0, r2
    str r0, [r1]
    b .L08020FD0
    .align 2, 0
.L08020C0C: .4byte 0xFFFF0000
.L08020C10: .4byte 0xFF00FFFF
.L08020C14:
    mov r5, sl
    adds r5, #0x24
    mov r1, sl
    ldrh r7, [r1, #0x24]
    cmp r7, #0
    beq .L08020C22
    subs r7, #1
.L08020C22:
    ldrh r4, [r5, #2]
    cmp r4, #0
    beq .L08020C2A
    subs r4, #1
.L08020C2A:
    ldr r2, [sp, #0xf8]
    ldrb r0, [r2]
    cmp r0, #0
    beq .L08020C3A
    mov r3, sl
    strh r7, [r3, #0x24]
    strh r4, [r5, #2]
    b .L080210A0
.L08020C3A:
    cmp r7, #0
    beq .L08020D1A
    ldr r1, [sp, #0xd8]
    ldr r0, [r1]
    ldr r2, [r0, #0x40]
    adds r0, r1, #0
    movs r1, #0x4b
    bl _call_via_r2
    str r0, [sp, #0xe8]
    cmp r0, #0
    beq .L08020D08
    ldrh r0, [r0, #4]
    ldr r2, [sp, #0xdc]
    cmp r0, r2
    bne .L08020D08
    movs r3, #0xa
    ldrsh r2, [r6, r3]
    movs r0, #0xe
    ldrsh r1, [r6, r0]
    ldr r3, [sp, #0xe8]
    movs r0, #0xa
    ldrsh r3, [r3, r0]
    mov sb, r3
    ldr r3, [sp, #0xe8]
    movs r0, #0xe
    ldrsh r3, [r3, r0]
    mov r8, r3
    mov r3, sb
    subs r0, r3, r2
    cmp r0, #0
    bge .L08020C7C
    rsbs r0, r0, #0
.L08020C7C:
    cmp r0, #7
    bgt .L08020C8E
    mov r3, r8
    subs r0, r3, r1
    cmp r0, #0
    bge .L08020C8A
    rsbs r0, r0, #0
.L08020C8A:
    cmp r0, #7
    ble .L08020CE4
.L08020C8E:
    cmp r4, #0
    beq .L08020CB2
    movs r3, #4
    ldrsh r0, [r5, r3]
    subs r0, r0, r2
    cmp r0, #0
    bge .L08020C9E
    rsbs r0, r0, #0
.L08020C9E:
    cmp r0, #7
    bgt .L08020D0C
    movs r3, #6
    ldrsh r0, [r5, r3]
    subs r0, r0, r1
    cmp r0, #0
    bge .L08020CAE
    rsbs r0, r0, #0
.L08020CAE:
    cmp r0, #7
    bgt .L08020D0C
.L08020CB2:
    adds r0, r6, #0
    adds r0, #0x20
    ldrb r0, [r0]
    add r4, sp, #0x14
    str r4, [sp]
    str r0, [sp, #4]
    adds r0, r2, #0
    mov r2, sb
    mov r3, r8
    bl func_080ABC40
    adds r2, r0, #0
    adds r0, r6, #0
    movs r1, #2
    bl func_080211E4
    movs r0, #0x1e
    bl func_080AB788
    adds r4, r0, #1
    mov r0, sb
    strh r0, [r5, #4]
    mov r1, r8
    strh r1, [r5, #6]
    b .L08020D0C
.L08020CE4:
    movs r0, #0x78
    bl func_080AB788
    lsls r0, r0, #0x10
    lsrs r0, r0, #0x10
    ldr r3, .L08020D04 @ =0xFFFF0000
    add r1, sp, #0xb8
    ldr r2, [r1]
    ands r2, r3
    orrs r2, r0
    str r2, [r1]
    mov r0, sl
    bl method_0809BB80__3DogPC15UnkBarnAnimal2C
    b .L08020FD6
    .align 2, 0
.L08020D04: .4byte 0xFFFF0000
.L08020D08:
    cmp r4, #0
    beq .L08020D12
.L08020D0C:
    strh r7, [r5]
    strh r4, [r5, #2]
    b .L080210A0
.L08020D12:
    adds r0, r6, #0
    movs r1, #0xaa
    bl func_080200C4
.L08020D1A:
    ldr r2, .L08020D30 @ =0xFFFF0000
    add r1, sp, #0xbc
    ldr r0, [r1]
    ands r0, r2
    movs r2, #0xb4
    orrs r0, r2
    ldr r2, .L08020D34 @ =0xFF00FFFF
    ands r0, r2
    str r0, [r1]
    b .L08020FD0
    .align 2, 0
.L08020D30: .4byte 0xFFFF0000
.L08020D34: .4byte 0xFF00FFFF
.L08020D38:
    ldr r2, [sp, #0xd8]
    ldr r0, [r2]
    ldr r2, [r0, #0x40]
    ldr r0, [sp, #0xd8]
    movs r1, #0x4b
    bl _call_via_r2
    str r0, [sp, #0xe8]
    mov r3, sl
    ldrh r1, [r3, #0x24]
    cmp r1, #0
    beq .L08020D52
    subs r1, #1
.L08020D52:
    ldr r4, [sp, #0xe8]
    cmp r4, #0
    beq .L08020DC0
    ldrh r0, [r4, #4]
    ldr r5, [sp, #0xdc]
    cmp r0, r5
    bne .L08020DC0
    cmp r1, #0
    bne .L08020DBA
    adds r0, r6, #0
    movs r1, #0xa9
    bl func_080200C4
    mov r0, sl
    bl GetAffection__C6Animal
    adds r1, r0, #0
    lsls r0, r1, #4
    subs r0, r0, r1
    lsls r0, r0, #6
    movs r1, #0xfb
    bl __udivsi3
    movs r7, #0xf0
    lsls r7, r7, #1
    adds r0, r0, r7
    lsls r0, r0, #0x10
    add r1, sp, #0xc0
    lsrs r0, r0, #0x10
    str r0, [r1]
    ldr r0, [r6, #0x34]
    bl method_0809BB8C__3DogPC18UnkBarnAnimal2C_x2
    adds r0, r6, #0
    bl func_08021264
    adds r1, r0, #0
    adds r4, r6, #0
    adds r4, #0x20
    ldrb r2, [r4]
    adds r0, r6, #0
    bl func_080211E4
    ldr r1, [r6, #8]
    ldr r2, [r6, #0xc]
    ldrh r3, [r6, #0x22]
    ldrb r0, [r4]
    str r0, [sp]
    ldr r0, [sp, #0xe8]
    bl func_08038374
    b .L080210A0
.L08020DBA:
    mov r0, sl
    strh r1, [r0, #0x24]
    b .L080210A0
.L08020DC0:
    adds r0, r6, #0
    movs r1, #0xaa
    bl func_080200C4
    ldr r2, .L08020DDC @ =0xFFFF0000
    add r1, sp, #0xc8
    ldr r0, [r1]
    ands r0, r2
    movs r2, #0xb4
    orrs r0, r2
    ldr r2, .L08020DE0 @ =0xFF00FFFF
    ands r0, r2
    str r0, [r1]
    b .L08020FD0
    .align 2, 0
.L08020DDC: .4byte 0xFFFF0000
.L08020DE0: .4byte 0xFF00FFFF
.L08020DE4:
    mov r5, sl
    adds r5, #0x24
    ldr r1, [sp, #0xd8]
    ldr r0, [r1]
    ldr r2, [r0, #0x40]
    adds r0, r1, #0
    movs r1, #0x4b
    bl _call_via_r2
    str r0, [sp, #0xe8]
    mov r2, sl
    ldrh r7, [r2, #0x24]
    cmp r7, #0
    beq .L08020E02
    subs r7, #1
.L08020E02:
    ldrh r2, [r5, #2]
    cmp r2, #0
    beq .L08020E0A
    subs r2, #1
.L08020E0A:
    ldr r3, [sp, #0xf8]
    ldrb r0, [r3]
    cmp r0, #0
    beq .L08020E1A
    mov r4, sl
    strh r7, [r4, #0x24]
    strh r2, [r5, #2]
    b .L080210A0
.L08020E1A:
    ldr r0, [sp, #0xe8]
    cmp r0, #0
    beq .L08020ED8
    ldrh r0, [r0, #4]
    ldr r1, [sp, #0xdc]
    cmp r0, r1
    bne .L08020ED8
    cmp r7, #0
    beq .L08020EEA
    mov r3, sb
    cmp r3, #0
    beq .L08020EEA
    ldrh r0, [r3, #4]
    cmp r0, r1
    bne .L08020EEA
    movs r4, #0xa
    ldrsh r3, [r6, r4]
    movs r0, #0xe
    ldrsh r1, [r6, r0]
    mov r4, sb
    movs r0, #0xa
    ldrsh r4, [r4, r0]
    str r4, [sp, #0xf4]
    mov r4, sb
    movs r0, #0xe
    ldrsh r4, [r4, r0]
    mov r8, r4
    ldr r4, [sp, #0xf4]
    subs r0, r4, r3
    cmp r0, #0
    bge .L08020E5A
    rsbs r0, r0, #0
.L08020E5A:
    cmp r0, #0xf
    bgt .L08020E6C
    mov r4, r8
    subs r0, r4, r1
    cmp r0, #0
    bge .L08020E68
    rsbs r0, r0, #0
.L08020E68:
    cmp r0, #0xf
    ble .L08020ECE
.L08020E6C:
    cmp r2, #0
    beq .L08020E90
    movs r4, #4
    ldrsh r0, [r5, r4]
    subs r0, r0, r3
    cmp r0, #0
    bge .L08020E7C
    rsbs r0, r0, #0
.L08020E7C:
    cmp r0, #0xf
    bgt .L08020EDC
    movs r4, #6
    ldrsh r0, [r5, r4]
    subs r0, r0, r1
    cmp r0, #0
    bge .L08020E8C
    rsbs r0, r0, #0
.L08020E8C:
    cmp r0, #0xf
    bgt .L08020EDC
.L08020E90:
    adds r4, r6, #0
    adds r4, #0x20
    ldrb r0, [r4]
    add r2, sp, #0x14
    str r2, [sp]
    str r0, [sp, #4]
    adds r0, r3, #0
    ldr r2, [sp, #0xf4]
    mov r3, r8
    bl func_080ABC40
    adds r2, r0, #0
    adds r0, r6, #0
    movs r1, #2
    bl func_080211E4
    ldrh r1, [r6, #0x22]
    ldrb r2, [r4]
    ldr r0, [sp, #0xe8]
    bl func_08038398
    movs r0, #0x1e
    bl func_080AB788
    adds r2, r0, #1
    add r3, sp, #0xf4
    ldrh r3, [r3]
    strh r3, [r5, #4]
    mov r4, r8
    strh r4, [r5, #6]
    b .L08020EDC
.L08020ECE:
    adds r0, r6, #0
    movs r1, #0xa9
    bl func_080200C4
    b .L08020EEA
.L08020ED8:
    cmp r2, #0
    beq .L08020EE2
.L08020EDC:
    strh r7, [r5]
    strh r2, [r5, #2]
    b .L080210A0
.L08020EE2:
    adds r0, r6, #0
    movs r1, #0xaa
    bl func_080200C4
.L08020EEA:
    adds r0, r6, #0
    bl func_080212C0
    ldr r2, .L08020F04 @ =0xFFFF0000
    add r1, sp, #0xcc
    ldr r0, [r1]
    ands r0, r2
    movs r2, #0xb4
    orrs r0, r2
    ldr r2, .L08020F08 @ =0xFF00FFFF
    ands r0, r2
    str r0, [r1]
    b .L08020FD0
    .align 2, 0
.L08020F04: .4byte 0xFFFF0000
.L08020F08: .4byte 0xFF00FFFF
.L08020F0C:
    movs r5, #0x24
    add r5, sl
    mov r8, r5
    mov sb, r8
    mov r7, sl
    ldrh r4, [r7, #0x24]
    cmp r4, #0
    beq .L08020F1E
    subs r4, #1
.L08020F1E:
    ldr r1, [sp, #0xf8]
    ldrb r0, [r1]
    cmp r0, #0
    beq .L08020F2C
    mov r2, sl
    strh r4, [r2, #0x24]
    b .L080210A0
.L08020F2C:
    ldr r3, [sp, #0xd8]
    ldr r0, [r3]
    ldr r2, [r0, #0x40]
    adds r0, r3, #0
    movs r1, #0x2d
    bl _call_via_r2
    adds r5, r0, #0
    cmp r5, #0
    bne .L08020F42
    b .L08021074
.L08020F42:
    ldrh r0, [r5, #4]
    ldr r7, [sp, #0xdc]
    cmp r0, r7
    beq .L08020F4C
    b .L08021074
.L08020F4C:
    movs r1, #0xa
    ldrsh r0, [r6, r1]
    mov ip, r0
    movs r2, #0xe
    ldrsh r1, [r6, r2]
    movs r3, #0xa
    ldrsh r2, [r5, r3]
    movs r7, #0xe
    ldrsh r3, [r5, r7]
    mov r7, r8
    ldrb r0, [r7, #2]
    cmp r0, #0
    beq .L08021008
    cmp r4, #0
    bne .L08021002
    mov r4, ip
    subs r0, r2, r4
    cmp r0, #0
    bge .L08020F74
    rsbs r0, r0, #0
.L08020F74:
    cmp r0, #0xf
    bgt .L08020FA0
    subs r1, r3, r1
    cmp r1, #0
    bge .L08020F80
    rsbs r1, r1, #0
.L08020F80:
    cmp r1, #0xf
    bgt .L08020FA0
    ldr r0, [r5, #0x14]
    ldr r1, [r0, #0x44]
    adds r0, r5, #0
    bl _call_via_r1
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08020FA0
    ldr r0, [r5, #0x14]
    adds r0, #0x80
    ldr r1, [r0]
    adds r0, r5, #0
    bl _call_via_r1
.L08020FA0:
    movs r0, #0xfb
    bl func_080AB788
    adds r4, r0, #0
    mov r0, sl
    bl GetAdequacy__C3Pet
    movs r1, #0xfb
    subs r1, r1, r0
    cmp r4, r1
    bhs .L08020FF4
    movs r0, #0xb4
    bl func_080AB788
    lsls r0, r0, #0x10
    lsrs r0, r0, #0x10
    ldr r3, .L08020FEC @ =0xFFFF0000
    add r1, sp, #0xd0
    ldr r2, [r1]
    ands r2, r3
    orrs r2, r0
    ldr r0, .L08020FF0 @ =0xFF00FFFF
    ands r2, r0
    str r2, [r1]
.L08020FD0:
    mov r0, sl
    bl method_0809BB48__3DogPC15UnkBarnAnimal2C
.L08020FD6:
    adds r0, r6, #0
    bl func_08021264
    adds r1, r0, #0
    adds r0, r6, #0
    adds r0, #0x20
    ldrb r2, [r0]
    adds r0, r6, #0
    bl func_080211E4
    b .L080210A0
    .align 2, 0
.L08020FEC: .4byte 0xFFFF0000
.L08020FF0: .4byte 0xFF00FFFF
.L08020FF4:
    movs r0, #0
    mov r5, sb
    strb r0, [r5, #2]
    movs r0, #0x1e
    bl func_080AB788
    adds r4, r0, #1
.L08021002:
    mov r7, sb
    strh r4, [r7]
    b .L080210A0
.L08021008:
    mov r5, ip
    subs r0, r2, r5
    cmp r0, #0
    bge .L08021012
    rsbs r0, r0, #0
.L08021012:
    cmp r0, #0xf
    bgt .L08021022
    subs r0, r3, r1
    cmp r0, #0
    bge .L0802101E
    rsbs r0, r0, #0
.L0802101E:
    cmp r0, #0xf
    ble .L08021050
.L08021022:
    cmp r4, #0
    bne .L0802104A
    adds r0, r6, #0
    adds r0, #0x20
    ldrb r0, [r0]
    add r7, sp, #0x14
    str r7, [sp]
    str r0, [sp, #4]
    mov r0, ip
    bl func_080ABC40
    adds r2, r0, #0
    adds r0, r6, #0
    movs r1, #2
    bl func_080211E4
    movs r0, #0x1e
    bl func_080AB788
    adds r4, r0, #1
.L0802104A:
    mov r0, sb
    strh r4, [r0]
    b .L080210A0
.L08021050:
    adds r0, r6, #0
    movs r1, #0xd2
    bl func_080200C4
    adds r0, r6, #0
    adds r0, #0x20
    ldrb r2, [r0]
    adds r0, r6, #0
    movs r1, #0xb
    bl func_080211E4
    movs r0, #1
    mov r1, sb
    strb r0, [r1, #2]
    movs r0, #0x24
    mov r2, sl
    strh r0, [r2, #0x24]
    b .L080210A0
.L08021074:
    ldr r2, .L08021104 @ =0xFFFF0000
    add r1, sp, #0xd4
    ldr r0, [r1]
    ands r0, r2
    movs r2, #0xb4
    orrs r0, r2
    ldr r2, .L08021108 @ =0xFF00FFFF
    ands r0, r2
    str r0, [r1]
    mov r0, sl
    bl method_0809BB48__3DogPC15UnkBarnAnimal2C
    adds r0, r6, #0
    bl func_08021264
    adds r1, r0, #0
    adds r0, r6, #0
    adds r0, #0x20
    ldrb r2, [r0]
    adds r0, r6, #0
    bl func_080211E4
.L080210A0:
    ldr r0, [r6, #0x18]
    cmp r0, #0
    bne .L080210AC
    ldr r0, [r6, #0x1c]
    cmp r0, #0
    beq .L080210D6
.L080210AC:
    ldr r3, [sp, #0xdc]
    cmp r3, #2
    beq .L080210C4
    ldr r4, [sp, #0xd8]
    ldr r0, [r4]
    ldr r1, [r0, #0x14]
    adds r0, r4, #0
    bl _call_via_r1
    ldr r5, [sp, #0xdc]
    cmp r5, r0
    bne .L080210D6
.L080210C4:
    ldr r7, [sp, #0xf8]
    ldrb r0, [r7]
    add r1, sp, #0x14
    cmp r0, #0
    beq .L080210D0
    movs r1, #0
.L080210D0:
    adds r0, r6, #0
    bl func_08020170
.L080210D6:
    mov r1, sl
    ldr r0, [r1, #0x20]
    cmp r0, #5
    bne .L080210F4
    ldr r2, [sp, #0xe8]
    cmp r2, #0
    beq .L080210F4
    ldrh r0, [r2, #4]
    ldr r3, [sp, #0xdc]
    cmp r0, r3
    bne .L080210F4
    ldr r0, [r6, #8]
    str r0, [r2, #8]
    ldr r0, [r6, #0xc]
    str r0, [r2, #0xc]
.L080210F4:
    add sp, #0xfc
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08021104: .4byte 0xFFFF0000
.L08021108: .4byte 0xFF00FFFF

    thumb_func_start func_0802110C
func_0802110C: @ 0x0802110C
    push {r4, r5, lr}
    adds r4, r1, #0
    ldr r5, .L0802112C @ =gUnk_080F0908
    lsls r4, r4, #1
    ldr r0, [r0, #0x34]
    bl GetGrowthStage__C3Dog
    cmp r0, #1
    bne .L08021120
    adds r4, #0x1a
.L08021120:
    adds r0, r4, r5
    ldrh r0, [r0]
    pop {r4, r5}
    pop {r1}
    bx r1
    .align 2, 0
.L0802112C: .4byte gUnk_080F0908

    thumb_func_start func_08021130
func_08021130: @ 0x08021130
    push {r4, lr}
    sub sp, #0x10
    adds r4, r0, #0
    cmp r1, #0xc
    bhi .L0802117C
    lsls r0, r1, #2
    ldr r1, .L08021144 @ =.L08021148
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L08021144: .4byte .L08021148
.L08021148: @ jump table
    .4byte .L0802117C @ case 0
    .4byte .L08021180 @ case 1
    .4byte .L08021186 @ case 2
    .4byte .L0802117C @ case 3
    .4byte .L0802117C @ case 4
    .4byte .L0802117C @ case 5
    .4byte .L0802117C @ case 6
    .4byte .L0802117C @ case 7
    .4byte .L0802117C @ case 8
    .4byte .L0802117C @ case 9
    .4byte .L0802117C @ case 10
    .4byte .L0802117C @ case 11
    .4byte .L0802118C @ case 12
.L0802117C:
    movs r0, #0
    b .L080211DA
.L08021180:
    movs r0, #0x80
    lsls r0, r0, #8
    b .L080211DA
.L08021186:
    movs r0, #0x80
    lsls r0, r0, #9
    b .L080211DA
.L0802118C:
    ldr r1, [r4, #0x14]
    mov r0, sp
    ldr r2, [r1, #0xc]
    adds r1, r4, #0
    bl _call_via_r2
    ldr r0, [sp]
    ldr r1, [sp, #4]
    str r0, [sp, #8]
    str r1, [sp, #0xc]
    add r1, sp, #8
    movs r2, #0x10
    adds r0, r4, #0
    adds r0, #0x20
    ldrb r0, [r0]
    adds r3, r1, #0
    cmp r0, #0
    blt .L080211D2
    cmp r0, #1
    ble .L080211BA
    cmp r0, #3
    ble .L080211C4
    b .L080211D2
.L080211BA:
    movs r1, #6
    ldrsh r0, [r3, r1]
    movs r2, #2
    ldrsh r1, [r3, r2]
    b .L080211CC
.L080211C4:
    movs r2, #4
    ldrsh r0, [r1, r2]
    movs r2, #0
    ldrsh r1, [r1, r2]
.L080211CC:
    subs r0, r0, r1
    adds r2, r0, #0
    adds r2, #0x10
.L080211D2:
    lsls r0, r2, #0x10
    movs r1, #0x1e
    bl __divsi3
.L080211DA:
    add sp, #0x10
    pop {r4}
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_080211E4
func_080211E4: @ 0x080211E4
    push {r4, r5, r6, lr}
    adds r4, r0, #0
    adds r5, r1, #0
    adds r6, r2, #0
    cmp r5, #0xc
    beq .L080211FA
    adds r0, #0x40
    ldrb r0, [r0]
    cmp r0, #0
    beq .L080211FA
    movs r5, #0xc
.L080211FA:
    adds r0, r4, #0
    adds r1, r5, #0
    bl func_0802110C
    adds r1, r0, #0
    ldrh r0, [r4, #0x22]
    cmp r0, r1
    beq .L08021210
    adds r0, r4, #0
    bl SetAnim__12AActorEntityUi
.L08021210:
    adds r0, r4, #0
    adds r0, #0x20
    ldrb r0, [r0]
    cmp r0, r6
    beq .L08021222
    adds r0, r4, #0
    adds r1, r6, #0
    bl SetAnimFacing__12AActorEntityUi
.L08021222:
    adds r0, r4, #0
    adds r1, r5, #0
    bl func_08021130
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_08020080
    adds r0, r4, #0
    adds r0, #0x41
    adds r6, r0, #0
    ldrb r0, [r6]
    cmp r5, r0
    beq .L0802125C
    movs r1, #1
    rsbs r1, r1, #0
    cmp r5, #8
    bne .L08021248
    movs r1, #8
.L08021248:
    cmp r1, #0
    blt .L08021256
    adds r0, r4, #0
    movs r2, #1
    bl func_08032384
    b .L0802125C
.L08021256:
    adds r0, r4, #0
    bl func_080323C8
.L0802125C:
    strb r5, [r6]
    pop {r4, r5, r6}
    pop {r0}
    bx r0

    thumb_func_start func_08021264
func_08021264: @ 0x08021264
    push {lr}
    adds r2, r0, #0
    ldr r0, [r2, #0x34]
    ldr r0, [r0, #0x20]
    cmp r0, #6
    bhi .L0802129C
    lsls r0, r0, #2
    ldr r1, .L0802127C @ =.L08021280
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L0802127C: .4byte .L08021280
.L08021280: @ jump table
    .4byte .L080212A0 @ case 0
    .4byte .L080212A8 @ case 1
    .4byte .L080212A8 @ case 2
    .4byte .L080212A8 @ case 3
    .4byte .L0802129C @ case 4
    .4byte .L080212A8 @ case 5
    .4byte .L080212AC @ case 6
.L0802129C:
    movs r0, #3
    b .L080212BC
.L080212A0:
    ldr r0, [r2, #0x34]
    adds r0, #0x26
    ldrb r0, [r0]
    b .L080212BC
.L080212A8:
    movs r0, #2
    b .L080212BC
.L080212AC:
    ldr r0, [r2, #0x34]
    adds r0, #0x26
    ldrb r0, [r0]
    movs r1, #2
    cmp r0, #0
    beq .L080212BA
    movs r1, #0xb
.L080212BA:
    adds r0, r1, #0
.L080212BC:
    pop {r1}
    bx r1

    thumb_func_start func_080212C0
func_080212C0: @ 0x080212C0
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #0x14
    adds r6, r0, #0
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x4b
    bl _call_via_r2
    adds r5, r0, #0
    cmp r5, #0
    beq .L08021394
    adds r0, #0x26
    ldrb r0, [r0]
    cmp r0, #0
    beq .L08021394
    ldr r0, [r6, #8]
    mov sb, r0
    ldr r2, [r6, #0xc]
    mov r8, r2
    movs r0, #8
    mov sl, r0
    ldrh r7, [r6, #4]
    ldr r4, [r6]
    ldr r0, [r4]
    ldr r1, [r0, #0x14]
    adds r0, r4, #0
    bl _call_via_r1
    cmp r7, r0
    beq .L0802130E
    cmp r7, #2
    beq .L0802130E
    movs r2, #0
    mov sl, r2
.L0802130E:
    ldr r1, [r4]
    mov r0, sp
    ldr r3, [r1, #0x34]
    adds r1, r4, #0
    adds r2, r7, #0
    bl _call_via_r3
    mov r7, sp
    adds r6, #0x20
    b .L0802133E
.L08021322:
    ldr r1, [r5, #0x14]
    add r4, sp, #0xc
    adds r0, r4, #0
    ldr r2, [r1, #0xc]
    adds r1, r5, #0
    bl _call_via_r2
    adds r0, r7, #0
    adds r1, r4, #0
    bl func_080AC070
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802138E
.L0802133E:
    mov r0, sl
    lsls r1, r0, #0x10
    ldrb r0, [r6]
    adds r2, r0, #0
    cmp r0, #1
    beq .L08021368
    cmp r0, #1
    bgt .L08021354
    cmp r0, #0
    beq .L0802135E
    b .L08021382
.L08021354:
    cmp r2, #2
    beq .L08021372
    cmp r2, #3
    beq .L08021378
    b .L08021382
.L0802135E:
    mov r2, sb
    str r2, [r5, #8]
    mov r2, r8
    adds r0, r2, r1
    b .L08021380
.L08021368:
    mov r0, sb
    str r0, [r5, #8]
    mov r2, r8
    subs r0, r2, r1
    b .L08021380
.L08021372:
    mov r2, sb
    subs r0, r2, r1
    b .L0802137C
.L08021378:
    mov r2, sb
    adds r0, r2, r1
.L0802137C:
    str r0, [r5, #8]
    mov r0, r8
.L08021380:
    str r0, [r5, #0xc]
.L08021382:
    movs r2, #1
    rsbs r2, r2, #0
    add sl, r2
    mov r0, sl
    cmp r0, #0
    bge .L08021322
.L0802138E:
    adds r0, r5, #0
    bl func_080384FC
.L08021394:
    add sp, #0x14
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
.L080213A4:
    .byte 0x40, 0x30, 0x00, 0x78, 0x01, 0x21, 0x48, 0x40, 0x70, 0x47, 0x00, 0x00
    .byte 0x10, 0xB5, 0x81, 0xB0, 0x04, 0x1C, 0x40, 0x30, 0x00, 0x78, 0x00, 0x28, 0x35, 0xD1, 0x60, 0x6B
    .byte 0x00, 0x6A, 0x05, 0x28, 0x02, 0xD1, 0x20, 0x1C, 0xFF, 0xF7, 0x7A, 0xFF, 0x78, 0x20, 0x8A, 0xF0
    .byte 0xDB, 0xF9, 0xF0, 0x30, 0x00, 0x04, 0x00, 0x0C, 0x16, 0x4A, 0x00, 0x99, 0x11, 0x40, 0x01, 0x43
    .byte 0x15, 0x48, 0x01, 0x40, 0xF0, 0x20, 0x80, 0x03, 0x01, 0x43, 0x14, 0x48, 0x01, 0x40, 0x14, 0x48
    .byte 0x01, 0x40, 0x00, 0x91, 0x60, 0x6B, 0x69, 0x46, 0x7A, 0xF0, 0xB4, 0xFB, 0x20, 0x1C, 0xFF, 0xF7
    .byte 0x31, 0xFF, 0x01, 0x1C, 0x20, 0x1C, 0x20, 0x30, 0x02, 0x78, 0x20, 0x1C, 0xFF, 0xF7, 0xEA, 0xFE
    .byte 0x60, 0x6B, 0x0A, 0x21, 0x79, 0xF0, 0x62, 0xFF, 0x20, 0x1C, 0x02, 0x21, 0x00, 0x22, 0x10, 0xF0
    .byte 0xB1, 0xFF, 0x20, 0x1C, 0xAA, 0x21, 0xFE, 0xF7, 0x4D, 0xFE, 0x01, 0xB0, 0x10, 0xBC, 0x01, 0xBC
    .byte 0x00, 0x47, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x80, 0xFF, 0xFF, 0xFF, 0x7F, 0xFF
    .byte 0xFF, 0xFF, 0xFF, 0x00

    thumb_func_start func_08021444
func_08021444: @ 0x08021444
    push {r4, r5, r6, r7, lr}
    mov r7, r8
    push {r7}
    sub sp, #8
    adds r6, r0, #0
    adds r7, r1, #0
    ldrh r0, [r7]
    lsls r0, r0, #0x16
    lsrs r0, r0, #0x16
    ldrh r1, [r6, #4]
    cmp r0, r1
    bne .L0802150A
    ldr r1, [r6, #0x34]
    ldr r0, [r1, #0x20]
    cmp r0, #5
    beq .L0802150A
    adds r0, r1, #0
    bl GetAffection__C6Animal
    mov r8, r0
    bl func_08020018
    movs r1, #0xa
    ldrsh r3, [r6, r1]
    ldrb r1, [r7, #1]
    lsrs r1, r1, #2
    ldrh r2, [r7, #2]
    ldr r4, .L08021518 @ =0x000003FF
    ands r2, r4
    lsls r2, r2, #6
    orrs r2, r1
    lsls r2, r2, #0x10
    asrs r2, r2, #0x10
    subs r2, r2, r3
    movs r3, #0xe
    ldrsh r5, [r6, r3]
    ldrb r3, [r7, #3]
    lsrs r3, r3, #2
    ldrh r1, [r7, #4]
    ands r1, r4
    lsls r1, r1, #6
    orrs r1, r3
    lsls r1, r1, #0x10
    asrs r1, r1, #0x10
    subs r1, r1, r5
    adds r3, r2, #0
    muls r3, r2, r3
    adds r2, r3, #0
    adds r3, r1, #0
    muls r3, r1, r3
    adds r1, r3, #0
    adds r2, r2, r1
    adds r1, r0, #0
    muls r1, r0, r1
    adds r0, r1, #0
    cmp r2, r0
    bgt .L0802150A
    ldr r0, [r6, #0x34]
    ldr r0, [r0, #0x20]
    cmp r0, #5
    bne .L080214C4
    adds r0, r6, #0
    bl func_080212C0
.L080214C4:
    mov r3, r8
    lsls r0, r3, #4
    subs r0, r0, r3
    lsls r0, r0, #6
    movs r1, #0xfb
    bl __udivsi3
    movs r1, #0xf0
    lsls r1, r1, #1
    adds r0, r0, r1
    lsls r0, r0, #0x10
    lsrs r0, r0, #0x10
    str r0, [sp]
    ldr r0, [r6, #0x34]
    mov r1, sp
    bl method_0809BB54__3DogPC18UnkBarnAnimal2C_x2
    adds r0, r6, #0
    adds r0, #0x40
    ldrb r0, [r0]
    cmp r0, #0
    bne .L08021504
    adds r0, r6, #0
    bl func_08021264
    adds r1, r0, #0
    adds r0, r6, #0
    adds r0, #0x20
    ldrb r2, [r0]
    adds r0, r6, #0
    bl func_080211E4
.L08021504:
    ldr r0, [r6, #0x34]
    bl SetHasTalkedToday__3Pet
.L0802150A:
    add sp, #8
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08021518: .4byte 0x000003FF

    thumb_func_start func_0802151C
func_0802151C: @ 0x0802151C
    push {r4, r5, r6, r7, lr}
    mov r7, r8
    push {r7}
    sub sp, #8
    adds r6, r0, #0
    adds r7, r1, #0
    ldr r0, [r6, #0x34]
    bl GetGrowthStage__C3Dog
    cmp r0, #1
    bne .L080215EC
    ldrh r0, [r7]
    lsls r0, r0, #0x16
    lsrs r0, r0, #0x16
    ldrh r1, [r6, #4]
    cmp r0, r1
    bne .L080215EC
    ldr r0, [r6, #0x34]
    bl GetAdequacy__C3Pet
    mov r8, r0
    bl func_08020018
    movs r1, #0xa
    ldrsh r3, [r6, r1]
    ldrb r1, [r7, #1]
    lsrs r1, r1, #2
    ldrh r2, [r7, #2]
    ldr r4, .L080215F8 @ =0x000003FF
    ands r2, r4
    lsls r2, r2, #6
    orrs r2, r1
    lsls r2, r2, #0x10
    asrs r2, r2, #0x10
    subs r2, r2, r3
    movs r3, #0xe
    ldrsh r5, [r6, r3]
    ldrb r3, [r7, #3]
    lsrs r3, r3, #2
    ldrh r1, [r7, #4]
    ands r1, r4
    lsls r1, r1, #6
    orrs r1, r3
    lsls r1, r1, #0x10
    asrs r1, r1, #0x10
    subs r1, r1, r5
    adds r3, r2, #0
    muls r3, r2, r3
    adds r2, r3, #0
    adds r3, r1, #0
    muls r3, r1, r3
    adds r1, r3, #0
    adds r2, r2, r1
    adds r1, r0, #0
    muls r1, r0, r1
    adds r0, r1, #0
    cmp r2, r0
    bgt .L080215EC
    adds r0, r6, #0
    movs r1, #0xa9
    bl func_080200C4
    ldr r0, [r6, #0x34]
    ldr r0, [r0, #0x20]
    cmp r0, #5
    bne .L080215A6
    adds r0, r6, #0
    bl func_080212C0
.L080215A6:
    mov r3, r8
    lsls r0, r3, #4
    subs r0, r0, r3
    lsls r0, r0, #6
    movs r1, #0xfb
    bl __udivsi3
    movs r1, #0xf0
    lsls r1, r1, #1
    adds r0, r0, r1
    lsls r0, r0, #0x10
    lsrs r0, r0, #0x10
    str r0, [sp]
    ldr r0, [r6, #0x34]
    mov r1, sp
    bl method_0809BB70__3DogPC18UnkBarnAnimal2C_x2
    adds r0, r6, #0
    adds r0, #0x40
    ldrb r0, [r0]
    cmp r0, #0
    bne .L080215E6
    adds r0, r6, #0
    bl func_08021264
    adds r1, r0, #0
    adds r0, r6, #0
    adds r0, #0x20
    ldrb r2, [r0]
    adds r0, r6, #0
    bl func_080211E4
.L080215E6:
    ldr r0, [r6, #0x34]
    bl SetHasPlayedToday__3Pet
.L080215EC:
    add sp, #8
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L080215F8: .4byte 0x000003FF
.L080215FC:
    .byte 0x10, 0xB5, 0x0A, 0x23
    .byte 0xCA, 0x5E, 0x0E, 0x24, 0x0B, 0x5F, 0xD1, 0x1F, 0x01, 0x80, 0x19, 0x1F, 0x41, 0x80, 0x07, 0x32
    .byte 0x82, 0x80, 0x05, 0x33, 0xC3, 0x80, 0x10, 0xBC, 0x04, 0xBC, 0x10, 0x47

    thumb_func_start func_0802161C
func_0802161C: @ 0x0802161C
    movs r0, #0
    bx lr

    thumb_func_start func_08021620
func_08021620: @ 0x08021620
    push {lr}
    cmp r0, #0
    beq .L0802162A
    cmp r0, #1
    beq .L0802162E
.L0802162A:
    movs r0, #6
    b .L08021630
.L0802162E:
    movs r0, #8
.L08021630:
    pop {r1}
    bx r1
.L08021634:
    .byte 0x70, 0xB5, 0x46, 0x46, 0x40, 0xB4, 0x84, 0xB0, 0x05, 0x1C, 0x68, 0x6B
    .byte 0x7A, 0xF0, 0x78, 0xFA, 0x06, 0x1C, 0x8C, 0x20, 0xDE, 0xF7, 0xC4, 0xFF, 0x80, 0x46, 0x30, 0x1C
    .byte 0xFF, 0xF7, 0xE4, 0xFF, 0x04, 0x1C, 0x30, 0x1C, 0xFF, 0xF7, 0xE2, 0xFF, 0x00, 0x94, 0x01, 0x90
    .byte 0x00, 0x26, 0x02, 0x96, 0x03, 0xA8, 0x06, 0x70, 0x40, 0x46, 0x29, 0x1C, 0x02, 0x22, 0x06, 0x23
    .byte 0x10, 0xF0, 0x24, 0xFF, 0x04, 0x1C, 0xA0, 0x46, 0x41, 0x35, 0x28, 0x78, 0x08, 0x28, 0x15, 0xD1
    .byte 0x20, 0x1C, 0x70, 0x30, 0x08, 0x21, 0x3D, 0xF0, 0xEB, 0xF8, 0x20, 0x1C, 0x84, 0x30, 0x01, 0x21
    .byte 0x01, 0x70, 0x02, 0x30, 0x06, 0x70, 0x01, 0x30, 0x01, 0x70, 0x22, 0x1C, 0x8A, 0x32, 0x02, 0x23
    .byte 0x11, 0x78, 0x04, 0x20, 0x40, 0x42, 0x08, 0x40, 0x18, 0x43, 0x10, 0x70, 0x40, 0x46, 0x04, 0xB0
    .byte 0x08, 0xBC, 0x98, 0x46, 0x70, 0xBC, 0x02, 0xBC, 0x08, 0x47, 0x00, 0x00

    thumb_func_start func_080216BC
func_080216BC: @ 0x080216BC
    push {r4, r5, r6, lr}
    sub sp, #8
    adds r6, r0, #0
    adds r4, r1, #0
    adds r5, r2, #0
    mov r0, sp
    adds r1, r5, #0
    bl __5ActorRC5Actor
    ldr r3, .L08021734 @ =0x00000782
    adds r0, r6, #0
    adds r1, r4, #0
    mov r2, sp
    bl func_08020038
    ldr r0, .L08021738 @ =vtable_unk_080E6428
    str r0, [r6, #0x14]
    str r5, [r6, #0x34]
    adds r1, r6, #0
    adds r1, #0x3d
    movs r0, #0
    strb r0, [r1]
    ldr r0, [r4]
    ldr r2, [r0, #0x40]
    adds r0, r4, #0
    movs r1, #0
    bl _call_via_r2
    adds r2, r0, #0
    movs r0, #0
    cmp r2, #0
    beq .L0802170E
    ldr r0, [r2, #0x14]
    ldr r1, [r0, #0x40]
    adds r0, r2, #0
    bl _call_via_r1
    lsls r0, r0, #0x18
    lsrs r0, r0, #0x18
    rsbs r0, r0, #0
    lsrs r0, r0, #0x1f
.L0802170E:
    adds r1, r6, #0
    adds r1, #0x3e
    strb r0, [r1]
    adds r0, r6, #0
    bl func_080220D4
    adds r1, r0, #0
    adds r0, r6, #0
    adds r0, #0x20
    ldrb r2, [r0]
    adds r0, r6, #0
    bl func_08022048
    adds r0, r6, #0
    add sp, #8
    pop {r4, r5, r6}
    pop {r1}
    bx r1
    .align 2, 0
.L08021734: .4byte 0x00000782
.L08021738: .4byte vtable_unk_080E6428
.L0802173C:
    .byte 0x70, 0xB5, 0x82, 0xB0
    .byte 0x05, 0x1C, 0x0E, 0x1C, 0x16, 0x48, 0x68, 0x61, 0x28, 0x1C, 0x3D, 0x30, 0x00, 0x78, 0x00, 0x28
    .byte 0x07, 0xD0, 0x38, 0x21, 0x68, 0x5E, 0x00, 0x04, 0xA8, 0x60, 0x3A, 0x21, 0x68, 0x5E, 0x00, 0x04
    .byte 0xE8, 0x60, 0x6C, 0x6B, 0x68, 0x46, 0x29, 0x1C, 0x10, 0xF0, 0x02, 0xFD, 0x20, 0x1C, 0x69, 0x46
    .byte 0x79, 0xF0, 0xD8, 0xFC, 0x0B, 0x48, 0x68, 0x61, 0x29, 0x69, 0x00, 0x29, 0x05, 0xD0, 0x48, 0x68
    .byte 0x82, 0x68, 0x08, 0x1C, 0x03, 0x21, 0xB2, 0xF0, 0xC5, 0xF8, 0x01, 0x20, 0x30, 0x40, 0x00, 0x28
    .byte 0x02, 0xD0, 0x28, 0x1C, 0xDE, 0xF7, 0x38, 0xFF, 0x02, 0xB0, 0x70, 0xBC, 0x01, 0xBC, 0x00, 0x47
    .byte 0x28, 0x64, 0x0E, 0x08, 0x50, 0x62, 0x0E, 0x08, 0x10, 0xB5, 0x81, 0xB0, 0x04, 0x1C, 0x09, 0x04
    .byte 0x09, 0x0C, 0x0C, 0x4A, 0x00, 0x98, 0x10, 0x40, 0x08, 0x43, 0x0B, 0x49, 0x08, 0x40, 0x00, 0x90
    .byte 0x60, 0x6B, 0x69, 0x46, 0x7A, 0xF0, 0x2E, 0xFA, 0x20, 0x1C, 0x00, 0xF0, 0x83, 0xFC, 0x01, 0x1C
    .byte 0x20, 0x1C, 0x20, 0x30, 0x02, 0x78, 0x20, 0x1C, 0x00, 0xF0, 0x36, 0xFC, 0x01, 0xB0, 0x10, 0xBC
    .byte 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xF0, 0xB5, 0x57, 0x46
    .byte 0x4E, 0x46, 0x45, 0x46, 0xE0, 0xB4, 0xB6, 0xB0, 0x06, 0x1C, 0x30, 0x68, 0x82, 0x46, 0x30, 0x1C
    .byte 0x3E, 0x30, 0x00, 0x78, 0x00, 0x28, 0x00, 0xD0, 0x2F, 0xE3, 0x71, 0x6B, 0x2F, 0x91, 0x08, 0x1C
    .byte 0x7A, 0xF0, 0xFE, 0xF9, 0x05, 0x1C, 0xB2, 0x88, 0x30, 0x92, 0x53, 0x46, 0x19, 0x68, 0x02, 0xA8
    .byte 0x4B, 0x6B, 0x51, 0x46, 0xB2, 0xF0, 0x78, 0xF8, 0x71, 0x69, 0x1F, 0xAC, 0x20, 0x1C, 0xCA, 0x68
    .byte 0x31, 0x1C, 0xB2, 0xF0, 0x6F, 0xF8, 0x00, 0x21, 0x00, 0x20, 0xA0, 0x46, 0x30, 0x9C, 0x08, 0x2C
    .byte 0x00, 0xDC, 0x01, 0x20, 0x00, 0x28, 0x02, 0xD0, 0x01, 0x2D, 0x00, 0xD1, 0x01, 0x21, 0x0A, 0x1C
    .byte 0x00, 0x2A, 0x09, 0xD0, 0x47, 0x46, 0x04, 0x21, 0x78, 0x5E, 0x1F, 0xA9, 0x00, 0x23, 0xC9, 0x5E
    .byte 0x40, 0x1A, 0x10, 0x30, 0x31, 0x90, 0x01, 0xE0, 0x00, 0x24, 0x31, 0x94, 0x00, 0x2A, 0x08, 0xD0
    .byte 0x47, 0x46, 0x06, 0x21, 0x78, 0x5E, 0x02, 0x22, 0xB9, 0x5E, 0x40, 0x1A, 0x10, 0x30, 0x32, 0x90
    .byte 0x01, 0xE0, 0x00, 0x23, 0x32, 0x93, 0x05, 0xAC, 0x21, 0x27, 0x05, 0x97, 0x21, 0x20, 0x40, 0x42
    .byte 0x60, 0x60, 0xA0, 0x60, 0xE7, 0x60, 0x0A, 0xA9, 0x02, 0xA8, 0x8C, 0xC8, 0x8C, 0xC1, 0x1F, 0x98
    .byte 0x20, 0x99, 0x0D, 0x90, 0x0E, 0x91, 0x20, 0x20, 0xA0, 0x62, 0x31, 0x99, 0x10, 0x91, 0x32, 0x9A
    .byte 0x11, 0x92, 0x53, 0x46, 0x18, 0x68, 0x02, 0x6C, 0x50, 0x46, 0x00, 0x21, 0xB2, 0xF0, 0x2A, 0xF8
    .byte 0x81, 0x46, 0x57, 0x46, 0x38, 0x68, 0x02, 0x6C, 0x50, 0x46, 0x4A, 0x21, 0xB2, 0xF0, 0x22, 0xF8
    .byte 0x07, 0x1C, 0x30, 0x1C, 0x3D, 0x30, 0x01, 0x78, 0x35, 0x90, 0x00, 0x29, 0x6E, 0xD0, 0x00, 0x21
    .byte 0xB0, 0x8C, 0x00, 0x28, 0x00, 0xD1, 0x01, 0x21, 0x00, 0x29, 0x67, 0xD0, 0x00, 0x20, 0x35, 0x99
    .byte 0x08, 0x70, 0x38, 0x22, 0xB0, 0x5E, 0x00, 0x04, 0xB0, 0x60, 0x3A, 0x23, 0xF0, 0x5E, 0x00, 0x04
    .byte 0xF0, 0x60, 0x71, 0x69, 0x21, 0xAC, 0x20, 0x1C, 0xCA, 0x68, 0x31, 0x1C, 0xB2, 0xF0, 0x02, 0xF8
    .byte 0x20, 0x68, 0x61, 0x68, 0x1F, 0x90, 0x20, 0x91, 0x44, 0x46, 0x04, 0x20, 0x25, 0x5E, 0x00, 0x21
    .byte 0x60, 0x5E, 0x2D, 0x1A, 0x10, 0x35, 0xAA, 0x46, 0x06, 0x22, 0xA4, 0x5E, 0x43, 0x46, 0x02, 0x25
    .byte 0x58, 0x5F, 0x24, 0x1A, 0x10, 0x34, 0xA0, 0x46, 0x12, 0xA9, 0x21, 0x20, 0x12, 0x90, 0x21, 0x22
    .byte 0x52, 0x42, 0x4A, 0x60, 0x8A, 0x60, 0xC8, 0x60, 0x17, 0xAA, 0x02, 0xA8, 0x38, 0xC8, 0x38, 0xC2
    .byte 0x1F, 0x9A, 0x20, 0x9B, 0x1A, 0x92, 0x1B, 0x93, 0x20, 0x20, 0x88, 0x62, 0x52, 0x46, 0x1D, 0x92
    .byte 0x43, 0x46, 0x1E, 0x93, 0x05, 0xA8, 0x34, 0x22, 0xB2, 0xF0, 0x14, 0xF8, 0x4C, 0x46, 0x00, 0x2C
    .byte 0x0F, 0xD0, 0xA0, 0x88, 0x30, 0x9D, 0xA8, 0x42, 0x0B, 0xD1, 0x61, 0x69, 0x23, 0xAC, 0x20, 0x1C
    .byte 0xCA, 0x68, 0x49, 0x46, 0xB1, 0xF0, 0xC6, 0xFF, 0x05, 0xA8, 0x21, 0x1C, 0x01, 0x22, 0x8A, 0xF0
    .byte 0x7F, 0xF8, 0x00, 0x2F, 0x00, 0xD1, 0xE2, 0xE1, 0xB8, 0x88, 0x30, 0x99, 0x88, 0x42, 0x00, 0xD0
    .byte 0xDD, 0xE1, 0x79, 0x69, 0x25, 0xAC, 0x20, 0x1C, 0xCA, 0x68, 0x39, 0x1C, 0xB1, 0xF0, 0xB2, 0xFF
    .byte 0x05, 0xA8, 0x21, 0x1C, 0x00, 0x22, 0x8A, 0xF0, 0x6B, 0xF8, 0xD0, 0xE1, 0x4A, 0x46, 0x00, 0x2A
    .byte 0x0F, 0xD0, 0x90, 0x88, 0x30, 0x9B, 0x98, 0x42, 0x0B, 0xD1, 0x51, 0x69, 0x27, 0xAC, 0x20, 0x1C
    .byte 0xCA, 0x68, 0x49, 0x46, 0xB1, 0xF0, 0x9E, 0xFF, 0x05, 0xA8, 0x21, 0x1C, 0x01, 0x22, 0x8A, 0xF0
    .byte 0x57, 0xF8, 0x00, 0x2F, 0x0F, 0xD0, 0xB8, 0x88, 0x30, 0x9C, 0xA0, 0x42, 0x0B, 0xD1, 0x79, 0x69
    .byte 0x29, 0xAC, 0x20, 0x1C, 0xCA, 0x68, 0x39, 0x1C, 0xB1, 0xF0, 0x8C, 0xFF, 0x05, 0xA8, 0x21, 0x1C
    .byte 0x00, 0x22, 0x8A, 0xF0, 0x45, 0xF8, 0x35, 0x9F, 0x38, 0x78, 0x00, 0x28, 0x00, 0xD0, 0x90, 0xE0
    .byte 0x01, 0x2D, 0x00, 0xD0, 0x8D, 0xE0, 0x0A, 0x21, 0x70, 0x5E, 0x33, 0x90, 0x0E, 0x23, 0xF2, 0x5E
    .byte 0x34, 0x92, 0xB4, 0x69, 0xA0, 0x46, 0xF7, 0x69, 0x04, 0x1C, 0x15, 0x1C, 0x00, 0x2F, 0x18, 0xDD
    .byte 0x05, 0x99, 0x0F, 0x98, 0x81, 0x42, 0x04, 0xDD, 0x05, 0xA8, 0x89, 0xF0, 0x0F, 0xFF, 0x05, 0x98
    .byte 0x00, 0xE0, 0x08, 0x1C, 0x00, 0x28, 0x0C, 0xD1, 0x05, 0x99, 0x0F, 0x98, 0x81, 0x42, 0x02, 0xDD
    .byte 0x05, 0xA8, 0x89, 0xF0, 0x03, 0xFF, 0x09, 0xA9, 0x08, 0x78, 0x00, 0x28, 0x01, 0xD0, 0x32, 0x9A
    .byte 0xAD, 0x18, 0x00, 0x2F, 0x19, 0xDA, 0x06, 0x99, 0x0F, 0x98, 0xC1, 0x42, 0x04, 0xDA, 0x05, 0xA8
    .byte 0x89, 0xF0, 0x2E, 0xFF, 0x06, 0x98, 0x00, 0xE0, 0x08, 0x1C, 0x00, 0x28, 0x0D, 0xD1, 0x0F, 0x99
    .byte 0x06, 0x98, 0xC8, 0x42, 0x02, 0xDA, 0x05, 0xA8, 0x89, 0xF0, 0x22, 0xFF, 0x25, 0x23, 0x6B, 0x44
    .byte 0x18, 0x78, 0x00, 0x28, 0x01, 0xD0, 0x32, 0x9F, 0xED, 0x1B, 0x40, 0x46, 0x00, 0x28, 0x19, 0xDA
    .byte 0x07, 0x99, 0x0F, 0x98, 0xC1, 0x42, 0x04, 0xDA, 0x05, 0xA8, 0x89, 0xF0, 0x4D, 0xFF, 0x07, 0x98
    .byte 0x00, 0xE0, 0x08, 0x1C, 0x00, 0x28, 0x0D, 0xD1, 0x0F, 0x99, 0x07, 0x98, 0xC8, 0x42, 0x02, 0xDA
    .byte 0x05, 0xA8, 0x89, 0xF0, 0x41, 0xFF, 0x26, 0x21, 0x69, 0x44, 0x08, 0x78, 0x00, 0x28, 0x01, 0xD0
    .byte 0x31, 0x9A, 0xA4, 0x1A, 0x43, 0x46, 0x00, 0x2B, 0x19, 0xDD, 0x08, 0x99, 0x0F, 0x98, 0x81, 0x42
    .byte 0x04, 0xDD, 0x05, 0xA8, 0x89, 0xF0, 0x6E, 0xFF, 0x08, 0x98, 0x00, 0xE0, 0x08, 0x1C, 0x00, 0x28
    .byte 0x0D, 0xD1, 0x08, 0x99, 0x0F, 0x98, 0x81, 0x42, 0x02, 0xDD, 0x05, 0xA8, 0x89, 0xF0, 0x62, 0xFF
    .byte 0x27, 0x27, 0x6F, 0x44, 0x38, 0x78, 0x00, 0x28, 0x01, 0xD0, 0x31, 0x98, 0x24, 0x18, 0x33, 0x99
    .byte 0x8C, 0x42, 0x02, 0xD1, 0x34, 0x9A, 0x95, 0x42, 0x0B, 0xD0, 0x34, 0x87, 0x75, 0x87, 0x01, 0x20
    .byte 0x35, 0x9B, 0x18, 0x70, 0x30, 0x1C, 0x20, 0x30, 0x02, 0x78, 0x30, 0x1C, 0x06, 0x21, 0x00, 0xF0
    .byte 0x8B, 0xFA, 0x2F, 0x9C, 0x20, 0x6A, 0x01, 0x28, 0x00, 0xD1, 0xA5, 0xE0, 0x01, 0x28, 0x02, 0xDC
    .byte 0x00, 0x28, 0x04, 0xD0, 0x88, 0xE1, 0x02, 0x28, 0x00, 0xD1, 0x17, 0xE1, 0x84, 0xE1, 0x2F, 0x9D
    .byte 0x24, 0x35, 0xA9, 0x46, 0x2F, 0x9F, 0xBC, 0x8C, 0x00, 0x2C, 0x44, 0xD0, 0xB5, 0x69, 0xF7, 0x69
    .byte 0x00, 0x20, 0x80, 0x46, 0x00, 0x2D, 0x0B, 0xDA, 0x07, 0x99, 0x0F, 0x98, 0xC1, 0x42, 0x03, 0xDA
    .byte 0x05, 0xA8, 0x89, 0xF0, 0xE9, 0xFE, 0x07, 0x99, 0x10, 0x20, 0x40, 0x42, 0x81, 0x42, 0x29, 0xDC
    .byte 0x00, 0x2D, 0x0B, 0xDD, 0x08, 0x99, 0x0F, 0x98, 0x81, 0x42, 0x04, 0xDD, 0x05, 0xA8, 0x89, 0xF0
    .byte 0x19, 0xFF, 0x08, 0x98, 0x00, 0xE0, 0x08, 0x1C, 0x0F, 0x28, 0x1B, 0xDD, 0x00, 0x2F, 0x0B, 0xDA
    .byte 0x06, 0x99, 0x0F, 0x98, 0xC1, 0x42, 0x03, 0xDA, 0x05, 0xA8, 0x89, 0xF0, 0x91, 0xFE, 0x06, 0x99
    .byte 0x10, 0x20, 0x40, 0x42, 0x81, 0x42, 0x0D, 0xDC, 0x00, 0x2F, 0x0D, 0xDD, 0x05, 0x99, 0x0F, 0x98
    .byte 0x81, 0x42, 0x04, 0xDD, 0x05, 0xA8, 0x89, 0xF0, 0x49, 0xFE, 0x05, 0x98, 0x00, 0xE0, 0x08, 0x1C
    .byte 0x0F, 0x28, 0x01, 0xDC, 0x01, 0x21, 0x88, 0x46, 0x42, 0x46, 0x00, 0x2A, 0x01, 0xD0, 0x00, 0x24
    .byte 0x4D, 0xE0, 0x01, 0x3C, 0x4B, 0xE0, 0x35, 0x9B, 0x18, 0x78, 0x00, 0x28, 0x47, 0xD1, 0x30, 0x1C
    .byte 0xFE, 0xF7, 0x9E, 0xFA, 0x00, 0x06, 0x00, 0x28, 0x41, 0xD0, 0x54, 0x46, 0x20, 0x68, 0xA2, 0x25
    .byte 0x6D, 0x00, 0x40, 0x19, 0x01, 0x68, 0x50, 0x46, 0xB1, 0xF0, 0x82, 0xFE, 0x80, 0x7A, 0xC0, 0x06
    .byte 0xC0, 0x0E, 0x00, 0x25, 0x06, 0x38, 0x0E, 0x28, 0x00, 0xD9, 0x01, 0x25, 0x2F, 0x98, 0x79, 0xF0
    .byte 0xF7, 0xFF, 0xEC, 0x00, 0x64, 0x1B, 0xE4, 0x00, 0xC1, 0x00, 0x09, 0x1A, 0x89, 0x00, 0x15, 0x48
    .byte 0x09, 0x18, 0x64, 0x18, 0x20, 0x1C, 0x07, 0x21, 0x89, 0xF0, 0xF8, 0xFD, 0x07, 0x1C, 0xB8, 0x00
    .byte 0x24, 0x18, 0x3C, 0x25, 0xA0, 0x78, 0x68, 0x43, 0x89, 0xF0, 0x9E, 0xFD, 0x61, 0x78, 0x69, 0x43
    .byte 0x0C, 0x18, 0x30, 0x1C, 0x20, 0x30, 0x05, 0x78, 0x04, 0x20, 0x89, 0xF0, 0x95, 0xFD, 0x01, 0x1C
    .byte 0x00, 0x29, 0x05, 0xD0, 0x03, 0x29, 0x03, 0xD0, 0x28, 0x1C, 0x89, 0xF0, 0x9B, 0xFD, 0x05, 0x1C
    .byte 0x48, 0x46, 0x87, 0x70, 0x30, 0x1C, 0x39, 0x1C, 0x2A, 0x1C, 0x00, 0xF0, 0xE5, 0xF9, 0x49, 0x46
    .byte 0x0C, 0x80, 0xE9, 0xE0, 0x3C, 0x09, 0x0F, 0x08, 0x2F, 0x9C, 0x24, 0x34, 0x2F, 0x9A, 0x95, 0x8C
    .byte 0x00, 0x2D, 0x00, 0xD0, 0x01, 0x3D, 0x62, 0x88, 0x00, 0x2A, 0x00, 0xD0, 0x01, 0x3A, 0x00, 0x2D
    .byte 0x51, 0xD0, 0x4B, 0x46, 0x00, 0x2B, 0x4E, 0xD0, 0x98, 0x88, 0x30, 0x9F, 0xB8, 0x42, 0x4A, 0xD1
    .byte 0x0A, 0x20, 0x33, 0x5E, 0x0E, 0x27, 0xF1, 0x5F, 0x48, 0x46, 0x0A, 0x27, 0xC0, 0x5F, 0x80, 0x46
    .byte 0x48, 0x46, 0x0E, 0x27, 0xC0, 0x5F, 0x81, 0x46, 0x47, 0x46, 0xF8, 0x1A, 0x00, 0x28, 0x00, 0xDA
    .byte 0x40, 0x42, 0x0F, 0x28, 0x06, 0xDC, 0x4F, 0x46, 0x78, 0x1A, 0x00, 0x28, 0x00, 0xDA, 0x40, 0x42
    .byte 0x0F, 0x28, 0x30, 0xDD, 0x35, 0x9F, 0x38, 0x78, 0x00, 0x28, 0x29, 0xD1, 0x00, 0x2A, 0x0F, 0xD0
    .byte 0x04, 0x27, 0xE0, 0x5F, 0xC0, 0x1A, 0x00, 0x28, 0x00, 0xDA, 0x40, 0x42, 0x0F, 0x28, 0x1F, 0xDC
    .byte 0x06, 0x27, 0xE0, 0x5F, 0x40, 0x1A, 0x00, 0x28, 0x00, 0xDA, 0x40, 0x42, 0x0F, 0x28, 0x17, 0xDC
    .byte 0x30, 0x1C, 0x20, 0x30, 0x00, 0x78, 0x05, 0xAA, 0x00, 0x92, 0x01, 0x90, 0x18, 0x1C, 0x42, 0x46
    .byte 0x4B, 0x46, 0x89, 0xF0, 0x8D, 0xFF, 0x02, 0x1C, 0x30, 0x1C, 0x02, 0x21, 0x00, 0xF0, 0x8C, 0xF9
    .byte 0x1E, 0x20, 0x89, 0xF0, 0x29, 0xFD, 0x42, 0x1C, 0x43, 0x46, 0xA3, 0x80, 0x4F, 0x46, 0xE7, 0x80
    .byte 0x25, 0x80, 0x62, 0x80, 0x88, 0xE0, 0x0B, 0x4A, 0x2B, 0xA9, 0x08, 0x68, 0x10, 0x40, 0xB4, 0x22
    .byte 0x10, 0x43, 0x09, 0x4A, 0x10, 0x40, 0x08, 0x60, 0x2F, 0x98, 0x79, 0xF0, 0x63, 0xFF, 0x30, 0x1C
    .byte 0x00, 0xF0, 0xB8, 0xF9, 0x01, 0x1C, 0x30, 0x1C, 0x20, 0x30, 0x02, 0x78, 0x30, 0x1C, 0x00, 0xF0
    .byte 0x6B, 0xF9, 0x71, 0xE0, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0x2F, 0x98, 0x24, 0x30
    .byte 0x81, 0x46, 0x33, 0x1C, 0x20, 0x33, 0x1C, 0x78, 0x0A, 0x22, 0xB1, 0x5E, 0x8C, 0x46, 0x0E, 0x27
    .byte 0xF5, 0x5F, 0x2C, 0xAA, 0x78, 0x20, 0xD0, 0x21, 0x10, 0x80, 0x51, 0x80, 0x2D, 0xA8, 0xBC, 0x21
    .byte 0x89, 0x00, 0x88, 0x46, 0x84, 0x21, 0x47, 0x46, 0x07, 0x80, 0x41, 0x80, 0x9A, 0x46, 0x01, 0x1C
    .byte 0x30, 0x98, 0x09, 0x28, 0x12, 0xD1, 0x00, 0x2C, 0x10, 0xD1, 0x02, 0x23, 0xD1, 0x5E, 0x28, 0x1C
    .byte 0x08, 0x38, 0x08, 0x1A, 0x00, 0x28, 0x00, 0xDA, 0x40, 0x42, 0x07, 0x28, 0x28, 0xDC, 0x30, 0x1C
    .byte 0x02, 0x21, 0x42, 0x46, 0x94, 0x23, 0xFE, 0xF7, 0x4F, 0xF8, 0x21, 0xE0, 0x30, 0x9F, 0x02, 0x2F
    .byte 0x1E, 0xD1, 0x01, 0x2C, 0x1C, 0xD1, 0x00, 0x23, 0xC8, 0x5E, 0x64, 0x46, 0x00, 0x1B, 0x00, 0x28
    .byte 0x00, 0xDA, 0x40, 0x42, 0x0F, 0x28, 0x13, 0xDC, 0x02, 0x27, 0xC9, 0x5F, 0x28, 0x1C, 0x08, 0x30
    .byte 0x08, 0x1A, 0x00, 0x28, 0x00, 0xDA, 0x40, 0x42, 0x07, 0x28, 0x09, 0xDC, 0x00, 0x20, 0x12, 0x5E
    .byte 0x2C, 0xA8, 0x02, 0x21, 0x43, 0x5E, 0x20, 0x3B, 0x30, 0x1C, 0x09, 0x21, 0xFE, 0xF7, 0x2C, 0xF8
    .byte 0x4A, 0x46, 0x10, 0x88, 0x00, 0x28, 0x02, 0xD0, 0x01, 0x38, 0x10, 0x80, 0x14, 0xE0, 0x13, 0x4A
    .byte 0x2E, 0xA9, 0x08, 0x68, 0x10, 0x40, 0xB4, 0x22, 0x10, 0x43, 0x11, 0x4A, 0x10, 0x40, 0x08, 0x60
    .byte 0x2F, 0x98, 0x79, 0xF0, 0xEF, 0xFE, 0x30, 0x1C, 0x00, 0xF0, 0x44, 0xF9, 0x01, 0x1C, 0x53, 0x46
    .byte 0x1A, 0x78, 0x30, 0x1C, 0x00, 0xF0, 0xF8, 0xF8, 0x35, 0x9C, 0x20, 0x78, 0x05, 0xA9, 0x00, 0x28
    .byte 0x00, 0xD0, 0x00, 0x21, 0x30, 0x1C, 0xFE, 0xF7, 0x83, 0xF9, 0x31, 0x1C, 0x30, 0x31, 0x00, 0x20
    .byte 0x08, 0x70, 0xB0, 0x8C, 0x00, 0x28, 0x05, 0xD0, 0x01, 0x38, 0x04, 0xE0, 0x00, 0x00, 0xFF, 0xFF
    .byte 0xFF, 0xFF, 0x00, 0xFF, 0xF0, 0x8C, 0xB0, 0x84, 0x33, 0x69, 0x00, 0x2B, 0x04, 0xD0, 0x58, 0x68
    .byte 0xC1, 0x68, 0x18, 0x1C, 0xB1, 0xF0, 0x3C, 0xFD, 0x36, 0xB0, 0x38, 0xBC, 0x98, 0x46, 0xA1, 0x46
    .byte 0xAA, 0x46, 0xF0, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x30, 0xB5, 0x04, 0x1C, 0x0D, 0x1C, 0x3E, 0x30
    .byte 0x00, 0x78, 0x00, 0x28, 0x0D, 0xD0, 0x20, 0x68, 0x01, 0x68, 0x0A, 0x6C, 0x00, 0x21, 0xB1, 0xF0
    .byte 0x29, 0xFD, 0x41, 0x69, 0xA0, 0x31, 0x09, 0x68, 0xB1, 0xF0, 0x22, 0xFD, 0x00, 0x06, 0x00, 0x28
    .byte 0x03, 0xD1, 0x20, 0x1C, 0x29, 0x1C, 0x10, 0xF0, 0xA9, 0xFA, 0x30, 0xBC, 0x01, 0xBC, 0x00, 0x47

    thumb_func_start func_08021EE0
func_08021EE0: @ 0x08021EE0
    push {r4, r5, lr}
    sub sp, #4
    adds r4, r0, #0
    ldr r0, [r4, #0x34]
    bl GetGrowthStage__C5Horse
    adds r5, r0, #0
    cmp r5, #1
    bne .L08021F2A
    ldr r1, .L08021F34 @ =0xFFFF0000
    ldr r0, [sp]
    ands r0, r1
    movs r1, #0x78
    orrs r0, r1
    ldr r1, .L08021F38 @ =0xFF00FFFF
    ands r0, r1
    str r0, [sp]
    ldr r0, [r4, #0x34]
    mov r1, sp
    bl method_0809BC24__5HorsePC15UnkBarnAnimal2C
    adds r0, r4, #0
    bl func_080220D4
    adds r1, r0, #0
    adds r0, r4, #0
    adds r0, #0x20
    ldrb r2, [r0]
    adds r0, r4, #0
    bl func_08022048
    adds r0, r4, #0
    adds r0, #0x3e
    strb r5, [r0]
    ldr r0, [r4, #0x34]
    bl SetHasPlayedToday__3Pet
.L08021F2A:
    add sp, #4
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L08021F34: .4byte 0xFFFF0000
.L08021F38: .4byte 0xFF00FFFF

    thumb_func_start func_08021F3C
func_08021F3C: @ 0x08021F3C
    push {r4, lr}
    sub sp, #4
    adds r4, r0, #0
    adds r1, r4, #0
    adds r1, #0x3e
    movs r0, #0
    strb r0, [r1]
    ldr r1, .L08021F80 @ =0xFFFF0000
    ldr r0, [sp]
    ands r0, r1
    movs r1, #0x78
    orrs r0, r1
    ldr r1, .L08021F84 @ =0xFF00FFFF
    ands r0, r1
    str r0, [sp]
    ldr r0, [r4, #0x34]
    mov r1, sp
    bl method_0809BC24__5HorsePC15UnkBarnAnimal2C
    adds r0, r4, #0
    bl func_080220D4
    adds r1, r0, #0
    adds r0, r4, #0
    adds r0, #0x20
    ldrb r2, [r0]
    adds r0, r4, #0
    bl func_08022048
    add sp, #4
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L08021F80: .4byte 0xFFFF0000
.L08021F84: .4byte 0xFF00FFFF

    thumb_func_start func_08021F88
func_08021F88: @ 0x08021F88
    push {r4, r5, lr}
    adds r4, r1, #0
    ldr r5, .L08021FA8 @ =gUnk_080F09AC
    ldr r0, [r0, #0x34]
    bl GetGrowthStage__C5Horse
    lsls r1, r0, #3
    subs r1, r1, r0
    adds r1, r1, r4
    lsls r1, r1, #1
    adds r1, r1, r5
    ldrh r0, [r1]
    pop {r4, r5}
    pop {r1}
    bx r1
    .align 2, 0
.L08021FA8: .4byte gUnk_080F09AC

    thumb_func_start func_08021FAC
func_08021FAC: @ 0x08021FAC
    push {r4, lr}
    sub sp, #0x10
    adds r4, r0, #0
    cmp r1, #6
    bhi .L08021FE0
    lsls r0, r1, #2
    ldr r1, .L08021FC0 @ =.L08021FC4
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L08021FC0: .4byte .L08021FC4
.L08021FC4: @ jump table
    .4byte .L08021FE0 @ case 0
    .4byte .L08021FE4 @ case 1
    .4byte .L08021FEA @ case 2
    .4byte .L08021FE0 @ case 3
    .4byte .L08021FE0 @ case 4
    .4byte .L08021FE0 @ case 5
    .4byte .L08021FF0 @ case 6
.L08021FE0:
    movs r0, #0
    b .L0802203E
.L08021FE4:
    movs r0, #0x80
    lsls r0, r0, #8
    b .L0802203E
.L08021FEA:
    movs r0, #0x80
    lsls r0, r0, #9
    b .L0802203E
.L08021FF0:
    ldr r1, [r4, #0x14]
    mov r0, sp
    ldr r2, [r1, #0xc]
    adds r1, r4, #0
    bl _call_via_r2
    ldr r0, [sp]
    ldr r1, [sp, #4]
    str r0, [sp, #8]
    str r1, [sp, #0xc]
    add r1, sp, #8
    movs r2, #0x10
    adds r0, r4, #0
    adds r0, #0x20
    ldrb r0, [r0]
    adds r3, r1, #0
    cmp r0, #0
    blt .L08022036
    cmp r0, #1
    ble .L0802201E
    cmp r0, #3
    ble .L08022028
    b .L08022036
.L0802201E:
    movs r1, #6
    ldrsh r0, [r3, r1]
    movs r2, #2
    ldrsh r1, [r3, r2]
    b .L08022030
.L08022028:
    movs r2, #4
    ldrsh r0, [r1, r2]
    movs r2, #0
    ldrsh r1, [r1, r2]
.L08022030:
    subs r0, r0, r1
    adds r2, r0, #0
    adds r2, #0x10
.L08022036:
    lsls r0, r2, #0x10
    movs r1, #0xc
    bl __divsi3
.L0802203E:
    add sp, #0x10
    pop {r4}
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_08022048
func_08022048: @ 0x08022048
    push {r4, r5, r6, lr}
    adds r4, r0, #0
    adds r5, r1, #0
    adds r6, r2, #0
    cmp r5, #6
    beq .L0802205E
    adds r0, #0x3d
    ldrb r0, [r0]
    cmp r0, #0
    beq .L0802205E
    movs r5, #6
.L0802205E:
    adds r0, r4, #0
    adds r1, r5, #0
    bl func_08021F88
    adds r1, r0, #0
    ldrh r0, [r4, #0x22]
    cmp r0, r1
    beq .L08022074
    adds r0, r4, #0
    bl SetAnim__12AActorEntityUi
.L08022074:
    adds r0, r4, #0
    adds r0, #0x20
    ldrb r0, [r0]
    cmp r0, r6
    beq .L08022086
    adds r0, r4, #0
    adds r1, r6, #0
    bl SetAnimFacing__12AActorEntityUi
.L08022086:
    adds r0, r4, #0
    adds r1, r5, #0
    bl func_08021FAC
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_08020080
    adds r0, r4, #0
    adds r0, #0x3c
    adds r6, r0, #0
    ldrb r0, [r6]
    cmp r5, r0
    beq .L080220CA
    adds r0, r4, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #0
    bne .L080220CA
    movs r1, #1
    rsbs r1, r1, #0
    cmp r5, #4
    bne .L080220B6
    movs r1, #8
.L080220B6:
    cmp r1, #0
    blt .L080220C4
    adds r0, r4, #0
    movs r2, #1
    bl func_08032384
    b .L080220CA
.L080220C4:
    adds r0, r4, #0
    bl func_080323C8
.L080220CA:
    strb r5, [r6]
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_080220D4
func_080220D4: @ 0x080220D4
    push {lr}
    ldr r0, [r0, #0x34]
    ldr r1, [r0, #0x20]
    cmp r1, #1
    beq .L080220F6
    cmp r1, #1
    bgt .L080220E8
    cmp r1, #0
    beq .L080220F0
    b .L080220EC
.L080220E8:
    cmp r1, #2
    beq .L080220FA
.L080220EC:
    movs r0, #0
    b .L080220FC
.L080220F0:
    adds r0, #0x26
    ldrb r0, [r0]
    b .L080220FC
.L080220F6:
    movs r0, #2
    b .L080220FC
.L080220FA:
    movs r0, #1
.L080220FC:
    pop {r1}
    bx r1
.L08022100:
    .byte 0x10, 0xB5, 0x81, 0xB0, 0x04, 0x1C, 0x62, 0x6B, 0x10, 0x6A, 0x02, 0x28, 0x1A, 0xD1, 0x0F, 0x49
    .byte 0x00, 0x98, 0x08, 0x40, 0xB4, 0x21, 0x08, 0x43, 0x0D, 0x49, 0x08, 0x40, 0x00, 0x90, 0x10, 0x1C
    .byte 0x69, 0x46, 0x79, 0xF0, 0x7F, 0xFD, 0x20, 0x1C, 0x3D, 0x30, 0x00, 0x78, 0x00, 0x28, 0x09, 0xD1
    .byte 0x20, 0x1C, 0xFF, 0xF7, 0xCF, 0xFF, 0x01, 0x1C, 0x20, 0x1C, 0x20, 0x30, 0x02, 0x78, 0x20, 0x1C
    .byte 0xFF, 0xF7, 0x82, 0xFF, 0x01, 0xB0, 0x10, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0xFF, 0xFF
    .byte 0xFF, 0xFF, 0x00, 0xFF, 0x00, 0xB5, 0x40, 0x6B, 0x79, 0xF0, 0x6A, 0xF8, 0x01, 0x21, 0x48, 0x40
    .byte 0x02, 0xBC, 0x08, 0x47, 0x10, 0xB5, 0x04, 0x1C, 0x60, 0x6B, 0x79, 0xF0, 0x61, 0xF8, 0x00, 0x06
    .byte 0x00, 0x28, 0x06, 0xD1, 0x60, 0x6B, 0x01, 0x21, 0x79, 0xF0, 0x96, 0xF8, 0x60, 0x6B, 0x79, 0xF0
    .byte 0x7B, 0xF8, 0x20, 0x1C, 0x01, 0x21, 0x00, 0x22, 0x10, 0xF0, 0xFC, 0xF8, 0x20, 0x1C, 0xA7, 0x21
    .byte 0xFD, 0xF7, 0x98, 0xFF, 0x10, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0x30, 0xB5, 0x81, 0xB0
    .byte 0x04, 0x1C, 0x3B, 0x2A, 0x1E, 0xD9, 0x25, 0x1C, 0x20, 0x35, 0x28, 0x78, 0x88, 0x42, 0x02, 0xD0
    .byte 0x20, 0x1C, 0x0F, 0xF0, 0xF1, 0xFF, 0x0D, 0x49, 0x00, 0x98, 0x08, 0x40, 0x3C, 0x21, 0x08, 0x43
    .byte 0x00, 0x90, 0x60, 0x6B, 0x69, 0x46, 0x79, 0xF0, 0x3B, 0xFD, 0x20, 0x1C, 0x3D, 0x30, 0x00, 0x78
    .byte 0x00, 0x28, 0x07, 0xD1, 0x20, 0x1C, 0xFF, 0xF7, 0x7D, 0xFF, 0x01, 0x1C, 0x2A, 0x78, 0x20, 0x1C
    .byte 0xFF, 0xF7, 0x32, 0xFF, 0x01, 0xB0, 0x30, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0xFF, 0xFF

    thumb_func_start func_080221F0
func_080221F0: @ 0x080221F0
    push {r4, r5, r6, r7, lr}
    sub sp, #8
    adds r6, r0, #0
    adds r7, r1, #0
    ldrh r0, [r7]
    lsls r0, r0, #0x16
    lsrs r0, r0, #0x16
    ldrh r1, [r6, #4]
    cmp r0, r1
    bne .L0802229A
    ldr r0, [r6, #0x34]
    bl GetAffection__C6Animal
    bl func_08020018
    movs r1, #0xa
    ldrsh r3, [r6, r1]
    ldrb r1, [r7, #1]
    lsrs r1, r1, #2
    ldrh r2, [r7, #2]
    ldr r4, .L080222A4 @ =0x000003FF
    ands r2, r4
    lsls r2, r2, #6
    orrs r2, r1
    lsls r2, r2, #0x10
    asrs r2, r2, #0x10
    subs r2, r2, r3
    movs r3, #0xe
    ldrsh r5, [r6, r3]
    ldrb r3, [r7, #3]
    lsrs r3, r3, #2
    ldrh r1, [r7, #4]
    ands r1, r4
    lsls r1, r1, #6
    orrs r1, r3
    lsls r1, r1, #0x10
    asrs r1, r1, #0x10
    subs r1, r1, r5
    adds r3, r2, #0
    muls r3, r2, r3
    adds r2, r3, #0
    adds r3, r1, #0
    muls r3, r1, r3
    adds r1, r3, #0
    adds r2, r2, r1
    adds r1, r0, #0
    muls r1, r0, r1
    adds r0, r1, #0
    cmp r2, r0
    bgt .L0802229A
    ldr r0, [r6, #0x34]
    bl GetAffection__C6Animal
    lsls r1, r0, #4
    subs r1, r1, r0
    lsls r1, r1, #6
    lsrs r1, r1, #8
    movs r3, #0xf0
    lsls r3, r3, #1
    adds r1, r1, r3
    lsls r1, r1, #0x10
    lsrs r1, r1, #0x10
    str r1, [sp]
    ldr r0, [r6, #0x34]
    mov r1, sp
    bl method_0809BC30__5HorsePC18UnkBarnAnimal2C_x2
    adds r0, r6, #0
    adds r0, #0x3d
    ldrb r0, [r0]
    cmp r0, #0
    bne .L08022294
    adds r0, r6, #0
    bl func_080220D4
    adds r1, r0, #0
    adds r0, r6, #0
    adds r0, #0x20
    ldrb r2, [r0]
    adds r0, r6, #0
    bl func_08022048
.L08022294:
    ldr r0, [r6, #0x34]
    bl SetHasTalkedToday__3Pet
.L0802229A:
    add sp, #8
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L080222A4: .4byte 0x000003FF

    thumb_func_start func_080222A8
func_080222A8: @ 0x080222A8
    push {r4, r5, r6, lr}
    mov r6, r8
    push {r6}
    sub sp, #0x10
    adds r6, r0, #0
    mov r8, r1
    adds r4, r2, #0
    adds r0, r4, #0
    bl func_08022320
    adds r5, r0, #0
    adds r0, r4, #0
    bl func_08022334
    str r5, [sp]
    str r0, [sp, #4]
    movs r1, #0
    str r1, [sp, #8]
    add r0, sp, #0xc
    strb r1, [r0]
    adds r0, r6, #0
    mov r1, r8
    movs r2, #5
    movs r3, #0xd
    bl func_080324BC
    ldr r0, .L080222F0 @ =vtable_unk_080E64B4
    str r0, [r6, #4]
    adds r0, r6, #0
    add sp, #0x10
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6}
    pop {r1}
    bx r1
    .align 2, 0
.L080222F0: .4byte vtable_unk_080E64B4
.L080222F4:
    .byte 0x30, 0xB5, 0x04, 0x1C, 0x0D, 0x1C, 0x22, 0x68, 0x90, 0x88, 0x0A, 0x23
    .byte 0xD1, 0x5E, 0x0E, 0x23, 0xD2, 0x5E, 0x10, 0xF0, 0xFB, 0xFA, 0x21, 0x1C, 0x8B, 0x31, 0x08, 0x70
    .byte 0x20, 0x1C, 0x29, 0x1C, 0x10, 0xF0, 0xBC, 0xF9, 0x30, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00

    thumb_func_start func_08022320
func_08022320: @ 0x08022320
    push {lr}
    cmp r0, #0
    beq .L0802232A
    cmp r0, #1
    beq .L0802232E
.L0802232A:
    movs r0, #1
    b .L08022330
.L0802232E:
    movs r0, #2
.L08022330:
    pop {r1}
    bx r1

    thumb_func_start func_08022334
func_08022334: @ 0x08022334
    push {lr}
    cmp r0, #0
    beq .L0802233E
    cmp r0, #1
    beq .L08022342
.L0802233E:
    movs r0, #0xe
    b .L08022344
.L08022342:
    movs r0, #0xf
.L08022344:
    pop {r1}
    bx r1
.L08022348:
    .byte 0x70, 0xB5, 0x04, 0x1C, 0x8C, 0x20, 0xDE, 0xF7
    .byte 0x41, 0xF9, 0x05, 0x1C, 0x60, 0x6B, 0x79, 0xF0, 0x5B, 0xFC, 0x02, 0x1C, 0x28, 0x1C, 0x21, 0x1C
    .byte 0xFF, 0xF7, 0xA2, 0xFF, 0x05, 0x1C, 0x2E, 0x1C, 0x3C, 0x34, 0x20, 0x78, 0x04, 0x28, 0x16, 0xD1
    .byte 0x28, 0x1C, 0x70, 0x30, 0x08, 0x21, 0x3C, 0xF0, 0x73, 0xFA, 0x28, 0x1C, 0x84, 0x30, 0x00, 0x22
    .byte 0x01, 0x21, 0x01, 0x70, 0x02, 0x30, 0x02, 0x70, 0x01, 0x30, 0x01, 0x70, 0x2A, 0x1C, 0x8A, 0x32
    .byte 0x02, 0x23, 0x11, 0x78, 0x04, 0x20, 0x40, 0x42, 0x08, 0x40, 0x18, 0x43, 0x10, 0x70, 0x30, 0x1C
    .byte 0x70, 0xBC, 0x02, 0xBC, 0x08, 0x47, 0x00, 0x00

    thumb_func_start func_080223A8
func_080223A8: @ 0x080223A8
    push {r4, r5, r6, lr}
    sub sp, #8
    adds r4, r0, #0
    adds r5, r1, #0
    adds r6, r2, #0
    mov r0, sp
    adds r1, r6, #0
    bl __5ActorRC5Actor
    movs r3, #0xe4
    lsls r3, r3, #3
    adds r0, r4, #0
    adds r1, r5, #0
    mov r2, sp
    bl func_08020038
    ldr r0, .L080223EC @ =vtable_unk_080E639C
    str r0, [r4, #0x14]
    str r6, [r4, #0x34]
    adds r0, r4, #0
    bl func_08022950
    adds r1, r0, #0
    adds r0, r4, #0
    adds r0, #0x20
    ldrb r2, [r0]
    adds r0, r4, #0
    bl func_080228B4
    adds r0, r4, #0
    add sp, #8
    pop {r4, r5, r6}
    pop {r1}
    bx r1
    .align 2, 0
.L080223EC: .4byte vtable_unk_080E639C
.L080223F0:
    .byte 0x70, 0xB5, 0x82, 0xB0, 0x05, 0x1C, 0x0E, 0x1C, 0x10, 0x48, 0x68, 0x61, 0x6C, 0x6B, 0x68, 0x46
    .byte 0x29, 0x1C, 0x0F, 0xF0, 0xB5, 0xFE, 0x20, 0x1C, 0x69, 0x46, 0x78, 0xF0, 0x8B, 0xFE, 0x0C, 0x48
    .byte 0x68, 0x61, 0x29, 0x69, 0x00, 0x29, 0x05, 0xD0, 0x48, 0x68, 0x82, 0x68, 0x08, 0x1C, 0x03, 0x21
    .byte 0xB1, 0xF0, 0x78, 0xFA, 0x01, 0x20, 0x30, 0x40, 0x00, 0x28, 0x02, 0xD0, 0x28, 0x1C, 0xDE, 0xF7
    .byte 0xEB, 0xF8, 0x02, 0xB0, 0x70, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0x9C, 0x63, 0x0E, 0x08
    .byte 0x50, 0x62, 0x0E, 0x08, 0x10, 0xB5, 0x81, 0xB0, 0x04, 0x1C, 0x09, 0x04, 0x09, 0x0C, 0x0C, 0x4A
    .byte 0x00, 0x98, 0x10, 0x40, 0x08, 0x43, 0x0B, 0x49, 0x08, 0x40, 0x00, 0x90, 0x60, 0x6B, 0x69, 0x46
    .byte 0x79, 0xF0, 0x5E, 0xFC, 0x20, 0x1C, 0x00, 0xF0, 0x73, 0xFA, 0x01, 0x1C, 0x20, 0x1C, 0x20, 0x30
    .byte 0x02, 0x78, 0x20, 0x1C, 0x00, 0xF0, 0x1E, 0xFA, 0x01, 0xB0, 0x10, 0xBC, 0x01, 0xBC, 0x00, 0x47
    .byte 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0x10, 0xB5, 0x04, 0x1C, 0x00, 0xF0, 0x2A, 0xF8
    .byte 0x21, 0x1C, 0x30, 0x31, 0x00, 0x20, 0x08, 0x70, 0xA0, 0x8C, 0x00, 0x28, 0x01, 0xD0, 0x01, 0x38
    .byte 0x00, 0xE0, 0xE0, 0x8C, 0xA0, 0x84, 0x22, 0x69, 0x00, 0x2A, 0x04, 0xD0, 0x50, 0x68, 0xC1, 0x68
    .byte 0x10, 0x1C, 0xB1, 0xF0, 0x2D, 0xFA, 0x10, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x30, 0xB5, 0x04, 0x1C
    .byte 0x0D, 0x1C, 0x0F, 0xF0, 0x55, 0xFF, 0x00, 0x06, 0x00, 0x28, 0x03, 0xD0, 0x20, 0x1C, 0x29, 0x1C
    .byte 0x00, 0xF0, 0x08, 0xF8, 0x20, 0x1C, 0x29, 0x1C, 0x0F, 0xF0, 0xA8, 0xFF, 0x30, 0xBC, 0x01, 0xBC
    .byte 0x00, 0x47, 0x00, 0x00

    thumb_func_start func_080224E4
func_080224E4: @ 0x080224E4
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #0x74
    mov sb, r0
    ldr r7, [r0, #0x34]
    ldr r0, [r0]
    mov r8, r0
    mov r2, sb
    ldrh r2, [r2, #4]
    str r2, [sp, #0x64]
    cmp r2, #2
    bne .L080225A6
    ldrb r0, [r1, #4]
    cmp r0, #0
    beq .L080225A6
    adds r0, r7, #0
    bl GetCurrentOutdoorMinutes__C9Livestock
    adds r5, r0, #0
    adds r0, r7, #0
    movs r1, #1
    bl AddOutdoorMinutes__9LivestockUi
    adds r0, r7, #0
    bl GetCurrentOutdoorMinutes__C9Livestock
    adds r4, r0, #0
    cmp r5, #0xb3
    bhi .L08022552
    cmp r4, #0xb3
    bls .L08022552
    mov r3, r8
    ldr r0, [r3]
    movs r6, #0xa2
    lsls r6, r6, #1
    adds r0, r0, r6
    ldr r1, [r0]
    mov r0, r8
    bl _call_via_r1
    ldr r0, [r0]
    cmp r0, #0
    beq .L08022552
    adds r0, r7, #0
    bl IsUnhappy__C9Livestock
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08022552
    adds r0, r7, #0
    bl SetUnhappy__9Livestock
.L08022552:
    cmp r5, #0xef
    bhi .L08022560
    cmp r4, #0xef
    bls .L08022560
    adds r0, r7, #0
    bl SetFed__7Chicken
.L08022560:
    ldr r0, .L08022670 @ =0x0000012B
    cmp r5, r0
    bhi .L080225A6
    cmp r4, r0
    bls .L080225A6
    mov r1, r8
    ldr r0, [r1]
    movs r2, #0xa2
    lsls r2, r2, #1
    adds r0, r0, r2
    ldr r1, [r0]
    mov r0, r8
    bl _call_via_r1
    ldr r0, [r0]
    cmp r0, #0
    bne .L080225A6
    adds r0, r7, #0
    bl IsUnhappy__C9Livestock
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802259E
    movs r0, #0x64
    bl func_080AB788
    cmp r0, #0x1d
    bhi .L0802259E
    adds r0, r7, #0
    bl ResetUnhappy__9Livestock
.L0802259E:
    adds r0, r7, #0
    movs r1, #1
    bl AddAffection__6Animali
.L080225A6:
    mov r3, r8
    ldr r1, [r3]
    add r0, sp, #8
    ldr r3, [r1, #0x34]
    mov r1, r8
    ldr r2, [sp, #0x64]
    bl _call_via_r3
    mov r6, sb
    ldr r1, [r6, #0x14]
    add r0, sp, #0x48
    ldr r2, [r1, #0xc]
    mov r1, sb
    bl _call_via_r2
    ldr r0, [sp, #0x48]
    ldr r1, [sp, #0x4c]
    str r0, [sp, #0x6c]
    str r1, [sp, #0x70]
    add r4, sp, #0x14
    movs r1, #0x10
    mov sl, r1
    movs r5, #0
    movs r1, #0x11
    str r1, [sp, #0x14]
    movs r0, #0x11
    rsbs r0, r0, #0
    str r0, [r4, #4]
    str r0, [r4, #8]
    str r1, [r4, #0xc]
    add r1, sp, #0x28
    add r0, sp, #8
    ldm r0!, {r2, r3, r6}
    stm r1!, {r2, r3, r6}
    ldr r0, [sp, #0x6c]
    ldr r1, [sp, #0x70]
    str r0, [sp, #0x34]
    str r1, [sp, #0x38]
    mov r1, sl
    str r1, [r4, #0x28]
    str r5, [r4, #0x2c]
    str r5, [r4, #0x30]
    mov r2, r8
    ldr r0, [r2]
    ldr r2, [r0, #0x40]
    mov r0, r8
    movs r1, #0
    bl _call_via_r2
    adds r6, r0, #0
    mov r3, r8
    ldr r0, [r3]
    ldr r2, [r0, #0x40]
    mov r0, r8
    movs r1, #0x4a
    bl _call_via_r2
    adds r5, r0, #0
    cmp r6, #0
    beq .L0802263E
    ldrh r0, [r6, #4]
    ldr r1, [sp, #0x64]
    cmp r0, r1
    bne .L0802263E
    ldr r1, [r6, #0x14]
    add r4, sp, #0x50
    adds r0, r4, #0
    ldr r2, [r1, #0xc]
    adds r1, r6, #0
    bl _call_via_r2
    add r0, sp, #0x14
    adds r1, r4, #0
    movs r2, #0
    bl func_080ABA90
.L0802263E:
    cmp r5, #0
    beq .L08022662
    ldrh r0, [r5, #4]
    ldr r2, [sp, #0x64]
    cmp r0, r2
    bne .L08022662
    ldr r1, [r5, #0x14]
    add r4, sp, #0x58
    adds r0, r4, #0
    ldr r2, [r1, #0xc]
    adds r1, r5, #0
    bl _call_via_r2
    add r0, sp, #0x14
    adds r1, r4, #0
    movs r2, #0
    bl func_080ABA90
.L08022662:
    ldr r0, [r7, #0x24]
    cmp r0, #0
    beq .L08022674
    cmp r0, #1
    bne .L0802266E
    b .L080227B4
.L0802266E:
    b .L08022894
    .align 2, 0
.L08022670: .4byte 0x0000012B
.L08022674:
    movs r3, #0x28
    adds r3, r3, r7
    mov sl, r3
    ldrh r4, [r7, #0x28]
    cmp r4, #0
    beq .L08022706
    mov r6, sb
    ldr r5, [r6, #0x18]
    ldr r6, [r6, #0x1c]
    movs r7, #0
    cmp r5, #0
    bge .L080226A4
    ldr r1, [sp, #0x1c]
    ldr r0, [sp, #0x3c]
    cmn r1, r0
    bge .L0802269C
    add r0, sp, #0x14
    bl func_080AB948
    ldr r1, [sp, #0x1c]
.L0802269C:
    movs r0, #0x10
    rsbs r0, r0, #0
    cmp r1, r0
    bgt .L080226F8
.L080226A4:
    cmp r5, #0
    ble .L080226C0
    ldr r1, [sp, #0x20]
    ldr r0, [sp, #0x3c]
    cmp r1, r0
    ble .L080226BA
    add r0, sp, #0x14
    bl func_080AB9C4
    ldr r0, [sp, #0x20]
    b .L080226BC
.L080226BA:
    adds r0, r1, #0
.L080226BC:
    cmp r0, #0xf
    ble .L080226F8
.L080226C0:
    cmp r6, #0
    bge .L080226DC
    ldr r1, [sp, #0x18]
    ldr r0, [sp, #0x3c]
    cmn r1, r0
    bge .L080226D4
    add r0, sp, #0x14
    bl func_080AB8D0
    ldr r1, [sp, #0x18]
.L080226D4:
    movs r0, #0x10
    rsbs r0, r0, #0
    cmp r1, r0
    bgt .L080226F8
.L080226DC:
    cmp r6, #0
    ble .L080226FA
    ldr r1, [sp, #0x14]
    ldr r0, [sp, #0x3c]
    cmp r1, r0
    ble .L080226F2
    add r0, sp, #0x14
    bl func_080AB85C
    ldr r0, [sp, #0x14]
    b .L080226F4
.L080226F2:
    adds r0, r1, #0
.L080226F4:
    cmp r0, #0xf
    bgt .L080226FA
.L080226F8:
    movs r7, #1
.L080226FA:
    cmp r7, #0
    beq .L08022702
    movs r4, #0
    b .L080227AA
.L08022702:
    subs r4, #1
    b .L080227AA
.L08022706:
    mov r0, sb
    bl func_08020130
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L080227AA
    mov r1, r8
    ldr r0, [r1]
    movs r2, #0xa2
    lsls r2, r2, #1
    adds r0, r0, r2
    ldr r1, [r0]
    mov r0, r8
    bl _call_via_r1
    ldrb r0, [r0, #0xa]
    lsls r0, r0, #0x1b
    lsrs r0, r0, #0x1b
    movs r6, #0
    subs r0, #6
    cmp r0, #0xe
    bls .L08022734
    movs r6, #1
.L08022734:
    adds r0, r7, #0
    bl GetGrowthStage__C7Chicken
    adds r5, r0, #0
    adds r0, r7, #0
    bl IsSick__C9Livestock
    lsls r4, r6, #2
    adds r4, r4, r6
    lsls r4, r4, #4
    lsls r1, r5, #2
    adds r1, r1, r5
    lsls r1, r1, #3
    ldr r2, .L080227B0 @ =gUnk_080F09C8
    adds r1, r1, r2
    adds r4, r4, r1
    lsls r0, r0, #0x18
    lsrs r0, r0, #0x18
    lsls r1, r0, #2
    adds r1, r1, r0
    lsls r1, r1, #2
    adds r4, r4, r1
    adds r0, r4, #0
    movs r1, #5
    bl func_080AB82C
    adds r6, r0, #0
    lsls r0, r6, #2
    adds r4, r4, r0
    movs r5, #0x3c
    ldrb r0, [r4, #2]
    muls r0, r5, r0
    bl func_080AB788
    ldrb r1, [r4, #1]
    muls r1, r5, r1
    adds r4, r1, r0
    mov r0, sb
    adds r0, #0x20
    ldrb r5, [r0]
    movs r0, #4
    bl func_080AB788
    adds r1, r0, #0
    cmp r1, #0
    beq .L0802279C
    cmp r1, #3
    beq .L0802279C
    adds r0, r5, #0
    bl func_080AB7A4
    adds r5, r0, #0
.L0802279C:
    mov r0, sb
    adds r1, r6, #0
    adds r2, r5, #0
    bl func_080228B4
    mov r3, sl
    strb r6, [r3, #2]
.L080227AA:
    mov r6, sl
    strh r4, [r6]
    b .L08022894
    .align 2, 0
.L080227B0: .4byte gUnk_080F09C8
.L080227B4:
    adds r0, r7, #0
    adds r0, #0x28
    str r0, [sp, #0x68]
    ldrh r1, [r7, #0x28]
    mov sl, r1
    cmp r1, #0
    beq .L080227C8
    movs r2, #1
    rsbs r2, r2, #0
    add sl, r2
.L080227C8:
    ldr r1, [r7, #0x28]
    lsls r0, r1, #9
    lsrs r5, r0, #0x19
    cmp r5, #0
    beq .L080227D4
    subs r5, #1
.L080227D4:
    ldr r3, [sp, #0x68]
    ldrb r4, [r3, #3]
    cmp r4, #0
    beq .L080227DE
    subs r4, #1
.L080227DE:
    mov r0, sl
    cmp r0, #0
    beq .L08022868
    lsls r0, r1, #8
    cmp r0, #0
    bge .L080227FC
    mov r1, r8
    ldr r0, [r1]
    ldr r2, [r0, #0x40]
    mov r0, r8
    movs r1, #0x2d
    bl _call_via_r2
    adds r1, r0, #0
    b .L080227FE
.L080227FC:
    adds r1, r6, #0
.L080227FE:
    cmp r1, #0
    beq .L08022868
    ldrh r0, [r1, #4]
    ldr r2, [sp, #0x64]
    cmp r0, r2
    bne .L08022868
    cmp r4, #0
    bne .L0802284E
    mov r3, sb
    movs r0, #0xa
    ldrsh r6, [r3, r0]
    movs r2, #0xe
    ldrsh r4, [r3, r2]
    movs r3, #0xa
    ldrsh r2, [r1, r3]
    movs r0, #0xe
    ldrsh r3, [r1, r0]
    movs r7, #1
    cmp r5, #0
    beq .L08022828
    movs r7, #4
.L08022828:
    mov r0, sb
    adds r0, #0x20
    ldrb r0, [r0]
    add r1, sp, #0x14
    str r1, [sp]
    str r0, [sp, #4]
    adds r0, r6, #0
    adds r1, r4, #0
    bl func_080ABE58
    adds r2, r0, #0
    mov r0, sb
    adds r1, r7, #0
    bl func_080228B4
    movs r0, #0x1e
    bl func_080AB788
    adds r4, r0, #1
.L0802284E:
    mov r3, sl
    ldr r2, [sp, #0x68]
    strh r3, [r2]
    movs r0, #0x7f
    ands r5, r0
    ldrb r1, [r2, #2]
    movs r0, #0x80
    rsbs r0, r0, #0
    ands r0, r1
    orrs r0, r5
    strb r0, [r2, #2]
    strb r4, [r2, #3]
    b .L08022894
.L08022868:
    ldr r1, .L080228AC @ =0xFFFF0000
    ldr r0, [sp, #0x60]
    ands r0, r1
    movs r1, #0xb4
    orrs r0, r1
    ldr r1, .L080228B0 @ =0xFF00FFFF
    ands r0, r1
    str r0, [sp, #0x60]
    add r1, sp, #0x60
    adds r0, r7, #0
    bl method_0809BD20__7ChickenPC15UnkBarnAnimal2C
    mov r0, sb
    bl func_08022950
    adds r1, r0, #0
    mov r0, sb
    adds r0, #0x20
    ldrb r2, [r0]
    mov r0, sb
    bl func_080228B4
.L08022894:
    mov r0, sb
    add r1, sp, #0x14
    bl func_08020170
    add sp, #0x74
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L080228AC: .4byte 0xFFFF0000
.L080228B0: .4byte 0xFF00FFFF

    thumb_func_start func_080228B4
func_080228B4: @ 0x080228B4
    push {r4, r5, r6, r7, lr}
    adds r4, r0, #0
    adds r5, r1, #0
    adds r6, r2, #0
    bl func_08022980
    adds r1, r0, #0
    ldrh r0, [r4, #0x22]
    cmp r0, r1
    beq .L080228CE
    adds r0, r4, #0
    bl SetAnim__12AActorEntityUi
.L080228CE:
    adds r0, r4, #0
    adds r0, #0x20
    ldrb r0, [r0]
    cmp r0, r6
    beq .L080228E0
    adds r0, r4, #0
    adds r1, r6, #0
    bl SetAnimFacing__12AActorEntityUi
.L080228E0:
    adds r0, r4, #0
    adds r1, r5, #0
    bl func_080229A4
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_08020080
    adds r0, r4, #0
    adds r0, #0x38
    adds r7, r0, #0
    ldrb r0, [r7]
    cmp r5, r0
    beq .L08022946
    movs r6, #1
    rsbs r6, r6, #0
    ldr r0, [r4, #0x34]
    bl GetGrowthStage__C7Chicken
    movs r1, #0
    cmp r0, #0
    beq .L0802290E
    movs r1, #3
.L0802290E:
    cmp r5, r1
    bne .L08022930
    ldr r0, [r4]
    ldr r1, [r0]
    movs r2, #0xa2
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldrb r0, [r0, #0xa]
    lsls r0, r0, #0x1b
    lsrs r0, r0, #0x1b
    subs r0, #6
    cmp r0, #0xe
    bls .L08022930
    movs r6, #8
.L08022930:
    cmp r6, #0
    blt .L08022940
    adds r0, r4, #0
    adds r1, r6, #0
    movs r2, #1
    bl func_08032384
    b .L08022946
.L08022940:
    adds r0, r4, #0
    bl func_080323C8
.L08022946:
    strb r5, [r7]
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_08022950
func_08022950: @ 0x08022950
    push {lr}
    ldr r0, [r0, #0x34]
    ldr r1, [r0, #0x24]
    cmp r1, #0
    beq .L08022962
    cmp r1, #1
    beq .L08022968
    movs r0, #0
    b .L0802297A
.L08022962:
    adds r0, #0x2a
    ldrb r0, [r0]
    b .L0802297A
.L08022968:
    adds r0, #0x2a
    ldrb r1, [r0]
    movs r0, #0x7f
    ands r0, r1
    movs r1, #1
    cmp r0, #0
    beq .L08022978
    movs r1, #4
.L08022978:
    adds r0, r1, #0
.L0802297A:
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_08022980
func_08022980: @ 0x08022980
    push {r4, r5, lr}
    adds r4, r1, #0
    ldr r5, .L080229A0 @ =gUnk_080F0A68
    ldr r0, [r0, #0x34]
    bl GetGrowthStage__C7Chicken
    lsls r1, r0, #2
    adds r1, r1, r0
    adds r1, r1, r4
    lsls r1, r1, #1
    adds r1, r1, r5
    ldrh r0, [r1]
    pop {r4, r5}
    pop {r1}
    bx r1
    .align 2, 0
.L080229A0: .4byte gUnk_080F0A68

    thumb_func_start func_080229A4
func_080229A4: @ 0x080229A4
    push {lr}
    cmp r1, #1
    beq .L080229AE
    movs r0, #0
    b .L080229B2
.L080229AE:
    movs r0, #0x80
    lsls r0, r0, #8
.L080229B2:
    pop {r1}
    bx r1
    .align 2, 0
.L080229B8:
    .byte 0x01, 0x20, 0x70, 0x47, 0x00, 0xB5, 0x40, 0x6B
    .byte 0x78, 0xF0, 0xA4, 0xFD, 0x02, 0xBC, 0x08, 0x47, 0x30, 0xB5, 0x04, 0x1C, 0x00, 0x25, 0xA0, 0x88
    .byte 0x02, 0x28, 0x0C, 0xD1, 0x60, 0x6B, 0x78, 0xF0, 0x99, 0xFD, 0x00, 0x06, 0x00, 0x28, 0x06, 0xD1
    .byte 0x60, 0x6B, 0x78, 0xF0, 0x8F, 0xFD, 0x00, 0x06, 0x00, 0x28, 0x00, 0xD1, 0x01, 0x25, 0x28, 0x1C
    .byte 0x30, 0xBC, 0x02, 0xBC, 0x08, 0x47, 0x00, 0x00, 0x10, 0xB5, 0x81, 0xB0, 0x04, 0x1C, 0x78, 0x20
    .byte 0x88, 0xF0, 0xC2, 0xFE, 0xF0, 0x30, 0x00, 0x04, 0x00, 0x0C, 0x1B, 0x4A, 0x00, 0x99, 0x11, 0x40
    .byte 0x01, 0x43, 0x1A, 0x48, 0x01, 0x40, 0xF0, 0x20, 0x80, 0x03, 0x01, 0x43, 0x18, 0x48, 0x01, 0x40
    .byte 0x18, 0x48, 0x01, 0x40, 0x00, 0x91, 0x60, 0x6B, 0x69, 0x46, 0x79, 0xF0, 0x7F, 0xF9, 0x20, 0x1C
    .byte 0xFF, 0xF7, 0x8E, 0xFF, 0x01, 0x1C, 0x20, 0x1C, 0x20, 0x30, 0x02, 0x78, 0x20, 0x1C, 0xFF, 0xF7
    .byte 0x39, 0xFF, 0x60, 0x6B, 0x0A, 0x21, 0x78, 0xF0, 0x49, 0xFC, 0x60, 0x6B, 0x78, 0xF0, 0xF4, 0xFD
    .byte 0x20, 0x1C, 0x02, 0x21, 0x00, 0x22, 0x0F, 0xF0, 0x95, 0xFC, 0x60, 0x6B, 0x79, 0xF0, 0x26, 0xF9
    .byte 0xA5, 0x21, 0x01, 0x28, 0x00, 0xD1, 0xA6, 0x21, 0x20, 0x1C, 0xFD, 0xF7, 0x2B, 0xFB, 0x01, 0xB0
    .byte 0x10, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x80, 0xFF
    .byte 0xFF, 0xFF, 0x7F, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x10, 0xB5, 0x04, 0x1C, 0x60, 0x6B, 0x78, 0xF0
    .byte 0xC9, 0xFD, 0x60, 0x6B, 0x78, 0xF0, 0x36, 0xFD, 0x00, 0x06, 0x00, 0x28, 0x02, 0xD0, 0x60, 0x6B
    .byte 0x78, 0xF0, 0xD0, 0xFD, 0x10, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0x10, 0xB5, 0x81, 0xB0
    .byte 0x04, 0x1C, 0x78, 0x20, 0x88, 0xF0, 0x68, 0xFE, 0xF0, 0x30, 0x00, 0x04, 0x00, 0x0C, 0x1B, 0x4A
    .byte 0x00, 0x99, 0x11, 0x40, 0x01, 0x43, 0x1A, 0x48, 0x01, 0x40, 0xF0, 0x20, 0x80, 0x03, 0x01, 0x43
    .byte 0x80, 0x20, 0x00, 0x04, 0x01, 0x43, 0x17, 0x48, 0x01, 0x40, 0x00, 0x91, 0x60, 0x6B, 0x69, 0x46
    .byte 0x79, 0xF0, 0x24, 0xF9, 0x20, 0x1C, 0xFF, 0xF7, 0x33, 0xFF, 0x01, 0x1C, 0x20, 0x1C, 0x20, 0x30
    .byte 0x02, 0x78, 0x20, 0x1C, 0xFF, 0xF7, 0xDE, 0xFE, 0x60, 0x6B, 0x0A, 0x21, 0x78, 0xF0, 0xEE, 0xFB
    .byte 0x60, 0x6B, 0x78, 0xF0, 0x99, 0xFD, 0x20, 0x1C, 0x02, 0x21, 0x00, 0x22, 0x0F, 0xF0, 0x3A, 0xFC
    .byte 0x60, 0x6B, 0x79, 0xF0, 0xCB, 0xF8, 0xA5, 0x21, 0x01, 0x28, 0x00, 0xD1, 0xA6, 0x21, 0x20, 0x1C
    .byte 0xFD, 0xF7, 0xD0, 0xFA, 0x01, 0xB0, 0x10, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0xFF, 0xFF
    .byte 0xFF, 0xFF, 0x80, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x10, 0xB5, 0x0A, 0x23, 0xCA, 0x5E, 0x0E, 0x24
    .byte 0x0B, 0x5F, 0xD1, 0x1F, 0x01, 0x80, 0x19, 0x1F, 0x41, 0x80, 0x07, 0x32, 0x82, 0x80, 0x05, 0x33
    .byte 0xC3, 0x80, 0x10, 0xBC, 0x04, 0xBC, 0x10, 0x47

    thumb_func_start func_08022B58
func_08022B58: @ 0x08022B58
    movs r0, #0
    bx lr

    thumb_func_start func_08022B5C
func_08022B5C: @ 0x08022B5C
    push {lr}
    cmp r0, #0
    beq .L08022B66
    cmp r0, #1
    beq .L08022B6A
.L08022B66:
    movs r0, #6
    b .L08022B6C
.L08022B6A:
    movs r0, #7
.L08022B6C:
    pop {r1}
    bx r1
.L08022B70:
    .byte 0xF0, 0xB5, 0x84, 0xB0, 0x07, 0x1C, 0x78, 0x6B, 0x79, 0xF0, 0x98, 0xF8, 0x05, 0x1C, 0x8C, 0x20
    .byte 0xDD, 0xF7, 0x28, 0xFD, 0x06, 0x1C, 0x28, 0x1C, 0xFF, 0xF7, 0xE6, 0xFF, 0x04, 0x1C, 0x28, 0x1C
    .byte 0xFF, 0xF7, 0xE4, 0xFF, 0x00, 0x94, 0x01, 0x90, 0x00, 0x25, 0x02, 0x95, 0x03, 0xA8, 0x05, 0x70
    .byte 0x30, 0x1C, 0x39, 0x1C, 0x02, 0x22, 0x09, 0x23, 0x0F, 0xF0, 0x88, 0xFC, 0x04, 0x1C, 0x78, 0x6B
    .byte 0x79, 0xF0, 0x7C, 0xF8, 0x00, 0x21, 0x00, 0x28, 0x00, 0xD0, 0x03, 0x21, 0x38, 0x1C, 0x38, 0x30
    .byte 0x00, 0x78, 0x88, 0x42, 0x23, 0xD1, 0x38, 0x68, 0x01, 0x68, 0xA2, 0x22, 0x52, 0x00, 0x89, 0x18
    .byte 0x09, 0x68, 0xB0, 0xF0, 0x9D, 0xFE, 0x80, 0x7A, 0xC0, 0x06, 0xC0, 0x0E, 0x06, 0x38, 0x0E, 0x28
    .byte 0x15, 0xD9, 0x20, 0x1C, 0x70, 0x30, 0x08, 0x21, 0x3B, 0xF0, 0x3A, 0xFE, 0x20, 0x1C, 0x84, 0x30
    .byte 0x01, 0x21, 0x01, 0x70, 0x02, 0x30, 0x05, 0x70, 0x01, 0x30, 0x01, 0x70, 0x23, 0x1C, 0x8A, 0x33
    .byte 0x02, 0x22, 0x19, 0x78, 0x04, 0x20, 0x40, 0x42, 0x08, 0x40, 0x10, 0x43, 0x18, 0x70, 0x20, 0x1C
    .byte 0x04, 0xB0, 0xF0, 0xBC, 0x02, 0xBC, 0x08, 0x47

    thumb_func_start func_08022C18
func_08022C18: @ 0x08022C18
    push {r4, r5, r6, lr}
    sub sp, #8
    adds r4, r0, #0
    adds r5, r1, #0
    adds r6, r2, #0
    mov r0, sp
    adds r1, r6, #0
    bl __5ActorRC5Actor
    movs r3, #0xac
    lsls r3, r3, #2
    adds r0, r4, #0
    adds r1, r5, #0
    mov r2, sp
    bl func_08020038
    ldr r0, .L08022C5C @ =vtable_unk_080E6310
    str r0, [r4, #0x14]
    str r6, [r4, #0x34]
    adds r0, r4, #0
    bl func_08023378
    adds r1, r0, #0
    adds r0, r4, #0
    adds r0, #0x20
    ldrb r2, [r0]
    adds r0, r4, #0
    bl func_08023308
    adds r0, r4, #0
    add sp, #8
    pop {r4, r5, r6}
    pop {r1}
    bx r1
    .align 2, 0
.L08022C5C: .4byte vtable_unk_080E6310
.L08022C60:
    .byte 0x70, 0xB5, 0x82, 0xB0, 0x05, 0x1C, 0x0E, 0x1C, 0x10, 0x48, 0x68, 0x61, 0x6C, 0x6B, 0x68, 0x46
    .byte 0x29, 0x1C, 0x0F, 0xF0, 0x7D, 0xFA, 0x20, 0x1C, 0x69, 0x46, 0x78, 0xF0, 0x53, 0xFA, 0x0C, 0x48
    .byte 0x68, 0x61, 0x29, 0x69, 0x00, 0x29, 0x05, 0xD0, 0x48, 0x68, 0x82, 0x68, 0x08, 0x1C, 0x03, 0x21
    .byte 0xB0, 0xF0, 0x40, 0xFE, 0x01, 0x20, 0x30, 0x40, 0x00, 0x28, 0x02, 0xD0, 0x28, 0x1C, 0xDD, 0xF7
    .byte 0xB3, 0xFC, 0x02, 0xB0, 0x70, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0x10, 0x63, 0x0E, 0x08
    .byte 0x50, 0x62, 0x0E, 0x08, 0x10, 0xB5, 0x81, 0xB0, 0x04, 0x1C, 0x09, 0x04, 0x09, 0x0C, 0x0C, 0x4A
    .byte 0x00, 0x98, 0x10, 0x40, 0x08, 0x43, 0x0B, 0x49, 0x08, 0x40, 0x00, 0x90, 0x60, 0x6B, 0x69, 0x46
    .byte 0x78, 0xF0, 0x36, 0xFE, 0x20, 0x1C, 0x00, 0xF0, 0x4F, 0xFB, 0x01, 0x1C, 0x20, 0x1C, 0x20, 0x30
    .byte 0x02, 0x78, 0x20, 0x1C, 0x00, 0xF0, 0x10, 0xFB, 0x01, 0xB0, 0x10, 0xBC, 0x01, 0xBC, 0x00, 0x47
    .byte 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xF0, 0xB5, 0x57, 0x46, 0x4E, 0x46, 0x45, 0x46
    .byte 0xE0, 0xB4, 0xA8, 0xB0, 0x80, 0x46, 0x07, 0x68, 0x40, 0x6B, 0x81, 0x46, 0x42, 0x46, 0x92, 0x88
    .byte 0x24, 0x92, 0x02, 0x2A, 0x62, 0xD1, 0x08, 0x79, 0x00, 0x28, 0x5F, 0xD0, 0x48, 0x46, 0x78, 0xF0
    .byte 0xFD, 0xFB, 0x05, 0x1C, 0x48, 0x46, 0x01, 0x21, 0x78, 0xF0, 0x28, 0xFC, 0x48, 0x46, 0x78, 0xF0
    .byte 0xF5, 0xFB, 0x04, 0x1C, 0xB3, 0x2D, 0x15, 0xD8, 0xB3, 0x2C, 0x13, 0xD9, 0x38, 0x68, 0xA2, 0x23
    .byte 0x5B, 0x00, 0xC0, 0x18, 0x01, 0x68, 0x38, 0x1C, 0xB0, 0xF0, 0xE2, 0xFD, 0x00, 0x68, 0x00, 0x28
    .byte 0x08, 0xD0, 0x48, 0x46, 0x78, 0xF0, 0xD6, 0xFB, 0x00, 0x06, 0x00, 0x28, 0x02, 0xD1, 0x48, 0x46
    .byte 0x78, 0xF0, 0x6A, 0xFC, 0xEF, 0x2D, 0x17, 0xD8, 0xEF, 0x2C, 0x15, 0xD9, 0x38, 0x68, 0x84, 0x26
    .byte 0x76, 0x00, 0x80, 0x19, 0x41, 0x46, 0x0A, 0x23, 0xCA, 0x5E, 0x0E, 0x26, 0x8B, 0x5F, 0x12, 0xA9
    .byte 0x0A, 0x80, 0x4B, 0x80, 0x02, 0x68, 0x38, 0x1C, 0xB0, 0xF0, 0xC4, 0xFD, 0x00, 0x06, 0x00, 0x28
    .byte 0x02, 0xD0, 0x48, 0x46, 0x78, 0xF0, 0xAC, 0xFD, 0x43, 0x48, 0x85, 0x42, 0x1E, 0xD8, 0x84, 0x42
    .byte 0x1C, 0xD9, 0x38, 0x68, 0xA2, 0x21, 0x49, 0x00, 0x40, 0x18, 0x01, 0x68, 0x38, 0x1C, 0xB0, 0xF0
    .byte 0xAF, 0xFD, 0x00, 0x68, 0x00, 0x28, 0x11, 0xD1, 0x48, 0x46, 0x78, 0xF0, 0xA3, 0xFB, 0x00, 0x06
    .byte 0x00, 0x28, 0x07, 0xD0, 0x64, 0x20, 0x88, 0xF0, 0xDF, 0xFC, 0x1D, 0x28, 0x02, 0xD8, 0x48, 0x46
    .byte 0x78, 0xF0, 0x38, 0xFC, 0x48, 0x46, 0x01, 0x21, 0x78, 0xF0, 0x66, 0xFA, 0x39, 0x68, 0x02, 0xA8
    .byte 0x4B, 0x6B, 0x39, 0x1C, 0x24, 0x9A, 0xB0, 0xF0, 0x97, 0xFD, 0x42, 0x46, 0x51, 0x69, 0x13, 0xA8
    .byte 0xCA, 0x68, 0x41, 0x46, 0xB0, 0xF0, 0x8E, 0xFD, 0x13, 0x98, 0x14, 0x99, 0x26, 0x90, 0x27, 0x91
    .byte 0x05, 0xAC, 0x10, 0x21, 0x8A, 0x46, 0x00, 0x25, 0x11, 0x21, 0x05, 0x91, 0x11, 0x20, 0x40, 0x42
    .byte 0x60, 0x60, 0xA0, 0x60, 0xE1, 0x60, 0x0A, 0xA9, 0x02, 0xA8, 0x4C, 0xC8, 0x4C, 0xC1, 0x26, 0x98
    .byte 0x27, 0x99, 0x0D, 0x90, 0x0E, 0x91, 0x51, 0x46, 0xA1, 0x62, 0xE5, 0x62, 0x25, 0x63, 0x38, 0x68
    .byte 0x02, 0x6C, 0x38, 0x1C, 0x00, 0x21, 0xB0, 0xF0, 0x6D, 0xFD, 0x06, 0x1C, 0x38, 0x68, 0x02, 0x6C
    .byte 0x38, 0x1C, 0x4A, 0x21, 0xB0, 0xF0, 0x66, 0xFD, 0x05, 0x1C, 0x00, 0x2E, 0x0F, 0xD0, 0xB0, 0x88
    .byte 0x24, 0x9A, 0x90, 0x42, 0x0B, 0xD1, 0x71, 0x69, 0x15, 0xAC, 0x20, 0x1C, 0xCA, 0x68, 0x31, 0x1C
    .byte 0xB0, 0xF0, 0x58, 0xFD, 0x05, 0xA8, 0x21, 0x1C, 0x00, 0x22, 0x88, 0xF0, 0x11, 0xFE, 0x00, 0x2D
    .byte 0x0F, 0xD0, 0xA8, 0x88, 0x24, 0x9B, 0x98, 0x42, 0x0B, 0xD1, 0x69, 0x69, 0x17, 0xAC, 0x20, 0x1C
    .byte 0xCA, 0x68, 0x29, 0x1C, 0xB0, 0xF0, 0x46, 0xFD, 0x05, 0xA8, 0x21, 0x1C, 0x00, 0x22, 0x88, 0xF0
    .byte 0xFF, 0xFD, 0x49, 0x46, 0x88, 0x6A, 0x01, 0x28, 0x00, 0xD1, 0xB7, 0xE0, 0x01, 0x28, 0x05, 0xDC
    .byte 0x00, 0x28, 0x0A, 0xD0, 0x08, 0xE2, 0x00, 0x00, 0x2B, 0x01, 0x00, 0x00, 0x02, 0x28, 0x00, 0xD1
    .byte 0x16, 0xE1, 0x03, 0x28, 0x00, 0xD1, 0x85, 0xE1, 0xFE, 0xE1, 0x2C, 0x22, 0x4A, 0x44, 0x92, 0x46
    .byte 0x4B, 0x46, 0x9C, 0x8D, 0x00, 0x2C, 0x42, 0xD0, 0x46, 0x46, 0xB5, 0x69, 0xF6, 0x69, 0x00, 0x27
    .byte 0x00, 0x2D, 0x0B, 0xDA, 0x07, 0x99, 0x0F, 0x98, 0xC1, 0x42, 0x03, 0xDA, 0x05, 0xA8, 0x88, 0xF0
    .byte 0x33, 0xFD, 0x07, 0x99, 0x10, 0x20, 0x40, 0x42, 0x81, 0x42, 0x29, 0xDC, 0x00, 0x2D, 0x0B, 0xDD
    .byte 0x08, 0x99, 0x0F, 0x98, 0x81, 0x42, 0x04, 0xDD, 0x05, 0xA8, 0x88, 0xF0, 0x63, 0xFD, 0x08, 0x98
    .byte 0x00, 0xE0, 0x08, 0x1C, 0x0F, 0x28, 0x1B, 0xDD, 0x00, 0x2E, 0x0B, 0xDA, 0x06, 0x99, 0x0F, 0x98
    .byte 0xC1, 0x42, 0x03, 0xDA, 0x05, 0xA8, 0x88, 0xF0, 0xDB, 0xFC, 0x06, 0x99, 0x10, 0x20, 0x40, 0x42
    .byte 0x81, 0x42, 0x0D, 0xDC, 0x00, 0x2E, 0x0C, 0xDD, 0x05, 0x99, 0x0F, 0x98, 0x81, 0x42, 0x04, 0xDD
    .byte 0x05, 0xA8, 0x88, 0xF0, 0x93, 0xFC, 0x05, 0x98, 0x00, 0xE0, 0x08, 0x1C, 0x0F, 0x28, 0x00, 0xDC
    .byte 0x01, 0x27, 0x00, 0x2F, 0x01, 0xD0, 0x00, 0x24, 0x5D, 0xE0, 0x01, 0x3C, 0x5B, 0xE0, 0x40, 0x46
    .byte 0xFD, 0xF7, 0xEE, 0xF8, 0x00, 0x06, 0x00, 0x28, 0x55, 0xD0, 0x38, 0x68, 0xA2, 0x21, 0x49, 0x00
    .byte 0x40, 0x18, 0x01, 0x68, 0x38, 0x1C, 0xB0, 0xF0, 0xD3, 0xFC, 0x80, 0x7A, 0xC0, 0x06, 0xC0, 0x0E
    .byte 0x00, 0x21, 0x06, 0x38, 0x0E, 0x28, 0x00, 0xD9, 0x01, 0x21, 0xC8, 0x00, 0x40, 0x1A, 0x40, 0x01
    .byte 0x09, 0x49, 0x45, 0x18, 0x48, 0x46, 0x78, 0xF0, 0xC1, 0xFA, 0x00, 0x06, 0x00, 0x0E, 0xC1, 0x00
    .byte 0x09, 0x1A, 0x8C, 0x00, 0x48, 0x46, 0x78, 0xF0, 0x8B, 0xFC, 0x00, 0x06, 0x00, 0x28, 0x05, 0xD0
    .byte 0x20, 0x1C, 0xA8, 0x30, 0x2D, 0x18, 0x09, 0xE0, 0x7C, 0x0A, 0x0F, 0x08, 0x48, 0x46, 0x78, 0xF0
    .byte 0xEF, 0xFE, 0xC1, 0x00, 0x09, 0x1A, 0xC9, 0x00, 0x69, 0x18, 0x0D, 0x19, 0x28, 0x1C, 0x07, 0x21
    .byte 0x88, 0xF0, 0x34, 0xFC, 0x06, 0x1C, 0xB4, 0x00, 0x2C, 0x19, 0x3C, 0x25, 0xA0, 0x78, 0x68, 0x43
    .byte 0x88, 0xF0, 0xDA, 0xFB, 0x61, 0x78, 0x69, 0x43, 0x0C, 0x18, 0x40, 0x46, 0x20, 0x30, 0x05, 0x78
    .byte 0x04, 0x20, 0x88, 0xF0, 0xD1, 0xFB, 0x01, 0x1C, 0x00, 0x29, 0x05, 0xD0, 0x03, 0x29, 0x03, 0xD0
    .byte 0x28, 0x1C, 0x88, 0xF0, 0xD7, 0xFB, 0x05, 0x1C, 0x40, 0x46, 0x31, 0x1C, 0x2A, 0x1C, 0x00, 0xF0
    .byte 0x83, 0xF9, 0x52, 0x46, 0x96, 0x70, 0x53, 0x46, 0x1C, 0x80, 0x55, 0xE1, 0x48, 0x46, 0x2C, 0x30
    .byte 0x25, 0x90, 0x49, 0x46, 0x89, 0x8D, 0x8A, 0x46, 0x00, 0x29, 0x02, 0xD0, 0x01, 0x22, 0x52, 0x42
    .byte 0x92, 0x44, 0x4B, 0x46, 0xD9, 0x6A, 0x48, 0x02, 0x45, 0x0E, 0x00, 0x2D, 0x00, 0xD0, 0x01, 0x3D
    .byte 0x25, 0x98, 0xC4, 0x78, 0x00, 0x2C, 0x00, 0xD0, 0x01, 0x3C, 0x52, 0x46, 0x00, 0x2A, 0x40, 0xD0
    .byte 0x08, 0x02, 0x00, 0x28, 0x07, 0xDA, 0x38, 0x68, 0x02, 0x6C, 0x38, 0x1C, 0x2D, 0x21, 0xB0, 0xF0
    .byte 0x61, 0xFC, 0x01, 0x1C, 0x00, 0xE0, 0x31, 0x1C, 0x00, 0x29, 0x32, 0xD0, 0x88, 0x88, 0x24, 0x9B
    .byte 0x98, 0x42, 0x2E, 0xD1, 0x00, 0x2C, 0x1F, 0xD1, 0x47, 0x46, 0x0A, 0x20, 0x3E, 0x5E, 0x0E, 0x22
    .byte 0xBC, 0x5E, 0x0A, 0x23, 0xCA, 0x5E, 0x0E, 0x27, 0xCB, 0x5F, 0x01, 0x27, 0x00, 0x2D, 0x00, 0xD0
    .byte 0x06, 0x27, 0x40, 0x46, 0x20, 0x30, 0x00, 0x78, 0x05, 0xA9, 0x00, 0x91, 0x01, 0x90, 0x30, 0x1C
    .byte 0x21, 0x1C, 0x88, 0xF0, 0xE1, 0xFE, 0x02, 0x1C, 0x40, 0x46, 0x39, 0x1C, 0x00, 0xF0, 0x34, 0xF9
    .byte 0x1E, 0x20, 0x88, 0xF0, 0x71, 0xFB, 0x44, 0x1C, 0x53, 0x46, 0x25, 0x9A, 0x13, 0x80, 0x7F, 0x20
    .byte 0x05, 0x40, 0x91, 0x78, 0x80, 0x20, 0x40, 0x42, 0x08, 0x40, 0x28, 0x43, 0x90, 0x70, 0xD4, 0x70
    .byte 0xFA, 0xE0, 0x05, 0x49, 0x19, 0x98, 0x08, 0x40, 0xB4, 0x21, 0x08, 0x43, 0x03, 0x49, 0x08, 0x40
    .byte 0x19, 0x90, 0x19, 0xA9, 0x63, 0xE0, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0xFF
    .byte 0x4C, 0x46, 0x2C, 0x34, 0x4F, 0x46, 0xBD, 0x8D, 0x00, 0x2D, 0x00, 0xD0, 0x01, 0x3D, 0x62, 0x88
    .byte 0x00, 0x2A, 0x00, 0xD0, 0x01, 0x3A, 0x00, 0x2D, 0x48, 0xD0, 0x00, 0x2E, 0x46, 0xD0, 0xB0, 0x88
    .byte 0x24, 0x99, 0x88, 0x42, 0x42, 0xD1, 0x47, 0x46, 0x0A, 0x20, 0x3B, 0x5E, 0x0E, 0x20, 0x39, 0x5E
    .byte 0x0A, 0x20, 0x37, 0x5E, 0xBA, 0x46, 0x0E, 0x27, 0xF6, 0x5F, 0x57, 0x46, 0xF8, 0x1A, 0x00, 0x28
    .byte 0x00, 0xDA, 0x40, 0x42, 0x0F, 0x28, 0x05, 0xDC, 0x70, 0x1A, 0x00, 0x28, 0x00, 0xDA, 0x40, 0x42
    .byte 0x0F, 0x28, 0x2B, 0xDD, 0x00, 0x2A, 0x0F, 0xD0, 0x04, 0x27, 0xE0, 0x5F, 0xC0, 0x1A, 0x00, 0x28
    .byte 0x00, 0xDA, 0x40, 0x42, 0x0F, 0x28, 0x1E, 0xDC, 0x06, 0x27, 0xE0, 0x5F, 0x40, 0x1A, 0x00, 0x28
    .byte 0x00, 0xDA, 0x40, 0x42, 0x0F, 0x28, 0x16, 0xDC, 0x40, 0x46, 0x20, 0x30, 0x00, 0x78, 0x05, 0xAA
    .byte 0x00, 0x92, 0x01, 0x90, 0x18, 0x1C, 0x52, 0x46, 0x33, 0x1C, 0x88, 0xF0, 0x69, 0xFD, 0x02, 0x1C
    .byte 0x40, 0x46, 0x01, 0x21, 0x00, 0xF0, 0xC8, 0xF8, 0x1E, 0x20, 0x88, 0xF0, 0x05, 0xFB, 0x42, 0x1C
    .byte 0x53, 0x46, 0xA3, 0x80, 0xE6, 0x80, 0x25, 0x80, 0x62, 0x80, 0x95, 0xE0, 0x0B, 0x49, 0x1A, 0x98
    .byte 0x08, 0x40, 0xB4, 0x21, 0x08, 0x43, 0x0A, 0x49, 0x08, 0x40, 0x1A, 0x90, 0x1A, 0xA9, 0x48, 0x46
    .byte 0x78, 0xF0, 0xCE, 0xFB, 0x40, 0x46, 0x00, 0xF0, 0xE7, 0xF8, 0x01, 0x1C, 0x40, 0x46, 0x20, 0x30
    .byte 0x02, 0x78, 0x40, 0x46, 0x00, 0xF0, 0xA8, 0xF8, 0x7E, 0xE0, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF
    .byte 0xFF, 0xFF, 0x00, 0xFF, 0x4E, 0x46, 0x2C, 0x36, 0x40, 0x46, 0x20, 0x30, 0x01, 0x78, 0x47, 0x46
    .byte 0x0A, 0x22, 0xBC, 0x5E, 0x0E, 0x23, 0xFD, 0x5E, 0x07, 0x1C, 0x24, 0x98, 0x25, 0x28, 0x21, 0xD1
    .byte 0x00, 0x29, 0x1F, 0xD1, 0x1B, 0xA8, 0xE9, 0xF7, 0x37, 0xFE, 0x1B, 0x98, 0x1C, 0x90, 0x1C, 0xA8
    .byte 0x02, 0x22, 0x81, 0x5E, 0x28, 0x1C, 0x08, 0x38, 0x08, 0x1A, 0x00, 0x28, 0x00, 0xDA, 0x40, 0x42
    .byte 0x07, 0x28, 0x3F, 0xDC, 0x1D, 0xA8, 0xE6, 0xF7, 0x69, 0xFC, 0x1D, 0x98, 0x1E, 0x90, 0x1E, 0xA8
    .byte 0x00, 0x23, 0xC2, 0x5E, 0x02, 0x21, 0x43, 0x5E, 0x10, 0x33, 0x40, 0x46, 0x02, 0x21, 0xFC, 0xF7
    .byte 0x2B, 0xFE, 0x2F, 0xE0, 0x24, 0x9A, 0x02, 0x2A, 0x2C, 0xD1, 0x01, 0x29, 0x2A, 0xD1, 0x1F, 0xA8
    .byte 0xE6, 0xF7, 0x54, 0xFC, 0x1F, 0x98, 0x20, 0x90, 0x20, 0xA8, 0x01, 0x1C, 0x00, 0x23, 0xC8, 0x5E
    .byte 0x00, 0x1B, 0x00, 0x28, 0x00, 0xDA, 0x40, 0x42, 0x0F, 0x28, 0x1B, 0xDC, 0x02, 0x20, 0x09, 0x5E
    .byte 0x28, 0x1C, 0x08, 0x30, 0x08, 0x1A, 0x00, 0x28, 0x00, 0xDA, 0x40, 0x42, 0x07, 0x28, 0x11, 0xDC
    .byte 0x21, 0xA8, 0xE9, 0xF7, 0xF9, 0xFD, 0x21, 0x99, 0x22, 0xA8, 0x01, 0x60, 0x00, 0x21, 0x42, 0x5E
    .byte 0x02, 0x21, 0x43, 0x5E, 0x20, 0x3B, 0x40, 0x46, 0x25, 0x21, 0xFC, 0xF7, 0xFD, 0xFD, 0x48, 0x46
    .byte 0x78, 0xF0, 0xC2, 0xF9, 0x30, 0x88, 0x00, 0x28, 0x02, 0xD0, 0x01, 0x38, 0x30, 0x80, 0x13, 0xE0
    .byte 0x11, 0x4A, 0x23, 0xA9, 0x08, 0x68, 0x10, 0x40, 0xB4, 0x22, 0x10, 0x43, 0x0F, 0x4A, 0x10, 0x40
    .byte 0x08, 0x60, 0x48, 0x46, 0x78, 0xF0, 0x4C, 0xFB, 0x40, 0x46, 0x00, 0xF0, 0x65, 0xF8, 0x01, 0x1C
    .byte 0x3A, 0x78, 0x40, 0x46, 0x00, 0xF0, 0x28, 0xF8, 0x40, 0x46, 0x05, 0xA9, 0xFC, 0xF7, 0x58, 0xFF
    .byte 0x41, 0x46, 0x30, 0x31, 0x00, 0x20, 0x08, 0x70, 0x42, 0x46, 0x90, 0x8C, 0x00, 0x28, 0x07, 0xD0
    .byte 0x01, 0x38, 0x90, 0x84, 0x07, 0xE0, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0xFF
    .byte 0x43, 0x46, 0xD8, 0x8C, 0x98, 0x84, 0x46, 0x46, 0x32, 0x69, 0x00, 0x2A, 0x04, 0xD0, 0x50, 0x68
    .byte 0xC1, 0x68, 0x10, 0x1C, 0xB0, 0xF0, 0x0C, 0xFB, 0x28, 0xB0, 0x38, 0xBC, 0x98, 0x46, 0xA1, 0x46
    .byte 0xAA, 0x46, 0xF0, 0xBC, 0x01, 0xBC, 0x00, 0x47

    thumb_func_start func_08023308
func_08023308: @ 0x08023308
    push {r4, r5, r6, lr}
    adds r4, r0, #0
    adds r5, r1, #0
    adds r6, r2, #0
    bl func_080233B4
    adds r1, r0, #0
    ldrh r0, [r4, #0x22]
    cmp r0, r1
    beq .L08023322
    adds r0, r4, #0
    bl SetAnim__12AActorEntityUi
.L08023322:
    adds r0, r4, #0
    adds r0, #0x20
    ldrb r0, [r0]
    cmp r0, r6
    beq .L08023334
    adds r0, r4, #0
    adds r1, r6, #0
    bl SetAnimFacing__12AActorEntityUi
.L08023334:
    adds r0, r4, #0
    adds r1, r5, #0
    bl func_08023400
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_08020080
    adds r0, r4, #0
    adds r0, #0x38
    adds r6, r0, #0
    ldrb r0, [r6]
    cmp r5, r0
    beq .L0802336E
    movs r1, #1
    rsbs r1, r1, #0
    cmp r5, #4
    bne .L0802335A
    movs r1, #8
.L0802335A:
    cmp r1, #0
    blt .L08023368
    adds r0, r4, #0
    movs r2, #1
    bl func_08032384
    b .L0802336E
.L08023368:
    adds r0, r4, #0
    bl func_080323C8
.L0802336E:
    strb r5, [r6]
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_08023378
func_08023378: @ 0x08023378
    push {lr}
    ldr r0, [r0, #0x34]
    ldr r1, [r0, #0x28]
    cmp r1, #1
    beq .L0802339A
    cmp r1, #1
    bgt .L0802338C
    cmp r1, #0
    beq .L08023394
    b .L08023390
.L0802338C:
    cmp r1, #3
    ble .L080233AE
.L08023390:
    movs r0, #0
    b .L080233B0
.L08023394:
    adds r0, #0x2e
    ldrb r0, [r0]
    b .L080233B0
.L0802339A:
    adds r0, #0x2e
    ldrb r1, [r0]
    movs r0, #0x7f
    ands r0, r1
    movs r1, #1
    cmp r0, #0
    beq .L080233AA
    movs r1, #6
.L080233AA:
    adds r0, r1, #0
    b .L080233B0
.L080233AE:
    movs r0, #1
.L080233B0:
    pop {r1}
    bx r1

    thumb_func_start func_080233B4
func_080233B4: @ 0x080233B4
    push {r4, r5, r6, r7, lr}
    adds r4, r0, #0
    adds r5, r1, #0
    movs r6, #0
    ldr r0, [r4, #0x34]
    bl IsPregnant__C10BarnAnimal
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L080233D4
    ldr r0, [r4, #0x34]
    bl GetDaysPregnant__C10BarnAnimal
    rsbs r1, r0, #0
    orrs r1, r0
    lsrs r6, r1, #0x1f
.L080233D4:
    ldr r7, .L080233E4 @ =gUnk_080F0C3C
    lsls r5, r5, #1
    cmp r6, #0
    beq .L080233E8
    adds r0, r5, #0
    adds r0, #0x2a
    b .L080233F6
    .align 2, 0
.L080233E4: .4byte gUnk_080F0C3C
.L080233E8:
    ldr r0, [r4, #0x34]
    bl GetGrowthStage__C3Cow
    lsls r1, r0, #3
    subs r1, r1, r0
    lsls r1, r1, #1
    adds r0, r5, r1
.L080233F6:
    adds r0, r7, r0
    ldrh r0, [r0]
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1

    thumb_func_start func_08023400
func_08023400: @ 0x08023400
    push {lr}
    cmp r1, #1
    beq .L0802340A
    movs r0, #0
    b .L0802340E
.L0802340A:
    movs r0, #0x80
    lsls r0, r0, #8
.L0802340E:
    pop {r1}
    bx r1
    .align 2, 0
.L08023414:
    .byte 0xF0, 0xB5, 0x47, 0x46, 0x80, 0xB4, 0x82, 0xB0, 0x06, 0x1C, 0x0F, 0x1C
    .byte 0x38, 0x88, 0x80, 0x05, 0x80, 0x0D, 0xB1, 0x88, 0x88, 0x42, 0x5F, 0xD1, 0x70, 0x6B, 0x78, 0xF0
    .byte 0x3F, 0xFA, 0x00, 0x06, 0x00, 0x28, 0x59, 0xD1, 0x70, 0x6B, 0x77, 0xF0, 0xF5, 0xFE, 0x80, 0x46
    .byte 0xFC, 0xF7, 0xEA, 0xFD, 0x0A, 0x21, 0x73, 0x5E, 0x79, 0x78, 0x89, 0x08, 0x7A, 0x88, 0x13, 0x4C
    .byte 0x22, 0x40, 0x92, 0x01, 0x0A, 0x43, 0x12, 0x04, 0x12, 0x14, 0xD2, 0x1A, 0x0E, 0x23, 0xF5, 0x5E
    .byte 0xFB, 0x78, 0x9B, 0x08, 0xB9, 0x88, 0x21, 0x40, 0x89, 0x01, 0x19, 0x43, 0x09, 0x04, 0x09, 0x14
    .byte 0x49, 0x1B, 0x13, 0x1C, 0x53, 0x43, 0x1A, 0x1C, 0x0B, 0x1C, 0x4B, 0x43, 0x19, 0x1C, 0x52, 0x18
    .byte 0x01, 0x1C, 0x41, 0x43, 0x08, 0x1C, 0x82, 0x42, 0x30, 0xDC, 0x70, 0x6B, 0x78, 0xF0, 0x3E, 0xF8
    .byte 0x00, 0x06, 0x00, 0x28, 0x04, 0xD0, 0x1E, 0x24, 0x0A, 0xE0, 0x00, 0x00, 0xFF, 0x03, 0x00, 0x00
    .byte 0x70, 0x6B, 0x78, 0xF0, 0x2F, 0xF8, 0x00, 0x06, 0x64, 0x24, 0x00, 0x28, 0x00, 0xD0, 0x46, 0x24
    .byte 0x64, 0x20, 0x88, 0xF0, 0x69, 0xF9, 0xA0, 0x42, 0x18, 0xD2, 0x43, 0x46, 0x18, 0x01, 0xC0, 0x1A
    .byte 0x80, 0x01, 0x00, 0x0A, 0xF0, 0x21, 0x49, 0x00, 0x40, 0x18, 0x00, 0x04, 0x00, 0x0C, 0x00, 0x90
    .byte 0x70, 0x6B, 0x69, 0x46, 0x78, 0xF0, 0x40, 0xFA, 0x30, 0x1C, 0xFF, 0xF7, 0x4D, 0xFF, 0x01, 0x1C
    .byte 0x30, 0x1C, 0x20, 0x30, 0x02, 0x78, 0x30, 0x1C, 0xFF, 0xF7, 0x0E, 0xFF, 0x02, 0xB0, 0x08, 0xBC
    .byte 0x98, 0x46, 0xF0, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x10, 0xB5, 0x81, 0xB0, 0x04, 0x1C, 0x62, 0x6B
    .byte 0x90, 0x6A, 0x03, 0x28, 0x15, 0xD1, 0x0D, 0x49, 0x00, 0x98, 0x08, 0x40, 0xB4, 0x21, 0x08, 0x43
    .byte 0x0B, 0x49, 0x08, 0x40, 0x00, 0x90, 0x10, 0x1C, 0x69, 0x46, 0x78, 0xF0, 0x11, 0xFA, 0x20, 0x1C
    .byte 0xFF, 0xF7, 0x2A, 0xFF, 0x01, 0x1C, 0x20, 0x1C, 0x20, 0x30, 0x02, 0x78, 0x20, 0x1C, 0xFF, 0xF7
    .byte 0xEB, 0xFE, 0x01, 0xB0, 0x10, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF
    .byte 0xFF, 0xFF, 0x00, 0xFF, 0x01, 0x20, 0x70, 0x47, 0x30, 0xB5, 0x04, 0x1C, 0x00, 0x25, 0x60, 0x6B
    .byte 0x78, 0xF0, 0xAE, 0xF9, 0x00, 0x06, 0x00, 0x28, 0x06, 0xD1, 0x60, 0x6B, 0x78, 0xF0, 0x54, 0xFC
    .byte 0x00, 0x06, 0x00, 0x0E, 0x40, 0x42, 0xC5, 0x0F, 0x28, 0x1C, 0x30, 0xBC, 0x02, 0xBC, 0x08, 0x47
    .byte 0x00, 0xB5, 0x40, 0x6B, 0x77, 0xF0, 0x5C, 0xFE, 0x01, 0x21, 0x48, 0x40, 0x02, 0xBC, 0x08, 0x47
    .byte 0x00, 0xB5, 0x40, 0x6B, 0x78, 0xF0, 0x1C, 0xFC, 0x02, 0xBC, 0x08, 0x47, 0x00, 0xB5, 0x40, 0x6B
    .byte 0x77, 0xF0, 0xBC, 0xFF, 0x02, 0xBC, 0x08, 0x47, 0x30, 0xB5, 0x04, 0x1C, 0x00, 0x25, 0xA0, 0x88
    .byte 0x02, 0x28, 0x0C, 0xD1, 0x60, 0x6B, 0x77, 0xF0, 0xB1, 0xFF, 0x00, 0x06, 0x00, 0x28, 0x06, 0xD1
    .byte 0x60, 0x6B, 0x77, 0xF0, 0xA7, 0xFF, 0x00, 0x06, 0x00, 0x28, 0x00, 0xD1, 0x01, 0x25, 0x28, 0x1C
    .byte 0x30, 0xBC, 0x02, 0xBC, 0x08, 0x47, 0x00, 0x00, 0x10, 0xB5, 0x81, 0xB0, 0x04, 0x1C, 0x60, 0x6B
    .byte 0x78, 0xF0, 0x6E, 0xF9, 0x00, 0x06, 0x00, 0x28, 0x21, 0xD1, 0x78, 0x20, 0x88, 0xF0, 0xD4, 0xF8
    .byte 0xF0, 0x30, 0x00, 0x04, 0x00, 0x0C, 0x18, 0x4A, 0x00, 0x99, 0x11, 0x40, 0x01, 0x43, 0x17, 0x48
    .byte 0x01, 0x40, 0xF0, 0x20, 0x80, 0x03, 0x01, 0x43, 0x15, 0x48, 0x01, 0x40, 0x15, 0x48, 0x01, 0x40
    .byte 0x00, 0x91, 0x60, 0x6B, 0x69, 0x46, 0x78, 0xF0, 0xA1, 0xF9, 0x20, 0x1C, 0xFF, 0xF7, 0xB4, 0xFE
    .byte 0x01, 0x1C, 0x20, 0x1C, 0x20, 0x30, 0x02, 0x78, 0x20, 0x1C, 0xFF, 0xF7, 0x75, 0xFE, 0x60, 0x6B
    .byte 0x0A, 0x21, 0x77, 0xF0, 0x5B, 0xFE, 0x60, 0x6B, 0x78, 0xF0, 0x06, 0xF8, 0x20, 0x1C, 0x00, 0x21
    .byte 0x00, 0x22, 0x0E, 0xF0, 0xA7, 0xFE, 0x20, 0x1C, 0xA2, 0x21, 0xFC, 0xF7, 0x43, 0xFD, 0x01, 0xB0
    .byte 0x10, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x80, 0xFF
    .byte 0xFF, 0xFF, 0x7F, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0xB5, 0x40, 0x6B, 0x78, 0xF0, 0x4E, 0xF9
    .byte 0x01, 0xBC, 0x00, 0x47, 0x10, 0xB5, 0x04, 0x1C, 0x60, 0x6B, 0x77, 0xF0, 0xE1, 0xFD, 0x00, 0x06
    .byte 0x00, 0x28, 0x06, 0xD1, 0x60, 0x6B, 0x01, 0x21, 0x77, 0xF0, 0x16, 0xFE, 0x60, 0x6B, 0x77, 0xF0
    .byte 0xFB, 0xFD, 0x60, 0x6B, 0x77, 0xF0, 0x3E, 0xFF, 0x00, 0x06, 0x00, 0x28, 0x07, 0xD0, 0x64, 0x20
    .byte 0x88, 0xF0, 0x7A, 0xF8, 0x1D, 0x28, 0x02, 0xD8, 0x60, 0x6B, 0x77, 0xF0, 0xD3, 0xFF, 0x60, 0x6B
    .byte 0x77, 0xF0, 0x34, 0xFF, 0x00, 0x06, 0x00, 0x28, 0x08, 0xD1, 0x20, 0x1C, 0x01, 0x21, 0x00, 0x22
    .byte 0x0E, 0xF0, 0x68, 0xFE, 0x20, 0x1C, 0xA1, 0x21, 0xFC, 0xF7, 0x04, 0xFD, 0x10, 0xBC, 0x01, 0xBC
    .byte 0x00, 0x47, 0x00, 0x00, 0x10, 0xB5, 0x04, 0x1C, 0x01, 0x21, 0x00, 0x22, 0x0E, 0xF0, 0x5A, 0xFE
    .byte 0x20, 0x1C, 0xA1, 0x21, 0xFC, 0xF7, 0xF6, 0xFC, 0x60, 0x6B, 0x78, 0xF0, 0xB3, 0xFB, 0x10, 0xBC
    .byte 0x02, 0xBC, 0x08, 0x47, 0x10, 0xB5, 0x04, 0x1C, 0x60, 0x6B, 0x77, 0xF0, 0x9B, 0xFF, 0x60, 0x6B
    .byte 0x77, 0xF0, 0x08, 0xFF, 0x00, 0x06, 0x00, 0x28, 0x02, 0xD0, 0x60, 0x6B, 0x77, 0xF0, 0xA2, 0xFF
    .byte 0x10, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0x10, 0xB5, 0x81, 0xB0, 0x04, 0x1C, 0x60, 0x6B
    .byte 0x78, 0xF0, 0xCE, 0xF8, 0x00, 0x06, 0x00, 0x28, 0x22, 0xD1, 0x78, 0x20, 0x88, 0xF0, 0x34, 0xF8
    .byte 0xF0, 0x30, 0x00, 0x04, 0x00, 0x0C, 0x18, 0x4A, 0x00, 0x99, 0x11, 0x40, 0x01, 0x43, 0x17, 0x48
    .byte 0x01, 0x40, 0xF0, 0x20, 0x80, 0x03, 0x01, 0x43, 0x80, 0x20, 0x00, 0x04, 0x01, 0x43, 0x14, 0x48
    .byte 0x01, 0x40, 0x00, 0x91, 0x60, 0x6B, 0x69, 0x46, 0x78, 0xF0, 0x00, 0xF9, 0x20, 0x1C, 0xFF, 0xF7
    .byte 0x13, 0xFE, 0x01, 0x1C, 0x20, 0x1C, 0x20, 0x30, 0x02, 0x78, 0x20, 0x1C, 0xFF, 0xF7, 0xD4, 0xFD
    .byte 0x60, 0x6B, 0x0A, 0x21, 0x77, 0xF0, 0xBA, 0xFD, 0x60, 0x6B, 0x77, 0xF0, 0x65, 0xFF, 0x20, 0x1C
    .byte 0x00, 0x21, 0x00, 0x22, 0x0E, 0xF0, 0x06, 0xFE, 0x20, 0x1C, 0xA2, 0x21, 0xFC, 0xF7, 0xA2, 0xFC
    .byte 0x01, 0xB0, 0x10, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x80, 0xFF
    .byte 0xFF, 0xFF, 0xFF, 0x00, 0x70, 0xB5, 0x81, 0xB0, 0x04, 0x1C, 0x0E, 0x1C, 0x15, 0x1C, 0x60, 0x6B
    .byte 0x78, 0xF0, 0x86, 0xF8, 0x00, 0x06, 0x00, 0x28, 0x1C, 0xD1, 0x3B, 0x2D, 0x1A, 0xD9, 0x25, 0x1C
    .byte 0x20, 0x35, 0x28, 0x78, 0xB0, 0x42, 0x03, 0xD0, 0x20, 0x1C, 0x31, 0x1C, 0x0E, 0xF0, 0xEC, 0xFC
    .byte 0x0A, 0x49, 0x00, 0x98, 0x08, 0x40, 0x3C, 0x21, 0x08, 0x43, 0x00, 0x90, 0x60, 0x6B, 0x69, 0x46
    .byte 0x78, 0xF0, 0xCA, 0xF8, 0x20, 0x1C, 0xFF, 0xF7, 0xCF, 0xFD, 0x01, 0x1C, 0x2A, 0x78, 0x20, 0x1C
    .byte 0xFF, 0xF7, 0x92, 0xFD, 0x01, 0xB0, 0x70, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0xFF, 0xFF

    thumb_func_start func_080237F0
func_080237F0: @ 0x080237F0
    push {lr}
    cmp r0, #1
    bls .L080237FA
    cmp r0, #2
    beq .L080237FE
.L080237FA:
    movs r0, #1
    b .L08023800
.L080237FE:
    movs r0, #2
.L08023800:
    pop {r1}
    bx r1

    thumb_func_start func_08023804
func_08023804: @ 0x08023804
    push {lr}
    cmp r0, #1
    beq .L08023816
    cmp r0, #1
    blo .L08023812
    cmp r0, #2
    beq .L0802381A
.L08023812:
    movs r0, #9
    b .L0802381C
.L08023816:
    movs r0, #0xb
    b .L0802381C
.L0802381A:
    movs r0, #0xc
.L0802381C:
    pop {r1}
    bx r1
.L08023820:
    .byte 0x70, 0xB5, 0x46, 0x46, 0x40, 0xB4, 0x84, 0xB0, 0x05, 0x1C, 0x68, 0x6B, 0x78, 0xF0, 0xB0, 0xFA
    .byte 0x06, 0x1C, 0x8C, 0x20, 0xDC, 0xF7, 0xCE, 0xFE, 0x80, 0x46, 0x30, 0x1C, 0xFF, 0xF7, 0xD8, 0xFF
    .byte 0x04, 0x1C, 0x30, 0x1C, 0xFF, 0xF7, 0xDE, 0xFF, 0x00, 0x94, 0x01, 0x90, 0x00, 0x26, 0x02, 0x96
    .byte 0x03, 0xA8, 0x06, 0x70, 0x40, 0x46, 0x29, 0x1C, 0x04, 0x22, 0x0C, 0x23, 0x0E, 0xF0, 0x2E, 0xFE
    .byte 0x04, 0x1C, 0xA0, 0x46, 0x38, 0x35, 0x28, 0x78, 0x04, 0x28, 0x15, 0xD1, 0x20, 0x1C, 0x70, 0x30
    .byte 0x08, 0x21, 0x3A, 0xF0, 0xF5, 0xFF, 0x20, 0x1C, 0x84, 0x30, 0x01, 0x21, 0x01, 0x70, 0x02, 0x30
    .byte 0x06, 0x70, 0x01, 0x30, 0x01, 0x70, 0x22, 0x1C, 0x8A, 0x32, 0x02, 0x23, 0x11, 0x78, 0x04, 0x20
    .byte 0x40, 0x42, 0x08, 0x40, 0x18, 0x43, 0x10, 0x70, 0x40, 0x46, 0x04, 0xB0, 0x08, 0xBC, 0x98, 0x46
    .byte 0x70, 0xBC, 0x02, 0xBC, 0x08, 0x47, 0x00, 0x00

    thumb_func_start func_080238A8
func_080238A8: @ 0x080238A8
    push {r4, r5, r6, lr}
    sub sp, #8
    adds r4, r0, #0
    adds r5, r1, #0
    adds r6, r2, #0
    mov r0, sp
    adds r1, r6, #0
    bl __5ActorRC5Actor
    ldr r3, .L080238EC @ =0x00000921
    adds r0, r4, #0
    adds r1, r5, #0
    mov r2, sp
    bl func_08020038
    ldr r0, .L080238F0 @ =vtable_unk_080E6284
    str r0, [r4, #0x14]
    str r6, [r4, #0x34]
    adds r0, r4, #0
    bl func_08024020
    adds r1, r0, #0
    adds r0, r4, #0
    adds r0, #0x20
    ldrb r2, [r0]
    adds r0, r4, #0
    bl func_08023FB0
    adds r0, r4, #0
    add sp, #8
    pop {r4, r5, r6}
    pop {r1}
    bx r1
    .align 2, 0
.L080238EC: .4byte 0x00000921
.L080238F0: .4byte vtable_unk_080E6284
.L080238F4:
    .byte 0x70, 0xB5, 0x82, 0xB0, 0x05, 0x1C, 0x0E, 0x1C, 0x10, 0x48, 0x68, 0x61
    .byte 0x6C, 0x6B, 0x68, 0x46, 0x29, 0x1C, 0x0E, 0xF0, 0x33, 0xFC, 0x20, 0x1C, 0x69, 0x46, 0x77, 0xF0
    .byte 0x09, 0xFC, 0x0C, 0x48, 0x68, 0x61, 0x29, 0x69, 0x00, 0x29, 0x05, 0xD0, 0x48, 0x68, 0x82, 0x68
    .byte 0x08, 0x1C, 0x03, 0x21, 0xAF, 0xF0, 0xF6, 0xFF, 0x01, 0x20, 0x30, 0x40, 0x00, 0x28, 0x02, 0xD0
    .byte 0x28, 0x1C, 0xDC, 0xF7, 0x69, 0xFE, 0x02, 0xB0, 0x70, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00
    .byte 0x84, 0x62, 0x0E, 0x08, 0x50, 0x62, 0x0E, 0x08, 0x10, 0xB5, 0x81, 0xB0, 0x04, 0x1C, 0x09, 0x04
    .byte 0x09, 0x0C, 0x0C, 0x4A, 0x00, 0x98, 0x10, 0x40, 0x08, 0x43, 0x0B, 0x49, 0x08, 0x40, 0x00, 0x90
    .byte 0x60, 0x6B, 0x69, 0x46, 0x77, 0xF0, 0xEC, 0xFF, 0x20, 0x1C, 0x00, 0xF0, 0x59, 0xFB, 0x01, 0x1C
    .byte 0x20, 0x1C, 0x20, 0x30, 0x02, 0x78, 0x20, 0x1C, 0x00, 0xF0, 0x1A, 0xFB, 0x01, 0xB0, 0x10, 0xBC
    .byte 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xF0, 0xB5, 0x57, 0x46
    .byte 0x4E, 0x46, 0x45, 0x46, 0xE0, 0xB4, 0xA8, 0xB0, 0x80, 0x46, 0x07, 0x68, 0x40, 0x6B, 0x81, 0x46
    .byte 0x42, 0x46, 0x92, 0x88, 0x24, 0x92, 0x02, 0x2A, 0x62, 0xD1, 0x08, 0x79, 0x00, 0x28, 0x5F, 0xD0
    .byte 0x48, 0x46, 0x77, 0xF0, 0xB3, 0xFD, 0x05, 0x1C, 0x48, 0x46, 0x01, 0x21, 0x77, 0xF0, 0xDE, 0xFD
    .byte 0x48, 0x46, 0x77, 0xF0, 0xAB, 0xFD, 0x04, 0x1C, 0xB3, 0x2D, 0x15, 0xD8, 0xB3, 0x2C, 0x13, 0xD9
    .byte 0x38, 0x68, 0xA2, 0x23, 0x5B, 0x00, 0xC0, 0x18, 0x01, 0x68, 0x38, 0x1C, 0xAF, 0xF0, 0x98, 0xFF
    .byte 0x00, 0x68, 0x00, 0x28, 0x08, 0xD0, 0x48, 0x46, 0x77, 0xF0, 0x8C, 0xFD, 0x00, 0x06, 0x00, 0x28
    .byte 0x02, 0xD1, 0x48, 0x46, 0x77, 0xF0, 0x20, 0xFE, 0xEF, 0x2D, 0x17, 0xD8, 0xEF, 0x2C, 0x15, 0xD9
    .byte 0x38, 0x68, 0x84, 0x26, 0x76, 0x00, 0x80, 0x19, 0x41, 0x46, 0x0A, 0x23, 0xCA, 0x5E, 0x0E, 0x26
    .byte 0x8B, 0x5F, 0x12, 0xA9, 0x0A, 0x80, 0x4B, 0x80, 0x02, 0x68, 0x38, 0x1C, 0xAF, 0xF0, 0x7A, 0xFF
    .byte 0x00, 0x06, 0x00, 0x28, 0x02, 0xD0, 0x48, 0x46, 0x77, 0xF0, 0x62, 0xFF, 0x43, 0x48, 0x85, 0x42
    .byte 0x1E, 0xD8, 0x84, 0x42, 0x1C, 0xD9, 0x38, 0x68, 0xA2, 0x21, 0x49, 0x00, 0x40, 0x18, 0x01, 0x68
    .byte 0x38, 0x1C, 0xAF, 0xF0, 0x65, 0xFF, 0x00, 0x68, 0x00, 0x28, 0x11, 0xD1, 0x48, 0x46, 0x77, 0xF0
    .byte 0x59, 0xFD, 0x00, 0x06, 0x00, 0x28, 0x07, 0xD0, 0x64, 0x20, 0x87, 0xF0, 0x95, 0xFE, 0x1D, 0x28
    .byte 0x02, 0xD8, 0x48, 0x46, 0x77, 0xF0, 0xEE, 0xFD, 0x48, 0x46, 0x01, 0x21, 0x77, 0xF0, 0x1C, 0xFC
    .byte 0x39, 0x68, 0x02, 0xA8, 0x4B, 0x6B, 0x39, 0x1C, 0x24, 0x9A, 0xAF, 0xF0, 0x4D, 0xFF, 0x42, 0x46
    .byte 0x51, 0x69, 0x13, 0xA8, 0xCA, 0x68, 0x41, 0x46, 0xAF, 0xF0, 0x44, 0xFF, 0x13, 0x98, 0x14, 0x99
    .byte 0x26, 0x90, 0x27, 0x91, 0x05, 0xAC, 0x10, 0x21, 0x8A, 0x46, 0x00, 0x25, 0x11, 0x21, 0x05, 0x91
    .byte 0x11, 0x20, 0x40, 0x42, 0x60, 0x60, 0xA0, 0x60, 0xE1, 0x60, 0x0A, 0xA9, 0x02, 0xA8, 0x4C, 0xC8
    .byte 0x4C, 0xC1, 0x26, 0x98, 0x27, 0x99, 0x0D, 0x90, 0x0E, 0x91, 0x51, 0x46, 0xA1, 0x62, 0xE5, 0x62
    .byte 0x25, 0x63, 0x38, 0x68, 0x02, 0x6C, 0x38, 0x1C, 0x00, 0x21, 0xAF, 0xF0, 0x23, 0xFF, 0x06, 0x1C
    .byte 0x38, 0x68, 0x02, 0x6C, 0x38, 0x1C, 0x4A, 0x21, 0xAF, 0xF0, 0x1C, 0xFF, 0x05, 0x1C, 0x00, 0x2E
    .byte 0x0F, 0xD0, 0xB0, 0x88, 0x24, 0x9A, 0x90, 0x42, 0x0B, 0xD1, 0x71, 0x69, 0x15, 0xAC, 0x20, 0x1C
    .byte 0xCA, 0x68, 0x31, 0x1C, 0xAF, 0xF0, 0x0E, 0xFF, 0x05, 0xA8, 0x21, 0x1C, 0x00, 0x22, 0x87, 0xF0
    .byte 0xC7, 0xFF, 0x00, 0x2D, 0x0F, 0xD0, 0xA8, 0x88, 0x24, 0x9B, 0x98, 0x42, 0x0B, 0xD1, 0x69, 0x69
    .byte 0x17, 0xAC, 0x20, 0x1C, 0xCA, 0x68, 0x29, 0x1C, 0xAF, 0xF0, 0xFC, 0xFE, 0x05, 0xA8, 0x21, 0x1C
    .byte 0x00, 0x22, 0x87, 0xF0, 0xB5, 0xFF, 0x49, 0x46, 0x88, 0x6A, 0x01, 0x28, 0x00, 0xD1, 0xC1, 0xE0
    .byte 0x01, 0x28, 0x05, 0xDC, 0x00, 0x28, 0x0A, 0xD0, 0x12, 0xE2, 0x00, 0x00, 0x2B, 0x01, 0x00, 0x00
    .byte 0x02, 0x28, 0x00, 0xD1, 0x20, 0xE1, 0x03, 0x28, 0x00, 0xD1, 0x8F, 0xE1, 0x08, 0xE2, 0x2C, 0x22
    .byte 0x4A, 0x44, 0x92, 0x46, 0x4B, 0x46, 0x9C, 0x8D, 0x00, 0x2C, 0x42, 0xD0, 0x46, 0x46, 0xB5, 0x69
    .byte 0xF6, 0x69, 0x00, 0x27, 0x00, 0x2D, 0x0B, 0xDA, 0x07, 0x99, 0x0F, 0x98, 0xC1, 0x42, 0x03, 0xDA
    .byte 0x05, 0xA8, 0x87, 0xF0, 0xE9, 0xFE, 0x07, 0x99, 0x10, 0x20, 0x40, 0x42, 0x81, 0x42, 0x29, 0xDC
    .byte 0x00, 0x2D, 0x0B, 0xDD, 0x08, 0x99, 0x0F, 0x98, 0x81, 0x42, 0x04, 0xDD, 0x05, 0xA8, 0x87, 0xF0
    .byte 0x19, 0xFF, 0x08, 0x98, 0x00, 0xE0, 0x08, 0x1C, 0x0F, 0x28, 0x1B, 0xDD, 0x00, 0x2E, 0x0B, 0xDA
    .byte 0x06, 0x99, 0x0F, 0x98, 0xC1, 0x42, 0x03, 0xDA, 0x05, 0xA8, 0x87, 0xF0, 0x91, 0xFE, 0x06, 0x99
    .byte 0x10, 0x20, 0x40, 0x42, 0x81, 0x42, 0x0D, 0xDC, 0x00, 0x2E, 0x0C, 0xDD, 0x05, 0x99, 0x0F, 0x98
    .byte 0x81, 0x42, 0x04, 0xDD, 0x05, 0xA8, 0x87, 0xF0, 0x49, 0xFE, 0x05, 0x98, 0x00, 0xE0, 0x08, 0x1C
    .byte 0x0F, 0x28, 0x00, 0xDC, 0x01, 0x27, 0x00, 0x2F, 0x01, 0xD0, 0x00, 0x24, 0x67, 0xE0, 0x01, 0x3C
    .byte 0x65, 0xE0, 0x40, 0x46, 0xFC, 0xF7, 0xA4, 0xFA, 0x00, 0x06, 0x00, 0x28, 0x5F, 0xD0, 0x38, 0x68
    .byte 0xA2, 0x21, 0x49, 0x00, 0x40, 0x18, 0x01, 0x68, 0x38, 0x1C, 0xAF, 0xF0, 0x89, 0xFE, 0x80, 0x7A
    .byte 0xC0, 0x06, 0xC0, 0x0E, 0x00, 0x21, 0x06, 0x38, 0x0E, 0x28, 0x00, 0xD9, 0x01, 0x21, 0xC8, 0x00
    .byte 0x40, 0x1A, 0x40, 0x01, 0x09, 0x49, 0x45, 0x18, 0x48, 0x46, 0x77, 0xF0, 0x77, 0xFC, 0x00, 0x06
    .byte 0x00, 0x0E, 0xC1, 0x00, 0x09, 0x1A, 0x8C, 0x00, 0x48, 0x46, 0x77, 0xF0, 0x41, 0xFE, 0x00, 0x06
    .byte 0x00, 0x28, 0x05, 0xD0, 0x20, 0x1C, 0xA8, 0x30, 0x2D, 0x18, 0x13, 0xE0, 0x74, 0x0C, 0x0F, 0x08
    .byte 0x48, 0x46, 0x78, 0xF0, 0x5D, 0xF9, 0x00, 0x06, 0x00, 0x28, 0x03, 0xD0, 0x20, 0x1C, 0x70, 0x30
    .byte 0x2D, 0x18, 0x07, 0xE0, 0x48, 0x46, 0x78, 0xF0, 0x41, 0xF9, 0xC1, 0x00, 0x09, 0x1A, 0xC9, 0x00
    .byte 0x69, 0x18, 0x0D, 0x19, 0x28, 0x1C, 0x07, 0x21, 0x87, 0xF0, 0xE0, 0xFD, 0x06, 0x1C, 0xB4, 0x00
    .byte 0x2C, 0x19, 0x3C, 0x25, 0xA0, 0x78, 0x68, 0x43, 0x87, 0xF0, 0x86, 0xFD, 0x61, 0x78, 0x69, 0x43
    .byte 0x0C, 0x18, 0x40, 0x46, 0x20, 0x30, 0x05, 0x78, 0x04, 0x20, 0x87, 0xF0, 0x7D, 0xFD, 0x01, 0x1C
    .byte 0x00, 0x29, 0x05, 0xD0, 0x03, 0x29, 0x03, 0xD0, 0x28, 0x1C, 0x87, 0xF0, 0x83, 0xFD, 0x05, 0x1C
    .byte 0x40, 0x46, 0x31, 0x1C, 0x2A, 0x1C, 0x00, 0xF0, 0x83, 0xF9, 0x52, 0x46, 0x96, 0x70, 0x53, 0x46
    .byte 0x1C, 0x80, 0x55, 0xE1, 0x48, 0x46, 0x2C, 0x30, 0x25, 0x90, 0x49, 0x46, 0x89, 0x8D, 0x8A, 0x46
    .byte 0x00, 0x29, 0x02, 0xD0, 0x01, 0x22, 0x52, 0x42, 0x92, 0x44, 0x4B, 0x46, 0xD9, 0x6A, 0x48, 0x02
    .byte 0x45, 0x0E, 0x00, 0x2D, 0x00, 0xD0, 0x01, 0x3D, 0x25, 0x98, 0xC4, 0x78, 0x00, 0x2C, 0x00, 0xD0
    .byte 0x01, 0x3C, 0x52, 0x46, 0x00, 0x2A, 0x40, 0xD0, 0x08, 0x02, 0x00, 0x28, 0x07, 0xDA, 0x38, 0x68
    .byte 0x02, 0x6C, 0x38, 0x1C, 0x2D, 0x21, 0xAF, 0xF0, 0x0D, 0xFE, 0x01, 0x1C, 0x00, 0xE0, 0x31, 0x1C
    .byte 0x00, 0x29, 0x32, 0xD0, 0x88, 0x88, 0x24, 0x9B, 0x98, 0x42, 0x2E, 0xD1, 0x00, 0x2C, 0x1F, 0xD1
    .byte 0x47, 0x46, 0x0A, 0x20, 0x3E, 0x5E, 0x0E, 0x22, 0xBC, 0x5E, 0x0A, 0x23, 0xCA, 0x5E, 0x0E, 0x27
    .byte 0xCB, 0x5F, 0x01, 0x27, 0x00, 0x2D, 0x00, 0xD0, 0x06, 0x27, 0x40, 0x46, 0x20, 0x30, 0x00, 0x78
    .byte 0x05, 0xA9, 0x00, 0x91, 0x01, 0x90, 0x30, 0x1C, 0x21, 0x1C, 0x88, 0xF0, 0x8D, 0xF8, 0x02, 0x1C
    .byte 0x40, 0x46, 0x39, 0x1C, 0x00, 0xF0, 0x34, 0xF9, 0x1E, 0x20, 0x87, 0xF0, 0x1D, 0xFD, 0x44, 0x1C
    .byte 0x53, 0x46, 0x25, 0x9A, 0x13, 0x80, 0x7F, 0x20, 0x05, 0x40, 0x91, 0x78, 0x80, 0x20, 0x40, 0x42
    .byte 0x08, 0x40, 0x28, 0x43, 0x90, 0x70, 0xD4, 0x70, 0xFA, 0xE0, 0x05, 0x49, 0x19, 0x98, 0x08, 0x40
    .byte 0xB4, 0x21, 0x08, 0x43, 0x03, 0x49, 0x08, 0x40, 0x19, 0x90, 0x19, 0xA9, 0x63, 0xE0, 0x00, 0x00
    .byte 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0x4C, 0x46, 0x2C, 0x34, 0x4F, 0x46, 0xBD, 0x8D
    .byte 0x00, 0x2D, 0x00, 0xD0, 0x01, 0x3D, 0x62, 0x88, 0x00, 0x2A, 0x00, 0xD0, 0x01, 0x3A, 0x00, 0x2D
    .byte 0x48, 0xD0, 0x00, 0x2E, 0x46, 0xD0, 0xB0, 0x88, 0x24, 0x99, 0x88, 0x42, 0x42, 0xD1, 0x47, 0x46
    .byte 0x0A, 0x20, 0x3B, 0x5E, 0x0E, 0x20, 0x39, 0x5E, 0x0A, 0x20, 0x37, 0x5E, 0xBA, 0x46, 0x0E, 0x27
    .byte 0xF6, 0x5F, 0x57, 0x46, 0xF8, 0x1A, 0x00, 0x28, 0x00, 0xDA, 0x40, 0x42, 0x0F, 0x28, 0x05, 0xDC
    .byte 0x70, 0x1A, 0x00, 0x28, 0x00, 0xDA, 0x40, 0x42, 0x0F, 0x28, 0x2B, 0xDD, 0x00, 0x2A, 0x0F, 0xD0
    .byte 0x04, 0x27, 0xE0, 0x5F, 0xC0, 0x1A, 0x00, 0x28, 0x00, 0xDA, 0x40, 0x42, 0x0F, 0x28, 0x1E, 0xDC
    .byte 0x06, 0x27, 0xE0, 0x5F, 0x40, 0x1A, 0x00, 0x28, 0x00, 0xDA, 0x40, 0x42, 0x0F, 0x28, 0x16, 0xDC
    .byte 0x40, 0x46, 0x20, 0x30, 0x00, 0x78, 0x05, 0xAA, 0x00, 0x92, 0x01, 0x90, 0x18, 0x1C, 0x52, 0x46
    .byte 0x33, 0x1C, 0x87, 0xF0, 0x15, 0xFF, 0x02, 0x1C, 0x40, 0x46, 0x01, 0x21, 0x00, 0xF0, 0xC8, 0xF8
    .byte 0x1E, 0x20, 0x87, 0xF0, 0xB1, 0xFC, 0x42, 0x1C, 0x53, 0x46, 0xA3, 0x80, 0xE6, 0x80, 0x25, 0x80
    .byte 0x62, 0x80, 0x95, 0xE0, 0x0B, 0x49, 0x1A, 0x98, 0x08, 0x40, 0xB4, 0x21, 0x08, 0x43, 0x0A, 0x49
    .byte 0x08, 0x40, 0x1A, 0x90, 0x1A, 0xA9, 0x48, 0x46, 0x77, 0xF0, 0x7A, 0xFD, 0x40, 0x46, 0x00, 0xF0
    .byte 0xE7, 0xF8, 0x01, 0x1C, 0x40, 0x46, 0x20, 0x30, 0x02, 0x78, 0x40, 0x46, 0x00, 0xF0, 0xA8, 0xF8
    .byte 0x7E, 0xE0, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0x4E, 0x46, 0x2C, 0x36
    .byte 0x40, 0x46, 0x20, 0x30, 0x01, 0x78, 0x47, 0x46, 0x0A, 0x22, 0xBC, 0x5E, 0x0E, 0x23, 0xFD, 0x5E
    .byte 0x07, 0x1C, 0x24, 0x98, 0x25, 0x28, 0x21, 0xD1, 0x00, 0x29, 0x1F, 0xD1, 0x1B, 0xA8, 0xE8, 0xF7
    .byte 0xE3, 0xFF, 0x1B, 0x98, 0x1C, 0x90, 0x1C, 0xA8, 0x02, 0x22, 0x81, 0x5E, 0x28, 0x1C, 0x08, 0x38
    .byte 0x08, 0x1A, 0x00, 0x28, 0x00, 0xDA, 0x40, 0x42, 0x07, 0x28, 0x3F, 0xDC, 0x1D, 0xA8, 0xE5, 0xF7
    .byte 0x15, 0xFE, 0x1D, 0x98, 0x1E, 0x90, 0x1E, 0xA8, 0x00, 0x23, 0xC2, 0x5E, 0x02, 0x21, 0x43, 0x5E
    .byte 0x10, 0x33, 0x40, 0x46, 0x02, 0x21, 0xFB, 0xF7, 0xD7, 0xFF, 0x2F, 0xE0, 0x24, 0x9A, 0x02, 0x2A
    .byte 0x2C, 0xD1, 0x01, 0x29, 0x2A, 0xD1, 0x1F, 0xA8, 0xE5, 0xF7, 0x00, 0xFE, 0x1F, 0x98, 0x20, 0x90
    .byte 0x20, 0xA8, 0x01, 0x1C, 0x00, 0x23, 0xC8, 0x5E, 0x00, 0x1B, 0x00, 0x28, 0x00, 0xDA, 0x40, 0x42
    .byte 0x0F, 0x28, 0x1B, 0xDC, 0x02, 0x20, 0x09, 0x5E, 0x28, 0x1C, 0x08, 0x30, 0x08, 0x1A, 0x00, 0x28
    .byte 0x00, 0xDA, 0x40, 0x42, 0x07, 0x28, 0x11, 0xDC, 0x21, 0xA8, 0xE8, 0xF7, 0xA5, 0xFF, 0x21, 0x99
    .byte 0x22, 0xA8, 0x01, 0x60, 0x00, 0x21, 0x42, 0x5E, 0x02, 0x21, 0x43, 0x5E, 0x20, 0x3B, 0x40, 0x46
    .byte 0x25, 0x21, 0xFB, 0xF7, 0xA9, 0xFF, 0x48, 0x46, 0x77, 0xF0, 0x6E, 0xFB, 0x30, 0x88, 0x00, 0x28
    .byte 0x02, 0xD0, 0x01, 0x38, 0x30, 0x80, 0x13, 0xE0, 0x11, 0x4A, 0x23, 0xA9, 0x08, 0x68, 0x10, 0x40
    .byte 0xB4, 0x22, 0x10, 0x43, 0x0F, 0x4A, 0x10, 0x40, 0x08, 0x60, 0x48, 0x46, 0x77, 0xF0, 0xF8, 0xFC
    .byte 0x40, 0x46, 0x00, 0xF0, 0x65, 0xF8, 0x01, 0x1C, 0x3A, 0x78, 0x40, 0x46, 0x00, 0xF0, 0x28, 0xF8
    .byte 0x40, 0x46, 0x05, 0xA9, 0xFC, 0xF7, 0x04, 0xF9, 0x41, 0x46, 0x30, 0x31, 0x00, 0x20, 0x08, 0x70
    .byte 0x42, 0x46, 0x90, 0x8C, 0x00, 0x28, 0x07, 0xD0, 0x01, 0x38, 0x90, 0x84, 0x07, 0xE0, 0x00, 0x00
    .byte 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0x43, 0x46, 0xD8, 0x8C, 0x98, 0x84, 0x46, 0x46
    .byte 0x32, 0x69, 0x00, 0x2A, 0x04, 0xD0, 0x50, 0x68, 0xC1, 0x68, 0x10, 0x1C, 0xAF, 0xF0, 0xB8, 0xFC
    .byte 0x28, 0xB0, 0x38, 0xBC, 0x98, 0x46, 0xA1, 0x46, 0xAA, 0x46, 0xF0, 0xBC, 0x01, 0xBC, 0x00, 0x47

    thumb_func_start func_08023FB0
func_08023FB0: @ 0x08023FB0
    push {r4, r5, r6, lr}
    adds r4, r0, #0
    adds r5, r1, #0
    adds r6, r2, #0
    bl func_0802405C
    adds r1, r0, #0
    ldrh r0, [r4, #0x22]
    cmp r0, r1
    beq .L08023FCA
    adds r0, r4, #0
    bl SetAnim__12AActorEntityUi
.L08023FCA:
    adds r0, r4, #0
    adds r0, #0x20
    ldrb r0, [r0]
    cmp r0, r6
    beq .L08023FDC
    adds r0, r4, #0
    adds r1, r6, #0
    bl SetAnimFacing__12AActorEntityUi
.L08023FDC:
    adds r0, r4, #0
    adds r1, r5, #0
    bl func_080240BC
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_08020080
    adds r0, r4, #0
    adds r0, #0x38
    adds r6, r0, #0
    ldrb r0, [r6]
    cmp r5, r0
    beq .L08024016
    movs r1, #1
    rsbs r1, r1, #0
    cmp r5, #4
    bne .L08024002
    movs r1, #8
.L08024002:
    cmp r1, #0
    blt .L08024010
    adds r0, r4, #0
    movs r2, #1
    bl func_08032384
    b .L08024016
.L08024010:
    adds r0, r4, #0
    bl func_080323C8
.L08024016:
    strb r5, [r6]
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_08024020
func_08024020: @ 0x08024020
    push {lr}
    ldr r0, [r0, #0x34]
    ldr r1, [r0, #0x28]
    cmp r1, #1
    beq .L08024042
    cmp r1, #1
    bgt .L08024034
    cmp r1, #0
    beq .L0802403C
    b .L08024038
.L08024034:
    cmp r1, #3
    ble .L08024056
.L08024038:
    movs r0, #0
    b .L08024058
.L0802403C:
    adds r0, #0x2e
    ldrb r0, [r0]
    b .L08024058
.L08024042:
    adds r0, #0x2e
    ldrb r1, [r0]
    movs r0, #0x7f
    ands r0, r1
    movs r1, #1
    cmp r0, #0
    beq .L08024052
    movs r1, #6
.L08024052:
    adds r0, r1, #0
    b .L08024058
.L08024056:
    movs r0, #1
.L08024058:
    pop {r1}
    bx r1

    thumb_func_start func_0802405C
func_0802405C: @ 0x0802405C
    push {r4, r5, r6, r7, lr}
    adds r5, r0, #0
    adds r4, r1, #0
    movs r6, #0
    ldr r0, [r5, #0x34]
    bl IsPregnant__C10BarnAnimal
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802407C
    ldr r0, [r5, #0x34]
    bl GetDaysPregnant__C10BarnAnimal
    rsbs r1, r0, #0
    orrs r1, r0
    lsrs r6, r1, #0x1f
.L0802407C:
    ldr r7, .L0802408C @ =gUnk_080F0E34
    lsls r4, r4, #1
    cmp r6, #0
    beq .L08024090
    adds r0, r4, #0
    adds r0, #0x2a
    b .L080240B0
    .align 2, 0
.L0802408C: .4byte gUnk_080F0E34
.L08024090:
    ldr r0, [r5, #0x34]
    bl IsSheared__C5Sheep
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L080240A2
    adds r0, r4, #0
    adds r0, #0x1c
    b .L080240B0
.L080240A2:
    ldr r0, [r5, #0x34]
    bl GetGrowthStage__C5Sheep
    lsls r1, r0, #3
    subs r1, r1, r0
    lsls r1, r1, #1
    adds r0, r4, r1
.L080240B0:
    adds r0, r7, r0
    ldrh r0, [r0]
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_080240BC
func_080240BC: @ 0x080240BC
    push {lr}
    cmp r1, #1
    beq .L080240C6
    movs r0, #0
    b .L080240CA
.L080240C6:
    movs r0, #0x80
    lsls r0, r0, #8
.L080240CA:
    pop {r1}
    bx r1
    .align 2, 0
.L080240D0:
    .byte 0xF0, 0xB5, 0x82, 0xB0, 0x06, 0x1C, 0x0F, 0x1C, 0x38, 0x88, 0x80, 0x05, 0x80, 0x0D, 0xB1, 0x88
    .byte 0x88, 0x42, 0x5F, 0xD1, 0x70, 0x6B, 0x77, 0xF0, 0xE3, 0xFB, 0x00, 0x06, 0x00, 0x28, 0x59, 0xD1
    .byte 0x70, 0x6B, 0x77, 0xF0, 0x99, 0xF8, 0xFB, 0xF7, 0x8F, 0xFF, 0x0A, 0x21, 0x73, 0x5E, 0x79, 0x78
    .byte 0x89, 0x08, 0x7A, 0x88, 0x12, 0x4C, 0x22, 0x40, 0x92, 0x01, 0x0A, 0x43, 0x12, 0x04, 0x12, 0x14
    .byte 0xD2, 0x1A, 0x0E, 0x23, 0xF5, 0x5E, 0xFB, 0x78, 0x9B, 0x08, 0xB9, 0x88, 0x21, 0x40, 0x89, 0x01
    .byte 0x19, 0x43, 0x09, 0x04, 0x09, 0x14, 0x49, 0x1B, 0x13, 0x1C, 0x53, 0x43, 0x1A, 0x1C, 0x0B, 0x1C
    .byte 0x4B, 0x43, 0x19, 0x1C, 0x52, 0x18, 0x01, 0x1C, 0x41, 0x43, 0x08, 0x1C, 0x82, 0x42, 0x31, 0xDC
    .byte 0x70, 0x6B, 0x77, 0xF0, 0xE3, 0xF9, 0x00, 0x06, 0x00, 0x28, 0x03, 0xD0, 0x1E, 0x24, 0x09, 0xE0
    .byte 0xFF, 0x03, 0x00, 0x00, 0x70, 0x6B, 0x77, 0xF0, 0xD5, 0xF9, 0x00, 0x06, 0x64, 0x24, 0x00, 0x28
    .byte 0x00, 0xD0, 0x46, 0x24, 0x64, 0x20, 0x87, 0xF0, 0x0F, 0xFB, 0xA0, 0x42, 0x1A, 0xD2, 0x70, 0x6B
    .byte 0x77, 0xF0, 0x5A, 0xF8, 0x01, 0x01, 0x09, 0x1A, 0x89, 0x01, 0x09, 0x0A, 0xF0, 0x23, 0x5B, 0x00
    .byte 0xC9, 0x18, 0x09, 0x04, 0x09, 0x0C, 0x00, 0x91, 0x70, 0x6B, 0x69, 0x46, 0x77, 0xF0, 0xE4, 0xFB
    .byte 0x30, 0x1C, 0xFF, 0xF7, 0x45, 0xFF, 0x01, 0x1C, 0x30, 0x1C, 0x20, 0x30, 0x02, 0x78, 0x30, 0x1C
    .byte 0xFF, 0xF7, 0x06, 0xFF, 0x02, 0xB0, 0xF0, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x10, 0xB5, 0x81, 0xB0
    .byte 0x04, 0x1C, 0x62, 0x6B, 0x90, 0x6A, 0x03, 0x28, 0x15, 0xD1, 0x0D, 0x49, 0x00, 0x98, 0x08, 0x40
    .byte 0xB4, 0x21, 0x08, 0x43, 0x0B, 0x49, 0x08, 0x40, 0x00, 0x90, 0x10, 0x1C, 0x69, 0x46, 0x77, 0xF0
    .byte 0xB7, 0xFB, 0x20, 0x1C, 0xFF, 0xF7, 0x24, 0xFF, 0x01, 0x1C, 0x20, 0x1C, 0x20, 0x30, 0x02, 0x78
    .byte 0x20, 0x1C, 0xFF, 0xF7, 0xE5, 0xFE, 0x01, 0xB0, 0x10, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00
    .byte 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0x01, 0x20, 0x70, 0x47, 0x30, 0xB5, 0x04, 0x1C
    .byte 0x00, 0x25, 0x60, 0x6B, 0x77, 0xF0, 0x54, 0xFB, 0x00, 0x06, 0x00, 0x28, 0x06, 0xD1, 0x60, 0x6B
    .byte 0x77, 0xF0, 0x9A, 0xFE, 0x00, 0x06, 0x00, 0x0E, 0x40, 0x42, 0xC5, 0x0F, 0x28, 0x1C, 0x30, 0xBC
    .byte 0x02, 0xBC, 0x08, 0x47, 0x00, 0xB5, 0x40, 0x6B, 0x77, 0xF0, 0x02, 0xF8, 0x01, 0x21, 0x48, 0x40
    .byte 0x02, 0xBC, 0x08, 0x47, 0x00, 0xB5, 0x40, 0x6B, 0x77, 0xF0, 0x6E, 0xFE, 0x02, 0xBC, 0x08, 0x47
    .byte 0x00, 0xB5, 0x40, 0x6B, 0x77, 0xF0, 0x62, 0xF9, 0x02, 0xBC, 0x08, 0x47, 0x30, 0xB5, 0x04, 0x1C
    .byte 0x00, 0x25, 0xA0, 0x88, 0x02, 0x28, 0x0C, 0xD1, 0x60, 0x6B, 0x77, 0xF0, 0x57, 0xF9, 0x00, 0x06
    .byte 0x00, 0x28, 0x06, 0xD1, 0x60, 0x6B, 0x77, 0xF0, 0x4D, 0xF9, 0x00, 0x06, 0x00, 0x28, 0x00, 0xD1
    .byte 0x01, 0x25, 0x28, 0x1C, 0x30, 0xBC, 0x02, 0xBC, 0x08, 0x47, 0x00, 0x00, 0x10, 0xB5, 0x81, 0xB0
    .byte 0x04, 0x1C, 0x60, 0x6B, 0x77, 0xF0, 0x14, 0xFB, 0x00, 0x06, 0x00, 0x28, 0x21, 0xD1, 0x78, 0x20
    .byte 0x87, 0xF0, 0x7A, 0xFA, 0xF0, 0x30, 0x00, 0x04, 0x00, 0x0C, 0x18, 0x4A, 0x00, 0x99, 0x11, 0x40
    .byte 0x01, 0x43, 0x17, 0x48, 0x01, 0x40, 0xF0, 0x20, 0x80, 0x03, 0x01, 0x43, 0x15, 0x48, 0x01, 0x40
    .byte 0x15, 0x48, 0x01, 0x40, 0x00, 0x91, 0x60, 0x6B, 0x69, 0x46, 0x77, 0xF0, 0x47, 0xFB, 0x20, 0x1C
    .byte 0xFF, 0xF7, 0xAE, 0xFE, 0x01, 0x1C, 0x20, 0x1C, 0x20, 0x30, 0x02, 0x78, 0x20, 0x1C, 0xFF, 0xF7
    .byte 0x6F, 0xFE, 0x60, 0x6B, 0x0A, 0x21, 0x77, 0xF0, 0x01, 0xF8, 0x60, 0x6B, 0x77, 0xF0, 0xAC, 0xF9
    .byte 0x20, 0x1C, 0x00, 0x21, 0x00, 0x22, 0x0E, 0xF0, 0x4D, 0xF8, 0x20, 0x1C, 0xA4, 0x21, 0xFB, 0xF7
    .byte 0xE9, 0xFE, 0x01, 0xB0, 0x10, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF
    .byte 0xFF, 0xFF, 0x80, 0xFF, 0xFF, 0xFF, 0x7F, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0xB5, 0x40, 0x6B
    .byte 0x77, 0xF0, 0xF4, 0xFA, 0x01, 0xBC, 0x00, 0x47, 0x10, 0xB5, 0x04, 0x1C, 0x60, 0x6B, 0x76, 0xF0
    .byte 0x87, 0xFF, 0x00, 0x06, 0x00, 0x28, 0x06, 0xD1, 0x60, 0x6B, 0x01, 0x21, 0x76, 0xF0, 0xBC, 0xFF
    .byte 0x60, 0x6B, 0x76, 0xF0, 0xA1, 0xFF, 0x60, 0x6B, 0x77, 0xF0, 0xE4, 0xF8, 0x00, 0x06, 0x00, 0x28
    .byte 0x07, 0xD0, 0x64, 0x20, 0x87, 0xF0, 0x20, 0xFA, 0x1D, 0x28, 0x02, 0xD8, 0x60, 0x6B, 0x77, 0xF0
    .byte 0x79, 0xF9, 0x60, 0x6B, 0x77, 0xF0, 0xDA, 0xF8, 0x00, 0x06, 0x00, 0x28, 0x08, 0xD1, 0x20, 0x1C
    .byte 0x01, 0x21, 0x00, 0x22, 0x0E, 0xF0, 0x0E, 0xF8, 0x20, 0x1C, 0xA3, 0x21, 0xFB, 0xF7, 0xAA, 0xFE
    .byte 0x10, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0x30, 0xB5, 0x04, 0x1C, 0x01, 0x21, 0x00, 0x22
    .byte 0x0E, 0xF0, 0x00, 0xF8, 0x20, 0x1C, 0xA3, 0x21, 0xFB, 0xF7, 0x9C, 0xFE, 0x60, 0x6B, 0x77, 0xF0
    .byte 0xF9, 0xFD, 0x05, 0x1C, 0x20, 0x1C, 0x38, 0x30, 0x01, 0x78, 0x20, 0x1C, 0xFF, 0xF7, 0x5E, 0xFE
    .byte 0x01, 0x1C, 0x60, 0x8C, 0x88, 0x42, 0x02, 0xD0, 0x20, 0x1C, 0x0D, 0xF0, 0x01, 0xFF, 0x28, 0x1C
    .byte 0x30, 0xBC, 0x02, 0xBC, 0x08, 0x47, 0x00, 0x00, 0x10, 0xB5, 0x04, 0x1C, 0x60, 0x6B, 0x77, 0xF0
    .byte 0x31, 0xF9, 0x60, 0x6B, 0x77, 0xF0, 0x9E, 0xF8, 0x00, 0x06, 0x00, 0x28, 0x02, 0xD0, 0x60, 0x6B
    .byte 0x77, 0xF0, 0x38, 0xF9, 0x10, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0x10, 0xB5, 0x81, 0xB0
    .byte 0x04, 0x1C, 0x60, 0x6B, 0x77, 0xF0, 0x64, 0xFA, 0x00, 0x06, 0x00, 0x28, 0x22, 0xD1, 0x78, 0x20
    .byte 0x87, 0xF0, 0xCA, 0xF9, 0xF0, 0x30, 0x00, 0x04, 0x00, 0x0C, 0x18, 0x4A, 0x00, 0x99, 0x11, 0x40
    .byte 0x01, 0x43, 0x17, 0x48, 0x01, 0x40, 0xF0, 0x20, 0x80, 0x03, 0x01, 0x43, 0x80, 0x20, 0x00, 0x04
    .byte 0x01, 0x43, 0x14, 0x48, 0x01, 0x40, 0x00, 0x91, 0x60, 0x6B, 0x69, 0x46, 0x77, 0xF0, 0x96, 0xFA
    .byte 0x20, 0x1C, 0xFF, 0xF7, 0xFD, 0xFD, 0x01, 0x1C, 0x20, 0x1C, 0x20, 0x30, 0x02, 0x78, 0x20, 0x1C
    .byte 0xFF, 0xF7, 0xBE, 0xFD, 0x60, 0x6B, 0x0A, 0x21, 0x76, 0xF0, 0x50, 0xFF, 0x60, 0x6B, 0x77, 0xF0
    .byte 0xFB, 0xF8, 0x20, 0x1C, 0x00, 0x21, 0x00, 0x22, 0x0D, 0xF0, 0x9C, 0xFF, 0x20, 0x1C, 0xA4, 0x21
    .byte 0xFB, 0xF7, 0x38, 0xFE, 0x01, 0xB0, 0x10, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0xFF, 0xFF
    .byte 0xFF, 0xFF, 0x80, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x70, 0xB5, 0x81, 0xB0, 0x04, 0x1C, 0x0E, 0x1C
    .byte 0x15, 0x1C, 0x60, 0x6B, 0x77, 0xF0, 0x1C, 0xFA, 0x00, 0x06, 0x00, 0x28, 0x1C, 0xD1, 0x3B, 0x2D
    .byte 0x1A, 0xD9, 0x25, 0x1C, 0x20, 0x35, 0x28, 0x78, 0xB0, 0x42, 0x03, 0xD0, 0x20, 0x1C, 0x31, 0x1C
    .byte 0x0D, 0xF0, 0x82, 0xFE, 0x0A, 0x49, 0x00, 0x98, 0x08, 0x40, 0x3C, 0x21, 0x08, 0x43, 0x00, 0x90
    .byte 0x60, 0x6B, 0x69, 0x46, 0x77, 0xF0, 0x60, 0xFA, 0x20, 0x1C, 0xFF, 0xF7, 0xB9, 0xFD, 0x01, 0x1C
    .byte 0x2A, 0x78, 0x20, 0x1C, 0xFF, 0xF7, 0x7C, 0xFD, 0x01, 0xB0, 0x70, 0xBC, 0x01, 0xBC, 0x00, 0x47
    .byte 0x00, 0x00, 0xFF, 0xFF

    thumb_func_start func_080244C4
func_080244C4: @ 0x080244C4
    push {lr}
    cmp r0, #0
    beq .L080244CE
    cmp r0, #1
    beq .L080244D2
.L080244CE:
    movs r0, #1
    b .L080244D4
.L080244D2:
    movs r0, #2
.L080244D4:
    pop {r1}
    bx r1

    thumb_func_start func_080244D8
func_080244D8: @ 0x080244D8
    push {lr}
    cmp r0, #0
    beq .L080244E2
    cmp r0, #1
    beq .L080244E6
.L080244E2:
    movs r0, #0xa
    b .L080244E8
.L080244E6:
    movs r0, #0xd
.L080244E8:
    pop {r1}
    bx r1
.L080244EC:
    .byte 0x70, 0xB5, 0x46, 0x46
    .byte 0x40, 0xB4, 0x84, 0xB0, 0x05, 0x1C, 0x68, 0x6B, 0x77, 0xF0, 0xF0, 0xFC, 0x06, 0x1C, 0x8C, 0x20
    .byte 0xDC, 0xF7, 0x68, 0xF8, 0x80, 0x46, 0x30, 0x1C, 0xFF, 0xF7, 0xDC, 0xFF, 0x04, 0x1C, 0x30, 0x1C
    .byte 0xFF, 0xF7, 0xE2, 0xFF, 0x00, 0x94, 0x01, 0x90, 0x00, 0x26, 0x02, 0x96, 0x03, 0xA8, 0x06, 0x70
    .byte 0x40, 0x46, 0x29, 0x1C, 0x04, 0x22, 0x0B, 0x23, 0x0D, 0xF0, 0xC8, 0xFF, 0x04, 0x1C, 0xA0, 0x46
    .byte 0x38, 0x35, 0x28, 0x78, 0x04, 0x28, 0x15, 0xD1, 0x20, 0x1C, 0x70, 0x30, 0x08, 0x21, 0x3A, 0xF0
    .byte 0x8F, 0xF9, 0x20, 0x1C, 0x84, 0x30, 0x01, 0x21, 0x01, 0x70, 0x02, 0x30, 0x06, 0x70, 0x01, 0x30
    .byte 0x01, 0x70, 0x22, 0x1C, 0x8A, 0x32, 0x02, 0x23, 0x11, 0x78, 0x04, 0x20, 0x40, 0x42, 0x08, 0x40
    .byte 0x18, 0x43, 0x10, 0x70, 0x40, 0x46, 0x04, 0xB0, 0x08, 0xBC, 0x98, 0x46, 0x70, 0xBC, 0x02, 0xBC
    .byte 0x08, 0x47, 0x00, 0x00, 0xCB, 0x1F, 0x03, 0x80, 0x13, 0x1F, 0x43, 0x80, 0x07, 0x31, 0x81, 0x80
    .byte 0x05, 0x32, 0xC2, 0x80, 0x70, 0x47, 0x00, 0x00, 0xCB, 0x1F, 0x03, 0x80, 0x13, 0x1F, 0x43, 0x80
    .byte 0x07, 0x31, 0x81, 0x80, 0x05, 0x32, 0xC2, 0x80, 0x70, 0x47, 0x00, 0x00, 0x00, 0xB5, 0x02, 0x1C
    .byte 0x11, 0x1C, 0x30, 0x31, 0x00, 0x20, 0x08, 0x70, 0x90, 0x8C, 0x00, 0x28, 0x01, 0xD0, 0x01, 0x38
    .byte 0x00, 0xE0, 0xD0, 0x8C, 0x90, 0x84, 0x12, 0x69, 0x00, 0x2A, 0x04, 0xD0, 0x50, 0x68, 0xC1, 0x68
    .byte 0x10, 0x1C, 0xAF, 0xF0, 0xA5, 0xF9, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0xCB, 0x1F, 0x03, 0x80
    .byte 0x13, 0x1C, 0x09, 0x3B, 0x43, 0x80, 0x07, 0x31, 0x81, 0x80, 0x05, 0x32, 0xC2, 0x80, 0x70, 0x47

    thumb_func_start func_080245E0
func_080245E0: @ 0x080245E0
    push {lr}
    subs r0, #0x32
    cmp r0, #0x13
    bhi .L080246B6
    lsls r0, r0, #2
    ldr r1, .L080245F4 @ =.L080245F8
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L080245F4: .4byte .L080245F8
.L080245F8: @ jump table
    .4byte .L08024648 @ case 0
    .4byte .L0802464C @ case 1
    .4byte .L08024650 @ case 2
    .4byte .L08024654 @ case 3
    .4byte .L08024658 @ case 4
    .4byte .L0802465C @ case 5
    .4byte .L08024660 @ case 6
    .4byte .L08024664 @ case 7
    .4byte .L08024668 @ case 8
    .4byte .L0802466C @ case 9
    .4byte .L08024670 @ case 10
    .4byte .L08024674 @ case 11
    .4byte .L08024678 @ case 12
    .4byte .L0802467C @ case 13
    .4byte .L08024680 @ case 14
    .4byte .L08024684 @ case 15
    .4byte .L08024688 @ case 16
    .4byte .L0802468C @ case 17
    .4byte .L08024690 @ case 18
    .4byte .L080246B2 @ case 19
.L08024648:
    movs r0, #0
    b .L080246B8
.L0802464C:
    movs r0, #1
    b .L080246B8
.L08024650:
    movs r0, #2
    b .L080246B8
.L08024654:
    movs r0, #3
    b .L080246B8
.L08024658:
    movs r0, #4
    b .L080246B8
.L0802465C:
    movs r0, #5
    b .L080246B8
.L08024660:
    movs r0, #6
    b .L080246B8
.L08024664:
    movs r0, #7
    b .L080246B8
.L08024668:
    movs r0, #8
    b .L080246B8
.L0802466C:
    movs r0, #9
    b .L080246B8
.L08024670:
    movs r0, #0xa
    b .L080246B8
.L08024674:
    movs r0, #0xb
    b .L080246B8
.L08024678:
    movs r0, #0xc
    b .L080246B8
.L0802467C:
    movs r0, #0xd
    b .L080246B8
.L08024680:
    movs r0, #0xe
    b .L080246B8
.L08024684:
    movs r0, #0x14
    b .L080246B8
.L08024688:
    movs r0, #0xf
    b .L080246B8
.L0802468C:
    movs r0, #0x10
    b .L080246B8
.L08024690:
    bl rand
    movs r1, #0xfa
    lsls r1, r1, #2
    bl __modsi3
    movs r1, #0xa
    bl __divsi3
    lsls r0, r0, #0x18
    lsrs r0, r0, #0x18
    cmp r0, #4
    bhi .L080246AE
    movs r0, #0x12
    b .L080246B8
.L080246AE:
    movs r0, #0x11
    b .L080246B8
.L080246B2:
    movs r0, #0x13
    b .L080246B8
.L080246B6:
    movs r0, #0x15
.L080246B8:
    pop {r1}
    bx r1

    thumb_func_start func_080246BC
func_080246BC: @ 0x080246BC
    push {r4, lr}
    adds r4, r0, #0
    adds r0, r1, #0
    bl GetId__C4Tool
    subs r0, #0x20
    cmp r0, #7
    bhi .L0802471C
    lsls r0, r0, #2
    ldr r1, .L080246D8 @ =.L080246DC
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L080246D8: .4byte .L080246DC
.L080246DC: @ jump table
    .4byte .L080246FC @ case 0
    .4byte .L08024700 @ case 1
    .4byte .L08024704 @ case 2
    .4byte .L08024708 @ case 3
    .4byte .L0802470C @ case 4
    .4byte .L08024710 @ case 5
    .4byte .L08024710 @ case 6
    .4byte .L08024714 @ case 7
.L080246FC:
    movs r0, #0
    b .L08024716
.L08024700:
    movs r0, #1
    b .L08024716
.L08024704:
    movs r0, #2
    b .L08024716
.L08024708:
    movs r0, #3
    b .L08024716
.L0802470C:
    movs r0, #4
    b .L08024716
.L08024710:
    movs r0, #5
    b .L08024716
.L08024714:
    movs r0, #6
.L08024716:
    cmp r0, r4
    bls .L0802471C
    adds r4, r0, #0
.L0802471C:
    adds r0, r4, #0
    pop {r4}
    pop {r1}
    bx r1

    thumb_func_start func_08024724
func_08024724: @ 0x08024724
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #0x5c
    adds r7, r0, #0
    str r1, [sp, #0x40]
    adds r6, r2, #0
    adds r0, r1, #0
    adds r1, r6, #0
    bl func_080AC070
    lsls r0, r0, #0x18
    lsrs r0, r0, #0x18
    cmp r0, #0
    bne .L08024748
    b .L0802495C
.L08024748:
    movs r0, #6
    ldrsh r4, [r6, r0]
    subs r0, r4, #1
    movs r1, #7
    ands r0, r1
    mvns r0, r0
    mov sb, r0
    mov r3, sb
    str r3, [sp, #0x44]
    ldrh r2, [r6, #2]
    adds r0, r1, #0
    ands r0, r2
    movs r2, #8
    subs r0, r2, r0
    str r0, [sp, #0x4c]
    str r0, [sp, #0x48]
    movs r0, #4
    ldrsh r5, [r6, r0]
    subs r0, r5, #1
    ands r0, r1
    mvns r0, r0
    mov r8, r0
    mov r3, r8
    str r3, [sp, #0x50]
    ldrh r0, [r6]
    ands r1, r0
    subs r2, r2, r1
    mov sl, r2
    mov r0, sl
    str r0, [sp, #0x54]
    movs r1, #0
    ldrsh r3, [r6, r1]
    movs r0, #2
    ldrsh r1, [r6, r0]
    mov r2, sp
    mov r0, sp
    strh r3, [r0]
    add r1, sb
    strh r1, [r2, #2]
    strh r5, [r2, #4]
    add r4, sb
    strh r4, [r2, #6]
    ldr r0, [sp, #0x40]
    mov r1, sp
    bl func_080AC070
    movs r1, #1
    eors r0, r1
    lsls r0, r0, #0x18
    lsrs r5, r0, #0x18
    cmp r5, #0
    beq .L080247BA
    movs r0, #0
    strh r0, [r7]
    mov r3, sb
    strh r3, [r7, #2]
    b .L08024960
.L080247BA:
    movs r0, #0
    ldrsh r3, [r6, r0]
    movs r1, #2
    ldrsh r0, [r6, r1]
    movs r1, #4
    ldrsh r4, [r6, r1]
    movs r1, #6
    ldrsh r2, [r6, r1]
    add r1, sp, #8
    strh r3, [r1]
    ldr r3, [sp, #0x4c]
    adds r0, r3, r0
    strh r0, [r1, #2]
    strh r4, [r1, #4]
    adds r2, r3, r2
    strh r2, [r1, #6]
    ldr r0, [sp, #0x40]
    bl func_080AC070
    movs r1, #1
    eors r0, r1
    lsls r0, r0, #0x18
    lsrs r0, r0, #0x18
    str r0, [sp, #0x58]
    cmp r0, #0
    beq .L080247F8
    strh r5, [r7]
    add r3, sp, #0x4c
    ldrh r3, [r3]
    strh r3, [r7, #2]
    b .L08024960
.L080247F8:
    movs r5, #0
    ldrsh r0, [r6, r5]
    movs r1, #2
    ldrsh r3, [r6, r1]
    movs r5, #4
    ldrsh r2, [r6, r5]
    movs r1, #6
    ldrsh r4, [r6, r1]
    add r1, sp, #0x10
    add r0, r8
    strh r0, [r1]
    strh r3, [r1, #2]
    add r2, r8
    strh r2, [r1, #4]
    strh r4, [r1, #6]
    ldr r0, [sp, #0x40]
    bl func_080AC070
    movs r3, #1
    eors r0, r3
    lsls r0, r0, #0x18
    lsrs r5, r0, #0x18
    cmp r5, #0
    beq .L08024832
    mov r5, r8
    strh r5, [r7]
    add r0, sp, #0x58
    ldrh r0, [r0]
    b .L0802495E
.L08024832:
    movs r1, #0
    ldrsh r0, [r6, r1]
    movs r1, #2
    ldrsh r3, [r6, r1]
    movs r1, #4
    ldrsh r2, [r6, r1]
    movs r1, #6
    ldrsh r4, [r6, r1]
    add r1, sp, #0x18
    add r0, sl
    strh r0, [r1]
    strh r3, [r1, #2]
    add r2, sl
    strh r2, [r1, #4]
    strh r4, [r1, #6]
    ldr r0, [sp, #0x40]
    bl func_080AC070
    movs r3, #1
    eors r0, r3
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08024868
    mov r0, sl
    strh r0, [r7]
    strh r5, [r7, #2]
    b .L08024960
.L08024868:
    movs r1, #0
    ldrsh r0, [r6, r1]
    movs r3, #2
    ldrsh r2, [r6, r3]
    movs r5, #4
    ldrsh r3, [r6, r5]
    movs r1, #6
    ldrsh r4, [r6, r1]
    add r1, sp, #0x20
    add r0, r8
    strh r0, [r1]
    add r2, sb
    strh r2, [r1, #2]
    add r3, r8
    strh r3, [r1, #4]
    add r4, sb
    strh r4, [r1, #6]
    ldr r0, [sp, #0x40]
    bl func_080AC070
    movs r3, #1
    eors r0, r3
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L080248A2
    mov r5, r8
    strh r5, [r7]
    mov r0, sb
    b .L0802495E
.L080248A2:
    movs r1, #0
    ldrsh r0, [r6, r1]
    movs r3, #2
    ldrsh r2, [r6, r3]
    movs r5, #4
    ldrsh r3, [r6, r5]
    movs r1, #6
    ldrsh r4, [r6, r1]
    add r1, sp, #0x28
    add r0, sl
    strh r0, [r1]
    ldr r5, [sp, #0x44]
    adds r2, r5, r2
    strh r2, [r1, #2]
    add r3, sl
    strh r3, [r1, #4]
    adds r4, r5, r4
    strh r4, [r1, #6]
    ldr r0, [sp, #0x40]
    bl func_080AC070
    movs r1, #1
    eors r0, r1
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L080248DE
    mov r3, sl
    strh r3, [r7]
    strh r5, [r7, #2]
    b .L08024960
.L080248DE:
    movs r1, #0
    ldrsh r0, [r6, r1]
    movs r3, #2
    ldrsh r2, [r6, r3]
    movs r5, #4
    ldrsh r3, [r6, r5]
    movs r1, #6
    ldrsh r4, [r6, r1]
    add r1, sp, #0x30
    ldr r5, [sp, #0x50]
    adds r0, r5, r0
    strh r0, [r1]
    ldr r0, [sp, #0x4c]
    adds r2, r0, r2
    strh r2, [r1, #2]
    adds r3, r5, r3
    strh r3, [r1, #4]
    adds r4, r0, r4
    strh r4, [r1, #6]
    ldr r0, [sp, #0x40]
    bl func_080AC070
    movs r1, #1
    eors r0, r1
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802491A
    strh r5, [r7]
    add r5, sp, #0x4c
    b .L08024956
.L0802491A:
    movs r1, #0
    ldrsh r0, [r6, r1]
    movs r3, #2
    ldrsh r2, [r6, r3]
    movs r5, #4
    ldrsh r3, [r6, r5]
    movs r1, #6
    ldrsh r4, [r6, r1]
    add r1, sp, #0x38
    ldr r5, [sp, #0x54]
    adds r0, r5, r0
    strh r0, [r1]
    ldr r0, [sp, #0x48]
    adds r2, r0, r2
    strh r2, [r1, #2]
    adds r3, r5, r3
    strh r3, [r1, #4]
    adds r4, r0, r4
    strh r4, [r1, #6]
    ldr r0, [sp, #0x40]
    bl func_080AC070
    movs r1, #1
    eors r0, r1
    lsls r0, r0, #0x18
    lsrs r0, r0, #0x18
    cmp r0, #0
    beq .L0802495C
    strh r5, [r7]
    add r5, sp, #0x48
.L08024956:
    ldrh r5, [r5]
    strh r5, [r7, #2]
    b .L08024960
.L0802495C:
    strh r0, [r7]
.L0802495E:
    strh r0, [r7, #2]
.L08024960:
    adds r0, r7, #0
    add sp, #0x5c
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_08024974
func_08024974: @ 0x08024974
    push {r4, r5, r6, r7, lr}
    adds r7, r0, #0
    adds r4, r2, #0
    bl func_0802B908
    ldr r0, .L08024A70 @ =vtable_unk_080E6658
    str r0, [r7, #0x14]
    str r4, [r7, #0x34]
    ldr r0, .L08024A74 @ =0x00001BD8
    adds r4, r4, r0
    str r4, [r7, #0x38]
    adds r0, r7, #0
    adds r0, #0x3c
    movs r4, #0
    strb r4, [r0]
    adds r0, #1
    strb r4, [r0]
    adds r0, #1
    strb r4, [r0]
    adds r1, r7, #0
    adds r1, #0x3f
    movs r0, #0xf
    strb r0, [r1]
    adds r0, r7, #0
    adds r0, #0x40
    strb r4, [r0]
    adds r0, #1
    strb r4, [r0]
    adds r0, #1
    strb r4, [r0]
    adds r0, #2
    movs r5, #0
    strh r4, [r0]
    adds r6, r7, #0
    adds r6, #0x60
    ldr r0, .L08024A78 @ =gUnk_080F0E80
    str r0, [r7, #0x60]
    strh r4, [r6, #4]
    adds r0, r7, #0
    adds r0, #0x68
    bl __12RucksackItem
    strb r5, [r6, #0xc]
    strb r5, [r6, #0xd]
    movs r0, #0x3b
    str r0, [r6, #0x10]
    strb r5, [r6, #0x14]
    adds r0, r7, #0
    adds r0, #0x78
    strb r5, [r0]
    adds r0, #1
    strb r5, [r0]
    adds r0, #1
    strb r5, [r0]
    adds r1, r7, #0
    adds r1, #0x7c
    ldr r0, .L08024A7C @ =0x0000FFFF
    strh r0, [r1]
    adds r0, r7, #0
    adds r0, #0x80
    str r4, [r0]
    adds r0, #8
    strb r5, [r0]
    strb r5, [r0, #1]
    str r4, [r0, #4]
    str r4, [r0, #8]
    str r4, [r0, #0xc]
    str r4, [r0, #0x10]
    str r4, [r0, #0x14]
    str r4, [r0, #0x18]
    adds r1, #0x28
    movs r0, #1
    strb r0, [r1]
    adds r0, r7, #0
    adds r0, #0xa6
    strh r4, [r0]
    adds r0, #2
    movs r1, #1
    rsbs r1, r1, #0
    str r1, [r0]
    adds r0, #4
    str r1, [r0]
    adds r0, #4
    strb r5, [r0]
    adds r0, #1
    strb r5, [r0]
    adds r1, r7, #0
    adds r1, #0xb2
    movs r0, #0x64
    strb r0, [r1]
    adds r0, r7, #0
    adds r0, #0xb3
    strb r5, [r0]
    adds r0, #1
    strb r5, [r0]
    adds r0, #0xc
    strb r5, [r0]
    adds r0, #1
    strb r5, [r0]
    adds r0, #1
    strb r5, [r0]
    adds r0, #1
    strb r5, [r0]
    adds r0, #1
    strb r5, [r0]
    adds r0, #1
    strb r5, [r0]
    adds r0, r7, #0
    bl func_0802C2DC
    adds r0, r7, #0
    bl func_0802D158
    lsls r0, r0, #0x10
    lsrs r1, r0, #0x10
    ldrh r0, [r7, #0x22]
    cmp r0, r1
    beq .L08024A66
    adds r0, r7, #0
    bl SetAnim__12AActorEntityUi
.L08024A66:
    adds r0, r7, #0
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    .align 2, 0
.L08024A70: .4byte vtable_unk_080E6658
.L08024A74: .4byte 0x00001BD8
.L08024A78: .4byte gUnk_080F0E80
.L08024A7C: .4byte 0x0000FFFF

    thumb_func_start func_08024A80
func_08024A80: @ 0x08024A80
    push {r4, r5, r6, r7, lr}
    sub sp, #0xc
    adds r5, r0, #0
    adds r7, r1, #0
    ldr r0, .L08024AC4 @ =vtable_unk_080E6658
    str r0, [r5, #0x14]
    ldr r4, [r5, #0x38]
    mov r0, sp
    adds r1, r5, #0
    bl GetLocation__C12AActorEntity
    adds r0, r4, #0
    mov r1, sp
    bl func_0800EB34
    ldr r0, [r5, #0x38]
    adds r6, r0, #0
    adds r6, #0x54
    adds r0, r6, #0
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08024B6A
    adds r0, r6, #0
    bl func_0800F204
    cmp r0, #5
    bhi .L08024B6A
    lsls r0, r0, #2
    ldr r1, .L08024AC8 @ =.L08024ACC
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L08024AC4: .4byte vtable_unk_080E6658
.L08024AC8: .4byte .L08024ACC
.L08024ACC: @ jump table
    .4byte .L08024B6A @ case 0
    .4byte .L08024AE4 @ case 1
    .4byte .L08024B18 @ case 2
    .4byte .L08024B24 @ case 3
    .4byte .L08024B52 @ case 4
    .4byte .L08024B6A @ case 5
.L08024AE4:
    adds r0, r6, #0
    bl func_0800F258
    adds r1, r0, #0
    add r0, sp, #8
    strb r1, [r0]
    bl GetId__C7Article
    cmp r0, #0x35
    bne .L08024B6A
    ldr r4, [r5, #0x34]
    ldr r0, .L08024B14 @ =0x00001CCC
    adds r4, r4, r0
    mov r0, sp
    adds r1, r5, #0
    bl GetLocation__C7AEntity
    adds r0, r4, #0
    mov r1, sp
    movs r2, #6
    bl memcpy
    b .L08024B6A
    .align 2, 0
.L08024B14: .4byte 0x00001CCC
.L08024B18:
    ldr r4, [r5, #0x34]
    ldr r0, .L08024B20 @ =0x00001C70
    adds r4, r4, r0
    b .L08024B40
    .align 2, 0
.L08024B20: .4byte 0x00001C70
.L08024B24:
    ldr r4, [r5, #0x34]
    movs r0, #0x82
    lsls r0, r0, #3
    adds r4, r4, r0
    adds r0, r6, #0
    bl func_0800F344
    adds r1, r0, #0
    adds r0, r4, #0
    bl GetChicken__4CoopUi
    adds r4, r0, #0
    cmp r4, #0
    beq .L08024B6A
.L08024B40:
    mov r0, sp
    adds r1, r5, #0
    bl GetLocation__C12AActorEntity
    adds r0, r4, #0
    mov r1, sp
    bl SetLocation__5ActorRC13ActorLocation
    b .L08024B6A
.L08024B52:
    ldr r4, [r5, #0x34]
    movs r0, #0xe5
    lsls r0, r0, #5
    adds r4, r4, r0
    mov r0, sp
    adds r1, r5, #0
    bl GetLocation__C7AEntity
    adds r0, r4, #0
    mov r1, sp
    bl func_08010014
.L08024B6A:
    ldr r0, .L08024B98 @ =__vt_7AEntity
    str r0, [r5, #0x14]
    ldr r1, [r5, #0x10]
    cmp r1, #0
    beq .L08024B80
    ldr r0, [r1, #4]
    ldr r2, [r0, #8]
    adds r0, r1, #0
    movs r1, #3
    bl _call_via_r2
.L08024B80:
    movs r0, #1
    ands r0, r7
    cmp r0, #0
    beq .L08024B8E
    adds r0, r5, #0
    bl __builtin_delete
.L08024B8E:
    add sp, #0xc
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08024B98: .4byte __vt_7AEntity

    thumb_func_start func_08024B9C
func_08024B9C: @ 0x08024B9C
    push {r4, r5, lr}
    adds r4, r0, #0
    movs r5, #2
    ldrh r0, [r4, #4]
    cmp r0, #0x13
    bne .L08024BCA
    ldr r1, [r4, #0x34]
    ldr r2, .L08024BE4 @ =0x00002171
    adds r0, r1, r2
    ldrb r0, [r0]
    lsls r0, r0, #0x1b
    lsrs r0, r0, #0x1e
    cmp r0, #1
    beq .L08024BC8
    subs r2, #0x25
    adds r0, r1, r2
    movs r1, #0x4a
    bl func_0809C694
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08024BCA
.L08024BC8:
    movs r5, #1
.L08024BCA:
    adds r0, r4, #0
    adds r0, #0x21
    strb r5, [r0]
    movs r0, #0xa1
    lsls r0, r0, #2
    bl __builtin_new
    adds r1, r4, #0
    bl func_0802B260
    pop {r4, r5}
    pop {r1}
    bx r1
    .align 2, 0
.L08024BE4: .4byte 0x00002171

    thumb_func_start func_08024BE8
func_08024BE8: @ 0x08024BE8
    push {r4, lr}
    adds r4, r0, #0
    bl vfunc_10__7AEntity
    adds r0, r4, #0
    bl func_0802A588
    pop {r4}
    pop {r0}
    bx r0

    thumb_func_start func_08024BFC
func_08024BFC: @ 0x08024BFC
    push {r4, r5, lr}
    sub sp, #0x10
    adds r5, r0, #0
    adds r4, r1, #0
    ldr r0, [r4, #0x14]
    ldr r1, [r0, #0x40]
    adds r0, r4, #0
    bl _call_via_r1
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08024C38
    movs r0, #0xa
    ldrsh r1, [r4, r0]
    movs r0, #0xe
    ldrsh r2, [r4, r0]
    mov r4, sp
    subs r3, r1, #7
    mov r0, sp
    strh r3, [r0]
    adds r0, r2, #0
    subs r0, #9
    strh r0, [r4, #2]
    adds r1, #7
    strh r1, [r4, #4]
    adds r2, #5
    strh r2, [r4, #6]
    ldr r0, [sp]
    ldr r1, [sp, #4]
    b .L08024C44
.L08024C38:
    add r0, sp, #8
    adds r1, r4, #0
    bl func_0803240C
    ldr r0, [sp, #8]
    ldr r1, [sp, #0xc]
.L08024C44:
    str r0, [r5]
    str r1, [r5, #4]
    adds r0, r5, #0
    add sp, #0x10
    pop {r4, r5}
    pop {r2}
    bx r2
    .align 2, 0

    thumb_func_start func_08024C54
func_08024C54: @ 0x08024C54
    push {lr}
    movs r1, #1
    strb r1, [r0, #6]
    bl func_080323C8
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_08024C64
func_08024C64: @ 0x08024C64
    push {lr}
    movs r1, #0
    strb r1, [r0, #6]
    bl func_080323C8
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_08024C74
func_08024C74: @ 0x08024C74
    adds r2, r0, #0
    adds r0, #0x3c
    movs r1, #0
    strb r1, [r0]
    adds r0, #2
    strb r1, [r0]
    adds r0, #0x68
    strh r1, [r0]
    bx lr
    .align 2, 0

    thumb_func_start func_08024C88
func_08024C88: @ 0x08024C88
    adds r2, r0, #0
    adds r2, #0x3c
    movs r1, #8
    strb r1, [r2]
    adds r0, #0x3d
    movs r1, #0xff
    strb r1, [r0]
    bx lr

    thumb_func_start func_08024C98
func_08024C98: @ 0x08024C98
    adds r0, #0x3c
    movs r1, #0
    strb r1, [r0]
    bx lr

    thumb_func_start func_08024CA0
func_08024CA0: @ 0x08024CA0
    push {r4, lr}
    adds r4, r0, #0
    ldr r0, [r4, #0x14]
    ldr r1, [r0, #0x28]
    adds r0, r4, #0
    @ 08024CAA bl [vfunc_28__C7AEntity]
    bl _call_via_r1
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08024CC6
    adds r0, r4, #0
    adds r0, #0x3c
    ldrb r0, [r0]
    cmp r0, #0x2a
    bgt .L08024CC6
    cmp r0, #0x24
    blt .L08024CC6
    movs r0, #1
    b .L08024CC8
.L08024CC6:
    movs r0, #0
.L08024CC8:
    pop {r4}
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_08024CD0
func_08024CD0: @ 0x08024CD0
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #0x60
    adds r5, r0, #0
    mov sl, r1
    ldr r1, [r1]
    mov r0, sl
    ldrb r2, [r0, #4]
    adds r0, r5, #0
    bl func_0802F0EC
    adds r0, r5, #0
    bl func_0802CDCC
    adds r0, r5, #0
    bl func_0802D158
    lsls r0, r0, #0x10
    lsrs r1, r0, #0x10
    ldrh r0, [r5, #0x22]
    cmp r0, r1
    beq .L08024D08
    adds r0, r5, #0
    bl SetAnim__12AActorEntityUi
.L08024D08:
    ldrh r0, [r5, #0x24]
    cmp r0, #0
    beq .L08024D12
    subs r0, #1
    b .L08024D14
.L08024D12:
    ldrh r0, [r5, #0x26]
.L08024D14:
    strh r0, [r5, #0x24]
    ldr r2, [r5, #0x10]
    cmp r2, #0
    beq .L08024D26
    ldr r0, [r2, #4]
    ldr r1, [r0, #0xc]
    adds r0, r2, #0
    @ 08024D22 bl [func_0802B3B4]
    bl _call_via_r1
.L08024D26:
    ldr r0, [r5, #0x18]
    cmp r0, #0
    bne .L08024D34
    ldr r0, [r5, #0x1c]
    cmp r0, #0
    bne .L08024D34
    b .L08024F7E
.L08024D34:
    adds r0, r5, #0
    adds r0, #0x3c
    ldrb r0, [r0]
    cmp r0, #0x35
    bne .L08024D40
    b .L08024F7E
.L08024D40:
    ldr r1, [r5, #0x14]
    add r0, sp, #0x20
    ldr r2, [r1, #0xc]
    adds r1, r5, #0
    @ 08024D48 bl [func_08024BFC]
    bl _call_via_r2
    ldr r0, [sp, #0x20]
    ldr r1, [sp, #0x24]
    str r0, [sp, #0x28]
    str r1, [sp, #0x2c]
    add r3, sp, #0x28
    movs r0, #0
    str r0, [sp]
    adds r0, r5, #0
    adds r0, #0x20
    ldrb r0, [r0]
    cmp r0, #1
    beq .L08024DD2
    cmp r0, #1
    bgt .L08024D6E
    cmp r0, #0
    beq .L08024D7A
    b .L08024EEE
.L08024D6E:
    cmp r0, #2
    beq .L08024E22
    cmp r0, #3
    bne .L08024D78
    b .L08024E94
.L08024D78:
    b .L08024EEE
.L08024D7A:
    movs r1, #0
    ldrsh r0, [r3, r1]
    movs r2, #6
    ldrsh r1, [r3, r2]
    add r2, sp, #0x30
    subs r1, #1
    strh r0, [r2]
    strh r1, [r2, #2]
    ldr r0, [sp]
    cmp r0, #3
    bhi .L08024DA6
    lsls r0, r0, #2
    adds r0, #4
    mov r7, sp
    adds r1, r7, r0
    cmp r1, #0
    beq .L08024DA0
    ldr r0, [sp, #0x30]
    str r0, [r1]
.L08024DA0:
    ldr r0, [sp]
    adds r0, #1
    str r0, [sp]
.L08024DA6:
    movs r1, #4
    ldrsh r0, [r3, r1]
    movs r2, #6
    ldrsh r1, [r3, r2]
    add r2, sp, #0x34
    subs r0, #1
    subs r1, #1
    strh r0, [r2]
    strh r1, [r2, #2]
    ldr r0, [sp]
    cmp r0, #3
    bls .L08024DC0
    b .L08024EEE
.L08024DC0:
    lsls r0, r0, #2
    adds r0, #4
    mov r7, sp
    adds r1, r7, r0
    cmp r1, #0
    bne .L08024DCE
    b .L08024EE8
.L08024DCE:
    ldr r0, [sp, #0x34]
    b .L08024EE6
.L08024DD2:
    movs r1, #0
    ldrsh r0, [r3, r1]
    movs r7, #2
    ldrsh r2, [r3, r7]
    add r1, sp, #0x38
    strh r0, [r1]
    strh r2, [r1, #2]
    ldr r0, [sp]
    cmp r0, #3
    bhi .L08024DFC
    lsls r0, r0, #2
    adds r0, #4
    mov r2, sp
    adds r1, r2, r0
    cmp r1, #0
    beq .L08024DF6
    ldr r0, [sp, #0x38]
    str r0, [r1]
.L08024DF6:
    ldr r0, [sp]
    adds r0, #1
    str r0, [sp]
.L08024DFC:
    movs r7, #4
    ldrsh r0, [r3, r7]
    movs r1, #2
    ldrsh r2, [r3, r1]
    add r1, sp, #0x3c
    subs r0, #1
    strh r0, [r1]
    strh r2, [r1, #2]
    ldr r0, [sp]
    cmp r0, #3
    bhi .L08024EEE
    lsls r0, r0, #2
    adds r0, #4
    mov r2, sp
    adds r1, r2, r0
    cmp r1, #0
    beq .L08024EE8
    ldr r0, [sp, #0x3c]
    b .L08024EE6
.L08024E22:
    movs r7, #0
    ldrsh r0, [r3, r7]
    movs r1, #2
    ldrsh r2, [r3, r1]
    add r1, sp, #0x40
    strh r0, [r1]
    strh r2, [r1, #2]
    ldr r0, [sp]
    cmp r0, #3
    bhi .L08024E4C
    lsls r0, r0, #2
    adds r0, #4
    mov r2, sp
    adds r1, r2, r0
    cmp r1, #0
    beq .L08024E46
    ldr r0, [sp, #0x40]
    str r0, [r1]
.L08024E46:
    ldr r0, [sp]
    adds r0, #1
    str r0, [sp]
.L08024E4C:
    movs r7, #0
    ldrsh r0, [r3, r7]
    movs r2, #6
    ldrsh r1, [r3, r2]
    add r2, sp, #0x44
    subs r1, #1
    strh r0, [r2]
    strh r1, [r2, #2]
    ldr r0, [sp]
    cmp r0, #3
    bhi .L08024EEE
    lsls r0, r0, #2
    adds r0, #4
    mov r7, sp
    adds r1, r7, r0
    cmp r1, #0
    beq .L08024EE8
    ldr r0, [sp, #0x44]
    b .L08024EE6
.L08024E72:
    mov r0, r8
    ldr r2, [r0]
    movs r7, #0xa0
    lsls r7, r7, #1
    adds r2, r2, r7
    lsls r0, r1, #0xf
    lsrs r0, r0, #0x11
    add r1, sp, #0x50
    movs r3, #0
    str r0, [sp, #0x50]
    str r3, [r1, #4]
    ldr r3, [r2]
    mov r0, r8
    movs r2, #0
    @ 08024E8E bl [func_0801D9A8]
    bl _call_via_r3
    b .L08024F68
.L08024E94:
    movs r1, #4
    ldrsh r0, [r3, r1]
    movs r7, #2
    ldrsh r2, [r3, r7]
    add r1, sp, #0x48
    subs r0, #1
    strh r0, [r1]
    strh r2, [r1, #2]
    ldr r0, [sp]
    cmp r0, #3
    bhi .L08024EC0
    lsls r0, r0, #2
    adds r0, #4
    mov r2, sp
    adds r1, r2, r0
    cmp r1, #0
    beq .L08024EBA
    ldr r0, [sp, #0x48]
    str r0, [r1]
.L08024EBA:
    ldr r0, [sp]
    adds r0, #1
    str r0, [sp]
.L08024EC0:
    movs r7, #4
    ldrsh r0, [r3, r7]
    movs r2, #6
    ldrsh r1, [r3, r2]
    add r2, sp, #0x4c
    subs r0, #1
    subs r1, #1
    strh r0, [r2]
    strh r1, [r2, #2]
    ldr r0, [sp]
    cmp r0, #3
    bhi .L08024EEE
    lsls r0, r0, #2
    adds r0, #4
    mov r7, sp
    adds r1, r7, r0
    cmp r1, #0
    beq .L08024EE8
    ldr r0, [sp, #0x4c]
.L08024EE6:
    str r0, [r1]
.L08024EE8:
    ldr r0, [sp]
    adds r0, #1
    str r0, [sp]
.L08024EEE:
    ldrh r2, [r5, #4]
    ldr r0, [r5]
    mov r8, r0
    add r4, sp, #0x14
    ldr r1, [r0]
    adds r0, r4, #0
    ldr r3, [r1, #0x34]
    mov r1, r8
    @ 08024EFE bl [func_0801A054]
    bl _call_via_r3
    mov ip, r4
    movs r6, #0
    ldr r0, [sp]
    add r1, sp, #4
    mov sb, r1
    cmp r6, r0
    bhs .L08024F68
    ldr r3, [sp, #0x14]
    ldrh r2, [r4, #8]
    str r2, [sp, #0x5c]
    mov r4, sb
.L08024F18:
    ldrh r0, [r4]
    lsls r0, r0, #0x10
    asrs r2, r0, #0x13
    ldrh r0, [r4, #2]
    lsls r0, r0, #0x10
    asrs r0, r0, #0x13
    cmp r3, #0
    beq .L08024F4E
    ldr r7, [sp, #0x5c]
    cmp r2, r7
    bhi .L08024F4E
    mov r1, ip
    ldrh r1, [r1, #0xa]
    cmp r0, r1
    bhi .L08024F4E
    mov r7, ip
    ldr r1, [r7, #4]
    ldr r7, [sp, #0x5c]
    muls r0, r7, r0
    adds r0, r0, r2
    cmp r1, #0
    beq .L08024F48
    adds r0, r1, r0
    ldrb r0, [r0]
.L08024F48:
    lsls r0, r0, #2
    adds r0, r3, r0
    b .L08024F50
.L08024F4E:
    movs r0, #0
.L08024F50:
    cmp r0, #0
    beq .L08024F5E
    ldr r1, [r0]
    ldr r0, .L0802500C @ =0x0001FFFC
    ands r0, r1
    cmp r0, #0
    bne .L08024E72
.L08024F5E:
    adds r4, #4
    adds r6, #1
    ldr r0, [sp]
    cmp r6, r0
    blo .L08024F18
.L08024F68:
    ldr r0, [sp]
    lsls r0, r0, #2
    adds r0, #4
    mov r2, sp
    adds r1, r2, r0
    mov r0, sb
    cmp r0, r1
    beq .L08024F7E
.L08024F78:
    adds r0, #4
    cmp r0, r1
    bne .L08024F78
.L08024F7E:
    mov r7, sl
    ldrb r0, [r7, #4]
    cmp r0, #0
    beq .L08024FFC
    ldr r0, [r5, #0x34]
    ldr r1, .L08025010 @ =0x00001C34
    adds r4, r0, r1
    adds r0, r4, #0
    bl IsEmpty__C9ToolStack
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08024FBA
    adds r0, r4, #0
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    add r0, sp, #0x58
    strb r1, [r0]
    bl GetId__C4Tool
    cmp r0, #0x4e
    bne .L08024FBA
    ldr r0, [r5, #0x14]
    ldr r3, [r0, #0x64]
    adds r0, r5, #0
    movs r1, #1
    movs r2, #0
    bl _call_via_r3
.L08024FBA:
    adds r0, r4, #0
    bl IsEmpty__C9ToolStack
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08024FFC
    adds r0, r4, #0
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    mov r0, sp
    adds r0, #0x59
    strb r1, [r0]
    bl GetId__C4Tool
    cmp r0, #0x4f
    bne .L08024FFC
    ldr r0, [r5, #0x34]
    ldr r2, .L08025014 @ =0x00001BD8
    adds r0, r0, r2
    bl func_0800EE2C
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08024FFC
    ldr r0, [r5, #0x14]
    movs r2, #1
    rsbs r2, r2, #0
    ldr r3, [r0, #0x64]
    adds r0, r5, #0
    movs r1, #0
    bl _call_via_r3
.L08024FFC:
    add sp, #0x60
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L0802500C: .4byte 0x0001FFFC
.L08025010: .4byte 0x00001C34
.L08025014: .4byte 0x00001BD8

    thumb_func_start func_08025018
func_08025018: @ 0x08025018
    push {r4, r5, lr}
    adds r4, r0, #0
    adds r5, r1, #0
    adds r1, r4, #0
    adds r1, #0xc1
    movs r0, #0
    strb r0, [r1]
    adds r0, r4, #0
    adds r0, #0xc2
    ldrb r0, [r0]
    cmp r0, #0
    bne .L08025062
    adds r0, r4, #0
    adds r0, #0xc0
    ldrb r0, [r0]
    cmp r0, #0
    beq .L0802505A
    adds r0, r4, #0
    movs r1, #0
    movs r2, #0
    bl func_0802F0EC
    adds r0, r4, #0
    bl func_0802D158
    lsls r0, r0, #0x10
    lsrs r1, r0, #0x10
    ldrh r0, [r4, #0x22]
    cmp r0, r1
    beq .L0802505A
    adds r0, r4, #0
    bl SetAnim__12AActorEntityUi
.L0802505A:
    adds r0, r4, #0
    adds r1, r5, #0
    bl func_0803242C
.L08025062:
    pop {r4, r5}
    pop {r0}
    bx r0

    thumb_func_start func_08025068
func_08025068: @ 0x08025068
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #4
    adds r5, r0, #0
    adds r4, r1, #0
    str r2, [sp]
    ldr r0, [r5, #0x34]
    ldr r1, .L080250F0 @ =0x000034C4
    adds r0, r0, r1
    ldrb r0, [r0]
    cmp r0, #0
    beq .L08025088
    b .L080251E8
.L08025088:
    ldr r1, [r5, #0x10]
    cmp r1, #0
    beq .L08025096
    ldr r0, .L080250F4 @ =0x00000281
    adds r1, r1, r0
    movs r0, #1
    strb r0, [r1]
.L08025096:
    ldr r0, [r5, #0x38]
    bl func_0800E4F0
    mov sl, r0
    ldr r0, [r5, #0x38]
    bl func_0800E51C
    mov r8, r0
    ldr r0, [r5, #0x38]
    adds r1, r4, #0
    bl func_0800E9E4
    ldr r0, [r5, #0x38]
    bl func_0800E4F0
    adds r6, r0, #0
    ldr r0, [r5, #0x38]
    bl func_0800E4FC
    mov sb, r0
    ldr r0, [r5, #0x38]
    ldr r1, [sp]
    bl func_0800EA68
    ldr r0, [r5, #0x38]
    bl func_0800E4FC
    adds r7, r0, #0
    cmp r4, #0
    bgt .L080250D8
    ldr r1, [sp]
    cmp r1, #0
    bge .L08025158
.L080250D8:
    adds r1, r5, #0
    adds r1, #0xc3
    ldrb r0, [r1]
    subs r0, #0x24
    adds r4, r1, #0
    cmp r0, #6
    bhi .L08025158
    lsls r0, r0, #2
    ldr r1, .L080250F8 @ =.L080250FC
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L080250F0: .4byte 0x000034C4
.L080250F4: .4byte 0x00000281
.L080250F8: .4byte .L080250FC
.L080250FC: @ jump table
    .4byte .L08025118 @ case 0
    .4byte .L08025122 @ case 1
    .4byte .L08025130 @ case 2
    .4byte .L0802513E @ case 3
    .4byte .L08025144 @ case 4
    .4byte .L0802514A @ case 5
    .4byte .L08025150 @ case 6
.L08025118:
    mov r1, r8
    lsrs r0, r1, #1
    cmp r6, r0
    bls .L08025158
    b .L08025154
.L08025122:
    mov r0, r8
    movs r1, #5
    bl __udivsi3
    cmp r6, r0
    bls .L08025158
    b .L08025154
.L08025130:
    mov r0, r8
    movs r1, #0x14
    bl __udivsi3
    cmp r6, r0
    bls .L08025158
    b .L08025154
.L0802513E:
    cmp r6, #0
    beq .L08025158
    b .L08025154
.L08025144:
    cmp r7, #0x31
    bhi .L08025158
    b .L08025154
.L0802514A:
    cmp r7, #0x4f
    bhi .L08025158
    b .L08025154
.L08025150:
    cmp r7, #0x64
    beq .L08025158
.L08025154:
    movs r0, #0
    strb r0, [r4]
.L08025158:
    mov r0, sb
    cmp r0, #0x64
    beq .L0802516E
    cmp r7, #0x64
    bne .L0802516E
    adds r1, r5, #0
    adds r1, #0xc3
    movs r0, #0x2a
    strb r0, [r1]
    movs r0, #1
    b .L080251EA
.L0802516E:
    mov r1, sb
    cmp r1, #0x4f
    bhi .L08025180
    cmp r7, #0x4f
    bls .L08025180
    adds r1, r5, #0
    adds r1, #0xc3
    movs r0, #0x29
    b .L080251E6
.L08025180:
    mov r0, sb
    cmp r0, #0x31
    bhi .L08025192
    cmp r7, #0x31
    bls .L08025192
    adds r1, r5, #0
    adds r1, #0xc3
    movs r0, #0x28
    b .L080251E6
.L08025192:
    mov r1, sl
    cmp r1, #0
    beq .L080251A4
    cmp r6, #0
    bne .L080251A4
    adds r1, r5, #0
    adds r1, #0xc3
    movs r0, #0x27
    b .L080251E6
.L080251A4:
    mov r0, r8
    movs r1, #0x14
    bl __udivsi3
    cmp sl, r0
    bls .L080251BC
    cmp r6, r0
    bhi .L080251BC
    adds r1, r5, #0
    adds r1, #0xc3
    movs r0, #0x26
    b .L080251E6
.L080251BC:
    mov r0, r8
    movs r1, #5
    bl __udivsi3
    cmp sl, r0
    bls .L080251D4
    cmp r6, r0
    bhi .L080251D4
    adds r1, r5, #0
    adds r1, #0xc3
    movs r0, #0x25
    b .L080251E6
.L080251D4:
    mov r1, r8
    lsrs r0, r1, #1
    cmp sl, r0
    bls .L080251E8
    cmp r6, r0
    bhi .L080251E8
    adds r1, r5, #0
    adds r1, #0xc3
    movs r0, #0x24
.L080251E6:
    strb r0, [r1]
.L080251E8:
    movs r0, #0
.L080251EA:
    add sp, #4
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_080251FC
func_080251FC: @ 0x080251FC
    push {r4, r5, r6, r7, lr}
    mov r7, r8
    push {r7}
    sub sp, #8
    mov r8, r1
    adds r6, r3, #0
    ldr r7, [sp, #0x20]
    ldr r0, [r2]
    ldr r1, [r2, #4]
    str r0, [sp]
    str r1, [sp, #4]
    movs r5, #1
    cmp r5, r7
    bhi .L0802523A
    mov r4, sp
.L0802521A:
    ldrh r0, [r4]
    adds r0, r0, r6
    strh r0, [r4]
    ldrh r0, [r4, #4]
    adds r0, r0, r6
    strh r0, [r4, #4]
    mov r0, r8
    mov r1, sp
    bl func_080AC070
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802523A
    adds r5, #1
    cmp r5, r7
    bls .L0802521A
.L0802523A:
    adds r0, r5, #0
    add sp, #8
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1

    thumb_func_start func_08025248
func_08025248: @ 0x08025248
    push {r4, r5, r6, r7, lr}
    mov r7, r8
    push {r7}
    sub sp, #8
    mov r8, r1
    adds r6, r3, #0
    ldr r7, [sp, #0x20]
    ldr r0, [r2]
    ldr r1, [r2, #4]
    str r0, [sp]
    str r1, [sp, #4]
    movs r5, #1
    cmp r5, r7
    bhi .L08025286
    mov r4, sp
.L08025266:
    ldrh r0, [r4, #2]
    adds r0, r0, r6
    strh r0, [r4, #2]
    ldrh r0, [r4, #6]
    adds r0, r0, r6
    strh r0, [r4, #6]
    mov r0, r8
    mov r1, sp
    bl func_080AC070
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08025286
    adds r5, #1
    cmp r5, r7
    bls .L08025266
.L08025286:
    adds r0, r5, #0
    add sp, #8
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1

    thumb_func_start func_08025294
func_08025294: @ 0x08025294
    push {r4, r5, r6, r7, lr}
    sub sp, #0x28
    mov ip, r1
    adds r7, r2, #0
    mov r4, sp
    movs r1, #0x88
    lsls r1, r1, #1
    subs r2, r1, #1
    mov r0, sp
    strh r2, [r0]
    movs r2, #0xaf
    strh r2, [r4, #2]
    ldr r0, .L080252F0 @ =0x000002B1
    adds r1, r1, r0
    strh r1, [r4, #4]
    subs r0, #0x70
    strh r0, [r4, #6]
    mov r0, sp
    movs r1, #0
    ldrsh r0, [r0, r1]
    movs r6, #4
    ldrsh r5, [r3, r6]
    subs r0, r0, r5
    movs r1, #0
    ldrsh r4, [r3, r1]
    ldr r6, .L080252F4 @ =0xFFFFFC3F
    adds r1, r4, r6
    ands r0, r1
    movs r1, #6
    ldrsh r6, [r3, r1]
    subs r2, r2, r6
    ands r0, r2
    movs r2, #2
    ldrsh r3, [r3, r2]
    ldr r2, .L080252F8 @ =0xFFFFFDBF
    adds r1, r3, r2
    ands r0, r1
    cmp r0, #0
    bge .L08025360
    cmp r7, #1
    beq .L0802531A
    cmp r7, #1
    bgt .L080252FC
    cmp r7, #0
    beq .L08025306
    b .L08025360
    .align 2, 0
.L080252F0: .4byte 0x000002B1
.L080252F4: .4byte 0xFFFFFC3F
.L080252F8: .4byte 0xFFFFFDBF
.L080252FC:
    cmp r7, #2
    beq .L08025330
    cmp r7, #3
    beq .L0802533A
    b .L08025360
.L08025306:
    subs r2, r6, r3
    adds r2, #0x10
    add r1, sp, #8
    strh r4, [r1]
    adds r0, r2, r3
    strh r0, [r1, #2]
    strh r5, [r1, #4]
    adds r2, r2, r6
    strh r2, [r1, #6]
    b .L0802534C
.L0802531A:
    subs r0, r6, r3
    adds r0, #0x10
    rsbs r0, r0, #0
    add r1, sp, #0x10
    strh r4, [r1]
    adds r2, r0, r3
    strh r2, [r1, #2]
    strh r5, [r1, #4]
    adds r0, r0, r6
    strh r0, [r1, #6]
    b .L0802534C
.L08025330:
    subs r0, r5, r4
    adds r0, #0x10
    rsbs r0, r0, #0
    add r1, sp, #0x18
    b .L08025340
.L0802533A:
    subs r0, r5, r4
    adds r0, #0x10
    add r1, sp, #0x20
.L08025340:
    adds r2, r0, r4
    strh r2, [r1]
    strh r3, [r1, #2]
    adds r0, r0, r5
    strh r0, [r1, #4]
    strh r6, [r1, #6]
.L0802534C:
    mov r0, ip
    bl func_080AC070
    movs r1, #1
    eors r0, r1
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08025360
    movs r0, #1
    b .L08025362
.L08025360:
    movs r0, #0
.L08025362:
    add sp, #0x28
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_0802536C
func_0802536C: @ 0x0802536C
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #0x5c
    mov sb, r0
    mov r8, r1
    str r2, [sp, #0x4c]
    ldrh r0, [r0, #4]
    str r0, [sp, #0x50]
    mov r2, sb
    ldr r1, [r2]
    ldr r2, [r1]
    add r0, sp, #8
    ldr r3, [r2, #0x34]
    ldr r2, [sp, #0x50]
    bl _call_via_r3
    add r5, sp, #8
    mov sl, r5
    mov r0, sb
    movs r1, #0xa
    ldrsh r0, [r0, r1]
    str r0, [sp, #0x54]
    mov r2, sb
    movs r5, #0xe
    ldrsh r2, [r2, r5]
    str r2, [sp, #0x58]
    mov r0, sb
    ldr r1, [r0, #0x14]
    add r4, sp, #0x14
    adds r0, r4, #0
    ldr r2, [r1, #0xc]
    mov r1, sb
    bl _call_via_r2
    adds r6, r4, #0
    mov r1, r8
    cmp r1, #1
    beq .L08025404
    cmp r1, #1
    bgt .L080253C8
    cmp r1, #0
    beq .L080253D4
    b .L080257C0
.L080253C8:
    mov r2, r8
    cmp r2, #2
    beq .L08025436
    cmp r2, #3
    beq .L0802545E
    b .L080257C0
.L080253D4:
    ldr r0, [sp, #0x4c]
    str r0, [sp, #0x1c]
    add r2, sp, #0x1c
    mov r5, r8
    str r5, [sp]
    str r5, [sp, #4]
    add r0, sp, #8
    adds r1, r6, #0
    movs r3, #0
    bl func_080AC124
    ldr r1, [sp, #0x1c]
    cmp r1, #0
    beq .L0802549C
    ldr r0, [sp, #0x58]
    adds r0, r0, r1
    str r0, [sp, #0x58]
    ldrh r0, [r6, #2]
    adds r0, r0, r1
    strh r0, [r6, #2]
    ldrh r0, [r6, #6]
    adds r0, r0, r1
    strh r0, [r6, #6]
    b .L0802548E
.L08025404:
    ldr r0, [sp, #0x4c]
    rsbs r0, r0, #0
    str r0, [sp, #0x1c]
    add r3, sp, #0x1c
    movs r0, #0
    str r0, [sp]
    str r0, [sp, #4]
    add r0, sp, #8
    adds r1, r6, #0
    movs r2, #0
    bl func_080AC124
    ldr r1, [sp, #0x1c]
    cmp r1, #0
    beq .L0802549C
    ldr r2, [sp, #0x58]
    adds r2, r2, r1
    str r2, [sp, #0x58]
    ldrh r0, [r6, #2]
    adds r0, r0, r1
    strh r0, [r6, #2]
    ldrh r0, [r6, #6]
    adds r0, r0, r1
    strh r0, [r6, #6]
    b .L0802548E
.L08025436:
    ldr r0, [sp, #0x4c]
    rsbs r0, r0, #0
    str r0, [sp, #0x1c]
    add r0, sp, #0x1c
    str r0, [sp]
    movs r0, #0
    str r0, [sp, #4]
    add r0, sp, #8
    adds r1, r6, #0
    movs r2, #0
    movs r3, #0
    bl func_080AC124
    ldr r1, [sp, #0x1c]
    cmp r1, #0
    beq .L0802549C
    ldr r5, [sp, #0x54]
    adds r5, r5, r1
    str r5, [sp, #0x54]
    b .L08025482
.L0802545E:
    ldr r0, [sp, #0x4c]
    str r0, [sp, #0x1c]
    movs r0, #0
    str r0, [sp]
    add r0, sp, #0x1c
    str r0, [sp, #4]
    add r0, sp, #8
    adds r1, r6, #0
    movs r2, #0
    movs r3, #0
    bl func_080AC124
    ldr r1, [sp, #0x1c]
    cmp r1, #0
    beq .L0802549C
    ldr r0, [sp, #0x54]
    adds r0, r0, r1
    str r0, [sp, #0x54]
.L08025482:
    ldrh r0, [r6]
    adds r0, r0, r1
    strh r0, [r6]
    ldrh r0, [r6, #4]
    adds r0, r0, r1
    strh r0, [r6, #4]
.L0802548E:
    ldr r1, [sp, #0x1c]
    cmp r1, #0
    bge .L08025496
    rsbs r1, r1, #0
.L08025496:
    ldr r0, [sp, #0x4c]
    subs r0, r0, r1
    str r0, [sp, #0x4c]
.L0802549C:
    ldr r0, [sp, #0x4c]
    cmp r0, #0
    bne .L080254A4
    b .L080257B2
.L080254A4:
    mov r7, r8
    movs r0, #0
    str r0, [sp, #0x48]
    ldr r0, [sp, #0x14]
    ldr r1, [sp, #0x18]
    str r0, [sp, #0x20]
    str r1, [sp, #0x24]
    cmp r7, #1
    beq .L080254DA
    cmp r7, #1
    bgt .L080254C0
    cmp r7, #0
    beq .L080254CA
    b .L0802550A
.L080254C0:
    cmp r7, #2
    beq .L080254EA
    cmp r7, #3
    beq .L080254FC
    b .L0802550A
.L080254CA:
    add r1, sp, #0x20
    ldrh r0, [r1, #2]
    adds r0, #1
    strh r0, [r1, #2]
    ldrh r0, [r1, #6]
    adds r0, #1
    strh r0, [r1, #6]
    b .L0802550A
.L080254DA:
    add r1, sp, #0x20
    ldrh r0, [r1, #2]
    subs r0, #1
    strh r0, [r1, #2]
    ldrh r0, [r1, #6]
    subs r0, #1
    strh r0, [r1, #6]
    b .L0802550A
.L080254EA:
    add r1, sp, #0x20
    movs r2, #1
    rsbs r2, r2, #0
    ldrh r0, [r1]
    adds r0, r0, r2
    strh r0, [r1]
    ldrh r0, [r1, #4]
    adds r0, r0, r2
    b .L08025508
.L080254FC:
    add r1, sp, #0x20
    ldrh r0, [r1]
    adds r0, #1
    strh r0, [r1]
    ldrh r0, [r1, #4]
    adds r0, #1
.L08025508:
    strh r0, [r1, #4]
.L0802550A:
    mov r1, r8
    cmp r1, #0
    bge .L08025512
    b .L08025664
.L08025512:
    cmp r1, #1
    ble .L0802556A
    cmp r1, #3
    ble .L0802551C
    b .L08025664
.L0802551C:
    add r4, sp, #0x20
    movs r3, #1
    rsbs r3, r3, #0
    movs r0, #8
    str r0, [sp]
    mov r0, sb
    mov r1, sl
    adds r2, r4, #0
    bl func_08025248
    str r0, [sp, #0x48]
    cmp r0, #8
    bhi .L08025616
    rsbs r2, r0, #0
    add r0, sp, #0x14
    movs r5, #0
    ldrsh r3, [r0, r5]
    movs r1, #2
    ldrsh r0, [r6, r1]
    movs r5, #4
    ldrsh r4, [r6, r5]
    movs r1, #6
    ldrsh r5, [r6, r1]
    add r1, sp, #0x28
    strh r3, [r1]
    adds r0, r2, r0
    strh r0, [r1, #2]
    strh r4, [r1, #4]
    adds r2, r2, r5
    strh r2, [r1, #6]
    mov r0, sl
    bl func_080AC070
    movs r1, #1
    eors r0, r1
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08025616
    b .L0802560E
.L0802556A:
    add r4, sp, #0x20
    movs r3, #1
    rsbs r3, r3, #0
    movs r0, #8
    str r0, [sp]
    mov r0, sb
    mov r1, sl
    adds r2, r4, #0
    bl func_080251FC
    str r0, [sp, #0x48]
    cmp r0, #8
    bhi .L080255BA
    rsbs r2, r0, #0
    add r0, sp, #0x14
    movs r5, #0
    ldrsh r0, [r0, r5]
    movs r1, #2
    ldrsh r3, [r6, r1]
    movs r5, #4
    ldrsh r4, [r6, r5]
    movs r1, #6
    ldrsh r5, [r6, r1]
    add r1, sp, #0x30
    adds r0, r2, r0
    strh r0, [r1]
    strh r3, [r1, #2]
    adds r2, r2, r4
    strh r2, [r1, #4]
    strh r5, [r1, #6]
    mov r0, sl
    bl func_080AC070
    movs r1, #1
    eors r0, r1
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L080255BA
    movs r7, #2
    b .L08025664
.L080255BA:
    movs r0, #8
    str r0, [sp]
    mov r0, sb
    mov r1, sl
    add r2, sp, #0x20
    movs r3, #1
    bl func_080251FC
    str r0, [sp, #0x48]
    cmp r0, #8
    bhi .L08025664
    add r0, sp, #0x14
    movs r2, #2
    ldrsh r3, [r6, r2]
    movs r5, #4
    ldrsh r4, [r6, r5]
    movs r2, #6
    ldrsh r1, [r6, r2]
    mov ip, r1
    add r1, sp, #0x38
    add r2, sp, #0x48
    movs r5, #0
    ldrsh r0, [r0, r5]
    ldrh r5, [r2]
    adds r0, r0, r5
    strh r0, [r1]
    strh r3, [r1, #2]
    ldrh r0, [r2]
    adds r0, r0, r4
    strh r0, [r1, #4]
    mov r0, ip
    strh r0, [r1, #6]
    mov r0, sl
    bl func_080AC070
    movs r1, #1
    eors r0, r1
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08025664
    movs r7, #3
    b .L08025664
.L0802560E:
    movs r7, #1
    b .L08025664
.L08025612:
    ldr r0, [r4]
    b .L080256C4
.L08025616:
    movs r0, #8
    str r0, [sp]
    mov r0, sb
    mov r1, sl
    add r2, sp, #0x20
    movs r3, #1
    bl func_08025248
    str r0, [sp, #0x48]
    cmp r0, #8
    bhi .L08025664
    add r0, sp, #0x14
    movs r1, #0
    ldrsh r0, [r0, r1]
    movs r2, #2
    ldrsh r3, [r6, r2]
    movs r5, #4
    ldrsh r4, [r6, r5]
    movs r1, #6
    ldrsh r5, [r6, r1]
    add r1, sp, #0x40
    strh r0, [r1]
    add r2, sp, #0x48
    ldrh r0, [r2]
    adds r0, r0, r3
    strh r0, [r1, #2]
    strh r4, [r1, #4]
    ldrh r0, [r2]
    adds r0, r0, r5
    strh r0, [r1, #6]
    mov r0, sl
    bl func_080AC070
    movs r1, #1
    eors r0, r1
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08025664
    movs r7, #0
.L08025664:
    cmp r7, r8
    beq .L0802566E
    ldr r0, [sp, #0x48]
    cmp r0, #3
    bls .L08025768
.L0802566E:
    ldr r2, [sp, #0x50]
    cmp r2, #2
    bne .L08025768
    mov r0, sb
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #2
    bne .L08025768
    mov r0, sb
    mov r1, sl
    mov r2, r8
    adds r3, r6, #0
    bl func_08025294
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08025768
    mov r5, sb
    ldr r0, [r5]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    mov r7, sb
    adds r7, #0x3c
    cmp r4, r5
    beq .L080256C0
.L080256AE:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08025612
    adds r4, #4
    cmp r4, r5
    bne .L080256AE
.L080256C0:
    subs r0, r5, #4
    ldr r0, [r0]
.L080256C4:
    movs r1, #0x69
    bl func_08008B6C
    movs r3, #0
    movs r5, #0
    mov r0, r8
    cmp r0, #1
    beq .L080256FC
    cmp r0, #1
    bgt .L080256DE
    cmp r0, #0
    beq .L080256EA
    b .L08025734
.L080256DE:
    mov r1, r8
    cmp r1, #2
    beq .L0802570E
    cmp r1, #3
    beq .L08025720
    b .L08025734
.L080256EA:
    movs r2, #6
    ldrsh r0, [r6, r2]
    movs r5, #2
    ldrsh r1, [r6, r5]
    subs r0, r0, r1
    adds r3, r0, #0
    adds r3, #0x10
    ldr r0, [sp, #0x58]
    b .L08025732
.L080256FC:
    movs r1, #6
    ldrsh r0, [r6, r1]
    movs r2, #2
    ldrsh r1, [r6, r2]
    subs r0, r0, r1
    adds r0, #0x10
    rsbs r3, r0, #0
    ldr r0, [sp, #0x58]
    b .L08025732
.L0802570E:
    movs r1, #4
    ldrsh r0, [r6, r1]
    add r1, sp, #0x14
    movs r2, #0
    ldrsh r1, [r1, r2]
    subs r0, r0, r1
    adds r0, #0x10
    rsbs r3, r0, #0
    b .L08025730
.L08025720:
    movs r1, #4
    ldrsh r0, [r6, r1]
    add r1, sp, #0x14
    movs r2, #0
    ldrsh r1, [r1, r2]
    subs r0, r0, r1
    adds r3, r0, #0
    adds r3, #0x10
.L08025730:
    ldr r0, [sp, #0x54]
.L08025732:
    adds r5, r0, r3
.L08025734:
    adds r1, r7, #0
    ldrb r0, [r1]
    cmp r0, #0
    bne .L0802574A
    movs r0, #0x2c
    strb r0, [r1]
    mov r1, sb
    adds r1, #0x80
    lsls r0, r3, #0xc
    str r0, [r1]
    b .L08025760
.L0802574A:
    cmp r0, #7
    bne .L080257B2
    movs r0, #0x2d
    strb r0, [r7]
    mov r4, sb
    adds r4, #0x80
    lsls r0, r3, #0x10
    movs r1, #0xc
    bl __divsi3
    str r0, [r4]
.L08025760:
    mov r0, sb
    adds r0, #0x84
    strh r5, [r0]
    b .L080257B2
.L08025768:
    cmp r7, r8
    beq .L080257B2
    add r3, sp, #0x4c
    ldr r1, [sp, #0x48]
    ldr r0, [sp, #0x4c]
    add r2, sp, #0x48
    cmp r1, r0
    bls .L0802577A
    adds r2, r3, #0
.L0802577A:
    ldr r0, [r2]
    cmp r7, #1
    beq .L0802579C
    cmp r7, #1
    bgt .L0802578A
    cmp r7, #0
    beq .L08025794
    b .L080257B2
.L0802578A:
    cmp r7, #2
    beq .L080257A4
    cmp r7, #3
    beq .L080257AC
    b .L080257B2
.L08025794:
    ldr r1, [sp, #0x58]
    adds r1, r1, r0
    str r1, [sp, #0x58]
    b .L080257B2
.L0802579C:
    ldr r2, [sp, #0x58]
    subs r2, r2, r0
    str r2, [sp, #0x58]
    b .L080257B2
.L080257A4:
    ldr r5, [sp, #0x54]
    subs r5, r5, r0
    str r5, [sp, #0x54]
    b .L080257B2
.L080257AC:
    ldr r1, [sp, #0x54]
    adds r1, r1, r0
    str r1, [sp, #0x54]
.L080257B2:
    ldr r2, [sp, #0x54]
    lsls r0, r2, #0x10
    mov r5, sb
    str r0, [r5, #8]
    ldr r1, [sp, #0x58]
    lsls r0, r1, #0x10
    str r0, [r5, #0xc]
.L080257C0:
    add sp, #0x5c
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0

    thumb_func_start func_080257D0
func_080257D0: @ 0x080257D0
    push {r4, r5, lr}
    adds r4, r0, #0
    lsls r1, r1, #0x18
    cmp r1, #0
    bne .L080257E6
    ldr r0, [r4, #0x38]
    bl func_0800EB3C
    b .L080257EC
.L080257E2:
    ldr r0, [r4]
    b .L0802582C
.L080257E6:
    ldr r0, [r4, #0x38]
    bl func_0800EBC4
.L080257EC:
    cmp r0, #0
    beq .L08025832
    adds r1, r4, #0
    adds r1, #0x3c
    movs r0, #0x13
    strb r0, [r1]
    adds r0, r4, #0
    bl func_0802A7D8
    ldr r0, [r4]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    beq .L08025828
.L08025816:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L080257E2
    adds r4, #4
    cmp r4, r5
    bne .L08025816
.L08025828:
    subs r0, r5, #4
    ldr r0, [r0]
.L0802582C:
    movs r1, #0x6b
    bl func_08008B6C
.L08025832:
    pop {r4, r5}
    pop {r0}
    bx r0

    thumb_func_start func_08025838
func_08025838: @ 0x08025838
    push {r4, r5, lr}
    adds r4, r0, #0
    lsls r1, r1, #0x18
    cmp r1, #0
    bne .L0802584E
    ldr r0, [r4, #0x38]
    bl func_0800EB3C
    b .L08025854
.L0802584A:
    ldr r0, [r4]
    b .L08025894
.L0802584E:
    ldr r0, [r4, #0x38]
    bl func_0800EBC4
.L08025854:
    cmp r0, #0
    beq .L0802589A
    adds r0, r4, #0
    bl func_0802A588
    adds r1, r4, #0
    adds r1, #0x3c
    movs r0, #0x14
    strb r0, [r1]
    ldr r0, [r4]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    beq .L08025890
.L0802587E:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802584A
    adds r4, #4
    cmp r4, r5
    bne .L0802587E
.L08025890:
    subs r0, r5, #4
    ldr r0, [r0]
.L08025894:
    movs r1, #0x6b
    bl func_08008B6C
.L0802589A:
    pop {r4, r5}
    pop {r0}
    bx r0

    thumb_func_start func_080258A0
func_080258A0: @ 0x080258A0
    push {r4, r5, lr}
    sub sp, #4
    adds r4, r0, #0
    ldr r1, [r4, #0x38]
    adds r1, #0x54
    mov r0, sp
    bl func_0800F294
    mov r0, sp
    bl IsEmpty__C12RucksackItem
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08025932
    ldr r0, [r4, #0x38]
    adds r0, #0x60
    bl GetFirstFreeItemSlot__C8Rucksack
    adds r1, r0, #0
    movs r0, #1
    rsbs r0, r0, #0
    cmp r1, r0
    beq .L0802592A
    ldr r0, [r4, #0x38]
    adds r0, #0x60
    bl GetItemAt__8RucksackUi
    ldr r1, [sp]
    str r1, [r0]
    ldr r0, [r4, #0x38]
    adds r0, #0x54
    bl func_0800F390
    adds r1, r4, #0
    adds r1, #0x3c
    movs r0, #0x12
    strb r0, [r1]
    adds r0, r4, #0
    bl func_0802A7D8
    ldr r0, [r4]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    beq .L0802591A
.L08025908:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08025926
    adds r4, #4
    cmp r4, r5
    bne .L08025908
.L0802591A:
    subs r0, r5, #4
    ldr r0, [r0]
.L0802591E:
    movs r1, #0x6b
    bl func_08008B6C
    b .L0802593A
.L08025926:
    ldr r0, [r4]
    b .L0802591E
.L0802592A:
    adds r1, r4, #0
    adds r1, #0x3c
    movs r0, #4
    b .L08025938
.L08025932:
    adds r1, r4, #0
    adds r1, #0x3c
    movs r0, #0
.L08025938:
    strb r0, [r1]
.L0802593A:
    add sp, #4
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_08025944
func_08025944: @ 0x08025944
    push {r4, r5, lr}
    sub sp, #4
    adds r4, r0, #0
    ldr r0, [r4, #0x38]
    adds r5, r0, #0
    adds r5, #0x5c
    adds r0, r5, #0
    bl IsEmpty__C9ToolStack
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08025A34
    ldr r4, [r4, #0x38]
    adds r0, r5, #0
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    mov r1, sp
    strb r0, [r1]
    mov r0, sp
    bl GetId__C4Tool
    subs r0, #5
    cmp r0, #0x28
    bhi .L08025A34
    lsls r0, r0, #2
    ldr r1, .L08025988 @ =.L0802598C
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L08025988: .4byte .L0802598C
.L0802598C: @ jump table
    .4byte .L08025A30 @ case 0
    .4byte .L08025A34 @ case 1
    .4byte .L08025A34 @ case 2
    .4byte .L08025A34 @ case 3
    .4byte .L08025A34 @ case 4
    .4byte .L08025A34 @ case 5
    .4byte .L08025A34 @ case 6
    .4byte .L08025A34 @ case 7
    .4byte .L08025A30 @ case 8
    .4byte .L08025A34 @ case 9
    .4byte .L08025A34 @ case 10
    .4byte .L08025A34 @ case 11
    .4byte .L08025A34 @ case 12
    .4byte .L08025A34 @ case 13
    .4byte .L08025A34 @ case 14
    .4byte .L08025A34 @ case 15
    .4byte .L08025A30 @ case 16
    .4byte .L08025A34 @ case 17
    .4byte .L08025A34 @ case 18
    .4byte .L08025A34 @ case 19
    .4byte .L08025A34 @ case 20
    .4byte .L08025A34 @ case 21
    .4byte .L08025A34 @ case 22
    .4byte .L08025A34 @ case 23
    .4byte .L08025A30 @ case 24
    .4byte .L08025A34 @ case 25
    .4byte .L08025A34 @ case 26
    .4byte .L08025A34 @ case 27
    .4byte .L08025A34 @ case 28
    .4byte .L08025A34 @ case 29
    .4byte .L08025A34 @ case 30
    .4byte .L08025A34 @ case 31
    .4byte .L08025A30 @ case 32
    .4byte .L08025A34 @ case 33
    .4byte .L08025A34 @ case 34
    .4byte .L08025A34 @ case 35
    .4byte .L08025A34 @ case 36
    .4byte .L08025A34 @ case 37
    .4byte .L08025A34 @ case 38
    .4byte .L08025A34 @ case 39
    .4byte .L08025A30 @ case 40
.L08025A30:
    movs r0, #1
    b .L08025A36
.L08025A34:
    movs r0, #0
.L08025A36:
    add sp, #4
    pop {r4, r5}
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_08025A40
func_08025A40: @ 0x08025A40
    push {r4, r5, r6, lr}
    adds r5, r0, #0
    lsls r1, r1, #0x18
    lsrs r4, r1, #0x18
    bl func_08025944
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08025A92
    ldr r0, [r5]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r6, [r0, #4]
    adds r5, #0x3c
    cmp r4, r6
    beq .L08025A7E
.L08025A6C:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08025A8E
    adds r4, #4
    cmp r4, r6
    bne .L08025A6C
.L08025A7E:
    subs r0, r6, #4
    ldr r0, [r0]
.L08025A82:
    movs r1, #0xc7
    bl func_08008B6C
    movs r0, #0
    strb r0, [r5]
    b .L08025AF4
.L08025A8E:
    ldr r0, [r4]
    b .L08025A82
.L08025A92:
    cmp r4, #0
    bne .L08025AA2
    ldr r0, [r5, #0x38]
    bl func_0800EC4C
    b .L08025AA8
.L08025A9E:
    ldr r0, [r4]
    b .L08025AEE
.L08025AA2:
    ldr r0, [r5, #0x38]
    bl func_0800ECB0
.L08025AA8:
    cmp r0, #0
    beq .L08025AF4
    adds r1, r5, #0
    adds r1, #0x3c
    movs r0, #0x15
    strb r0, [r1]
    adds r1, #1
    movs r0, #0x14
    strb r0, [r1]
    adds r0, r5, #0
    bl func_0802A510
    ldr r0, [r5]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    beq .L08025AEA
.L08025AD8:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08025A9E
    adds r4, #4
    cmp r4, r5
    bne .L08025AD8
.L08025AEA:
    subs r0, r5, #4
    ldr r0, [r0]
.L08025AEE:
    movs r1, #0xbc
    bl func_08008B6C
.L08025AF4:
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_08025AFC
func_08025AFC: @ 0x08025AFC
    push {lr}
    ldrh r0, [r0, #4]
    cmp r0, #8
    ble .L08025B08
    movs r0, #0
    b .L08025B0A
.L08025B08:
    movs r0, #1
.L08025B0A:
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_08025B10
func_08025B10: @ 0x08025B10
    push {r4, r5, lr}
    adds r5, r0, #0
    movs r4, #0
    bl func_08025AFC
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08025B2C
    ldr r0, [r5, #0x34]
    ldr r0, [r0, #8]
    subs r0, #1
    cmp r0, #1
    bhi .L08025B2C
    movs r4, #1
.L08025B2C:
    ldr r0, [r5, #0x34]
    ldrh r0, [r0, #0x12]
    lsls r1, r0, #0x1b
    lsrs r0, r1, #0x1b
    cmp r0, #0x15
    bls .L08025B3A
    adds r4, #1
.L08025B3A:
    lsrs r0, r1, #0x1b
    cmp r0, #5
    bhi .L08025B42
    adds r4, #2
.L08025B42:
    ldr r0, [r5, #0x38]
    bl func_0800E4F0
    cmp r0, #0
    bne .L08025B4E
    adds r4, #2
.L08025B4E:
    adds r0, r5, #0
    bl func_08025944
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08025B5C
    adds r4, #0xa
.L08025B5C:
    adds r0, r4, #0
    pop {r4, r5}
    pop {r1}
    bx r1

    thumb_func_start func_08025B64
func_08025B64: @ 0x08025B64
    push {r4, r5, r6, lr}
    sub sp, #0x28
    adds r6, r0, #0
    cmp r1, #0x22
    bhi .L08025C08
    lsls r0, r1, #2
    ldr r1, .L08025B78 @ =.L08025B7C
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L08025B78: .4byte .L08025B7C
.L08025B7C: @ jump table
    .4byte .L08025C08 @ case 0
    .4byte .L08025C08 @ case 1
    .4byte .L08025CB2 @ case 2
    .4byte .L08025C12 @ case 3
    .4byte .L08025C20 @ case 4
    .4byte .L08025C28 @ case 5
    .4byte .L08025C32 @ case 6
    .4byte .L08025C3C @ case 7
    .4byte .L08025C46 @ case 8
    .4byte .L08025C4E @ case 9
    .4byte .L08025C68 @ case 10
    .4byte .L08025CCE @ case 11
    .4byte .L08025CF8 @ case 12
    .4byte .L08025D04 @ case 13
    .4byte .L08025D0E @ case 14
    .4byte .L08025D1A @ case 15
    .4byte .L08025D26 @ case 16
    .4byte .L08025D32 @ case 17
    .4byte .L08025D3C @ case 18
    .4byte .L08025D48 @ case 19
    .4byte .L08025D54 @ case 20
    .4byte .L08025D60 @ case 21
    .4byte .L08025D6A @ case 22
    .4byte .L08025D76 @ case 23
    .4byte .L08025D82 @ case 24
    .4byte .L08025D8E @ case 25
    .4byte .L08025D98 @ case 26
    .4byte .L08025DA4 @ case 27
    .4byte .L08025DB0 @ case 28
    .4byte .L08025DBC @ case 29
    .4byte .L08025DC6 @ case 30
    .4byte .L08025DD2 @ case 31
    .4byte .L08025DDE @ case 32
    .4byte .L08025DEA @ case 33
    .4byte .L08025E0C @ case 34
.L08025C08:
    adds r1, r6, #0
    adds r1, #0x3c
    movs r0, #0
    strb r0, [r1]
    b .L08025E2E
.L08025C12:
    ldr r0, [r6, #0x14]
    adds r0, #0x80
    ldr r1, [r0]
    adds r0, r6, #0
    bl _call_via_r1
    b .L08025E2E
.L08025C20:
    add r4, sp, #8
    adds r0, r4, #0
    movs r1, #5
    b .L08025C56
.L08025C28:
    mov r4, sp
    adds r4, #9
    adds r0, r4, #0
    movs r1, #0xd
    b .L08025C56
.L08025C32:
    mov r4, sp
    adds r4, #0xa
    adds r0, r4, #0
    movs r1, #0x15
    b .L08025C56
.L08025C3C:
    mov r4, sp
    adds r4, #0xb
    adds r0, r4, #0
    movs r1, #0x1d
    b .L08025C56
.L08025C46:
    add r4, sp, #0xc
    adds r0, r4, #0
    movs r1, #0x25
    b .L08025C56
.L08025C4E:
    mov r4, sp
    adds r4, #0xd
    adds r0, r4, #0
    movs r1, #0x2d
.L08025C56:
    bl __4ToolUi
    adds r0, r6, #0
    adds r1, r4, #0
    bl func_0802720C
    b .L08025E2E
.L08025C64:
    ldr r0, [r4]
    b .L08025CAA
.L08025C68:
    mov r4, sp
    adds r4, #0xe
    adds r0, r4, #0
    movs r1, #0x4d
    bl __4ToolUi
    adds r0, r6, #0
    adds r1, r4, #0
    bl func_0802720C
    ldr r0, [r6]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    beq .L08025CA6
.L08025C94:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08025C64
    adds r4, #4
    cmp r4, r5
    bne .L08025C94
.L08025CA6:
    subs r0, r5, #4
    ldr r0, [r0]
.L08025CAA:
    movs r1, #0xb6
    bl func_08008B6C
    b .L08025E2E
.L08025CB2:
    bl rand
    adds r1, r0, #0
    cmp r0, #0
    bge .L08025CBE
    adds r1, #0xf
.L08025CBE:
    asrs r1, r1, #4
    lsls r1, r1, #4
    subs r1, r0, r1
    adds r1, #5
    adds r0, r6, #0
    bl func_0802771C
    b .L08025E2E
.L08025CCE:
    ldr r5, [r6, #0x14]
    add r4, sp, #4
    adds r0, r4, #0
    movs r1, #0x36
    bl __4FoodUi
    ldrb r1, [r4]
    mov r0, sp
    adds r0, #5
    ldrb r0, [r0]
    lsls r0, r0, #8
    orrs r0, r1
    mov r1, sp
    adds r1, #6
    ldrb r1, [r1]
    lsls r1, r1, #0x10
    orrs r1, r0
    mov r0, sp
    bl __12RucksackItemG4Food
    b .L08025DFE
.L08025CF8:
    ldr r5, [r6, #0x14]
    mov r4, sp
    adds r4, #0xf
    adds r0, r4, #0
    movs r1, #0x11
    b .L08025DF2
.L08025D04:
    ldr r5, [r6, #0x14]
    add r4, sp, #0x10
    adds r0, r4, #0
    movs r1, #0x12
    b .L08025DF2
.L08025D0E:
    ldr r5, [r6, #0x14]
    mov r4, sp
    adds r4, #0x11
    adds r0, r4, #0
    movs r1, #0x13
    b .L08025DF2
.L08025D1A:
    ldr r5, [r6, #0x14]
    mov r4, sp
    adds r4, #0x12
    adds r0, r4, #0
    movs r1, #0x14
    b .L08025DF2
.L08025D26:
    ldr r5, [r6, #0x14]
    mov r4, sp
    adds r4, #0x13
    adds r0, r4, #0
    movs r1, #0x15
    b .L08025DF2
.L08025D32:
    ldr r5, [r6, #0x14]
    add r4, sp, #0x14
    adds r0, r4, #0
    movs r1, #0x16
    b .L08025DF2
.L08025D3C:
    ldr r5, [r6, #0x14]
    mov r4, sp
    adds r4, #0x15
    adds r0, r4, #0
    movs r1, #0x17
    b .L08025DF2
.L08025D48:
    ldr r5, [r6, #0x14]
    mov r4, sp
    adds r4, #0x16
    adds r0, r4, #0
    movs r1, #0x18
    b .L08025DF2
.L08025D54:
    ldr r5, [r6, #0x14]
    mov r4, sp
    adds r4, #0x17
    adds r0, r4, #0
    movs r1, #0x19
    b .L08025DF2
.L08025D60:
    ldr r5, [r6, #0x14]
    add r4, sp, #0x18
    adds r0, r4, #0
    movs r1, #0x1a
    b .L08025DF2
.L08025D6A:
    ldr r5, [r6, #0x14]
    mov r4, sp
    adds r4, #0x19
    adds r0, r4, #0
    movs r1, #0x1b
    b .L08025DF2
.L08025D76:
    ldr r5, [r6, #0x14]
    mov r4, sp
    adds r4, #0x1a
    adds r0, r4, #0
    movs r1, #0x1c
    b .L08025DF2
.L08025D82:
    ldr r5, [r6, #0x14]
    mov r4, sp
    adds r4, #0x1b
    adds r0, r4, #0
    movs r1, #0x1d
    b .L08025DF2
.L08025D8E:
    ldr r5, [r6, #0x14]
    add r4, sp, #0x1c
    adds r0, r4, #0
    movs r1, #0x1e
    b .L08025DF2
.L08025D98:
    ldr r5, [r6, #0x14]
    mov r4, sp
    adds r4, #0x1d
    adds r0, r4, #0
    movs r1, #0x1f
    b .L08025DF2
.L08025DA4:
    ldr r5, [r6, #0x14]
    mov r4, sp
    adds r4, #0x1e
    adds r0, r4, #0
    movs r1, #0x20
    b .L08025DF2
.L08025DB0:
    ldr r5, [r6, #0x14]
    mov r4, sp
    adds r4, #0x1f
    adds r0, r4, #0
    movs r1, #0x21
    b .L08025DF2
.L08025DBC:
    ldr r5, [r6, #0x14]
    add r4, sp, #0x20
    adds r0, r4, #0
    movs r1, #0x22
    b .L08025DF2
.L08025DC6:
    ldr r5, [r6, #0x14]
    mov r4, sp
    adds r4, #0x21
    adds r0, r4, #0
    movs r1, #0x23
    b .L08025DF2
.L08025DD2:
    ldr r5, [r6, #0x14]
    mov r4, sp
    adds r4, #0x22
    adds r0, r4, #0
    movs r1, #0x24
    b .L08025DF2
.L08025DDE:
    ldr r5, [r6, #0x14]
    mov r4, sp
    adds r4, #0x23
    adds r0, r4, #0
    movs r1, #0x25
    b .L08025DF2
.L08025DEA:
    ldr r5, [r6, #0x14]
    add r4, sp, #0x24
    adds r0, r4, #0
    movs r1, #0x26
.L08025DF2:
    bl __7ArticleUi
    ldrb r1, [r4]
    mov r0, sp
    bl __12RucksackItemG7Article
.L08025DFE:
    ldr r3, [r5, #0x5c]
    adds r0, r6, #0
    mov r1, sp
    movs r2, #0
    bl _call_via_r3
    b .L08025E2E
.L08025E0C:
    ldr r5, [r6, #0x14]
    mov r4, sp
    adds r4, #0x25
    adds r0, r4, #0
    movs r1, #0x33
    bl __7ArticleUi
    ldrb r1, [r4]
    mov r0, sp
    bl __12RucksackItemG7Article
    ldr r3, [r5, #0x5c]
    adds r0, r6, #0
    mov r1, sp
    movs r2, #0
    bl _call_via_r3
.L08025E2E:
    add sp, #0x28
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_08025E38
func_08025E38: @ 0x08025E38
    push {r4, r5, lr}
    adds r4, r0, #0
    ldr r0, [r4, #0x38]
    adds r0, #0x54
    bl func_0800F4C0
    adds r0, r4, #0
    bl func_0802A588
    adds r1, r4, #0
    adds r1, #0x3c
    movs r5, #0
    movs r0, #0x11
    strb r0, [r1]
    adds r0, r4, #0
    adds r0, #0x20
    ldrb r3, [r0]
    cmp r3, #1
    beq .L08025E9A
    cmp r3, #1
    bgt .L08025E68
    cmp r3, #0
    beq .L08025EB0
    b .L08025EC2
.L08025E68:
    cmp r3, #2
    beq .L08025E72
    cmp r3, #3
    beq .L08025E88
    b .L08025EC2
.L08025E72:
    adds r0, r4, #0
    adds r0, #0x88
    ldr r1, .L08025E84 @ =0xFFF60000
    movs r2, #0xc0
    lsls r2, r2, #0xc
    str r1, [r0, #4]
    str r5, [r0, #8]
    b .L08025EC0
    .align 2, 0
.L08025E84: .4byte 0xFFF60000
.L08025E88:
    adds r0, r4, #0
    adds r0, #0x88
    movs r1, #0xa0
    lsls r1, r1, #0xc
    movs r2, #0xc0
    lsls r2, r2, #0xc
    str r1, [r0, #4]
    str r5, [r0, #8]
    b .L08025EC0
.L08025E9A:
    adds r0, r4, #0
    adds r0, #0x88
    ldr r1, .L08025EA8 @ =0xFFF60000
    movs r2, #0xc0
    lsls r2, r2, #0xc
    str r5, [r0, #4]
    b .L08025EBE
    .align 2, 0
.L08025EA8: .4byte 0xFFF60000
.L08025EAC:
    ldr r0, [r4]
    b .L08025EF0
.L08025EB0:
    adds r0, r4, #0
    adds r0, #0x88
    movs r1, #0xa0
    lsls r1, r1, #0xc
    movs r2, #0xc0
    lsls r2, r2, #0xc
    str r3, [r0, #4]
.L08025EBE:
    str r1, [r0, #8]
.L08025EC0:
    str r2, [r0, #0x14]
.L08025EC2:
    ldr r0, [r4]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    beq .L08025EEC
.L08025EDA:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08025EAC
    adds r4, #4
    cmp r4, r5
    bne .L08025EDA
.L08025EEC:
    subs r0, r5, #4
    ldr r0, [r0]
.L08025EF0:
    movs r1, #0x6a
    bl func_08008B6C
    pop {r4, r5}
    pop {r0}
    bx r0

    thumb_func_start func_08025EFC
func_08025EFC: @ 0x08025EFC
    push {r4, r5, lr}
    adds r4, r0, #0
    lsls r1, r1, #0x18
    lsrs r1, r1, #0x18
    ldr r0, [r4, #0x38]
    adds r0, #0x54
    bl func_0800F4F0
    adds r0, r4, #0
    bl func_0802A588
    adds r1, r4, #0
    adds r1, #0x3c
    movs r5, #0
    movs r0, #0x11
    strb r0, [r1]
    adds r0, r4, #0
    adds r0, #0x20
    ldrb r3, [r0]
    cmp r3, #1
    beq .L08025F62
    cmp r3, #1
    bgt .L08025F30
    cmp r3, #0
    beq .L08025F78
    b .L08025F8A
.L08025F30:
    cmp r3, #2
    beq .L08025F3A
    cmp r3, #3
    beq .L08025F50
    b .L08025F8A
.L08025F3A:
    adds r0, r4, #0
    adds r0, #0x88
    ldr r1, .L08025F4C @ =0xFFF60000
    movs r2, #0xc0
    lsls r2, r2, #0xc
    str r1, [r0, #4]
    str r5, [r0, #8]
    b .L08025F88
    .align 2, 0
.L08025F4C: .4byte 0xFFF60000
.L08025F50:
    adds r0, r4, #0
    adds r0, #0x88
    movs r1, #0xa0
    lsls r1, r1, #0xc
    movs r2, #0xc0
    lsls r2, r2, #0xc
    str r1, [r0, #4]
    str r5, [r0, #8]
    b .L08025F88
.L08025F62:
    adds r0, r4, #0
    adds r0, #0x88
    ldr r1, .L08025F70 @ =0xFFF60000
    movs r2, #0xc0
    lsls r2, r2, #0xc
    str r5, [r0, #4]
    b .L08025F86
    .align 2, 0
.L08025F70: .4byte 0xFFF60000
.L08025F74:
    ldr r0, [r4]
    b .L08025FB8
.L08025F78:
    adds r0, r4, #0
    adds r0, #0x88
    movs r1, #0xa0
    lsls r1, r1, #0xc
    movs r2, #0xc0
    lsls r2, r2, #0xc
    str r3, [r0, #4]
.L08025F86:
    str r1, [r0, #8]
.L08025F88:
    str r2, [r0, #0x14]
.L08025F8A:
    ldr r0, [r4]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    beq .L08025FB4
.L08025FA2:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08025F74
    adds r4, #4
    cmp r4, r5
    bne .L08025FA2
.L08025FB4:
    subs r0, r5, #4
    ldr r0, [r0]
.L08025FB8:
    movs r1, #0x6a
    bl func_08008B6C
    pop {r4, r5}
    pop {r0}
    bx r0

    thumb_func_start func_08025FC4
func_08025FC4: @ 0x08025FC4
    push {r4, r5, lr}
    adds r4, r0, #0
    ldr r0, [r4, #0x38]
    adds r0, #0x54
    bl func_0800F4D8
    adds r0, r4, #0
    bl func_0802A588
    adds r1, r4, #0
    adds r1, #0x3c
    movs r5, #0
    movs r0, #0x11
    strb r0, [r1]
    adds r0, r4, #0
    adds r0, #0x20
    ldrb r3, [r0]
    cmp r3, #1
    beq .L08026026
    cmp r3, #1
    bgt .L08025FF4
    cmp r3, #0
    beq .L0802603C
    b .L0802604E
.L08025FF4:
    cmp r3, #2
    beq .L08025FFE
    cmp r3, #3
    beq .L08026014
    b .L0802604E
.L08025FFE:
    adds r0, r4, #0
    adds r0, #0x88
    ldr r1, .L08026010 @ =0xFFF60000
    movs r2, #0xc0
    lsls r2, r2, #0xc
    str r1, [r0, #4]
    str r5, [r0, #8]
    b .L0802604C
    .align 2, 0
.L08026010: .4byte 0xFFF60000
.L08026014:
    adds r0, r4, #0
    adds r0, #0x88
    movs r1, #0xa0
    lsls r1, r1, #0xc
    movs r2, #0xc0
    lsls r2, r2, #0xc
    str r1, [r0, #4]
    str r5, [r0, #8]
    b .L0802604C
.L08026026:
    adds r0, r4, #0
    adds r0, #0x88
    ldr r1, .L08026034 @ =0xFFF60000
    movs r2, #0xc0
    lsls r2, r2, #0xc
    str r5, [r0, #4]
    b .L0802604A
    .align 2, 0
.L08026034: .4byte 0xFFF60000
.L08026038:
    ldr r0, [r4]
    b .L0802607C
.L0802603C:
    adds r0, r4, #0
    adds r0, #0x88
    movs r1, #0xa0
    lsls r1, r1, #0xc
    movs r2, #0xc0
    lsls r2, r2, #0xc
    str r3, [r0, #4]
.L0802604A:
    str r1, [r0, #8]
.L0802604C:
    str r2, [r0, #0x14]
.L0802604E:
    ldr r0, [r4]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    beq .L08026078
.L08026066:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08026038
    adds r4, #4
    cmp r4, r5
    bne .L08026066
.L08026078:
    subs r0, r5, #4
    ldr r0, [r0]
.L0802607C:
    movs r1, #0x6a
    bl func_08008B6C
    pop {r4, r5}
    pop {r0}
    bx r0
.L08026088:
    .byte 0x30, 0xB5, 0x04, 0x1C, 0x09, 0x04, 0x09, 0x0C
    .byte 0xA0, 0x6B, 0x54, 0x30, 0xE9, 0xF7, 0x3C, 0xFA, 0x20, 0x1C, 0x04, 0xF0, 0x75, 0xFA, 0x21, 0x1C
    .byte 0x3C, 0x31, 0x00, 0x25, 0x11, 0x20, 0x08, 0x70, 0x20, 0x1C, 0x20, 0x30, 0x03, 0x78, 0x01, 0x2B
    .byte 0x1D, 0xD0, 0x01, 0x2B, 0x02, 0xDC, 0x00, 0x2B, 0x24, 0xD0, 0x2C, 0xE0, 0x02, 0x2B, 0x02, 0xD0
    .byte 0x03, 0x2B, 0x0B, 0xD0, 0x27, 0xE0, 0x20, 0x1C, 0x88, 0x30, 0x03, 0x49, 0xC0, 0x22, 0x12, 0x03
    .byte 0x41, 0x60, 0x85, 0x60, 0x1E, 0xE0, 0x00, 0x00, 0x00, 0x00, 0xF6, 0xFF, 0x20, 0x1C, 0x88, 0x30
    .byte 0xA0, 0x21, 0x09, 0x03, 0xC0, 0x22, 0x12, 0x03, 0x41, 0x60, 0x85, 0x60, 0x12, 0xE0, 0x20, 0x1C
    .byte 0x88, 0x30, 0x02, 0x49, 0xC0, 0x22, 0x12, 0x03, 0x45, 0x60, 0x0A, 0xE0, 0x00, 0x00, 0xF6, 0xFF
    .byte 0x20, 0x68, 0x1F, 0xE0, 0x20, 0x1C, 0x88, 0x30, 0xA0, 0x21, 0x09, 0x03, 0xC0, 0x22, 0x12, 0x03
    .byte 0x43, 0x60, 0x81, 0x60, 0x42, 0x61, 0x20, 0x68, 0x01, 0x68, 0xA6, 0x22, 0x52, 0x00, 0x89, 0x18
    .byte 0x09, 0x68, 0xAD, 0xF0, 0xF5, 0xFB, 0x04, 0x68, 0x45, 0x68, 0xAC, 0x42, 0x08, 0xD0, 0x20, 0x68
    .byte 0xE2, 0xF7, 0xCE, 0xFD, 0x00, 0x06, 0x00, 0x28, 0xE2, 0xD0, 0x04, 0x34, 0xAC, 0x42, 0xF6, 0xD1
    .byte 0x28, 0x1F, 0x00, 0x68, 0x6A, 0x21, 0xE2, 0xF7, 0x11, 0xFD, 0x30, 0xBC, 0x01, 0xBC, 0x00, 0x47

    thumb_func_start func_08026150
func_08026150: @ 0x08026150
    push {r4, r5, r6, r7, lr}
    mov r7, r8
    push {r7}
    sub sp, #0xc
    adds r5, r0, #0
    adds r6, r1, #0
    lsls r2, r2, #0x18
    lsrs r2, r2, #0x18
    mov r8, r2
    add r4, sp, #8
    adds r0, r4, #0
    bl __7Product
    adds r0, r6, #0
    bl GetKind__C12RucksackItem
    adds r7, r4, #0
    cmp r0, #0
    beq .L0802617C
    cmp r0, #1
    beq .L080261A6
    b .L080261BC
.L0802617C:
    mov r4, sp
    adds r4, #9
    mov r0, sp
    adds r1, r6, #0
    bl GetFood__C12RucksackItem
    mov r0, sp
    ldrb r1, [r0]
    adds r0, #1
    ldrb r0, [r0]
    lsls r0, r0, #8
    orrs r0, r1
    mov r1, sp
    adds r1, #2
    ldrb r1, [r1]
    lsls r1, r1, #0x10
    orrs r1, r0
    adds r0, r4, #0
    bl __7ProductG4Food
    b .L080261B8
.L080261A6:
    mov r4, sp
    adds r4, #0xa
    adds r0, r6, #0
    bl GetArticle__C12RucksackItem
    adds r1, r0, #0
    adds r0, r4, #0
    bl __7ProductG7Article
.L080261B8:
    ldrb r0, [r4]
    strb r0, [r7]
.L080261BC:
    ldr r0, [r5, #0x34]
    adds r4, r0, #0
    adds r4, #0x54
    adds r0, r7, #0
    bl GetPrice__C7Product
    cmp r0, #0
    beq .L080261EE
    adds r0, r7, #0
    bl GetId__C7Product
    adds r1, r0, #0
    adds r0, r4, #0
    bl IsDisplayEnabled__C11ShippingBini
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L080261EE
    adds r0, r7, #0
    bl GetId__C7Product
    adds r1, r0, #0
    adds r0, r4, #0
    bl ForceEnableDisplay__11ShippingBini
.L080261EE:
    ldr r0, [r5, #0x38]
    adds r0, #0x54
    ldr r1, [r6]
    str r1, [sp, #4]
    bl func_0800F418
    mov r0, r8
    cmp r0, #0
    beq .L08026208
    ldr r0, [r5, #0x38]
    adds r0, #0x54
    bl func_0800F528
.L08026208:
    adds r0, r5, #0
    bl func_0802A588
    adds r0, r5, #0
    adds r0, #0x3c
    movs r4, #0
    movs r1, #0x11
    strb r1, [r0]
    subs r0, #0x1c
    ldrb r3, [r0]
    cmp r3, #1
    beq .L0802625A
    cmp r3, #1
    bgt .L0802622A
    cmp r3, #0
    beq .L08026270
    b .L08026282
.L0802622A:
    cmp r3, #2
    beq .L08026234
    cmp r3, #3
    beq .L08026248
    b .L08026282
.L08026234:
    adds r0, r5, #0
    adds r0, #0x88
    ldr r1, .L08026244 @ =0xFFF60000
    movs r2, #0xc0
    lsls r2, r2, #0xc
    str r1, [r0, #4]
    str r4, [r0, #8]
    b .L08026280
    .align 2, 0
.L08026244: .4byte 0xFFF60000
.L08026248:
    adds r0, r5, #0
    adds r0, #0x88
    movs r1, #0xa0
    lsls r1, r1, #0xc
    movs r2, #0xc0
    lsls r2, r2, #0xc
    str r1, [r0, #4]
    str r4, [r0, #8]
    b .L08026280
.L0802625A:
    adds r0, r5, #0
    adds r0, #0x88
    ldr r1, .L08026268 @ =0xFFF60000
    movs r2, #0xc0
    lsls r2, r2, #0xc
    str r4, [r0, #4]
    b .L0802627E
    .align 2, 0
.L08026268: .4byte 0xFFF60000
.L0802626C:
    ldr r0, [r4]
    b .L080262B0
.L08026270:
    adds r0, r5, #0
    adds r0, #0x88
    movs r1, #0xa0
    lsls r1, r1, #0xc
    movs r2, #0xc0
    lsls r2, r2, #0xc
    str r3, [r0, #4]
.L0802627E:
    str r1, [r0, #8]
.L08026280:
    str r2, [r0, #0x14]
.L08026282:
    ldr r0, [r5]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    beq .L080262AC
.L0802629A:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802626C
    adds r4, #4
    cmp r4, r5
    bne .L0802629A
.L080262AC:
    subs r0, r5, #4
    ldr r0, [r0]
.L080262B0:
    movs r1, #0x6a
    bl func_08008B6C
    add sp, #0xc
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_080262C4
func_080262C4: @ 0x080262C4
    push {r4, r5, lr}
    sub sp, #8
    ldr r0, [r0, #0x34]
    ldr r1, .L080262F8 @ =0x00001C2C
    adds r5, r0, r1
    adds r0, r5, #0
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08026338
    adds r0, r5, #0
    bl func_0800F388
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08026338
    adds r0, r5, #0
    bl func_0800F204
    cmp r0, #0
    beq .L080262FC
    cmp r0, #1
    beq .L08026324
    b .L08026338
    .align 2, 0
.L080262F8: .4byte 0x00001C2C
.L080262FC:
    add r4, sp, #4
    mov r0, sp
    adds r1, r5, #0
    bl func_0800F20C
    mov r0, sp
    ldrb r1, [r0]
    adds r0, #1
    ldrb r0, [r0]
    lsls r0, r0, #8
    orrs r0, r1
    mov r1, sp
    adds r1, #2
    ldrb r1, [r1]
    lsls r1, r1, #0x10
    orrs r1, r0
    adds r0, r4, #0
    bl __7ProductG4Food
    b .L08026342
.L08026324:
    mov r4, sp
    adds r4, #5
    adds r0, r5, #0
    bl func_0800F258
    adds r1, r0, #0
    adds r0, r4, #0
    bl __7ProductG7Article
    b .L08026342
.L08026338:
    mov r4, sp
    adds r4, #6
    adds r0, r4, #0
    bl __7Product
.L08026342:
    ldrb r0, [r4]
    add sp, #8
    pop {r4, r5}
    pop {r1}
    bx r1

    thumb_func_start func_0802634C
func_0802634C: @ 0x0802634C
    push {r4, r5, r6, r7, lr}
    sub sp, #8
    adds r6, r0, #0
    ldr r0, [r6, #0x38]
    bl func_0800EAF0
    adds r0, r6, #0
    adds r0, #0x88
    movs r5, #0
    movs r7, #1
    strb r7, [r0]
    strb r5, [r0, #1]
    ldr r1, .L080263CC @ =0xFFF80000
    movs r2, #0x88
    lsls r2, r2, #0xd
    str r1, [r0, #4]
    str r5, [r0, #8]
    str r2, [r0, #0x14]
    ldr r4, [r6, #0x10]
    cmp r4, #0
    beq .L0802639C
    ldr r0, [r4]
    ldr r0, [r0]
    ldr r1, [r0]
    ldr r1, [r1, #0x64]
    bl _call_via_r1
    adds r1, r0, #0
    adds r0, r4, #0
    adds r0, #0xb4
    ldr r2, .L080263D0 @ =0x000001DD
    bl func_0805E850
    adds r0, r4, #0
    adds r0, #0xc8
    strb r7, [r0]
    adds r0, #2
    strb r5, [r0]
    adds r0, #1
    strb r7, [r0]
.L0802639C:
    adds r3, r6, #0
    adds r3, #0x3c
    movs r0, #0x2f
    strb r0, [r3]
    adds r2, r6, #0
    adds r2, #0x3d
    movs r0, #0x78
    strb r0, [r2]
    movs r5, #0xc9
    lsls r5, r5, #1
    adds r1, r6, #0
    adds r1, #0x7c
    ldr r0, .L080263D4 @ =0x0000FFFF
    strh r0, [r1]
    ldrb r0, [r3]
    adds r7, r1, #0
    cmp r0, #0x39
    bls .L080263C2
    b .L080267E4
.L080263C2:
    lsls r0, r0, #2
    ldr r1, .L080263D8 @ =.L080263DC
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L080263CC: .4byte 0xFFF80000
.L080263D0: .4byte 0x000001DD
.L080263D4: .4byte 0x0000FFFF
.L080263D8: .4byte .L080263DC
.L080263DC: @ jump table
    .4byte .L080264C4 @ case 0
    .4byte .L0802659E @ case 1
    .4byte .L08026538 @ case 2
    .4byte .L0802659E @ case 3
    .4byte .L08026588 @ case 4
    .4byte .L0802659E @ case 5
    .4byte .L080266BA @ case 6
    .4byte .L080266C6 @ case 7
    .4byte .L080267DA @ case 8
    .4byte .L080265D6 @ case 9
    .4byte .L080267BA @ case 10
    .4byte .L080265BC @ case 11
    .4byte .L080265BC @ case 12
    .4byte .L080265B6 @ case 13
    .4byte .L080265BC @ case 14
    .4byte .L080265C2 @ case 15
    .4byte .L080265C6 @ case 16
    .4byte .L080267A8 @ case 17
    .4byte .L080267B4 @ case 18
    .4byte .L080265CA @ case 19
    .4byte .L080265D0 @ case 20
    .4byte .L080267BA @ case 21
    .4byte .L080266AE @ case 22
    .4byte .L080266B4 @ case 23
    .4byte .L080266C0 @ case 24
    .4byte .L08026624 @ case 25
    .4byte .L08026624 @ case 26
    .4byte .L080265F6 @ case 27
    .4byte .L08026614 @ case 28
    .4byte .L08026614 @ case 29
    .4byte .L08026654 @ case 30
    .4byte .L0802666E @ case 31
    .4byte .L0802668A @ case 32
    .4byte .L080267A8 @ case 33
    .4byte .L08026710 @ case 34
    .4byte .L0802672C @ case 35
    .4byte .L08026744 @ case 36
    .4byte .L0802674A @ case 37
    .4byte .L08026750 @ case 38
    .4byte .L08026754 @ case 39
    .4byte .L08026758 @ case 40
    .4byte .L0802675E @ case 41
    .4byte .L08026764 @ case 42
    .4byte .L08026764 @ case 43
    .4byte .L0802676A @ case 44
    .4byte .L08026780 @ case 45
    .4byte .L080267A4 @ case 46
    .4byte .L080267BA @ case 47
    .4byte .L080267AE @ case 48
    .4byte .L080267A8 @ case 49
    .4byte .L080267AE @ case 50
    .4byte .L080267B4 @ case 51
    .4byte .L080267BA @ case 52
    .4byte .L080267BE @ case 53
    .4byte .L080267A8 @ case 54
    .4byte .L080267A8 @ case 55
    .4byte .L080267AE @ case 56
    .4byte .L080267AE @ case 57
.L080264C4:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L080264F6
    adds r0, r6, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    bne .L080264DE
    b .L080267D0
.L080264DE:
    cmp r0, #1
    bgt .L080264EA
    cmp r0, #0
    bne .L080264E8
    b .L080267AE
.L080264E8:
    b .L080267E4
.L080264EA:
    cmp r0, #2
    beq .L080264F0
    b .L080267E4
.L080264F0:
    movs r5, #0xa7
    lsls r5, r5, #1
    b .L080267E4
.L080264F6:
    adds r0, r6, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    beq .L08026512
    cmp r0, #1
    bgt .L0802650C
    cmp r0, #0
    bne .L0802650A
    b .L08026624
.L0802650A:
    b .L080267E4
.L0802650C:
    cmp r0, #2
    beq .L08026524
    b .L080267E4
.L08026512:
    adds r0, r6, #0
    adds r0, #0xb3
    ldrb r0, [r0]
    movs r1, #0x99
    lsls r1, r1, #1
    cmp r0, #0
    bne .L08026534
    adds r1, #0x94
    b .L08026534
.L08026524:
    adds r0, r6, #0
    adds r0, #0xb3
    ldrb r0, [r0]
    movs r1, #0x99
    lsls r1, r1, #1
    cmp r0, #0
    bne .L08026534
    adds r1, #0x2c
.L08026534:
    adds r5, r1, #0
    b .L080267E4
.L08026538:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08026548
    b .L080267AE
.L08026548:
    adds r0, r6, #0
    adds r0, #0x3f
    ldrb r3, [r0]
    cmp r3, #5
    bgt .L08026624
    cmp r3, #0
    blt .L08026624
    ldr r2, .L08026584 @ =gUnk_080F0FCC
    adds r1, r6, #0
    adds r1, #0x40
    lsls r0, r3, #3
    subs r0, r0, r3
    ldrb r1, [r1]
    adds r0, r0, r1
    lsls r0, r0, #1
    adds r0, r0, r2
    ldrh r5, [r0]
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    mov r1, sp
    strb r0, [r1]
    mov r0, sp
    b .L080266A6
    .align 2, 0
.L08026584: .4byte gUnk_080F0FCC
.L08026588:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xc9
    lsls r5, r5, #1
    cmp r0, #0
    beq .L0802659C
    b .L080267E4
.L0802659C:
    b .L080267AE
.L0802659E:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xc9
    lsls r5, r5, #1
    cmp r0, #0
    beq .L080265B2
    b .L080267E4
.L080265B2:
    subs r5, #0x40
    b .L080267E4
.L080265B6:
    movs r5, #0x9b
    lsls r5, r5, #1
    b .L080267E4
.L080265BC:
    movs r5, #0xcf
    lsls r5, r5, #1
    b .L080267E4
.L080265C2:
    movs r5, #0x4e
    b .L080267E4
.L080265C6:
    movs r5, #0x46
    b .L080267E4
.L080265CA:
    movs r5, #0x9f
    lsls r5, r5, #1
    b .L080267E4
.L080265D0:
    movs r5, #0xa1
    lsls r5, r5, #1
    b .L080267E4
.L080265D6:
    adds r0, r6, #0
    adds r0, #0x44
    ldrh r5, [r0]
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #1
    b .L080266A4
.L080265F6:
    movs r5, #0xf5
    lsls r5, r5, #1
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #2
    b .L080266A4
.L08026614:
    adds r2, r6, #0
    adds r2, #0x4e
    adds r1, r6, #0
    adds r1, #0x4f
    ldrb r0, [r2]
    ldrb r3, [r1]
    cmp r0, r3
    bne .L0802662A
.L08026624:
    movs r5, #0xc9
    lsls r5, r5, #1
    b .L080267E4
.L0802662A:
    ldrb r0, [r1]
    ldrb r1, [r2]
    subs r0, r0, r1
    movs r5, #0xc1
    lsls r5, r5, #1
    cmp r0, #1
    bne .L0802663A
    adds r5, #4
.L0802663A:
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #3
    b .L080266A4
.L08026654:
    movs r5, #0x76
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    add r0, sp, #4
    b .L080266A4
.L0802666E:
    movs r5, #0x6e
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #5
    b .L080266A4
.L0802668A:
    movs r5, #0x72
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #6
.L080266A4:
    strb r1, [r0]
.L080266A6:
    bl GetIconId__C4Tool
    strh r0, [r7]
    b .L080267E4
.L080266AE:
    movs r5, #0xfd
    lsls r5, r5, #1
    b .L080267E4
.L080266B4:
    movs r5, #0xcb
    lsls r5, r5, #1
    b .L080267E4
.L080266BA:
    movs r5, #0x89
    lsls r5, r5, #1
    b .L080267E4
.L080266C0:
    movs r5, #0x8b
    lsls r5, r5, #1
    b .L080267E4
.L080266C6:
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    adds r0, r6, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    beq .L080266F8
    cmp r0, #1
    bgt .L080266E8
    cmp r0, #0
    beq .L080266EE
    b .L080267E4
.L080266E8:
    cmp r0, #2
    beq .L08026704
    b .L080267E4
.L080266EE:
    movs r5, #0xea
    ldr r1, .L080266F4 @ =0x0000077A
    b .L08026792
    .align 2, 0
.L080266F4: .4byte 0x0000077A
.L080266F8:
    movs r5, #0xee
    ldr r1, .L08026700 @ =0x0000077E
    b .L08026792
    .align 2, 0
.L08026700: .4byte 0x0000077E
.L08026704:
    movs r5, #0xe6
    ldr r1, .L0802670C @ =0x00000782
    b .L08026792
    .align 2, 0
.L0802670C: .4byte 0x00000782
.L08026710:
    movs r5, #0xad
    lsls r5, r5, #1
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L08026728 @ =0x0000077A
    b .L08026792
    .align 2, 0
.L08026728: .4byte 0x0000077A
.L0802672C:
    movs r5, #0x9a
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L08026740 @ =0x0000077A
    b .L08026792
    .align 2, 0
.L08026740: .4byte 0x0000077A
.L08026744:
    movs r5, #0x83
    lsls r5, r5, #1
    b .L080267E4
.L0802674A:
    movs r5, #0x81
    lsls r5, r5, #1
    b .L080267E4
.L08026750:
    movs r5, #0xfe
    b .L080267E4
.L08026754:
    movs r5, #0xfa
    b .L080267E4
.L08026758:
    movs r5, #0x91
    lsls r5, r5, #1
    b .L080267E4
.L0802675E:
    movs r5, #0x8f
    lsls r5, r5, #1
    b .L080267E4
.L08026764:
    movs r5, #0x8d
    lsls r5, r5, #1
    b .L080267E4
.L0802676A:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xa5
    lsls r5, r5, #1
    cmp r0, #0
    beq .L080267E4
    subs r5, #0x40
    b .L080267E4
.L08026780:
    movs r5, #0xe2
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L080267A0 @ =0x00000792
.L08026792:
    ldrh r0, [r2, #0x22]
    cmp r0, r1
    beq .L080267E4
    adds r0, r2, #0
    bl SetAnim__12AActorEntityUi
    b .L080267E4
    .align 2, 0
.L080267A0: .4byte 0x00000792
.L080267A4:
    movs r5, #0x3e
    b .L080267E4
.L080267A8:
    movs r5, #0xa3
    lsls r5, r5, #1
    b .L080267E4
.L080267AE:
    movs r5, #0xa9
    lsls r5, r5, #1
    b .L080267E4
.L080267B4:
    movs r5, #0x9d
    lsls r5, r5, #1
    b .L080267E4
.L080267BA:
    movs r5, #0x42
    b .L080267E4
.L080267BE:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xe3
    lsls r5, r5, #1
    cmp r0, #0
    bne .L080267E4
.L080267D0:
    movs r5, #0xab
    lsls r5, r5, #1
    b .L080267E4
.L080267D6:
    ldr r0, [r4]
    b .L0802681E
.L080267DA:
    ldrb r0, [r2]
    movs r5, #0xf6
    cmp r0, #0
    beq .L080267E4
    movs r5, #0xf2
.L080267E4:
    lsls r1, r5, #0x10
    lsrs r1, r1, #0x10
    adds r0, r6, #0
    bl SetAnim__12AActorEntityUi
    ldr r0, [r6]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    adds r6, #0xc0
    cmp r4, r5
    beq .L0802681A
.L08026808:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L080267D6
    adds r4, #4
    cmp r4, r5
    bne .L08026808
.L0802681A:
    subs r0, r5, #4
    ldr r0, [r0]
.L0802681E:
    movs r1, #0xb6
    bl func_08008B6C
    movs r0, #1
    strb r0, [r6]
    add sp, #8
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0

    thumb_func_start func_08026830
func_08026830: @ 0x08026830
    push {r4, r5, r6, r7, lr}
    sub sp, #8
    adds r6, r0, #0
    ldr r0, [r6, #0x38]
    bl func_0800EAFC
    adds r0, r6, #0
    adds r0, #0x88
    movs r5, #0
    movs r7, #1
    strb r7, [r0]
    strb r5, [r0, #1]
    ldr r1, .L080268B0 @ =0xFFF80000
    movs r2, #0x88
    lsls r2, r2, #0xd
    str r1, [r0, #4]
    str r5, [r0, #8]
    str r2, [r0, #0x14]
    ldr r4, [r6, #0x10]
    cmp r4, #0
    beq .L08026880
    ldr r0, [r4]
    ldr r0, [r0]
    ldr r1, [r0]
    ldr r1, [r1, #0x64]
    bl _call_via_r1
    adds r1, r0, #0
    adds r0, r4, #0
    adds r0, #0xb4
    ldr r2, .L080268B4 @ =0x0000015F
    bl func_0805E850
    adds r0, r4, #0
    adds r0, #0xc8
    strb r7, [r0]
    adds r0, #2
    strb r5, [r0]
    adds r0, #1
    strb r7, [r0]
.L08026880:
    adds r3, r6, #0
    adds r3, #0x3c
    movs r0, #0x2f
    strb r0, [r3]
    adds r2, r6, #0
    adds r2, #0x3d
    movs r0, #0x78
    strb r0, [r2]
    movs r5, #0xc9
    lsls r5, r5, #1
    adds r1, r6, #0
    adds r1, #0x7c
    ldr r0, .L080268B8 @ =0x0000FFFF
    strh r0, [r1]
    ldrb r0, [r3]
    adds r7, r1, #0
    cmp r0, #0x39
    bls .L080268A6
    b .L08026CC8
.L080268A6:
    lsls r0, r0, #2
    ldr r1, .L080268BC @ =.L080268C0
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L080268B0: .4byte 0xFFF80000
.L080268B4: .4byte 0x0000015F
.L080268B8: .4byte 0x0000FFFF
.L080268BC: .4byte .L080268C0
.L080268C0: @ jump table
    .4byte .L080269A8 @ case 0
    .4byte .L08026A82 @ case 1
    .4byte .L08026A1C @ case 2
    .4byte .L08026A82 @ case 3
    .4byte .L08026A6C @ case 4
    .4byte .L08026A82 @ case 5
    .4byte .L08026B9E @ case 6
    .4byte .L08026BAA @ case 7
    .4byte .L08026CBE @ case 8
    .4byte .L08026ABA @ case 9
    .4byte .L08026C9E @ case 10
    .4byte .L08026AA0 @ case 11
    .4byte .L08026AA0 @ case 12
    .4byte .L08026A9A @ case 13
    .4byte .L08026AA0 @ case 14
    .4byte .L08026AA6 @ case 15
    .4byte .L08026AAA @ case 16
    .4byte .L08026C8C @ case 17
    .4byte .L08026C98 @ case 18
    .4byte .L08026AAE @ case 19
    .4byte .L08026AB4 @ case 20
    .4byte .L08026C9E @ case 21
    .4byte .L08026B92 @ case 22
    .4byte .L08026B98 @ case 23
    .4byte .L08026BA4 @ case 24
    .4byte .L08026B08 @ case 25
    .4byte .L08026B08 @ case 26
    .4byte .L08026ADA @ case 27
    .4byte .L08026AF8 @ case 28
    .4byte .L08026AF8 @ case 29
    .4byte .L08026B38 @ case 30
    .4byte .L08026B52 @ case 31
    .4byte .L08026B6E @ case 32
    .4byte .L08026C8C @ case 33
    .4byte .L08026BF4 @ case 34
    .4byte .L08026C10 @ case 35
    .4byte .L08026C28 @ case 36
    .4byte .L08026C2E @ case 37
    .4byte .L08026C34 @ case 38
    .4byte .L08026C38 @ case 39
    .4byte .L08026C3C @ case 40
    .4byte .L08026C42 @ case 41
    .4byte .L08026C48 @ case 42
    .4byte .L08026C48 @ case 43
    .4byte .L08026C4E @ case 44
    .4byte .L08026C64 @ case 45
    .4byte .L08026C88 @ case 46
    .4byte .L08026C9E @ case 47
    .4byte .L08026C92 @ case 48
    .4byte .L08026C8C @ case 49
    .4byte .L08026C92 @ case 50
    .4byte .L08026C98 @ case 51
    .4byte .L08026C9E @ case 52
    .4byte .L08026CA2 @ case 53
    .4byte .L08026C8C @ case 54
    .4byte .L08026C8C @ case 55
    .4byte .L08026C92 @ case 56
    .4byte .L08026C92 @ case 57
.L080269A8:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L080269DA
    adds r0, r6, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    bne .L080269C2
    b .L08026CB4
.L080269C2:
    cmp r0, #1
    bgt .L080269CE
    cmp r0, #0
    bne .L080269CC
    b .L08026C92
.L080269CC:
    b .L08026CC8
.L080269CE:
    cmp r0, #2
    beq .L080269D4
    b .L08026CC8
.L080269D4:
    movs r5, #0xa7
    lsls r5, r5, #1
    b .L08026CC8
.L080269DA:
    adds r0, r6, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    beq .L080269F6
    cmp r0, #1
    bgt .L080269F0
    cmp r0, #0
    bne .L080269EE
    b .L08026B08
.L080269EE:
    b .L08026CC8
.L080269F0:
    cmp r0, #2
    beq .L08026A08
    b .L08026CC8
.L080269F6:
    adds r0, r6, #0
    adds r0, #0xb3
    ldrb r0, [r0]
    movs r1, #0x99
    lsls r1, r1, #1
    cmp r0, #0
    bne .L08026A18
    adds r1, #0x94
    b .L08026A18
.L08026A08:
    adds r0, r6, #0
    adds r0, #0xb3
    ldrb r0, [r0]
    movs r1, #0x99
    lsls r1, r1, #1
    cmp r0, #0
    bne .L08026A18
    adds r1, #0x2c
.L08026A18:
    adds r5, r1, #0
    b .L08026CC8
.L08026A1C:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08026A2C
    b .L08026C92
.L08026A2C:
    adds r0, r6, #0
    adds r0, #0x3f
    ldrb r3, [r0]
    cmp r3, #5
    bgt .L08026B08
    cmp r3, #0
    blt .L08026B08
    ldr r2, .L08026A68 @ =gUnk_080F0FCC
    adds r1, r6, #0
    adds r1, #0x40
    lsls r0, r3, #3
    subs r0, r0, r3
    ldrb r1, [r1]
    adds r0, r0, r1
    lsls r0, r0, #1
    adds r0, r0, r2
    ldrh r5, [r0]
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    mov r1, sp
    strb r0, [r1]
    mov r0, sp
    b .L08026B8A
    .align 2, 0
.L08026A68: .4byte gUnk_080F0FCC
.L08026A6C:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xc9
    lsls r5, r5, #1
    cmp r0, #0
    beq .L08026A80
    b .L08026CC8
.L08026A80:
    b .L08026C92
.L08026A82:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xc9
    lsls r5, r5, #1
    cmp r0, #0
    beq .L08026A96
    b .L08026CC8
.L08026A96:
    subs r5, #0x40
    b .L08026CC8
.L08026A9A:
    movs r5, #0x9b
    lsls r5, r5, #1
    b .L08026CC8
.L08026AA0:
    movs r5, #0xcf
    lsls r5, r5, #1
    b .L08026CC8
.L08026AA6:
    movs r5, #0x4e
    b .L08026CC8
.L08026AAA:
    movs r5, #0x46
    b .L08026CC8
.L08026AAE:
    movs r5, #0x9f
    lsls r5, r5, #1
    b .L08026CC8
.L08026AB4:
    movs r5, #0xa1
    lsls r5, r5, #1
    b .L08026CC8
.L08026ABA:
    adds r0, r6, #0
    adds r0, #0x44
    ldrh r5, [r0]
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #1
    b .L08026B88
.L08026ADA:
    movs r5, #0xf5
    lsls r5, r5, #1
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #2
    b .L08026B88
.L08026AF8:
    adds r2, r6, #0
    adds r2, #0x4e
    adds r1, r6, #0
    adds r1, #0x4f
    ldrb r0, [r2]
    ldrb r3, [r1]
    cmp r0, r3
    bne .L08026B0E
.L08026B08:
    movs r5, #0xc9
    lsls r5, r5, #1
    b .L08026CC8
.L08026B0E:
    ldrb r0, [r1]
    ldrb r1, [r2]
    subs r0, r0, r1
    movs r5, #0xc1
    lsls r5, r5, #1
    cmp r0, #1
    bne .L08026B1E
    adds r5, #4
.L08026B1E:
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #3
    b .L08026B88
.L08026B38:
    movs r5, #0x76
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    add r0, sp, #4
    b .L08026B88
.L08026B52:
    movs r5, #0x6e
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #5
    b .L08026B88
.L08026B6E:
    movs r5, #0x72
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #6
.L08026B88:
    strb r1, [r0]
.L08026B8A:
    bl GetIconId__C4Tool
    strh r0, [r7]
    b .L08026CC8
.L08026B92:
    movs r5, #0xfd
    lsls r5, r5, #1
    b .L08026CC8
.L08026B98:
    movs r5, #0xcb
    lsls r5, r5, #1
    b .L08026CC8
.L08026B9E:
    movs r5, #0x89
    lsls r5, r5, #1
    b .L08026CC8
.L08026BA4:
    movs r5, #0x8b
    lsls r5, r5, #1
    b .L08026CC8
.L08026BAA:
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    adds r0, r6, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    beq .L08026BDC
    cmp r0, #1
    bgt .L08026BCC
    cmp r0, #0
    beq .L08026BD2
    b .L08026CC8
.L08026BCC:
    cmp r0, #2
    beq .L08026BE8
    b .L08026CC8
.L08026BD2:
    movs r5, #0xea
    ldr r1, .L08026BD8 @ =0x0000077A
    b .L08026C76
    .align 2, 0
.L08026BD8: .4byte 0x0000077A
.L08026BDC:
    movs r5, #0xee
    ldr r1, .L08026BE4 @ =0x0000077E
    b .L08026C76
    .align 2, 0
.L08026BE4: .4byte 0x0000077E
.L08026BE8:
    movs r5, #0xe6
    ldr r1, .L08026BF0 @ =0x00000782
    b .L08026C76
    .align 2, 0
.L08026BF0: .4byte 0x00000782
.L08026BF4:
    movs r5, #0xad
    lsls r5, r5, #1
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L08026C0C @ =0x0000077A
    b .L08026C76
    .align 2, 0
.L08026C0C: .4byte 0x0000077A
.L08026C10:
    movs r5, #0x9a
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L08026C24 @ =0x0000077A
    b .L08026C76
    .align 2, 0
.L08026C24: .4byte 0x0000077A
.L08026C28:
    movs r5, #0x83
    lsls r5, r5, #1
    b .L08026CC8
.L08026C2E:
    movs r5, #0x81
    lsls r5, r5, #1
    b .L08026CC8
.L08026C34:
    movs r5, #0xfe
    b .L08026CC8
.L08026C38:
    movs r5, #0xfa
    b .L08026CC8
.L08026C3C:
    movs r5, #0x91
    lsls r5, r5, #1
    b .L08026CC8
.L08026C42:
    movs r5, #0x8f
    lsls r5, r5, #1
    b .L08026CC8
.L08026C48:
    movs r5, #0x8d
    lsls r5, r5, #1
    b .L08026CC8
.L08026C4E:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xa5
    lsls r5, r5, #1
    cmp r0, #0
    beq .L08026CC8
    subs r5, #0x40
    b .L08026CC8
.L08026C64:
    movs r5, #0xe2
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L08026C84 @ =0x00000792
.L08026C76:
    ldrh r0, [r2, #0x22]
    cmp r0, r1
    beq .L08026CC8
    adds r0, r2, #0
    bl SetAnim__12AActorEntityUi
    b .L08026CC8
    .align 2, 0
.L08026C84: .4byte 0x00000792
.L08026C88:
    movs r5, #0x3e
    b .L08026CC8
.L08026C8C:
    movs r5, #0xa3
    lsls r5, r5, #1
    b .L08026CC8
.L08026C92:
    movs r5, #0xa9
    lsls r5, r5, #1
    b .L08026CC8
.L08026C98:
    movs r5, #0x9d
    lsls r5, r5, #1
    b .L08026CC8
.L08026C9E:
    movs r5, #0x42
    b .L08026CC8
.L08026CA2:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xe3
    lsls r5, r5, #1
    cmp r0, #0
    bne .L08026CC8
.L08026CB4:
    movs r5, #0xab
    lsls r5, r5, #1
    b .L08026CC8
.L08026CBA:
    ldr r0, [r4]
    b .L08026D02
.L08026CBE:
    ldrb r0, [r2]
    movs r5, #0xf6
    cmp r0, #0
    beq .L08026CC8
    movs r5, #0xf2
.L08026CC8:
    lsls r1, r5, #0x10
    lsrs r1, r1, #0x10
    adds r0, r6, #0
    bl SetAnim__12AActorEntityUi
    ldr r0, [r6]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    adds r6, #0xc0
    cmp r4, r5
    beq .L08026CFE
.L08026CEC:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08026CBA
    adds r4, #4
    cmp r4, r5
    bne .L08026CEC
.L08026CFE:
    subs r0, r5, #4
    ldr r0, [r0]
.L08026D02:
    movs r1, #0xb6
    bl func_08008B6C
    movs r0, #1
    strb r0, [r6]
    add sp, #8
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0

    thumb_func_start func_08026D14
func_08026D14: @ 0x08026D14
    push {r4, r5, r6, r7, lr}
    sub sp, #8
    adds r6, r0, #0
    lsls r1, r1, #0x10
    lsrs r5, r1, #0x10
    adds r1, r6, #0
    adds r1, #0x3c
    movs r4, #0
    movs r0, #0x11
    strb r0, [r1]
    adds r2, r6, #0
    adds r2, #0x88
    movs r0, #1
    strb r0, [r2]
    strb r4, [r2, #1]
    adds r0, r6, #0
    adds r0, #0x20
    ldrb r3, [r0]
    cmp r3, #1
    beq .L08026D6E
    cmp r3, #1
    bgt .L08026D46
    cmp r3, #0
    beq .L08026D7C
    b .L08026D8A
.L08026D46:
    cmp r3, #2
    beq .L08026D50
    cmp r3, #3
    beq .L08026D60
    b .L08026D8A
.L08026D50:
    ldr r0, .L08026D5C @ =0xFFF60000
    movs r1, #0xc0
    lsls r1, r1, #0xc
    str r0, [r2, #4]
    str r4, [r2, #8]
    b .L08026D88
    .align 2, 0
.L08026D5C: .4byte 0xFFF60000
.L08026D60:
    movs r0, #0xa0
    lsls r0, r0, #0xc
    movs r1, #0xc0
    lsls r1, r1, #0xc
    str r0, [r2, #4]
    str r4, [r2, #8]
    b .L08026D88
.L08026D6E:
    ldr r0, .L08026D78 @ =0xFFF60000
    movs r1, #0xc0
    lsls r1, r1, #0xc
    str r4, [r2, #4]
    b .L08026D86
    .align 2, 0
.L08026D78: .4byte 0xFFF60000
.L08026D7C:
    movs r0, #0xa0
    lsls r0, r0, #0xc
    movs r1, #0xc0
    lsls r1, r1, #0xc
    str r3, [r2, #4]
.L08026D86:
    str r0, [r2, #8]
.L08026D88:
    str r1, [r2, #0x14]
.L08026D8A:
    ldr r4, [r6, #0x10]
    cmp r4, #0
    beq .L08026DBA
    ldr r0, [r4]
    ldr r0, [r0]
    ldr r1, [r0]
    ldr r1, [r1, #0x68]
    bl _call_via_r1
    adds r1, r0, #0
    adds r0, r4, #0
    adds r0, #0xb4
    adds r2, r5, #0
    bl func_0805E850
    adds r0, r4, #0
    adds r0, #0xc8
    movs r2, #0
    movs r1, #1
    strb r1, [r0]
    adds r0, #2
    strb r2, [r0]
    adds r0, #1
    strb r1, [r0]
.L08026DBA:
    movs r5, #0xc9
    lsls r5, r5, #1
    adds r0, r6, #0
    adds r0, #0x7c
    ldr r1, .L08026DE0 @ =0x0000FFFF
    strh r1, [r0]
    adds r1, r6, #0
    adds r1, #0x3c
    ldrb r1, [r1]
    adds r7, r0, #0
    cmp r1, #0x39
    bls .L08026DD4
    b .L080271F0
.L08026DD4:
    lsls r0, r1, #2
    ldr r1, .L08026DE4 @ =.L08026DE8
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L08026DE0: .4byte 0x0000FFFF
.L08026DE4: .4byte .L08026DE8
.L08026DE8: @ jump table
    .4byte .L08026ED0 @ case 0
    .4byte .L08026FAA @ case 1
    .4byte .L08026F44 @ case 2
    .4byte .L08026FAA @ case 3
    .4byte .L08026F94 @ case 4
    .4byte .L08026FAA @ case 5
    .4byte .L080270C6 @ case 6
    .4byte .L080270D2 @ case 7
    .4byte .L080271E2 @ case 8
    .4byte .L08026FE2 @ case 9
    .4byte .L080271C6 @ case 10
    .4byte .L08026FC8 @ case 11
    .4byte .L08026FC8 @ case 12
    .4byte .L08026FC2 @ case 13
    .4byte .L08026FC8 @ case 14
    .4byte .L08026FCE @ case 15
    .4byte .L08026FD2 @ case 16
    .4byte .L080271B4 @ case 17
    .4byte .L080271C0 @ case 18
    .4byte .L08026FD6 @ case 19
    .4byte .L08026FDC @ case 20
    .4byte .L080271C6 @ case 21
    .4byte .L080270BA @ case 22
    .4byte .L080270C0 @ case 23
    .4byte .L080270CC @ case 24
    .4byte .L08027030 @ case 25
    .4byte .L08027030 @ case 26
    .4byte .L08027002 @ case 27
    .4byte .L08027020 @ case 28
    .4byte .L08027020 @ case 29
    .4byte .L08027060 @ case 30
    .4byte .L0802707A @ case 31
    .4byte .L08027096 @ case 32
    .4byte .L080271B4 @ case 33
    .4byte .L0802711C @ case 34
    .4byte .L08027138 @ case 35
    .4byte .L08027150 @ case 36
    .4byte .L08027156 @ case 37
    .4byte .L0802715C @ case 38
    .4byte .L08027160 @ case 39
    .4byte .L08027164 @ case 40
    .4byte .L0802716A @ case 41
    .4byte .L08027170 @ case 42
    .4byte .L08027170 @ case 43
    .4byte .L08027176 @ case 44
    .4byte .L0802718C @ case 45
    .4byte .L080271B0 @ case 46
    .4byte .L080271C6 @ case 47
    .4byte .L080271BA @ case 48
    .4byte .L080271B4 @ case 49
    .4byte .L080271BA @ case 50
    .4byte .L080271C0 @ case 51
    .4byte .L080271C6 @ case 52
    .4byte .L080271CA @ case 53
    .4byte .L080271B4 @ case 54
    .4byte .L080271B4 @ case 55
    .4byte .L080271BA @ case 56
    .4byte .L080271BA @ case 57
.L08026ED0:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08026F02
    adds r0, r6, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    bne .L08026EEA
    b .L080271DC
.L08026EEA:
    cmp r0, #1
    bgt .L08026EF6
    cmp r0, #0
    bne .L08026EF4
    b .L080271BA
.L08026EF4:
    b .L080271F0
.L08026EF6:
    cmp r0, #2
    beq .L08026EFC
    b .L080271F0
.L08026EFC:
    movs r5, #0xa7
    lsls r5, r5, #1
    b .L080271F0
.L08026F02:
    adds r0, r6, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    beq .L08026F1E
    cmp r0, #1
    bgt .L08026F18
    cmp r0, #0
    bne .L08026F16
    b .L08027030
.L08026F16:
    b .L080271F0
.L08026F18:
    cmp r0, #2
    beq .L08026F30
    b .L080271F0
.L08026F1E:
    adds r0, r6, #0
    adds r0, #0xb3
    ldrb r0, [r0]
    movs r1, #0x99
    lsls r1, r1, #1
    cmp r0, #0
    bne .L08026F40
    adds r1, #0x94
    b .L08026F40
.L08026F30:
    adds r0, r6, #0
    adds r0, #0xb3
    ldrb r0, [r0]
    movs r1, #0x99
    lsls r1, r1, #1
    cmp r0, #0
    bne .L08026F40
    adds r1, #0x2c
.L08026F40:
    adds r5, r1, #0
    b .L080271F0
.L08026F44:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08026F54
    b .L080271BA
.L08026F54:
    adds r0, r6, #0
    adds r0, #0x3f
    ldrb r3, [r0]
    cmp r3, #5
    bgt .L08027030
    cmp r3, #0
    blt .L08027030
    ldr r2, .L08026F90 @ =gUnk_080F0FCC
    adds r1, r6, #0
    adds r1, #0x40
    lsls r0, r3, #3
    subs r0, r0, r3
    ldrb r1, [r1]
    adds r0, r0, r1
    lsls r0, r0, #1
    adds r0, r0, r2
    ldrh r5, [r0]
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    mov r1, sp
    strb r0, [r1]
    mov r0, sp
    b .L080270B2
    .align 2, 0
.L08026F90: .4byte gUnk_080F0FCC
.L08026F94:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xc9
    lsls r5, r5, #1
    cmp r0, #0
    beq .L08026FA8
    b .L080271F0
.L08026FA8:
    b .L080271BA
.L08026FAA:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xc9
    lsls r5, r5, #1
    cmp r0, #0
    beq .L08026FBE
    b .L080271F0
.L08026FBE:
    subs r5, #0x40
    b .L080271F0
.L08026FC2:
    movs r5, #0x9b
    lsls r5, r5, #1
    b .L080271F0
.L08026FC8:
    movs r5, #0xcf
    lsls r5, r5, #1
    b .L080271F0
.L08026FCE:
    movs r5, #0x4e
    b .L080271F0
.L08026FD2:
    movs r5, #0x46
    b .L080271F0
.L08026FD6:
    movs r5, #0x9f
    lsls r5, r5, #1
    b .L080271F0
.L08026FDC:
    movs r5, #0xa1
    lsls r5, r5, #1
    b .L080271F0
.L08026FE2:
    adds r0, r6, #0
    adds r0, #0x44
    ldrh r5, [r0]
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #1
    b .L080270B0
.L08027002:
    movs r5, #0xf5
    lsls r5, r5, #1
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #2
    b .L080270B0
.L08027020:
    adds r2, r6, #0
    adds r2, #0x4e
    adds r1, r6, #0
    adds r1, #0x4f
    ldrb r0, [r2]
    ldrb r3, [r1]
    cmp r0, r3
    bne .L08027036
.L08027030:
    movs r5, #0xc9
    lsls r5, r5, #1
    b .L080271F0
.L08027036:
    ldrb r0, [r1]
    ldrb r1, [r2]
    subs r0, r0, r1
    movs r5, #0xc1
    lsls r5, r5, #1
    cmp r0, #1
    bne .L08027046
    adds r5, #4
.L08027046:
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #3
    b .L080270B0
.L08027060:
    movs r5, #0x76
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    add r0, sp, #4
    b .L080270B0
.L0802707A:
    movs r5, #0x6e
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #5
    b .L080270B0
.L08027096:
    movs r5, #0x72
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #6
.L080270B0:
    strb r1, [r0]
.L080270B2:
    bl GetIconId__C4Tool
    strh r0, [r7]
    b .L080271F0
.L080270BA:
    movs r5, #0xfd
    lsls r5, r5, #1
    b .L080271F0
.L080270C0:
    movs r5, #0xcb
    lsls r5, r5, #1
    b .L080271F0
.L080270C6:
    movs r5, #0x89
    lsls r5, r5, #1
    b .L080271F0
.L080270CC:
    movs r5, #0x8b
    lsls r5, r5, #1
    b .L080271F0
.L080270D2:
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    adds r0, r6, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    beq .L08027104
    cmp r0, #1
    bgt .L080270F4
    cmp r0, #0
    beq .L080270FA
    b .L080271F0
.L080270F4:
    cmp r0, #2
    beq .L08027110
    b .L080271F0
.L080270FA:
    movs r5, #0xea
    ldr r1, .L08027100 @ =0x0000077A
    b .L0802719E
    .align 2, 0
.L08027100: .4byte 0x0000077A
.L08027104:
    movs r5, #0xee
    ldr r1, .L0802710C @ =0x0000077E
    b .L0802719E
    .align 2, 0
.L0802710C: .4byte 0x0000077E
.L08027110:
    movs r5, #0xe6
    ldr r1, .L08027118 @ =0x00000782
    b .L0802719E
    .align 2, 0
.L08027118: .4byte 0x00000782
.L0802711C:
    movs r5, #0xad
    lsls r5, r5, #1
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L08027134 @ =0x0000077A
    b .L0802719E
    .align 2, 0
.L08027134: .4byte 0x0000077A
.L08027138:
    movs r5, #0x9a
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L0802714C @ =0x0000077A
    b .L0802719E
    .align 2, 0
.L0802714C: .4byte 0x0000077A
.L08027150:
    movs r5, #0x83
    lsls r5, r5, #1
    b .L080271F0
.L08027156:
    movs r5, #0x81
    lsls r5, r5, #1
    b .L080271F0
.L0802715C:
    movs r5, #0xfe
    b .L080271F0
.L08027160:
    movs r5, #0xfa
    b .L080271F0
.L08027164:
    movs r5, #0x91
    lsls r5, r5, #1
    b .L080271F0
.L0802716A:
    movs r5, #0x8f
    lsls r5, r5, #1
    b .L080271F0
.L08027170:
    movs r5, #0x8d
    lsls r5, r5, #1
    b .L080271F0
.L08027176:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xa5
    lsls r5, r5, #1
    cmp r0, #0
    beq .L080271F0
    subs r5, #0x40
    b .L080271F0
.L0802718C:
    movs r5, #0xe2
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L080271AC @ =0x00000792
.L0802719E:
    ldrh r0, [r2, #0x22]
    cmp r0, r1
    beq .L080271F0
    adds r0, r2, #0
    bl SetAnim__12AActorEntityUi
    b .L080271F0
    .align 2, 0
.L080271AC: .4byte 0x00000792
.L080271B0:
    movs r5, #0x3e
    b .L080271F0
.L080271B4:
    movs r5, #0xa3
    lsls r5, r5, #1
    b .L080271F0
.L080271BA:
    movs r5, #0xa9
    lsls r5, r5, #1
    b .L080271F0
.L080271C0:
    movs r5, #0x9d
    lsls r5, r5, #1
    b .L080271F0
.L080271C6:
    movs r5, #0x42
    b .L080271F0
.L080271CA:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xe3
    lsls r5, r5, #1
    cmp r0, #0
    bne .L080271F0
.L080271DC:
    movs r5, #0xab
    lsls r5, r5, #1
    b .L080271F0
.L080271E2:
    adds r0, r6, #0
    adds r0, #0x3d
    ldrb r0, [r0]
    movs r5, #0xf6
    cmp r0, #0
    beq .L080271F0
    movs r5, #0xf2
.L080271F0:
    lsls r1, r5, #0x10
    lsrs r1, r1, #0x10
    adds r0, r6, #0
    bl SetAnim__12AActorEntityUi
    adds r1, r6, #0
    adds r1, #0xc0
    movs r0, #1
    strb r0, [r1]
    add sp, #8
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_0802720C
func_0802720C: @ 0x0802720C
    push {r4, r5, r6, r7, lr}
    mov r7, sb
    mov r6, r8
    push {r6, r7}
    sub sp, #8
    adds r6, r0, #0
    mov sb, r1
    adds r0, #0x88
    movs r7, #0
    movs r1, #1
    mov r8, r1
    mov r2, r8
    strb r2, [r0]
    strb r7, [r0, #1]
    ldr r1, .L080272B4 @ =0xFFF80000
    movs r2, #0x88
    lsls r2, r2, #0xd
    str r1, [r0, #4]
    str r7, [r0, #8]
    str r2, [r0, #0x14]
    ldr r5, [r6, #0x10]
    cmp r5, #0
    beq .L0802726E
    mov r0, sb
    bl GetIconId__C4Tool
    adds r4, r0, #0
    lsls r4, r4, #0x10
    lsrs r4, r4, #0x10
    ldr r0, [r5]
    ldr r0, [r0]
    ldr r1, [r0]
    ldr r1, [r1, #0x64]
    bl _call_via_r1
    adds r1, r0, #0
    adds r0, r5, #0
    adds r0, #0xb4
    adds r2, r4, #0
    bl func_0805E850
    adds r0, r5, #0
    adds r0, #0xc8
    mov r3, r8
    strb r3, [r0]
    adds r0, #2
    strb r7, [r0]
    adds r0, #1
    strb r3, [r0]
.L0802726E:
    ldr r4, [r6, #0x38]
    adds r4, #0x60
    mov r0, sb
    bl GetId__C4Tool
    adds r1, r0, #0
    adds r0, r4, #0
    movs r2, #1
    bl AddAmountOfTool__8RucksackUiUi
    adds r3, r6, #0
    adds r3, #0x3c
    movs r0, #0x34
    strb r0, [r3]
    adds r2, r6, #0
    adds r2, #0x3d
    movs r0, #0x78
    strb r0, [r2]
    movs r5, #0xc9
    lsls r5, r5, #1
    adds r1, r6, #0
    adds r1, #0x7c
    ldr r0, .L080272B8 @ =0x0000FFFF
    strh r0, [r1]
    ldrb r0, [r3]
    adds r7, r1, #0
    cmp r0, #0x39
    bls .L080272A8
    b .L080276C8
.L080272A8:
    lsls r0, r0, #2
    ldr r1, .L080272BC @ =.L080272C0
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L080272B4: .4byte 0xFFF80000
.L080272B8: .4byte 0x0000FFFF
.L080272BC: .4byte .L080272C0
.L080272C0: @ jump table
    .4byte .L080273A8 @ case 0
    .4byte .L08027482 @ case 1
    .4byte .L0802741C @ case 2
    .4byte .L08027482 @ case 3
    .4byte .L0802746C @ case 4
    .4byte .L08027482 @ case 5
    .4byte .L0802759E @ case 6
    .4byte .L080275AA @ case 7
    .4byte .L080276BE @ case 8
    .4byte .L080274BA @ case 9
    .4byte .L0802769E @ case 10
    .4byte .L080274A0 @ case 11
    .4byte .L080274A0 @ case 12
    .4byte .L0802749A @ case 13
    .4byte .L080274A0 @ case 14
    .4byte .L080274A6 @ case 15
    .4byte .L080274AA @ case 16
    .4byte .L0802768C @ case 17
    .4byte .L08027698 @ case 18
    .4byte .L080274AE @ case 19
    .4byte .L080274B4 @ case 20
    .4byte .L0802769E @ case 21
    .4byte .L08027592 @ case 22
    .4byte .L08027598 @ case 23
    .4byte .L080275A4 @ case 24
    .4byte .L08027508 @ case 25
    .4byte .L08027508 @ case 26
    .4byte .L080274DA @ case 27
    .4byte .L080274F8 @ case 28
    .4byte .L080274F8 @ case 29
    .4byte .L08027538 @ case 30
    .4byte .L08027552 @ case 31
    .4byte .L0802756E @ case 32
    .4byte .L0802768C @ case 33
    .4byte .L080275F4 @ case 34
    .4byte .L08027610 @ case 35
    .4byte .L08027628 @ case 36
    .4byte .L0802762E @ case 37
    .4byte .L08027634 @ case 38
    .4byte .L08027638 @ case 39
    .4byte .L0802763C @ case 40
    .4byte .L08027642 @ case 41
    .4byte .L08027648 @ case 42
    .4byte .L08027648 @ case 43
    .4byte .L0802764E @ case 44
    .4byte .L08027664 @ case 45
    .4byte .L08027688 @ case 46
    .4byte .L0802769E @ case 47
    .4byte .L08027692 @ case 48
    .4byte .L0802768C @ case 49
    .4byte .L08027692 @ case 50
    .4byte .L08027698 @ case 51
    .4byte .L0802769E @ case 52
    .4byte .L080276A2 @ case 53
    .4byte .L0802768C @ case 54
    .4byte .L0802768C @ case 55
    .4byte .L08027692 @ case 56
    .4byte .L08027692 @ case 57
.L080273A8:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L080273DA
    adds r0, r6, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    bne .L080273C2
    b .L080276B4
.L080273C2:
    cmp r0, #1
    bgt .L080273CE
    cmp r0, #0
    bne .L080273CC
    b .L08027692
.L080273CC:
    b .L080276C8
.L080273CE:
    cmp r0, #2
    beq .L080273D4
    b .L080276C8
.L080273D4:
    movs r5, #0xa7
    lsls r5, r5, #1
    b .L080276C8
.L080273DA:
    adds r0, r6, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    beq .L080273F6
    cmp r0, #1
    bgt .L080273F0
    cmp r0, #0
    bne .L080273EE
    b .L08027508
.L080273EE:
    b .L080276C8
.L080273F0:
    cmp r0, #2
    beq .L08027408
    b .L080276C8
.L080273F6:
    adds r0, r6, #0
    adds r0, #0xb3
    ldrb r0, [r0]
    movs r1, #0x99
    lsls r1, r1, #1
    cmp r0, #0
    bne .L08027418
    adds r1, #0x94
    b .L08027418
.L08027408:
    adds r0, r6, #0
    adds r0, #0xb3
    ldrb r0, [r0]
    movs r1, #0x99
    lsls r1, r1, #1
    cmp r0, #0
    bne .L08027418
    adds r1, #0x2c
.L08027418:
    adds r5, r1, #0
    b .L080276C8
.L0802741C:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0802742C
    b .L08027692
.L0802742C:
    adds r0, r6, #0
    adds r0, #0x3f
    ldrb r3, [r0]
    cmp r3, #5
    bgt .L08027508
    cmp r3, #0
    blt .L08027508
    ldr r2, .L08027468 @ =gUnk_080F0FCC
    adds r1, r6, #0
    adds r1, #0x40
    lsls r0, r3, #3
    subs r0, r0, r3
    ldrb r1, [r1]
    adds r0, r0, r1
    lsls r0, r0, #1
    adds r0, r0, r2
    ldrh r5, [r0]
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    mov r1, sp
    strb r0, [r1]
    mov r0, sp
    b .L0802758A
    .align 2, 0
.L08027468: .4byte gUnk_080F0FCC
.L0802746C:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xc9
    lsls r5, r5, #1
    cmp r0, #0
    beq .L08027480
    b .L080276C8
.L08027480:
    b .L08027692
.L08027482:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xc9
    lsls r5, r5, #1
    cmp r0, #0
    beq .L08027496
    b .L080276C8
.L08027496:
    subs r5, #0x40
    b .L080276C8
.L0802749A:
    movs r5, #0x9b
    lsls r5, r5, #1
    b .L080276C8
.L080274A0:
    movs r5, #0xcf
    lsls r5, r5, #1
    b .L080276C8
.L080274A6:
    movs r5, #0x4e
    b .L080276C8
.L080274AA:
    movs r5, #0x46
    b .L080276C8
.L080274AE:
    movs r5, #0x9f
    lsls r5, r5, #1
    b .L080276C8
.L080274B4:
    movs r5, #0xa1
    lsls r5, r5, #1
    b .L080276C8
.L080274BA:
    adds r0, r6, #0
    adds r0, #0x44
    ldrh r5, [r0]
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #1
    b .L08027588
.L080274DA:
    movs r5, #0xf5
    lsls r5, r5, #1
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #2
    b .L08027588
.L080274F8:
    adds r2, r6, #0
    adds r2, #0x4e
    adds r1, r6, #0
    adds r1, #0x4f
    ldrb r0, [r2]
    ldrb r3, [r1]
    cmp r0, r3
    bne .L0802750E
.L08027508:
    movs r5, #0xc9
    lsls r5, r5, #1
    b .L080276C8
.L0802750E:
    ldrb r0, [r1]
    ldrb r1, [r2]
    subs r0, r0, r1
    movs r5, #0xc1
    lsls r5, r5, #1
    cmp r0, #1
    bne .L0802751E
    adds r5, #4
.L0802751E:
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #3
    b .L08027588
.L08027538:
    movs r5, #0x76
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    add r0, sp, #4
    b .L08027588
.L08027552:
    movs r5, #0x6e
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #5
    b .L08027588
.L0802756E:
    movs r5, #0x72
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #6
.L08027588:
    strb r1, [r0]
.L0802758A:
    bl GetIconId__C4Tool
    strh r0, [r7]
    b .L080276C8
.L08027592:
    movs r5, #0xfd
    lsls r5, r5, #1
    b .L080276C8
.L08027598:
    movs r5, #0xcb
    lsls r5, r5, #1
    b .L080276C8
.L0802759E:
    movs r5, #0x89
    lsls r5, r5, #1
    b .L080276C8
.L080275A4:
    movs r5, #0x8b
    lsls r5, r5, #1
    b .L080276C8
.L080275AA:
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    adds r0, r6, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    beq .L080275DC
    cmp r0, #1
    bgt .L080275CC
    cmp r0, #0
    beq .L080275D2
    b .L080276C8
.L080275CC:
    cmp r0, #2
    beq .L080275E8
    b .L080276C8
.L080275D2:
    movs r5, #0xea
    ldr r1, .L080275D8 @ =0x0000077A
    b .L08027676
    .align 2, 0
.L080275D8: .4byte 0x0000077A
.L080275DC:
    movs r5, #0xee
    ldr r1, .L080275E4 @ =0x0000077E
    b .L08027676
    .align 2, 0
.L080275E4: .4byte 0x0000077E
.L080275E8:
    movs r5, #0xe6
    ldr r1, .L080275F0 @ =0x00000782
    b .L08027676
    .align 2, 0
.L080275F0: .4byte 0x00000782
.L080275F4:
    movs r5, #0xad
    lsls r5, r5, #1
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L0802760C @ =0x0000077A
    b .L08027676
    .align 2, 0
.L0802760C: .4byte 0x0000077A
.L08027610:
    movs r5, #0x9a
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L08027624 @ =0x0000077A
    b .L08027676
    .align 2, 0
.L08027624: .4byte 0x0000077A
.L08027628:
    movs r5, #0x83
    lsls r5, r5, #1
    b .L080276C8
.L0802762E:
    movs r5, #0x81
    lsls r5, r5, #1
    b .L080276C8
.L08027634:
    movs r5, #0xfe
    b .L080276C8
.L08027638:
    movs r5, #0xfa
    b .L080276C8
.L0802763C:
    movs r5, #0x91
    lsls r5, r5, #1
    b .L080276C8
.L08027642:
    movs r5, #0x8f
    lsls r5, r5, #1
    b .L080276C8
.L08027648:
    movs r5, #0x8d
    lsls r5, r5, #1
    b .L080276C8
.L0802764E:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xa5
    lsls r5, r5, #1
    cmp r0, #0
    beq .L080276C8
    subs r5, #0x40
    b .L080276C8
.L08027664:
    movs r5, #0xe2
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L08027684 @ =0x00000792
.L08027676:
    ldrh r0, [r2, #0x22]
    cmp r0, r1
    beq .L080276C8
    adds r0, r2, #0
    bl SetAnim__12AActorEntityUi
    b .L080276C8
    .align 2, 0
.L08027684: .4byte 0x00000792
.L08027688:
    movs r5, #0x3e
    b .L080276C8
.L0802768C:
    movs r5, #0xa3
    lsls r5, r5, #1
    b .L080276C8
.L08027692:
    movs r5, #0xa9
    lsls r5, r5, #1
    b .L080276C8
.L08027698:
    movs r5, #0x9d
    lsls r5, r5, #1
    b .L080276C8
.L0802769E:
    movs r5, #0x42
    b .L080276C8
.L080276A2:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xe3
    lsls r5, r5, #1
    cmp r0, #0
    bne .L080276C8
.L080276B4:
    movs r5, #0xab
    lsls r5, r5, #1
    b .L080276C8
.L080276BA:
    ldr r0, [r4]
    b .L08027702
.L080276BE:
    ldrb r0, [r2]
    movs r5, #0xf6
    cmp r0, #0
    beq .L080276C8
    movs r5, #0xf2
.L080276C8:
    lsls r1, r5, #0x10
    lsrs r1, r1, #0x10
    adds r0, r6, #0
    bl SetAnim__12AActorEntityUi
    ldr r0, [r6]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    adds r6, #0xc0
    cmp r4, r5
    beq .L080276FE
.L080276EC:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L080276BA
    adds r4, #4
    cmp r4, r5
    bne .L080276EC
.L080276FE:
    subs r0, r5, #4
    ldr r0, [r0]
.L08027702:
    movs r1, #0xbc
    bl func_08008B6C
    movs r0, #1
    strb r0, [r6]
    add sp, #8
    pop {r3, r4}
    mov r8, r3
    mov sb, r4
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_0802771C
func_0802771C: @ 0x0802771C
    push {r4, r5, r6, r7, lr}
    sub sp, #8
    adds r6, r0, #0
    ldr r0, [r6, #0x34]
    ldr r2, .L08027798 @ =0x00001AA8
    adds r0, r0, r2
    bl func_0809ABD8
    adds r0, r6, #0
    adds r0, #0x88
    movs r5, #0
    movs r7, #1
    strb r7, [r0]
    strb r5, [r0, #1]
    movs r1, #0xa8
    lsls r1, r1, #0xd
    str r5, [r0, #4]
    str r5, [r0, #8]
    str r1, [r0, #0x14]
    ldr r4, [r6, #0x10]
    cmp r4, #0
    beq .L0802776E
    ldr r0, [r4]
    ldr r0, [r0]
    ldr r1, [r0]
    ldr r1, [r1, #0x64]
    bl _call_via_r1
    adds r1, r0, #0
    adds r0, r4, #0
    adds r0, #0xb4
    movs r2, #0x6a
    bl func_0805E850
    adds r0, r4, #0
    adds r0, #0xc8
    strb r7, [r0]
    adds r0, #2
    strb r5, [r0]
    adds r0, #1
    strb r7, [r0]
.L0802776E:
    adds r2, r6, #0
    adds r2, #0x3c
    movs r0, #0x31
    strb r0, [r2]
    movs r5, #0xc9
    lsls r5, r5, #1
    adds r1, r6, #0
    adds r1, #0x7c
    ldr r0, .L0802779C @ =0x0000FFFF
    strh r0, [r1]
    ldrb r0, [r2]
    adds r7, r1, #0
    cmp r0, #0x39
    bls .L0802778C
    b .L08027BB0
.L0802778C:
    lsls r0, r0, #2
    ldr r1, .L080277A0 @ =.L080277A4
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L08027798: .4byte 0x00001AA8
.L0802779C: .4byte 0x0000FFFF
.L080277A0: .4byte .L080277A4
.L080277A4: @ jump table
    .4byte .L0802788C @ case 0
    .4byte .L08027966 @ case 1
    .4byte .L08027900 @ case 2
    .4byte .L08027966 @ case 3
    .4byte .L08027950 @ case 4
    .4byte .L08027966 @ case 5
    .4byte .L08027A82 @ case 6
    .4byte .L08027A8E @ case 7
    .4byte .L08027BA2 @ case 8
    .4byte .L0802799E @ case 9
    .4byte .L08027B82 @ case 10
    .4byte .L08027984 @ case 11
    .4byte .L08027984 @ case 12
    .4byte .L0802797E @ case 13
    .4byte .L08027984 @ case 14
    .4byte .L0802798A @ case 15
    .4byte .L0802798E @ case 16
    .4byte .L08027B70 @ case 17
    .4byte .L08027B7C @ case 18
    .4byte .L08027992 @ case 19
    .4byte .L08027998 @ case 20
    .4byte .L08027B82 @ case 21
    .4byte .L08027A76 @ case 22
    .4byte .L08027A7C @ case 23
    .4byte .L08027A88 @ case 24
    .4byte .L080279EC @ case 25
    .4byte .L080279EC @ case 26
    .4byte .L080279BE @ case 27
    .4byte .L080279DC @ case 28
    .4byte .L080279DC @ case 29
    .4byte .L08027A1C @ case 30
    .4byte .L08027A36 @ case 31
    .4byte .L08027A52 @ case 32
    .4byte .L08027B70 @ case 33
    .4byte .L08027AD8 @ case 34
    .4byte .L08027AF4 @ case 35
    .4byte .L08027B0C @ case 36
    .4byte .L08027B12 @ case 37
    .4byte .L08027B18 @ case 38
    .4byte .L08027B1C @ case 39
    .4byte .L08027B20 @ case 40
    .4byte .L08027B26 @ case 41
    .4byte .L08027B2C @ case 42
    .4byte .L08027B2C @ case 43
    .4byte .L08027B32 @ case 44
    .4byte .L08027B48 @ case 45
    .4byte .L08027B6C @ case 46
    .4byte .L08027B82 @ case 47
    .4byte .L08027B76 @ case 48
    .4byte .L08027B70 @ case 49
    .4byte .L08027B76 @ case 50
    .4byte .L08027B7C @ case 51
    .4byte .L08027B82 @ case 52
    .4byte .L08027B86 @ case 53
    .4byte .L08027B70 @ case 54
    .4byte .L08027B70 @ case 55
    .4byte .L08027B76 @ case 56
    .4byte .L08027B76 @ case 57
.L0802788C:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L080278BE
    adds r0, r6, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    bne .L080278A6
    b .L08027B98
.L080278A6:
    cmp r0, #1
    bgt .L080278B2
    cmp r0, #0
    bne .L080278B0
    b .L08027B76
.L080278B0:
    b .L08027BB0
.L080278B2:
    cmp r0, #2
    beq .L080278B8
    b .L08027BB0
.L080278B8:
    movs r5, #0xa7
    lsls r5, r5, #1
    b .L08027BB0
.L080278BE:
    adds r0, r6, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    beq .L080278DA
    cmp r0, #1
    bgt .L080278D4
    cmp r0, #0
    bne .L080278D2
    b .L080279EC
.L080278D2:
    b .L08027BB0
.L080278D4:
    cmp r0, #2
    beq .L080278EC
    b .L08027BB0
.L080278DA:
    adds r0, r6, #0
    adds r0, #0xb3
    ldrb r0, [r0]
    movs r1, #0x99
    lsls r1, r1, #1
    cmp r0, #0
    bne .L080278FC
    adds r1, #0x94
    b .L080278FC
.L080278EC:
    adds r0, r6, #0
    adds r0, #0xb3
    ldrb r0, [r0]
    movs r1, #0x99
    lsls r1, r1, #1
    cmp r0, #0
    bne .L080278FC
    adds r1, #0x2c
.L080278FC:
    adds r5, r1, #0
    b .L08027BB0
.L08027900:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08027910
    b .L08027B76
.L08027910:
    adds r0, r6, #0
    adds r0, #0x3f
    ldrb r3, [r0]
    cmp r3, #5
    bgt .L080279EC
    cmp r3, #0
    blt .L080279EC
    ldr r2, .L0802794C @ =gUnk_080F0FCC
    adds r1, r6, #0
    adds r1, #0x40
    lsls r0, r3, #3
    subs r0, r0, r3
    ldrb r1, [r1]
    adds r0, r0, r1
    lsls r0, r0, #1
    adds r0, r0, r2
    ldrh r5, [r0]
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    mov r1, sp
    strb r0, [r1]
    mov r0, sp
    b .L08027A6E
    .align 2, 0
.L0802794C: .4byte gUnk_080F0FCC
.L08027950:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xc9
    lsls r5, r5, #1
    cmp r0, #0
    beq .L08027964
    b .L08027BB0
.L08027964:
    b .L08027B76
.L08027966:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xc9
    lsls r5, r5, #1
    cmp r0, #0
    beq .L0802797A
    b .L08027BB0
.L0802797A:
    subs r5, #0x40
    b .L08027BB0
.L0802797E:
    movs r5, #0x9b
    lsls r5, r5, #1
    b .L08027BB0
.L08027984:
    movs r5, #0xcf
    lsls r5, r5, #1
    b .L08027BB0
.L0802798A:
    movs r5, #0x4e
    b .L08027BB0
.L0802798E:
    movs r5, #0x46
    b .L08027BB0
.L08027992:
    movs r5, #0x9f
    lsls r5, r5, #1
    b .L08027BB0
.L08027998:
    movs r5, #0xa1
    lsls r5, r5, #1
    b .L08027BB0
.L0802799E:
    adds r0, r6, #0
    adds r0, #0x44
    ldrh r5, [r0]
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #1
    b .L08027A6C
.L080279BE:
    movs r5, #0xf5
    lsls r5, r5, #1
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #2
    b .L08027A6C
.L080279DC:
    adds r2, r6, #0
    adds r2, #0x4e
    adds r1, r6, #0
    adds r1, #0x4f
    ldrb r0, [r2]
    ldrb r3, [r1]
    cmp r0, r3
    bne .L080279F2
.L080279EC:
    movs r5, #0xc9
    lsls r5, r5, #1
    b .L08027BB0
.L080279F2:
    ldrb r0, [r1]
    ldrb r1, [r2]
    subs r0, r0, r1
    movs r5, #0xc1
    lsls r5, r5, #1
    cmp r0, #1
    bne .L08027A02
    adds r5, #4
.L08027A02:
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #3
    b .L08027A6C
.L08027A1C:
    movs r5, #0x76
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    add r0, sp, #4
    b .L08027A6C
.L08027A36:
    movs r5, #0x6e
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #5
    b .L08027A6C
.L08027A52:
    movs r5, #0x72
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #6
.L08027A6C:
    strb r1, [r0]
.L08027A6E:
    bl GetIconId__C4Tool
    strh r0, [r7]
    b .L08027BB0
.L08027A76:
    movs r5, #0xfd
    lsls r5, r5, #1
    b .L08027BB0
.L08027A7C:
    movs r5, #0xcb
    lsls r5, r5, #1
    b .L08027BB0
.L08027A82:
    movs r5, #0x89
    lsls r5, r5, #1
    b .L08027BB0
.L08027A88:
    movs r5, #0x8b
    lsls r5, r5, #1
    b .L08027BB0
.L08027A8E:
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    adds r0, r6, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    beq .L08027AC0
    cmp r0, #1
    bgt .L08027AB0
    cmp r0, #0
    beq .L08027AB6
    b .L08027BB0
.L08027AB0:
    cmp r0, #2
    beq .L08027ACC
    b .L08027BB0
.L08027AB6:
    movs r5, #0xea
    ldr r1, .L08027ABC @ =0x0000077A
    b .L08027B5A
    .align 2, 0
.L08027ABC: .4byte 0x0000077A
.L08027AC0:
    movs r5, #0xee
    ldr r1, .L08027AC8 @ =0x0000077E
    b .L08027B5A
    .align 2, 0
.L08027AC8: .4byte 0x0000077E
.L08027ACC:
    movs r5, #0xe6
    ldr r1, .L08027AD4 @ =0x00000782
    b .L08027B5A
    .align 2, 0
.L08027AD4: .4byte 0x00000782
.L08027AD8:
    movs r5, #0xad
    lsls r5, r5, #1
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L08027AF0 @ =0x0000077A
    b .L08027B5A
    .align 2, 0
.L08027AF0: .4byte 0x0000077A
.L08027AF4:
    movs r5, #0x9a
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L08027B08 @ =0x0000077A
    b .L08027B5A
    .align 2, 0
.L08027B08: .4byte 0x0000077A
.L08027B0C:
    movs r5, #0x83
    lsls r5, r5, #1
    b .L08027BB0
.L08027B12:
    movs r5, #0x81
    lsls r5, r5, #1
    b .L08027BB0
.L08027B18:
    movs r5, #0xfe
    b .L08027BB0
.L08027B1C:
    movs r5, #0xfa
    b .L08027BB0
.L08027B20:
    movs r5, #0x91
    lsls r5, r5, #1
    b .L08027BB0
.L08027B26:
    movs r5, #0x8f
    lsls r5, r5, #1
    b .L08027BB0
.L08027B2C:
    movs r5, #0x8d
    lsls r5, r5, #1
    b .L08027BB0
.L08027B32:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xa5
    lsls r5, r5, #1
    cmp r0, #0
    beq .L08027BB0
    subs r5, #0x40
    b .L08027BB0
.L08027B48:
    movs r5, #0xe2
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L08027B68 @ =0x00000792
.L08027B5A:
    ldrh r0, [r2, #0x22]
    cmp r0, r1
    beq .L08027BB0
    adds r0, r2, #0
    bl SetAnim__12AActorEntityUi
    b .L08027BB0
    .align 2, 0
.L08027B68: .4byte 0x00000792
.L08027B6C:
    movs r5, #0x3e
    b .L08027BB0
.L08027B70:
    movs r5, #0xa3
    lsls r5, r5, #1
    b .L08027BB0
.L08027B76:
    movs r5, #0xa9
    lsls r5, r5, #1
    b .L08027BB0
.L08027B7C:
    movs r5, #0x9d
    lsls r5, r5, #1
    b .L08027BB0
.L08027B82:
    movs r5, #0x42
    b .L08027BB0
.L08027B86:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xe3
    lsls r5, r5, #1
    cmp r0, #0
    bne .L08027BB0
.L08027B98:
    movs r5, #0xab
    lsls r5, r5, #1
    b .L08027BB0
.L08027B9E:
    ldr r0, [r4]
    b .L08027BEA
.L08027BA2:
    adds r0, r6, #0
    adds r0, #0x3d
    ldrb r0, [r0]
    movs r5, #0xf6
    cmp r0, #0
    beq .L08027BB0
    movs r5, #0xf2
.L08027BB0:
    lsls r1, r5, #0x10
    lsrs r1, r1, #0x10
    adds r0, r6, #0
    bl SetAnim__12AActorEntityUi
    ldr r0, [r6]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    adds r6, #0xc0
    cmp r4, r5
    beq .L08027BE6
.L08027BD4:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08027B9E
    adds r4, #4
    cmp r4, r5
    bne .L08027BD4
.L08027BE6:
    subs r0, r5, #4
    ldr r0, [r0]
.L08027BEA:
    movs r1, #0x6a
    bl func_08008B6C
    movs r0, #1
    strb r0, [r6]
    add sp, #8
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0

    thumb_func_start func_08027BFC
func_08027BFC: @ 0x08027BFC
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #0x14
    adds r6, r0, #0
    ldr r0, [r6, #0x34]
    ldr r1, .L08027D00 @ =0x00001C2C
    adds r4, r0, r1
    adds r0, r4, #0
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08027C1E
    b .L0802816C
.L08027C1E:
    adds r0, r4, #0
    bl func_0800F204
    cmp r0, #4
    beq .L08027C2A
    b .L0802816C
.L08027C2A:
    ldr r0, [r6, #0x34]
    movs r2, #0xe5
    lsls r2, r2, #5
    adds r0, r0, r2
    bl func_0800FFD0
    cmp r0, #0
    bne .L08027C3C
    b .L08028182
.L08027C3C:
    ldr r0, [r6, #0x34]
    movs r3, #0xe5
    lsls r3, r3, #5
    adds r0, r0, r3
    bl func_0800FFD4
    adds r4, r0, #0
    ldr r0, [r6, #0x34]
    movs r1, #0xe5
    lsls r1, r1, #5
    adds r0, r0, r1
    bl func_0800FFD8
    adds r5, r0, #0
    adds r7, r6, #0
    adds r7, #0x88
    movs r2, #0x3c
    adds r2, r2, r6
    mov sl, r2
    adds r3, r6, #0
    adds r3, #0xc0
    str r3, [sp, #0x10]
    movs r0, #0x7c
    adds r0, r0, r6
    mov sb, r0
    cmp r4, r5
    beq .L08027C8A
.L08027C72:
    ldr r0, [r6]
    ldr r1, [r0]
    movs r2, #0xae
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r2, [r1]
    adds r1, r4, #0
    bl _call_via_r2
    adds r4, #1
    cmp r4, r5
    bne .L08027C72
.L08027C8A:
    ldr r0, [r6, #0x34]
    movs r3, #0xe5
    lsls r3, r3, #5
    adds r0, r0, r3
    bl func_08010024
    movs r0, #0
    mov r8, r0
    str r0, [r7, #4]
    str r0, [r7, #8]
    str r0, [r7, #0x14]
    ldr r5, [r6, #0x10]
    cmp r5, #0
    beq .L08027CD8
    adds r0, r6, #0
    adds r0, #0x20
    ldrb r4, [r0]
    adds r4, #0x36
    ldr r0, [r5]
    ldr r0, [r0]
    ldr r1, [r0]
    ldr r1, [r1, #0x64]
    bl _call_via_r1
    adds r1, r0, #0
    adds r0, r5, #0
    adds r0, #0xb4
    adds r2, r4, #0
    bl func_0805E850
    adds r0, r5, #0
    adds r0, #0xc8
    movs r1, #1
    strb r1, [r0]
    adds r0, #2
    mov r2, r8
    strb r2, [r0]
    adds r0, #1
    strb r1, [r0]
.L08027CD8:
    movs r0, #0x2e
    mov r3, sl
    strb r0, [r3]
    movs r0, #1
    ldr r1, [sp, #0x10]
    strb r0, [r1]
    movs r5, #0xc9
    lsls r5, r5, #1
    ldr r0, .L08027D04 @ =0x0000FFFF
    mov r2, sb
    strh r0, [r2]
    ldrb r0, [r3]
    cmp r0, #0x39
    bls .L08027CF6
    b .L08028130
.L08027CF6:
    lsls r0, r0, #2
    ldr r1, .L08027D08 @ =.L08027D0C
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L08027D00: .4byte 0x00001C2C
.L08027D04: .4byte 0x0000FFFF
.L08027D08: .4byte .L08027D0C
.L08027D0C: @ jump table
    .4byte .L08027DF4 @ case 0
    .4byte .L08027ECE @ case 1
    .4byte .L08027E68 @ case 2
    .4byte .L08027ECE @ case 3
    .4byte .L08027EB8 @ case 4
    .4byte .L08027ECE @ case 5
    .4byte .L08028000 @ case 6
    .4byte .L0802800C @ case 7
    .4byte .L08028122 @ case 8
    .4byte .L08027F06 @ case 9
    .4byte .L08028102 @ case 10
    .4byte .L08027EEC @ case 11
    .4byte .L08027EEC @ case 12
    .4byte .L08027EE6 @ case 13
    .4byte .L08027EEC @ case 14
    .4byte .L08027EF2 @ case 15
    .4byte .L08027EF6 @ case 16
    .4byte .L080280F0 @ case 17
    .4byte .L080280FC @ case 18
    .4byte .L08027EFA @ case 19
    .4byte .L08027F00 @ case 20
    .4byte .L08028102 @ case 21
    .4byte .L08027FF4 @ case 22
    .4byte .L08027FFA @ case 23
    .4byte .L08028006 @ case 24
    .4byte .L08027F54 @ case 25
    .4byte .L08027F54 @ case 26
    .4byte .L08027F26 @ case 27
    .4byte .L08027F44 @ case 28
    .4byte .L08027F44 @ case 29
    .4byte .L08027F84 @ case 30
    .4byte .L08027FA8 @ case 31
    .4byte .L08027FCE @ case 32
    .4byte .L080280F0 @ case 33
    .4byte .L08028058 @ case 34
    .4byte .L08028074 @ case 35
    .4byte .L0802808C @ case 36
    .4byte .L08028092 @ case 37
    .4byte .L08028098 @ case 38
    .4byte .L0802809C @ case 39
    .4byte .L080280A0 @ case 40
    .4byte .L080280A6 @ case 41
    .4byte .L080280AC @ case 42
    .4byte .L080280AC @ case 43
    .4byte .L080280B2 @ case 44
    .4byte .L080280C8 @ case 45
    .4byte .L080280EC @ case 46
    .4byte .L08028102 @ case 47
    .4byte .L080280F6 @ case 48
    .4byte .L080280F0 @ case 49
    .4byte .L080280F6 @ case 50
    .4byte .L080280FC @ case 51
    .4byte .L08028102 @ case 52
    .4byte .L08028106 @ case 53
    .4byte .L080280F0 @ case 54
    .4byte .L080280F0 @ case 55
    .4byte .L080280F6 @ case 56
    .4byte .L080280F6 @ case 57
.L08027DF4:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08027E26
    adds r0, r6, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    bne .L08027E0E
    b .L08028118
.L08027E0E:
    cmp r0, #1
    bgt .L08027E1A
    cmp r0, #0
    bne .L08027E18
    b .L080280F6
.L08027E18:
    b .L08028130
.L08027E1A:
    cmp r0, #2
    beq .L08027E20
    b .L08028130
.L08027E20:
    movs r5, #0xa7
    lsls r5, r5, #1
    b .L08028130
.L08027E26:
    adds r0, r6, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    beq .L08027E42
    cmp r0, #1
    bgt .L08027E3C
    cmp r0, #0
    bne .L08027E3A
    b .L08027F54
.L08027E3A:
    b .L08028130
.L08027E3C:
    cmp r0, #2
    beq .L08027E54
    b .L08028130
.L08027E42:
    adds r0, r6, #0
    adds r0, #0xb3
    ldrb r0, [r0]
    movs r1, #0x99
    lsls r1, r1, #1
    cmp r0, #0
    bne .L08027E64
    adds r1, #0x94
    b .L08027E64
.L08027E54:
    adds r0, r6, #0
    adds r0, #0xb3
    ldrb r0, [r0]
    movs r1, #0x99
    lsls r1, r1, #1
    cmp r0, #0
    bne .L08027E64
    adds r1, #0x2c
.L08027E64:
    adds r5, r1, #0
    b .L08028130
.L08027E68:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08027E78
    b .L080280F6
.L08027E78:
    adds r0, r6, #0
    adds r0, #0x3f
    ldrb r3, [r0]
    cmp r3, #5
    bgt .L08027F54
    cmp r3, #0
    blt .L08027F54
    ldr r2, .L08027EB4 @ =gUnk_080F0FCC
    adds r1, r6, #0
    adds r1, #0x40
    lsls r0, r3, #3
    subs r0, r0, r3
    ldrb r1, [r1]
    adds r0, r0, r1
    lsls r0, r0, #1
    adds r0, r0, r2
    ldrh r5, [r0]
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    mov r1, sp
    strb r0, [r1]
    mov r0, sp
    b .L08027FC4
    .align 2, 0
.L08027EB4: .4byte gUnk_080F0FCC
.L08027EB8:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xc9
    lsls r5, r5, #1
    cmp r0, #0
    beq .L08027ECC
    b .L08028130
.L08027ECC:
    b .L080280F6
.L08027ECE:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xc9
    lsls r5, r5, #1
    cmp r0, #0
    beq .L08027EE2
    b .L08028130
.L08027EE2:
    subs r5, #0x40
    b .L08028130
.L08027EE6:
    movs r5, #0x9b
    lsls r5, r5, #1
    b .L08028130
.L08027EEC:
    movs r5, #0xcf
    lsls r5, r5, #1
    b .L08028130
.L08027EF2:
    movs r5, #0x4e
    b .L08028130
.L08027EF6:
    movs r5, #0x46
    b .L08028130
.L08027EFA:
    movs r5, #0x9f
    lsls r5, r5, #1
    b .L08028130
.L08027F00:
    movs r5, #0xa1
    lsls r5, r5, #1
    b .L08028130
.L08027F06:
    adds r0, r6, #0
    adds r0, #0x44
    ldrh r5, [r0]
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #1
    b .L08027FE8
.L08027F26:
    movs r5, #0xf5
    lsls r5, r5, #1
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #2
    b .L08027F9C
.L08027F44:
    adds r2, r6, #0
    adds r2, #0x4e
    adds r1, r6, #0
    adds r1, #0x4f
    ldrb r0, [r2]
    ldrb r3, [r1]
    cmp r0, r3
    bne .L08027F5A
.L08027F54:
    movs r5, #0xc9
    lsls r5, r5, #1
    b .L08028130
.L08027F5A:
    ldrb r0, [r1]
    ldrb r1, [r2]
    subs r0, r0, r1
    movs r5, #0xc1
    lsls r5, r5, #1
    cmp r0, #1
    bne .L08027F6A
    adds r5, #4
.L08027F6A:
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #3
    b .L08027FE8
.L08027F84:
    movs r5, #0x76
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    add r0, sp, #4
.L08027F9C:
    strb r1, [r0]
    bl GetIconId__C4Tool
    mov r2, sb
    strh r0, [r2]
    b .L08028130
.L08027FA8:
    movs r5, #0x6e
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #5
    strb r1, [r0]
.L08027FC4:
    bl GetIconId__C4Tool
    mov r3, sb
    strh r0, [r3]
    b .L08028130
.L08027FCE:
    movs r5, #0x72
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #6
.L08027FE8:
    strb r1, [r0]
    bl GetIconId__C4Tool
    mov r1, sb
    strh r0, [r1]
    b .L08028130
.L08027FF4:
    movs r5, #0xfd
    lsls r5, r5, #1
    b .L08028130
.L08027FFA:
    movs r5, #0xcb
    lsls r5, r5, #1
    b .L08028130
.L08028000:
    movs r5, #0x89
    lsls r5, r5, #1
    b .L08028130
.L08028006:
    movs r5, #0x8b
    lsls r5, r5, #1
    b .L08028130
.L0802800C:
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    adds r0, r6, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    beq .L08028040
    cmp r0, #1
    bgt .L0802802E
    cmp r0, #0
    beq .L08028034
    b .L08028130
.L0802802E:
    cmp r0, #2
    beq .L0802804C
    b .L08028130
.L08028034:
    movs r5, #0xea
    ldr r1, .L0802803C @ =0x0000077A
    b .L080280DA
    .align 2, 0
.L0802803C: .4byte 0x0000077A
.L08028040:
    movs r5, #0xee
    ldr r1, .L08028048 @ =0x0000077E
    b .L080280DA
    .align 2, 0
.L08028048: .4byte 0x0000077E
.L0802804C:
    movs r5, #0xe6
    ldr r1, .L08028054 @ =0x00000782
    b .L080280DA
    .align 2, 0
.L08028054: .4byte 0x00000782
.L08028058:
    movs r5, #0xad
    lsls r5, r5, #1
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L08028070 @ =0x0000077A
    b .L080280DA
    .align 2, 0
.L08028070: .4byte 0x0000077A
.L08028074:
    movs r5, #0x9a
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L08028088 @ =0x0000077A
    b .L080280DA
    .align 2, 0
.L08028088: .4byte 0x0000077A
.L0802808C:
    movs r5, #0x83
    lsls r5, r5, #1
    b .L08028130
.L08028092:
    movs r5, #0x81
    lsls r5, r5, #1
    b .L08028130
.L08028098:
    movs r5, #0xfe
    b .L08028130
.L0802809C:
    movs r5, #0xfa
    b .L08028130
.L080280A0:
    movs r5, #0x91
    lsls r5, r5, #1
    b .L08028130
.L080280A6:
    movs r5, #0x8f
    lsls r5, r5, #1
    b .L08028130
.L080280AC:
    movs r5, #0x8d
    lsls r5, r5, #1
    b .L08028130
.L080280B2:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xa5
    lsls r5, r5, #1
    cmp r0, #0
    beq .L08028130
    subs r5, #0x40
    b .L08028130
.L080280C8:
    movs r5, #0xe2
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L080280E8 @ =0x00000792
.L080280DA:
    ldrh r0, [r2, #0x22]
    cmp r0, r1
    beq .L08028130
    adds r0, r2, #0
    bl SetAnim__12AActorEntityUi
    b .L08028130
    .align 2, 0
.L080280E8: .4byte 0x00000792
.L080280EC:
    movs r5, #0x3e
    b .L08028130
.L080280F0:
    movs r5, #0xa3
    lsls r5, r5, #1
    b .L08028130
.L080280F6:
    movs r5, #0xa9
    lsls r5, r5, #1
    b .L08028130
.L080280FC:
    movs r5, #0x9d
    lsls r5, r5, #1
    b .L08028130
.L08028102:
    movs r5, #0x42
    b .L08028130
.L08028106:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xe3
    lsls r5, r5, #1
    cmp r0, #0
    bne .L08028130
.L08028118:
    movs r5, #0xab
    lsls r5, r5, #1
    b .L08028130
.L0802811E:
    ldr r0, [r4]
    b .L08028168
.L08028122:
    adds r0, r6, #0
    adds r0, #0x3d
    ldrb r0, [r0]
    movs r5, #0xf6
    cmp r0, #0
    beq .L08028130
    movs r5, #0xf2
.L08028130:
    lsls r1, r5, #0x10
    lsrs r1, r1, #0x10
    adds r0, r6, #0
    bl SetAnim__12AActorEntityUi
    ldr r0, [r6]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    beq .L08028164
.L08028152:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802811E
    adds r4, #4
    cmp r4, r5
    bne .L08028152
.L08028164:
    subs r0, r5, #4
    ldr r0, [r0]
.L08028168:
    movs r1, #0x6e
    b .L0802862E
.L0802816C:
    adds r0, r6, #0
    bl func_080262C4
    mov r4, sp
    adds r4, #7
    strb r0, [r4]
    adds r0, r4, #0
    bl GetPrice__C7Product
    cmp r0, #0
    bne .L08028186
.L08028182:
    movs r0, #0
    b .L08028634
.L08028186:
    ldr r0, [r6]
    ldr r1, [r0]
    movs r3, #0xae
    lsls r3, r3, #1
    adds r1, r1, r3
    ldr r2, [r1]
    adds r1, r4, #0
    bl _call_via_r2
    adds r1, r6, #0
    adds r1, #0xc0
    movs r0, #1
    strb r0, [r1]
    adds r2, r6, #0
    adds r2, #0x3c
    movs r0, #0xe
    strb r0, [r2]
    movs r5, #0xc9
    lsls r5, r5, #1
    subs r1, #0x44
    ldr r0, .L080281C8 @ =0x0000FFFF
    strh r0, [r1]
    ldrb r0, [r2]
    mov sb, r1
    cmp r0, #0x39
    bls .L080281BC
    b .L080285F4
.L080281BC:
    lsls r0, r0, #2
    ldr r1, .L080281CC @ =.L080281D0
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L080281C8: .4byte 0x0000FFFF
.L080281CC: .4byte .L080281D0
.L080281D0: @ jump table
    .4byte .L080282B8 @ case 0
    .4byte .L08028392 @ case 1
    .4byte .L0802832C @ case 2
    .4byte .L08028392 @ case 3
    .4byte .L0802837C @ case 4
    .4byte .L08028392 @ case 5
    .4byte .L080284C4 @ case 6
    .4byte .L080284D0 @ case 7
    .4byte .L080285E6 @ case 8
    .4byte .L080283CA @ case 9
    .4byte .L080285C6 @ case 10
    .4byte .L080283B0 @ case 11
    .4byte .L080283B0 @ case 12
    .4byte .L080283AA @ case 13
    .4byte .L080283B0 @ case 14
    .4byte .L080283B6 @ case 15
    .4byte .L080283BA @ case 16
    .4byte .L080285B4 @ case 17
    .4byte .L080285C0 @ case 18
    .4byte .L080283BE @ case 19
    .4byte .L080283C4 @ case 20
    .4byte .L080285C6 @ case 21
    .4byte .L080284B8 @ case 22
    .4byte .L080284BE @ case 23
    .4byte .L080284CA @ case 24
    .4byte .L08028418 @ case 25
    .4byte .L08028418 @ case 26
    .4byte .L080283EA @ case 27
    .4byte .L08028408 @ case 28
    .4byte .L08028408 @ case 29
    .4byte .L08028448 @ case 30
    .4byte .L0802846C @ case 31
    .4byte .L08028492 @ case 32
    .4byte .L080285B4 @ case 33
    .4byte .L0802851C @ case 34
    .4byte .L08028538 @ case 35
    .4byte .L08028550 @ case 36
    .4byte .L08028556 @ case 37
    .4byte .L0802855C @ case 38
    .4byte .L08028560 @ case 39
    .4byte .L08028564 @ case 40
    .4byte .L0802856A @ case 41
    .4byte .L08028570 @ case 42
    .4byte .L08028570 @ case 43
    .4byte .L08028576 @ case 44
    .4byte .L0802858C @ case 45
    .4byte .L080285B0 @ case 46
    .4byte .L080285C6 @ case 47
    .4byte .L080285BA @ case 48
    .4byte .L080285B4 @ case 49
    .4byte .L080285BA @ case 50
    .4byte .L080285C0 @ case 51
    .4byte .L080285C6 @ case 52
    .4byte .L080285CA @ case 53
    .4byte .L080285B4 @ case 54
    .4byte .L080285B4 @ case 55
    .4byte .L080285BA @ case 56
    .4byte .L080285BA @ case 57
.L080282B8:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L080282EA
    adds r0, r6, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    bne .L080282D2
    b .L080285DC
.L080282D2:
    cmp r0, #1
    bgt .L080282DE
    cmp r0, #0
    bne .L080282DC
    b .L080285BA
.L080282DC:
    b .L080285F4
.L080282DE:
    cmp r0, #2
    beq .L080282E4
    b .L080285F4
.L080282E4:
    movs r5, #0xa7
    lsls r5, r5, #1
    b .L080285F4
.L080282EA:
    adds r0, r6, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    beq .L08028306
    cmp r0, #1
    bgt .L08028300
    cmp r0, #0
    bne .L080282FE
    b .L08028418
.L080282FE:
    b .L080285F4
.L08028300:
    cmp r0, #2
    beq .L08028318
    b .L080285F4
.L08028306:
    adds r0, r6, #0
    adds r0, #0xb3
    ldrb r0, [r0]
    movs r1, #0x99
    lsls r1, r1, #1
    cmp r0, #0
    bne .L08028328
    adds r1, #0x94
    b .L08028328
.L08028318:
    adds r0, r6, #0
    adds r0, #0xb3
    ldrb r0, [r0]
    movs r1, #0x99
    lsls r1, r1, #1
    cmp r0, #0
    bne .L08028328
    adds r1, #0x2c
.L08028328:
    adds r5, r1, #0
    b .L080285F4
.L0802832C:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0802833C
    b .L080285BA
.L0802833C:
    adds r0, r6, #0
    adds r0, #0x3f
    ldrb r3, [r0]
    cmp r3, #5
    bgt .L08028418
    cmp r3, #0
    blt .L08028418
    ldr r2, .L08028378 @ =gUnk_080F0FCC
    adds r1, r6, #0
    adds r1, #0x40
    lsls r0, r3, #3
    subs r0, r0, r3
    ldrb r1, [r1]
    adds r0, r0, r1
    lsls r0, r0, #1
    adds r0, r0, r2
    ldrh r5, [r0]
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    add r0, sp, #8
    b .L080284AC
    .align 2, 0
.L08028378: .4byte gUnk_080F0FCC
.L0802837C:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xc9
    lsls r5, r5, #1
    cmp r0, #0
    beq .L08028390
    b .L080285F4
.L08028390:
    b .L080285BA
.L08028392:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xc9
    lsls r5, r5, #1
    cmp r0, #0
    beq .L080283A6
    b .L080285F4
.L080283A6:
    subs r5, #0x40
    b .L080285F4
.L080283AA:
    movs r5, #0x9b
    lsls r5, r5, #1
    b .L080285F4
.L080283B0:
    movs r5, #0xcf
    lsls r5, r5, #1
    b .L080285F4
.L080283B6:
    movs r5, #0x4e
    b .L080285F4
.L080283BA:
    movs r5, #0x46
    b .L080285F4
.L080283BE:
    movs r5, #0x9f
    lsls r5, r5, #1
    b .L080285F4
.L080283C4:
    movs r5, #0xa1
    lsls r5, r5, #1
    b .L080285F4
.L080283CA:
    adds r0, r6, #0
    adds r0, #0x44
    ldrh r5, [r0]
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #9
    b .L08028460
.L080283EA:
    movs r5, #0xf5
    lsls r5, r5, #1
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #0xa
    b .L08028486
.L08028408:
    adds r2, r6, #0
    adds r2, #0x4e
    adds r1, r6, #0
    adds r1, #0x4f
    ldrb r0, [r2]
    ldrb r3, [r1]
    cmp r0, r3
    bne .L0802841E
.L08028418:
    movs r5, #0xc9
    lsls r5, r5, #1
    b .L080285F4
.L0802841E:
    ldrb r0, [r1]
    ldrb r1, [r2]
    subs r0, r0, r1
    movs r5, #0xc1
    lsls r5, r5, #1
    cmp r0, #1
    bne .L0802842E
    adds r5, #4
.L0802842E:
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #0xb
    b .L080284AC
.L08028448:
    movs r5, #0x76
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    add r0, sp, #0xc
.L08028460:
    strb r1, [r0]
    bl GetIconId__C4Tool
    mov r2, sb
    strh r0, [r2]
    b .L080285F4
.L0802846C:
    movs r5, #0x6e
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #0xd
.L08028486:
    strb r1, [r0]
    bl GetIconId__C4Tool
    mov r3, sb
    strh r0, [r3]
    b .L080285F4
.L08028492:
    movs r5, #0x72
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #0xe
.L080284AC:
    strb r1, [r0]
    bl GetIconId__C4Tool
    mov r1, sb
    strh r0, [r1]
    b .L080285F4
.L080284B8:
    movs r5, #0xfd
    lsls r5, r5, #1
    b .L080285F4
.L080284BE:
    movs r5, #0xcb
    lsls r5, r5, #1
    b .L080285F4
.L080284C4:
    movs r5, #0x89
    lsls r5, r5, #1
    b .L080285F4
.L080284CA:
    movs r5, #0x8b
    lsls r5, r5, #1
    b .L080285F4
.L080284D0:
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    adds r0, r6, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    beq .L08028504
    cmp r0, #1
    bgt .L080284F2
    cmp r0, #0
    beq .L080284F8
    b .L080285F4
.L080284F2:
    cmp r0, #2
    beq .L08028510
    b .L080285F4
.L080284F8:
    movs r5, #0xea
    ldr r1, .L08028500 @ =0x0000077A
    b .L0802859E
    .align 2, 0
.L08028500: .4byte 0x0000077A
.L08028504:
    movs r5, #0xee
    ldr r1, .L0802850C @ =0x0000077E
    b .L0802859E
    .align 2, 0
.L0802850C: .4byte 0x0000077E
.L08028510:
    movs r5, #0xe6
    ldr r1, .L08028518 @ =0x00000782
    b .L0802859E
    .align 2, 0
.L08028518: .4byte 0x00000782
.L0802851C:
    movs r5, #0xad
    lsls r5, r5, #1
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L08028534 @ =0x0000077A
    b .L0802859E
    .align 2, 0
.L08028534: .4byte 0x0000077A
.L08028538:
    movs r5, #0x9a
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L0802854C @ =0x0000077A
    b .L0802859E
    .align 2, 0
.L0802854C: .4byte 0x0000077A
.L08028550:
    movs r5, #0x83
    lsls r5, r5, #1
    b .L080285F4
.L08028556:
    movs r5, #0x81
    lsls r5, r5, #1
    b .L080285F4
.L0802855C:
    movs r5, #0xfe
    b .L080285F4
.L08028560:
    movs r5, #0xfa
    b .L080285F4
.L08028564:
    movs r5, #0x91
    lsls r5, r5, #1
    b .L080285F4
.L0802856A:
    movs r5, #0x8f
    lsls r5, r5, #1
    b .L080285F4
.L08028570:
    movs r5, #0x8d
    lsls r5, r5, #1
    b .L080285F4
.L08028576:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xa5
    lsls r5, r5, #1
    cmp r0, #0
    beq .L080285F4
    subs r5, #0x40
    b .L080285F4
.L0802858C:
    movs r5, #0xe2
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L080285AC @ =0x00000792
.L0802859E:
    ldrh r0, [r2, #0x22]
    cmp r0, r1
    beq .L080285F4
    adds r0, r2, #0
    bl SetAnim__12AActorEntityUi
    b .L080285F4
    .align 2, 0
.L080285AC: .4byte 0x00000792
.L080285B0:
    movs r5, #0x3e
    b .L080285F4
.L080285B4:
    movs r5, #0xa3
    lsls r5, r5, #1
    b .L080285F4
.L080285BA:
    movs r5, #0xa9
    lsls r5, r5, #1
    b .L080285F4
.L080285C0:
    movs r5, #0x9d
    lsls r5, r5, #1
    b .L080285F4
.L080285C6:
    movs r5, #0x42
    b .L080285F4
.L080285CA:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xe3
    lsls r5, r5, #1
    cmp r0, #0
    bne .L080285F4
.L080285DC:
    movs r5, #0xab
    lsls r5, r5, #1
    b .L080285F4
.L080285E2:
    ldr r0, [r4]
    b .L0802862C
.L080285E6:
    adds r0, r6, #0
    adds r0, #0x3d
    ldrb r0, [r0]
    movs r5, #0xf6
    cmp r0, #0
    beq .L080285F4
    movs r5, #0xf2
.L080285F4:
    lsls r1, r5, #0x10
    lsrs r1, r1, #0x10
    adds r0, r6, #0
    bl SetAnim__12AActorEntityUi
    ldr r0, [r6]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    beq .L08028628
.L08028616:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L080285E2
    adds r4, #4
    cmp r4, r5
    bne .L08028616
.L08028628:
    subs r0, r5, #4
    ldr r0, [r0]
.L0802862C:
    movs r1, #0x6c
.L0802862E:
    bl func_08008B6C
    movs r0, #1
.L08028634:
    add sp, #0x14
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1

    thumb_func_start func_08028644
func_08028644: @ 0x08028644
    push {r4, r5, r6, r7, lr}
    sub sp, #8
    adds r6, r0, #0
    ldr r0, [r6, #0x34]
    ldr r1, .L08028690 @ =0x00001C2C
    adds r0, r0, r1
    bl func_0800F190
    lsls r0, r0, #0x18
    lsrs r4, r0, #0x18
    cmp r4, #0
    beq .L0802865E
    b .L08028B46
.L0802865E:
    adds r1, r6, #0
    adds r1, #0xc0
    movs r0, #1
    strb r0, [r1]
    subs r1, #0x84
    movs r0, #0xb
    strb r0, [r1]
    adds r2, r6, #0
    adds r2, #0x88
    movs r0, #0xa8
    lsls r0, r0, #0xd
    str r4, [r2, #4]
    str r4, [r2, #8]
    str r0, [r2, #0x14]
    adds r0, r6, #0
    adds r0, #0x20
    ldrb r3, [r0]
    adds r7, r1, #0
    cmp r3, #1
    beq .L080286B8
    cmp r3, #1
    bgt .L08028694
    cmp r3, #0
    beq .L080286C8
    b .L080286D0
    .align 2, 0
.L08028690: .4byte 0x00001C2C
.L08028694:
    cmp r3, #2
    beq .L0802869E
    cmp r3, #3
    beq .L080286A8
    b .L080286D0
.L0802869E:
    ldr r0, .L080286A4 @ =0xFFFE5556
    b .L080286AA
    .align 2, 0
.L080286A4: .4byte 0xFFFE5556
.L080286A8:
    ldr r0, .L080286B4 @ =0x0001AAAA
.L080286AA:
    str r0, [r2, #0xc]
    str r4, [r2, #0x10]
    str r4, [r2, #0x18]
    b .L080286D0
    .align 2, 0
.L080286B4: .4byte 0x0001AAAA
.L080286B8:
    ldr r0, .L080286C4 @ =0xFFFE5556
    str r4, [r2, #0xc]
    str r0, [r2, #0x10]
    str r4, [r2, #0x18]
    b .L080286D0
    .align 2, 0
.L080286C4: .4byte 0xFFFE5556
.L080286C8:
    ldr r0, .L080286F0 @ =0x0001AAAA
    str r3, [r2, #0xc]
    str r0, [r2, #0x10]
    str r3, [r2, #0x18]
.L080286D0:
    movs r5, #0xc9
    lsls r5, r5, #1
    adds r1, r6, #0
    adds r1, #0x7c
    ldr r0, .L080286F4 @ =0x0000FFFF
    strh r0, [r1]
    ldrb r0, [r7]
    adds r7, r1, #0
    cmp r0, #0x39
    bls .L080286E6
    b .L08028B08
.L080286E6:
    lsls r0, r0, #2
    ldr r1, .L080286F8 @ =.L080286FC
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L080286F0: .4byte 0x0001AAAA
.L080286F4: .4byte 0x0000FFFF
.L080286F8: .4byte .L080286FC
.L080286FC: @ jump table
    .4byte .L080287E4 @ case 0
    .4byte .L080288BE @ case 1
    .4byte .L08028858 @ case 2
    .4byte .L080288BE @ case 3
    .4byte .L080288A8 @ case 4
    .4byte .L080288BE @ case 5
    .4byte .L080289DA @ case 6
    .4byte .L080289E6 @ case 7
    .4byte .L08028AFA @ case 8
    .4byte .L080288F6 @ case 9
    .4byte .L08028ADA @ case 10
    .4byte .L080288DC @ case 11
    .4byte .L080288DC @ case 12
    .4byte .L080288D6 @ case 13
    .4byte .L080288DC @ case 14
    .4byte .L080288E2 @ case 15
    .4byte .L080288E6 @ case 16
    .4byte .L08028AC8 @ case 17
    .4byte .L08028AD4 @ case 18
    .4byte .L080288EA @ case 19
    .4byte .L080288F0 @ case 20
    .4byte .L08028ADA @ case 21
    .4byte .L080289CE @ case 22
    .4byte .L080289D4 @ case 23
    .4byte .L080289E0 @ case 24
    .4byte .L08028944 @ case 25
    .4byte .L08028944 @ case 26
    .4byte .L08028916 @ case 27
    .4byte .L08028934 @ case 28
    .4byte .L08028934 @ case 29
    .4byte .L08028974 @ case 30
    .4byte .L0802898E @ case 31
    .4byte .L080289AA @ case 32
    .4byte .L08028AC8 @ case 33
    .4byte .L08028A30 @ case 34
    .4byte .L08028A4C @ case 35
    .4byte .L08028A64 @ case 36
    .4byte .L08028A6A @ case 37
    .4byte .L08028A70 @ case 38
    .4byte .L08028A74 @ case 39
    .4byte .L08028A78 @ case 40
    .4byte .L08028A7E @ case 41
    .4byte .L08028A84 @ case 42
    .4byte .L08028A84 @ case 43
    .4byte .L08028A8A @ case 44
    .4byte .L08028AA0 @ case 45
    .4byte .L08028AC4 @ case 46
    .4byte .L08028ADA @ case 47
    .4byte .L08028ACE @ case 48
    .4byte .L08028AC8 @ case 49
    .4byte .L08028ACE @ case 50
    .4byte .L08028AD4 @ case 51
    .4byte .L08028ADA @ case 52
    .4byte .L08028ADE @ case 53
    .4byte .L08028AC8 @ case 54
    .4byte .L08028AC8 @ case 55
    .4byte .L08028ACE @ case 56
    .4byte .L08028ACE @ case 57
.L080287E4:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08028816
    adds r0, r6, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    bne .L080287FE
    b .L08028AF0
.L080287FE:
    cmp r0, #1
    bgt .L0802880A
    cmp r0, #0
    bne .L08028808
    b .L08028ACE
.L08028808:
    b .L08028B08
.L0802880A:
    cmp r0, #2
    beq .L08028810
    b .L08028B08
.L08028810:
    movs r5, #0xa7
    lsls r5, r5, #1
    b .L08028B08
.L08028816:
    adds r0, r6, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    beq .L08028832
    cmp r0, #1
    bgt .L0802882C
    cmp r0, #0
    bne .L0802882A
    b .L08028944
.L0802882A:
    b .L08028B08
.L0802882C:
    cmp r0, #2
    beq .L08028844
    b .L08028B08
.L08028832:
    adds r0, r6, #0
    adds r0, #0xb3
    ldrb r0, [r0]
    movs r1, #0x99
    lsls r1, r1, #1
    cmp r0, #0
    bne .L08028854
    adds r1, #0x94
    b .L08028854
.L08028844:
    adds r0, r6, #0
    adds r0, #0xb3
    ldrb r0, [r0]
    movs r1, #0x99
    lsls r1, r1, #1
    cmp r0, #0
    bne .L08028854
    adds r1, #0x2c
.L08028854:
    adds r5, r1, #0
    b .L08028B08
.L08028858:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08028868
    b .L08028ACE
.L08028868:
    adds r0, r6, #0
    adds r0, #0x3f
    ldrb r3, [r0]
    cmp r3, #5
    bgt .L08028944
    cmp r3, #0
    blt .L08028944
    ldr r2, .L080288A4 @ =gUnk_080F0FCC
    adds r1, r6, #0
    adds r1, #0x40
    lsls r0, r3, #3
    subs r0, r0, r3
    ldrb r1, [r1]
    adds r0, r0, r1
    lsls r0, r0, #1
    adds r0, r0, r2
    ldrh r5, [r0]
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    mov r1, sp
    strb r0, [r1]
    mov r0, sp
    b .L080289C6
    .align 2, 0
.L080288A4: .4byte gUnk_080F0FCC
.L080288A8:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xc9
    lsls r5, r5, #1
    cmp r0, #0
    beq .L080288BC
    b .L08028B08
.L080288BC:
    b .L08028ACE
.L080288BE:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xc9
    lsls r5, r5, #1
    cmp r0, #0
    beq .L080288D2
    b .L08028B08
.L080288D2:
    subs r5, #0x40
    b .L08028B08
.L080288D6:
    movs r5, #0x9b
    lsls r5, r5, #1
    b .L08028B08
.L080288DC:
    movs r5, #0xcf
    lsls r5, r5, #1
    b .L08028B08
.L080288E2:
    movs r5, #0x4e
    b .L08028B08
.L080288E6:
    movs r5, #0x46
    b .L08028B08
.L080288EA:
    movs r5, #0x9f
    lsls r5, r5, #1
    b .L08028B08
.L080288F0:
    movs r5, #0xa1
    lsls r5, r5, #1
    b .L08028B08
.L080288F6:
    adds r0, r6, #0
    adds r0, #0x44
    ldrh r5, [r0]
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #1
    b .L080289C4
.L08028916:
    movs r5, #0xf5
    lsls r5, r5, #1
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #2
    b .L080289C4
.L08028934:
    adds r2, r6, #0
    adds r2, #0x4e
    adds r1, r6, #0
    adds r1, #0x4f
    ldrb r0, [r2]
    ldrb r3, [r1]
    cmp r0, r3
    bne .L0802894A
.L08028944:
    movs r5, #0xc9
    lsls r5, r5, #1
    b .L08028B08
.L0802894A:
    ldrb r0, [r1]
    ldrb r1, [r2]
    subs r0, r0, r1
    movs r5, #0xc1
    lsls r5, r5, #1
    cmp r0, #1
    bne .L0802895A
    adds r5, #4
.L0802895A:
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #3
    b .L080289C4
.L08028974:
    movs r5, #0x76
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    add r0, sp, #4
    b .L080289C4
.L0802898E:
    movs r5, #0x6e
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #5
    b .L080289C4
.L080289AA:
    movs r5, #0x72
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #6
.L080289C4:
    strb r1, [r0]
.L080289C6:
    bl GetIconId__C4Tool
    strh r0, [r7]
    b .L08028B08
.L080289CE:
    movs r5, #0xfd
    lsls r5, r5, #1
    b .L08028B08
.L080289D4:
    movs r5, #0xcb
    lsls r5, r5, #1
    b .L08028B08
.L080289DA:
    movs r5, #0x89
    lsls r5, r5, #1
    b .L08028B08
.L080289E0:
    movs r5, #0x8b
    lsls r5, r5, #1
    b .L08028B08
.L080289E6:
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    adds r0, r6, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    beq .L08028A18
    cmp r0, #1
    bgt .L08028A08
    cmp r0, #0
    beq .L08028A0E
    b .L08028B08
.L08028A08:
    cmp r0, #2
    beq .L08028A24
    b .L08028B08
.L08028A0E:
    movs r5, #0xea
    ldr r1, .L08028A14 @ =0x0000077A
    b .L08028AB2
    .align 2, 0
.L08028A14: .4byte 0x0000077A
.L08028A18:
    movs r5, #0xee
    ldr r1, .L08028A20 @ =0x0000077E
    b .L08028AB2
    .align 2, 0
.L08028A20: .4byte 0x0000077E
.L08028A24:
    movs r5, #0xe6
    ldr r1, .L08028A2C @ =0x00000782
    b .L08028AB2
    .align 2, 0
.L08028A2C: .4byte 0x00000782
.L08028A30:
    movs r5, #0xad
    lsls r5, r5, #1
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L08028A48 @ =0x0000077A
    b .L08028AB2
    .align 2, 0
.L08028A48: .4byte 0x0000077A
.L08028A4C:
    movs r5, #0x9a
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L08028A60 @ =0x0000077A
    b .L08028AB2
    .align 2, 0
.L08028A60: .4byte 0x0000077A
.L08028A64:
    movs r5, #0x83
    lsls r5, r5, #1
    b .L08028B08
.L08028A6A:
    movs r5, #0x81
    lsls r5, r5, #1
    b .L08028B08
.L08028A70:
    movs r5, #0xfe
    b .L08028B08
.L08028A74:
    movs r5, #0xfa
    b .L08028B08
.L08028A78:
    movs r5, #0x91
    lsls r5, r5, #1
    b .L08028B08
.L08028A7E:
    movs r5, #0x8f
    lsls r5, r5, #1
    b .L08028B08
.L08028A84:
    movs r5, #0x8d
    lsls r5, r5, #1
    b .L08028B08
.L08028A8A:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xa5
    lsls r5, r5, #1
    cmp r0, #0
    beq .L08028B08
    subs r5, #0x40
    b .L08028B08
.L08028AA0:
    movs r5, #0xe2
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L08028AC0 @ =0x00000792
.L08028AB2:
    ldrh r0, [r2, #0x22]
    cmp r0, r1
    beq .L08028B08
    adds r0, r2, #0
    bl SetAnim__12AActorEntityUi
    b .L08028B08
    .align 2, 0
.L08028AC0: .4byte 0x00000792
.L08028AC4:
    movs r5, #0x3e
    b .L08028B08
.L08028AC8:
    movs r5, #0xa3
    lsls r5, r5, #1
    b .L08028B08
.L08028ACE:
    movs r5, #0xa9
    lsls r5, r5, #1
    b .L08028B08
.L08028AD4:
    movs r5, #0x9d
    lsls r5, r5, #1
    b .L08028B08
.L08028ADA:
    movs r5, #0x42
    b .L08028B08
.L08028ADE:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xe3
    lsls r5, r5, #1
    cmp r0, #0
    bne .L08028B08
.L08028AF0:
    movs r5, #0xab
    lsls r5, r5, #1
    b .L08028B08
.L08028AF6:
    ldr r0, [r4]
    b .L08028B40
.L08028AFA:
    adds r0, r6, #0
    adds r0, #0x3d
    ldrb r0, [r0]
    movs r5, #0xf6
    cmp r0, #0
    beq .L08028B08
    movs r5, #0xf2
.L08028B08:
    lsls r1, r5, #0x10
    lsrs r1, r1, #0x10
    adds r0, r6, #0
    bl SetAnim__12AActorEntityUi
    ldr r0, [r6]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    beq .L08028B3C
.L08028B2A:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08028AF6
    adds r4, #4
    cmp r4, r5
    bne .L08028B2A
.L08028B3C:
    subs r0, r5, #4
    ldr r0, [r0]
.L08028B40:
    movs r1, #0x6c
    bl func_08008B6C
.L08028B46:
    add sp, #8
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_08028B50
func_08028B50: @ 0x08028B50
    push {r4, r5, r6, r7, lr}
    sub sp, #8
    adds r6, r0, #0
    adds r7, r6, #0
    adds r7, #0x3c
    movs r0, #0xe
    strb r0, [r7]
    adds r1, r6, #0
    adds r1, #0xc0
    movs r0, #1
    strb r0, [r1]
    ldr r0, [r6, #0x34]
    ldr r1, .L08028BA0 @ =0x00001C2C
    adds r4, r0, r1
    adds r0, r4, #0
    bl func_0800F190
    lsls r0, r0, #0x18
    lsrs r5, r0, #0x18
    cmp r5, #0
    bne .L08028BFA
    adds r0, r4, #0
    bl func_0800F204
    cmp r0, #3
    bgt .L08028BFA
    cmp r0, #2
    blt .L08028BFA
    movs r0, #0xd
    strb r0, [r7]
    adds r0, r6, #0
    adds r0, #0x20
    ldrb r3, [r0]
    cmp r3, #1
    beq .L08028BD6
    cmp r3, #1
    bgt .L08028BA4
    cmp r3, #0
    beq .L08028BE8
    b .L08028BFA
    .align 2, 0
.L08028BA0: .4byte 0x00001C2C
.L08028BA4:
    cmp r3, #2
    beq .L08028BAE
    cmp r3, #3
    beq .L08028BC4
    b .L08028BFA
.L08028BAE:
    adds r0, r6, #0
    adds r0, #0x88
    ldr r1, .L08028BC0 @ =0xFFF60000
    movs r2, #0xc0
    lsls r2, r2, #0xc
    str r1, [r0, #4]
    str r5, [r0, #8]
    b .L08028BF8
    .align 2, 0
.L08028BC0: .4byte 0xFFF60000
.L08028BC4:
    adds r0, r6, #0
    adds r0, #0x88
    movs r1, #0xa0
    lsls r1, r1, #0xc
    movs r2, #0xc0
    lsls r2, r2, #0xc
    str r1, [r0, #4]
    str r5, [r0, #8]
    b .L08028BF8
.L08028BD6:
    adds r0, r6, #0
    adds r0, #0x88
    ldr r1, .L08028BE4 @ =0xFFF60000
    movs r2, #0xc0
    lsls r2, r2, #0xc
    str r5, [r0, #4]
    b .L08028BF6
    .align 2, 0
.L08028BE4: .4byte 0xFFF60000
.L08028BE8:
    adds r0, r6, #0
    adds r0, #0x88
    movs r1, #0xa0
    lsls r1, r1, #0xc
    movs r2, #0xc0
    lsls r2, r2, #0xc
    str r3, [r0, #4]
.L08028BF6:
    str r1, [r0, #8]
.L08028BF8:
    str r2, [r0, #0x14]
.L08028BFA:
    movs r5, #0xc9
    lsls r5, r5, #1
    adds r0, r6, #0
    adds r0, #0x7c
    ldr r1, .L08028C20 @ =0x0000FFFF
    strh r1, [r0]
    adds r1, r6, #0
    adds r1, #0x3c
    ldrb r1, [r1]
    adds r7, r0, #0
    cmp r1, #0x39
    bls .L08028C14
    b .L08029034
.L08028C14:
    lsls r0, r1, #2
    ldr r1, .L08028C24 @ =.L08028C28
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L08028C20: .4byte 0x0000FFFF
.L08028C24: .4byte .L08028C28
.L08028C28: @ jump table
    .4byte .L08028D10 @ case 0
    .4byte .L08028DEA @ case 1
    .4byte .L08028D84 @ case 2
    .4byte .L08028DEA @ case 3
    .4byte .L08028DD4 @ case 4
    .4byte .L08028DEA @ case 5
    .4byte .L08028F06 @ case 6
    .4byte .L08028F12 @ case 7
    .4byte .L08029026 @ case 8
    .4byte .L08028E22 @ case 9
    .4byte .L08029006 @ case 10
    .4byte .L08028E08 @ case 11
    .4byte .L08028E08 @ case 12
    .4byte .L08028E02 @ case 13
    .4byte .L08028E08 @ case 14
    .4byte .L08028E0E @ case 15
    .4byte .L08028E12 @ case 16
    .4byte .L08028FF4 @ case 17
    .4byte .L08029000 @ case 18
    .4byte .L08028E16 @ case 19
    .4byte .L08028E1C @ case 20
    .4byte .L08029006 @ case 21
    .4byte .L08028EFA @ case 22
    .4byte .L08028F00 @ case 23
    .4byte .L08028F0C @ case 24
    .4byte .L08028E70 @ case 25
    .4byte .L08028E70 @ case 26
    .4byte .L08028E42 @ case 27
    .4byte .L08028E60 @ case 28
    .4byte .L08028E60 @ case 29
    .4byte .L08028EA0 @ case 30
    .4byte .L08028EBA @ case 31
    .4byte .L08028ED6 @ case 32
    .4byte .L08028FF4 @ case 33
    .4byte .L08028F5C @ case 34
    .4byte .L08028F78 @ case 35
    .4byte .L08028F90 @ case 36
    .4byte .L08028F96 @ case 37
    .4byte .L08028F9C @ case 38
    .4byte .L08028FA0 @ case 39
    .4byte .L08028FA4 @ case 40
    .4byte .L08028FAA @ case 41
    .4byte .L08028FB0 @ case 42
    .4byte .L08028FB0 @ case 43
    .4byte .L08028FB6 @ case 44
    .4byte .L08028FCC @ case 45
    .4byte .L08028FF0 @ case 46
    .4byte .L08029006 @ case 47
    .4byte .L08028FFA @ case 48
    .4byte .L08028FF4 @ case 49
    .4byte .L08028FFA @ case 50
    .4byte .L08029000 @ case 51
    .4byte .L08029006 @ case 52
    .4byte .L0802900A @ case 53
    .4byte .L08028FF4 @ case 54
    .4byte .L08028FF4 @ case 55
    .4byte .L08028FFA @ case 56
    .4byte .L08028FFA @ case 57
.L08028D10:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08028D42
    adds r0, r6, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    bne .L08028D2A
    b .L0802901C
.L08028D2A:
    cmp r0, #1
    bgt .L08028D36
    cmp r0, #0
    bne .L08028D34
    b .L08028FFA
.L08028D34:
    b .L08029034
.L08028D36:
    cmp r0, #2
    beq .L08028D3C
    b .L08029034
.L08028D3C:
    movs r5, #0xa7
    lsls r5, r5, #1
    b .L08029034
.L08028D42:
    adds r0, r6, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    beq .L08028D5E
    cmp r0, #1
    bgt .L08028D58
    cmp r0, #0
    bne .L08028D56
    b .L08028E70
.L08028D56:
    b .L08029034
.L08028D58:
    cmp r0, #2
    beq .L08028D70
    b .L08029034
.L08028D5E:
    adds r0, r6, #0
    adds r0, #0xb3
    ldrb r0, [r0]
    movs r1, #0x99
    lsls r1, r1, #1
    cmp r0, #0
    bne .L08028D80
    adds r1, #0x94
    b .L08028D80
.L08028D70:
    adds r0, r6, #0
    adds r0, #0xb3
    ldrb r0, [r0]
    movs r1, #0x99
    lsls r1, r1, #1
    cmp r0, #0
    bne .L08028D80
    adds r1, #0x2c
.L08028D80:
    adds r5, r1, #0
    b .L08029034
.L08028D84:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08028D94
    b .L08028FFA
.L08028D94:
    adds r0, r6, #0
    adds r0, #0x3f
    ldrb r3, [r0]
    cmp r3, #5
    bgt .L08028E70
    cmp r3, #0
    blt .L08028E70
    ldr r2, .L08028DD0 @ =gUnk_080F0FCC
    adds r1, r6, #0
    adds r1, #0x40
    lsls r0, r3, #3
    subs r0, r0, r3
    ldrb r1, [r1]
    adds r0, r0, r1
    lsls r0, r0, #1
    adds r0, r0, r2
    ldrh r5, [r0]
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    mov r1, sp
    strb r0, [r1]
    mov r0, sp
    b .L08028EF2
    .align 2, 0
.L08028DD0: .4byte gUnk_080F0FCC
.L08028DD4:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xc9
    lsls r5, r5, #1
    cmp r0, #0
    beq .L08028DE8
    b .L08029034
.L08028DE8:
    b .L08028FFA
.L08028DEA:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xc9
    lsls r5, r5, #1
    cmp r0, #0
    beq .L08028DFE
    b .L08029034
.L08028DFE:
    subs r5, #0x40
    b .L08029034
.L08028E02:
    movs r5, #0x9b
    lsls r5, r5, #1
    b .L08029034
.L08028E08:
    movs r5, #0xcf
    lsls r5, r5, #1
    b .L08029034
.L08028E0E:
    movs r5, #0x4e
    b .L08029034
.L08028E12:
    movs r5, #0x46
    b .L08029034
.L08028E16:
    movs r5, #0x9f
    lsls r5, r5, #1
    b .L08029034
.L08028E1C:
    movs r5, #0xa1
    lsls r5, r5, #1
    b .L08029034
.L08028E22:
    adds r0, r6, #0
    adds r0, #0x44
    ldrh r5, [r0]
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #1
    b .L08028EF0
.L08028E42:
    movs r5, #0xf5
    lsls r5, r5, #1
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #2
    b .L08028EF0
.L08028E60:
    adds r2, r6, #0
    adds r2, #0x4e
    adds r1, r6, #0
    adds r1, #0x4f
    ldrb r0, [r2]
    ldrb r3, [r1]
    cmp r0, r3
    bne .L08028E76
.L08028E70:
    movs r5, #0xc9
    lsls r5, r5, #1
    b .L08029034
.L08028E76:
    ldrb r0, [r1]
    ldrb r1, [r2]
    subs r0, r0, r1
    movs r5, #0xc1
    lsls r5, r5, #1
    cmp r0, #1
    bne .L08028E86
    adds r5, #4
.L08028E86:
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #3
    b .L08028EF0
.L08028EA0:
    movs r5, #0x76
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    add r0, sp, #4
    b .L08028EF0
.L08028EBA:
    movs r5, #0x6e
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #5
    b .L08028EF0
.L08028ED6:
    movs r5, #0x72
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #6
.L08028EF0:
    strb r1, [r0]
.L08028EF2:
    bl GetIconId__C4Tool
    strh r0, [r7]
    b .L08029034
.L08028EFA:
    movs r5, #0xfd
    lsls r5, r5, #1
    b .L08029034
.L08028F00:
    movs r5, #0xcb
    lsls r5, r5, #1
    b .L08029034
.L08028F06:
    movs r5, #0x89
    lsls r5, r5, #1
    b .L08029034
.L08028F0C:
    movs r5, #0x8b
    lsls r5, r5, #1
    b .L08029034
.L08028F12:
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    adds r0, r6, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    beq .L08028F44
    cmp r0, #1
    bgt .L08028F34
    cmp r0, #0
    beq .L08028F3A
    b .L08029034
.L08028F34:
    cmp r0, #2
    beq .L08028F50
    b .L08029034
.L08028F3A:
    movs r5, #0xea
    ldr r1, .L08028F40 @ =0x0000077A
    b .L08028FDE
    .align 2, 0
.L08028F40: .4byte 0x0000077A
.L08028F44:
    movs r5, #0xee
    ldr r1, .L08028F4C @ =0x0000077E
    b .L08028FDE
    .align 2, 0
.L08028F4C: .4byte 0x0000077E
.L08028F50:
    movs r5, #0xe6
    ldr r1, .L08028F58 @ =0x00000782
    b .L08028FDE
    .align 2, 0
.L08028F58: .4byte 0x00000782
.L08028F5C:
    movs r5, #0xad
    lsls r5, r5, #1
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L08028F74 @ =0x0000077A
    b .L08028FDE
    .align 2, 0
.L08028F74: .4byte 0x0000077A
.L08028F78:
    movs r5, #0x9a
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L08028F8C @ =0x0000077A
    b .L08028FDE
    .align 2, 0
.L08028F8C: .4byte 0x0000077A
.L08028F90:
    movs r5, #0x83
    lsls r5, r5, #1
    b .L08029034
.L08028F96:
    movs r5, #0x81
    lsls r5, r5, #1
    b .L08029034
.L08028F9C:
    movs r5, #0xfe
    b .L08029034
.L08028FA0:
    movs r5, #0xfa
    b .L08029034
.L08028FA4:
    movs r5, #0x91
    lsls r5, r5, #1
    b .L08029034
.L08028FAA:
    movs r5, #0x8f
    lsls r5, r5, #1
    b .L08029034
.L08028FB0:
    movs r5, #0x8d
    lsls r5, r5, #1
    b .L08029034
.L08028FB6:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xa5
    lsls r5, r5, #1
    cmp r0, #0
    beq .L08029034
    subs r5, #0x40
    b .L08029034
.L08028FCC:
    movs r5, #0xe2
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L08028FEC @ =0x00000792
.L08028FDE:
    ldrh r0, [r2, #0x22]
    cmp r0, r1
    beq .L08029034
    adds r0, r2, #0
    bl SetAnim__12AActorEntityUi
    b .L08029034
    .align 2, 0
.L08028FEC: .4byte 0x00000792
.L08028FF0:
    movs r5, #0x3e
    b .L08029034
.L08028FF4:
    movs r5, #0xa3
    lsls r5, r5, #1
    b .L08029034
.L08028FFA:
    movs r5, #0xa9
    lsls r5, r5, #1
    b .L08029034
.L08029000:
    movs r5, #0x9d
    lsls r5, r5, #1
    b .L08029034
.L08029006:
    movs r5, #0x42
    b .L08029034
.L0802900A:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xe3
    lsls r5, r5, #1
    cmp r0, #0
    bne .L08029034
.L0802901C:
    movs r5, #0xab
    lsls r5, r5, #1
    b .L08029034
.L08029022:
    ldr r0, [r4]
    b .L0802906C
.L08029026:
    adds r0, r6, #0
    adds r0, #0x3d
    ldrb r0, [r0]
    movs r5, #0xf6
    cmp r0, #0
    beq .L08029034
    movs r5, #0xf2
.L08029034:
    lsls r1, r5, #0x10
    lsrs r1, r1, #0x10
    adds r0, r6, #0
    bl SetAnim__12AActorEntityUi
    ldr r0, [r6]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    beq .L08029068
.L08029056:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08029022
    adds r4, #4
    cmp r4, r5
    bne .L08029056
.L08029068:
    subs r0, r5, #4
    ldr r0, [r0]
.L0802906C:
    movs r1, #0x6c
    bl func_08008B6C
    add sp, #8
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_0802907C
func_0802907C: @ 0x0802907C
    push {r4, r5, lr}
    sub sp, #4
    adds r5, r0, #0
    ldr r0, [r5, #0x34]
    ldr r1, .L080290D0 @ =0x00001C2C
    adds r4, r0, r1
    adds r0, r4, #0
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L080290C6
    adds r0, r4, #0
    bl func_0800F204
    cmp r0, #1
    bne .L080290B8
    adds r0, r4, #0
    bl func_0800F258
    mov r1, sp
    strb r0, [r1]
    mov r0, sp
    bl GetId__C7Article
    cmp r0, #0x35
    bne .L080290B8
    ldr r0, [r5, #0x38]
    bl func_0800ED2C
.L080290B8:
    ldr r0, [r5, #0x38]
    adds r0, #0x54
    bl func_0800F390
    adds r0, r5, #0
    bl func_0802A7D8
.L080290C6:
    add sp, #4
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L080290D0: .4byte 0x00001C2C

    thumb_func_start func_080290D4
func_080290D4: @ 0x080290D4
    push {r4, r5, r6, r7, lr}
    sub sp, #8
    adds r6, r0, #0
    adds r7, r1, #0
    lsls r2, r2, #0x18
    lsrs r5, r2, #0x18
    adds r0, #0xa4
    movs r4, #1
    strb r4, [r0]
    ldr r0, [r6, #0x34]
    ldr r1, .L080290FC @ =0x00001C2C
    adds r0, r0, r1
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08029100
    movs r0, #0
    b .L08029550
    .align 2, 0
.L080290FC: .4byte 0x00001C2C
.L08029100:
    adds r0, r6, #0
    adds r0, #0xc0
    strb r4, [r0]
    adds r0, r6, #0
    adds r1, r7, #0
    adds r2, r5, #0
    bl func_08026150
    movs r5, #0xc9
    lsls r5, r5, #1
    adds r1, r6, #0
    adds r1, #0x7c
    ldr r0, .L08029134 @ =0x0000FFFF
    strh r0, [r1]
    adds r0, r6, #0
    adds r0, #0x3c
    ldrb r0, [r0]
    adds r7, r1, #0
    cmp r0, #0x39
    bls .L0802912A
    b .L08029544
.L0802912A:
    lsls r0, r0, #2
    ldr r1, .L08029138 @ =.L0802913C
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L08029134: .4byte 0x0000FFFF
.L08029138: .4byte .L0802913C
.L0802913C: @ jump table
    .4byte .L08029224 @ case 0
    .4byte .L080292FE @ case 1
    .4byte .L08029298 @ case 2
    .4byte .L080292FE @ case 3
    .4byte .L080292E8 @ case 4
    .4byte .L080292FE @ case 5
    .4byte .L0802941A @ case 6
    .4byte .L08029426 @ case 7
    .4byte .L08029536 @ case 8
    .4byte .L08029336 @ case 9
    .4byte .L0802951A @ case 10
    .4byte .L0802931C @ case 11
    .4byte .L0802931C @ case 12
    .4byte .L08029316 @ case 13
    .4byte .L0802931C @ case 14
    .4byte .L08029322 @ case 15
    .4byte .L08029326 @ case 16
    .4byte .L08029508 @ case 17
    .4byte .L08029514 @ case 18
    .4byte .L0802932A @ case 19
    .4byte .L08029330 @ case 20
    .4byte .L0802951A @ case 21
    .4byte .L0802940E @ case 22
    .4byte .L08029414 @ case 23
    .4byte .L08029420 @ case 24
    .4byte .L08029384 @ case 25
    .4byte .L08029384 @ case 26
    .4byte .L08029356 @ case 27
    .4byte .L08029374 @ case 28
    .4byte .L08029374 @ case 29
    .4byte .L080293B4 @ case 30
    .4byte .L080293CE @ case 31
    .4byte .L080293EA @ case 32
    .4byte .L08029508 @ case 33
    .4byte .L08029470 @ case 34
    .4byte .L0802948C @ case 35
    .4byte .L080294A4 @ case 36
    .4byte .L080294AA @ case 37
    .4byte .L080294B0 @ case 38
    .4byte .L080294B4 @ case 39
    .4byte .L080294B8 @ case 40
    .4byte .L080294BE @ case 41
    .4byte .L080294C4 @ case 42
    .4byte .L080294C4 @ case 43
    .4byte .L080294CA @ case 44
    .4byte .L080294E0 @ case 45
    .4byte .L08029504 @ case 46
    .4byte .L0802951A @ case 47
    .4byte .L0802950E @ case 48
    .4byte .L08029508 @ case 49
    .4byte .L0802950E @ case 50
    .4byte .L08029514 @ case 51
    .4byte .L0802951A @ case 52
    .4byte .L0802951E @ case 53
    .4byte .L08029508 @ case 54
    .4byte .L08029508 @ case 55
    .4byte .L0802950E @ case 56
    .4byte .L0802950E @ case 57
.L08029224:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08029256
    adds r0, r6, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    bne .L0802923E
    b .L08029530
.L0802923E:
    cmp r0, #1
    bgt .L0802924A
    cmp r0, #0
    bne .L08029248
    b .L0802950E
.L08029248:
    b .L08029544
.L0802924A:
    cmp r0, #2
    beq .L08029250
    b .L08029544
.L08029250:
    movs r5, #0xa7
    lsls r5, r5, #1
    b .L08029544
.L08029256:
    adds r0, r6, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    beq .L08029272
    cmp r0, #1
    bgt .L0802926C
    cmp r0, #0
    bne .L0802926A
    b .L08029384
.L0802926A:
    b .L08029544
.L0802926C:
    cmp r0, #2
    beq .L08029284
    b .L08029544
.L08029272:
    adds r0, r6, #0
    adds r0, #0xb3
    ldrb r0, [r0]
    movs r1, #0x99
    lsls r1, r1, #1
    cmp r0, #0
    bne .L08029294
    adds r1, #0x94
    b .L08029294
.L08029284:
    adds r0, r6, #0
    adds r0, #0xb3
    ldrb r0, [r0]
    movs r1, #0x99
    lsls r1, r1, #1
    cmp r0, #0
    bne .L08029294
    adds r1, #0x2c
.L08029294:
    adds r5, r1, #0
    b .L08029544
.L08029298:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L080292A8
    b .L0802950E
.L080292A8:
    adds r0, r6, #0
    adds r0, #0x3f
    ldrb r3, [r0]
    cmp r3, #5
    bgt .L08029384
    cmp r3, #0
    blt .L08029384
    ldr r2, .L080292E4 @ =gUnk_080F0FCC
    adds r1, r6, #0
    adds r1, #0x40
    lsls r0, r3, #3
    subs r0, r0, r3
    ldrb r1, [r1]
    adds r0, r0, r1
    lsls r0, r0, #1
    adds r0, r0, r2
    ldrh r5, [r0]
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    mov r1, sp
    strb r0, [r1]
    mov r0, sp
    b .L08029406
    .align 2, 0
.L080292E4: .4byte gUnk_080F0FCC
.L080292E8:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xc9
    lsls r5, r5, #1
    cmp r0, #0
    beq .L080292FC
    b .L08029544
.L080292FC:
    b .L0802950E
.L080292FE:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xc9
    lsls r5, r5, #1
    cmp r0, #0
    beq .L08029312
    b .L08029544
.L08029312:
    subs r5, #0x40
    b .L08029544
.L08029316:
    movs r5, #0x9b
    lsls r5, r5, #1
    b .L08029544
.L0802931C:
    movs r5, #0xcf
    lsls r5, r5, #1
    b .L08029544
.L08029322:
    movs r5, #0x4e
    b .L08029544
.L08029326:
    movs r5, #0x46
    b .L08029544
.L0802932A:
    movs r5, #0x9f
    lsls r5, r5, #1
    b .L08029544
.L08029330:
    movs r5, #0xa1
    lsls r5, r5, #1
    b .L08029544
.L08029336:
    adds r0, r6, #0
    adds r0, #0x44
    ldrh r5, [r0]
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #1
    b .L08029404
.L08029356:
    movs r5, #0xf5
    lsls r5, r5, #1
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #2
    b .L08029404
.L08029374:
    adds r2, r6, #0
    adds r2, #0x4e
    adds r1, r6, #0
    adds r1, #0x4f
    ldrb r0, [r2]
    ldrb r3, [r1]
    cmp r0, r3
    bne .L0802938A
.L08029384:
    movs r5, #0xc9
    lsls r5, r5, #1
    b .L08029544
.L0802938A:
    ldrb r0, [r1]
    ldrb r1, [r2]
    subs r0, r0, r1
    movs r5, #0xc1
    lsls r5, r5, #1
    cmp r0, #1
    bne .L0802939A
    adds r5, #4
.L0802939A:
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #3
    b .L08029404
.L080293B4:
    movs r5, #0x76
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    add r0, sp, #4
    b .L08029404
.L080293CE:
    movs r5, #0x6e
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #5
    b .L08029404
.L080293EA:
    movs r5, #0x72
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #6
.L08029404:
    strb r1, [r0]
.L08029406:
    bl GetIconId__C4Tool
    strh r0, [r7]
    b .L08029544
.L0802940E:
    movs r5, #0xfd
    lsls r5, r5, #1
    b .L08029544
.L08029414:
    movs r5, #0xcb
    lsls r5, r5, #1
    b .L08029544
.L0802941A:
    movs r5, #0x89
    lsls r5, r5, #1
    b .L08029544
.L08029420:
    movs r5, #0x8b
    lsls r5, r5, #1
    b .L08029544
.L08029426:
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    adds r0, r6, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    beq .L08029458
    cmp r0, #1
    bgt .L08029448
    cmp r0, #0
    beq .L0802944E
    b .L08029544
.L08029448:
    cmp r0, #2
    beq .L08029464
    b .L08029544
.L0802944E:
    movs r5, #0xea
    ldr r1, .L08029454 @ =0x0000077A
    b .L080294F2
    .align 2, 0
.L08029454: .4byte 0x0000077A
.L08029458:
    movs r5, #0xee
    ldr r1, .L08029460 @ =0x0000077E
    b .L080294F2
    .align 2, 0
.L08029460: .4byte 0x0000077E
.L08029464:
    movs r5, #0xe6
    ldr r1, .L0802946C @ =0x00000782
    b .L080294F2
    .align 2, 0
.L0802946C: .4byte 0x00000782
.L08029470:
    movs r5, #0xad
    lsls r5, r5, #1
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L08029488 @ =0x0000077A
    b .L080294F2
    .align 2, 0
.L08029488: .4byte 0x0000077A
.L0802948C:
    movs r5, #0x9a
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L080294A0 @ =0x0000077A
    b .L080294F2
    .align 2, 0
.L080294A0: .4byte 0x0000077A
.L080294A4:
    movs r5, #0x83
    lsls r5, r5, #1
    b .L08029544
.L080294AA:
    movs r5, #0x81
    lsls r5, r5, #1
    b .L08029544
.L080294B0:
    movs r5, #0xfe
    b .L08029544
.L080294B4:
    movs r5, #0xfa
    b .L08029544
.L080294B8:
    movs r5, #0x91
    lsls r5, r5, #1
    b .L08029544
.L080294BE:
    movs r5, #0x8f
    lsls r5, r5, #1
    b .L08029544
.L080294C4:
    movs r5, #0x8d
    lsls r5, r5, #1
    b .L08029544
.L080294CA:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xa5
    lsls r5, r5, #1
    cmp r0, #0
    beq .L08029544
    subs r5, #0x40
    b .L08029544
.L080294E0:
    movs r5, #0xe2
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L08029500 @ =0x00000792
.L080294F2:
    ldrh r0, [r2, #0x22]
    cmp r0, r1
    beq .L08029544
    adds r0, r2, #0
    bl SetAnim__12AActorEntityUi
    b .L08029544
    .align 2, 0
.L08029500: .4byte 0x00000792
.L08029504:
    movs r5, #0x3e
    b .L08029544
.L08029508:
    movs r5, #0xa3
    lsls r5, r5, #1
    b .L08029544
.L0802950E:
    movs r5, #0xa9
    lsls r5, r5, #1
    b .L08029544
.L08029514:
    movs r5, #0x9d
    lsls r5, r5, #1
    b .L08029544
.L0802951A:
    movs r5, #0x42
    b .L08029544
.L0802951E:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xe3
    lsls r5, r5, #1
    cmp r0, #0
    bne .L08029544
.L08029530:
    movs r5, #0xab
    lsls r5, r5, #1
    b .L08029544
.L08029536:
    adds r0, r6, #0
    adds r0, #0x3d
    ldrb r0, [r0]
    movs r5, #0xf6
    cmp r0, #0
    beq .L08029544
    movs r5, #0xf2
.L08029544:
    lsls r1, r5, #0x10
    lsrs r1, r1, #0x10
    adds r0, r6, #0
    bl SetAnim__12AActorEntityUi
    movs r0, #1
.L08029550:
    add sp, #8
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1

    thumb_func_start func_08029558
func_08029558: @ 0x08029558
    push {r4, r5, r6, r7, lr}
    sub sp, #8
    adds r6, r0, #0
    adds r0, #0xa4
    movs r4, #1
    strb r4, [r0]
    ldr r0, [r6, #0x34]
    ldr r1, .L08029578 @ =0x00001C2C
    adds r0, r0, r1
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0802957C
    movs r0, #0
    b .L080299C8
    .align 2, 0
.L08029578: .4byte 0x00001C2C
.L0802957C:
    adds r0, r6, #0
    adds r0, #0xc0
    strb r4, [r0]
    adds r0, r6, #0
    bl func_08025FC4
    movs r5, #0xc9
    lsls r5, r5, #1
    adds r1, r6, #0
    adds r1, #0x7c
    ldr r0, .L080295AC @ =0x0000FFFF
    strh r0, [r1]
    adds r0, r6, #0
    adds r0, #0x3c
    ldrb r0, [r0]
    adds r7, r1, #0
    cmp r0, #0x39
    bls .L080295A2
    b .L080299BC
.L080295A2:
    lsls r0, r0, #2
    ldr r1, .L080295B0 @ =.L080295B4
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L080295AC: .4byte 0x0000FFFF
.L080295B0: .4byte .L080295B4
.L080295B4: @ jump table
    .4byte .L0802969C @ case 0
    .4byte .L08029776 @ case 1
    .4byte .L08029710 @ case 2
    .4byte .L08029776 @ case 3
    .4byte .L08029760 @ case 4
    .4byte .L08029776 @ case 5
    .4byte .L08029892 @ case 6
    .4byte .L0802989E @ case 7
    .4byte .L080299AE @ case 8
    .4byte .L080297AE @ case 9
    .4byte .L08029992 @ case 10
    .4byte .L08029794 @ case 11
    .4byte .L08029794 @ case 12
    .4byte .L0802978E @ case 13
    .4byte .L08029794 @ case 14
    .4byte .L0802979A @ case 15
    .4byte .L0802979E @ case 16
    .4byte .L08029980 @ case 17
    .4byte .L0802998C @ case 18
    .4byte .L080297A2 @ case 19
    .4byte .L080297A8 @ case 20
    .4byte .L08029992 @ case 21
    .4byte .L08029886 @ case 22
    .4byte .L0802988C @ case 23
    .4byte .L08029898 @ case 24
    .4byte .L080297FC @ case 25
    .4byte .L080297FC @ case 26
    .4byte .L080297CE @ case 27
    .4byte .L080297EC @ case 28
    .4byte .L080297EC @ case 29
    .4byte .L0802982C @ case 30
    .4byte .L08029846 @ case 31
    .4byte .L08029862 @ case 32
    .4byte .L08029980 @ case 33
    .4byte .L080298E8 @ case 34
    .4byte .L08029904 @ case 35
    .4byte .L0802991C @ case 36
    .4byte .L08029922 @ case 37
    .4byte .L08029928 @ case 38
    .4byte .L0802992C @ case 39
    .4byte .L08029930 @ case 40
    .4byte .L08029936 @ case 41
    .4byte .L0802993C @ case 42
    .4byte .L0802993C @ case 43
    .4byte .L08029942 @ case 44
    .4byte .L08029958 @ case 45
    .4byte .L0802997C @ case 46
    .4byte .L08029992 @ case 47
    .4byte .L08029986 @ case 48
    .4byte .L08029980 @ case 49
    .4byte .L08029986 @ case 50
    .4byte .L0802998C @ case 51
    .4byte .L08029992 @ case 52
    .4byte .L08029996 @ case 53
    .4byte .L08029980 @ case 54
    .4byte .L08029980 @ case 55
    .4byte .L08029986 @ case 56
    .4byte .L08029986 @ case 57
.L0802969C:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L080296CE
    adds r0, r6, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    bne .L080296B6
    b .L080299A8
.L080296B6:
    cmp r0, #1
    bgt .L080296C2
    cmp r0, #0
    bne .L080296C0
    b .L08029986
.L080296C0:
    b .L080299BC
.L080296C2:
    cmp r0, #2
    beq .L080296C8
    b .L080299BC
.L080296C8:
    movs r5, #0xa7
    lsls r5, r5, #1
    b .L080299BC
.L080296CE:
    adds r0, r6, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    beq .L080296EA
    cmp r0, #1
    bgt .L080296E4
    cmp r0, #0
    bne .L080296E2
    b .L080297FC
.L080296E2:
    b .L080299BC
.L080296E4:
    cmp r0, #2
    beq .L080296FC
    b .L080299BC
.L080296EA:
    adds r0, r6, #0
    adds r0, #0xb3
    ldrb r0, [r0]
    movs r1, #0x99
    lsls r1, r1, #1
    cmp r0, #0
    bne .L0802970C
    adds r1, #0x94
    b .L0802970C
.L080296FC:
    adds r0, r6, #0
    adds r0, #0xb3
    ldrb r0, [r0]
    movs r1, #0x99
    lsls r1, r1, #1
    cmp r0, #0
    bne .L0802970C
    adds r1, #0x2c
.L0802970C:
    adds r5, r1, #0
    b .L080299BC
.L08029710:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08029720
    b .L08029986
.L08029720:
    adds r0, r6, #0
    adds r0, #0x3f
    ldrb r3, [r0]
    cmp r3, #5
    bgt .L080297FC
    cmp r3, #0
    blt .L080297FC
    ldr r2, .L0802975C @ =gUnk_080F0FCC
    adds r1, r6, #0
    adds r1, #0x40
    lsls r0, r3, #3
    subs r0, r0, r3
    ldrb r1, [r1]
    adds r0, r0, r1
    lsls r0, r0, #1
    adds r0, r0, r2
    ldrh r5, [r0]
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    mov r1, sp
    strb r0, [r1]
    mov r0, sp
    b .L0802987E
    .align 2, 0
.L0802975C: .4byte gUnk_080F0FCC
.L08029760:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xc9
    lsls r5, r5, #1
    cmp r0, #0
    beq .L08029774
    b .L080299BC
.L08029774:
    b .L08029986
.L08029776:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xc9
    lsls r5, r5, #1
    cmp r0, #0
    beq .L0802978A
    b .L080299BC
.L0802978A:
    subs r5, #0x40
    b .L080299BC
.L0802978E:
    movs r5, #0x9b
    lsls r5, r5, #1
    b .L080299BC
.L08029794:
    movs r5, #0xcf
    lsls r5, r5, #1
    b .L080299BC
.L0802979A:
    movs r5, #0x4e
    b .L080299BC
.L0802979E:
    movs r5, #0x46
    b .L080299BC
.L080297A2:
    movs r5, #0x9f
    lsls r5, r5, #1
    b .L080299BC
.L080297A8:
    movs r5, #0xa1
    lsls r5, r5, #1
    b .L080299BC
.L080297AE:
    adds r0, r6, #0
    adds r0, #0x44
    ldrh r5, [r0]
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #1
    b .L0802987C
.L080297CE:
    movs r5, #0xf5
    lsls r5, r5, #1
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #2
    b .L0802987C
.L080297EC:
    adds r2, r6, #0
    adds r2, #0x4e
    adds r1, r6, #0
    adds r1, #0x4f
    ldrb r0, [r2]
    ldrb r3, [r1]
    cmp r0, r3
    bne .L08029802
.L080297FC:
    movs r5, #0xc9
    lsls r5, r5, #1
    b .L080299BC
.L08029802:
    ldrb r0, [r1]
    ldrb r1, [r2]
    subs r0, r0, r1
    movs r5, #0xc1
    lsls r5, r5, #1
    cmp r0, #1
    bne .L08029812
    adds r5, #4
.L08029812:
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #3
    b .L0802987C
.L0802982C:
    movs r5, #0x76
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    add r0, sp, #4
    b .L0802987C
.L08029846:
    movs r5, #0x6e
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #5
    b .L0802987C
.L08029862:
    movs r5, #0x72
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #6
.L0802987C:
    strb r1, [r0]
.L0802987E:
    bl GetIconId__C4Tool
    strh r0, [r7]
    b .L080299BC
.L08029886:
    movs r5, #0xfd
    lsls r5, r5, #1
    b .L080299BC
.L0802988C:
    movs r5, #0xcb
    lsls r5, r5, #1
    b .L080299BC
.L08029892:
    movs r5, #0x89
    lsls r5, r5, #1
    b .L080299BC
.L08029898:
    movs r5, #0x8b
    lsls r5, r5, #1
    b .L080299BC
.L0802989E:
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    adds r0, r6, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    beq .L080298D0
    cmp r0, #1
    bgt .L080298C0
    cmp r0, #0
    beq .L080298C6
    b .L080299BC
.L080298C0:
    cmp r0, #2
    beq .L080298DC
    b .L080299BC
.L080298C6:
    movs r5, #0xea
    ldr r1, .L080298CC @ =0x0000077A
    b .L0802996A
    .align 2, 0
.L080298CC: .4byte 0x0000077A
.L080298D0:
    movs r5, #0xee
    ldr r1, .L080298D8 @ =0x0000077E
    b .L0802996A
    .align 2, 0
.L080298D8: .4byte 0x0000077E
.L080298DC:
    movs r5, #0xe6
    ldr r1, .L080298E4 @ =0x00000782
    b .L0802996A
    .align 2, 0
.L080298E4: .4byte 0x00000782
.L080298E8:
    movs r5, #0xad
    lsls r5, r5, #1
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L08029900 @ =0x0000077A
    b .L0802996A
    .align 2, 0
.L08029900: .4byte 0x0000077A
.L08029904:
    movs r5, #0x9a
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L08029918 @ =0x0000077A
    b .L0802996A
    .align 2, 0
.L08029918: .4byte 0x0000077A
.L0802991C:
    movs r5, #0x83
    lsls r5, r5, #1
    b .L080299BC
.L08029922:
    movs r5, #0x81
    lsls r5, r5, #1
    b .L080299BC
.L08029928:
    movs r5, #0xfe
    b .L080299BC
.L0802992C:
    movs r5, #0xfa
    b .L080299BC
.L08029930:
    movs r5, #0x91
    lsls r5, r5, #1
    b .L080299BC
.L08029936:
    movs r5, #0x8f
    lsls r5, r5, #1
    b .L080299BC
.L0802993C:
    movs r5, #0x8d
    lsls r5, r5, #1
    b .L080299BC
.L08029942:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xa5
    lsls r5, r5, #1
    cmp r0, #0
    beq .L080299BC
    subs r5, #0x40
    b .L080299BC
.L08029958:
    movs r5, #0xe2
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L08029978 @ =0x00000792
.L0802996A:
    ldrh r0, [r2, #0x22]
    cmp r0, r1
    beq .L080299BC
    adds r0, r2, #0
    bl SetAnim__12AActorEntityUi
    b .L080299BC
    .align 2, 0
.L08029978: .4byte 0x00000792
.L0802997C:
    movs r5, #0x3e
    b .L080299BC
.L08029980:
    movs r5, #0xa3
    lsls r5, r5, #1
    b .L080299BC
.L08029986:
    movs r5, #0xa9
    lsls r5, r5, #1
    b .L080299BC
.L0802998C:
    movs r5, #0x9d
    lsls r5, r5, #1
    b .L080299BC
.L08029992:
    movs r5, #0x42
    b .L080299BC
.L08029996:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xe3
    lsls r5, r5, #1
    cmp r0, #0
    bne .L080299BC
.L080299A8:
    movs r5, #0xab
    lsls r5, r5, #1
    b .L080299BC
.L080299AE:
    adds r0, r6, #0
    adds r0, #0x3d
    ldrb r0, [r0]
    movs r5, #0xf6
    cmp r0, #0
    beq .L080299BC
    movs r5, #0xf2
.L080299BC:
    lsls r1, r5, #0x10
    lsrs r1, r1, #0x10
    adds r0, r6, #0
    bl SetAnim__12AActorEntityUi
    movs r0, #1
.L080299C8:
    add sp, #8
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1

    thumb_func_start func_080299D0
func_080299D0: @ 0x080299D0
    push {lr}
    adds r1, r0, #0
    adds r1, #0xa4
    movs r2, #0
    strb r2, [r1]
    subs r1, #0x1c
    strb r2, [r1]
    movs r1, #0xc9
    lsls r1, r1, #1
    bl SetAnim__12AActorEntityUi
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_080299EC
func_080299EC: @ 0x080299EC
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #8
    adds r6, r0, #0
    adds r1, r6, #0
    adds r1, #0xa4
    movs r0, #1
    strb r0, [r1]
    adds r0, r6, #0
    bl func_0802A588
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08029AD0
    ldr r0, [r6]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    movs r3, #0x3c
    adds r3, r3, r6
    mov r8, r3
    movs r0, #0x20
    adds r0, r0, r6
    mov sb, r0
    adds r7, r6, #0
    adds r7, #0x7c
    movs r1, #0xc0
    adds r1, r1, r6
    mov sl, r1
    cmp r4, r5
    beq .L08029A56
.L08029A44:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08029A7A
    adds r4, #4
    cmp r4, r5
    bne .L08029A44
.L08029A56:
    subs r0, r5, #4
    ldr r0, [r0]
.L08029A5A:
    movs r1, #0x6a
    bl func_08008B6C
    movs r4, #0
    movs r0, #0x11
    mov r2, r8
    strb r0, [r2]
    mov r0, sb
    ldrb r3, [r0]
    cmp r3, #1
    beq .L08029AA8
    cmp r3, #1
    bgt .L08029A7E
    cmp r3, #0
    beq .L08029ABC
    b .L08029AE4
.L08029A7A:
    ldr r0, [r4]
    b .L08029A5A
.L08029A7E:
    cmp r3, #2
    beq .L08029A88
    cmp r3, #3
    beq .L08029A94
    b .L08029AE4
.L08029A88:
    adds r0, r6, #0
    adds r0, #0x88
    ldr r1, .L08029A90 @ =0xFFF60000
    b .L08029A9C
    .align 2, 0
.L08029A90: .4byte 0xFFF60000
.L08029A94:
    adds r0, r6, #0
    adds r0, #0x88
    movs r1, #0xa0
    lsls r1, r1, #0xc
.L08029A9C:
    movs r2, #0xc0
    lsls r2, r2, #0xc
    str r1, [r0, #4]
    str r4, [r0, #8]
    str r2, [r0, #0x14]
    b .L08029AE4
.L08029AA8:
    adds r0, r6, #0
    adds r0, #0x88
    ldr r1, .L08029AB8 @ =0xFFF60000
    movs r2, #0xc0
    lsls r2, r2, #0xc
    str r4, [r0, #4]
    b .L08029ACA
    .align 2, 0
.L08029AB8: .4byte 0xFFF60000
.L08029ABC:
    adds r0, r6, #0
    adds r0, #0x88
    movs r1, #0xa0
    lsls r1, r1, #0xc
    movs r2, #0xc0
    lsls r2, r2, #0xc
    str r3, [r0, #4]
.L08029ACA:
    str r1, [r0, #8]
    str r2, [r0, #0x14]
    b .L08029AE4
.L08029AD0:
    adds r1, r6, #0
    adds r1, #0x3c
    movs r0, #0
    strb r0, [r1]
    mov r8, r1
    adds r7, r6, #0
    adds r7, #0x7c
    movs r1, #0xc0
    adds r1, r1, r6
    mov sl, r1
.L08029AE4:
    movs r5, #0xc9
    lsls r5, r5, #1
    ldr r0, .L08029B00 @ =0x0000FFFF
    strh r0, [r7]
    mov r2, r8
    ldrb r0, [r2]
    cmp r0, #0x39
    bls .L08029AF6
    b .L08029F10
.L08029AF6:
    lsls r0, r0, #2
    ldr r1, .L08029B04 @ =.L08029B08
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L08029B00: .4byte 0x0000FFFF
.L08029B04: .4byte .L08029B08
.L08029B08: @ jump table
    .4byte .L08029BF0 @ case 0
    .4byte .L08029CCA @ case 1
    .4byte .L08029C64 @ case 2
    .4byte .L08029CCA @ case 3
    .4byte .L08029CB4 @ case 4
    .4byte .L08029CCA @ case 5
    .4byte .L08029DE6 @ case 6
    .4byte .L08029DF2 @ case 7
    .4byte .L08029F02 @ case 8
    .4byte .L08029D02 @ case 9
    .4byte .L08029EE6 @ case 10
    .4byte .L08029CE8 @ case 11
    .4byte .L08029CE8 @ case 12
    .4byte .L08029CE2 @ case 13
    .4byte .L08029CE8 @ case 14
    .4byte .L08029CEE @ case 15
    .4byte .L08029CF2 @ case 16
    .4byte .L08029ED4 @ case 17
    .4byte .L08029EE0 @ case 18
    .4byte .L08029CF6 @ case 19
    .4byte .L08029CFC @ case 20
    .4byte .L08029EE6 @ case 21
    .4byte .L08029DDA @ case 22
    .4byte .L08029DE0 @ case 23
    .4byte .L08029DEC @ case 24
    .4byte .L08029D50 @ case 25
    .4byte .L08029D50 @ case 26
    .4byte .L08029D22 @ case 27
    .4byte .L08029D40 @ case 28
    .4byte .L08029D40 @ case 29
    .4byte .L08029D80 @ case 30
    .4byte .L08029D9A @ case 31
    .4byte .L08029DB6 @ case 32
    .4byte .L08029ED4 @ case 33
    .4byte .L08029E3C @ case 34
    .4byte .L08029E58 @ case 35
    .4byte .L08029E70 @ case 36
    .4byte .L08029E76 @ case 37
    .4byte .L08029E7C @ case 38
    .4byte .L08029E80 @ case 39
    .4byte .L08029E84 @ case 40
    .4byte .L08029E8A @ case 41
    .4byte .L08029E90 @ case 42
    .4byte .L08029E90 @ case 43
    .4byte .L08029E96 @ case 44
    .4byte .L08029EAC @ case 45
    .4byte .L08029ED0 @ case 46
    .4byte .L08029EE6 @ case 47
    .4byte .L08029EDA @ case 48
    .4byte .L08029ED4 @ case 49
    .4byte .L08029EDA @ case 50
    .4byte .L08029EE0 @ case 51
    .4byte .L08029EE6 @ case 52
    .4byte .L08029EEA @ case 53
    .4byte .L08029ED4 @ case 54
    .4byte .L08029ED4 @ case 55
    .4byte .L08029EDA @ case 56
    .4byte .L08029EDA @ case 57
.L08029BF0:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08029C22
    adds r0, r6, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    bne .L08029C0A
    b .L08029EFC
.L08029C0A:
    cmp r0, #1
    bgt .L08029C16
    cmp r0, #0
    bne .L08029C14
    b .L08029EDA
.L08029C14:
    b .L08029F10
.L08029C16:
    cmp r0, #2
    beq .L08029C1C
    b .L08029F10
.L08029C1C:
    movs r5, #0xa7
    lsls r5, r5, #1
    b .L08029F10
.L08029C22:
    adds r0, r6, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    beq .L08029C3E
    cmp r0, #1
    bgt .L08029C38
    cmp r0, #0
    bne .L08029C36
    b .L08029D50
.L08029C36:
    b .L08029F10
.L08029C38:
    cmp r0, #2
    beq .L08029C50
    b .L08029F10
.L08029C3E:
    adds r0, r6, #0
    adds r0, #0xb3
    ldrb r0, [r0]
    movs r1, #0x99
    lsls r1, r1, #1
    cmp r0, #0
    bne .L08029C60
    adds r1, #0x94
    b .L08029C60
.L08029C50:
    adds r0, r6, #0
    adds r0, #0xb3
    ldrb r0, [r0]
    movs r1, #0x99
    lsls r1, r1, #1
    cmp r0, #0
    bne .L08029C60
    adds r1, #0x2c
.L08029C60:
    adds r5, r1, #0
    b .L08029F10
.L08029C64:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08029C74
    b .L08029EDA
.L08029C74:
    adds r0, r6, #0
    adds r0, #0x3f
    ldrb r3, [r0]
    cmp r3, #5
    bgt .L08029D50
    cmp r3, #0
    blt .L08029D50
    ldr r2, .L08029CB0 @ =gUnk_080F0FCC
    adds r1, r6, #0
    adds r1, #0x40
    lsls r0, r3, #3
    subs r0, r0, r3
    ldrb r1, [r1]
    adds r0, r0, r1
    lsls r0, r0, #1
    adds r0, r0, r2
    ldrh r5, [r0]
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    mov r1, sp
    strb r0, [r1]
    mov r0, sp
    b .L08029DD2
    .align 2, 0
.L08029CB0: .4byte gUnk_080F0FCC
.L08029CB4:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xc9
    lsls r5, r5, #1
    cmp r0, #0
    beq .L08029CC8
    b .L08029F10
.L08029CC8:
    b .L08029EDA
.L08029CCA:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xc9
    lsls r5, r5, #1
    cmp r0, #0
    beq .L08029CDE
    b .L08029F10
.L08029CDE:
    subs r5, #0x40
    b .L08029F10
.L08029CE2:
    movs r5, #0x9b
    lsls r5, r5, #1
    b .L08029F10
.L08029CE8:
    movs r5, #0xcf
    lsls r5, r5, #1
    b .L08029F10
.L08029CEE:
    movs r5, #0x4e
    b .L08029F10
.L08029CF2:
    movs r5, #0x46
    b .L08029F10
.L08029CF6:
    movs r5, #0x9f
    lsls r5, r5, #1
    b .L08029F10
.L08029CFC:
    movs r5, #0xa1
    lsls r5, r5, #1
    b .L08029F10
.L08029D02:
    adds r0, r6, #0
    adds r0, #0x44
    ldrh r5, [r0]
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #1
    b .L08029DD0
.L08029D22:
    movs r5, #0xf5
    lsls r5, r5, #1
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #2
    b .L08029DD0
.L08029D40:
    adds r2, r6, #0
    adds r2, #0x4e
    adds r1, r6, #0
    adds r1, #0x4f
    ldrb r0, [r2]
    ldrb r3, [r1]
    cmp r0, r3
    bne .L08029D56
.L08029D50:
    movs r5, #0xc9
    lsls r5, r5, #1
    b .L08029F10
.L08029D56:
    ldrb r0, [r1]
    ldrb r1, [r2]
    subs r0, r0, r1
    movs r5, #0xc1
    lsls r5, r5, #1
    cmp r0, #1
    bne .L08029D66
    adds r5, #4
.L08029D66:
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #3
    b .L08029DD0
.L08029D80:
    movs r5, #0x76
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    add r0, sp, #4
    b .L08029DD0
.L08029D9A:
    movs r5, #0x6e
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #5
    b .L08029DD0
.L08029DB6:
    movs r5, #0x72
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #6
.L08029DD0:
    strb r1, [r0]
.L08029DD2:
    bl GetIconId__C4Tool
    strh r0, [r7]
    b .L08029F10
.L08029DDA:
    movs r5, #0xfd
    lsls r5, r5, #1
    b .L08029F10
.L08029DE0:
    movs r5, #0xcb
    lsls r5, r5, #1
    b .L08029F10
.L08029DE6:
    movs r5, #0x89
    lsls r5, r5, #1
    b .L08029F10
.L08029DEC:
    movs r5, #0x8b
    lsls r5, r5, #1
    b .L08029F10
.L08029DF2:
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    adds r0, r6, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    beq .L08029E24
    cmp r0, #1
    bgt .L08029E14
    cmp r0, #0
    beq .L08029E1A
    b .L08029F10
.L08029E14:
    cmp r0, #2
    beq .L08029E30
    b .L08029F10
.L08029E1A:
    movs r5, #0xea
    ldr r1, .L08029E20 @ =0x0000077A
    b .L08029EBE
    .align 2, 0
.L08029E20: .4byte 0x0000077A
.L08029E24:
    movs r5, #0xee
    ldr r1, .L08029E2C @ =0x0000077E
    b .L08029EBE
    .align 2, 0
.L08029E2C: .4byte 0x0000077E
.L08029E30:
    movs r5, #0xe6
    ldr r1, .L08029E38 @ =0x00000782
    b .L08029EBE
    .align 2, 0
.L08029E38: .4byte 0x00000782
.L08029E3C:
    movs r5, #0xad
    lsls r5, r5, #1
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L08029E54 @ =0x0000077A
    b .L08029EBE
    .align 2, 0
.L08029E54: .4byte 0x0000077A
.L08029E58:
    movs r5, #0x9a
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L08029E6C @ =0x0000077A
    b .L08029EBE
    .align 2, 0
.L08029E6C: .4byte 0x0000077A
.L08029E70:
    movs r5, #0x83
    lsls r5, r5, #1
    b .L08029F10
.L08029E76:
    movs r5, #0x81
    lsls r5, r5, #1
    b .L08029F10
.L08029E7C:
    movs r5, #0xfe
    b .L08029F10
.L08029E80:
    movs r5, #0xfa
    b .L08029F10
.L08029E84:
    movs r5, #0x91
    lsls r5, r5, #1
    b .L08029F10
.L08029E8A:
    movs r5, #0x8f
    lsls r5, r5, #1
    b .L08029F10
.L08029E90:
    movs r5, #0x8d
    lsls r5, r5, #1
    b .L08029F10
.L08029E96:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xa5
    lsls r5, r5, #1
    cmp r0, #0
    beq .L08029F10
    subs r5, #0x40
    b .L08029F10
.L08029EAC:
    movs r5, #0xe2
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L08029ECC @ =0x00000792
.L08029EBE:
    ldrh r0, [r2, #0x22]
    cmp r0, r1
    beq .L08029F10
    adds r0, r2, #0
    bl SetAnim__12AActorEntityUi
    b .L08029F10
    .align 2, 0
.L08029ECC: .4byte 0x00000792
.L08029ED0:
    movs r5, #0x3e
    b .L08029F10
.L08029ED4:
    movs r5, #0xa3
    lsls r5, r5, #1
    b .L08029F10
.L08029EDA:
    movs r5, #0xa9
    lsls r5, r5, #1
    b .L08029F10
.L08029EE0:
    movs r5, #0x9d
    lsls r5, r5, #1
    b .L08029F10
.L08029EE6:
    movs r5, #0x42
    b .L08029F10
.L08029EEA:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xe3
    lsls r5, r5, #1
    cmp r0, #0
    bne .L08029F10
.L08029EFC:
    movs r5, #0xab
    lsls r5, r5, #1
    b .L08029F10
.L08029F02:
    adds r0, r6, #0
    adds r0, #0x3d
    ldrb r0, [r0]
    movs r5, #0xf6
    cmp r0, #0
    beq .L08029F10
    movs r5, #0xf2
.L08029F10:
    lsls r1, r5, #0x10
    lsrs r1, r1, #0x10
    adds r0, r6, #0
    bl SetAnim__12AActorEntityUi
    movs r0, #1
    mov r1, sl
    strb r0, [r1]
    add sp, #8
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0

    thumb_func_start func_08029F30
func_08029F30: @ 0x08029F30
    push {r4, r5, r6, r7, lr}
    mov r7, r8
    push {r7}
    sub sp, #8
    adds r6, r0, #0
    adds r3, r1, #0
    adds r0, #0xa4
    movs r1, #0
    mov r8, r1
    movs r7, #1
    strb r7, [r0]
    subs r0, #0x1c
    strb r7, [r0]
    mov r1, r8
    strb r1, [r0, #1]
    ldr r1, .L08029FD0 @ =0xFFF80000
    movs r2, #0x88
    lsls r2, r2, #0xd
    str r1, [r0, #4]
    mov r1, r8
    str r1, [r0, #8]
    str r2, [r0, #0x14]
    ldr r5, [r6, #0x10]
    cmp r5, #0
    beq .L08029F9E
    mov r0, sp
    adds r1, r3, #0
    bl __4ToolUi
    mov r0, sp
    bl GetIconId__C4Tool
    adds r4, r0, #0
    lsls r4, r4, #0x10
    lsrs r4, r4, #0x10
    ldr r0, [r5]
    ldr r0, [r0]
    ldr r1, [r0]
    ldr r1, [r1, #0x64]
    bl _call_via_r1
    adds r1, r0, #0
    adds r0, r5, #0
    adds r0, #0xb4
    adds r2, r4, #0
    bl func_0805E850
    adds r0, r5, #0
    adds r0, #0xc8
    strb r7, [r0]
    adds r0, #2
    mov r3, r8
    strb r3, [r0]
    adds r0, #1
    strb r7, [r0]
.L08029F9E:
    adds r3, r6, #0
    adds r3, #0x3c
    movs r0, #0x34
    strb r0, [r3]
    adds r2, r6, #0
    adds r2, #0x3d
    movs r0, #0x78
    strb r0, [r2]
    movs r5, #0xc9
    lsls r5, r5, #1
    adds r1, r6, #0
    adds r1, #0x7c
    ldr r0, .L08029FD4 @ =0x0000FFFF
    strh r0, [r1]
    ldrb r0, [r3]
    adds r7, r1, #0
    cmp r0, #0x39
    bls .L08029FC4
    b .L0802A3E0
.L08029FC4:
    lsls r0, r0, #2
    ldr r1, .L08029FD8 @ =.L08029FDC
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L08029FD0: .4byte 0xFFF80000
.L08029FD4: .4byte 0x0000FFFF
.L08029FD8: .4byte .L08029FDC
.L08029FDC: @ jump table
    .4byte .L0802A0C4 @ case 0
    .4byte .L0802A19E @ case 1
    .4byte .L0802A138 @ case 2
    .4byte .L0802A19E @ case 3
    .4byte .L0802A188 @ case 4
    .4byte .L0802A19E @ case 5
    .4byte .L0802A2BA @ case 6
    .4byte .L0802A2C6 @ case 7
    .4byte .L0802A3D6 @ case 8
    .4byte .L0802A1D6 @ case 9
    .4byte .L0802A3BA @ case 10
    .4byte .L0802A1BC @ case 11
    .4byte .L0802A1BC @ case 12
    .4byte .L0802A1B6 @ case 13
    .4byte .L0802A1BC @ case 14
    .4byte .L0802A1C2 @ case 15
    .4byte .L0802A1C6 @ case 16
    .4byte .L0802A3A8 @ case 17
    .4byte .L0802A3B4 @ case 18
    .4byte .L0802A1CA @ case 19
    .4byte .L0802A1D0 @ case 20
    .4byte .L0802A3BA @ case 21
    .4byte .L0802A2AE @ case 22
    .4byte .L0802A2B4 @ case 23
    .4byte .L0802A2C0 @ case 24
    .4byte .L0802A224 @ case 25
    .4byte .L0802A224 @ case 26
    .4byte .L0802A1F6 @ case 27
    .4byte .L0802A214 @ case 28
    .4byte .L0802A214 @ case 29
    .4byte .L0802A252 @ case 30
    .4byte .L0802A26E @ case 31
    .4byte .L0802A28A @ case 32
    .4byte .L0802A3A8 @ case 33
    .4byte .L0802A310 @ case 34
    .4byte .L0802A32C @ case 35
    .4byte .L0802A344 @ case 36
    .4byte .L0802A34A @ case 37
    .4byte .L0802A350 @ case 38
    .4byte .L0802A354 @ case 39
    .4byte .L0802A358 @ case 40
    .4byte .L0802A35E @ case 41
    .4byte .L0802A364 @ case 42
    .4byte .L0802A364 @ case 43
    .4byte .L0802A36A @ case 44
    .4byte .L0802A380 @ case 45
    .4byte .L0802A3A4 @ case 46
    .4byte .L0802A3BA @ case 47
    .4byte .L0802A3AE @ case 48
    .4byte .L0802A3A8 @ case 49
    .4byte .L0802A3AE @ case 50
    .4byte .L0802A3B4 @ case 51
    .4byte .L0802A3BA @ case 52
    .4byte .L0802A3BE @ case 53
    .4byte .L0802A3A8 @ case 54
    .4byte .L0802A3A8 @ case 55
    .4byte .L0802A3AE @ case 56
    .4byte .L0802A3AE @ case 57
.L0802A0C4:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0802A0F6
    adds r0, r6, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    bne .L0802A0DE
    b .L0802A3D0
.L0802A0DE:
    cmp r0, #1
    bgt .L0802A0EA
    cmp r0, #0
    bne .L0802A0E8
    b .L0802A3AE
.L0802A0E8:
    b .L0802A3E0
.L0802A0EA:
    cmp r0, #2
    beq .L0802A0F0
    b .L0802A3E0
.L0802A0F0:
    movs r5, #0xa7
    lsls r5, r5, #1
    b .L0802A3E0
.L0802A0F6:
    adds r0, r6, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    beq .L0802A112
    cmp r0, #1
    bgt .L0802A10C
    cmp r0, #0
    bne .L0802A10A
    b .L0802A224
.L0802A10A:
    b .L0802A3E0
.L0802A10C:
    cmp r0, #2
    beq .L0802A124
    b .L0802A3E0
.L0802A112:
    adds r0, r6, #0
    adds r0, #0xb3
    ldrb r0, [r0]
    movs r1, #0x99
    lsls r1, r1, #1
    cmp r0, #0
    bne .L0802A134
    adds r1, #0x94
    b .L0802A134
.L0802A124:
    adds r0, r6, #0
    adds r0, #0xb3
    ldrb r0, [r0]
    movs r1, #0x99
    lsls r1, r1, #1
    cmp r0, #0
    bne .L0802A134
    adds r1, #0x2c
.L0802A134:
    adds r5, r1, #0
    b .L0802A3E0
.L0802A138:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0802A148
    b .L0802A3AE
.L0802A148:
    adds r0, r6, #0
    adds r0, #0x3f
    ldrb r3, [r0]
    cmp r3, #5
    bgt .L0802A224
    cmp r3, #0
    blt .L0802A224
    ldr r2, .L0802A184 @ =gUnk_080F0FCC
    adds r1, r6, #0
    adds r1, #0x40
    lsls r0, r3, #3
    subs r0, r0, r3
    ldrb r1, [r1]
    adds r0, r0, r1
    lsls r0, r0, #1
    adds r0, r0, r2
    ldrh r5, [r0]
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #1
    b .L0802A2A4
    .align 2, 0
.L0802A184: .4byte gUnk_080F0FCC
.L0802A188:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xc9
    lsls r5, r5, #1
    cmp r0, #0
    beq .L0802A19C
    b .L0802A3E0
.L0802A19C:
    b .L0802A3AE
.L0802A19E:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xc9
    lsls r5, r5, #1
    cmp r0, #0
    beq .L0802A1B2
    b .L0802A3E0
.L0802A1B2:
    subs r5, #0x40
    b .L0802A3E0
.L0802A1B6:
    movs r5, #0x9b
    lsls r5, r5, #1
    b .L0802A3E0
.L0802A1BC:
    movs r5, #0xcf
    lsls r5, r5, #1
    b .L0802A3E0
.L0802A1C2:
    movs r5, #0x4e
    b .L0802A3E0
.L0802A1C6:
    movs r5, #0x46
    b .L0802A3E0
.L0802A1CA:
    movs r5, #0x9f
    lsls r5, r5, #1
    b .L0802A3E0
.L0802A1D0:
    movs r5, #0xa1
    lsls r5, r5, #1
    b .L0802A3E0
.L0802A1D6:
    adds r0, r6, #0
    adds r0, #0x44
    ldrh r5, [r0]
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #2
    b .L0802A2A4
.L0802A1F6:
    movs r5, #0xf5
    lsls r5, r5, #1
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #3
    b .L0802A2A4
.L0802A214:
    adds r2, r6, #0
    adds r2, #0x4e
    adds r1, r6, #0
    adds r1, #0x4f
    ldrb r0, [r2]
    ldrb r3, [r1]
    cmp r0, r3
    bne .L0802A22A
.L0802A224:
    movs r5, #0xc9
    lsls r5, r5, #1
    b .L0802A3E0
.L0802A22A:
    ldrb r0, [r1]
    ldrb r1, [r2]
    subs r0, r0, r1
    movs r5, #0xc1
    lsls r5, r5, #1
    cmp r0, #1
    bne .L0802A23A
    adds r5, #4
.L0802A23A:
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    add r0, sp, #4
    b .L0802A2A4
.L0802A252:
    movs r5, #0x76
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #5
    b .L0802A2A4
.L0802A26E:
    movs r5, #0x6e
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #6
    b .L0802A2A4
.L0802A28A:
    movs r5, #0x72
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #7
.L0802A2A4:
    strb r1, [r0]
    bl GetIconId__C4Tool
    strh r0, [r7]
    b .L0802A3E0
.L0802A2AE:
    movs r5, #0xfd
    lsls r5, r5, #1
    b .L0802A3E0
.L0802A2B4:
    movs r5, #0xcb
    lsls r5, r5, #1
    b .L0802A3E0
.L0802A2BA:
    movs r5, #0x89
    lsls r5, r5, #1
    b .L0802A3E0
.L0802A2C0:
    movs r5, #0x8b
    lsls r5, r5, #1
    b .L0802A3E0
.L0802A2C6:
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    adds r0, r6, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    beq .L0802A2F8
    cmp r0, #1
    bgt .L0802A2E8
    cmp r0, #0
    beq .L0802A2EE
    b .L0802A3E0
.L0802A2E8:
    cmp r0, #2
    beq .L0802A304
    b .L0802A3E0
.L0802A2EE:
    movs r5, #0xea
    ldr r1, .L0802A2F4 @ =0x0000077A
    b .L0802A392
    .align 2, 0
.L0802A2F4: .4byte 0x0000077A
.L0802A2F8:
    movs r5, #0xee
    ldr r1, .L0802A300 @ =0x0000077E
    b .L0802A392
    .align 2, 0
.L0802A300: .4byte 0x0000077E
.L0802A304:
    movs r5, #0xe6
    ldr r1, .L0802A30C @ =0x00000782
    b .L0802A392
    .align 2, 0
.L0802A30C: .4byte 0x00000782
.L0802A310:
    movs r5, #0xad
    lsls r5, r5, #1
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L0802A328 @ =0x0000077A
    b .L0802A392
    .align 2, 0
.L0802A328: .4byte 0x0000077A
.L0802A32C:
    movs r5, #0x9a
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L0802A340 @ =0x0000077A
    b .L0802A392
    .align 2, 0
.L0802A340: .4byte 0x0000077A
.L0802A344:
    movs r5, #0x83
    lsls r5, r5, #1
    b .L0802A3E0
.L0802A34A:
    movs r5, #0x81
    lsls r5, r5, #1
    b .L0802A3E0
.L0802A350:
    movs r5, #0xfe
    b .L0802A3E0
.L0802A354:
    movs r5, #0xfa
    b .L0802A3E0
.L0802A358:
    movs r5, #0x91
    lsls r5, r5, #1
    b .L0802A3E0
.L0802A35E:
    movs r5, #0x8f
    lsls r5, r5, #1
    b .L0802A3E0
.L0802A364:
    movs r5, #0x8d
    lsls r5, r5, #1
    b .L0802A3E0
.L0802A36A:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xa5
    lsls r5, r5, #1
    cmp r0, #0
    beq .L0802A3E0
    subs r5, #0x40
    b .L0802A3E0
.L0802A380:
    movs r5, #0xe2
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L0802A3A0 @ =0x00000792
.L0802A392:
    ldrh r0, [r2, #0x22]
    cmp r0, r1
    beq .L0802A3E0
    adds r0, r2, #0
    bl SetAnim__12AActorEntityUi
    b .L0802A3E0
    .align 2, 0
.L0802A3A0: .4byte 0x00000792
.L0802A3A4:
    movs r5, #0x3e
    b .L0802A3E0
.L0802A3A8:
    movs r5, #0xa3
    lsls r5, r5, #1
    b .L0802A3E0
.L0802A3AE:
    movs r5, #0xa9
    lsls r5, r5, #1
    b .L0802A3E0
.L0802A3B4:
    movs r5, #0x9d
    lsls r5, r5, #1
    b .L0802A3E0
.L0802A3BA:
    movs r5, #0x42
    b .L0802A3E0
.L0802A3BE:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r5, #0xe3
    lsls r5, r5, #1
    cmp r0, #0
    bne .L0802A3E0
.L0802A3D0:
    movs r5, #0xab
    lsls r5, r5, #1
    b .L0802A3E0
.L0802A3D6:
    ldrb r0, [r2]
    movs r5, #0xf6
    cmp r0, #0
    beq .L0802A3E0
    movs r5, #0xf2
.L0802A3E0:
    lsls r1, r5, #0x10
    lsrs r1, r1, #0x10
    adds r0, r6, #0
    bl SetAnim__12AActorEntityUi
    adds r1, r6, #0
    adds r1, #0xc0
    movs r0, #1
    strb r0, [r1]
    add sp, #8
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_0802A400
func_0802A400: @ 0x0802A400
    push {r4, r5, r6, r7, lr}
    mov r7, sb
    mov r6, r8
    push {r6, r7}
    adds r6, r0, #0
    adds r7, r1, #0
    adds r0, #0xa4
    movs r1, #0
    mov r8, r1
    movs r2, #1
    mov sb, r2
    mov r1, sb
    strb r1, [r0]
    subs r0, #0x1c
    strb r1, [r0]
    mov r2, r8
    strb r2, [r0, #1]
    movs r1, #0xa8
    lsls r1, r1, #0xd
    mov r2, r8
    str r2, [r0, #4]
    str r2, [r0, #8]
    str r1, [r0, #0x14]
    ldr r5, [r6, #0x10]
    cmp r5, #0
    beq .L0802A46A
    adds r0, r7, #0
    bl GetIconId__C4Food
    adds r4, r0, #0
    lsls r4, r4, #0x10
    lsrs r4, r4, #0x10
    ldr r0, [r5]
    ldr r0, [r0]
    ldr r1, [r0]
    ldr r1, [r1, #0x64]
    bl _call_via_r1
    adds r1, r0, #0
    adds r0, r5, #0
    adds r0, #0xb4
    adds r2, r4, #0
    bl func_0805E850
    adds r0, r5, #0
    adds r0, #0xc8
    mov r1, sb
    strb r1, [r0]
    adds r0, #2
    mov r2, r8
    strb r2, [r0]
    adds r0, #1
    strb r1, [r0]
.L0802A46A:
    ldr r5, [r6, #0x14]
    adds r0, r7, #0
    bl GetStaminaGain__C4Food
    adds r4, r0, #0
    adds r0, r7, #0
    bl GetFatigueGain__C4Food
    adds r2, r0, #0
    ldr r3, [r5, #0x64]
    adds r0, r6, #0
    adds r1, r4, #0
    bl _call_via_r3
    adds r0, r7, #0
    bl IsDrink__C4Food
    cmp r0, #0
    bne .L0802A498
    adds r1, r6, #0
    adds r1, #0x3c
    movs r0, #0x36
    b .L0802A49E
.L0802A498:
    adds r1, r6, #0
    adds r1, #0x3c
    movs r0, #0x37
.L0802A49E:
    strb r0, [r1]
    adds r0, r6, #0
    adds r0, #0xc0
    movs r1, #1
    strb r1, [r0]
    movs r1, #0xa3
    lsls r1, r1, #1
    adds r0, r6, #0
    bl SetAnim__12AActorEntityUi
    pop {r3, r4}
    mov r8, r3
    mov sb, r4
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_0802A4C0
func_0802A4C0: @ 0x0802A4C0
    push {r4, r5, lr}
    adds r3, r0, #0
    adds r5, r1, #0
    adds r1, r3, #0
    adds r1, #0x88
    movs r0, #1
    strb r0, [r1]
    cmp r2, #1
    beq .L0802A4D6
    cmp r2, #0
    bne .L0802A4D8
.L0802A4D6:
    strb r2, [r1, #1]
.L0802A4D8:
    ldr r4, [r3, #0x10]
    cmp r4, #0
    beq .L0802A508
    ldr r0, [r4]
    ldr r0, [r0]
    ldr r1, [r0]
    ldr r1, [r1, #0x64]
    bl _call_via_r1
    adds r1, r0, #0
    adds r0, r4, #0
    adds r0, #0xb4
    adds r2, r5, #0
    bl func_0805E850
    adds r0, r4, #0
    adds r0, #0xc8
    movs r2, #0
    movs r1, #1
    strb r1, [r0]
    adds r0, #2
    strb r2, [r0]
    adds r0, #1
    strb r1, [r0]
.L0802A508:
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_0802A510
func_0802A510: @ 0x0802A510
    push {r4, r5, r6, r7, lr}
    sub sp, #4
    adds r3, r0, #0
    adds r0, #0x88
    movs r6, #0
    movs r7, #1
    strb r7, [r0]
    strb r6, [r0, #1]
    ldr r1, .L0802A584 @ =0xFFF80000
    movs r2, #0x88
    lsls r2, r2, #0xd
    str r1, [r0, #4]
    str r6, [r0, #8]
    str r2, [r0, #0x14]
    ldr r5, [r3, #0x10]
    cmp r5, #0
    beq .L0802A57A
    ldr r4, [r3, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    mov r1, sp
    strb r0, [r1]
    mov r0, sp
    bl GetIconId__C4Tool
    adds r4, r0, #0
    lsls r4, r4, #0x10
    lsrs r4, r4, #0x10
    ldr r0, [r5]
    ldr r0, [r0]
    ldr r1, [r0]
    ldr r1, [r1, #0x64]
    bl _call_via_r1
    adds r1, r0, #0
    adds r0, r5, #0
    adds r0, #0xb4
    adds r2, r4, #0
    bl func_0805E850
    adds r0, r5, #0
    adds r0, #0xc8
    strb r7, [r0]
    adds r0, #2
    strb r6, [r0]
    adds r0, #1
    strb r7, [r0]
.L0802A57A:
    add sp, #4
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L0802A584: .4byte 0xFFF80000

    thumb_func_start func_0802A588
func_0802A588: @ 0x0802A588
    push {r4, r5, r6, r7, lr}
    mov r7, r8
    push {r7}
    sub sp, #8
    adds r6, r0, #0
    ldr r0, [r6, #0x38]
    adds r4, r0, #0
    adds r4, #0x54
    adds r0, r4, #0
    bl func_0800F190
    lsls r0, r0, #0x18
    lsrs r7, r0, #0x18
    cmp r7, #0
    beq .L0802A5A8
    b .L0802A7C2
.L0802A5A8:
    adds r0, r6, #0
    adds r0, #0x88
    movs r1, #1
    mov r8, r1
    mov r2, r8
    strb r2, [r0]
    strb r7, [r0, #1]
    movs r1, #0xa8
    lsls r1, r1, #0xd
    str r7, [r0, #4]
    str r7, [r0, #8]
    str r1, [r0, #0x14]
    ldr r0, [r6, #0x10]
    cmp r0, #0
    bne .L0802A5C8
    b .L0802A7CA
.L0802A5C8:
    adds r5, r0, #0
    adds r0, r4, #0
    bl func_0800F388
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802A5FE
    ldr r0, [r5]
    ldr r0, [r0]
    ldr r1, [r0]
    ldr r1, [r1, #0x64]
    bl _call_via_r1
    adds r1, r0, #0
    adds r0, r5, #0
    adds r0, #0xb4
    movs r2, #0xb0
    lsls r2, r2, #1
    bl func_0805E850
    adds r0, r5, #0
    adds r0, #0xc8
    mov r1, r8
    strb r1, [r0]
    adds r0, #2
    strb r7, [r0]
    b .L0802A7BC
.L0802A5FE:
    adds r0, r4, #0
    bl func_0800F204
    cmp r0, #5
    bls .L0802A60A
    b .L0802A7CA
.L0802A60A:
    lsls r0, r0, #2
    ldr r1, .L0802A614 @ =.L0802A618
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L0802A614: .4byte .L0802A618
.L0802A618: @ jump table
    .4byte .L0802A630 @ case 0
    .4byte .L0802A646 @ case 1
    .4byte .L0802A6BE @ case 2
    .4byte .L0802A714 @ case 3
    .4byte .L0802A778 @ case 4
    .4byte .L0802A78E @ case 5
.L0802A630:
    mov r0, sp
    adds r1, r4, #0
    bl func_0800F20C
    mov r0, sp
    bl GetIconId__C4Food
    adds r4, r0, #0
    lsls r4, r4, #0x10
    lsrs r4, r4, #0x10
    b .L0802A796
.L0802A646:
    adds r0, r4, #0
    bl func_0800F258
    adds r1, r0, #0
    add r0, sp, #4
    strb r1, [r0]
    bl GetId__C7Article
    cmp r0, #0x1b
    bne .L0802A6A4
    adds r0, r6, #0
    bl func_08025AFC
    lsls r0, r0, #0x18
    lsrs r4, r0, #0x18
    cmp r4, #0
    beq .L0802A67E
    ldr r0, [r5]
    ldr r0, [r0]
    ldr r1, [r0]
    ldr r1, [r1, #0x64]
    bl _call_via_r1
    adds r1, r0, #0
    adds r0, r5, #0
    adds r0, #0xb4
    movs r2, #4
    b .L0802A7AA
.L0802A67E:
    ldr r0, [r5]
    ldr r0, [r0]
    ldr r1, [r0]
    ldr r1, [r1, #0x64]
    bl _call_via_r1
    adds r1, r0, #0
    adds r0, r5, #0
    adds r0, #0xb4
    movs r2, #3
    bl func_0805E850
    adds r0, r5, #0
    adds r0, #0xc8
    movs r1, #1
    strb r1, [r0]
    adds r0, #2
    strb r4, [r0]
    b .L0802A7BC
.L0802A6A4:
    adds r0, r4, #0
    bl func_0800F258
    adds r1, r0, #0
    mov r0, sp
    adds r0, #5
    strb r1, [r0]
    bl GetIconId__C7Article
    adds r4, r0, #0
    lsls r4, r4, #0x10
    lsrs r4, r4, #0x10
    b .L0802A796
.L0802A6BE:
    ldr r0, [r6, #0x34]
    ldr r2, .L0802A6F4 @ =0x00001C70
    adds r0, r0, r2
    bl GetGrowthStage__C3Dog
    adds r4, r0, #0
    cmp r4, #0
    bne .L0802A6FC
    ldr r0, [r5]
    ldr r0, [r0]
    ldr r1, [r0]
    ldr r1, [r1, #0x68]
    bl _call_via_r1
    adds r1, r0, #0
    adds r0, r5, #0
    adds r0, #0xb4
    ldr r2, .L0802A6F8 @ =0x000003DA
    bl func_0805E850
    adds r0, r5, #0
    adds r0, #0xc8
    movs r1, #1
    strb r1, [r0]
    adds r0, #2
    strb r4, [r0]
    b .L0802A7BC
    .align 2, 0
.L0802A6F4: .4byte 0x00001C70
.L0802A6F8: .4byte 0x000003DA
.L0802A6FC:
    ldr r0, [r5]
    ldr r0, [r0]
    ldr r1, [r0]
    ldr r1, [r1, #0x68]
    bl _call_via_r1
    adds r1, r0, #0
    adds r0, r5, #0
    adds r0, #0xb4
    movs r2, #0xdd
    lsls r2, r2, #2
    b .L0802A7AA
.L0802A714:
    adds r0, r4, #0
    bl func_0800F344
    adds r1, r0, #0
    ldr r0, [r6, #0x34]
    movs r2, #0x82
    lsls r2, r2, #3
    adds r0, r0, r2
    bl GetChicken__4CoopUi
    bl GetGrowthStage__C7Chicken
    adds r4, r0, #0
    cmp r4, #0
    bne .L0802A75C
    ldr r0, [r5]
    ldr r0, [r0]
    ldr r1, [r0]
    ldr r1, [r1, #0x68]
    bl _call_via_r1
    adds r1, r0, #0
    adds r0, r5, #0
    adds r0, #0xb4
    ldr r2, .L0802A758 @ =0x0000073D
    bl func_0805E850
    adds r0, r5, #0
    adds r0, #0xc8
    movs r1, #1
    strb r1, [r0]
    adds r0, #2
    strb r4, [r0]
    b .L0802A7BC
    .align 2, 0
.L0802A758: .4byte 0x0000073D
.L0802A75C:
    ldr r0, [r5]
    ldr r0, [r0]
    ldr r1, [r0]
    ldr r1, [r1, #0x68]
    bl _call_via_r1
    adds r1, r0, #0
    adds r0, r5, #0
    adds r0, #0xb4
    ldr r2, .L0802A774 @ =0x00000734
    b .L0802A7AA
    .align 2, 0
.L0802A774: .4byte 0x00000734
.L0802A778:
    ldr r0, [r5]
    ldr r0, [r0]
    ldr r1, [r0]
    ldr r1, [r1, #0x64]
    bl _call_via_r1
    adds r1, r0, #0
    adds r0, r5, #0
    adds r0, #0xb4
    movs r2, #0x35
    b .L0802A7AA
.L0802A78E:
    adds r0, r4, #0
    bl func_0800F360
    adds r4, r0, #0
.L0802A796:
    ldr r0, [r5]
    ldr r0, [r0]
    ldr r1, [r0]
    ldr r1, [r1, #0x64]
    bl _call_via_r1
    adds r1, r0, #0
    adds r0, r5, #0
    adds r0, #0xb4
    adds r2, r4, #0
.L0802A7AA:
    bl func_0805E850
    adds r0, r5, #0
    adds r0, #0xc8
    movs r2, #0
    movs r1, #1
    strb r1, [r0]
    adds r0, #2
    strb r2, [r0]
.L0802A7BC:
    adds r0, #1
    strb r1, [r0]
    b .L0802A7CA
.L0802A7C2:
    adds r1, r6, #0
    adds r1, #0x88
    movs r0, #0
    strb r0, [r1]
.L0802A7CA:
    add sp, #8
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_0802A7D8
func_0802A7D8: @ 0x0802A7D8
    adds r0, #0x88
    movs r1, #0
    strb r1, [r0]
    bx lr

    .section .discard.func_0802A7E0, "ax", %progbits
    thumb_func_start func_0802A7E0_asm
func_0802A7E0_asm: @ 0x0802A7E0
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #0x34
    adds r5, r0, #0
    ldr r0, [r5, #0x38]
    adds r0, #0x54
    mov r8, r0
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802A800
    b .L0802AA72
.L0802A800:
    mov r0, r8
    bl func_0800F388
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802A80E
    b .L0802AA40
.L0802A80E:
    movs r1, #0xa
    ldrsh r0, [r5, r1]
    mov sb, r0
    movs r0, #0xe
    ldrsh r4, [r5, r0]
    mov sl, r4
    mov r4, sb
    mov r7, sl
    adds r0, r5, #0
    adds r0, #0x20
    ldrb r0, [r0]
    cmp r0, #1
    beq .L0802A83C
    cmp r0, #1
    bgt .L0802A832
    cmp r0, #0
    beq .L0802A848
    b .L0802A866
.L0802A832:
    cmp r0, #2
    beq .L0802A852
    cmp r0, #3
    beq .L0802A85E
    b .L0802A866
.L0802A83C:
    movs r1, #0x14
    rsbs r1, r1, #0
    adds r1, r1, r7
    mov sl, r1
    subs r7, #0x10
    b .L0802A866
.L0802A848:
    movs r0, #0x14
    adds r0, r0, r7
    mov sl, r0
    adds r7, #0x10
    b .L0802A866
.L0802A852:
    movs r1, #0x14
    rsbs r1, r1, #0
    adds r1, r1, r4
    mov sb, r1
    subs r4, #0x10
    b .L0802A866
.L0802A85E:
    movs r0, #0x14
    adds r0, r0, r4
    mov sb, r0
    adds r4, #0x10
.L0802A866:
    ldr r1, [r5]
    str r1, [sp, #0x30]
    ldrh r6, [r5, #4]
    ldr r1, [r1]
    mov r0, sp
    ldr r3, [r1, #0x34]
    ldr r1, [sp, #0x30]
    adds r2, r6, #0
    bl _call_via_r3
    mov r5, sp
    mov r0, r8
    bl func_0800F204
    cmp r0, #5
    bls .L0802A888
    b .L0802AA72
.L0802A888:
    lsls r0, r0, #2
    ldr r1, .L0802A894 @ =.L0802A898
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L0802A894: .4byte .L0802A898
.L0802A898: @ jump table
    .4byte .L0802AA40 @ case 0
    .4byte .L0802A8B0 @ case 1
    .4byte .L0802AA44 @ case 2
    .4byte .L0802AA48 @ case 3
    .4byte .L0802AA4C @ case 4
    .4byte .L0802AA72 @ case 5
.L0802A8B0:
    mov r0, r8
    bl func_0800F258
    add r1, sp, #0x14
    strb r0, [r1]
    adds r0, r1, #0
    bl CanBeDiscarded__C7Article
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0802A8C8
    b .L0802AA72
.L0802A8C8:
    add r0, sp, #0x14
    bl GetId__C7Article
    subs r0, #0x31
    cmp r0, #0x29
    bls .L0802A8D6
    b .L0802AA40
.L0802A8D6:
    lsls r0, r0, #2
    ldr r1, .L0802A8E0 @ =.L0802A8E4
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L0802A8E0: .4byte .L0802A8E4
.L0802A8E4: @ jump table
    .4byte .L0802A98C @ case 0
    .4byte .L0802A9A2 @ case 1
    .4byte .L0802AA40 @ case 2
    .4byte .L0802AA40 @ case 3
    .4byte .L0802A99E @ case 4
    .4byte .L0802AA40 @ case 5
    .4byte .L0802AA40 @ case 6
    .4byte .L0802AA40 @ case 7
    .4byte .L0802AA40 @ case 8
    .4byte .L0802AA40 @ case 9
    .4byte .L0802AA40 @ case 10
    .4byte .L0802AA40 @ case 11
    .4byte .L0802AA40 @ case 12
    .4byte .L0802AA40 @ case 13
    .4byte .L0802AA40 @ case 14
    .4byte .L0802AA40 @ case 15
    .4byte .L0802AA40 @ case 16
    .4byte .L0802AA40 @ case 17
    .4byte .L0802AA40 @ case 18
    .4byte .L0802AA40 @ case 19
    .4byte .L0802AA40 @ case 20
    .4byte .L0802AA40 @ case 21
    .4byte .L0802AA40 @ case 22
    .4byte .L0802AA40 @ case 23
    .4byte .L0802AA40 @ case 24
    .4byte .L0802AA40 @ case 25
    .4byte .L0802AA40 @ case 26
    .4byte .L0802AA40 @ case 27
    .4byte .L0802AA40 @ case 28
    .4byte .L0802AA40 @ case 29
    .4byte .L0802AA40 @ case 30
    .4byte .L0802AA40 @ case 31
    .4byte .L0802AA40 @ case 32
    .4byte .L0802AA40 @ case 33
    .4byte .L0802AA40 @ case 34
    .4byte .L0802AA40 @ case 35
    .4byte .L0802AA40 @ case 36
    .4byte .L0802AA40 @ case 37
    .4byte .L0802AA40 @ case 38
    .4byte .L0802AA40 @ case 39
    .4byte .L0802A9A2 @ case 40
    .4byte .L0802A9A2 @ case 41
.L0802A98C:
    adds r0, r5, #0
    mov r1, sb
    mov r2, sl
    bl func_080AC5D0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802A9A2
    b .L0802AA40
.L0802A99E:
    movs r0, #3
    b .L0802AA74
.L0802A9A2:
    ldr r0, [sp, #0x30]
    ldr r0, [r0]
    mov sb, r0
    movs r1, #0xe8
    add sb, r1
    add r1, sp, #0xc
    ldr r0, .L0802AA24 @ =0x000003FF
    mov r8, r0
    mov r0, r8
    ands r6, r0
    ldrh r2, [r1]
    ldr r5, .L0802AA28 @ =0xFFFFFC00
    adds r0, r5, #0
    ands r0, r2
    orrs r0, r6
    strh r0, [r1]
    lsls r4, r4, #0x10
    lsrs r2, r4, #0x10
    movs r0, #0x3f
    mov sl, r0
    ands r2, r0
    lsls r2, r2, #2
    ldrb r6, [r1, #1]
    movs r3, #3
    adds r0, r3, #0
    ands r0, r6
    orrs r0, r2
    strb r0, [r1, #1]
    lsrs r4, r4, #0x16
    mov r0, r8
    ands r4, r0
    ldrh r2, [r1, #2]
    adds r0, r5, #0
    ands r0, r2
    orrs r0, r4
    strh r0, [r1, #2]
    lsls r2, r7, #0x10
    lsrs r0, r2, #0x10
    mov r4, sl
    ands r0, r4
    lsls r0, r0, #2
    ldrb r4, [r1, #3]
    ands r3, r4
    orrs r3, r0
    strb r3, [r1, #3]
    lsrs r2, r2, #0x16
    mov r0, r8
    ands r2, r0
    ldrh r0, [r1, #4]
    ands r5, r0
    orrs r5, r2
    strh r5, [r1, #4]
    mov r4, sb
    ldr r3, [r4]
    ldr r0, [sp, #0x30]
    add r2, sp, #0x14
    bl _call_via_r3
    cmp r0, #1
    beq .L0802AA72
    cmp r0, #1
    bgt .L0802AA2C
    cmp r0, #0
    beq .L0802AA32
    b .L0802AA72
    .align 2, 0
.L0802AA24: .4byte 0x000003FF
.L0802AA28: .4byte 0xFFFFFC00
.L0802AA2C:
    cmp r0, #2
    beq .L0802AA36
    b .L0802AA72
.L0802AA32:
    movs r0, #1
    b .L0802AA74
.L0802AA36:
    add r0, sp, #0x14
    bl GetId__C7Article
    cmp r0, #0x31
    beq .L0802AA72
.L0802AA40:
    movs r0, #0
    b .L0802AA74
.L0802AA44:
    add r1, sp, #0x18
    b .L0802AA4E
.L0802AA48:
    add r1, sp, #0x20
    b .L0802AA4E
.L0802AA4C:
    add r1, sp, #0x28
.L0802AA4E:
    subs r0, r4, #7
    strh r0, [r1]
    subs r0, r7, #4
    strh r0, [r1, #2]
    adds r0, r4, #7
    strh r0, [r1, #4]
    adds r0, r7, #5
    strh r0, [r1, #6]
    adds r0, r5, #0
    bl func_080AC070
    lsls r0, r0, #0x18
    movs r1, #1
    cmp r0, #0
    beq .L0802AA6E
    movs r1, #2
.L0802AA6E:
    adds r0, r1, #0
    b .L0802AA74
.L0802AA72:
    movs r0, #2
.L0802AA74:
    add sp, #0x34
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1

    .section .text.after_func_0802A7E0, "ax", %progbits
    thumb_func_start func_0802AA84
func_0802AA84: @ 0x0802AA84
    push {r4, r5, r6, r7, lr}
    mov r7, sb
    mov r6, r8
    push {r6, r7}
    sub sp, #0xc
    mov r8, r0
    movs r0, #0
    mov sb, r0
    mov r1, r8
    ldr r0, [r1, #0x34]
    ldr r1, .L0802AAD8 @ =0x00001C34
    adds r5, r0, r1
    adds r0, r5, #0
    bl IsEmpty__C9ToolStack
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0802AACA
    mov r0, r8
    ldr r4, [r0, #0x34]
    ldr r1, .L0802AADC @ =0x00001BD8
    adds r4, r4, r1
    adds r0, r5, #0
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    add r1, sp, #8
    strb r0, [r1]
    movs r0, #0
    bl func_080246BC
    mov sb, r0
.L0802AACA:
    mov r1, r8
    ldr r0, [r1, #0x34]
    ldr r1, .L0802AAE0 @ =0x00001C38
    adds r7, r0, r1
    movs r6, #0
    b .L0802AB1E
    .align 2, 0
.L0802AAD8: .4byte 0x00001C34
.L0802AADC: .4byte 0x00001BD8
.L0802AAE0: .4byte 0x00001C38
.L0802AAE4:
    adds r0, r7, #0
    adds r1, r6, #0
    bl GetToolAt__C8RucksackUi
    adds r5, r0, #0
    bl IsEmpty__C9ToolStack
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0802AB1C
    mov r0, r8
    ldr r4, [r0, #0x34]
    ldr r1, .L0802AB90 @ =0x00001BD8
    adds r4, r4, r1
    adds r0, r5, #0
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    mov r1, sp
    adds r1, #9
    strb r0, [r1]
    mov r0, sb
    bl func_080246BC
    mov sb, r0
.L0802AB1C:
    adds r6, #1
.L0802AB1E:
    adds r0, r7, #0
    bl GetSize__C8Rucksack
    cmp r6, r0
    blo .L0802AAE4
    mov r1, r8
    ldr r0, [r1, #0x34]
    movs r1, #0xe0
    lsls r1, r1, #2
    adds r7, r0, r1
    movs r6, #0
.L0802AB34:
    adds r0, r7, #0
    adds r1, r6, #0
    bl GetToolStackAt__C9ToolChestUi
    adds r5, r0, #0
    bl IsEmpty__C9ToolStack
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0802AB6C
    mov r0, r8
    ldr r4, [r0, #0x34]
    ldr r1, .L0802AB90 @ =0x00001BD8
    adds r4, r4, r1
    adds r0, r5, #0
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    mov r1, sp
    adds r1, #0xa
    strb r0, [r1]
    mov r0, sb
    bl func_080246BC
    mov sb, r0
.L0802AB6C:
    adds r6, #1
    cmp r6, #0x3f
    bls .L0802AB34
    ldr r1, .L0802AB94 @ =gUnk_080F11B4
    mov r0, sp
    movs r2, #7
    bl memcpy
    mov r0, sp
    add r0, sb
    ldrb r0, [r0]
    add sp, #0xc
    pop {r3, r4}
    mov r8, r3
    mov sb, r4
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    .align 2, 0
.L0802AB90: .4byte 0x00001BD8
.L0802AB94: .4byte gUnk_080F11B4

    thumb_func_start func_0802AB98
func_0802AB98: @ 0x0802AB98
    push {r4, lr}
    adds r3, r0, #0
    adds r0, r1, #0
    cmp r2, #1
    beq .L0802ABB6
    cmp r2, #1
    bgt .L0802ABAC
    cmp r2, #0
    beq .L0802ABCC
    b .L0802AC1A
.L0802ABAC:
    cmp r2, #2
    beq .L0802ABE6
    cmp r2, #3
    beq .L0802ABFE
    b .L0802AC1A
.L0802ABB6:
    movs r2, #0xa
    ldrsh r1, [r0, r2]
    movs r4, #0xe
    ldrsh r2, [r0, r4]
    subs r0, r1, #4
    strh r0, [r3]
    adds r0, r2, #0
    subs r0, #0x14
    strh r0, [r3, #2]
    adds r1, #4
    b .L0802AC12
.L0802ABCC:
    movs r2, #0xa
    ldrsh r1, [r0, r2]
    movs r4, #0xe
    ldrsh r2, [r0, r4]
    subs r0, r1, #4
    strh r0, [r3]
    subs r0, r2, #6
    strh r0, [r3, #2]
    adds r1, #4
    strh r1, [r3, #4]
    adds r2, #0x12
    strh r2, [r3, #6]
    b .L0802AC24
.L0802ABE6:
    movs r2, #0xa
    ldrsh r1, [r0, r2]
    movs r4, #0xe
    ldrsh r2, [r0, r4]
    adds r0, r1, #0
    subs r0, #0x14
    strh r0, [r3]
    adds r0, r2, #0
    subs r0, #0xe
    strh r0, [r3, #2]
    adds r1, #4
    b .L0802AC12
.L0802ABFE:
    movs r2, #0xa
    ldrsh r1, [r0, r2]
    movs r4, #0xe
    ldrsh r2, [r0, r4]
    subs r0, r1, #4
    strh r0, [r3]
    adds r0, r2, #0
    subs r0, #0xe
    strh r0, [r3, #2]
    adds r1, #0x14
.L0802AC12:
    strh r1, [r3, #4]
    adds r2, #2
    strh r2, [r3, #6]
    b .L0802AC24
.L0802AC1A:
    movs r0, #0
    strh r0, [r3]
    strh r0, [r3, #2]
    strh r0, [r3, #4]
    strh r0, [r3, #6]
.L0802AC24:
    adds r0, r3, #0
    pop {r4}
    pop {r2}
    bx r2

    thumb_func_start func_0802AC2C
func_0802AC2C: @ 0x0802AC2C
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #0x38
    mov sb, r0
    adds r6, r2, #0
    adds r5, r1, #0
    ldr r0, [r0]
    str r0, [sp, #0x18]
    mov r1, sb
    ldrh r1, [r1, #4]
    str r1, [sp, #0x1c]
    mov r2, sb
    movs r3, #0xa
    ldrsh r2, [r2, r3]
    str r2, [sp, #0x20]
    mov r0, sb
    movs r1, #0xe
    ldrsh r0, [r0, r1]
    str r0, [sp, #0x24]
    mov r0, sb
    adds r0, #0x20
    ldrb r2, [r0]
    mov r0, sp
    mov r1, sb
    bl func_0802AB98
    ldr r0, [sp]
    ldr r1, [sp, #4]
    str r0, [sp, #8]
    str r1, [sp, #0xc]
    add r2, sp, #8
    mov r8, r2
    movs r3, #0x64
    str r3, [sp, #0x28]
    movs r0, #0
    str r0, [sp, #0x2c]
    movs r1, #0x2b
    mov sl, r1
    add r7, sp, #0x10
.L0802AC80:
    mov r2, sl
    str r2, [sp, #0x30]
    ldr r3, [sp, #0x18]
    ldr r0, [r3]
    ldr r2, [r0, #0x40]
    adds r0, r3, #0
    mov r1, sl
    bl _call_via_r2
    adds r4, r0, #0
    movs r0, #0
    add r1, sp, #0x34
    strb r0, [r1]
    cmp r4, #0
    beq .L0802AD20
    ldrh r0, [r4, #4]
    ldr r2, [sp, #0x1c]
    cmp r0, r2
    bne .L0802AD20
    ldr r1, [r4, #0x14]
    adds r0, r7, #0
    ldr r2, [r1, #0xc]
    adds r1, r4, #0
    bl _call_via_r2
    mov r3, r8
    movs r0, #0
    ldrsh r2, [r3, r0]
    movs r1, #4
    ldrsh r0, [r7, r1]
    subs r2, r2, r0
    movs r3, #0
    ldrsh r0, [r7, r3]
    mov r1, r8
    movs r3, #4
    ldrsh r1, [r1, r3]
    subs r0, r0, r1
    ands r2, r0
    mov r1, r8
    movs r3, #2
    ldrsh r0, [r1, r3]
    movs r3, #6
    ldrsh r1, [r7, r3]
    subs r0, r0, r1
    ands r2, r0
    movs r1, #2
    ldrsh r0, [r7, r1]
    mov r3, r8
    movs r1, #6
    ldrsh r3, [r3, r1]
    subs r0, r0, r3
    ands r2, r0
    cmp r2, #0
    bge .L0802AD20
    asrs r2, r5, #0x10
    cmp r2, #0
    beq .L0802AD1A
    cmp r2, #0
    ble .L0802AD08
    lsls r0, r6, #0x10
    asrs r0, r0, #0x10
    adds r0, r4, r0
    ldr r1, [r0]
    lsls r0, r2, #2
    adds r0, r0, r1
    subs r0, #4
    ldr r1, [r0]
    b .L0802AD0A
.L0802AD08:
    adds r1, r6, #0
.L0802AD0A:
    lsls r0, r5, #0x10
    asrs r0, r0, #0x10
    adds r0, r4, r0
    bl _call_via_r1
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802AD20
.L0802AD1A:
    movs r2, #1
    add r3, sp, #0x34
    strb r2, [r3]
.L0802AD20:
    add r0, sp, #0x34
    ldrb r0, [r0]
    cmp r0, #0
    beq .L0802AD5A
    movs r2, #0xa
    ldrsh r1, [r4, r2]
    ldr r3, [sp, #0x20]
    subs r1, r1, r3
    movs r2, #0xe
    ldrsh r0, [r4, r2]
    ldr r3, [sp, #0x24]
    subs r0, r0, r3
    adds r2, r1, #0
    muls r2, r1, r2
    adds r1, r2, #0
    adds r3, r0, #0
    muls r3, r0, r3
    adds r0, r3, #0
    adds r0, r1, r0
    adds r1, r0, #0
    ldr r2, [sp, #0x28]
    cmp r2, #0x64
    beq .L0802AD54
    ldr r3, [sp, #0x2c]
    cmp r3, r0
    ble .L0802AD5A
.L0802AD54:
    ldr r0, [sp, #0x30]
    str r0, [sp, #0x28]
    str r1, [sp, #0x2c]
.L0802AD5A:
    movs r1, #1
    add sl, r1
    mov r2, sl
    cmp r2, #0x45
    bls .L0802AC80
    mov r0, sb
    adds r0, #0xb2
    add r3, sp, #0x28
    ldrb r3, [r3]
    strb r3, [r0]
    add sp, #0x38
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_0802AD80
func_0802AD80: @ 0x0802AD80
    push {r4, r5, lr}
    sub sp, #0x30
    adds r5, r0, #0
    ldr r0, [r5, #0x38]
    bl func_0800E958
    adds r4, r0, #0
    ldr r0, [r5, #0x38]
    bl func_0800ED8C
    ldr r0, [r5, #0x38]
    bl func_0800E958
    cmp r4, r0
    bne .L0802ADA0
    b .L0802AE98
.L0802ADA0:
    ldr r0, [r5, #0x38]
    bl func_0800E958
    adds r1, r0, #0
    ldr r0, .L0802ADC0 @ =0x000F4240
    cmp r1, r0
    beq .L0802AE28
    cmp r1, r0
    bhi .L0802ADCC
    ldr r0, .L0802ADC4 @ =0x00002710
    cmp r1, r0
    beq .L0802ADF4
    ldr r0, .L0802ADC8 @ =0x000186A0
    cmp r1, r0
    beq .L0802AE10
    b .L0802AE98
    .align 2, 0
.L0802ADC0: .4byte 0x000F4240
.L0802ADC4: .4byte 0x00002710
.L0802ADC8: .4byte 0x000186A0
.L0802ADCC:
    ldr r0, .L0802ADE0 @ =0x05F5E100
    cmp r1, r0
    beq .L0802AE58
    cmp r1, r0
    bhi .L0802ADE8
    ldr r0, .L0802ADE4 @ =0x00989680
    cmp r1, r0
    beq .L0802AE3E
    b .L0802AE98
    .align 2, 0
.L0802ADE0: .4byte 0x05F5E100
.L0802ADE4: .4byte 0x00989680
.L0802ADE8:
    ldr r0, .L0802ADF0 @ =0x3B9ACA00
    cmp r1, r0
    beq .L0802AE7C
    b .L0802AE98
    .align 2, 0
.L0802ADF0: .4byte 0x3B9ACA00
.L0802ADF4:
    ldr r0, [r5]
    ldr r1, [r0]
    movs r2, #0xa0
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r2, .L0802AE0C @ =0x00000336
    movs r3, #0
    str r2, [sp]
    str r3, [sp, #4]
    ldr r3, [r1]
    mov r1, sp
    b .L0802AE6E
    .align 2, 0
.L0802AE0C: .4byte 0x00000336
.L0802AE10:
    ldr r0, [r5]
    ldr r2, [r0]
    movs r1, #0xa0
    lsls r1, r1, #1
    adds r2, r2, r1
    add r1, sp, #8
    ldr r3, .L0802AE24 @ =0x00000337
    movs r4, #0
    str r3, [sp, #8]
    b .L0802AE6A
    .align 2, 0
.L0802AE24: .4byte 0x00000337
.L0802AE28:
    ldr r0, [r5]
    ldr r2, [r0]
    movs r1, #0xa0
    lsls r1, r1, #1
    adds r2, r2, r1
    add r1, sp, #0x10
    movs r3, #0xce
    lsls r3, r3, #2
    movs r4, #0
    str r3, [sp, #0x10]
    b .L0802AE6A
.L0802AE3E:
    ldr r0, [r5]
    ldr r2, [r0]
    movs r1, #0xa0
    lsls r1, r1, #1
    adds r2, r2, r1
    add r1, sp, #0x18
    ldr r3, .L0802AE54 @ =0x00000339
    movs r4, #0
    str r3, [sp, #0x18]
    b .L0802AE6A
    .align 2, 0
.L0802AE54: .4byte 0x00000339
.L0802AE58:
    ldr r0, [r5]
    ldr r2, [r0]
    movs r1, #0xa0
    lsls r1, r1, #1
    adds r2, r2, r1
    add r1, sp, #0x20
    ldr r3, .L0802AE78 @ =0x0000033A
    movs r4, #0
    str r3, [sp, #0x20]
.L0802AE6A:
    str r4, [r1, #4]
    ldr r3, [r2]
.L0802AE6E:
    movs r2, #1
    bl _call_via_r3
    b .L0802AE98
    .align 2, 0
.L0802AE78: .4byte 0x0000033A
.L0802AE7C:
    ldr r0, [r5]
    ldr r2, [r0]
    movs r1, #0xa0
    lsls r1, r1, #1
    adds r2, r2, r1
    add r1, sp, #0x28
    ldr r3, .L0802AEA0 @ =0x0000033B
    movs r4, #0
    str r3, [sp, #0x28]
    str r4, [r1, #4]
    ldr r3, [r2]
    movs r2, #1
    bl _call_via_r3
.L0802AE98:
    add sp, #0x30
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L0802AEA0: .4byte 0x0000033B

    thumb_func_start func_0802AEA4
func_0802AEA4: @ 0x0802AEA4
    push {r4, r5, r6, lr}
    sub sp, #0x1c
    adds r4, r0, #0
    ldr r1, [r4]
    ldrh r6, [r4, #4]
    ldr r2, [r1]
    mov r0, sp
    ldr r3, [r2, #0x34]
    adds r2, r6, #0
    bl _call_via_r3
    mov r5, sp
    ldr r1, [r4, #0x14]
    add r0, sp, #0xc
    ldr r2, [r1, #0xc]
    adds r1, r4, #0
    bl _call_via_r2
    ldr r0, [sp, #0xc]
    ldr r1, [sp, #0x10]
    str r0, [sp, #0x14]
    str r1, [sp, #0x18]
    add r4, sp, #0x14
    mov r0, sp
    adds r1, r4, #0
    bl func_080AC070
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802AEE2
    b .L0802B03E
.L0802AEE2:
    adds r1, r6, #0
    subs r1, #0x34
    ldr r0, .L0802AF2C @ =0x000001FF
    cmp r1, r0
    bls .L0802AEEE
    b .L0802B048
.L0802AEEE:
    movs r1, #0
    ldrsh r0, [r4, r1]
    cmp r0, #0
    bge .L0802AEF8
    adds r0, #7
.L0802AEF8:
    asrs r6, r0, #3
    movs r1, #2
    ldrsh r0, [r4, r1]
    cmp r0, #0
    bge .L0802AF04
    adds r0, #7
.L0802AF04:
    asrs r0, r0, #3
    ldr r2, [sp]
    ldrh r3, [r5, #8]
    cmp r2, #0
    beq .L0802AF30
    cmp r6, r3
    bhi .L0802AF30
    ldrh r1, [r5, #0xa]
    cmp r0, r1
    bhi .L0802AF30
    ldr r1, [sp, #4]
    muls r0, r3, r0
    adds r0, r0, r6
    cmp r1, #0
    beq .L0802AF26
    adds r0, r1, r0
    ldrb r0, [r0]
.L0802AF26:
    lsls r0, r0, #2
    adds r0, r2, r0
    b .L0802AF32
    .align 2, 0
.L0802AF2C: .4byte 0x000001FF
.L0802AF30:
    movs r0, #0
.L0802AF32:
    cmp r0, #0
    beq .L0802AF42
    ldr r0, [r0]
    ldr r1, .L0802AF80 @ =0x0001FFFC
    ands r0, r1
    cmp r0, #0
    beq .L0802AF42
    b .L0802B03E
.L0802AF42:
    movs r1, #0
    ldrsh r0, [r4, r1]
    cmp r0, #0
    bge .L0802AF4C
    adds r0, #7
.L0802AF4C:
    asrs r6, r0, #3
    movs r0, #6
    ldrsh r1, [r4, r0]
    subs r0, r1, #1
    cmp r0, #0
    bge .L0802AF5A
    adds r0, r1, #6
.L0802AF5A:
    asrs r0, r0, #3
    ldr r2, [r5]
    cmp r2, #0
    beq .L0802AF84
    cmp r6, r3
    bhi .L0802AF84
    ldrh r1, [r5, #0xa]
    cmp r0, r1
    bhi .L0802AF84
    ldr r1, [r5, #4]
    muls r0, r3, r0
    adds r0, r0, r6
    cmp r1, #0
    beq .L0802AF7A
    adds r0, r1, r0
    ldrb r0, [r0]
.L0802AF7A:
    lsls r0, r0, #2
    adds r0, r2, r0
    b .L0802AF86
    .align 2, 0
.L0802AF80: .4byte 0x0001FFFC
.L0802AF84:
    movs r0, #0
.L0802AF86:
    cmp r0, #0
    beq .L0802AF94
    ldr r0, [r0]
    ldr r1, .L0802AFD0 @ =0x0001FFFC
    ands r0, r1
    cmp r0, #0
    bne .L0802B03E
.L0802AF94:
    movs r0, #4
    ldrsh r1, [r4, r0]
    subs r0, r1, #1
    cmp r0, #0
    bge .L0802AFA0
    adds r0, r1, #6
.L0802AFA0:
    asrs r6, r0, #3
    movs r1, #2
    ldrsh r0, [r4, r1]
    cmp r0, #0
    bge .L0802AFAC
    adds r0, #7
.L0802AFAC:
    asrs r0, r0, #3
    cmp r2, #0
    beq .L0802AFD4
    cmp r6, r3
    bhi .L0802AFD4
    ldrh r1, [r5, #0xa]
    cmp r0, r1
    bhi .L0802AFD4
    ldr r1, [r5, #4]
    muls r0, r3, r0
    adds r0, r0, r6
    cmp r1, #0
    beq .L0802AFCA
    adds r0, r1, r0
    ldrb r0, [r0]
.L0802AFCA:
    lsls r0, r0, #2
    adds r0, r2, r0
    b .L0802AFD6
    .align 2, 0
.L0802AFD0: .4byte 0x0001FFFC
.L0802AFD4:
    movs r0, #0
.L0802AFD6:
    cmp r0, #0
    beq .L0802AFE4
    ldr r0, [r0]
    ldr r1, .L0802B024 @ =0x0001FFFC
    ands r0, r1
    cmp r0, #0
    bne .L0802B03E
.L0802AFE4:
    movs r0, #4
    ldrsh r1, [r4, r0]
    subs r0, r1, #1
    cmp r0, #0
    bge .L0802AFF0
    adds r0, r1, #6
.L0802AFF0:
    asrs r6, r0, #3
    movs r0, #6
    ldrsh r1, [r4, r0]
    subs r0, r1, #1
    cmp r0, #0
    bge .L0802AFFE
    adds r0, r1, #6
.L0802AFFE:
    asrs r0, r0, #3
    adds r4, r2, #0
    cmp r4, #0
    beq .L0802B02E
    cmp r6, r3
    bhi .L0802B02E
    ldrh r1, [r5, #0xa]
    cmp r0, r1
    bhi .L0802B02E
    ldr r1, [r5, #4]
    muls r0, r3, r0
    adds r0, r0, r6
    cmp r1, #0
    beq .L0802B028
    adds r0, r1, r0
    ldrb r0, [r0]
    lsls r0, r0, #2
    adds r0, r4, r0
    b .L0802B030
    .align 2, 0
.L0802B024: .4byte 0x0001FFFC
.L0802B028:
    lsls r0, r0, #2
    adds r0, r2, r0
    b .L0802B030
.L0802B02E:
    movs r0, #0
.L0802B030:
    cmp r0, #0
    beq .L0802B048
    ldr r0, [r0]
    ldr r1, .L0802B044 @ =0x0001FFFC
    ands r0, r1
    cmp r0, #0
    beq .L0802B048
.L0802B03E:
    movs r0, #1
    b .L0802B04A
    .align 2, 0
.L0802B044: .4byte 0x0001FFFC
.L0802B048:
    movs r0, #0
.L0802B04A:
    add sp, #0x1c
    pop {r4, r5, r6}
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_0802B054
func_0802B054: @ 0x0802B054
    push {r4, r5, r6, r7, lr}
    sub sp, #0x28
    adds r5, r0, #0
    ldr r0, [r5, #0x34]
    ldr r1, .L0802B130 @ =0x00002E58
    adds r0, r0, r1
    bl func_0809DFAC
    lsls r0, r0, #0x18
    lsrs r0, r0, #0x18
    cmp r0, #9
    bne .L0802B0BA
    ldr r0, [r5, #0x34]
    ldr r1, .L0802B134 @ =0x00002189
    adds r0, r0, r1
    ldrb r0, [r0]
    movs r4, #0x30
    ands r4, r0
    cmp r4, #0
    bne .L0802B0BA
    ldr r0, [r5, #0x38]
    adds r0, #0x54
    bl func_0800F204
    cmp r0, #1
    bne .L0802B0BA
    ldr r0, [r5, #0x38]
    adds r0, #0x54
    bl func_0800F258
    mov r1, sp
    strb r0, [r1]
    mov r0, sp
    bl GetId__C7Article
    cmp r0, #0x25
    bne .L0802B0BA
    ldr r0, [r5]
    ldr r3, [r0]
    movs r1, #0xa0
    lsls r1, r1, #1
    adds r3, r3, r1
    add r1, sp, #4
    movs r2, #0xcc
    lsls r2, r2, #2
    str r2, [sp, #4]
    str r4, [r1, #4]
    ldr r3, [r3]
    movs r2, #0
    bl _call_via_r3
.L0802B0BA:
    ldr r0, [r5, #0x34]
    ldr r1, .L0802B130 @ =0x00002E58
    adds r0, r0, r1
    bl func_0809E02C
    lsls r0, r0, #0x18
    lsrs r0, r0, #0x18
    cmp r0, #9
    bne .L0802B118
    ldr r0, [r5, #0x34]
    ldr r1, .L0802B138 @ =0x0000218B
    adds r0, r0, r1
    ldrb r0, [r0]
    movs r4, #0x18
    ands r4, r0
    cmp r4, #0
    bne .L0802B118
    ldr r0, [r5, #0x38]
    adds r0, #0x54
    bl func_0800F204
    cmp r0, #1
    bne .L0802B118
    ldr r0, [r5, #0x38]
    adds r0, #0x54
    bl func_0800F258
    adds r1, r0, #0
    add r0, sp, #0xc
    strb r1, [r0]
    bl GetId__C7Article
    cmp r0, #0x26
    bne .L0802B118
    ldr r0, [r5]
    ldr r3, [r0]
    movs r1, #0xa0
    lsls r1, r1, #1
    adds r3, r3, r1
    add r1, sp, #0x10
    ldr r2, .L0802B13C @ =0x00000332
    str r2, [sp, #0x10]
    str r4, [r1, #4]
    ldr r3, [r3]
    movs r2, #0
    bl _call_via_r3
.L0802B118:
    ldr r0, [r5, #0x34]
    ldr r1, .L0802B140 @ =0x00002194
    adds r0, r0, r1
    ldrb r1, [r0]
    movs r0, #0xc0
    ands r0, r1
    cmp r0, #0
    bne .L0802B1BC
    movs r7, #1
    movs r6, #0
    ldr r4, .L0802B144 @ =gUnk_080F11BC
    b .L0802B14C
    .align 2, 0
.L0802B130: .4byte 0x00002E58
.L0802B134: .4byte 0x00002189
.L0802B138: .4byte 0x0000218B
.L0802B13C: .4byte 0x00000332
.L0802B140: .4byte 0x00002194
.L0802B144: .4byte gUnk_080F11BC
.L0802B148:
    adds r4, #4
    adds r6, #1
.L0802B14C:
    cmp r6, #8
    bhi .L0802B162
    ldr r0, [r5, #0x34]
    adds r0, #0x54
    ldr r1, [r4]
    bl IsDisplayEnabled__C11ShippingBini
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0802B148
    movs r7, #0
.L0802B162:
    cmp r7, #0
    beq .L0802B1BC
    ldr r0, [r5, #0x34]
    ldr r4, .L0802B1D4 @ =0x00002E58
    adds r0, r0, r4
    bl func_0809E184
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802B1BC
    ldr r0, [r5, #0x34]
    adds r0, r0, r4
    bl func_0809E194
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802B1BC
    ldr r0, [r5, #0x34]
    adds r0, r0, r4
    bl func_0809DFAC
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802B1BC
    ldr r0, [r5, #0x34]
    adds r0, r0, r4
    bl func_0809E1A4
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802B1BC
    ldr r0, [r5]
    ldr r2, [r0]
    movs r1, #0xa0
    lsls r1, r1, #1
    adds r2, r2, r1
    add r1, sp, #0x18
    ldr r3, .L0802B1D8 @ =0x0000034D
    movs r4, #0
    str r3, [sp, #0x18]
    str r4, [r1, #4]
    ldr r3, [r2]
    movs r2, #0
    bl _call_via_r3
.L0802B1BC:
    ldr r0, [r5, #0x34]
    ldr r1, .L0802B1DC @ =0x00002195
    adds r0, r0, r1
    ldrb r1, [r0]
    movs r0, #3
    ands r0, r1
    cmp r0, #0
    bne .L0802B250
    movs r7, #1
    movs r6, #0
    ldr r4, .L0802B1E0 @ =gUnk_080F11E0
    b .L0802B1E8
    .align 2, 0
.L0802B1D4: .4byte 0x00002E58
.L0802B1D8: .4byte 0x0000034D
.L0802B1DC: .4byte 0x00002195
.L0802B1E0: .4byte gUnk_080F11E0
.L0802B1E4:
    adds r4, #4
    adds r6, #1
.L0802B1E8:
    cmp r6, #0xd
    bhi .L0802B1FE
    ldr r0, [r5, #0x34]
    adds r0, #0x54
    ldr r1, [r4]
    bl IsDisplayEnabled__C11ShippingBini
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0802B1E4
    movs r7, #0
.L0802B1FE:
    cmp r7, #0
    beq .L0802B250
    ldr r0, [r5, #0x34]
    movs r1, #0xd2
    lsls r1, r1, #6
    adds r0, r0, r1
    bl func_0809C32C
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802B250
    ldr r0, [r5, #0x34]
    ldr r1, .L0802B258 @ =0x00002E58
    adds r0, r0, r1
    bl func_0809E174
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802B250
    ldr r0, [r5, #0x34]
    ldr r1, .L0802B258 @ =0x00002E58
    adds r0, r0, r1
    bl func_0809E02C
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802B250
    ldr r0, [r5]
    ldr r2, [r0]
    movs r1, #0xa0
    lsls r1, r1, #1
    adds r2, r2, r1
    add r1, sp, #0x20
    ldr r3, .L0802B25C @ =0x0000034E
    movs r4, #0
    str r3, [sp, #0x20]
    str r4, [r1, #4]
    ldr r3, [r2]
    movs r2, #0
    bl _call_via_r3
.L0802B250:
    add sp, #0x28
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L0802B258: .4byte 0x00002E58
.L0802B25C: .4byte 0x0000034E

    thumb_func_start func_0802B260
func_0802B260: @ 0x0802B260
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #0x6c
    mov sb, r0
    mov r8, r1
    ldr r3, .L0802B3A4 @ =gUnk_080F1218
    movs r0, #3
    str r0, [sp]
    movs r4, #1
    str r4, [sp, #4]
    movs r5, #0
    str r5, [sp, #8]
    str r4, [sp, #0xc]
    add r0, sp, #0x10
    strb r4, [r0]
    mov r0, sb
    movs r2, #6
    bl func_08032560
    ldr r0, .L0802B3A8 @ =vtable_unk_080E6708
    mov r1, sb
    str r0, [r1, #4]
    mov r2, r8
    ldr r0, [r2]
    ldr r1, [r0]
    ldr r1, [r1, #0x64]
    bl _call_via_r1
    adds r1, r0, #0
    mov r0, r8
    ldr r3, [r0]
    mov r0, sb
    adds r0, #0x8c
    movs r2, #2
    str r2, [sp]
    str r4, [sp, #4]
    add r4, sp, #8
    strb r5, [r4]
    movs r2, #0
    bl func_080A4A00
    mov r1, sb
    adds r1, #0xcc
    str r5, [r1]
    ldr r0, .L0802B3AC @ =0x00000281
    add r0, sb
    strb r5, [r0]
    movs r2, #0
    str r2, [sp, #0x5c]
    str r4, [sp, #0x68]
    mov r3, sp
    adds r3, #0x18
    str r3, [sp, #0x60]
    mov r4, sp
    adds r4, #0x58
    str r4, [sp, #0x64]
    add r0, sp, #0x14
    mov sl, r0
    movs r7, #0
    adds r6, r1, #0
.L0802B2DE:
    mov r1, r8
    ldr r0, [r1]
    ldr r1, [r0]
    ldr r1, [r1, #0x68]
    bl _call_via_r1
    adds r1, r0, #0
    mov r2, r8
    ldr r3, [r2]
    mov r4, sl
    strb r7, [r4]
    str r7, [sp]
    movs r0, #0x12
    str r0, [sp, #4]
    ldr r0, [sp, #0x68]
    strb r7, [r0]
    add r0, sp, #0x18
    movs r2, #0
    bl func_080A4A00
    ldr r1, [sp, #0x64]
    strh r7, [r1]
    strh r7, [r1, #2]
    ldr r1, [r6]
    cmp r1, #5
    bhi .L0802B374
    lsls r0, r1, #3
    adds r0, r0, r1
    lsls r0, r0, #3
    adds r0, #4
    adds r5, r6, r0
    cmp r5, #0
    beq .L0802B36E
    ldrb r0, [r4]
    strb r0, [r5]
    adds r4, r5, #4
    adds r0, r4, #0
    add r1, sp, #0x18
    bl func_080DC840
    ldr r0, .L0802B3B0 @ =vtable_unk_080E681C
    str r0, [r4, #0x24]
    adds r1, r5, #0
    adds r1, #0x2c
    add r0, sp, #0x40
    ldm r0!, {r2, r3, r4}
    stm r1!, {r2, r3, r4}
    ldm r0!, {r2, r3}
    stm r1!, {r2, r3}
    add r0, sp, #0x54
    ldrb r1, [r0]
    adds r0, r5, #0
    adds r0, #0x40
    strb r1, [r0]
    mov r0, sp
    adds r0, #0x55
    ldrb r0, [r0]
    adds r1, r5, #0
    adds r1, #0x41
    strb r0, [r1]
    mov r0, sp
    adds r0, #0x56
    ldrb r0, [r0]
    adds r1, #1
    strb r0, [r1]
    mov r0, sp
    adds r0, #0x57
    ldrb r0, [r0]
    adds r1, #1
    strb r0, [r1]
    ldr r0, [sp, #0x58]
    str r0, [r5, #0x44]
.L0802B36E:
    ldr r0, [r6]
    adds r0, #1
    str r0, [r6]
.L0802B374:
    ldr r0, [sp, #0x60]
    movs r1, #2
    bl func_080A47B4
    ldr r4, [sp, #0x5c]
    adds r4, #1
    str r4, [sp, #0x5c]
    cmp r4, #5
    bls .L0802B2DE
    movs r1, #0xa0
    lsls r1, r1, #2
    add r1, sb
    movs r0, #0
    strb r0, [r1]
    mov r0, sb
    add sp, #0x6c
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    .align 2, 0
.L0802B3A4: .4byte gUnk_080F1218
.L0802B3A8: .4byte vtable_unk_080E6708
.L0802B3AC: .4byte 0x00000281
.L0802B3B0: .4byte vtable_unk_080E681C

    thumb_func_start func_0802B3B4
func_0802B3B4: @ 0x0802B3B4
    push {r4, r5, r6, r7, lr}
    sub sp, #4
    adds r5, r0, #0
    bl func_0803260C
    ldr r4, [r5]
    adds r0, r5, #0
    adds r0, #0x44
    ldrb r3, [r0]
    adds r2, r4, #0
    adds r2, #0x7c
    ldrh r1, [r2]
    ldr r0, .L0802B40C @ =0x0000FFFF
    cmp r1, r0
    beq .L0802B3DA
    cmp r3, #0
    bne .L0802B3DA
    orrs r0, r1
    strh r0, [r2]
.L0802B3DA:
    adds r0, r4, #0
    adds r0, #0x88
    movs r1, #0
    ldrb r0, [r0]
    cmp r0, #1
    bne .L0802B3E8
    movs r1, #1
.L0802B3E8:
    cmp r1, #0
    beq .L0802B414
    adds r1, r5, #0
    adds r1, #0xcb
    ldrb r0, [r1]
    cmp r0, #0
    bne .L0802B410
    adds r0, r5, #0
    adds r0, #0xb4
    bl func_0805E8F0
    lsls r0, r0, #0x1e
    cmp r0, #0
    bge .L0802B414
    adds r1, r5, #0
    adds r1, #0xc8
    movs r0, #1
    b .L0802B412
    .align 2, 0
.L0802B40C: .4byte 0x0000FFFF
.L0802B410:
    movs r0, #0
.L0802B412:
    strb r0, [r1]
.L0802B414:
    movs r7, #0
    movs r2, #0
    adds r4, r5, #0
    adds r4, #0xfc
    ldr r0, .L0802B448 @ =0x00000113
    adds r6, r5, r0
    adds r5, #0xd0
.L0802B422:
    ldrb r0, [r5]
    cmp r0, #0
    beq .L0802B458
    ldrb r0, [r4, #0x17]
    cmp r0, #0
    bne .L0802B44C
    adds r0, r4, #0
    str r2, [sp]
    bl func_0805E8F0
    adds r1, r0, #0
    lsls r0, r1, #0x1e
    ldr r2, [sp]
    cmp r0, #0
    bge .L0802B444
    movs r0, #1
    strb r0, [r4, #0x14]
.L0802B444:
    adds r0, r1, #0
    b .L0802B450
    .align 2, 0
.L0802B448: .4byte 0x00000113
.L0802B44C:
    strb r2, [r6]
    movs r0, #2
.L0802B450:
    lsls r0, r0, #0x1d
    cmp r0, #0
    bge .L0802B458
    strb r2, [r5]
.L0802B458:
    adds r4, #0x48
    adds r6, #0x48
    adds r5, #0x48
    adds r7, #1
    cmp r7, #5
    bls .L0802B422
    add sp, #4
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0

    thumb_func_start func_0802B46C
func_0802B46C: @ 0x0802B46C
    push {r4, r5, r6, r7, lr}
    mov r7, r8
    push {r7}
    sub sp, #4
    mov r8, r0
    ldr r1, [r0]
    movs r0, #0xa0
    lsls r0, r0, #2
    add r0, r8
    ldrb r7, [r0]
    mov r4, r8
    adds r4, #0xcc
    lsls r0, r7, #3
    adds r0, r0, r7
    lsls r0, r0, #3
    adds r0, #4
    movs r3, #0xa
    ldrsh r2, [r1, r3]
    movs r5, #0xe
    ldrsh r3, [r1, r5]
    adds r1, #0x20
    ldrb r6, [r1]
    movs r1, #1
    adds r5, r7, #0
    ands r5, r1
    adds r4, r4, r0
    strb r1, [r4]
    mov r1, sp
    mov r0, sp
    strh r2, [r0]
    strh r3, [r1, #2]
    ldr r0, [sp]
    str r0, [r4, #0x44]
    cmp r6, #1
    beq .L0802B4C6
    cmp r6, #1
    ble .L0802B4BE
    cmp r6, #2
    beq .L0802B4D0
    cmp r6, #3
    beq .L0802B4DC
.L0802B4BE:
    movs r0, #0xca
    lsls r0, r0, #3
    adds r1, r5, r0
    b .L0802B4E0
.L0802B4C6:
    ldr r3, .L0802B4CC @ =0x00000652
    b .L0802B4DE
    .align 2, 0
.L0802B4CC: .4byte 0x00000652
.L0802B4D0:
    ldr r0, .L0802B4D8 @ =0x00000654
    adds r1, r5, r0
    b .L0802B4E0
    .align 2, 0
.L0802B4D8: .4byte 0x00000654
.L0802B4DC:
    ldr r3, .L0802B518 @ =0x00000656
.L0802B4DE:
    adds r1, r5, r3
.L0802B4E0:
    adds r0, r4, #0
    adds r0, #0x2c
    bl func_0805E860
    adds r0, r4, #0
    adds r0, #0x40
    movs r2, #0
    movs r1, #1
    strb r1, [r0]
    adds r0, #2
    strb r2, [r0]
    adds r0, #1
    strb r1, [r0]
    adds r0, r7, #1
    movs r1, #0
    cmp r0, #5
    bhi .L0802B504
    adds r1, r0, #0
.L0802B504:
    movs r0, #0xa0
    lsls r0, r0, #2
    add r0, r8
    strb r1, [r0]
    add sp, #4
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L0802B518: .4byte 0x00000656
.L0802B51C:
    .byte 0xF0, 0xB5, 0x57, 0x46
    .byte 0x4E, 0x46, 0x45, 0x46, 0xE0, 0xB4, 0x9E, 0xB0, 0x13, 0x90, 0x14, 0x91, 0x00, 0x68, 0x15, 0x90
    .byte 0x81, 0x88, 0x89, 0x46, 0x02, 0x68, 0x92, 0x46, 0x13, 0x98, 0x44, 0x30, 0x00, 0x78, 0x16, 0x90
    .byte 0x15, 0x9B, 0x9E, 0x68, 0x31, 0x14, 0xD8, 0x68, 0x07, 0x1C, 0x3A, 0x14, 0x0D, 0xAC, 0x14, 0x9D
    .byte 0x28, 0x68, 0xAB, 0x68, 0x0D, 0x90, 0x63, 0x60, 0x48, 0x46, 0x07, 0xF0, 0xD1, 0xF9, 0x80, 0x46
    .byte 0x13, 0x98, 0x8B, 0x30, 0x41, 0x46, 0x01, 0x70, 0x15, 0x9D, 0x88, 0x35, 0x00, 0x21, 0x28, 0x78
    .byte 0x01, 0x28, 0x00, 0xD1, 0x01, 0x21, 0x00, 0x29, 0x00, 0xD1, 0xA2, 0xE0, 0x15, 0x98, 0xA4, 0x30
    .byte 0x00, 0x78, 0x00, 0x28, 0x00, 0xD1, 0x9C, 0xE0, 0x68, 0x68, 0x30, 0x18, 0x00, 0x14, 0x14, 0x9A
    .byte 0x0C, 0x23, 0xD1, 0x5E, 0x40, 0x1A, 0x17, 0x90, 0xA8, 0x68, 0x3C, 0x18, 0x21, 0x14, 0x0E, 0x27
    .byte 0xD0, 0x5F, 0x0E, 0x1A, 0x80, 0x20, 0x00, 0x02, 0x40, 0x1A, 0x18, 0x90, 0x00, 0x21, 0x68, 0x78
    .byte 0x01, 0x28, 0x00, 0xD1, 0x01, 0x21, 0x00, 0x29, 0x0D, 0xD0, 0x51, 0x46, 0x08, 0x68, 0x81, 0x6D
    .byte 0x50, 0x46, 0xA8, 0xF0, 0xA5, 0xF9, 0x14, 0x9A, 0x91, 0x68, 0x00, 0x22, 0x00, 0x92, 0x17, 0x9A
    .byte 0x33, 0x1C, 0x0F, 0xF0, 0x41, 0xFC, 0x68, 0x69, 0x21, 0x1A, 0x09, 0x14, 0x14, 0x9B, 0x0E, 0x24
    .byte 0x1A, 0x5F, 0x89, 0x1A, 0x1D, 0x91, 0x02, 0x21, 0x00, 0x14, 0x0F, 0x28, 0x06, 0xDD, 0x4D, 0x46
    .byte 0x08, 0x2D, 0x02, 0xDC, 0x47, 0x46, 0x01, 0x2F, 0x00, 0xD1, 0x01, 0x21, 0x13, 0x9D, 0x8C, 0x35
    .byte 0x0D, 0xA8, 0x80, 0x46, 0x08, 0x1C, 0x84, 0x00, 0x04, 0x43, 0x01, 0x01, 0x0C, 0x43, 0x80, 0x01
    .byte 0x04, 0x43, 0x13, 0x98, 0xB4, 0x30, 0x01, 0x68, 0x0B, 0x68, 0x82, 0x89, 0x13, 0x98, 0xB8, 0x30
    .byte 0x92, 0x00, 0x00, 0x68, 0x80, 0x18, 0x02, 0x88, 0x05, 0xA8, 0x1B, 0x69, 0xA8, 0xF0, 0x74, 0xF9
    .byte 0x05, 0xAE, 0x0E, 0x9B, 0x2A, 0x68, 0x13, 0x98, 0x90, 0x30, 0x41, 0x68, 0x48, 0x42, 0x08, 0x43
    .byte 0x00, 0x28, 0x13, 0xDA, 0xA8, 0x89, 0x13, 0x99, 0x9C, 0x31, 0x18, 0x9F, 0x00, 0x97, 0x01, 0x96
    .byte 0x02, 0x92, 0x03, 0x90, 0x04, 0x91, 0x18, 0x1C, 0x17, 0x99, 0x1D, 0x9A, 0x23, 0x1C, 0x02, 0x4C
    .byte 0xA8, 0xF0, 0x5C, 0xF9, 0x03, 0xE0, 0x00, 0x00, 0xDC, 0x04, 0x00, 0x03, 0x00, 0x20, 0x00, 0x28
    .byte 0x27, 0xD0, 0x28, 0x1C, 0x3C, 0x30, 0x01, 0x78, 0x07, 0x1C, 0x00, 0x29, 0x21, 0xD0, 0x40, 0x46
    .byte 0x01, 0x68, 0x32, 0x1C, 0x08, 0x32, 0x28, 0x1C, 0x79, 0xF0, 0xC0, 0xF8, 0x28, 0x1C, 0x3D, 0x30
    .byte 0x00, 0x78, 0x00, 0x28, 0x06, 0xD0, 0x31, 0x1C, 0x10, 0x31, 0x28, 0x1C, 0x01, 0x22, 0x79, 0xF0
    .byte 0x51, 0xF9, 0x0C, 0xE0, 0x2C, 0x1C, 0x3E, 0x34, 0x20, 0x78, 0x00, 0x28, 0x07, 0xD1, 0x31, 0x1C
    .byte 0x10, 0x31, 0x28, 0x1C, 0x01, 0x22, 0x79, 0xF0, 0x45, 0xF9, 0x01, 0x20, 0x20, 0x70, 0x00, 0x20
    .byte 0x38, 0x70, 0x00, 0x21, 0x19, 0x91, 0x6A, 0x46, 0x34, 0x32, 0x1A, 0x92, 0x13, 0x9B, 0xE4, 0x33
    .byte 0x1B, 0x93, 0x13, 0x9D, 0xD8, 0x35, 0x13, 0x9C, 0xD4, 0x34, 0xA0, 0x46, 0x13, 0x9F, 0xD0, 0x37
    .byte 0x1C, 0x97, 0x14, 0x98, 0x0C, 0x22, 0x81, 0x5E, 0x0E, 0x23, 0xC2, 0x5E, 0x1C, 0x9C, 0x20, 0x78
    .byte 0x00, 0x28, 0x5B, 0xD0, 0x3C, 0x27, 0xE8, 0x5F, 0x40, 0x1A, 0x81, 0x46, 0x3E, 0x21, 0x68, 0x5E
    .byte 0x84, 0x1A, 0x46, 0x46, 0x69, 0x6A, 0x0B, 0x68, 0x2A, 0x8E, 0x92, 0x00, 0xA8, 0x6A, 0x80, 0x18
    .byte 0x02, 0x88, 0x05, 0xA8, 0x1B, 0x69, 0xA8, 0xF0, 0xFF, 0xF8, 0x05, 0xAF, 0x0E, 0x9B, 0x32, 0x68
    .byte 0x69, 0x68, 0x48, 0x42, 0x08, 0x43, 0x00, 0x28, 0x14, 0xDA, 0x28, 0x89, 0x80, 0x21, 0x09, 0x02
    .byte 0x00, 0x91, 0x39, 0x1C, 0x01, 0x91, 0x02, 0x92, 0x03, 0x90, 0x1B, 0x9A, 0x04, 0x92, 0x18, 0x1C
    .byte 0x49, 0x46, 0x22, 0x1C, 0xAA, 0x23, 0x02, 0x4C, 0xA8, 0xF0, 0xE8, 0xF8, 0x03, 0xE0, 0x00, 0x00
    .byte 0xDC, 0x04, 0x00, 0x03, 0x00, 0x20, 0x00, 0x28, 0x28, 0xD0, 0x30, 0x1C, 0x3C, 0x30, 0x01, 0x78
    .byte 0x81, 0x46, 0x00, 0x29, 0x22, 0xD0, 0x1A, 0x9B, 0x19, 0x68, 0x3A, 0x1C, 0x08, 0x32, 0x30, 0x1C
    .byte 0x79, 0xF0, 0x4C, 0xF8, 0x30, 0x1C, 0x3D, 0x30, 0x00, 0x78, 0x00, 0x28, 0x06, 0xD0, 0x39, 0x1C
    .byte 0x10, 0x31, 0x30, 0x1C, 0x01, 0x22, 0x79, 0xF0, 0xDD, 0xF8, 0x0C, 0xE0, 0x34, 0x1C, 0x3E, 0x34
    .byte 0x20, 0x78, 0x00, 0x28, 0x07, 0xD1, 0x39, 0x1C, 0x10, 0x31, 0x30, 0x1C, 0x01, 0x22, 0x79, 0xF0
    .byte 0xD1, 0xF8, 0x01, 0x20, 0x20, 0x70, 0x00, 0x20, 0x4C, 0x46, 0x20, 0x70, 0x1B, 0x9F, 0x48, 0x37
    .byte 0x1B, 0x97, 0x48, 0x35, 0x48, 0x20, 0x80, 0x44, 0x1C, 0x99, 0x48, 0x31, 0x1C, 0x91, 0x19, 0x9A
    .byte 0x01, 0x32, 0x19, 0x92, 0x05, 0x2A, 0x8C, 0xD9, 0x13, 0x98, 0x14, 0x99, 0x06, 0xF0, 0x60, 0xFF
    .byte 0x16, 0x9B, 0x00, 0x2B, 0x05, 0xD1, 0x13, 0x9C, 0x0D, 0x4D, 0x60, 0x19, 0x00, 0x78, 0x00, 0x28
    .byte 0x77, 0xD0, 0x15, 0x9F, 0xB8, 0x6B, 0xE2, 0xF7, 0x89, 0xFE, 0x4F, 0x28, 0x14, 0xD9, 0x51, 0x46
    .byte 0x08, 0x68, 0x82, 0x6C, 0x50, 0x46, 0x00, 0x21, 0xA8, 0xF0, 0x8C, 0xF8, 0x02, 0x1C, 0x53, 0x46
    .byte 0x18, 0x68, 0x04, 0x49, 0x44, 0x6D, 0x50, 0x46, 0x01, 0x23, 0xA8, 0xF0, 0x87, 0xF8, 0x30, 0xE0
    .byte 0x81, 0x02, 0x00, 0x00, 0x08, 0xBA, 0x58, 0x08, 0x13, 0x9C, 0x32, 0x4D, 0x60, 0x19, 0x00, 0x78
    .byte 0x00, 0x28, 0x26, 0xD0, 0x57, 0x46, 0x38, 0x68, 0x81, 0x6E, 0x50, 0x46, 0xA8, 0xF0, 0x70, 0xF8
    .byte 0x04, 0x1C, 0x15, 0x98, 0x42, 0x8C, 0x20, 0x30, 0x00, 0x78, 0x12, 0x18, 0x25, 0x68, 0x0F, 0xA8
    .byte 0xEB, 0x68, 0x21, 0x1C, 0xA8, 0xF0, 0x68, 0xF8, 0x0F, 0x98, 0x02, 0x88, 0x05, 0xA8, 0x2B, 0x69
    .byte 0x21, 0x1C, 0xA8, 0xF0, 0x61, 0xF8, 0x38, 0x68, 0x82, 0x6C, 0x50, 0x46, 0x00, 0x21, 0xA8, 0xF0
    .byte 0x59, 0xF8, 0x02, 0x1C, 0x38, 0x68, 0x09, 0x99, 0x44, 0x6D, 0x50, 0x46, 0x01, 0x23, 0xA8, 0xF0
    .byte 0x55, 0xF8, 0x15, 0x9D, 0x7C, 0x35, 0x29, 0x88, 0x1B, 0x48, 0x81, 0x42, 0x24, 0xD0, 0x51, 0x46
    .byte 0x08, 0x68, 0x41, 0x6E, 0x50, 0x46, 0xA8, 0xF0, 0x43, 0xF8, 0x04, 0x1C, 0x2A, 0x88, 0x25, 0x68
    .byte 0x11, 0xA8, 0xEB, 0x68, 0x21, 0x1C, 0xA8, 0xF0, 0x3F, 0xF8, 0x11, 0x98, 0x02, 0x88, 0x05, 0xA8
    .byte 0x2B, 0x69, 0x21, 0x1C, 0xA8, 0xF0, 0x38, 0xF8, 0x52, 0x46, 0x10, 0x68, 0x82, 0x6C, 0x50, 0x46
    .byte 0x02, 0x21, 0xA8, 0xF0, 0x2F, 0xF8, 0x02, 0x1C, 0x53, 0x46, 0x18, 0x68, 0x09, 0x99, 0x44, 0x6D
    .byte 0x50, 0x46, 0x01, 0x23, 0xA8, 0xF0, 0x2A, 0xF8, 0x13, 0x9C, 0x06, 0x4D, 0x61, 0x19, 0x00, 0x20
    .byte 0x08, 0x70, 0x1E, 0xB0, 0x38, 0xBC, 0x98, 0x46, 0xA1, 0x46, 0xAA, 0x46, 0xF0, 0xBC, 0x01, 0xBC
    .byte 0x00, 0x47, 0x00, 0x00, 0x81, 0x02, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00

    thumb_func_start func_0802B8EC
func_0802B8EC: @ 0x0802B8EC
    push {r4, r5, lr}
    adds r4, r0, #0
    adds r5, r1, #0
    movs r0, #0xc8
    bl __builtin_new
    adds r1, r4, #0
    adds r2, r5, #0
    bl func_08024974
    pop {r4, r5}
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_0802B908
func_0802B908: @ 0x0802B908
    push {r4, r5, lr}
    sub sp, #0xc
    adds r4, r0, #0
    adds r5, r1, #0
    ldr r0, .L0802B93C @ =0x00001BD8
    adds r1, r2, r0
    add r0, sp, #4
    bl func_0800E924
    movs r0, #0xc9
    lsls r0, r0, #1
    str r0, [sp]
    adds r0, r4, #0
    adds r1, r5, #0
    add r2, sp, #4
    movs r3, #2
    bl __12AActorEntityP10GameObjectRC13ActorLocationUiUi
    ldr r0, .L0802B940 @ =vtable_unk_080E676C
    str r0, [r4, #0x14]
    adds r0, r4, #0
    add sp, #0xc
    pop {r4, r5}
    pop {r1}
    bx r1
    .align 2, 0
.L0802B93C: .4byte 0x00001BD8
.L0802B940: .4byte vtable_unk_080E676C

    thumb_func_start func_0802B944
func_0802B944: @ 0x0802B944
    push {r4, r5, r6, lr}
    mov r6, sb
    mov r5, r8
    push {r5, r6}
    sub sp, #0x14
    adds r5, r0, #0
    mov sb, r1
    add r1, sp, #0xc
    movs r4, #0x8d
    lsls r4, r4, #2
    movs r0, #0
    mov r8, r0
    ldrh r2, [r1]
    ldr r3, .L0802B9B8 @ =0xFFFFFC00
    adds r0, r3, #0
    ands r0, r2
    orrs r0, r4
    strh r0, [r1]
    movs r6, #0
    ldrb r4, [r1, #1]
    movs r2, #3
    adds r0, r2, #0
    ands r0, r4
    strb r0, [r1, #1]
    ldrh r4, [r1, #2]
    adds r0, r3, #0
    ands r0, r4
    strh r0, [r1, #2]
    ldrb r0, [r1, #3]
    ands r2, r0
    strb r2, [r1, #3]
    ldrh r0, [r1, #4]
    ands r3, r0
    strh r3, [r1, #4]
    add r4, sp, #4
    adds r0, r4, #0
    movs r2, #6
    bl memcpy
    strb r6, [r4, #6]
    mov r0, r8
    str r0, [sp]
    adds r0, r5, #0
    mov r1, sb
    add r2, sp, #4
    movs r3, #2
    bl __12AActorEntityP10GameObjectRC13ActorLocationUiUi
    ldr r0, .L0802B9BC @ =vtable_unk_080E671C
    str r0, [r5, #0x14]
    adds r0, r5, #0
    add sp, #0x14
    pop {r3, r4}
    mov r8, r3
    mov sb, r4
    pop {r4, r5, r6}
    pop {r1}
    bx r1
    .align 2, 0
.L0802B9B8: .4byte 0xFFFFFC00
.L0802B9BC: .4byte vtable_unk_080E671C

    thumb_func_start func_0802B9C0
func_0802B9C0: @ 0x0802B9C0
    push {r4, lr}
    adds r4, r0, #0
    bl func_0802B944
    ldr r0, .L0802BA0C @ =vtable_unk_080E65F4
    str r0, [r4, #0x14]
    adds r0, r4, #0
    adds r0, #0x34
    movs r1, #0
    strb r1, [r0]
    adds r0, #1
    strb r1, [r0]
    adds r0, #3
    strb r1, [r0]
    strb r1, [r0, #1]
    str r1, [r0, #4]
    str r1, [r0, #8]
    str r1, [r0, #0xc]
    str r1, [r0, #0x10]
    str r1, [r0, #0x14]
    str r1, [r0, #0x18]
    adds r0, #0x1c
    strb r1, [r0]
    adds r0, #2
    movs r2, #0
    strh r1, [r0]
    adds r0, #2
    strb r2, [r0]
    adds r0, #1
    strb r2, [r0]
    adds r0, r4, #0
    bl vfunc_10__7AEntity
    adds r0, r4, #0
    pop {r4}
    pop {r1}
    bx r1
    .align 2, 0
.L0802BA0C: .4byte vtable_unk_080E65F4
.L0802BA10:
    .byte 0x10, 0xB5, 0x04, 0x1C, 0xD0, 0x20, 0xD4, 0xF7, 0xDD, 0xFD, 0x21, 0x1C, 0x00, 0xF0, 0x86, 0xFA
    .byte 0x10, 0xBC, 0x02, 0xBC, 0x08, 0x47, 0x00, 0x00, 0x30, 0xB5, 0x04, 0x1C, 0x0D, 0x1C, 0x21, 0x1C
    .byte 0x58, 0x31, 0x08, 0x78, 0x00, 0x28, 0x13, 0xD1, 0x20, 0x1C, 0x54, 0x30, 0x00, 0x78, 0x00, 0x28
    .byte 0x10, 0xD0, 0x20, 0x1C, 0x00, 0xF0, 0x16, 0xF8, 0x20, 0x1C, 0x00, 0xF0, 0xFD, 0xF8, 0x00, 0x04
    .byte 0x01, 0x0C, 0x60, 0x8C, 0x88, 0x42, 0x05, 0xD0, 0x20, 0x1C, 0x06, 0xF0, 0xA9, 0xFB, 0x01, 0xE0
    .byte 0x00, 0x20, 0x08, 0x70, 0x20, 0x1C, 0x29, 0x1C, 0x06, 0xF0, 0xE0, 0xFC, 0x30, 0xBC, 0x01, 0xBC
    .byte 0x00, 0x47, 0x00, 0x00

    thumb_func_start func_0802BA74
func_0802BA74: @ 0x0802BA74
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #8
    adds r7, r0, #0
    adds r0, #0x34
    ldrb r0, [r0]
    cmp r0, #4
    bls .L0802BA8C
    b .L0802BC38
.L0802BA8C:
    lsls r0, r0, #2
    ldr r1, .L0802BA98 @ =.L0802BA9C
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L0802BA98: .4byte .L0802BA9C
.L0802BA9C: @ jump table
    .4byte .L0802BAB0 @ case 0
    .4byte .L0802BABA @ case 1
    .4byte .L0802BBD0 @ case 2
    .4byte .L0802BBF0 @ case 3
    .4byte .L0802BC1C @ case 4
.L0802BAB0:
    adds r1, r7, #0
    adds r1, #0x54
    movs r0, #0
    strb r0, [r1]
    b .L0802BC38
.L0802BABA:
    adds r1, r7, #0
    adds r1, #0x38
    ldr r0, [r1, #4]
    ldr r2, [r1, #0xc]
    adds r0, r0, r2
    str r0, [r1, #4]
    ldr r0, [r1, #8]
    ldr r2, [r1, #0x10]
    adds r0, r0, r2
    str r0, [r1, #8]
    ldr r0, [r1, #0x18]
    ldr r2, .L0802BAE4 @ =0xFFFFB556
    adds r0, r0, r2
    str r0, [r1, #0x18]
    ldr r2, [r1, #0x14]
    adds r2, r2, r0
    mov sl, r1
    cmp r2, #0
    ble .L0802BAE8
    str r2, [r1, #0x14]
    b .L0802BAF0
    .align 2, 0
.L0802BAE4: .4byte 0xFFFFB556
.L0802BAE8:
    movs r0, #0
    mov r3, sl
    str r0, [r3, #0x14]
    str r0, [r3, #0x18]
.L0802BAF0:
    movs r1, #0
    ldrh r0, [r7, #0x24]
    cmp r0, #0
    bne .L0802BAFA
    movs r1, #1
.L0802BAFA:
    cmp r1, #0
    bne .L0802BB00
    b .L0802BC38
.L0802BB00:
    adds r0, r7, #0
    adds r0, #0x34
    movs r1, #0
    strb r1, [r0]
    movs r0, #0xa
    ldrsh r3, [r7, r0]
    movs r2, #0xe
    ldrsh r1, [r7, r2]
    mov ip, r1
    adds r0, r7, #0
    adds r0, #0x20
    ldrb r0, [r0]
    cmp r0, #1
    beq .L0802BB36
    cmp r0, #1
    bgt .L0802BB26
    cmp r0, #0
    beq .L0802BB30
    b .L0802BB44
.L0802BB26:
    cmp r0, #2
    beq .L0802BB3E
    cmp r0, #3
    beq .L0802BB42
    b .L0802BB44
.L0802BB30:
    movs r0, #0x14
    add ip, r0
    b .L0802BB44
.L0802BB36:
    movs r1, #0x14
    rsbs r1, r1, #0
    add ip, r1
    b .L0802BB44
.L0802BB3E:
    subs r3, #0x14
    b .L0802BB44
.L0802BB42:
    adds r3, #0x14
.L0802BB44:
    ldrh r1, [r7, #4]
    mov r5, sp
    ldr r2, .L0802BBC8 @ =0x000003FF
    mov r8, r2
    mov r0, r8
    ands r1, r0
    ldrh r2, [r5]
    ldr r4, .L0802BBCC @ =0xFFFFFC00
    adds r0, r4, #0
    ands r0, r2
    orrs r0, r1
    strh r0, [r5]
    lsls r3, r3, #0x10
    lsrs r1, r3, #0x10
    movs r2, #0x3f
    mov sb, r2
    ands r1, r2
    lsls r1, r1, #2
    ldrb r6, [r5, #1]
    movs r2, #3
    adds r0, r2, #0
    ands r0, r6
    orrs r0, r1
    strb r0, [r5, #1]
    lsrs r3, r3, #0x16
    mov r0, r8
    ands r3, r0
    ldrh r1, [r5, #2]
    adds r0, r4, #0
    ands r0, r1
    orrs r0, r3
    strh r0, [r5, #2]
    mov r3, ip
    lsls r1, r3, #0x10
    lsrs r0, r1, #0x10
    mov r3, sb
    ands r0, r3
    lsls r0, r0, #2
    ldrb r3, [r5, #3]
    ands r2, r3
    orrs r2, r0
    strb r2, [r5, #3]
    lsrs r1, r1, #0x16
    mov r0, r8
    ands r1, r0
    ldrh r0, [r5, #4]
    ands r4, r0
    orrs r4, r1
    strh r4, [r5, #4]
    ldr r0, [r7]
    ldr r1, [r0]
    adds r1, #0xbc
    adds r2, r7, #0
    adds r2, #0x56
    ldrh r2, [r2]
    ldr r3, [r1]
    mov r1, sp
    bl _call_via_r3
    movs r1, #0
    mov r2, sl
    strb r1, [r2]
    adds r0, r7, #0
    adds r0, #0x59
    strb r1, [r0]
    b .L0802BC38
    .align 2, 0
.L0802BBC8: .4byte 0x000003FF
.L0802BBCC: .4byte 0xFFFFFC00
.L0802BBD0:
    movs r1, #0
    ldrh r0, [r7, #0x24]
    cmp r0, #0
    bne .L0802BBDA
    movs r1, #1
.L0802BBDA:
    cmp r1, #0
    beq .L0802BC38
    adds r0, r7, #0
    adds r0, #0x34
    movs r1, #0
    strb r1, [r0]
    adds r0, #4
    strb r1, [r0]
    adds r0, #0x21
    strb r1, [r0]
    b .L0802BC38
.L0802BBF0:
    movs r1, #0
    ldrh r0, [r7, #0x24]
    cmp r0, #0
    bne .L0802BBFA
    movs r1, #1
.L0802BBFA:
    cmp r1, #0
    beq .L0802BC38
    adds r0, r7, #0
    adds r0, #0x38
    movs r1, #0
    movs r2, #0xa8
    lsls r2, r2, #0xd
    str r1, [r0, #4]
    str r1, [r0, #8]
    str r2, [r0, #0x14]
    subs r0, #4
    strb r1, [r0]
    adds r1, r7, #0
    adds r1, #0x59
    movs r0, #1
    strb r0, [r1]
    b .L0802BC38
.L0802BC1C:
    adds r1, r7, #0
    adds r1, #0x35
    ldrb r0, [r1]
    subs r0, #1
    strb r0, [r1]
    lsls r0, r0, #0x18
    lsrs r2, r0, #0x18
    cmp r2, #0
    bne .L0802BC38
    adds r0, r7, #0
    adds r0, #0x34
    strb r2, [r0]
    adds r0, #4
    strb r2, [r0]
.L0802BC38:
    add sp, #8
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0

    thumb_func_start func_0802BC48
func_0802BC48: @ 0x0802BC48
    push {lr}
    adds r2, r0, #0
    movs r1, #0xc9
    lsls r1, r1, #1
    adds r0, #0x34
    ldrb r0, [r0]
    cmp r0, #4
    bhi .L0802BC9C
    lsls r0, r0, #2
    ldr r1, .L0802BC64 @ =.L0802BC68
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L0802BC64: .4byte .L0802BC68
.L0802BC68: @ jump table
    .4byte .L0802BC7C @ case 0
    .4byte .L0802BC8E @ case 1
    .4byte .L0802BC8E @ case 2
    .4byte .L0802BC94 @ case 3
    .4byte .L0802BC9A @ case 4
.L0802BC7C:
    adds r0, r2, #0
    adds r0, #0x59
    ldrb r0, [r0]
    movs r1, #0xa9
    lsls r1, r1, #1
    cmp r0, #0
    bne .L0802BC9C
    adds r1, #0x40
    b .L0802BC9C
.L0802BC8E:
    movs r1, #0xcf
    lsls r1, r1, #1
    b .L0802BC9C
.L0802BC94:
    movs r1, #0xa3
    lsls r1, r1, #1
    b .L0802BC9C
.L0802BC9A:
    movs r1, #0x42
.L0802BC9C:
    adds r0, r1, #0
    pop {r1}
    bx r1
    .align 2, 0
.L0802BCA4:
    .byte 0xF0, 0xB5, 0x47, 0x46, 0x80, 0xB4, 0x81, 0xB0, 0x06, 0x1C, 0x0B, 0x1C
    .byte 0x38, 0x30, 0x00, 0x27, 0x01, 0x21, 0x88, 0x46, 0x41, 0x46, 0x01, 0x70, 0x47, 0x70, 0x23, 0x49
    .byte 0x88, 0x22, 0x52, 0x03, 0x41, 0x60, 0x87, 0x60, 0x42, 0x61, 0x35, 0x69, 0x00, 0x2D, 0x1F, 0xD0
    .byte 0x68, 0x46, 0x19, 0x1C, 0xE1, 0xF7, 0x2A, 0xFF, 0x68, 0x46, 0xE1, 0xF7, 0x41, 0xFF, 0x04, 0x1C
    .byte 0x24, 0x04, 0x24, 0x0C, 0x28, 0x68, 0x00, 0x68, 0x01, 0x68, 0x49, 0x6E, 0xA7, 0xF0, 0x10, 0xFE
    .byte 0x01, 0x1C, 0x28, 0x1C, 0xB4, 0x30, 0x22, 0x1C, 0x32, 0xF0, 0xAA, 0xFD, 0x28, 0x1C, 0xC8, 0x30
    .byte 0x41, 0x46, 0x01, 0x70, 0x02, 0x30, 0x07, 0x70, 0x01, 0x30, 0x01, 0x70, 0x01, 0x30, 0x04, 0x80
    .byte 0x31, 0x1C, 0x34, 0x31, 0x04, 0x20, 0x08, 0x70, 0x01, 0x31, 0x14, 0x20, 0x08, 0x70, 0x30, 0x1C
    .byte 0x58, 0x30, 0x41, 0x46, 0x01, 0x70, 0x30, 0x1C, 0xFF, 0xF7, 0x8E, 0xFF, 0x01, 0x1C, 0x09, 0x04
    .byte 0x09, 0x0C, 0x30, 0x1C, 0x06, 0xF0, 0x3C, 0xFA, 0x30, 0x1C, 0x54, 0x30, 0x41, 0x46, 0x01, 0x70
    .byte 0x01, 0xB0, 0x08, 0xBC, 0x98, 0x46, 0xF0, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0xF8, 0xFF
    .byte 0xF0, 0xB5, 0x4F, 0x46, 0x46, 0x46, 0xC0, 0xB4, 0x05, 0x1C, 0x09, 0x04, 0x0E, 0x0C, 0xB1, 0x46
    .byte 0x12, 0x06, 0x13, 0x0E, 0x56, 0x30, 0x00, 0x21, 0x88, 0x46, 0x00, 0x22, 0x06, 0x80, 0x1E, 0x38
    .byte 0x01, 0x27, 0x07, 0x70, 0x41, 0x46, 0x41, 0x70, 0xA8, 0x21, 0x49, 0x03, 0x42, 0x60, 0x82, 0x60
    .byte 0x41, 0x61, 0x2C, 0x69, 0x00, 0x2C, 0x20, 0xD0, 0x00, 0x2B, 0x0A, 0xD1, 0x20, 0x68, 0x00, 0x68
    .byte 0x01, 0x68, 0x49, 0x6E, 0xA7, 0xF0, 0xBC, 0xFD, 0x01, 0x1C, 0x20, 0x1C, 0xB4, 0x30, 0x32, 0x1C
    .byte 0x09, 0xE0, 0x20, 0x68, 0x00, 0x68, 0x01, 0x68, 0x89, 0x6E, 0xA7, 0xF0, 0xB1, 0xFD, 0x01, 0x1C
    .byte 0x20, 0x1C, 0xB4, 0x30, 0x4A, 0x46, 0x32, 0xF0, 0x4B, 0xFD, 0x20, 0x1C, 0xC8, 0x30, 0x07, 0x70
    .byte 0x02, 0x30, 0x41, 0x46, 0x01, 0x70, 0x01, 0x30, 0x07, 0x70, 0x28, 0x1C, 0x34, 0x30, 0x00, 0x24
    .byte 0x03, 0x21, 0x01, 0x70, 0x14, 0x38, 0x03, 0x78, 0x01, 0x2B, 0x1C, 0xD0, 0x01, 0x2B, 0x02, 0xDC
    .byte 0x00, 0x2B, 0x21, 0xD0, 0x29, 0xE0, 0x02, 0x2B, 0x02, 0xD0, 0x03, 0x2B, 0x0A, 0xD0, 0x24, 0xE0
    .byte 0x28, 0x1C, 0x38, 0x30, 0x02, 0x49, 0xC0, 0x22, 0x12, 0x03, 0x41, 0x60, 0x84, 0x60, 0x1B, 0xE0
    .byte 0x00, 0x00, 0xF6, 0xFF, 0x28, 0x1C, 0x38, 0x30, 0xA0, 0x21, 0x09, 0x03, 0xC0, 0x22, 0x12, 0x03
    .byte 0x41, 0x60, 0x84, 0x60, 0x10, 0xE0, 0x28, 0x1C, 0x38, 0x30, 0x02, 0x49, 0xC0, 0x22, 0x12, 0x03
    .byte 0x44, 0x60, 0x08, 0xE0, 0x00, 0x00, 0xF6, 0xFF, 0x28, 0x1C, 0x38, 0x30, 0xA0, 0x21, 0x09, 0x03
    .byte 0xC0, 0x22, 0x12, 0x03, 0x43, 0x60, 0x81, 0x60, 0x42, 0x61, 0x28, 0x1C, 0x58, 0x30, 0x01, 0x24
    .byte 0x04, 0x70, 0x28, 0x1C, 0xFF, 0xF7, 0x00, 0xFF, 0x01, 0x1C, 0x09, 0x04, 0x09, 0x0C, 0x28, 0x1C
    .byte 0x06, 0xF0, 0xAE, 0xF9, 0x28, 0x1C, 0x54, 0x30, 0x04, 0x70, 0x18, 0xBC, 0x98, 0x46, 0xA1, 0x46
    .byte 0xF0, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00

    thumb_func_start func_0802BE68
func_0802BE68: @ 0x0802BE68
    push {r4, r5, lr}
    adds r5, r0, #0
    adds r0, #0x20
    ldrb r2, [r0]
    cmp r2, #1
    beq .L0802BEB0
    cmp r2, #1
    bgt .L0802BE7E
    cmp r2, #0
    beq .L0802BEC0
    b .L0802BECC
.L0802BE7E:
    cmp r2, #2
    beq .L0802BE88
    cmp r2, #3
    beq .L0802BE9C
    b .L0802BECC
.L0802BE88:
    adds r0, r5, #0
    adds r0, #0x38
    ldr r1, .L0802BE98 @ =0xFFFE5556
    movs r2, #0
    str r1, [r0, #0xc]
    str r2, [r0, #0x10]
    b .L0802BECA
    .align 2, 0
.L0802BE98: .4byte 0xFFFE5556
.L0802BE9C:
    adds r0, r5, #0
    adds r0, #0x38
    ldr r1, .L0802BEAC @ =0x0001AAAA
    movs r2, #0
    str r1, [r0, #0xc]
    str r2, [r0, #0x10]
    b .L0802BECA
    .align 2, 0
.L0802BEAC: .4byte 0x0001AAAA
.L0802BEB0:
    adds r0, r5, #0
    adds r0, #0x38
    movs r2, #0
    ldr r1, .L0802BEBC @ =0xFFFE5556
    b .L0802BEC6
    .align 2, 0
.L0802BEBC: .4byte 0xFFFE5556
.L0802BEC0:
    adds r0, r5, #0
    adds r0, #0x38
    ldr r1, .L0802BEF8 @ =0x0001AAAA
.L0802BEC6:
    str r2, [r0, #0xc]
    str r1, [r0, #0x10]
.L0802BECA:
    str r2, [r0, #0x18]
.L0802BECC:
    adds r0, r5, #0
    adds r0, #0x34
    movs r4, #1
    strb r4, [r0]
    adds r0, #0x24
    strb r4, [r0]
    adds r0, r5, #0
    bl func_0802BC48
    adds r1, r0, #0
    lsls r1, r1, #0x10
    lsrs r1, r1, #0x10
    adds r0, r5, #0
    bl SetAnim__12AActorEntityUi
    adds r0, r5, #0
    adds r0, #0x54
    strb r4, [r0]
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L0802BEF8: .4byte 0x0001AAAA

    thumb_func_start func_0802BEFC
func_0802BEFC: @ 0x0802BEFC
    push {r4, r5, lr}
    adds r4, r0, #0
    adds r1, r4, #0
    adds r1, #0x34
    movs r0, #2
    strb r0, [r1]
    adds r0, r4, #0
    adds r0, #0x58
    movs r5, #1
    strb r5, [r0]
    adds r0, r4, #0
    bl func_0802BC48
    adds r1, r0, #0
    lsls r1, r1, #0x10
    lsrs r1, r1, #0x10
    adds r0, r4, #0
    bl SetAnim__12AActorEntityUi
    adds r4, #0x54
    strb r5, [r4]
    pop {r4, r5}
    pop {r0}
    bx r0

    thumb_func_start func_0802BF2C
func_0802BF2C: @ 0x0802BF2C
    push {r4, r5, r6, lr}
    mov r6, r8
    push {r6}
    sub sp, #0x14
    mov r8, r0
    adds r4, r1, #0
    ldr r3, .L0802BF94 @ =gUnk_080F1224
    movs r0, #3
    str r0, [sp]
    movs r5, #1
    str r5, [sp, #4]
    movs r6, #0
    str r6, [sp, #8]
    str r6, [sp, #0xc]
    add r0, sp, #0x10
    strb r5, [r0]
    mov r0, r8
    movs r2, #6
    bl func_08032560
    ldr r0, .L0802BF98 @ =vtable_unk_080E6644
    mov r1, r8
    str r0, [r1, #4]
    ldr r0, [r4]
    ldr r1, [r0]
    ldr r1, [r1, #0x64]
    bl _call_via_r1
    adds r1, r0, #0
    ldr r3, [r4]
    mov r0, r8
    adds r0, #0x8c
    movs r2, #2
    str r2, [sp]
    str r5, [sp, #4]
    add r2, sp, #8
    strb r6, [r2]
    movs r2, #0
    bl func_080A4A00
    mov r1, r8
    adds r1, #0xcc
    ldr r0, .L0802BF9C @ =0x0000FFFF
    strh r0, [r1]
    mov r0, r8
    add sp, #0x14
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6}
    pop {r1}
    bx r1
    .align 2, 0
.L0802BF94: .4byte gUnk_080F1224
.L0802BF98: .4byte vtable_unk_080E6644
.L0802BF9C: .4byte 0x0000FFFF

    thumb_func_start func_0802BFA0
func_0802BFA0: @ 0x0802BFA0
    push {r4, lr}
    adds r4, r0, #0
    bl func_0803260C
    ldr r0, [r4]
    adds r0, #0x38
    movs r1, #0
    ldrb r0, [r0]
    cmp r0, #1
    bne .L0802BFB6
    movs r1, #1
.L0802BFB6:
    cmp r1, #0
    beq .L0802BFDE
    adds r1, r4, #0
    adds r1, #0xcb
    ldrb r0, [r1]
    cmp r0, #0
    bne .L0802BFDA
    adds r0, r4, #0
    adds r0, #0xb4
    bl func_0805E8F0
    lsls r0, r0, #0x1e
    cmp r0, #0
    bge .L0802BFDE
    adds r1, r4, #0
    adds r1, #0xc8
    movs r0, #1
    b .L0802BFDC
.L0802BFDA:
    movs r0, #0
.L0802BFDC:
    strb r0, [r1]
.L0802BFDE:
    pop {r4}
    pop {r0}
    bx r0

    thumb_func_start func_0802BFE4
func_0802BFE4: @ 0x0802BFE4
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #0x6c
    adds r6, r0, #0
    mov r8, r1
    ldr r4, [r6]
    ldrh r0, [r4, #4]
    str r0, [sp, #0x44]
    ldr r1, [r4]
    mov sb, r1
    adds r0, r6, #0
    adds r0, #0x44
    ldrb r0, [r0]
    str r0, [sp, #0x48]
    ldr r2, [r4, #8]
    str r2, [sp, #0x68]
    asrs r1, r2, #0x10
    ldr r0, [r4, #0xc]
    str r0, [sp, #0x4c]
    asrs r2, r0, #0x10
    add r5, sp, #0x34
    mov r3, r8
    ldr r0, [r3]
    ldr r3, [r3, #8]
    str r0, [sp, #0x34]
    str r3, [r5, #4]
    ldr r0, [sp, #0x44]
    bl func_08032900
    str r0, [sp, #0x50]
    adds r0, r6, #0
    adds r0, #0x8b
    add r7, sp, #0x50
    ldrb r7, [r7]
    strb r7, [r0]
    adds r4, #0x38
    mov sl, r4
    movs r1, #0
    ldrb r0, [r4]
    cmp r0, #1
    bne .L0802C03E
    movs r1, #1
.L0802C03E:
    cmp r1, #0
    bne .L0802C044
    b .L0802C18C
.L0802C044:
    mov r1, sl
    ldr r0, [r1, #4]
    ldr r2, [sp, #0x68]
    adds r0, r2, r0
    asrs r0, r0, #0x10
    mov r3, r8
    movs r7, #0xc
    ldrsh r1, [r3, r7]
    subs r0, r0, r1
    str r0, [sp, #0x54]
    mov r1, sl
    ldr r0, [r1, #8]
    ldr r2, [sp, #0x4c]
    adds r4, r2, r0
    asrs r1, r4, #0x10
    movs r7, #0xe
    ldrsh r0, [r3, r7]
    subs r7, r1, r0
    movs r0, #0x80
    lsls r0, r0, #8
    subs r0, r0, r1
    str r0, [sp, #0x58]
    movs r1, #0
    mov r2, sl
    ldrb r0, [r2, #1]
    cmp r0, #1
    bne .L0802C07C
    movs r1, #1
.L0802C07C:
    cmp r1, #0
    beq .L0802C09C
    mov r3, sb
    ldr r0, [r3]
    ldr r1, [r0, #0x58]
    mov r0, sb
    bl _call_via_r1
    mov r2, r8
    ldr r1, [r2, #8]
    movs r2, #0
    str r2, [sp]
    ldr r2, [sp, #0x54]
    adds r3, r7, #0
    bl func_0803AE58
.L0802C09C:
    mov r3, sl
    ldr r0, [r3, #0x14]
    subs r0, r4, r0
    asrs r0, r0, #0x10
    mov r7, r8
    movs r2, #0xe
    ldrsh r1, [r7, r2]
    subs r0, r0, r1
    str r0, [sp, #0x5c]
    ldr r3, [sp, #0x44]
    cmp r3, #8
    bgt .L0802C0C0
    movs r0, #1
    ldr r7, [sp, #0x50]
    cmp r7, #1
    beq .L0802C0C2
    movs r0, #2
    b .L0802C0C2
.L0802C0C0:
    movs r0, #1
.L0802C0C2:
    adds r5, r6, #0
    adds r5, #0x8c
    mov r1, sp
    adds r1, #0x34
    str r1, [sp, #0x60]
    lsls r4, r0, #2
    orrs r4, r0
    lsls r1, r0, #4
    orrs r4, r1
    lsls r0, r0, #6
    orrs r4, r0
    adds r0, r6, #0
    adds r0, #0xb4
    ldr r1, [r0]
    ldr r3, [r1]
    ldrh r2, [r0, #0xc]
    adds r0, #4
    lsls r2, r2, #2
    ldr r0, [r0]
    adds r0, r0, r2
    ldrh r2, [r0]
    add r0, sp, #0x14
    ldr r3, [r3, #0x10]
    bl _call_via_r3
    add r7, sp, #0x14
    ldr r2, [sp, #0x60]
    ldr r2, [r2, #4]
    mov ip, r2
    ldr r2, [r5]
    adds r0, r6, #0
    adds r0, #0x90
    ldr r1, [r0, #4]
    rsbs r0, r1, #0
    orrs r0, r1
    cmp r0, #0
    bge .L0802C134
    ldrh r0, [r5, #0xc]
    adds r1, r6, #0
    adds r1, #0x9c
    ldr r3, [sp, #0x58]
    str r3, [sp]
    adds r3, r7, #0
    str r3, [sp, #4]
    str r2, [sp, #8]
    str r0, [sp, #0xc]
    str r1, [sp, #0x10]
    mov r0, ip
    ldr r1, [sp, #0x54]
    ldr r2, [sp, #0x5c]
    adds r3, r4, #0
    ldr r4, .L0802C130 @ =func_030004DC
    bl _call_via_r4
    b .L0802C136
    .align 2, 0
.L0802C130: .4byte func_030004DC
.L0802C134:
    movs r0, #0
.L0802C136:
    cmp r0, #0
    beq .L0802C18C
    adds r0, r5, #0
    adds r0, #0x3c
    ldrb r1, [r0]
    str r0, [sp, #0x64]
    cmp r1, #0
    beq .L0802C18C
    ldr r0, [sp, #0x60]
    ldr r1, [r0]
    adds r2, r7, #0
    adds r2, #8
    adds r0, r5, #0
    bl func_080A480C
    adds r0, r5, #0
    adds r0, #0x3d
    ldrb r0, [r0]
    cmp r0, #0
    beq .L0802C16C
    adds r1, r7, #0
    adds r1, #0x10
    adds r0, r5, #0
    movs r2, #1
    bl func_080A4944
    b .L0802C186
.L0802C16C:
    adds r4, r5, #0
    adds r4, #0x3e
    ldrb r0, [r4]
    cmp r0, #0
    bne .L0802C186
    adds r1, r7, #0
    adds r1, #0x10
    adds r0, r5, #0
    movs r2, #1
    bl func_080A4944
    movs r0, #1
    strb r0, [r4]
.L0802C186:
    movs r0, #0
    ldr r1, [sp, #0x64]
    strb r0, [r1]
.L0802C18C:
    adds r0, r6, #0
    mov r1, r8
    bl func_08032690
    ldr r2, [sp, #0x48]
    cmp r2, #0
    beq .L0802C1FC
    movs r1, #0
    mov r3, sl
    ldrb r0, [r3]
    cmp r0, #1
    bne .L0802C1A6
    movs r1, #1
.L0802C1A6:
    cmp r1, #0
    bne .L0802C1FC
    adds r5, r6, #0
    adds r5, #0xcc
    ldrh r1, [r5]
    ldr r0, .L0802C20C @ =0x0000FFFF
    cmp r1, r0
    beq .L0802C1FC
    mov r7, sb
    ldr r0, [r7]
    ldr r1, [r0, #0x64]
    mov r0, sb
    bl _call_via_r1
    adds r4, r0, #0
    ldrh r2, [r5]
    ldr r5, [r4]
    add r0, sp, #0x3c
    ldr r3, [r5, #0xc]
    adds r1, r4, #0
    bl _call_via_r3
    ldr r0, [sp, #0x3c]
    ldrh r2, [r0]
    add r0, sp, #0x14
    ldr r3, [r5, #0x10]
    adds r1, r4, #0
    bl _call_via_r3
    ldr r0, [r7]
    ldr r2, [r0, #0x48]
    mov r0, sb
    movs r1, #2
    bl _call_via_r2
    adds r2, r0, #0
    ldr r0, [r7]
    ldr r1, [sp, #0x24]
    ldr r4, [r0, #0x54]
    mov r0, sb
    movs r3, #1
    bl _call_via_r4
.L0802C1FC:
    add sp, #0x6c
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L0802C20C: .4byte 0x0000FFFF

    thumb_func_start func_0802C210
func_0802C210: @ 0x0802C210
    push {r4, lr}
    adds r4, r0, #0
    movs r0, #0x5c
    bl __builtin_new
    adds r1, r4, #0
    bl func_0802B9C0
    pop {r4}
    pop {r1}
    bx r1
    .align 2, 0
.L0802C228:
    .byte 0x30, 0xB5, 0x05, 0x1C, 0x0C, 0x1C, 0x28, 0x68
    .byte 0x00, 0x68, 0x01, 0x68, 0x49, 0x6E, 0xA7, 0xF0, 0x6B, 0xFB, 0x01, 0x1C, 0x28, 0x1C, 0xB4, 0x30
    .byte 0x22, 0x1C, 0x32, 0xF0, 0x05, 0xFB, 0x28, 0x1C, 0xC8, 0x30, 0x00, 0x22, 0x01, 0x21, 0x01, 0x70
    .byte 0x02, 0x30, 0x02, 0x70, 0x01, 0x30, 0x01, 0x70, 0x01, 0x30, 0x04, 0x80, 0x30, 0xBC, 0x01, 0xBC
    .byte 0x00, 0x47, 0x00, 0x00, 0x30, 0xB5, 0x05, 0x1C, 0x0C, 0x1C, 0x28, 0x68, 0x00, 0x68, 0x01, 0x68
    .byte 0x89, 0x6E, 0xA7, 0xF0, 0x4D, 0xFB, 0x01, 0x1C, 0x28, 0x1C, 0xB4, 0x30, 0x22, 0x1C, 0x32, 0xF0
    .byte 0xE7, 0xFA, 0x28, 0x1C, 0xC8, 0x30, 0x00, 0x22, 0x01, 0x21, 0x01, 0x70, 0x02, 0x30, 0x02, 0x70
    .byte 0x01, 0x30, 0x01, 0x70, 0x30, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0x30, 0xB5, 0x05, 0x1C
    .byte 0x0C, 0x1C, 0x28, 0x68, 0x00, 0x68, 0x01, 0x68, 0x49, 0x6E, 0xA7, 0xF0, 0x31, 0xFB, 0x01, 0x1C
    .byte 0x28, 0x1C, 0xB4, 0x30, 0x22, 0x1C, 0x32, 0xF0, 0xCB, 0xFA, 0x28, 0x1C, 0xC8, 0x30, 0x00, 0x22
    .byte 0x01, 0x21, 0x01, 0x70, 0x02, 0x30, 0x02, 0x70, 0x01, 0x30, 0x01, 0x70, 0x30, 0xBC, 0x01, 0xBC
    .byte 0x00, 0x47, 0x00, 0x00, 0x54, 0x30, 0x00, 0x78, 0x70, 0x47, 0x00, 0x00

    thumb_func_start func_0802C2DC
func_0802C2DC: @ 0x0802C2DC
    bx lr
    .align 2, 0

    thumb_func_start func_0802C2E0
func_0802C2E0: @ 0x0802C2E0
    push {r4, r5, r6, r7, lr}
    mov r7, r8
    push {r7}
    mov r8, r0
    mov r1, r8
    adds r1, #0x3c
    movs r0, #9
    strb r0, [r1]
    movs r5, #0
    mov r0, r8
    adds r0, #0x3f
    ldrb r0, [r0]
    cmp r0, #0xd
    bls .L0802C2FE
    b .L0802C840
.L0802C2FE:
    lsls r0, r0, #2
    ldr r1, .L0802C308 @ =.L0802C30C
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L0802C308: .4byte .L0802C30C
.L0802C30C: @ jump table
    .4byte .L0802C3BC @ case 0
    .4byte .L0802C3BC @ case 1
    .4byte .L0802C440 @ case 2
    .4byte .L0802C3BC @ case 3
    .4byte .L0802C3BC @ case 4
    .4byte .L0802C344 @ case 5
    .4byte .L0802C4E4 @ case 6
    .4byte .L0802C554 @ case 7
    .4byte .L0802C5A4 @ case 8
    .4byte .L0802C5EE @ case 9
    .4byte .L0802C682 @ case 10
    .4byte .L0802C6D4 @ case 11
    .4byte .L0802C76A @ case 12
    .4byte .L0802C7B0 @ case 13
.L0802C344:
    mov r0, r8
    movs r1, #0xa2
    movs r2, #1
    bl func_0802A4C0
    mov r2, r8
    adds r2, #0x88
    movs r4, #0
    movs r0, #0x80
    lsls r0, r0, #0xd
    str r4, [r2, #4]
    str r4, [r2, #8]
    str r0, [r2, #0x14]
    mov r0, r8
    adds r0, #0x20
    ldrb r3, [r0]
    cmp r3, #1
    beq .L0802C39C
    cmp r3, #1
    bgt .L0802C372
    cmp r3, #0
    beq .L0802C3B0
    b .L0802C3BC
.L0802C372:
    cmp r3, #2
    beq .L0802C37C
    cmp r3, #3
    beq .L0802C38C
    b .L0802C3BC
.L0802C37C:
    ldr r0, .L0802C388 @ =0xFFFE4925
    movs r1, #0xa0
    lsls r1, r1, #0xa
    str r0, [r2, #0xc]
    str r4, [r2, #0x10]
    b .L0802C3BA
    .align 2, 0
.L0802C388: .4byte 0xFFFE4925
.L0802C38C:
    ldr r0, .L0802C398 @ =0x0001B6DB
    movs r1, #0xa0
    lsls r1, r1, #0xa
    str r0, [r2, #0xc]
    str r4, [r2, #0x10]
    b .L0802C3BA
    .align 2, 0
.L0802C398: .4byte 0x0001B6DB
.L0802C39C:
    ldr r0, .L0802C3A8 @ =0xFFFE4925
    movs r1, #0xa0
    lsls r1, r1, #0xa
    str r4, [r2, #0xc]
    b .L0802C3B8
    .align 2, 0
.L0802C3A8: .4byte 0xFFFE4925
.L0802C3AC:
    ldr r2, [r6]
    b .L0802C40C
.L0802C3B0:
    ldr r0, .L0802C434 @ =0x0001B6DB
    movs r1, #0xa0
    lsls r1, r1, #0xa
    str r3, [r2, #0xc]
.L0802C3B8:
    str r0, [r2, #0x10]
.L0802C3BA:
    str r1, [r2, #0x18]
.L0802C3BC:
    ldr r2, .L0802C438 @ =gUnk_080F1020
    mov r5, r8
    adds r5, #0x40
    mov r4, r8
    adds r4, #0x3f
    ldrb r1, [r4]
    lsls r0, r1, #3
    subs r0, r0, r1
    ldrb r1, [r5]
    adds r0, r0, r1
    lsls r0, r0, #3
    adds r0, r0, r2
    ldrh r1, [r0]
    mov r0, r8
    adds r0, #0x44
    strh r1, [r0]
    mov r2, r8
    ldr r0, [r2]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r6, [r0]
    ldr r7, [r0, #4]
    cmp r6, r7
    beq .L0802C408
.L0802C3F6:
    ldr r0, [r6]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802C3AC
    adds r6, #4
    cmp r6, r7
    bne .L0802C3F6
.L0802C408:
    subs r0, r7, #4
    ldr r2, [r0]
.L0802C40C:
    ldr r6, .L0802C438 @ =gUnk_080F1020
    ldrb r1, [r4]
    lsls r0, r1, #3
    subs r0, r0, r1
    ldrb r1, [r5]
    adds r0, r0, r1
    lsls r0, r0, #3
    adds r0, r0, r6
    ldrh r1, [r0, #2]
    adds r0, r2, #0
    bl func_08008B6C
    mov r0, r8
    bl func_08025944
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802C4B4
    b .L0802C4CC
    .align 2, 0
.L0802C434: .4byte 0x0001B6DB
.L0802C438: .4byte gUnk_080F1020
.L0802C43C:
    ldr r2, [r6]
    b .L0802C490
.L0802C440:
    ldr r2, .L0802C4C8 @ =gUnk_080F1020
    mov r5, r8
    adds r5, #0x40
    mov r4, r8
    adds r4, #0x3f
    ldrb r1, [r4]
    lsls r0, r1, #3
    subs r0, r0, r1
    ldrb r1, [r5]
    adds r0, r0, r1
    lsls r0, r0, #3
    adds r0, r0, r2
    ldrh r1, [r0]
    mov r0, r8
    adds r0, #0x44
    strh r1, [r0]
    mov r2, r8
    ldr r0, [r2]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r6, [r0]
    ldr r7, [r0, #4]
    cmp r6, r7
    beq .L0802C48C
.L0802C47A:
    ldr r0, [r6]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802C43C
    adds r6, #4
    cmp r6, r7
    bne .L0802C47A
.L0802C48C:
    subs r0, r7, #4
    ldr r2, [r0]
.L0802C490:
    ldr r6, .L0802C4C8 @ =gUnk_080F1020
    ldrb r1, [r4]
    lsls r0, r1, #3
    subs r0, r0, r1
    ldrb r1, [r5]
    adds r0, r0, r1
    lsls r0, r0, #3
    adds r0, r0, r6
    ldrh r1, [r0, #2]
    adds r0, r2, #0
    bl func_08008B6C
    mov r0, r8
    bl func_08025944
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0802C4CC
.L0802C4B4:
    ldrb r1, [r4]
    lsls r0, r1, #3
    subs r0, r0, r1
    ldrb r5, [r5]
    adds r0, r0, r5
    lsls r0, r0, #3
    adds r0, r0, r6
    movs r5, #4
    ldrsb r5, [r0, r5]
    b .L0802C840
    .align 2, 0
.L0802C4C8: .4byte gUnk_080F1020
.L0802C4CC:
    ldrb r1, [r4]
    lsls r0, r1, #3
    subs r0, r0, r1
    ldrb r5, [r5]
    adds r0, r0, r5
    lsls r0, r0, #3
    adds r0, r0, r6
    movs r5, #5
    ldrsb r5, [r0, r5]
    b .L0802C840
.L0802C4E0:
    ldr r0, [r4]
    b .L0802C522
.L0802C4E4:
    mov r1, r8
    adds r1, #0x44
    movs r0, #0xd7
    lsls r0, r0, #1
    strh r0, [r1]
    mov r2, r8
    ldr r0, [r2]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    mov r6, r8
    adds r6, #0xb2
    cmp r4, r5
    beq .L0802C51E
.L0802C50C:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802C4E0
    adds r4, #4
    cmp r4, r5
    bne .L0802C50C
.L0802C51E:
    subs r0, r5, #4
    ldr r0, [r0]
.L0802C522:
    movs r1, #0x9d
    bl func_08008B6C
    ldr r0, .L0802C54C @ =gUnk_080F1184
.L0802C52A:
    ldr r1, [r0]
    ldr r2, [r0, #4]
    mov r0, r8
    bl func_0802AC2C
    ldrb r3, [r6]
    movs r1, #0
    adds r0, r3, #0
    subs r0, #0x2b
    cmp r0, #0x1a
    bhi .L0802C542
    movs r1, #1
.L0802C542:
    cmp r1, #0
    beq .L0802C548
    b .L0802C812
.L0802C548:
    b .L0802C828
    .align 2, 0
.L0802C54C: .4byte gUnk_080F1184
.L0802C550:
    ldr r0, [r4]
    b .L0802C592
.L0802C554:
    mov r1, r8
    adds r1, #0x44
    movs r0, #0xdf
    lsls r0, r0, #1
    strh r0, [r1]
    mov r2, r8
    ldr r0, [r2]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    mov r6, r8
    adds r6, #0xb2
    cmp r4, r5
    beq .L0802C58E
.L0802C57C:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802C550
    adds r4, #4
    cmp r4, r5
    bne .L0802C57C
.L0802C58E:
    subs r0, r5, #4
    ldr r0, [r0]
.L0802C592:
    movs r1, #0x9d
    bl func_08008B6C
    ldr r0, .L0802C59C @ =gUnk_080F118C
    b .L0802C52A
    .align 2, 0
.L0802C59C: .4byte gUnk_080F118C
.L0802C5A0:
    ldr r0, [r4]
    b .L0802C5DE
.L0802C5A4:
    mov r1, r8
    adds r1, #0x44
    movs r0, #0xdd
    lsls r0, r0, #1
    strh r0, [r1]
    mov r2, r8
    ldr r0, [r2]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    beq .L0802C5DA
.L0802C5C8:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802C5A0
    adds r4, #4
    cmp r4, r5
    bne .L0802C5C8
.L0802C5DA:
    subs r0, r5, #4
    ldr r0, [r0]
.L0802C5DE:
    movs r1, #0x94
    bl func_08008B6C
.L0802C5E4:
    movs r5, #2
    rsbs r5, r5, #0
    b .L0802C840
.L0802C5EA:
    ldr r0, [r4]
    b .L0802C62C
.L0802C5EE:
    mov r1, r8
    adds r1, #0x44
    movs r0, #0xd5
    lsls r0, r0, #1
    strh r0, [r1]
    mov r1, r8
    ldr r0, [r1]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    mov r6, r8
    adds r6, #0xb2
    cmp r4, r5
    beq .L0802C628
.L0802C616:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802C5EA
    adds r4, #4
    cmp r4, r5
    bne .L0802C616
.L0802C628:
    subs r0, r5, #4
    ldr r0, [r0]
.L0802C62C:
    movs r1, #0x93
    bl func_08008B6C
    ldr r0, .L0802C664 @ =gUnk_080F1194
    ldr r1, [r0]
    ldr r2, [r0, #4]
    mov r0, r8
    bl func_0802AC2C
    ldrb r3, [r6]
    movs r1, #0
    adds r0, r3, #0
    subs r0, #0x2b
    cmp r0, #0x1a
    bhi .L0802C64C
    movs r1, #1
.L0802C64C:
    cmp r1, #0
    beq .L0802C668
    mov r1, r8
    ldr r0, [r1]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    adds r1, r3, #0
    bl _call_via_r2
    adds r1, r0, #0
    b .L0802C66A
    .align 2, 0
.L0802C664: .4byte gUnk_080F1194
.L0802C668:
    movs r1, #0
.L0802C66A:
    cmp r1, #0
    beq .L0802C5E4
    ldr r0, [r1, #0x14]
    adds r0, #0x88
    ldr r2, [r0]
    adds r0, r1, #0
    movs r1, #0x3c
    bl _call_via_r2
    b .L0802C5E4
.L0802C67E:
    ldr r0, [r4]
    b .L0802C6C0
.L0802C682:
    mov r1, r8
    adds r1, #0x44
    movs r0, #0xdb
    lsls r0, r0, #1
    strh r0, [r1]
    mov r2, r8
    ldr r0, [r2]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    mov r6, r8
    adds r6, #0xb2
    cmp r4, r5
    beq .L0802C6BC
.L0802C6AA:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802C67E
    adds r4, #4
    cmp r4, r5
    bne .L0802C6AA
.L0802C6BC:
    subs r0, r5, #4
    ldr r0, [r0]
.L0802C6C0:
    movs r1, #0x9f
    bl func_08008B6C
    ldr r0, .L0802C6CC @ =gUnk_080F119C
    b .L0802C52A
    .align 2, 0
.L0802C6CC: .4byte gUnk_080F119C
.L0802C6D0:
    ldr r0, [r4]
    b .L0802C712
.L0802C6D4:
    mov r1, r8
    adds r1, #0x44
    movs r0, #0xd9
    lsls r0, r0, #1
    strh r0, [r1]
    mov r2, r8
    ldr r0, [r2]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    mov r6, r8
    adds r6, #0xb2
    cmp r4, r5
    beq .L0802C70E
.L0802C6FC:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802C6D0
    adds r4, #4
    cmp r4, r5
    bne .L0802C6FC
.L0802C70E:
    subs r0, r5, #4
    ldr r0, [r0]
.L0802C712:
    movs r1, #0xa0
    bl func_08008B6C
    ldr r0, .L0802C748 @ =gUnk_080F11A4
    ldr r1, [r0]
    ldr r2, [r0, #4]
    mov r0, r8
    bl func_0802AC2C
    ldrb r3, [r6]
    movs r1, #0
    adds r0, r3, #0
    subs r0, #0x2b
    cmp r0, #0x1a
    bhi .L0802C732
    movs r1, #1
.L0802C732:
    cmp r1, #0
    beq .L0802C74C
    mov r1, r8
    ldr r0, [r1]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    adds r1, r3, #0
    bl _call_via_r2
    adds r1, r0, #0
    b .L0802C74E
    .align 2, 0
.L0802C748: .4byte gUnk_080F11A4
.L0802C74C:
    movs r1, #0
.L0802C74E:
    cmp r1, #0
    beq .L0802C760
    ldr r0, [r1, #0x14]
    adds r0, #0x88
    ldr r2, [r0]
    adds r0, r1, #0
    movs r1, #0x3c
    bl _call_via_r2
.L0802C760:
    movs r5, #8
    rsbs r5, r5, #0
    b .L0802C840
.L0802C766:
    ldr r0, [r4]
    b .L0802C7A4
.L0802C76A:
    mov r1, r8
    adds r1, #0x44
    movs r0, #0xd3
    lsls r0, r0, #1
    strh r0, [r1]
    mov r2, r8
    ldr r0, [r2]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    beq .L0802C7A0
.L0802C78E:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802C766
    adds r4, #4
    cmp r4, r5
    bne .L0802C78E
.L0802C7A0:
    subs r0, r5, #4
    ldr r0, [r0]
.L0802C7A4:
    movs r1, #0x9e
    bl func_08008B6C
    b .L0802C83C
.L0802C7AC:
    ldr r0, [r4]
    b .L0802C7EE
.L0802C7B0:
    mov r1, r8
    adds r1, #0x44
    movs r0, #0xd1
    lsls r0, r0, #1
    strh r0, [r1]
    mov r1, r8
    ldr r0, [r1]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    mov r6, r8
    adds r6, #0xb2
    cmp r4, r5
    beq .L0802C7EA
.L0802C7D8:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802C7AC
    adds r4, #4
    cmp r4, r5
    bne .L0802C7D8
.L0802C7EA:
    subs r0, r5, #4
    ldr r0, [r0]
.L0802C7EE:
    movs r1, #0x9d
    bl func_08008B6C
    ldr r0, .L0802C824 @ =gUnk_080F11AC
    ldr r1, [r0]
    ldr r2, [r0, #4]
    mov r0, r8
    bl func_0802AC2C
    ldrb r3, [r6]
    movs r1, #0
    adds r0, r3, #0
    subs r0, #0x2b
    cmp r0, #0x1a
    bhi .L0802C80E
    movs r1, #1
.L0802C80E:
    cmp r1, #0
    beq .L0802C828
.L0802C812:
    mov r1, r8
    ldr r0, [r1]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    adds r1, r3, #0
    bl _call_via_r2
    adds r1, r0, #0
    b .L0802C82A
    .align 2, 0
.L0802C824: .4byte gUnk_080F11AC
.L0802C828:
    movs r1, #0
.L0802C82A:
    cmp r1, #0
    beq .L0802C83C
    ldr r0, [r1, #0x14]
    adds r0, #0x88
    ldr r2, [r0]
    adds r0, r1, #0
    movs r1, #0x3c
    bl _call_via_r2
.L0802C83C:
    movs r5, #4
    rsbs r5, r5, #0
.L0802C840:
    mov r2, r8
    ldr r4, [r2, #0x14]
    mov r0, r8
    bl func_08025B10
    adds r2, r0, #0
    ldr r3, [r4, #0x64]
    mov r0, r8
    adds r1, r5, #0
    bl _call_via_r3
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0

    thumb_func_start func_0802C860
func_0802C860: @ 0x0802C860
    push {r4, r5, r6, lr}
    sub sp, #4
    adds r6, r0, #0
    adds r1, r6, #0
    adds r1, #0x3c
    movs r0, #0xa
    strb r0, [r1]
    adds r1, #1
    movs r0, #0x14
    strb r0, [r1]
    adds r0, r6, #0
    bl func_0802A510
    ldr r0, [r6]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    beq .L0802C8A4
.L0802C892:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802C8E8
    adds r4, #4
    cmp r4, r5
    bne .L0802C892
.L0802C8A4:
    subs r0, r5, #4
    ldr r0, [r0]
.L0802C8A8:
    movs r1, #0xbc
    bl func_08008B6C
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    mov r1, sp
    strb r0, [r1]
    mov r0, sp
    bl GetId__C4Tool
    cmp r0, #0x4d
    bne .L0802C8EC
    ldr r4, [r6, #0x14]
    movs r5, #2
    rsbs r5, r5, #0
    adds r0, r6, #0
    bl func_08025B10
    adds r2, r0, #0
    ldr r3, [r4, #0x64]
    adds r0, r6, #0
    adds r1, r5, #0
    bl _call_via_r3
    b .L0802C900
.L0802C8E8:
    ldr r0, [r4]
    b .L0802C8A8
.L0802C8EC:
    ldr r4, [r6, #0x14]
    adds r0, r6, #0
    bl func_08025B10
    adds r2, r0, #0
    ldr r3, [r4, #0x64]
    adds r0, r6, #0
    movs r1, #0
    bl _call_via_r3
.L0802C900:
    add sp, #4
    pop {r4, r5, r6}
    pop {r0}
    bx r0

    thumb_func_start func_0802C908
func_0802C908: @ 0x0802C908
    push {r4, r5, lr}
    adds r4, r0, #0
    adds r3, r4, #0
    adds r3, #0x41
    ldrb r0, [r3]
    cmp r0, #0
    beq .L0802C97E
    adds r2, r4, #0
    adds r2, #0x40
    ldrb r1, [r2]
    subs r0, #1
    cmp r1, r0
    bge .L0802C97E
    adds r1, r4, #0
    adds r1, #0x42
    ldrb r0, [r1]
    adds r0, #1
    strb r0, [r1]
    lsls r0, r0, #0x18
    lsrs r0, r0, #0x18
    cmp r0, #0x14
    bne .L0802C97E
    movs r0, #0
    strb r0, [r1]
    ldrb r0, [r2]
    adds r0, #1
    strb r0, [r2]
    lsls r0, r0, #0x18
    lsrs r0, r0, #0x18
    cmp r0, #5
    bne .L0802C97E
    ldr r0, [r4]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    beq .L0802C974
.L0802C95E:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0802C96E
    ldr r0, [r4]
    b .L0802C978
.L0802C96E:
    adds r4, #4
    cmp r4, r5
    bne .L0802C95E
.L0802C974:
    subs r0, r5, #4
    ldr r0, [r0]
.L0802C978:
    movs r1, #0xb8
    bl func_08008B6C
.L0802C97E:
    pop {r4, r5}
    pop {r0}
    bx r0

    thumb_func_start func_0802C984
func_0802C984: @ 0x0802C984
    push {r4, r5, r6, r7, lr}
    sub sp, #0x10
    adds r6, r0, #0
    adds r0, #0x40
    movs r1, #0
    strb r1, [r0]
    adds r0, #2
    strb r1, [r0]
    ldr r0, [r6, #0x38]
    adds r0, #0x5c
    bl IsEmpty__C9ToolStack
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802C9AA
    adds r1, r6, #0
    adds r1, #0x3f
    movs r0, #0xf
    b .L0802CDC2
.L0802C9AA:
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    add r0, sp, #0xc
    strb r1, [r0]
    bl GetId__C4Tool
    cmp r0, #0x50
    bls .L0802C9CC
    b .L0802CC8A
.L0802C9CC:
    lsls r0, r0, #2
    ldr r1, .L0802C9D8 @ =.L0802C9DC
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L0802C9D8: .4byte .L0802C9DC
.L0802C9DC: @ jump table
    .4byte .L0802CB20 @ case 0
    .4byte .L0802CB20 @ case 1
    .4byte .L0802CB20 @ case 2
    .4byte .L0802CB20 @ case 3
    .4byte .L0802CB20 @ case 4
    .4byte .L0802CB20 @ case 5
    .4byte .L0802CB20 @ case 6
    .4byte .L0802CB20 @ case 7
    .4byte .L0802CB28 @ case 8
    .4byte .L0802CB28 @ case 9
    .4byte .L0802CB28 @ case 10
    .4byte .L0802CB28 @ case 11
    .4byte .L0802CB28 @ case 12
    .4byte .L0802CB28 @ case 13
    .4byte .L0802CB28 @ case 14
    .4byte .L0802CB28 @ case 15
    .4byte .L0802CB30 @ case 16
    .4byte .L0802CB30 @ case 17
    .4byte .L0802CB30 @ case 18
    .4byte .L0802CB30 @ case 19
    .4byte .L0802CB30 @ case 20
    .4byte .L0802CB30 @ case 21
    .4byte .L0802CB30 @ case 22
    .4byte .L0802CB30 @ case 23
    .4byte .L0802CB38 @ case 24
    .4byte .L0802CB38 @ case 25
    .4byte .L0802CB38 @ case 26
    .4byte .L0802CB38 @ case 27
    .4byte .L0802CB38 @ case 28
    .4byte .L0802CB38 @ case 29
    .4byte .L0802CB38 @ case 30
    .4byte .L0802CB38 @ case 31
    .4byte .L0802CB40 @ case 32
    .4byte .L0802CB40 @ case 33
    .4byte .L0802CB40 @ case 34
    .4byte .L0802CB40 @ case 35
    .4byte .L0802CB40 @ case 36
    .4byte .L0802CB40 @ case 37
    .4byte .L0802CB40 @ case 38
    .4byte .L0802CB40 @ case 39
    .4byte .L0802CC3A @ case 40
    .4byte .L0802CC3A @ case 41
    .4byte .L0802CC3A @ case 42
    .4byte .L0802CC3A @ case 43
    .4byte .L0802CC3A @ case 44
    .4byte .L0802CC3A @ case 45
    .4byte .L0802CC3A @ case 46
    .4byte .L0802CC3A @ case 47
    .4byte .L0802CC42 @ case 48
    .4byte .L0802CC4A @ case 49
    .4byte .L0802CC52 @ case 50
    .4byte .L0802CC52 @ case 51
    .4byte .L0802CC52 @ case 52
    .4byte .L0802CC52 @ case 53
    .4byte .L0802CC52 @ case 54
    .4byte .L0802CC52 @ case 55
    .4byte .L0802CC52 @ case 56
    .4byte .L0802CC52 @ case 57
    .4byte .L0802CC52 @ case 58
    .4byte .L0802CC52 @ case 59
    .4byte .L0802CC52 @ case 60
    .4byte .L0802CC52 @ case 61
    .4byte .L0802CC52 @ case 62
    .4byte .L0802CC52 @ case 63
    .4byte .L0802CC52 @ case 64
    .4byte .L0802CC52 @ case 65
    .4byte .L0802CC52 @ case 66
    .4byte .L0802CC52 @ case 67
    .4byte .L0802CC52 @ case 68
    .4byte .L0802CC52 @ case 69
    .4byte .L0802CC5A @ case 70
    .4byte .L0802CC62 @ case 71
    .4byte .L0802CC6A @ case 72
    .4byte .L0802CC72 @ case 73
    .4byte .L0802CC7A @ case 74
    .4byte .L0802CC82 @ case 75
    .4byte .L0802CC82 @ case 76
    .4byte .L0802CC82 @ case 77
    .4byte .L0802CC82 @ case 78
    .4byte .L0802CC82 @ case 79
    .4byte .L0802CC82 @ case 80
.L0802CB20:
    adds r1, r6, #0
    adds r1, #0x3f
    movs r0, #0
    b .L0802CC90
.L0802CB28:
    adds r1, r6, #0
    adds r1, #0x3f
    movs r0, #3
    b .L0802CC90
.L0802CB30:
    adds r1, r6, #0
    adds r1, #0x3f
    movs r0, #1
    b .L0802CC90
.L0802CB38:
    adds r1, r6, #0
    adds r1, #0x3f
    movs r0, #4
    b .L0802CC90
.L0802CB40:
    movs r0, #0xa
    ldrsh r5, [r6, r0]
    movs r1, #0xe
    ldrsh r4, [r6, r1]
    adds r0, r6, #0
    adds r0, #0x20
    ldrb r0, [r0]
    adds r1, r0, #0
    cmp r0, #1
    beq .L0802CB68
    cmp r0, #1
    bgt .L0802CB5E
    cmp r0, #0
    beq .L0802CB6C
    b .L0802CB76
.L0802CB5E:
    cmp r1, #2
    beq .L0802CB70
    cmp r1, #3
    beq .L0802CB74
    b .L0802CB76
.L0802CB68:
    subs r4, #0x10
    b .L0802CB76
.L0802CB6C:
    adds r4, #0x10
    b .L0802CB76
.L0802CB70:
    subs r5, #0x10
    b .L0802CB76
.L0802CB74:
    adds r5, #0x10
.L0802CB76:
    ldrh r2, [r6, #4]
    ldr r7, [r6]
    ldr r1, [r7]
    mov r0, sp
    ldr r3, [r1, #0x34]
    adds r1, r7, #0
    bl _call_via_r3
    mov r1, sp
    asrs r5, r5, #3
    asrs r3, r4, #3
    ldr r2, [sp]
    ldrh r0, [r1, #8]
    cmp r2, #0
    beq .L0802CBB6
    cmp r5, r0
    bhi .L0802CBB6
    ldrh r1, [r1, #0xa]
    cmp r3, r1
    bhi .L0802CBB6
    ldr r1, [sp, #4]
    muls r0, r3, r0
    adds r0, r0, r5
    cmp r1, #0
    beq .L0802CBAC
    adds r0, r1, r0
    ldrb r0, [r0]
.L0802CBAC:
    lsls r0, r0, #2
    adds r0, r2, r0
    b .L0802CBB8
.L0802CBB2:
    ldr r0, [r4]
    b .L0802CC18
.L0802CBB6:
    movs r0, #0
.L0802CBB8:
    cmp r0, #0
    beq .L0802CC20
    ldr r0, [r0]
    lsls r0, r0, #0x1e
    cmp r0, #0
    bge .L0802CC20
    adds r1, r6, #0
    adds r1, #0x3c
    movs r0, #0x1b
    strb r0, [r1]
    adds r1, #3
    movs r0, #0xf
    strb r0, [r1]
    ldr r4, [r6, #0x14]
    movs r5, #2
    rsbs r5, r5, #0
    adds r0, r6, #0
    bl func_08025B10
    adds r2, r0, #0
    ldr r3, [r4, #0x64]
    adds r0, r6, #0
    adds r1, r5, #0
    bl _call_via_r3
    ldr r0, [r7]
    movs r1, #0xa6
    lsls r1, r1, #1
    adds r0, r0, r1
    ldr r1, [r0]
    adds r0, r7, #0
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    beq .L0802CC14
.L0802CC02:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802CBB2
    adds r4, #4
    cmp r4, r5
    bne .L0802CC02
.L0802CC14:
    subs r0, r5, #4
    ldr r0, [r0]
.L0802CC18:
    movs r1, #0x92
    bl func_08008B6C
    b .L0802CDC4
.L0802CC20:
    ldr r0, [r6, #0x38]
    bl func_0800E94C
    cmp r0, #0
    beq .L0802CC32
    adds r1, r6, #0
    adds r1, #0x3f
    movs r0, #2
    b .L0802CC90
.L0802CC32:
    adds r1, r6, #0
    adds r1, #0x3f
    movs r0, #0xf
    b .L0802CDC2
.L0802CC3A:
    adds r1, r6, #0
    adds r1, #0x3f
    movs r0, #5
    b .L0802CC90
.L0802CC42:
    adds r1, r6, #0
    adds r1, #0x3f
    movs r0, #6
    b .L0802CC90
.L0802CC4A:
    adds r1, r6, #0
    adds r1, #0x3f
    movs r0, #7
    b .L0802CC90
.L0802CC52:
    adds r1, r6, #0
    adds r1, #0x3f
    movs r0, #8
    b .L0802CC90
.L0802CC5A:
    adds r1, r6, #0
    adds r1, #0x3f
    movs r0, #9
    b .L0802CC90
.L0802CC62:
    adds r1, r6, #0
    adds r1, #0x3f
    movs r0, #0xa
    b .L0802CC90
.L0802CC6A:
    adds r1, r6, #0
    adds r1, #0x3f
    movs r0, #0xb
    b .L0802CC90
.L0802CC72:
    adds r1, r6, #0
    adds r1, #0x3f
    movs r0, #0xc
    b .L0802CC90
.L0802CC7A:
    adds r1, r6, #0
    adds r1, #0x3f
    movs r0, #0xd
    b .L0802CC90
.L0802CC82:
    adds r1, r6, #0
    adds r1, #0x3f
    movs r0, #0xe
    b .L0802CC90
.L0802CC8A:
    adds r1, r6, #0
    adds r1, #0x3f
    movs r0, #0xf
.L0802CC90:
    strb r0, [r1]
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #0xd
    strb r1, [r0]
    bl GetId__C4Tool
    cmp r0, #0x2f
    bls .L0802CCB6
    b .L0802CDBC
.L0802CCB6:
    lsls r0, r0, #2
    ldr r1, .L0802CCC0 @ =.L0802CCC4
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L0802CCC0: .4byte .L0802CCC4
.L0802CCC4: @ jump table
    .4byte .L0802CD84 @ case 0
    .4byte .L0802CD8C @ case 1
    .4byte .L0802CD94 @ case 2
    .4byte .L0802CD9C @ case 3
    .4byte .L0802CDA4 @ case 4
    .4byte .L0802CDAC @ case 5
    .4byte .L0802CDAC @ case 6
    .4byte .L0802CDB4 @ case 7
    .4byte .L0802CD84 @ case 8
    .4byte .L0802CD8C @ case 9
    .4byte .L0802CD94 @ case 10
    .4byte .L0802CD9C @ case 11
    .4byte .L0802CDA4 @ case 12
    .4byte .L0802CDAC @ case 13
    .4byte .L0802CDAC @ case 14
    .4byte .L0802CDB4 @ case 15
    .4byte .L0802CD84 @ case 16
    .4byte .L0802CD8C @ case 17
    .4byte .L0802CD94 @ case 18
    .4byte .L0802CD9C @ case 19
    .4byte .L0802CDA4 @ case 20
    .4byte .L0802CDAC @ case 21
    .4byte .L0802CDAC @ case 22
    .4byte .L0802CDB4 @ case 23
    .4byte .L0802CD84 @ case 24
    .4byte .L0802CD8C @ case 25
    .4byte .L0802CD94 @ case 26
    .4byte .L0802CD9C @ case 27
    .4byte .L0802CDA4 @ case 28
    .4byte .L0802CDAC @ case 29
    .4byte .L0802CDAC @ case 30
    .4byte .L0802CDB4 @ case 31
    .4byte .L0802CD84 @ case 32
    .4byte .L0802CD8C @ case 33
    .4byte .L0802CD94 @ case 34
    .4byte .L0802CD9C @ case 35
    .4byte .L0802CDA4 @ case 36
    .4byte .L0802CDAC @ case 37
    .4byte .L0802CDAC @ case 38
    .4byte .L0802CDB4 @ case 39
    .4byte .L0802CD84 @ case 40
    .4byte .L0802CD8C @ case 41
    .4byte .L0802CD94 @ case 42
    .4byte .L0802CD9C @ case 43
    .4byte .L0802CDA4 @ case 44
    .4byte .L0802CDAC @ case 45
    .4byte .L0802CDAC @ case 46
    .4byte .L0802CDB4 @ case 47
.L0802CD84:
    adds r1, r6, #0
    adds r1, #0x41
    movs r0, #1
    b .L0802CDC2
.L0802CD8C:
    adds r1, r6, #0
    adds r1, #0x41
    movs r0, #2
    b .L0802CDC2
.L0802CD94:
    adds r1, r6, #0
    adds r1, #0x41
    movs r0, #3
    b .L0802CDC2
.L0802CD9C:
    adds r1, r6, #0
    adds r1, #0x41
    movs r0, #4
    b .L0802CDC2
.L0802CDA4:
    adds r1, r6, #0
    adds r1, #0x41
    movs r0, #5
    b .L0802CDC2
.L0802CDAC:
    adds r1, r6, #0
    adds r1, #0x41
    movs r0, #6
    b .L0802CDC2
.L0802CDB4:
    adds r1, r6, #0
    adds r1, #0x41
    movs r0, #7
    b .L0802CDC2
.L0802CDBC:
    adds r1, r6, #0
    adds r1, #0x41
    movs r0, #0
.L0802CDC2:
    strb r0, [r1]
.L0802CDC4:
    add sp, #0x10
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0

    thumb_func_start func_0802CDCC
func_0802CDCC: @ 0x0802CDCC
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #0x80
    adds r7, r0, #0
    adds r1, r7, #0
    adds r1, #0xb3
    ldrb r0, [r1]
    cmp r0, #0
    beq .L0802CE22
    subs r0, #1
    strb r0, [r1]
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0802CE14
    movs r4, #0x2b
.L0802CDF0:
    ldr r0, [r7]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    adds r1, r4, #0
    bl _call_via_r2
    adds r2, r0, #0
    cmp r2, #0
    beq .L0802CE0C
    ldr r0, [r2, #0x14]
    ldr r1, [r0, #0x40]
    adds r0, r2, #0
    bl _call_via_r1
.L0802CE0C:
    adds r4, #1
    cmp r4, #0x45
    bls .L0802CDF0
    b .L0802CE30
.L0802CE14:
    adds r1, r7, #0
    adds r1, #0xb4
    ldrb r0, [r1]
    cmp r0, #0x59
    bhi .L0802CE30
    adds r0, #1
    b .L0802CE2E
.L0802CE22:
    adds r1, r7, #0
    adds r1, #0xb4
    ldrb r0, [r1]
    cmp r0, #0
    beq .L0802CE30
    subs r0, #1
.L0802CE2E:
    strb r0, [r1]
.L0802CE30:
    ldr r0, [r7]
    str r0, [sp, #0x54]
    ldrh r1, [r7, #4]
    str r1, [sp, #0x58]
    ldr r0, [r7, #0x18]
    cmp r0, #0
    bne .L0802CE46
    ldr r1, [r7, #0x1c]
    cmp r1, #0
    bne .L0802CE46
    b .L0802CFEA
.L0802CE46:
    adds r0, r7, #0
    adds r0, #0x3c
    ldrb r0, [r0]
    cmp r0, #0x2c
    bne .L0802CE52
    b .L0802CFEA
.L0802CE52:
    cmp r0, #0x35
    bne .L0802CE58
    b .L0802CFEA
.L0802CE58:
    ldr r1, [r7, #0x14]
    add r0, sp, #0xc
    ldr r2, [r1, #0xc]
    adds r1, r7, #0
    bl _call_via_r2
    ldr r0, [sp, #0xc]
    ldr r1, [sp, #0x10]
    str r0, [sp, #0x14]
    str r1, [sp, #0x18]
    add r2, sp, #0x14
    mov sb, r2
    ldr r0, [r7, #0x14]
    ldr r1, [r0, #0x40]
    adds r0, r7, #0
    bl _call_via_r1
    movs r1, #1
    eors r0, r1
    lsls r0, r0, #0x18
    lsrs r0, r0, #0x18
    str r0, [sp, #0x5c]
    adds r0, r7, #0
    adds r0, #0x20
    ldrb r0, [r0]
    str r0, [sp, #0x60]
    adds r0, r7, #0
    adds r0, #0xb4
    ldrb r0, [r0]
    str r0, [sp, #0x64]
    movs r4, #0x1a
    ldrsh r3, [r7, r4]
    movs r5, #0x1e
    ldrsh r4, [r7, r5]
    mov r6, sb
    movs r1, #0
    ldrsh r0, [r6, r1]
    movs r5, #2
    ldrsh r2, [r6, r5]
    movs r1, #4
    ldrsh r5, [r6, r1]
    movs r1, #6
    ldrsh r6, [r6, r1]
    mov r8, r6
    add r1, sp, #0x1c
    adds r0, r3, r0
    strh r0, [r1]
    adds r2, r4, r2
    strh r2, [r1, #2]
    adds r3, r3, r5
    strh r3, [r1, #4]
    add r4, r8
    strh r4, [r1, #6]
    ldr r0, [sp, #0x1c]
    ldr r1, [sp, #0x20]
    str r0, [sp, #0x24]
    str r1, [sp, #0x28]
    add r2, sp, #0x24
    mov sl, r2
    adds r0, r7, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #2
    beq .L0802CEE8
    movs r3, #0x3c
    str r3, [sp, #0x68]
    ldr r4, .L0802CEE4 @ =gUnk_080F0E88
    str r4, [sp, #0x6c]
    b .L0802CEF0
    .align 2, 0
.L0802CEE4: .4byte gUnk_080F0E88
.L0802CEE8:
    movs r5, #0x15
    str r5, [sp, #0x68]
    ldr r6, .L0802D010 @ =gUnk_080F0F78
    str r6, [sp, #0x6c]
.L0802CEF0:
    movs r0, #0
    str r0, [sp, #0x70]
    ldr r1, [sp, #0x68]
    cmp r0, r1
    bhs .L0802CFEA
    add r2, sp, #0x34
    mov r8, r2
.L0802CEFE:
    ldr r3, [sp, #0x70]
    lsls r0, r3, #2
    ldr r4, [sp, #0x6c]
    adds r0, r0, r4
    ldr r0, [r0]
    str r0, [sp, #0x74]
    ldr r5, [sp, #0x54]
    ldr r0, [r5]
    ldr r2, [r0, #0x40]
    adds r0, r5, #0
    ldr r1, [sp, #0x74]
    bl _call_via_r2
    adds r3, r0, #0
    str r3, [sp, #0x78]
    cmp r3, #0
    beq .L0802CFDE
    ldrh r0, [r3, #4]
    ldr r6, [sp, #0x58]
    cmp r0, r6
    bne .L0802CFDE
    ldr r1, [r3, #0x14]
    add r0, sp, #0x2c
    ldr r2, [r1, #0xc]
    adds r1, r3, #0
    bl _call_via_r2
    ldr r0, [sp, #0x2c]
    ldr r1, [sp, #0x30]
    str r0, [sp, #0x34]
    str r1, [sp, #0x38]
    mov r0, r8
    movs r1, #0
    ldrsh r0, [r0, r1]
    mov ip, r0
    mov r2, sb
    movs r3, #4
    ldrsh r1, [r2, r3]
    subs r1, r0, r1
    movs r4, #0
    ldrsh r0, [r2, r4]
    mov r5, r8
    movs r6, #4
    ldrsh r4, [r5, r6]
    subs r0, r0, r4
    ands r1, r0
    movs r2, #2
    ldrsh r0, [r5, r2]
    str r0, [sp, #0x7c]
    mov r3, sb
    movs r5, #6
    ldrsh r0, [r3, r5]
    ldr r6, [sp, #0x7c]
    subs r0, r6, r0
    ands r1, r0
    movs r2, #2
    ldrsh r0, [r3, r2]
    mov r5, r8
    movs r6, #6
    ldrsh r3, [r5, r6]
    subs r0, r0, r3
    ands r1, r0
    lsrs r2, r1, #0x1f
    cmp r2, #0
    bne .L0802CFDE
    mov r0, sl
    movs r5, #4
    ldrsh r1, [r0, r5]
    mov r6, ip
    subs r1, r6, r1
    movs r5, #0
    ldrsh r0, [r0, r5]
    subs r0, r0, r4
    ands r1, r0
    mov r6, sl
    movs r4, #6
    ldrsh r0, [r6, r4]
    ldr r5, [sp, #0x7c]
    subs r0, r5, r0
    ands r1, r0
    movs r4, #2
    ldrsh r0, [r6, r4]
    subs r0, r0, r3
    ands r1, r0
    cmp r1, #0
    bge .L0802CFDE
    str r2, [r7, #0x18]
    str r2, [r7, #0x1c]
    ldr r5, [sp, #0x5c]
    cmp r5, #0
    beq .L0802CFDE
    movs r1, #0
    ldr r0, [sp, #0x74]
    subs r0, #0x2b
    cmp r0, #0x1a
    bhi .L0802CFC0
    movs r1, #1
.L0802CFC0:
    cmp r1, #0
    beq .L0802CFDE
    ldr r6, [sp, #0x78]
    ldr r0, [r6, #0x14]
    adds r0, #0x84
    ldr r3, [r0]
    adds r0, r6, #0
    ldr r1, [sp, #0x60]
    ldr r2, [sp, #0x64]
    bl _call_via_r3
    adds r1, r7, #0
    adds r1, #0xb3
    movs r0, #8
    strb r0, [r1]
.L0802CFDE:
    ldr r0, [sp, #0x70]
    adds r0, #1
    str r0, [sp, #0x70]
    ldr r1, [sp, #0x68]
    cmp r0, r1
    blo .L0802CEFE
.L0802CFEA:
    ldr r0, [r7, #0x18]
    ldr r1, [r7, #0x1c]
    cmp r0, #0
    bne .L0802CFF8
    cmp r1, #0
    bne .L0802CFF8
    b .L0802D148
.L0802CFF8:
    ldr r5, [r7, #8]
    ldr r6, [r7, #0xc]
    adds r0, r0, r5
    mov r8, r0
    adds r1, r1, r6
    mov sb, r1
    cmp r0, #0
    bge .L0802D014
    movs r2, #0
    mov r8, r2
    b .L0802D02A
    .align 2, 0
.L0802D010: .4byte gUnk_080F0F78
.L0802D014:
    ldr r3, [sp, #0x54]
    ldr r0, [r3]
    ldr r2, [r0, #0x2c]
    adds r0, r3, #0
    ldr r1, [sp, #0x58]
    bl _call_via_r2
    lsls r0, r0, #0x10
    cmp r8, r0
    ble .L0802D02A
    mov r8, r0
.L0802D02A:
    mov r4, sb
    cmp r4, #0
    bge .L0802D034
    movs r0, #0
    b .L0802D048
.L0802D034:
    ldr r1, [sp, #0x54]
    ldr r0, [r1]
    ldr r2, [r0, #0x30]
    adds r0, r1, #0
    ldr r1, [sp, #0x58]
    bl _call_via_r2
    lsls r0, r0, #0x10
    cmp sb, r0
    ble .L0802D04A
.L0802D048:
    mov sb, r0
.L0802D04A:
    adds r0, r7, #0
    adds r0, #0x3c
    ldrb r0, [r0]
    subs r0, #0x2c
    lsls r0, r0, #0x18
    lsrs r0, r0, #0x18
    cmp r0, #1
    bls .L0802D0DA
    ldr r4, [sp, #0x54]
    ldr r1, [r4]
    mov r0, sp
    ldr r3, [r1, #0x34]
    adds r1, r4, #0
    ldr r2, [sp, #0x58]
    bl _call_via_r3
    ldr r1, [r7, #0x14]
    add r0, sp, #0x3c
    ldr r2, [r1, #0xc]
    adds r1, r7, #0
    bl _call_via_r2
    ldr r0, [sp, #0x3c]
    ldr r1, [sp, #0x40]
    str r0, [sp, #0x44]
    str r1, [sp, #0x48]
    add r4, sp, #0x44
    mov r0, sp
    adds r1, r4, #0
    bl func_080AC070
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802D098
    mov r5, r8
    str r5, [r7, #8]
    mov r6, sb
    str r6, [r7, #0xc]
    b .L0802D122
.L0802D098:
    mov r0, r8
    asrs r1, r0, #0x10
    asrs r0, r5, #0x10
    subs r5, r1, r0
    mov r2, sb
    asrs r1, r2, #0x10
    asrs r0, r6, #0x10
    subs r6, r1, r0
    movs r3, #0
    ldrsh r0, [r4, r3]
    movs r1, #2
    ldrsh r2, [r4, r1]
    movs r1, #4
    ldrsh r3, [r4, r1]
    movs r1, #6
    ldrsh r4, [r4, r1]
    add r1, sp, #0x4c
    adds r0, r5, r0
    strh r0, [r1]
    adds r2, r6, r2
    strh r2, [r1, #2]
    adds r3, r5, r3
    strh r3, [r1, #4]
    adds r4, r6, r4
    strh r4, [r1, #6]
    mov r0, sp
    bl func_080AC070
    movs r1, #1
    eors r0, r1
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802D0E4
.L0802D0DA:
    mov r2, r8
    str r2, [r7, #8]
    mov r3, sb
    str r3, [r7, #0xc]
    b .L0802D122
.L0802D0E4:
    cmp r5, #0
    ble .L0802D0F4
    adds r0, r7, #0
    movs r1, #3
    adds r2, r5, #0
    bl func_0802536C
    b .L0802D122
.L0802D0F4:
    cmp r5, #0
    bge .L0802D104
    rsbs r2, r5, #0
    adds r0, r7, #0
    movs r1, #2
    bl func_0802536C
    b .L0802D122
.L0802D104:
    cmp r6, #0
    ble .L0802D114
    adds r0, r7, #0
    movs r1, #0
    adds r2, r6, #0
    bl func_0802536C
    b .L0802D122
.L0802D114:
    cmp r6, #0
    bge .L0802D122
    rsbs r2, r6, #0
    adds r0, r7, #0
    movs r1, #1
    bl func_0802536C
.L0802D122:
    ldr r0, [r7, #0x14]
    ldr r1, [r0, #0x40]
    adds r0, r7, #0
    bl _call_via_r1
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802D148
    ldr r4, [sp, #0x54]
    ldr r0, [r4]
    ldr r2, [r0, #0x40]
    adds r0, r4, #0
    movs r1, #0x2c
    bl _call_via_r2
    ldr r1, [r7, #8]
    str r1, [r0, #8]
    ldr r1, [r7, #0xc]
    str r1, [r0, #0xc]
.L0802D148:
    add sp, #0x80
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0

    thumb_func_start func_0802D158
func_0802D158: @ 0x0802D158
    push {r4, r5, r6, lr}
    sub sp, #8
    adds r5, r0, #0
    movs r6, #0xc9
    lsls r6, r6, #1
    adds r0, #0x7c
    ldr r1, .L0802D17C @ =0x0000FFFF
    strh r1, [r0]
    subs r0, #0x40
    ldrb r0, [r0]
    cmp r0, #0x39
    bls .L0802D172
    b .L0802D590
.L0802D172:
    lsls r0, r0, #2
    ldr r1, .L0802D180 @ =.L0802D184
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L0802D17C: .4byte 0x0000FFFF
.L0802D180: .4byte .L0802D184
.L0802D184: @ jump table
    .4byte .L0802D26C @ case 0
    .4byte .L0802D346 @ case 1
    .4byte .L0802D2E0 @ case 2
    .4byte .L0802D346 @ case 3
    .4byte .L0802D330 @ case 4
    .4byte .L0802D346 @ case 5
    .4byte .L0802D466 @ case 6
    .4byte .L0802D472 @ case 7
    .4byte .L0802D582 @ case 8
    .4byte .L0802D37E @ case 9
    .4byte .L0802D566 @ case 10
    .4byte .L0802D364 @ case 11
    .4byte .L0802D364 @ case 12
    .4byte .L0802D35E @ case 13
    .4byte .L0802D364 @ case 14
    .4byte .L0802D36A @ case 15
    .4byte .L0802D36E @ case 16
    .4byte .L0802D554 @ case 17
    .4byte .L0802D560 @ case 18
    .4byte .L0802D372 @ case 19
    .4byte .L0802D378 @ case 20
    .4byte .L0802D566 @ case 21
    .4byte .L0802D45A @ case 22
    .4byte .L0802D460 @ case 23
    .4byte .L0802D46C @ case 24
    .4byte .L0802D3CC @ case 25
    .4byte .L0802D3CC @ case 26
    .4byte .L0802D39E @ case 27
    .4byte .L0802D3BC @ case 28
    .4byte .L0802D3BC @ case 29
    .4byte .L0802D3FC @ case 30
    .4byte .L0802D416 @ case 31
    .4byte .L0802D432 @ case 32
    .4byte .L0802D554 @ case 33
    .4byte .L0802D4BC @ case 34
    .4byte .L0802D4D8 @ case 35
    .4byte .L0802D4F0 @ case 36
    .4byte .L0802D4F6 @ case 37
    .4byte .L0802D4FC @ case 38
    .4byte .L0802D500 @ case 39
    .4byte .L0802D504 @ case 40
    .4byte .L0802D50A @ case 41
    .4byte .L0802D510 @ case 42
    .4byte .L0802D510 @ case 43
    .4byte .L0802D516 @ case 44
    .4byte .L0802D52C @ case 45
    .4byte .L0802D550 @ case 46
    .4byte .L0802D566 @ case 47
    .4byte .L0802D55A @ case 48
    .4byte .L0802D554 @ case 49
    .4byte .L0802D55A @ case 50
    .4byte .L0802D560 @ case 51
    .4byte .L0802D566 @ case 52
    .4byte .L0802D56A @ case 53
    .4byte .L0802D554 @ case 54
    .4byte .L0802D554 @ case 55
    .4byte .L0802D55A @ case 56
    .4byte .L0802D55A @ case 57
.L0802D26C:
    ldr r0, [r5, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0802D29E
    adds r0, r5, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    bne .L0802D286
    b .L0802D57C
.L0802D286:
    cmp r0, #1
    bgt .L0802D292
    cmp r0, #0
    bne .L0802D290
    b .L0802D55A
.L0802D290:
    b .L0802D590
.L0802D292:
    cmp r0, #2
    beq .L0802D298
    b .L0802D590
.L0802D298:
    movs r6, #0xa7
    lsls r6, r6, #1
    b .L0802D590
.L0802D29E:
    adds r0, r5, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    beq .L0802D2BA
    cmp r0, #1
    bgt .L0802D2B4
    cmp r0, #0
    bne .L0802D2B2
    b .L0802D3CC
.L0802D2B2:
    b .L0802D590
.L0802D2B4:
    cmp r0, #2
    beq .L0802D2CC
    b .L0802D590
.L0802D2BA:
    adds r0, r5, #0
    adds r0, #0xb3
    ldrb r0, [r0]
    movs r1, #0x99
    lsls r1, r1, #1
    cmp r0, #0
    bne .L0802D2DC
    adds r1, #0x94
    b .L0802D2DC
.L0802D2CC:
    adds r0, r5, #0
    adds r0, #0xb3
    ldrb r0, [r0]
    movs r1, #0x99
    lsls r1, r1, #1
    cmp r0, #0
    bne .L0802D2DC
    adds r1, #0x2c
.L0802D2DC:
    adds r6, r1, #0
    b .L0802D590
.L0802D2E0:
    ldr r0, [r5, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0802D2F0
    b .L0802D55A
.L0802D2F0:
    adds r0, r5, #0
    adds r0, #0x3f
    ldrb r3, [r0]
    cmp r3, #5
    bgt .L0802D3CC
    cmp r3, #0
    blt .L0802D3CC
    ldr r2, .L0802D32C @ =gUnk_080F0FCC
    adds r1, r5, #0
    adds r1, #0x40
    lsls r0, r3, #3
    subs r0, r0, r3
    ldrb r1, [r1]
    adds r0, r0, r1
    lsls r0, r0, #1
    adds r0, r0, r2
    ldrh r6, [r0]
    ldr r4, [r5, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    mov r1, sp
    strb r0, [r1]
    mov r0, sp
    b .L0802D44E
    .align 2, 0
.L0802D32C: .4byte gUnk_080F0FCC
.L0802D330:
    ldr r0, [r5, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r6, #0xc9
    lsls r6, r6, #1
    cmp r0, #0
    beq .L0802D344
    b .L0802D590
.L0802D344:
    b .L0802D55A
.L0802D346:
    ldr r0, [r5, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r6, #0xc9
    lsls r6, r6, #1
    cmp r0, #0
    beq .L0802D35A
    b .L0802D590
.L0802D35A:
    subs r6, #0x40
    b .L0802D590
.L0802D35E:
    movs r6, #0x9b
    lsls r6, r6, #1
    b .L0802D590
.L0802D364:
    movs r6, #0xcf
    lsls r6, r6, #1
    b .L0802D590
.L0802D36A:
    movs r6, #0x4e
    b .L0802D590
.L0802D36E:
    movs r6, #0x46
    b .L0802D590
.L0802D372:
    movs r6, #0x9f
    lsls r6, r6, #1
    b .L0802D590
.L0802D378:
    movs r6, #0xa1
    lsls r6, r6, #1
    b .L0802D590
.L0802D37E:
    adds r0, r5, #0
    adds r0, #0x44
    ldrh r6, [r0]
    ldr r4, [r5, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #1
    b .L0802D44C
.L0802D39E:
    movs r6, #0xf5
    lsls r6, r6, #1
    ldr r4, [r5, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #2
    b .L0802D44C
.L0802D3BC:
    adds r2, r5, #0
    adds r2, #0x4e
    adds r1, r5, #0
    adds r1, #0x4f
    ldrb r0, [r2]
    ldrb r3, [r1]
    cmp r0, r3
    bne .L0802D3D2
.L0802D3CC:
    movs r6, #0xc9
    lsls r6, r6, #1
    b .L0802D590
.L0802D3D2:
    ldrb r0, [r1]
    ldrb r1, [r2]
    subs r0, r0, r1
    movs r6, #0xc1
    lsls r6, r6, #1
    cmp r0, #1
    bne .L0802D3E2
    adds r6, #4
.L0802D3E2:
    ldr r4, [r5, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #3
    b .L0802D44C
.L0802D3FC:
    movs r6, #0x76
    ldr r4, [r5, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    add r0, sp, #4
    b .L0802D44C
.L0802D416:
    movs r6, #0x6e
    ldr r4, [r5, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #5
    b .L0802D44C
.L0802D432:
    movs r6, #0x72
    ldr r4, [r5, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #6
.L0802D44C:
    strb r1, [r0]
.L0802D44E:
    bl GetIconId__C4Tool
    adds r1, r5, #0
    adds r1, #0x7c
    strh r0, [r1]
    b .L0802D590
.L0802D45A:
    movs r6, #0xfd
    lsls r6, r6, #1
    b .L0802D590
.L0802D460:
    movs r6, #0xcb
    lsls r6, r6, #1
    b .L0802D590
.L0802D466:
    movs r6, #0x89
    lsls r6, r6, #1
    b .L0802D590
.L0802D46C:
    movs r6, #0x8b
    lsls r6, r6, #1
    b .L0802D590
.L0802D472:
    ldr r0, [r5]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    adds r0, r5, #0
    adds r0, #0x3e
    ldrb r0, [r0]
    cmp r0, #1
    beq .L0802D4A4
    cmp r0, #1
    bgt .L0802D494
    cmp r0, #0
    beq .L0802D49A
    b .L0802D590
.L0802D494:
    cmp r0, #2
    beq .L0802D4B0
    b .L0802D590
.L0802D49A:
    movs r6, #0xea
    ldr r1, .L0802D4A0 @ =0x0000077A
    b .L0802D53E
    .align 2, 0
.L0802D4A0: .4byte 0x0000077A
.L0802D4A4:
    movs r6, #0xee
    ldr r1, .L0802D4AC @ =0x0000077E
    b .L0802D53E
    .align 2, 0
.L0802D4AC: .4byte 0x0000077E
.L0802D4B0:
    movs r6, #0xe6
    ldr r1, .L0802D4B8 @ =0x00000782
    b .L0802D53E
    .align 2, 0
.L0802D4B8: .4byte 0x00000782
.L0802D4BC:
    movs r6, #0xad
    lsls r6, r6, #1
    ldr r0, [r5]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L0802D4D4 @ =0x0000077A
    b .L0802D53E
    .align 2, 0
.L0802D4D4: .4byte 0x0000077A
.L0802D4D8:
    movs r6, #0x9a
    ldr r0, [r5]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L0802D4EC @ =0x0000077A
    b .L0802D53E
    .align 2, 0
.L0802D4EC: .4byte 0x0000077A
.L0802D4F0:
    movs r6, #0x83
    lsls r6, r6, #1
    b .L0802D590
.L0802D4F6:
    movs r6, #0x81
    lsls r6, r6, #1
    b .L0802D590
.L0802D4FC:
    movs r6, #0xfe
    b .L0802D590
.L0802D500:
    movs r6, #0xfa
    b .L0802D590
.L0802D504:
    movs r6, #0x91
    lsls r6, r6, #1
    b .L0802D590
.L0802D50A:
    movs r6, #0x8f
    lsls r6, r6, #1
    b .L0802D590
.L0802D510:
    movs r6, #0x8d
    lsls r6, r6, #1
    b .L0802D590
.L0802D516:
    ldr r0, [r5, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r6, #0xa5
    lsls r6, r6, #1
    cmp r0, #0
    beq .L0802D590
    subs r6, #0x40
    b .L0802D590
.L0802D52C:
    movs r6, #0xe2
    ldr r0, [r5]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r2, r0, #0
    ldr r1, .L0802D54C @ =0x00000792
.L0802D53E:
    ldrh r0, [r2, #0x22]
    cmp r0, r1
    beq .L0802D590
    adds r0, r2, #0
    bl SetAnim__12AActorEntityUi
    b .L0802D590
    .align 2, 0
.L0802D54C: .4byte 0x00000792
.L0802D550:
    movs r6, #0x3e
    b .L0802D590
.L0802D554:
    movs r6, #0xa3
    lsls r6, r6, #1
    b .L0802D590
.L0802D55A:
    movs r6, #0xa9
    lsls r6, r6, #1
    b .L0802D590
.L0802D560:
    movs r6, #0x9d
    lsls r6, r6, #1
    b .L0802D590
.L0802D566:
    movs r6, #0x42
    b .L0802D590
.L0802D56A:
    ldr r0, [r5, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    movs r6, #0xe3
    lsls r6, r6, #1
    cmp r0, #0
    bne .L0802D590
.L0802D57C:
    movs r6, #0xab
    lsls r6, r6, #1
    b .L0802D590
.L0802D582:
    adds r0, r5, #0
    adds r0, #0x3d
    ldrb r0, [r0]
    movs r6, #0xf6
    cmp r0, #0
    beq .L0802D590
    movs r6, #0xf2
.L0802D590:
    adds r0, r6, #0
    add sp, #8
    pop {r4, r5, r6}
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_0802D59C
func_0802D59C: @ 0x0802D59C
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #0x20
    adds r6, r0, #0
    movs r2, #0
    str r2, [sp, #0x1c]
    mov r8, r2
    cmp r1, #0
    beq .L0802D5BC
    ldrh r0, [r1]
    str r0, [sp, #0x1c]
    ldrh r1, [r1, #4]
    mov r8, r1
.L0802D5BC:
    adds r0, r6, #0
    adds r0, #0x3e
    strb r2, [r0]
    adds r1, r6, #0
    adds r1, #0xc3
    ldrb r2, [r1]
    adds r7, r0, #0
    mov sl, r1
    movs r0, #0x20
    adds r0, r0, r6
    mov sb, r0
    cmp r2, #0
    beq .L0802D5D8
    b .L0802D71C
.L0802D5D8:
    movs r0, #1
    mov r1, r8
    ands r0, r1
    cmp r0, #0
    bne .L0802D5E4
    b .L0802D71C
.L0802D5E4:
    mov r0, sp
    adds r1, r6, #0
    bl GetLocation__C7AEntity
    mov r2, sb
    ldrb r0, [r2]
    cmp r0, #1
    beq .L0802D608
    cmp r0, #1
    bgt .L0802D5FE
    cmp r0, #0
    beq .L0802D62C
    b .L0802D68E
.L0802D5FE:
    cmp r0, #2
    beq .L0802D670
    cmp r0, #3
    beq .L0802D67A
    b .L0802D68E
.L0802D608:
    mov r3, sp
    mov r0, sp
    ldrb r4, [r0, #3]
    lsrs r2, r4, #2
    ldrh r1, [r0, #4]
    ldr r5, .L0802D624 @ =0x000003FF
    ands r1, r5
    lsls r1, r1, #6
    orrs r1, r2
    lsls r1, r1, #0x10
    ldr r0, .L0802D628 @ =0xFFF00000
    adds r1, r1, r0
    b .L0802D646
    .align 2, 0
.L0802D624: .4byte 0x000003FF
.L0802D628: .4byte 0xFFF00000
.L0802D62C:
    mov r3, sp
    mov r0, sp
    ldrb r4, [r0, #3]
    lsrs r2, r4, #2
    ldrh r1, [r0, #4]
    ldr r5, .L0802D668 @ =0x000003FF
    ands r1, r5
    lsls r1, r1, #6
    orrs r1, r2
    lsls r1, r1, #0x10
    movs r2, #0x80
    lsls r2, r2, #0xd
    adds r1, r1, r2
.L0802D646:
    lsrs r2, r1, #0x10
    movs r0, #0x3f
    ands r2, r0
    lsls r2, r2, #2
    movs r0, #3
    ands r0, r4
    orrs r0, r2
    strb r0, [r3, #3]
    lsrs r1, r1, #0x16
    ands r1, r5
    ldrh r2, [r3, #4]
    ldr r0, .L0802D66C @ =0xFFFFFC00
    ands r0, r2
    orrs r0, r1
    strh r0, [r3, #4]
    b .L0802D68E
    .align 2, 0
.L0802D668: .4byte 0x000003FF
.L0802D66C: .4byte 0xFFFFFC00
.L0802D670:
    ldr r0, [sp]
    lsls r1, r0, #6
    asrs r1, r1, #0x10
    subs r1, #0x10
    b .L0802D682
.L0802D67A:
    ldr r0, [sp]
    lsls r1, r0, #6
    asrs r1, r1, #0x10
    adds r1, #0x10
.L0802D682:
    lsls r1, r1, #0x10
    lsrs r1, r1, #6
    ldr r2, .L0802D6E0 @ =0xFC0003FF
    ands r2, r0
    orrs r2, r1
    str r2, [sp]
.L0802D68E:
    ldrh r2, [r6, #4]
    ldr r1, [r6]
    add r4, sp, #8
    ldr r3, [r1]
    adds r0, r4, #0
    ldr r3, [r3, #0x34]
    bl _call_via_r3
    ldr r0, [sp]
    lsls r0, r0, #6
    asrs r5, r0, #0x13
    mov r0, sp
    ldrb r2, [r0, #3]
    lsrs r2, r2, #2
    ldrh r0, [r0, #4]
    ldr r1, .L0802D6E4 @ =0x000003FF
    ands r0, r1
    lsls r0, r0, #6
    orrs r0, r2
    lsls r0, r0, #0x10
    asrs r3, r0, #0x13
    ldr r2, [sp, #8]
    ldrh r0, [r4, #8]
    cmp r2, #0
    beq .L0802D6E8
    cmp r5, r0
    bhi .L0802D6E8
    ldrh r1, [r4, #0xa]
    cmp r3, r1
    bhi .L0802D6E8
    ldr r1, [r4, #4]
    muls r0, r3, r0
    adds r0, r0, r5
    cmp r1, #0
    beq .L0802D6D8
    adds r0, r1, r0
    ldrb r0, [r0]
.L0802D6D8:
    lsls r0, r0, #2
    adds r0, r2, r0
    adds r2, r0, #0
    b .L0802D6EA
    .align 2, 0
.L0802D6E0: .4byte 0xFC0003FF
.L0802D6E4: .4byte 0x000003FF
.L0802D6E8:
    movs r2, #0
.L0802D6EA:
    cmp r2, #0
    beq .L0802D71C
    ldrh r1, [r2, #2]
    ldr r0, .L0802D718 @ =0x0000FFFE
    ands r0, r1
    cmp r0, #0
    beq .L0802D71C
    ldr r0, [r6]
    ldr r3, [r0]
    movs r1, #0xa0
    lsls r1, r1, #1
    adds r3, r3, r1
    ldr r2, [r2]
    lsrs r2, r2, #0x11
    add r1, sp, #0x14
    movs r4, #0
    str r2, [sp, #0x14]
    str r4, [r1, #4]
    ldr r3, [r3]
    movs r2, #0
    bl _call_via_r3
    b .L0802D832
    .align 2, 0
.L0802D718: .4byte 0x0000FFFE
.L0802D71C:
    movs r3, #0
    movs r5, #0
    mov r2, sb
    ldrb r4, [r2]
    mov r1, sl
    ldrb r0, [r1]
    cmp r0, #0
    bne .L0802D736
    movs r0, #3
    mov r2, r8
    ands r2, r0
    cmp r2, #0
    beq .L0802D740
.L0802D736:
    adds r1, r6, #0
    adds r1, #0x3c
    movs r0, #0x23
    strb r0, [r1]
    b .L0802D7F8
.L0802D740:
    ldr r1, [sp, #0x1c]
    lsls r2, r1, #0x19
    lsrs r2, r2, #0x1f
    lsls r0, r1, #0x18
    lsrs r0, r0, #0x1f
    orrs r2, r0
    lsls r0, r1, #0x1a
    lsrs r0, r0, #0x1f
    orrs r0, r2
    lsls r2, r1, #0x1b
    lsrs r2, r2, #0x1f
    orrs r2, r0
    lsls r1, r1, #0x17
    lsrs r1, r1, #0x1f
    orrs r1, r2
    cmp r1, #0
    beq .L0802D7F8
    add r1, sp, #0x1c
    ldrb r2, [r1]
    movs r0, #0x20
    ands r0, r2
    cmp r0, #0
    beq .L0802D772
    movs r4, #2
    b .L0802D794
.L0802D772:
    movs r0, #0x10
    ands r0, r2
    cmp r0, #0
    beq .L0802D77E
    movs r4, #3
    b .L0802D794
.L0802D77E:
    movs r0, #0x40
    ands r0, r2
    cmp r0, #0
    beq .L0802D78A
    movs r4, #1
    b .L0802D794
.L0802D78A:
    movs r0, #0x80
    ands r0, r2
    cmp r0, #0
    beq .L0802D794
    movs r4, #0
.L0802D794:
    cmp r4, #1
    beq .L0802D7B4
    cmp r4, #1
    bgt .L0802D7A2
    cmp r4, #0
    beq .L0802D7B8
    b .L0802D7BA
.L0802D7A2:
    cmp r4, #2
    beq .L0802D7AC
    cmp r4, #3
    beq .L0802D7B0
    b .L0802D7BA
.L0802D7AC:
    movs r3, #0xfe
    b .L0802D7BA
.L0802D7B0:
    movs r3, #2
    b .L0802D7BA
.L0802D7B4:
    movs r5, #0xfe
    b .L0802D7BA
.L0802D7B8:
    movs r5, #2
.L0802D7BA:
    ldr r0, [r6, #0x34]
    ldr r2, .L0802D7D8 @ =0x00002210
    adds r0, r0, r2
    ldrb r0, [r0]
    lsls r0, r0, #0x1f
    cmp r0, #0
    bne .L0802D7DC
    ldrb r1, [r1, #1]
    movs r2, #1
    adds r0, r2, #0
    ands r0, r1
    cmp r0, #0
    beq .L0802D7F6
    b .L0802D7E8
    .align 2, 0
.L0802D7D8: .4byte 0x00002210
.L0802D7DC:
    ldrb r1, [r1, #1]
    movs r2, #1
    adds r0, r2, #0
    ands r0, r1
    cmp r0, #0
    bne .L0802D7F6
.L0802D7E8:
    movs r0, #2
    strb r0, [r7]
    lsls r0, r3, #0x19
    lsrs r3, r0, #0x18
    lsls r0, r5, #0x19
    lsrs r5, r0, #0x18
    b .L0802D7F8
.L0802D7F6:
    strb r2, [r7]
.L0802D7F8:
    lsls r0, r3, #0x18
    asrs r0, r0, #8
    str r0, [r6, #0x18]
    lsls r0, r5, #0x18
    asrs r0, r0, #8
    str r0, [r6, #0x1c]
    mov r1, sb
    ldrb r0, [r1]
    cmp r0, r4
    beq .L0802D814
    adds r0, r6, #0
    adds r1, r4, #0
    bl SetAnimFacing__12AActorEntityUi
.L0802D814:
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    adds r1, r0, #0
    adds r0, #0x20
    ldrb r0, [r0]
    cmp r0, r4
    beq .L0802D832
    adds r0, r1, #0
    adds r1, r4, #0
    bl SetAnimFacing__12AActorEntityUi
.L0802D832:
    add sp, #0x20
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_0802D844
func_0802D844: @ 0x0802D844
    push {r4, r5, lr}
    adds r4, r0, #0
    movs r5, #0
    cmp r1, #0
    beq .L0802D850
    ldrh r5, [r1, #4]
.L0802D850:
    adds r0, r4, #0
    adds r0, #0xc3
    ldrb r0, [r0]
    cmp r0, #0
    bne .L0802D862
    ldr r0, .L0802D88C @ =0x000003F3
    ands r0, r5
    cmp r0, #0
    beq .L0802D8E2
.L0802D862:
    adds r0, r4, #0
    bl func_080323C8
    adds r1, r4, #0
    adds r1, #0x3c
    movs r0, #0x18
    strb r0, [r1]
    movs r0, #0x20
    ands r0, r5
    cmp r0, #0
    beq .L0802D890
    adds r0, r4, #0
    adds r0, #0x20
    ldrb r0, [r0]
    cmp r0, #2
    beq .L0802D8E2
    adds r0, r4, #0
    movs r1, #2
    bl SetAnimFacing__12AActorEntityUi
    b .L0802D8E2
    .align 2, 0
.L0802D88C: .4byte 0x000003F3
.L0802D890:
    movs r0, #0x10
    ands r0, r5
    cmp r0, #0
    beq .L0802D8AC
    adds r0, r4, #0
    adds r0, #0x20
    ldrb r0, [r0]
    cmp r0, #3
    beq .L0802D8E2
    adds r0, r4, #0
    movs r1, #3
    bl SetAnimFacing__12AActorEntityUi
    b .L0802D8E2
.L0802D8AC:
    movs r0, #0x40
    ands r0, r5
    cmp r0, #0
    beq .L0802D8C8
    adds r0, r4, #0
    adds r0, #0x20
    ldrb r0, [r0]
    cmp r0, #1
    beq .L0802D8E2
    adds r0, r4, #0
    movs r1, #1
    bl SetAnimFacing__12AActorEntityUi
    b .L0802D8E2
.L0802D8C8:
    movs r0, #0x80
    ands r5, r0
    cmp r5, #0
    beq .L0802D8E2
    adds r0, r4, #0
    adds r0, #0x20
    ldrb r0, [r0]
    cmp r0, #0
    beq .L0802D8E2
    adds r0, r4, #0
    movs r1, #0
    bl SetAnimFacing__12AActorEntityUi
.L0802D8E2:
    pop {r4, r5}
    pop {r0}
    bx r0

    thumb_func_start func_0802D8E8
func_0802D8E8: @ 0x0802D8E8
    push {r4, r5, lr}
    sub sp, #0xc
    adds r5, r0, #0
    movs r3, #0
    str r3, [sp, #8]
    movs r4, #0
    cmp r1, #0
    beq .L0802D900
    ldrh r3, [r1]
    ldrh r0, [r1, #4]
    str r0, [sp, #8]
    ldrh r4, [r1, #8]
.L0802D900:
    adds r0, r5, #0
    adds r0, #0xc3
    ldrb r0, [r0]
    cmp r0, #0
    beq .L0802D914
    adds r1, r5, #0
    adds r1, #0x3c
    movs r0, #0
    strb r0, [r1]
    b .L0802D9A4
.L0802D914:
    lsls r0, r3, #0x1e
    lsrs r2, r0, #0x1f
    lsls r0, r3, #0x16
    lsrs r0, r0, #0x1f
    orrs r2, r0
    cmp r2, #0
    beq .L0802D99E
    lsls r1, r4, #0x19
    lsrs r1, r1, #0x1f
    lsls r0, r4, #0x1a
    lsrs r0, r0, #0x1f
    orrs r1, r0
    cmp r1, #0
    beq .L0802D93A
    adds r0, r5, #0
    movs r1, #1
    bl func_08025A40
    b .L0802D9A4
.L0802D93A:
    lsls r2, r4, #0x18
    lsrs r2, r2, #0x1f
    lsls r0, r4, #0x1b
    lsrs r0, r0, #0x1f
    orrs r2, r0
    ldr r1, [sp, #8]
    lsls r0, r1, #0x1e
    lsrs r0, r0, #0x1f
    orrs r0, r2
    lsls r1, r1, #0x16
    lsrs r4, r1, #0x1f
    orrs r4, r0
    cmp r4, #0
    beq .L0802D960
    adds r0, r5, #0
    movs r1, #0
    bl func_08025A40
    b .L0802D9A4
.L0802D960:
    add r1, sp, #8
    ldrb r0, [r1]
    movs r3, #1
    adds r2, r3, #0
    ands r2, r0
    cmp r2, #0
    beq .L0802D994
    ldr r0, [r5]
    ldr r2, [r0]
    movs r1, #0xa0
    lsls r1, r1, #1
    adds r2, r2, r1
    ldr r1, .L0802D990 @ =0x000003CE
    str r1, [sp]
    str r4, [sp, #4]
    ldr r3, [r2]
    mov r1, sp
    movs r2, #0
    bl _call_via_r3
    adds r0, r5, #0
    adds r0, #0x3c
    strb r4, [r0]
    b .L0802D9A4
    .align 2, 0
.L0802D990: .4byte 0x000003CE
.L0802D994:
    ldrb r1, [r1, #1]
    adds r0, r3, #0
    ands r0, r1
    cmp r0, #0
    beq .L0802D9A4
.L0802D99E:
    adds r0, r5, #0
    adds r0, #0x3c
    strb r2, [r0]
.L0802D9A4:
    add sp, #0xc
    pop {r4, r5}
    pop {r0}
    bx r0

    thumb_func_start func_0802D9AC
func_0802D9AC: @ 0x0802D9AC
    push {r4, r5, r6, lr}
    sub sp, #0x1c
    adds r6, r0, #0
    movs r2, #0
    str r2, [sp, #0x14]
    str r2, [sp, #0x18]
    movs r3, #0
    cmp r1, #0
    beq .L0802D9C8
    ldrh r0, [r1]
    str r0, [sp, #0x14]
    ldrh r0, [r1, #4]
    str r0, [sp, #0x18]
    ldrh r3, [r1, #8]
.L0802D9C8:
    adds r0, r6, #0
    adds r0, #0xc3
    ldrb r0, [r0]
    cmp r0, #0
    beq .L0802D9DA
    adds r0, r6, #0
    adds r0, #0x3c
    strb r2, [r0]
    b .L0802DBE6
.L0802D9DA:
    ldr r0, [sp, #0x14]
    lsls r1, r0, #0x1f
    lsrs r1, r1, #0x1f
    lsls r0, r0, #0x16
    lsrs r0, r0, #0x1f
    orrs r1, r0
    cmp r1, #0
    bne .L0802D9EC
    b .L0802DBE0
.L0802D9EC:
    lsls r1, r3, #0x19
    lsrs r1, r1, #0x1f
    lsls r0, r3, #0x1a
    lsrs r0, r0, #0x1f
    orrs r1, r0
    cmp r1, #0
    beq .L0802DA1C
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0802DA12
    adds r0, r6, #0
    movs r1, #1
    bl func_080257D0
    b .L0802DBE6
.L0802DA12:
    adds r0, r6, #0
    movs r1, #1
    bl func_08025838
    b .L0802DBE6
.L0802DA1C:
    lsls r2, r3, #0x18
    lsrs r2, r2, #0x1f
    lsls r0, r3, #0x1b
    lsrs r0, r0, #0x1f
    orrs r2, r0
    ldr r1, [sp, #0x18]
    lsls r0, r1, #0x1f
    lsrs r0, r0, #0x1f
    orrs r0, r2
    lsls r1, r1, #0x16
    lsrs r4, r1, #0x1f
    orrs r4, r0
    cmp r4, #0
    beq .L0802DA5A
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0802DA50
    adds r0, r6, #0
    movs r1, #0
    bl func_080257D0
    b .L0802DBE6
.L0802DA50:
    adds r0, r6, #0
    movs r1, #0
    bl func_08025838
    b .L0802DBE6
.L0802DA5A:
    add r2, sp, #0x18
    ldrb r1, [r2]
    movs r5, #2
    adds r0, r5, #0
    ands r0, r1
    lsls r0, r0, #0x18
    lsrs r3, r0, #0x18
    cmp r3, #0
    bne .L0802DA6E
    b .L0802DBCE
.L0802DA6E:
    add r3, sp, #0x14
    ldrh r2, [r3]
    ldr r1, .L0802DA8C @ =0x00000201
    adds r0, r1, #0
    ands r0, r2
    cmp r0, r1
    bne .L0802DA94
    ldr r0, [r6]
    ldr r3, [r0]
    subs r1, #0xc1
    adds r3, r3, r1
    add r1, sp, #4
    ldr r2, .L0802DA90 @ =0x000003CE
    str r2, [sp, #4]
    b .L0802DAAE
    .align 2, 0
.L0802DA8C: .4byte 0x00000201
.L0802DA90: .4byte 0x000003CE
.L0802DA94:
    ldrb r1, [r3]
    movs r0, #1
    ands r0, r1
    cmp r0, #0
    beq .L0802DAC8
    ldr r0, [r6]
    ldr r3, [r0]
    movs r2, #0xa0
    lsls r2, r2, #1
    adds r3, r3, r2
    add r1, sp, #0xc
    ldr r2, .L0802DAC0 @ =0x000003CE
    str r2, [sp, #0xc]
.L0802DAAE:
    str r4, [r1, #4]
    ldr r3, [r3]
    movs r2, #0
    bl _call_via_r3
    adds r0, r6, #0
    adds r0, #0x3c
    strb r4, [r0]
    b .L0802DBE6
    .align 2, 0
.L0802DAC0: .4byte 0x000003CE
.L0802DAC4:
    ldr r0, [r4]
    b .L0802DB62
.L0802DAC8:
    ldrb r1, [r3, #1]
    adds r0, r5, #0
    ands r0, r1
    cmp r0, #0
    bne .L0802DAD4
    b .L0802DBE6
.L0802DAD4:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0802DBC4
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F388
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0802DBBA
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F204
    cmp r0, #0
    bne .L0802DBBA
    ldr r1, [r6, #0x38]
    adds r1, #0x54
    mov r0, sp
    bl func_0800F20C
    ldr r5, [r6, #0x14]
    mov r0, sp
    bl GetStaminaGain__C4Food
    adds r4, r0, #0
    mov r0, sp
    bl GetFatigueGain__C4Food
    adds r2, r0, #0
    ldr r3, [r5, #0x64]
    adds r0, r6, #0
    adds r1, r4, #0
    bl _call_via_r3
    mov r0, sp
    bl IsDrink__C4Food
    cmp r0, #0
    bne .L0802DB6E
    adds r1, r6, #0
    adds r1, #0x3c
    movs r0, #0xf
    strb r0, [r1]
    ldr r0, [r6]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    beq .L0802DB5E
.L0802DB4C:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802DAC4
    adds r4, #4
    cmp r4, r5
    bne .L0802DB4C
.L0802DB5E:
    subs r0, r5, #4
    ldr r0, [r0]
.L0802DB62:
    movs r1, #0x65
    bl func_08008B6C
    b .L0802DBAA
.L0802DB6A:
    ldr r0, [r4]
    b .L0802DBA4
.L0802DB6E:
    adds r1, r6, #0
    adds r1, #0x3c
    movs r0, #0x10
    strb r0, [r1]
    ldr r0, [r6]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    beq .L0802DBA0
.L0802DB8E:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802DB6A
    adds r4, #4
    cmp r4, r5
    bne .L0802DB8E
.L0802DBA0:
    subs r0, r5, #4
    ldr r0, [r0]
.L0802DBA4:
    movs r1, #0x66
    bl func_08008B6C
.L0802DBAA:
    adds r0, r6, #0
    bl func_0802A7D8
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F390
    b .L0802DBE6
.L0802DBBA:
    adds r1, r6, #0
    adds r1, #0x3c
    movs r0, #0
    strb r0, [r1]
    b .L0802DBE6
.L0802DBC4:
    adds r0, r6, #0
    movs r1, #0
    bl func_08025A40
    b .L0802DBE6
.L0802DBCE:
    ldrb r1, [r2, #1]
    movs r0, #1
    ands r0, r1
    cmp r0, #0
    beq .L0802DBE6
    adds r0, r6, #0
    adds r0, #0x3c
    strb r3, [r0]
    b .L0802DBE6
.L0802DBE0:
    adds r0, r6, #0
    adds r0, #0x3c
    strb r1, [r0]
.L0802DBE6:
    add sp, #0x1c
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_0802DBF0
func_0802DBF0: @ 0x0802DBF0
    push {r4, r5, r6, lr}
    sub sp, #0xc
    adds r6, r0, #0
    movs r2, #0
    str r2, [sp, #4]
    str r2, [sp, #8]
    cmp r1, #0
    beq .L0802DC08
    ldrh r0, [r1]
    str r0, [sp, #4]
    ldrh r0, [r1, #4]
    str r0, [sp, #8]
.L0802DC08:
    adds r0, r6, #0
    adds r0, #0xc3
    ldrb r0, [r0]
    cmp r0, #0
    beq .L0802DC14
    b .L0802DE26
.L0802DC14:
    add r0, sp, #4
    ldrb r1, [r0, #1]
    movs r5, #2
    adds r0, r5, #0
    ands r0, r1
    cmp r0, #0
    bne .L0802DC24
    b .L0802DE32
.L0802DC24:
    ldr r2, [sp, #8]
    lsls r1, r2, #0x19
    lsrs r1, r1, #0x1f
    lsls r0, r2, #0x1a
    lsrs r0, r0, #0x1f
    orrs r1, r0
    cmp r1, #0
    beq .L0802DC84
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    lsrs r1, r0, #0x18
    cmp r1, #0
    bne .L0802DC46
    b .L0802DE86
.L0802DC46:
    adds r1, r6, #0
    adds r1, #0x3c
    movs r0, #0x16
    strb r0, [r1]
    adds r1, #0x3d
    movs r0, #1
    strb r0, [r1]
    ldr r0, [r6]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    bne .L0802DC6E
    b .L0802DE7A
.L0802DC6E:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0802DC7C
    b .L0802DE2E
.L0802DC7C:
    adds r4, #4
    cmp r4, r5
    bne .L0802DC6E
    b .L0802DE7A
.L0802DC84:
    lsls r1, r2, #0x18
    lsrs r1, r1, #0x1f
    lsls r0, r2, #0x1b
    lsrs r0, r0, #0x1f
    orrs r1, r0
    cmp r1, #0
    beq .L0802DCE2
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    lsrs r1, r0, #0x18
    cmp r1, #0
    bne .L0802DCA4
    b .L0802DE86
.L0802DCA4:
    adds r1, r6, #0
    adds r1, #0x3c
    movs r0, #0x16
    strb r0, [r1]
    adds r0, r6, #0
    adds r0, #0x79
    strb r5, [r0]
    ldr r0, [r6]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    bne .L0802DCCC
    b .L0802DE7A
.L0802DCCC:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0802DCDA
    b .L0802DE2E
.L0802DCDA:
    adds r4, #4
    cmp r4, r5
    bne .L0802DCCC
    b .L0802DE7A
.L0802DCE2:
    add r3, sp, #8
    ldrb r1, [r3]
    movs r4, #1
    adds r0, r4, #0
    ands r0, r1
    cmp r0, #0
    beq .L0802DD12
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802DD08
    adds r0, r6, #0
    movs r1, #1
    bl func_08025838
    b .L0802DE8C
.L0802DD08:
    adds r0, r6, #0
    movs r1, #1
    bl func_080257D0
    b .L0802DE8C
.L0802DD12:
    adds r0, r5, #0
    ands r0, r1
    lsls r0, r0, #0x18
    lsrs r2, r0, #0x18
    cmp r2, #0
    beq .L0802DE1C
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802DD3A
    adds r0, r6, #0
    movs r1, #0
    bl func_08025A40
    b .L0802DE8C
.L0802DD36:
    ldr r0, [r4]
    b .L0802DDBA
.L0802DD3A:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F388
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0802DE12
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F204
    cmp r0, #0
    bne .L0802DE12
    ldr r1, [r6, #0x38]
    adds r1, #0x54
    mov r0, sp
    bl func_0800F20C
    ldr r5, [r6, #0x14]
    mov r0, sp
    bl GetStaminaGain__C4Food
    adds r4, r0, #0
    mov r0, sp
    bl GetFatigueGain__C4Food
    adds r2, r0, #0
    ldr r3, [r5, #0x64]
    adds r0, r6, #0
    adds r1, r4, #0
    bl _call_via_r3
    mov r0, sp
    bl IsDrink__C4Food
    cmp r0, #0
    bne .L0802DDC6
    adds r1, r6, #0
    adds r1, #0x3c
    movs r0, #0xf
    strb r0, [r1]
    ldr r0, [r6]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    beq .L0802DDB6
.L0802DDA4:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802DD36
    adds r4, #4
    cmp r4, r5
    bne .L0802DDA4
.L0802DDB6:
    subs r0, r5, #4
    ldr r0, [r0]
.L0802DDBA:
    movs r1, #0x65
    bl func_08008B6C
    b .L0802DE02
.L0802DDC2:
    ldr r0, [r4]
    b .L0802DDFC
.L0802DDC6:
    adds r1, r6, #0
    adds r1, #0x3c
    movs r0, #0x10
    strb r0, [r1]
    ldr r0, [r6]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    beq .L0802DDF8
.L0802DDE6:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802DDC2
    adds r4, #4
    cmp r4, r5
    bne .L0802DDE6
.L0802DDF8:
    subs r0, r5, #4
    ldr r0, [r0]
.L0802DDFC:
    movs r1, #0x66
    bl func_08008B6C
.L0802DE02:
    adds r0, r6, #0
    bl func_0802A7D8
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F390
    b .L0802DE8C
.L0802DE12:
    adds r1, r6, #0
    adds r1, #0x3c
    movs r0, #0
    strb r0, [r1]
    b .L0802DE8C
.L0802DE1C:
    ldrb r1, [r3, #1]
    adds r0, r4, #0
    ands r0, r1
    cmp r0, #0
    beq .L0802DE8C
.L0802DE26:
    adds r0, r6, #0
    adds r0, #0x3c
    strb r2, [r0]
    b .L0802DE8C
.L0802DE2E:
    ldr r0, [r4]
    b .L0802DE7E
.L0802DE32:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    lsrs r1, r0, #0x18
    cmp r1, #0
    beq .L0802DE86
    adds r1, r6, #0
    adds r1, #0x3c
    movs r0, #0x16
    strb r0, [r1]
    adds r1, #0x3d
    movs r0, #3
    strb r0, [r1]
    ldr r0, [r6]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    beq .L0802DE7A
.L0802DE68:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802DE2E
    adds r4, #4
    cmp r4, r5
    bne .L0802DE68
.L0802DE7A:
    subs r0, r5, #4
    ldr r0, [r0]
.L0802DE7E:
    movs r1, #0x67
    bl func_08008B6C
    b .L0802DE8C
.L0802DE86:
    adds r0, r6, #0
    adds r0, #0x3c
    strb r1, [r0]
.L0802DE8C:
    add sp, #0xc
    pop {r4, r5, r6}
    pop {r0}
    bx r0

    thumb_func_start func_0802DE94
func_0802DE94: @ 0x0802DE94
    push {r4, r5, r6, lr}
    sub sp, #0x10
    adds r6, r0, #0
    movs r2, #0
    str r2, [sp, #4]
    cmp r1, #0
    beq .L0802DEA8
    ldrh r2, [r1]
    ldrh r0, [r1, #4]
    str r0, [sp, #4]
.L0802DEA8:
    adds r0, r6, #0
    adds r0, #0xc3
    ldrb r0, [r0]
    cmp r0, #0
    beq .L0802DEB4
    b .L0802E0AE
.L0802DEB4:
    movs r5, #2
    ands r2, r5
    lsls r0, r2, #0x18
    lsrs r4, r0, #0x18
    cmp r4, #0
    bne .L0802DEC2
    b .L0802E0B8
.L0802DEC2:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802DED6
    adds r0, r6, #0
    bl func_0802C908
.L0802DED6:
    ldr r2, [sp, #4]
    lsls r1, r2, #0x19
    lsrs r1, r1, #0x1f
    lsls r0, r2, #0x18
    lsrs r0, r0, #0x1f
    orrs r1, r0
    lsls r0, r2, #0x1a
    lsrs r0, r0, #0x1f
    orrs r0, r1
    lsls r2, r2, #0x1b
    lsrs r2, r2, #0x1f
    orrs r2, r0
    cmp r2, #0
    beq .L0802DF70
    add r0, sp, #4
    ldrb r1, [r0]
    movs r0, #0x20
    ands r0, r1
    cmp r0, #0
    beq .L0802DF14
    adds r0, r6, #0
    adds r0, #0x20
    ldrb r0, [r0]
    cmp r0, #2
    bne .L0802DF0A
    b .L0802E0F2
.L0802DF0A:
    adds r0, r6, #0
    movs r1, #2
    bl SetAnimFacing__12AActorEntityUi
    b .L0802E0F2
.L0802DF14:
    movs r0, #0x10
    ands r0, r1
    cmp r0, #0
    beq .L0802DF32
    adds r0, r6, #0
    adds r0, #0x20
    ldrb r0, [r0]
    cmp r0, #3
    bne .L0802DF28
    b .L0802E0F2
.L0802DF28:
    adds r0, r6, #0
    movs r1, #3
    bl SetAnimFacing__12AActorEntityUi
    b .L0802E0F2
.L0802DF32:
    movs r0, #0x40
    ands r0, r1
    cmp r0, #0
    beq .L0802DF50
    adds r0, r6, #0
    adds r0, #0x20
    ldrb r0, [r0]
    cmp r0, #1
    bne .L0802DF46
    b .L0802E0F2
.L0802DF46:
    adds r0, r6, #0
    movs r1, #1
    bl SetAnimFacing__12AActorEntityUi
    b .L0802E0F2
.L0802DF50:
    movs r0, #0x80
    ands r0, r1
    cmp r0, #0
    bne .L0802DF5A
    b .L0802E0F2
.L0802DF5A:
    adds r0, r6, #0
    adds r0, #0x20
    ldrb r0, [r0]
    cmp r0, #0
    bne .L0802DF66
    b .L0802E0F2
.L0802DF66:
    adds r0, r6, #0
    movs r1, #0
    bl SetAnimFacing__12AActorEntityUi
    b .L0802E0F2
.L0802DF70:
    add r1, sp, #4
    ldrb r3, [r1, #1]
    movs r0, #1
    adds r4, r0, #0
    ands r4, r3
    cmp r4, #0
    beq .L0802DF86
    adds r0, r6, #0
    adds r0, #0x3c
    strb r2, [r0]
    b .L0802E0F2
.L0802DF86:
    ldrb r1, [r1]
    ands r0, r1
    cmp r0, #0
    beq .L0802DFB0
    ldr r0, [r6]
    ldr r3, [r0]
    movs r1, #0xa0
    lsls r1, r1, #1
    adds r3, r3, r1
    add r1, sp, #8
    ldr r2, .L0802DFAC @ =0x000003CE
    str r2, [sp, #8]
    str r4, [r1, #4]
    ldr r3, [r3]
    movs r2, #0
    bl _call_via_r3
    b .L0802E0D8
    .align 2, 0
.L0802DFAC: .4byte 0x000003CE
.L0802DFB0:
    adds r0, r5, #0
    ands r0, r3
    cmp r0, #0
    bne .L0802DFBA
    b .L0802E0F2
.L0802DFBA:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802DFD6
    adds r0, r6, #0
    movs r1, #0
    bl func_08025A40
    b .L0802E0F2
.L0802DFD2:
    ldr r0, [r4]
    b .L0802E056
.L0802DFD6:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F388
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0802E0AE
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F204
    cmp r0, #0
    bne .L0802E0AE
    ldr r1, [r6, #0x38]
    adds r1, #0x54
    mov r0, sp
    bl func_0800F20C
    ldr r5, [r6, #0x14]
    mov r0, sp
    bl GetStaminaGain__C4Food
    adds r4, r0, #0
    mov r0, sp
    bl GetFatigueGain__C4Food
    adds r2, r0, #0
    ldr r3, [r5, #0x64]
    adds r0, r6, #0
    adds r1, r4, #0
    bl _call_via_r3
    mov r0, sp
    bl IsDrink__C4Food
    cmp r0, #0
    bne .L0802E062
    adds r1, r6, #0
    adds r1, #0x3c
    movs r0, #0xf
    strb r0, [r1]
    ldr r0, [r6]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    beq .L0802E052
.L0802E040:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802DFD2
    adds r4, #4
    cmp r4, r5
    bne .L0802E040
.L0802E052:
    subs r0, r5, #4
    ldr r0, [r0]
.L0802E056:
    movs r1, #0x65
    bl func_08008B6C
    b .L0802E09E
.L0802E05E:
    ldr r0, [r4]
    b .L0802E098
.L0802E062:
    adds r1, r6, #0
    adds r1, #0x3c
    movs r0, #0x10
    strb r0, [r1]
    ldr r0, [r6]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    beq .L0802E094
.L0802E082:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802E05E
    adds r4, #4
    cmp r4, r5
    bne .L0802E082
.L0802E094:
    subs r0, r5, #4
    ldr r0, [r0]
.L0802E098:
    movs r1, #0x66
    bl func_08008B6C
.L0802E09E:
    adds r0, r6, #0
    bl func_0802A7D8
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F390
    b .L0802E0F2
.L0802E0AE:
    adds r1, r6, #0
    adds r1, #0x3c
    movs r0, #0
    strb r0, [r1]
    b .L0802E0F2
.L0802E0B8:
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0802E0CE
    adds r0, r6, #0
    bl func_080258A0
    b .L0802E0F2
.L0802E0CE:
    adds r0, r6, #0
    adds r0, #0x3f
    ldrb r0, [r0]
    cmp r0, #0xf
    bne .L0802E0E0
.L0802E0D8:
    adds r0, r6, #0
    adds r0, #0x3c
    strb r4, [r0]
    b .L0802E0F2
.L0802E0E0:
    cmp r0, #0xe
    bne .L0802E0EC
    adds r0, r6, #0
    bl func_0802C860
    b .L0802E0F2
.L0802E0EC:
    adds r0, r6, #0
    bl func_0802C2E0
.L0802E0F2:
    add sp, #0x10
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_0802E0FC
func_0802E0FC: @ 0x0802E0FC
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #0x84
    adds r7, r0, #0
    movs r2, #0
    str r2, [sp, #0x28]
    cmp r1, #0
    beq .L0802E118
    ldrh r2, [r1]
    ldrh r0, [r1, #4]
    str r0, [sp, #0x28]
.L0802E118:
    adds r0, r7, #0
    adds r0, #0xc3
    ldrb r4, [r0]
    cmp r4, #0
    beq .L0802E12E
    adds r1, r7, #0
    adds r1, #0x3c
    movs r0, #0
    strb r0, [r1]
    bl .L0802EBE6
.L0802E12E:
    movs r5, #1
    adds r0, r5, #0
    ands r0, r2
    cmp r0, #0
    beq .L0802E1BA
    add r2, sp, #0x28
    ldrb r1, [r2]
    movs r3, #2
    adds r0, r3, #0
    ands r0, r1
    cmp r0, #0
    beq .L0802E170
    ldr r0, [r7]
    ldr r3, [r0]
    movs r1, #0xa0
    lsls r1, r1, #1
    adds r3, r3, r1
    add r1, sp, #0x20
    ldr r2, .L0802E16C @ =0x000003CE
    str r2, [sp, #0x20]
    str r4, [r1, #4]
    ldr r3, [r3]
    movs r2, #0
    bl _call_via_r3
    adds r0, r7, #0
    adds r0, #0x3c
    strb r4, [r0]
    bl .L0802EBE6
    .align 2, 0
.L0802E16C: .4byte 0x000003CE
.L0802E170:
    ldrb r1, [r2, #1]
    adds r0, r3, #0
    ands r0, r1
    lsls r0, r0, #0x18
    lsrs r2, r0, #0x18
    cmp r2, #0
    beq .L0802E1A4
    ldr r0, [r7, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0802E198
    adds r0, r7, #0
    movs r1, #1
    bl func_080257D0
    bl .L0802EBE6
.L0802E198:
    adds r0, r7, #0
    movs r1, #0
    bl func_08025838
    bl .L0802EBE6
.L0802E1A4:
    adds r0, r5, #0
    ands r0, r1
    cmp r0, #0
    bne .L0802E1B0
    bl .L0802EBE6
.L0802E1B0:
    adds r0, r7, #0
    adds r0, #0x3c
    strb r2, [r0]
    bl .L0802EBE6
.L0802E1BA:
    adds r5, r7, #0
    adds r5, #0x3c
    strb r0, [r5]
    ldr r2, [r7]
    mov sb, r2
    mov r0, sp
    adds r1, r7, #0
    bl GetLocation__C7AEntity
    mov r3, sp
    str r3, [sp, #0x68]
    adds r4, r7, #0
    adds r4, #0x20
    ldrb r2, [r4]
    add r0, sp, #0x2c
    adds r1, r7, #0
    bl func_0802AB98
    ldr r0, [sp, #0x2c]
    ldr r1, [sp, #0x30]
    str r0, [sp, #0x34]
    str r1, [sp, #0x38]
    add r2, sp, #0x34
    mov r1, sb
    ldr r0, [r1]
    movs r3, #0x9a
    lsls r3, r3, #1
    adds r0, r0, r3
    ldr r3, [r0]
    mov r0, sb
    mov r1, sp
    bl _call_via_r3
    adds r6, r0, #0
    movs r0, #0
    str r0, [sp, #0x6c]
    movs r1, #0
    str r1, [sp, #0x70]
    adds r0, r6, #0
    subs r0, #0x2b
    str r5, [sp, #0x7c]
    str r4, [sp, #0x78]
    cmp r0, #0x39
    bls .L0802E214
    b .L0802E792
.L0802E214:
    lsls r0, r0, #2
    ldr r1, .L0802E220 @ =.L0802E224
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L0802E220: .4byte .L0802E224
.L0802E224: @ jump table
    .4byte .L0802E516 @ case 0
    .4byte .L0802E30C @ case 1
    .4byte .L0802E792 @ case 2
    .4byte .L0802E60C @ case 3
    .4byte .L0802E60C @ case 4
    .4byte .L0802E60C @ case 5
    .4byte .L0802E60C @ case 6
    .4byte .L0802E60C @ case 7
    .4byte .L0802E60C @ case 8
    .4byte .L0802E60C @ case 9
    .4byte .L0802E60C @ case 10
    .4byte .L0802E65A @ case 11
    .4byte .L0802E65A @ case 12
    .4byte .L0802E65A @ case 13
    .4byte .L0802E65A @ case 14
    .4byte .L0802E65A @ case 15
    .4byte .L0802E65A @ case 16
    .4byte .L0802E65A @ case 17
    .4byte .L0802E65A @ case 18
    .4byte .L0802E65A @ case 19
    .4byte .L0802E65A @ case 20
    .4byte .L0802E65A @ case 21
    .4byte .L0802E65A @ case 22
    .4byte .L0802E65A @ case 23
    .4byte .L0802E65A @ case 24
    .4byte .L0802E65A @ case 25
    .4byte .L0802E65A @ case 26
    .4byte .L0802E792 @ case 27
    .4byte .L0802E792 @ case 28
    .4byte .L0802E792 @ case 29
    .4byte .L0802E792 @ case 30
    .4byte .L0802E55C @ case 31
    .4byte .L0802E740 @ case 32
    .4byte .L0802E680 @ case 33
    .4byte .L0802E680 @ case 34
    .4byte .L0802E680 @ case 35
    .4byte .L0802E680 @ case 36
    .4byte .L0802E680 @ case 37
    .4byte .L0802E680 @ case 38
    .4byte .L0802E680 @ case 39
    .4byte .L0802E680 @ case 40
    .4byte .L0802E792 @ case 41
    .4byte .L0802E792 @ case 42
    .4byte .L0802E792 @ case 43
    .4byte .L0802E792 @ case 44
    .4byte .L0802E792 @ case 45
    .4byte .L0802E792 @ case 46
    .4byte .L0802E792 @ case 47
    .4byte .L0802E792 @ case 48
    .4byte .L0802E792 @ case 49
    .4byte .L0802E792 @ case 50
    .4byte .L0802E792 @ case 51
    .4byte .L0802E792 @ case 52
    .4byte .L0802E792 @ case 53
    .4byte .L0802E792 @ case 54
    .4byte .L0802E792 @ case 55
    .4byte .L0802E792 @ case 56
    .4byte .L0802E7BA @ case 57
.L0802E30C:
    ldr r0, [r7, #0x34]
    adds r0, #0x14
    bl GetHorse__4Farm
    bl GetGrowthStage__C5Horse
    cmp r0, #1
    beq .L0802E31E
    b .L0802E510
.L0802E31E:
    ldr r0, [r7, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0802E32E
    b .L0802E486
.L0802E32E:
    ldrh r2, [r7, #4]
    add r3, sp, #8
    mov r8, r3
    mov r5, sb
    ldr r1, [r5]
    mov r0, r8
    ldr r3, [r1, #0x34]
    mov r1, sb
    bl _call_via_r3
    movs r0, #0xa
    ldrsh r5, [r7, r0]
    movs r1, #0xe
    ldrsh r4, [r7, r1]
    add r1, sp, #0x3c
    subs r0, r5, #7
    strh r0, [r1]
    adds r0, r4, #0
    subs r0, #9
    strh r0, [r1, #2]
    adds r0, r5, #7
    strh r0, [r1, #4]
    adds r0, r4, #5
    strh r0, [r1, #6]
    ldr r0, [sp, #0x3c]
    ldr r1, [sp, #0x40]
    str r0, [sp, #0x44]
    str r1, [sp, #0x48]
    add r6, sp, #0x44
    mov r0, r8
    adds r1, r6, #0
    bl func_080AC070
    movs r2, #1
    mov sl, r2
    mov r3, sl
    eors r0, r3
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0802E3C0
    add r0, sp, #0x4c
    mov r1, r8
    adds r2, r6, #0
    bl func_08024724
    ldr r0, [sp, #0x4c]
    str r0, [sp, #0x50]
    add r1, sp, #0x50
    movs r2, #0
    ldrsh r0, [r1, r2]
    adds r5, r5, r0
    movs r3, #2
    ldrsh r0, [r1, r3]
    adds r4, r4, r0
    add r1, sp, #0x54
    subs r0, r5, #7
    strh r0, [r1]
    adds r0, r4, #0
    subs r0, #9
    strh r0, [r1, #2]
    adds r0, r5, #7
    strh r0, [r1, #4]
    adds r0, r4, #5
    strh r0, [r1, #6]
    mov r0, r8
    bl func_080AC070
    mov r1, sl
    eors r0, r1
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0802E3C0
    b .L0802E7BA
.L0802E3C0:
    lsls r6, r5, #0x10
    lsls r4, r4, #0x10
    mov r8, r4
    mov r2, sb
    ldr r0, [r2]
    ldr r2, [r0, #0x40]
    mov r0, sb
    movs r1, #0x2c
    bl _call_via_r2
    adds r4, r0, #0
    bl func_08021EE0
    str r6, [r4, #8]
    mov r3, r8
    str r3, [r4, #0xc]
    movs r5, #0
    str r5, [r4, #0x18]
    str r5, [r4, #0x1c]
    ldr r1, [sp, #0x78]
    ldrb r0, [r1]
    cmp r0, #1
    beq .L0802E402
    cmp r0, #1
    bgt .L0802E3F8
    cmp r0, #0
    beq .L0802E416
    b .L0802E450
.L0802E3F8:
    cmp r0, #2
    beq .L0802E42A
    cmp r0, #3
    beq .L0802E43E
    b .L0802E450
.L0802E402:
    adds r0, r4, #0
    adds r0, #0x20
    ldrb r0, [r0]
    cmp r0, #3
    beq .L0802E450
    adds r0, r4, #0
    movs r1, #3
    bl SetAnimFacing__12AActorEntityUi
    b .L0802E450
.L0802E416:
    adds r0, r4, #0
    adds r0, #0x20
    ldrb r0, [r0]
    cmp r0, #2
    beq .L0802E450
    adds r0, r4, #0
    movs r1, #2
    bl SetAnimFacing__12AActorEntityUi
    b .L0802E450
.L0802E42A:
    adds r0, r4, #0
    adds r0, #0x20
    ldrb r0, [r0]
    cmp r0, #1
    beq .L0802E450
    adds r0, r4, #0
    movs r1, #1
    bl SetAnimFacing__12AActorEntityUi
    b .L0802E450
.L0802E43E:
    adds r0, r4, #0
    adds r0, #0x20
    ldrb r0, [r0]
    cmp r0, #0
    beq .L0802E450
    adds r0, r4, #0
    movs r1, #0
    bl SetAnimFacing__12AActorEntityUi
.L0802E450:
    ldr r0, [r7, #8]
    adds r5, r7, #0
    adds r5, #0xb8
    subs r0, r6, r0
    movs r1, #0x18
    bl __divsi3
    str r0, [r5]
    ldr r0, [r7, #0xc]
    adds r4, r7, #0
    adds r4, #0xbc
    mov r2, r8
    subs r0, r2, r0
    movs r1, #0x18
    bl __divsi3
    str r0, [r4]
    ldr r0, [r5]
    str r0, [r7, #0x18]
    ldr r0, [r4]
    str r0, [r7, #0x1c]
    movs r3, #1
    str r3, [sp, #0x70]
    movs r0, #0x22
    ldr r5, [sp, #0x7c]
    strb r0, [r5]
    b .L0802E7BA
.L0802E486:
    adds r0, r7, #0
    bl func_080262C4
    add r4, sp, #0x5c
    strb r0, [r4]
    adds r0, r4, #0
    bl GetPrice__C7Product
    cmp r0, #0
    bne .L0802E49C
    b .L0802E7BA
.L0802E49C:
    ldr r5, [r7]
    ldr r0, [r5]
    movs r1, #0xae
    lsls r1, r1, #1
    adds r0, r0, r1
    ldr r2, [r0]
    adds r0, r5, #0
    adds r1, r4, #0
    bl _call_via_r2
    movs r0, #0xe
    ldr r2, [sp, #0x7c]
    strb r0, [r2]
    movs r3, #1
    str r3, [sp, #0x70]
    ldr r0, [r5]
    ldr r2, [r0, #0x40]
    adds r0, r5, #0
    movs r1, #0x2c
    bl _call_via_r2
    adds r4, r0, #0
    cmp r4, #0
    beq .L0802E4E4
    ldr r0, [r4, #0x14]
    adds r0, #0x88
    ldr r2, [r0]
    adds r0, r4, #0
    movs r1, #0x3c
    bl _call_via_r2
    adds r0, r4, #0
    movs r1, #5
    movs r2, #0
    bl func_08032384
.L0802E4E4:
    ldr r0, [r5]
    movs r1, #0xa6
    lsls r1, r1, #1
    adds r0, r0, r1
    ldr r1, [r0]
    adds r0, r5, #0
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    beq .L0802E5F6
.L0802E4FC:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802E57E
    adds r4, #4
    cmp r4, r5
    bne .L0802E4FC
    b .L0802E5F6
.L0802E510:
    movs r2, #9
    str r2, [sp, #0x6c]
    b .L0802E7BA
.L0802E516:
    ldr r0, [r7, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0802E526
    b .L0802E7BA
.L0802E526:
    ldr r4, [r7]
    ldr r0, [r4]
    ldr r2, [r0, #0x40]
    adds r0, r4, #0
    adds r1, r6, #0
    bl _call_via_r2
    adds r1, r0, #0
    cmp r1, #0
    beq .L0802E548
    ldr r0, [r1, #0x14]
    adds r0, #0x88
    ldr r2, [r0]
    adds r0, r1, #0
    movs r1, #0x3c
    bl _call_via_r2
.L0802E548:
    ldr r0, [r4]
    ldr r2, [r0, #0x3c]
    adds r0, r4, #0
    adds r1, r6, #0
    bl _call_via_r2
    adds r0, r7, #0
    bl func_08025E38
    b .L0802EBE6
.L0802E55C:
    ldr r0, [r7, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802E582
    ldr r0, [r7]
    ldr r1, [r0]
    ldr r2, [r1, #0x3c]
    adds r1, r6, #0
    bl _call_via_r2
    adds r0, r7, #0
    bl func_08025FC4
    b .L0802EBE6
.L0802E57E:
    ldr r0, [r4]
    b .L0802E5FA
.L0802E582:
    adds r0, r7, #0
    bl func_080262C4
    mov r4, sp
    adds r4, #0x5d
    strb r0, [r4]
    adds r0, r4, #0
    bl GetPrice__C7Product
    cmp r0, #0
    bne .L0802E59A
    b .L0802E7BA
.L0802E59A:
    ldr r0, [r7]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x4a
    bl _call_via_r2
    adds r5, r0, #0
    ldr r0, [r5, #0x18]
    bl func_0800FFD0
    movs r1, #0
    cmp r0, #0x1e
    bne .L0802E5B6
    movs r1, #1
.L0802E5B6:
    cmp r1, #0
    bne .L0802E602
    adds r0, r5, #0
    adds r1, r4, #0
    bl func_08037EB4
    movs r0, #0xe
    ldr r3, [sp, #0x7c]
    strb r0, [r3]
    movs r5, #1
    str r5, [sp, #0x70]
    ldr r0, [r7]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    beq .L0802E5F6
.L0802E5E4:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802E57E
    adds r4, #4
    cmp r4, r5
    bne .L0802E5E4
.L0802E5F6:
    subs r0, r5, #4
    ldr r0, [r0]
.L0802E5FA:
    movs r1, #0x6e
    bl func_08008B6C
    b .L0802E7BA
.L0802E602:
    ldr r3, .L0802E608 @ =0x000003CD
    str r3, [sp, #0x6c]
    b .L0802E7BA
    .align 2, 0
.L0802E608: .4byte 0x000003CD
.L0802E60C:
    ldr r0, [r7, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0802E61C
    b .L0802E7BA
.L0802E61C:
    ldr r4, [r7]
    ldr r0, [r4]
    ldr r2, [r0, #0x40]
    adds r0, r4, #0
    adds r1, r6, #0
    bl _call_via_r2
    adds r1, r0, #0
    cmp r1, #0
    beq .L0802E63E
    ldr r0, [r1, #0x14]
    adds r0, #0x88
    ldr r2, [r0]
    adds r0, r1, #0
    movs r1, #0x3c
    bl _call_via_r2
.L0802E63E:
    ldr r0, [r4]
    ldr r2, [r0, #0x3c]
    adds r0, r4, #0
    adds r1, r6, #0
    bl _call_via_r2
    adds r1, r6, #0
    subs r1, #0x2e
    lsls r1, r1, #0x18
    lsrs r1, r1, #0x18
    adds r0, r7, #0
    bl func_08025EFC
    b .L0802EBE6
.L0802E65A:
    adds r1, r6, #0
    subs r1, #0x36
    adds r0, r7, #0
    adds r0, #0xb1
    strb r1, [r0]
    ldr r0, [r7, #0x34]
    movs r5, #0xbe
    lsls r5, r5, #3
    adds r0, r0, r5
    bl GetCow__4BarnUi
    movs r1, #0xd
    str r1, [sp, #0x6c]
    cmp r0, #0
    bne .L0802E67A
    b .L0802E7BA
.L0802E67A:
    movs r2, #8
    str r2, [sp, #0x6c]
    b .L0802E7BA
.L0802E680:
    ldr r0, [r7, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0802E690
    b .L0802E7BA
.L0802E690:
    adds r4, r6, #0
    subs r4, #0x4c
    ldr r0, [r7, #0x34]
    movs r3, #0x82
    lsls r3, r3, #3
    adds r0, r0, r3
    adds r1, r4, #0
    bl GetEgg__C4CoopUi
    cmp r0, #0
    bne .L0802E6A8
    b .L0802E7BA
.L0802E6A8:
    ldrb r0, [r0, #6]
    lsls r0, r0, #0x1d
    lsrs r0, r0, #0x1d
    movs r5, #0xf
    mov r8, r5
    cmp r0, #5
    bhi .L0802E6FC
    lsls r0, r0, #2
    ldr r1, .L0802E6C0 @ =.L0802E6C4
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L0802E6C0: .4byte .L0802E6C4
.L0802E6C4: @ jump table
    .4byte .L0802E6DC @ case 0
    .4byte .L0802E6E0 @ case 1
    .4byte .L0802E6E6 @ case 2
    .4byte .L0802E6EC @ case 3
    .4byte .L0802E6F2 @ case 4
    .4byte .L0802E6F8 @ case 5
.L0802E6DC:
    movs r0, #0xf
    b .L0802E6FA
.L0802E6E0:
    movs r1, #0x10
    mov r8, r1
    b .L0802E6FC
.L0802E6E6:
    movs r2, #0x11
    mov r8, r2
    b .L0802E6FC
.L0802E6EC:
    movs r3, #0x12
    mov r8, r3
    b .L0802E6FC
.L0802E6F2:
    movs r5, #0x13
    mov r8, r5
    b .L0802E6FC
.L0802E6F8:
    movs r0, #0x14
.L0802E6FA:
    mov r8, r0
.L0802E6FC:
    ldr r0, [r7]
    ldr r1, [r0]
    ldr r2, [r1, #0x3c]
    adds r1, r6, #0
    bl _call_via_r2
    ldr r0, [r7, #0x34]
    movs r1, #0x82
    lsls r1, r1, #3
    adds r0, r0, r1
    adds r1, r4, #0
    bl method_0800C9B8__4CoopUi
    add r5, sp, #8
    add r4, sp, #0xc
    adds r0, r4, #0
    mov r1, r8
    bl __4FoodUi
    ldrb r1, [r4]
    mov r0, sp
    adds r0, #0xd
    ldrb r0, [r0]
    lsls r0, r0, #8
    orrs r0, r1
    mov r1, sp
    adds r1, #0xe
    ldrb r1, [r1]
    lsls r1, r1, #0x10
    orrs r1, r0
    adds r0, r5, #0
    bl __12RucksackItemG4Food
    b .L0802E786
.L0802E740:
    ldr r0, [r7, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802E7BA
    ldr r0, [r7]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x4b
    bl _call_via_r2
    bl func_08038108
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0802E7BA
    ldr r0, [r7]
    ldr r1, [r0]
    ldr r2, [r1, #0x3c]
    adds r1, r6, #0
    bl _call_via_r2
    add r5, sp, #8
    mov r4, sp
    adds r4, #0x5e
    adds r0, r4, #0
    movs r1, #0x35
    bl __7ArticleUi
    ldrb r1, [r4]
    adds r0, r5, #0
    bl __12RucksackItemG7Article
.L0802E786:
    adds r0, r7, #0
    adds r1, r5, #0
    movs r2, #0
    bl func_08026150
    b .L0802EBE6
.L0802E792:
    ldr r0, [r7]
    ldr r1, [r0]
    movs r2, #0x96
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r2, [r1]
    adds r1, r6, #0
    bl _call_via_r2
    adds r2, r0, #0
    cmp r2, #0
    beq .L0802E7BA
    ldr r0, [r2, #0x14]
    ldr r1, [r0, #0x34]
    adds r0, r2, #0
    bl _call_via_r1
    lsls r0, r0, #0x10
    lsrs r0, r0, #0x10
    str r0, [sp, #0x6c]
.L0802E7BA:
    ldr r3, [sp, #0x70]
    cmp r3, #0
    beq .L0802E7C2
    b .L0802EBE6
.L0802E7C2:
    ldr r5, [sp, #0x6c]
    cmp r5, #0
    beq .L0802E7CA
    b .L0802E906
.L0802E7CA:
    add r4, sp, #8
    adds r0, r4, #0
    ldr r1, [sp, #0x68]
    movs r2, #6
    bl memcpy
    ldr r1, [sp, #0x78]
    ldrb r0, [r1]
    adds r1, r0, #0
    cmp r0, #1
    beq .L0802E7F4
    cmp r0, #1
    bgt .L0802E7EA
    cmp r0, #0
    beq .L0802E83C
    b .L0802E89A
.L0802E7EA:
    cmp r1, #2
    beq .L0802E87C
    cmp r1, #3
    beq .L0802E886
    b .L0802E89A
.L0802E7F4:
    mov r2, sp
    ldrb r3, [r2, #0xb]
    lsrs r0, r3, #2
    ldrh r1, [r2, #0xc]
    ldr r4, .L0802E830 @ =0x000003FF
    ands r1, r4
    lsls r1, r1, #6
    orrs r1, r0
    lsls r1, r1, #0x10
    ldr r5, .L0802E834 @ =0xFFF00000
    adds r1, r1, r5
    lsrs r2, r1, #0x10
    movs r0, #0x3f
    ands r2, r0
    lsls r2, r2, #2
    movs r0, #3
    ands r0, r3
    orrs r0, r2
    mov r2, sp
    strb r0, [r2, #0xb]
    lsrs r1, r1, #0x16
    ands r1, r4
    ldrh r2, [r2, #0xc]
    ldr r0, .L0802E838 @ =0xFFFFFC00
    ands r0, r2
    orrs r0, r1
    mov r3, sp
    strh r0, [r3, #0xc]
    b .L0802E89A
    .align 2, 0
.L0802E830: .4byte 0x000003FF
.L0802E834: .4byte 0xFFF00000
.L0802E838: .4byte 0xFFFFFC00
.L0802E83C:
    mov r5, sp
    ldrb r3, [r5, #0xb]
    lsrs r0, r3, #2
    ldrh r1, [r5, #0xc]
    ldr r4, .L0802E874 @ =0x000003FF
    ands r1, r4
    lsls r1, r1, #6
    orrs r1, r0
    lsls r1, r1, #0x10
    movs r0, #0x80
    lsls r0, r0, #0xd
    adds r1, r1, r0
    lsrs r2, r1, #0x10
    movs r0, #0x3f
    ands r2, r0
    lsls r2, r2, #2
    movs r0, #3
    ands r0, r3
    orrs r0, r2
    strb r0, [r5, #0xb]
    lsrs r1, r1, #0x16
    ands r1, r4
    ldrh r2, [r5, #0xc]
    ldr r0, .L0802E878 @ =0xFFFFFC00
    ands r0, r2
    orrs r0, r1
    strh r0, [r5, #0xc]
    b .L0802E89A
    .align 2, 0
.L0802E874: .4byte 0x000003FF
.L0802E878: .4byte 0xFFFFFC00
.L0802E87C:
    ldr r0, [sp, #8]
    lsls r1, r0, #6
    asrs r1, r1, #0x10
    subs r1, #0x10
    b .L0802E88E
.L0802E886:
    ldr r0, [sp, #8]
    lsls r1, r0, #6
    asrs r1, r1, #0x10
    adds r1, #0x10
.L0802E88E:
    lsls r1, r1, #0x10
    lsrs r1, r1, #6
    ldr r2, .L0802E8EC @ =0xFC0003FF
    ands r2, r0
    orrs r2, r1
    str r2, [sp, #8]
.L0802E89A:
    ldrh r2, [r7, #4]
    ldr r1, [r7]
    add r4, sp, #0x14
    ldr r3, [r1]
    adds r0, r4, #0
    ldr r3, [r3, #0x34]
    bl _call_via_r3
    ldr r0, [sp, #8]
    lsls r0, r0, #6
    asrs r5, r0, #0x13
    mov r1, sp
    ldrb r2, [r1, #0xb]
    lsrs r2, r2, #2
    ldrh r0, [r1, #0xc]
    ldr r1, .L0802E8F0 @ =0x000003FF
    ands r0, r1
    lsls r0, r0, #6
    orrs r0, r2
    lsls r0, r0, #0x10
    asrs r3, r0, #0x13
    ldr r2, [sp, #0x14]
    ldrh r0, [r4, #8]
    cmp r2, #0
    beq .L0802E8F4
    cmp r5, r0
    bhi .L0802E8F4
    ldrh r1, [r4, #0xa]
    cmp r3, r1
    bhi .L0802E8F4
    ldr r1, [r4, #4]
    muls r0, r3, r0
    adds r0, r0, r5
    cmp r1, #0
    beq .L0802E8E4
    adds r0, r1, r0
    ldrb r0, [r0]
.L0802E8E4:
    lsls r0, r0, #2
    adds r0, r2, r0
    b .L0802E8F6
    .align 2, 0
.L0802E8EC: .4byte 0xFC0003FF
.L0802E8F0: .4byte 0x000003FF
.L0802E8F4:
    movs r0, #0
.L0802E8F6:
    cmp r0, #0
    beq .L0802E900
    ldr r0, [r0]
    lsrs r0, r0, #0x11
    str r0, [sp, #0x6c]
.L0802E900:
    ldr r2, [sp, #0x6c]
    cmp r2, #0
    beq .L0802E928
.L0802E906:
    ldr r0, [r7]
    ldr r2, [r0]
    movs r3, #0xa0
    lsls r3, r3, #1
    adds r2, r2, r3
    add r1, sp, #0x60
    movs r4, #0
    ldr r5, [sp, #0x6c]
    str r5, [sp, #0x60]
    str r4, [r1, #4]
    ldr r3, [r2]
    movs r2, #0
    bl _call_via_r3
    ldr r0, [sp, #0x7c]
    strb r4, [r0]
    b .L0802EBE6
.L0802E928:
    ldr r0, [r7, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    lsrs r5, r0, #0x18
    cmp r5, #0
    beq .L0802E93A
    b .L0802EB14
.L0802E93A:
    adds r0, r7, #0
    bl ClassifyHeldItemAction__12FarmerEntity
    cmp r0, #1
    beq .L0802E9E8
    cmp r0, #1
    bgt .L0802E94E
    cmp r0, #0
    beq .L0802E95C
    b .L0802EBE6
.L0802E94E:
    cmp r0, #2
    bne .L0802E954
    b .L0802EBE6
.L0802E954:
    cmp r0, #3
    bne .L0802E95A
    b .L0802EA86
.L0802E95A:
    b .L0802EBE6
.L0802E95C:
    movs r0, #0xb
    ldr r1, [sp, #0x7c]
    strb r0, [r1]
    adds r1, r7, #0
    adds r1, #0x88
    movs r0, #0xa8
    lsls r0, r0, #0xd
    str r5, [r1, #4]
    str r5, [r1, #8]
    str r0, [r1, #0x14]
    ldr r2, [sp, #0x78]
    ldrb r4, [r2]
    cmp r4, #1
    beq .L0802E9A4
    cmp r4, #1
    bgt .L0802E982
    cmp r4, #0
    beq .L0802E9AC
    b .L0802E9B4
.L0802E982:
    cmp r4, #2
    beq .L0802E98C
    cmp r4, #3
    beq .L0802E998
    b .L0802E9B4
.L0802E98C:
    ldr r0, .L0802E994 @ =0xFFFE5556
    str r0, [r1, #0xc]
    str r5, [r1, #0x10]
    b .L0802E9B2
    .align 2, 0
.L0802E994: .4byte 0xFFFE5556
.L0802E998:
    ldr r0, .L0802E9A0 @ =0x0001AAAA
    str r0, [r1, #0xc]
    str r5, [r1, #0x10]
    b .L0802E9B2
    .align 2, 0
.L0802E9A0: .4byte 0x0001AAAA
.L0802E9A4:
    ldr r0, .L0802E9A8 @ =0xFFFE5556
    b .L0802E9AE
    .align 2, 0
.L0802E9A8: .4byte 0xFFFE5556
.L0802E9AC:
    ldr r0, .L0802E9E4 @ =0x0001AAAA
.L0802E9AE:
    str r5, [r1, #0xc]
    str r0, [r1, #0x10]
.L0802E9B2:
    str r5, [r1, #0x18]
.L0802E9B4:
    ldr r0, [r7]
    ldr r1, [r0]
    movs r3, #0xa6
    lsls r3, r3, #1
    adds r1, r1, r3
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    bne .L0802E9CE
    b .L0802EB02
.L0802E9CE:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802EA82
    adds r4, #4
    cmp r4, r5
    bne .L0802E9CE
    b .L0802EB02
    .align 2, 0
.L0802E9E4: .4byte 0x0001AAAA
.L0802E9E8:
    movs r0, #0xd
    ldr r1, [sp, #0x7c]
    strb r0, [r1]
    ldr r2, [sp, #0x78]
    ldrb r4, [r2]
    cmp r4, #1
    beq .L0802EA32
    cmp r4, #1
    bgt .L0802EA00
    cmp r4, #0
    beq .L0802EA44
    b .L0802EA56
.L0802EA00:
    cmp r4, #2
    beq .L0802EA0A
    cmp r4, #3
    beq .L0802EA20
    b .L0802EA56
.L0802EA0A:
    adds r0, r7, #0
    adds r0, #0x88
    ldr r1, .L0802EA1C @ =0xFFF60000
    movs r2, #0xc0
    lsls r2, r2, #0xc
    str r1, [r0, #4]
    str r5, [r0, #8]
    b .L0802EA54
    .align 2, 0
.L0802EA1C: .4byte 0xFFF60000
.L0802EA20:
    adds r0, r7, #0
    adds r0, #0x88
    movs r1, #0xa0
    lsls r1, r1, #0xc
    movs r2, #0xc0
    lsls r2, r2, #0xc
    str r1, [r0, #4]
    str r5, [r0, #8]
    b .L0802EA54
.L0802EA32:
    adds r0, r7, #0
    adds r0, #0x88
    ldr r1, .L0802EA40 @ =0xFFF60000
    movs r2, #0xc0
    lsls r2, r2, #0xc
    str r5, [r0, #4]
    b .L0802EA52
    .align 2, 0
.L0802EA40: .4byte 0xFFF60000
.L0802EA44:
    adds r0, r7, #0
    adds r0, #0x88
    movs r1, #0xa0
    lsls r1, r1, #0xc
    movs r2, #0xc0
    lsls r2, r2, #0xc
    str r4, [r0, #4]
.L0802EA52:
    str r1, [r0, #8]
.L0802EA54:
    str r2, [r0, #0x14]
.L0802EA56:
    ldr r0, [r7]
    ldr r1, [r0]
    movs r3, #0xa6
    lsls r3, r3, #1
    adds r1, r1, r3
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    beq .L0802EB02
.L0802EA6E:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802EA82
    adds r4, #4
    cmp r4, r5
    bne .L0802EA6E
    b .L0802EB02
.L0802EA82:
    ldr r0, [r4]
    b .L0802EB06
.L0802EA86:
    movs r0, #0xc
    ldr r5, [sp, #0x7c]
    strb r0, [r5]
    adds r0, r7, #0
    bl func_0802A7D8
    ldr r0, [r7, #0x38]
    adds r0, #0x54
    bl func_0800F390
    ldr r4, [r7, #0x34]
    ldr r0, .L0802EB10 @ =0x00001CCC
    adds r4, r4, r0
    add r0, sp, #8
    adds r1, r7, #0
    bl GetLocation__C7AEntity
    adds r0, r4, #0
    add r1, sp, #8
    movs r2, #6
    bl memcpy
    ldr r0, [r7]
    ldr r1, [r0]
    ldr r2, [r1, #0x38]
    movs r1, #0x4b
    bl _call_via_r2
    ldr r0, [r7]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x4b
    bl _call_via_r2
    cmp r0, #0
    bne .L0802EAD0
    b .L0802EBE6
.L0802EAD0:
    ldr r2, [sp, #0x78]
    ldrb r1, [r2]
    bl func_080380EC
    ldr r0, [r7]
    ldr r1, [r0]
    movs r3, #0xa6
    lsls r3, r3, #1
    adds r1, r1, r3
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    beq .L0802EB02
.L0802EAF0:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802EA82
    adds r4, #4
    cmp r4, r5
    bne .L0802EAF0
.L0802EB02:
    subs r0, r5, #4
    ldr r0, [r0]
.L0802EB06:
    movs r1, #0x6c
    bl func_08008B6C
    b .L0802EBE6
    .align 2, 0
.L0802EB10: .4byte 0x00001CCC
.L0802EB14:
    movs r0, #0xa
    ldrsh r5, [r7, r0]
    movs r2, #0xe
    ldrsh r1, [r7, r2]
    mov sl, r1
    ldr r3, [sp, #0x78]
    ldrb r4, [r3]
    cmp r4, #1
    beq .L0802EB3A
    cmp r4, #1
    bgt .L0802EB30
    cmp r4, #0
    beq .L0802EB42
    b .L0802EB4E
.L0802EB30:
    cmp r4, #2
    beq .L0802EB48
    cmp r4, #3
    beq .L0802EB4C
    b .L0802EB4E
.L0802EB3A:
    movs r0, #0x10
    rsbs r0, r0, #0
    add sl, r0
    b .L0802EB4E
.L0802EB42:
    movs r1, #0x10
    add sl, r1
    b .L0802EB4E
.L0802EB48:
    subs r5, #0x10
    b .L0802EB4E
.L0802EB4C:
    adds r5, #0x10
.L0802EB4E:
    add r0, sp, #8
    bl __12RucksackItem
    ldr r0, [r7]
    ldr r2, [r0]
    adds r2, #0xe0
    str r2, [sp, #0x74]
    ldrh r3, [r7, #4]
    add r1, sp, #0xc
    ldr r2, .L0802EBF8 @ =0x000003FF
    mov sb, r2
    mov r2, sb
    ands r3, r2
    ldrh r4, [r1]
    ldr r6, .L0802EBFC @ =0xFFFFFC00
    adds r2, r6, #0
    ands r2, r4
    orrs r2, r3
    strh r2, [r1]
    lsls r5, r5, #0x10
    lsrs r3, r5, #0x10
    movs r2, #0x3f
    mov ip, r2
    ands r3, r2
    lsls r3, r3, #2
    str r3, [sp, #0x80]
    ldrb r3, [r1, #1]
    mov r8, r3
    movs r4, #3
    adds r2, r4, #0
    mov r3, r8
    ands r2, r3
    ldr r3, [sp, #0x80]
    orrs r2, r3
    strb r2, [r1, #1]
    lsrs r5, r5, #0x16
    mov r2, sb
    ands r5, r2
    ldrh r3, [r1, #2]
    adds r2, r6, #0
    ands r2, r3
    orrs r2, r5
    strh r2, [r1, #2]
    mov r5, sl
    lsls r3, r5, #0x10
    lsrs r2, r3, #0x10
    mov r5, ip
    ands r2, r5
    lsls r2, r2, #2
    ldrb r5, [r1, #3]
    ands r4, r5
    orrs r4, r2
    strb r4, [r1, #3]
    lsrs r3, r3, #0x16
    mov r2, sb
    ands r3, r2
    ldrh r2, [r1, #4]
    ands r6, r2
    orrs r6, r3
    strh r6, [r1, #4]
    ldr r5, [sp, #0x74]
    ldr r3, [r5]
    add r2, sp, #8
    bl _call_via_r3
    add r0, sp, #8
    bl IsEmpty__C12RucksackItem
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0802EBE6
    adds r0, r7, #0
    add r1, sp, #8
    movs r2, #0
    bl func_08026150
.L0802EBE6:
    add sp, #0x84
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L0802EBF8: .4byte 0x000003FF
.L0802EBFC: .4byte 0xFFFFFC00

    thumb_func_start func_0802EC00
func_0802EC00: @ 0x0802EC00
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #0x14
    adds r7, r0, #0
    mov sb, r1
    adds r0, #0xc0
    movs r2, #0
    strb r2, [r0]
    subs r0, #0x46
    strb r2, [r0]
    adds r3, r7, #0
    adds r3, #0xc3
    ldrb r1, [r3]
    adds r4, r1, #0
    cmp r4, #0
    beq .L0802EC40
    subs r0, #0x3e
    strb r1, [r0]
    adds r1, r7, #0
    adds r1, #0xa6
    movs r0, #0
    strh r2, [r1]
    strb r0, [r3]
    ldr r0, [r7, #0x14]
    ldr r1, [r0, #0x6c]
    adds r0, r7, #0
    bl _call_via_r1
    b .L0802F0DC
.L0802EC40:
    adds r0, r7, #0
    bl func_0802AEA4
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802EC5A
    adds r0, r7, #0
    adds r0, #0x3c
    movs r1, #0x35
    strb r1, [r0]
    adds r0, #0x6a
    strh r4, [r0]
    b .L0802F0DC
.L0802EC5A:
    ldr r0, [r7, #0x38]
    adds r4, r0, #0
    adds r4, #0x54
    adds r0, r4, #0
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802EC6E
    b .L0802EDA2
.L0802EC6E:
    adds r0, r4, #0
    bl func_0800F204
    cmp r0, #5
    beq .L0802EC7A
    b .L0802EDA2
.L0802EC7A:
    adds r0, r4, #0
    bl func_0800F360
    adds r1, r0, #0
    ldr r0, .L0802ECA0 @ =0x00000155
    cmp r1, r0
    beq .L0802ED78
    cmp r1, r0
    bgt .L0802ECB8
    cmp r1, #0x6b
    beq .L0802ED78
    cmp r1, #0x6b
    bgt .L0802ECA4
    cmp r1, #0xb
    beq .L0802ED78
    cmp r1, #0x62
    beq .L0802ED78
    b .L0802EDA2
    .align 2, 0
.L0802ECA0: .4byte 0x00000155
.L0802ECA4:
    cmp r1, #0xf7
    beq .L0802ED78
    cmp r1, #0xf7
    bgt .L0802ECB2
    cmp r1, #0xd6
    beq .L0802ED82
    b .L0802EDA2
.L0802ECB2:
    movs r0, #0x91
    lsls r0, r0, #1
    b .L0802ECF2
.L0802ECB8:
    movs r0, #0xc6
    lsls r0, r0, #1
    cmp r1, r0
    beq .L0802ED78
    cmp r1, r0
    bgt .L0802ECDC
    subs r0, #0x25
    cmp r1, r0
    beq .L0802ED82
    cmp r1, r0
    bgt .L0802ECD6
    subs r0, #8
    cmp r1, r0
    beq .L0802ED00
    b .L0802EDA2
.L0802ECD6:
    movs r0, #0xc0
    lsls r0, r0, #1
    b .L0802ECEA
.L0802ECDC:
    movs r0, #0xd3
    lsls r0, r0, #1
    cmp r1, r0
    beq .L0802ED78
    cmp r1, r0
    bgt .L0802ECF0
    subs r0, #0x15
.L0802ECEA:
    cmp r1, r0
    beq .L0802ED78
    b .L0802EDA2
.L0802ECF0:
    ldr r0, .L0802ECF8 @ =0x000001CD
.L0802ECF2:
    cmp r1, r0
    beq .L0802ED82
    b .L0802EDA2
    .align 2, 0
.L0802ECF8: .4byte 0x000001CD
.L0802ECFC:
    ldr r0, [r4]
    b .L0802ED44
.L0802ED00:
    ldr r0, [r7]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    movs r3, #0x3c
    adds r3, r3, r7
    mov sb, r3
    adds r6, r7, #0
    adds r6, #0xa6
    movs r0, #0x88
    adds r0, r0, r7
    mov r8, r0
    movs r1, #0x3d
    adds r1, r1, r7
    mov sl, r1
    cmp r4, r5
    beq .L0802ED40
.L0802ED2E:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802ECFC
    adds r4, #4
    cmp r4, r5
    bne .L0802ED2E
.L0802ED40:
    subs r0, r5, #4
    ldr r0, [r0]
.L0802ED44:
    movs r1, #0xb6
    bl func_08008B6C
    ldr r0, [r7, #0x38]
    adds r0, #0x54
    bl func_0800F390
    ldr r0, .L0802ED74 @ =0xFFF80000
    movs r2, #0
    movs r1, #0x88
    lsls r1, r1, #0xd
    mov r3, r8
    str r0, [r3, #4]
    str r2, [r3, #8]
    str r1, [r3, #0x14]
    movs r0, #0x2f
    mov r1, sb
    strb r0, [r1]
    strh r2, [r6]
    movs r0, #0x78
    mov r2, sl
    strb r0, [r2]
    b .L0802F0DC
    .align 2, 0
.L0802ED74: .4byte 0xFFF80000
.L0802ED78:
    adds r1, r7, #0
    adds r1, #0x3c
    movs r2, #0
    movs r0, #0x38
    b .L0802ED8A
.L0802ED82:
    adds r1, r7, #0
    adds r1, #0x3c
    movs r2, #0
    movs r0, #0x39
.L0802ED8A:
    strb r0, [r1]
    adds r0, r7, #0
    adds r0, #0xa6
    strh r2, [r0]
    adds r1, #1
    movs r0, #0x1e
    strb r0, [r1]
    ldr r0, [r7, #0x38]
    adds r0, #0x54
    bl func_0800F390
    b .L0802F0DC
.L0802EDA2:
    adds r0, r7, #0
    adds r0, #0x3e
    ldrb r5, [r0]
    mov r8, r0
    cmp r5, #0
    bne .L0802EDDC
    adds r0, r4, #0
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802EDDC
    adds r0, r7, #0
    adds r0, #0xa6
    ldrh r2, [r0]
    movs r1, #0x96
    lsls r1, r1, #2
    adds r6, r0, #0
    cmp r2, r1
    bls .L0802EDD6
    adds r1, r7, #0
    adds r1, #0x3c
    movs r0, #0x17
    strb r0, [r1]
    strh r5, [r6]
    b .L0802F0DC
.L0802EDD6:
    adds r0, r2, #1
    strh r0, [r6]
    b .L0802EDE6
.L0802EDDC:
    adds r1, r7, #0
    adds r1, #0xa6
    movs r0, #0
    strh r0, [r1]
    adds r6, r1, #0
.L0802EDE6:
    mov r3, r8
    ldrb r1, [r3]
    cmp r1, #0
    bne .L0802EDF6
    adds r0, r7, #0
    adds r0, #0xc4
    strb r1, [r0]
    b .L0802EE08
.L0802EDF6:
    cmp r1, #0
    blt .L0802EE08
    cmp r1, #2
    bgt .L0802EE08
    adds r1, r7, #0
    adds r1, #0xc4
    ldrb r0, [r1]
    adds r0, #1
    strb r0, [r1]
.L0802EE08:
    movs r2, #0
    str r2, [sp, #0x10]
    str r2, [sp, #0xc]
    mov r0, sb
    cmp r0, #0
    beq .L0802EE1E
    ldrh r0, [r0]
    str r0, [sp, #0x10]
    mov r1, sb
    ldrh r0, [r1, #4]
    str r0, [sp, #0xc]
.L0802EE1E:
    mov r3, r8
    strb r2, [r3]
    add r4, sp, #0xc
    ldrb r3, [r4]
    movs r5, #1
    adds r1, r5, #0
    ands r1, r3
    cmp r1, #0
    beq .L0802EE3A
    adds r0, r7, #0
    adds r0, #0x3c
    strb r5, [r0]
    strh r2, [r6]
    b .L0802EFA2
.L0802EE3A:
    movs r2, #2
    adds r0, r2, #0
    ands r0, r3
    lsls r0, r0, #0x18
    lsrs r3, r0, #0x18
    cmp r3, #0
    beq .L0802EE68
    adds r0, r7, #0
    adds r0, #0x3c
    strb r2, [r0]
    strh r1, [r6]
    ldr r0, [r7, #0x38]
    adds r0, #0x54
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0802EE60
    b .L0802EFA2
.L0802EE60:
    adds r0, r7, #0
    bl func_0802C984
    b .L0802EFA2
.L0802EE68:
    ldrb r1, [r4, #1]
    adds r0, r2, #0
    ands r0, r1
    cmp r0, #0
    beq .L0802EE7E
    adds r1, r7, #0
    adds r1, #0x3c
    movs r0, #3
    strb r0, [r1]
    strh r3, [r6]
    b .L0802EFA2
.L0802EE7E:
    ldr r1, [sp, #0x10]
    lsls r2, r1, #0x19
    lsrs r2, r2, #0x1f
    lsls r0, r1, #0x18
    lsrs r0, r0, #0x1f
    orrs r2, r0
    lsls r0, r1, #0x1a
    lsrs r0, r0, #0x1f
    orrs r0, r2
    lsls r2, r1, #0x1b
    lsrs r2, r2, #0x1f
    orrs r2, r0
    lsls r1, r1, #0x17
    lsrs r1, r1, #0x1f
    orrs r1, r2
    cmp r1, #0
    bne .L0802EEA2
    b .L0802EFA2
.L0802EEA2:
    adds r2, r7, #0
    adds r2, #0x20
    ldrb r5, [r2]
    adds r4, r5, #0
    add r1, sp, #0x10
    ldrb r3, [r1]
    movs r0, #0x20
    ands r0, r3
    adds r6, r2, #0
    mov sb, r1
    cmp r0, #0
    beq .L0802EEBE
    movs r5, #2
    b .L0802EEE0
.L0802EEBE:
    movs r0, #0x10
    ands r0, r3
    cmp r0, #0
    beq .L0802EECA
    movs r5, #3
    b .L0802EEE0
.L0802EECA:
    movs r0, #0x40
    ands r0, r3
    cmp r0, #0
    beq .L0802EED6
    movs r5, #1
    b .L0802EEE0
.L0802EED6:
    movs r0, #0x80
    ands r0, r3
    cmp r0, #0
    beq .L0802EEE0
    movs r5, #0
.L0802EEE0:
    cmp r5, r4
    beq .L0802EF10
    adds r1, r7, #0
    adds r1, #0xb3
    movs r0, #0
    strb r0, [r1]
    movs r4, #0x2b
.L0802EEEE:
    ldr r0, [r7]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    adds r1, r4, #0
    bl _call_via_r2
    adds r2, r0, #0
    cmp r2, #0
    beq .L0802EF0A
    ldr r0, [r2, #0x14]
    ldr r1, [r0, #0x40]
    adds r0, r2, #0
    bl _call_via_r1
.L0802EF0A:
    adds r4, #1
    cmp r4, #0x45
    bls .L0802EEEE
.L0802EF10:
    ldrb r0, [r6]
    cmp r0, r5
    beq .L0802EF1E
    adds r0, r7, #0
    adds r1, r5, #0
    bl SetAnimFacing__12AActorEntityUi
.L0802EF1E:
    ldrb r2, [r6]
    cmp r2, #1
    beq .L0802EF42
    cmp r2, #1
    bgt .L0802EF2E
    cmp r2, #0
    beq .L0802EF48
    b .L0802EF36
.L0802EF2E:
    cmp r2, #2
    beq .L0802EF36
    cmp r2, #3
    beq .L0802EF3C
.L0802EF36:
    movs r2, #0xff
    movs r4, #0
    b .L0802EF4C
.L0802EF3C:
    movs r2, #1
    movs r4, #0
    b .L0802EF4C
.L0802EF42:
    movs r2, #0
    movs r4, #0xff
    b .L0802EF4C
.L0802EF48:
    movs r2, #0
    movs r4, #1
.L0802EF4C:
    ldr r0, [r7, #0x34]
    ldr r1, .L0802EF6C @ =0x00002210
    adds r0, r0, r1
    ldrb r0, [r0]
    lsls r0, r0, #0x1f
    cmp r0, #0
    bne .L0802EF70
    mov r3, sb
    ldrb r1, [r3, #1]
    movs r3, #1
    adds r0, r3, #0
    ands r0, r1
    cmp r0, #0
    beq .L0802EF92
    b .L0802EF7E
    .align 2, 0
.L0802EF6C: .4byte 0x00002210
.L0802EF70:
    mov r3, sb
    ldrb r1, [r3, #1]
    movs r3, #1
    adds r0, r3, #0
    ands r0, r1
    cmp r0, #0
    bne .L0802EF92
.L0802EF7E:
    movs r0, #2
    mov r1, r8
    strb r0, [r1]
    lsls r0, r2, #0x19
    lsrs r2, r0, #0x18
    lsls r0, r4, #0x19
    lsrs r4, r0, #0x18
    b .L0802EF96
.L0802EF8E:
    ldr r0, [r4]
    b .L0802F02E
.L0802EF92:
    mov r0, r8
    strb r3, [r0]
.L0802EF96:
    lsls r0, r2, #0x18
    asrs r0, r0, #8
    str r0, [r7, #0x18]
    lsls r0, r4, #0x18
    asrs r0, r0, #8
    str r0, [r7, #0x1c]
.L0802EFA2:
    ldr r1, .L0802F038 @ =gUnk_080F117F
    mov r0, sp
    movs r2, #3
    bl memcpy
    mov r1, r8
    ldrb r0, [r1]
    add r0, sp
    ldrb r1, [r0]
    cmp r1, #0
    beq .L0802F0AE
    adds r2, r7, #0
    adds r2, #0xc4
    ldrb r0, [r2]
    cmp r0, r1
    blo .L0802F0AE
    movs r0, #0
    strb r0, [r2]
    ldr r6, [r7]
    ldr r4, [r6]
    movs r2, #0x90
    lsls r2, r2, #1
    adds r4, r4, r2
    add r5, sp, #4
    adds r0, r5, #0
    adds r1, r7, #0
    bl GetLocation__C7AEntity
    ldr r2, [r4]
    adds r0, r6, #0
    adds r1, r5, #0
    bl _call_via_r2
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802F07A
    ldr r0, [r7, #0x10]
    cmp r0, #0
    beq .L0802EFF4
    bl func_0802B46C
.L0802EFF4:
    ldr r0, [r7, #0x34]
    adds r0, #0x10
    bl func_0800E324
    cmp r0, #3
    beq .L0802F040
    ldr r0, [r7]
    ldr r1, [r0]
    movs r3, #0xa6
    lsls r3, r3, #1
    adds r1, r1, r3
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    beq .L0802F02A
.L0802F018:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802EF8E
    adds r4, #4
    cmp r4, r5
    bne .L0802F018
.L0802F02A:
    subs r0, r5, #4
    ldr r0, [r0]
.L0802F02E:
    movs r1, #0xd0
    bl func_08008B6C
    b .L0802F0AE
    .align 2, 0
.L0802F038: .4byte gUnk_080F117F
.L0802F03C:
    ldr r0, [r4]
    b .L0802F06E
.L0802F040:
    ldr r0, [r7]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    beq .L0802F06A
.L0802F058:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802F03C
    adds r4, #4
    cmp r4, r5
    bne .L0802F058
.L0802F06A:
    subs r0, r5, #4
    ldr r0, [r0]
.L0802F06E:
    movs r1, #0xd1
    bl func_08008B6C
    b .L0802F0AE
.L0802F076:
    ldr r0, [r4]
    b .L0802F0A8
.L0802F07A:
    ldr r0, [r7]
    ldr r1, [r0]
    movs r3, #0xa6
    lsls r3, r3, #1
    adds r1, r1, r3
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    beq .L0802F0A4
.L0802F092:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802F076
    adds r4, #4
    cmp r4, r5
    bne .L0802F092
.L0802F0A4:
    subs r0, r5, #4
    ldr r0, [r0]
.L0802F0A8:
    movs r1, #0xd0
    bl func_08008B6C
.L0802F0AE:
    movs r1, #0
    ldrh r0, [r7, #0x24]
    cmp r0, #0
    bne .L0802F0B8
    movs r1, #1
.L0802F0B8:
    cmp r1, #0
    beq .L0802F0DC
    mov r1, r8
    ldrb r0, [r1]
    cmp r0, #1
    bne .L0802F0CC
    adds r0, r7, #0
    bl func_0802AD80
    b .L0802F0DC
.L0802F0CC:
    cmp r0, #2
    bne .L0802F0DC
    adds r0, r7, #0
    bl func_0802AD80
    adds r0, r7, #0
    bl func_0802AD80
.L0802F0DC:
    add sp, #0x14
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0

    thumb_func_start func_0802F0EC
func_0802F0EC: @ 0x0802F0EC
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #0x18c
    mov sl, r0
    adds r4, r1, #0
    lsls r2, r2, #0x18
    lsrs r2, r2, #0x18
    movs r3, #0
    str r3, [r0, #0x18]
    str r3, [r0, #0x1c]
    mov r1, sl
    adds r1, #0xc5
    ldrb r0, [r1]
    cmp r0, #0
    beq .L0802F116
    subs r0, #1
    strb r0, [r1]
    movs r4, #0
.L0802F116:
    mov r1, sl
    adds r1, #0xc1
    strb r3, [r1]
    mov r0, sl
    adds r0, #0x3c
    ldrb r3, [r0]
    adds r5, r1, #0
    str r0, [sp, #0x13c]
    cmp r3, #0x39
    bls .L0802F12E
    bl .L08031F0E
.L0802F12E:
    lsls r0, r3, #2
    ldr r1, .L0802F138 @ =.L0802F13C
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L0802F138: .4byte .L0802F13C
.L0802F13C: @ jump table
    .4byte .L0802F224 @ case 0
    .4byte .L0802F238 @ case 1
    .4byte .L0802F244 @ case 2
    .4byte .L0802F250 @ case 3
    .4byte .L0802F264 @ case 4
    .4byte .L0802F270 @ case 5
    .4byte .L0802F27C @ case 6
    .4byte .L0802F296 @ case 7
    .4byte .L0802F2A2 @ case 8
    .4byte .L0802FC14 @ case 9
    .4byte .L0802FA30 @ case 10
    .4byte .L0802F884 @ case 11
    .4byte .L0802F396 @ case 12
    .4byte .L0802F3C8 @ case 13
    .4byte .L0802F332 @ case 14
    .4byte .L08031A92 @ case 15
    .4byte .L08031A92 @ case 16
    .4byte .L08031A64 @ case 17
    .4byte .L08031936 @ case 18
    .4byte .L08031950 @ case 19
    .4byte .L080319A6 @ case 20
    .4byte .L08031886 @ case 21
    .4byte .L080318A0 @ case 22
    .4byte .L080319BC @ case 23
    .4byte .L08031A92 @ case 24
    .4byte .L0803123E @ case 25
    .4byte .L080316C6 @ case 26
    .4byte .L08031698 @ case 27
    .4byte .L080314E6 @ case 28
    .4byte .L08031682 @ case 29
    .4byte .L08030E50 @ case 30
    .4byte .L08030EE2 @ case 31
    .4byte .L08030F5A @ case 32
    .4byte .L080311F4 @ case 33
    .4byte .L080319E0 @ case 34
    .4byte .L08031A38 @ case 35
    .4byte .L08031AA8 @ case 36
    .4byte .L08031AA8 @ case 37
    .4byte .L08031AA8 @ case 38
    .4byte .L08031AA8 @ case 39
    .4byte .L08031AA8 @ case 40
    .4byte .L08031AA8 @ case 41
    .4byte .L08031AC0 @ case 42
    .4byte .L08031F0E @ case 43
    .4byte .L08031B82 @ case 44
    .4byte .L08031AFC @ case 45
    .4byte .L08031C64 @ case 46
    .4byte .L08031C84 @ case 47
    .4byte .L08031CB6 @ case 48
    .4byte .L08031D0C @ case 49
    .4byte .L08031D2A @ case 50
    .4byte .L08031D80 @ case 51
    .4byte .L08031E8A @ case 52
    .4byte .L08031EAE @ case 53
    .4byte .L08031D9A @ case 54
    .4byte .L08031E10 @ case 55
    .4byte .L08031DB8 @ case 56
    .4byte .L08031E34 @ case 57
.L0802F224:
    mov r0, sl
    adds r1, r4, #0
    bl func_0802EC00
    movs r1, #0
    ldr r2, [sp, #0x13c]
    ldrb r0, [r2]
    cmp r0, #0
    bne .L0802F290
    b .L0802F28E
.L0802F238:
    mov r0, sl
    adds r1, r4, #0
    bl func_0802E0FC
    bl .L08031F0E
.L0802F244:
    mov r0, sl
    adds r1, r4, #0
    bl func_0802DE94
    bl .L08031F0E
.L0802F250:
    mov r0, sl
    adds r1, r4, #0
    bl func_0802DBF0
    movs r1, #0
    ldr r3, [sp, #0x13c]
    ldrb r0, [r3]
    cmp r0, #3
    bne .L0802F290
    b .L0802F28E
.L0802F264:
    mov r0, sl
    adds r1, r4, #0
    bl func_0802D9AC
    bl .L08031F0E
.L0802F270:
    mov r0, sl
    adds r1, r4, #0
    bl func_0802D8E8
    bl .L08031F0E
.L0802F27C:
    mov r0, sl
    adds r1, r4, #0
    bl func_0802D844
    movs r1, #0
    ldr r4, [sp, #0x13c]
    ldrb r0, [r4]
    cmp r0, #6
    bne .L0802F290
.L0802F28E:
    movs r1, #1
.L0802F290:
    strb r1, [r5]
    bl .L08031F0E
.L0802F296:
    mov r0, sl
    adds r1, r4, #0
    bl func_0802D59C
    bl .L08031F0E
.L0802F2A2:
    mov r5, sl
    adds r5, #0xc3
    ldrb r0, [r5]
    cmp r0, #0
    beq .L0802F2E0
    cmp r0, #0x2a
    bne .L0802F2DC
    mov r6, sl
    ldr r0, [r6]
    ldr r2, [r0]
    movs r7, #0xa0
    lsls r7, r7, #1
    adds r2, r2, r7
    add r1, sp, #0x30
    ldr r3, .L0802F2D8 @ =0x000002B6
    movs r4, #0
    str r3, [sp, #0x30]
    str r4, [r1, #4]
    ldr r3, [r2]
    movs r2, #2
    bl _call_via_r3
    strb r4, [r5]
    ldr r0, [r6, #0x14]
    ldr r1, [r0, #0x6c]
    bl .L08031EA6
    .align 2, 0
.L0802F2D8: .4byte 0x000002B6
.L0802F2DC:
    movs r0, #0
    strb r0, [r5]
.L0802F2E0:
    cmp r4, #0
    beq .L0802F306
    ldrh r0, [r4, #8]
    movs r1, #1
    ands r0, r1
    cmp r0, #0
    beq .L0802F306
    mov r1, sl
    ldr r0, [r1]
    ldr r2, [r0]
    movs r3, #0xa0
    lsls r3, r3, #1
    adds r2, r2, r3
    add r1, sp, #0x38
    movs r3, #0x56
    movs r4, #0
    str r3, [sp, #0x38]
    bl sub_0802FBFC
.L0802F306:
    mov r1, sl
    adds r1, #0x3d
    ldrb r0, [r1]
    cmp r0, #0
    beq .L0802F314
    subs r0, #1
    strb r0, [r1]
.L0802F314:
    cmp r2, #0
    bne .L0802F31C
    bl .L08031F0E
.L0802F31C:
    mov r4, sl
    ldr r0, [r4, #0x14]
    movs r2, #1
    rsbs r2, r2, #0
    ldr r3, [r0, #0x64]
    mov r0, sl
    movs r1, #1
    bl _call_via_r3
    bl .L08031F0E
.L0802F332:
    movs r1, #0
    mov r5, sl
    ldrh r0, [r5, #0x24]
    cmp r0, #0
    bne .L0802F33E
    movs r1, #1
.L0802F33E:
    cmp r1, #0
    bne .L0802F346
    bl .L08031F0E
.L0802F346:
    movs r0, #0
    ldr r6, [sp, #0x13c]
    strb r0, [r6]
    mov r7, sl
    ldr r0, [r7, #0x38]
    adds r4, r0, #0
    adds r4, #0x54
    adds r0, r4, #0
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802F364
    bl .L08031D78
.L0802F364:
    adds r0, r4, #0
    bl func_0800F204
    cmp r0, #1
    bne .L0802F388
    adds r0, r4, #0
    bl func_0800F258
    adds r1, r0, #0
    add r0, sp, #0x40
    strb r1, [r0]
    bl GetId__C7Article
    cmp r0, #0x35
    bne .L0802F388
    ldr r0, [r7, #0x38]
    bl func_0800ED2C
.L0802F388:
    mov r1, sl
    ldr r0, [r1, #0x38]
    adds r0, #0x54
    bl func_0800F390
    bl .L08031D78
.L0802F396:
    movs r1, #0
    mov r2, sl
    ldrh r0, [r2, #0x24]
    cmp r0, #0
    bne .L0802F3A2
    movs r1, #1
.L0802F3A2:
    cmp r1, #0
    bne .L0802F3AA
    bl .L08031F0E
.L0802F3AA:
    movs r2, #0
    ldr r3, [sp, #0x13c]
    strb r2, [r3]
    mov r1, sl
    adds r1, #0xa8
    movs r0, #1
    str r0, [r1]
    mov r0, sl
    adds r0, #0xb0
    strb r2, [r0]
    adds r1, #4
    movs r0, #0x35
    str r0, [r1]
    bl .L08031F0E
.L0802F3C8:
    movs r1, #0
    mov r4, sl
    ldrh r0, [r4, #0x24]
    cmp r0, #0
    bne .L0802F3D4
    movs r1, #1
.L0802F3D4:
    cmp r1, #0
    bne .L0802F3DC
    bl .L08031F0E
.L0802F3DC:
    movs r0, #0
    ldr r5, [sp, #0x13c]
    strb r0, [r5]
    mov r6, sl
    ldr r0, [r6, #0x38]
    adds r4, r0, #0
    adds r4, #0x54
    movs r0, #0xa
    ldrsh r7, [r6, r0]
    movs r2, #0xe
    ldrsh r1, [r6, r2]
    str r1, [sp, #0xec]
    mov r0, sl
    adds r0, #0x20
    ldrb r0, [r0]
    cmp r0, #1
    beq .L0802F412
    cmp r0, #1
    bgt .L0802F408
    cmp r0, #0
    beq .L0802F41A
    b .L0802F428
.L0802F408:
    cmp r0, #2
    beq .L0802F422
    cmp r0, #3
    beq .L0802F426
    b .L0802F428
.L0802F412:
    ldr r3, [sp, #0xec]
    subs r3, #0x10
    str r3, [sp, #0xec]
    b .L0802F428
.L0802F41A:
    ldr r5, [sp, #0xec]
    adds r5, #0x10
    str r5, [sp, #0xec]
    b .L0802F428
.L0802F422:
    subs r7, #0x10
    b .L0802F428
.L0802F426:
    adds r7, #0x10
.L0802F428:
    adds r0, r4, #0
    bl func_0800F204
    cmp r0, #5
    bls .L0802F436
    bl .L08031D78
.L0802F436:
    lsls r0, r0, #2
    ldr r1, .L0802F440 @ =.L0802F444
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L0802F440: .4byte .L0802F444
.L0802F444: @ jump table
    .4byte .L08031D78 @ case 0
    .4byte .L0802F45C @ case 1
    .4byte .L0802F500 @ case 2
    .4byte .L0802F648 @ case 3
    .4byte .L0802F7E6 @ case 4
    .4byte .L08031D78 @ case 5
.L0802F45C:
    adds r0, r4, #0
    bl func_0800F258
    mov r6, sp
    adds r6, #0x41
    str r6, [sp, #0x128]
    strb r0, [r6]
    mov r1, sl
    ldr r0, [r1, #0x38]
    adds r0, #0x54
    bl func_0800F390
    mov r2, sl
    ldr r0, [r2]
    ldr r1, [r0]
    adds r1, #0xe4
    str r1, [sp, #0xf0]
    ldrh r2, [r2, #4]
    mov r6, sp
    ldr r3, .L0802F4F8 @ =0x000003FF
    mov sb, r3
    mov r4, sb
    ands r2, r4
    ldrh r3, [r6]
    ldr r5, .L0802F4FC @ =0xFFFFFC00
    adds r1, r5, #0
    ands r1, r3
    orrs r1, r2
    strh r1, [r6]
    lsls r4, r7, #0x10
    lsrs r2, r4, #0x10
    movs r7, #0x3f
    mov ip, r7
    mov r1, ip
    ands r2, r1
    lsls r2, r2, #2
    ldrb r3, [r6, #1]
    mov r8, r3
    movs r3, #3
    adds r1, r3, #0
    mov r7, r8
    ands r1, r7
    orrs r1, r2
    strb r1, [r6, #1]
    lsrs r4, r4, #0x16
    mov r1, sb
    ands r4, r1
    ldrh r2, [r6, #2]
    adds r1, r5, #0
    ands r1, r2
    orrs r1, r4
    strh r1, [r6, #2]
    ldr r4, [sp, #0xec]
    lsls r2, r4, #0x10
    lsrs r1, r2, #0x10
    mov r7, ip
    ands r1, r7
    lsls r1, r1, #2
    ldrb r4, [r6, #3]
    ands r3, r4
    orrs r3, r1
    strb r3, [r6, #3]
    lsrs r2, r2, #0x16
    mov r1, sb
    ands r2, r1
    ldrh r1, [r6, #4]
    ands r5, r1
    orrs r5, r2
    strh r5, [r6, #4]
    ldr r2, [sp, #0xf0]
    ldr r3, [r2]
    mov r1, sp
    ldr r2, [sp, #0x128]
    bl _call_via_r3
    bl .L08031D78
    .align 2, 0
.L0802F4F8: .4byte 0x000003FF
.L0802F4FC: .4byte 0xFFFFFC00
.L0802F500:
    mov r3, sl
    ldr r0, [r3, #0x38]
    adds r0, #0x54
    bl func_0800F390
    mov r4, sl
    ldr r0, [r4, #0x34]
    ldr r5, .L0802F5E8 @ =0x00001C70
    adds r5, r0, r5
    str r5, [sp, #0xf4]
    ldrh r1, [r4, #4]
    mov r5, sp
    ldr r6, .L0802F5EC @ =0x000003FF
    mov r8, r6
    mov r0, r8
    ands r1, r0
    ldrh r2, [r5]
    ldr r4, .L0802F5F0 @ =0xFFFFFC00
    adds r0, r4, #0
    ands r0, r2
    orrs r0, r1
    strh r0, [r5]
    lsls r3, r7, #0x10
    lsrs r1, r3, #0x10
    movs r2, #0x3f
    mov sb, r2
    ands r1, r2
    lsls r1, r1, #2
    ldrb r6, [r5, #1]
    movs r2, #3
    adds r0, r2, #0
    ands r0, r6
    orrs r0, r1
    strb r0, [r5, #1]
    lsrs r3, r3, #0x16
    mov r6, r8
    ands r3, r6
    ldrh r1, [r5, #2]
    adds r0, r4, #0
    ands r0, r1
    orrs r0, r3
    strh r0, [r5, #2]
    ldr r7, [sp, #0xec]
    lsls r1, r7, #0x10
    lsrs r0, r1, #0x10
    mov r3, sb
    ands r0, r3
    lsls r0, r0, #2
    ldrb r3, [r5, #3]
    ands r2, r3
    orrs r2, r0
    strb r2, [r5, #3]
    lsrs r1, r1, #0x16
    ands r1, r6
    ldrh r0, [r5, #4]
    ands r4, r0
    orrs r4, r1
    strh r4, [r5, #4]
    add r4, sp, #8
    movs r5, #0
    adds r0, r4, #0
    mov r1, sp
    movs r2, #6
    bl memcpy
    strb r5, [r4, #6]
    ldr r0, [sp, #0xf4]
    adds r1, r4, #0
    bl SetLocation__5ActorRC13ActorLocation
    ldr r0, [sp, #0xf4]
    bl HasBeenTalkedTo__C6Animal
    movs r1, #1
    eors r0, r1
    lsls r0, r0, #0x18
    lsrs r6, r0, #0x18
    cmp r6, #0
    beq .L0802F5AC
    ldr r0, [sp, #0xf4]
    bl SetTalkedTo__6Animal
    ldr r0, [sp, #0xf4]
    movs r1, #1
    bl AddAffection__6Animali
.L0802F5AC:
    mov r4, sl
    ldr r5, [r4]
    ldr r0, [r5]
    ldr r2, [r0, #0x38]
    adds r0, r5, #0
    movs r1, #0x2b
    bl _call_via_r2
    ldr r0, [r5]
    ldr r2, [r0, #0x40]
    adds r0, r5, #0
    movs r1, #0x2b
    bl _call_via_r2
    adds r4, r0, #0
    cmp r4, #0
    bne .L0802F5D2
    bl .L08031D78
.L0802F5D2:
    mov r7, sl
    ldr r0, [r7, #0x14]
    ldr r1, [r0, #0x28]
    mov r0, sl
    bl _call_via_r1
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802F5F8
    b .L0802F742
    .align 2, 0
.L0802F5E8: .4byte 0x00001C70
.L0802F5EC: .4byte 0x000003FF
.L0802F5F0: .4byte 0xFFFFFC00
.L0802F5F4:
    ldr r0, [r4]
    b .L0802F642
.L0802F5F8:
    ldr r0, [r4, #0x14]
    adds r0, #0x88
    ldr r2, [r0]
    adds r0, r4, #0
    movs r1, #0x3c
    bl _call_via_r2
    cmp r6, #0
    beq .L0802F614
    adds r0, r4, #0
    movs r1, #1
    movs r2, #0
    bl func_08032384
.L0802F614:
    ldr r0, [r5]
    movs r1, #0xa6
    lsls r1, r1, #1
    adds r0, r0, r1
    ldr r1, [r0]
    adds r0, r5, #0
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    beq .L0802F63E
.L0802F62C:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802F5F4
    adds r4, #4
    cmp r4, r5
    bne .L0802F62C
.L0802F63E:
    subs r0, r5, #4
    ldr r0, [r0]
.L0802F642:
    movs r1, #0xd2
    bl sub_08031D74
.L0802F648:
    adds r0, r4, #0
    bl func_0800F344
    str r0, [sp, #0xfc]
    mov r2, sl
    ldr r0, [r2, #0x34]
    movs r3, #0x82
    lsls r3, r3, #3
    adds r0, r0, r3
    ldr r1, [sp, #0xfc]
    bl GetChicken__4CoopUi
    str r0, [sp, #0xf8]
    mov r4, sl
    ldr r0, [r4, #0x38]
    adds r0, #0x54
    bl func_0800F390
    ldrh r2, [r4, #4]
    add r1, sp, #8
    ldr r5, .L0802F750 @ =0x000003FF
    mov r8, r5
    mov r6, r8
    ands r2, r6
    ldrh r3, [r1]
    ldr r5, .L0802F754 @ =0xFFFFFC00
    adds r0, r5, #0
    ands r0, r3
    orrs r0, r2
    strh r0, [r1]
    lsls r4, r7, #0x10
    lsrs r2, r4, #0x10
    movs r7, #0x3f
    mov sb, r7
    mov r0, sb
    ands r2, r0
    lsls r2, r2, #2
    ldrb r6, [r1, #1]
    movs r3, #3
    adds r0, r3, #0
    ands r0, r6
    orrs r0, r2
    strb r0, [r1, #1]
    lsrs r4, r4, #0x16
    mov r2, r8
    ands r4, r2
    ldrh r2, [r1, #2]
    adds r0, r5, #0
    ands r0, r2
    orrs r0, r4
    strh r0, [r1, #2]
    ldr r4, [sp, #0xec]
    lsls r2, r4, #0x10
    lsrs r0, r2, #0x10
    mov r6, sb
    ands r0, r6
    lsls r0, r0, #2
    ldrb r4, [r1, #3]
    ands r3, r4
    orrs r3, r0
    strb r3, [r1, #3]
    lsrs r2, r2, #0x16
    mov r7, r8
    ands r2, r7
    ldrh r0, [r1, #4]
    ands r5, r0
    orrs r5, r2
    strh r5, [r1, #4]
    mov r5, sp
    movs r4, #0
    mov r0, sp
    movs r2, #6
    bl memcpy
    strb r4, [r5, #6]
    ldr r0, [sp, #0xf8]
    mov r1, sp
    bl SetLocation__5ActorRC13ActorLocation
    ldr r0, [sp, #0xf8]
    bl HasBeenTalkedTo__C6Animal
    movs r1, #1
    eors r0, r1
    lsls r0, r0, #0x18
    lsrs r6, r0, #0x18
    cmp r6, #0
    beq .L0802F706
    ldr r0, [sp, #0xf8]
    bl SetTalkedTo__6Animal
    ldr r0, [sp, #0xf8]
    movs r1, #1
    bl AddAffection__6Animali
.L0802F706:
    mov r0, sl
    ldr r5, [r0]
    ldr r4, [sp, #0xfc]
    adds r4, #0x2e
    ldr r0, [r5]
    ldr r2, [r0, #0x38]
    adds r0, r5, #0
    adds r1, r4, #0
    bl _call_via_r2
    ldr r0, [r5]
    ldr r2, [r0, #0x40]
    adds r0, r5, #0
    adds r1, r4, #0
    bl _call_via_r2
    adds r4, r0, #0
    cmp r4, #0
    bne .L0802F730
    bl .L08031D78
.L0802F730:
    mov r1, sl
    ldr r0, [r1, #0x14]
    ldr r1, [r0, #0x28]
    mov r0, sl
    bl _call_via_r1
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802F758
.L0802F742:
    ldr r0, [r4, #0x14]
    ldr r1, [r0, #0x20]
    adds r0, r4, #0
    bl _call_via_r1
    bl .L08031D78
    .align 2, 0
.L0802F750: .4byte 0x000003FF
.L0802F754: .4byte 0xFFFFFC00
.L0802F758:
    ldr r0, [r4, #0x14]
    adds r0, #0x88
    ldr r2, [r0]
    adds r0, r4, #0
    movs r1, #0x3c
    bl _call_via_r2
    ldr r0, [sp, #0xf8]
    bl IsSick__C9Livestock
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802F778
    adds r0, r4, #0
    movs r1, #7
    b .L0802F788
.L0802F778:
    ldr r0, [sp, #0xf8]
    bl IsUnhappy__C9Livestock
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802F796
    adds r0, r4, #0
    movs r1, #6
.L0802F788:
    movs r2, #0
    bl func_08032384
    bl .L08031D78
.L0802F792:
    ldr r4, [r4]
    b .L0802F7D2
.L0802F796:
    cmp r6, #0
    beq .L0802F7A4
    adds r0, r4, #0
    movs r1, #1
    movs r2, #0
    bl func_08032384
.L0802F7A4:
    ldr r0, [r5]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r0, r0, r2
    ldr r1, [r0]
    adds r0, r5, #0
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    beq .L0802F7CE
.L0802F7BC:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802F792
    adds r4, #4
    cmp r4, r5
    bne .L0802F7BC
.L0802F7CE:
    subs r0, r5, #4
    ldr r4, [r0]
.L0802F7D2:
    ldr r0, [sp, #0xf8]
    bl GetGrowthStage__C7Chicken
    movs r1, #0xa5
    cmp r0, #1
    bne .L0802F7E0
    movs r1, #0xcc
.L0802F7E0:
    adds r0, r4, #0
    bl sub_08031D74
.L0802F7E6:
    mov r3, sl
    ldr r0, [r3, #0x38]
    adds r0, #0x54
    bl func_0800F390
    mov r4, sl
    ldr r0, [r4, #0x34]
    movs r5, #0xe5
    lsls r5, r5, #5
    adds r0, r0, r5
    ldrh r2, [r4, #4]
    mov r6, sp
    ldr r1, .L0802F87C @ =0x000003FF
    mov sb, r1
    mov r3, sb
    ands r2, r3
    ldrh r3, [r6]
    ldr r5, .L0802F880 @ =0xFFFFFC00
    adds r1, r5, #0
    ands r1, r3
    orrs r1, r2
    strh r1, [r6]
    lsls r4, r7, #0x10
    lsrs r2, r4, #0x10
    movs r7, #0x3f
    mov ip, r7
    mov r1, ip
    ands r2, r1
    lsls r2, r2, #2
    ldrb r3, [r6, #1]
    mov r8, r3
    movs r3, #3
    adds r1, r3, #0
    mov r7, r8
    ands r1, r7
    orrs r1, r2
    strb r1, [r6, #1]
    lsrs r4, r4, #0x16
    mov r1, sb
    ands r4, r1
    ldrh r2, [r6, #2]
    adds r1, r5, #0
    ands r1, r2
    orrs r1, r4
    strh r1, [r6, #2]
    ldr r4, [sp, #0xec]
    lsls r2, r4, #0x10
    lsrs r1, r2, #0x10
    mov r7, ip
    ands r1, r7
    lsls r1, r1, #2
    ldrb r4, [r6, #3]
    ands r3, r4
    orrs r3, r1
    strb r3, [r6, #3]
    lsrs r2, r2, #0x16
    mov r1, sb
    ands r2, r1
    ldrh r1, [r6, #4]
    ands r5, r1
    orrs r5, r2
    strh r5, [r6, #4]
    mov r1, sp
    bl func_08010014
    mov r2, sl
    ldr r0, [r2]
    ldr r1, [r0]
    ldr r2, [r1, #0x38]
    movs r1, #0x4a
    bl _call_via_r2
    bl .L08031D78
    .align 2, 0
.L0802F87C: .4byte 0x000003FF
.L0802F880: .4byte 0xFFFFFC00
.L0802F884:
    mov r2, sl
    adds r2, #0x88
    ldr r0, [r2, #4]
    ldr r1, [r2, #0xc]
    adds r0, r0, r1
    str r0, [r2, #4]
    ldr r0, [r2, #8]
    ldr r1, [r2, #0x10]
    adds r0, r0, r1
    str r0, [r2, #8]
    ldr r0, [r2, #0x18]
    ldr r3, .L0802F8AC @ =0xFFFFB556
    adds r0, r0, r3
    str r0, [r2, #0x18]
    ldr r1, [r2, #0x14]
    adds r1, r1, r0
    cmp r1, #0
    ble .L0802F8B0
    str r1, [r2, #0x14]
    b .L0802F8B6
    .align 2, 0
.L0802F8AC: .4byte 0xFFFFB556
.L0802F8B0:
    movs r0, #0
    str r0, [r2, #0x14]
    str r0, [r2, #0x18]
.L0802F8B6:
    movs r1, #0
    mov r4, sl
    ldrh r0, [r4, #0x24]
    cmp r0, #0
    bne .L0802F8C2
    movs r1, #1
.L0802F8C2:
    cmp r1, #0
    bne .L0802F8CA
    bl .L08031F0E
.L0802F8CA:
    movs r0, #0
    ldr r5, [sp, #0x13c]
    strb r0, [r5]
    mov r6, sl
    ldr r1, [r6, #0x38]
    adds r1, #0x54
    mov r0, sp
    bl func_0800F294
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F204
    mov r4, sl
    adds r4, #0xa8
    str r0, [r4]
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    bl func_0800F388
    mov r1, sl
    adds r1, #0xb0
    strb r0, [r1]
    ldr r0, [r4]
    adds r5, r4, #0
    cmp r0, #0
    beq .L0802F906
    cmp r0, #1
    beq .L0802F924
    b .L0802F940
.L0802F906:
    mov r7, sl
    ldr r1, [r7, #0x38]
    adds r1, #0x54
    add r4, sp, #4
    adds r0, r4, #0
    bl func_0800F20C
    adds r0, r4, #0
    bl GetId__C4Food
    mov r1, sl
    adds r1, #0xac
    str r0, [r1]
    adds r7, r4, #0
    b .L0802F942
.L0802F924:
    mov r1, sl
    ldr r0, [r1, #0x38]
    adds r0, #0x54
    bl func_0800F258
    adds r1, r0, #0
    mov r0, sp
    adds r0, #0x42
    strb r1, [r0]
    bl GetId__C7Article
    mov r1, sl
    adds r1, #0xac
    str r0, [r1]
.L0802F940:
    add r7, sp, #4
.L0802F942:
    mov r2, sl
    ldr r0, [r2, #0x38]
    adds r0, #0x54
    bl func_0800F390
    ldr r0, [r5]
    cmp r0, #1
    bne .L0802F964
    mov r0, sl
    adds r0, #0xac
    ldr r0, [r0]
    cmp r0, #0x35
    bne .L0802F964
    mov r3, sl
    ldr r0, [r3, #0x38]
    bl func_0800ED2C
.L0802F964:
    mov r0, sl
    bl func_0802A7D8
    mov r4, sl
    movs r5, #0xa
    ldrsh r3, [r4, r5]
    movs r0, #0xe
    ldrsh r6, [r4, r0]
    mov sb, r6
    mov r0, sl
    adds r0, #0x20
    ldrb r0, [r0]
    adds r1, r0, #0
    cmp r0, #1
    beq .L0802F99C
    cmp r0, #1
    bgt .L0802F98C
    cmp r0, #0
    beq .L0802F996
    b .L0802F9AA
.L0802F98C:
    cmp r1, #2
    beq .L0802F9A4
    cmp r1, #3
    beq .L0802F9A8
    b .L0802F9AA
.L0802F996:
    movs r1, #0x14
    add sb, r1
    b .L0802F9AA
.L0802F99C:
    movs r2, #0x14
    rsbs r2, r2, #0
    add sb, r2
    b .L0802F9AA
.L0802F9A4:
    subs r3, #0x14
    b .L0802F9AA
.L0802F9A8:
    adds r3, #0x14
.L0802F9AA:
    mov r4, sl
    ldrh r1, [r4, #4]
    ldr r5, .L0802FA28 @ =0x000003FF
    adds r6, r5, #0
    ands r1, r6
    ldrh r2, [r7]
    ldr r4, .L0802FA2C @ =0xFFFFFC00
    adds r0, r4, #0
    ands r0, r2
    orrs r0, r1
    strh r0, [r7]
    lsls r3, r3, #0x10
    lsrs r1, r3, #0x10
    movs r0, #0x3f
    mov r8, r0
    ands r1, r0
    lsls r1, r1, #2
    ldrb r5, [r7, #1]
    movs r2, #3
    adds r0, r2, #0
    ands r0, r5
    orrs r0, r1
    strb r0, [r7, #1]
    lsrs r3, r3, #0x16
    ands r3, r6
    ldrh r1, [r7, #2]
    adds r0, r4, #0
    ands r0, r1
    orrs r0, r3
    strh r0, [r7, #2]
    mov r3, sb
    lsls r1, r3, #0x10
    lsrs r0, r1, #0x10
    mov r5, r8
    ands r0, r5
    lsls r0, r0, #2
    ldrb r3, [r7, #3]
    ands r2, r3
    orrs r2, r0
    strb r2, [r7, #3]
    lsrs r1, r1, #0x16
    ands r1, r6
    ldrh r0, [r7, #4]
    ands r4, r0
    orrs r4, r1
    strh r4, [r7, #4]
    mov r6, sl
    ldr r0, [r6]
    ldr r1, [r0]
    movs r2, #0xac
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r3, [r1]
    adds r1, r7, #0
    mov r2, sp
    bl _call_via_r3
    mov r1, sl
    adds r1, #0xc5
    strb r0, [r1]
    bl .L08031F0E
    .align 2, 0
.L0802FA28: .4byte 0x000003FF
.L0802FA2C: .4byte 0xFFFFFC00
.L0802FA30:
    mov r1, sl
    adds r1, #0x3d
    ldrb r0, [r1]
    subs r0, #1
    strb r0, [r1]
    lsls r0, r0, #0x18
    lsrs r5, r0, #0x18
    cmp r5, #0
    beq .L0802FA46
    bl .L08031F0E
.L0802FA46:
    ldr r3, [sp, #0x13c]
    strb r5, [r3]
    adds r1, #0x3d
    movs r0, #1
    strb r0, [r1]
    mov r0, sl
    bl func_0802A7D8
    mov r6, sl
    ldr r4, [r6, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #0x43
    strb r1, [r0]
    bl GetId__C4Tool
    cmp r0, #0x4c
    bne .L0802FA7E
    bl .L08031BEE
.L0802FA7E:
    cmp r0, #0x4c
    bgt .L0802FA8A
    cmp r0, #0x4b
    beq .L0802FABC
    bl .L08031F0E
.L0802FA8A:
    cmp r0, #0x4d
    beq .L0802FA92
    bl .L08031F0E
.L0802FA92:
    mov r7, sl
    ldr r0, [r7, #0x38]
    bl func_0800E4FC
    cmp r0, #0x64
    bne .L0802FAA2
    bl .L08031F0E
.L0802FAA2:
    ldr r0, [r7]
    ldr r3, [r0]
    movs r1, #0xa0
    lsls r1, r1, #1
    adds r3, r3, r1
    add r1, sp, #0x44
    ldr r2, .L0802FAB8 @ =0x000003DF
    str r2, [sp, #0x44]
    str r5, [r1, #4]
    ldr r3, [r3]
    b .L0802FC00
    .align 2, 0
.L0802FAB8: .4byte 0x000003DF
.L0802FABC:
    mov r0, sp
    mov r1, sl
    bl GetLocation__C7AEntity
    mov r4, sl
    adds r4, #0x20
    ldrb r2, [r4]
    add r0, sp, #0x4c
    mov r1, sl
    bl func_0802AB98
    ldr r0, [sp, #0x4c]
    ldr r1, [sp, #0x50]
    str r0, [sp, #0x54]
    str r1, [sp, #0x58]
    add r2, sp, #0x54
    mov r3, sl
    ldr r0, [r3]
    ldr r1, [r0]
    movs r6, #0x9a
    lsls r6, r6, #1
    adds r1, r1, r6
    ldr r3, [r1]
    mov r1, sp
    bl _call_via_r3
    adds r3, r0, #0
    subs r0, r3, #1
    cmp r0, #0x29
    bhi .L0802FB3C
    mov r7, sl
    ldr r0, [r7]
    ldr r1, [r0]
    movs r2, #0x96
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r2, [r1]
    adds r1, r3, #0
    bl _call_via_r2
    adds r2, r0, #0
    cmp r2, #0
    bne .L0802FB16
    bl .L08031F0E
.L0802FB16:
    ldr r0, [r2, #0x14]
    ldr r1, [r0, #0x34]
    adds r0, r2, #0
    bl _call_via_r1
    adds r3, r0, #0
    cmp r3, #0
    bne .L0802FB2A
    bl .L08031F0E
.L0802FB2A:
    ldr r0, [r7]
    ldr r2, [r0]
    movs r4, #0xa0
    lsls r4, r4, #1
    adds r2, r2, r4
    add r1, sp, #0x5c
    str r3, [sp, #0x5c]
    str r5, [r1, #4]
    b .L0802FBFE
.L0802FB3C:
    ldrb r0, [r4]
    cmp r0, #1
    beq .L0802FB56
    cmp r0, #1
    bgt .L0802FB4C
    cmp r0, #0
    beq .L0802FB78
    b .L0802FBDA
.L0802FB4C:
    cmp r0, #2
    beq .L0802FBBC
    cmp r0, #3
    beq .L0802FBC6
    b .L0802FBDA
.L0802FB56:
    mov r3, sp
    mov r0, sp
    ldrb r4, [r0, #3]
    lsrs r2, r4, #2
    ldrh r1, [r0, #4]
    ldr r5, .L0802FB70 @ =0x000003FF
    ands r1, r5
    lsls r1, r1, #6
    orrs r1, r2
    lsls r1, r1, #0x10
    ldr r6, .L0802FB74 @ =0xFFF00000
    adds r1, r1, r6
    b .L0802FB92
    .align 2, 0
.L0802FB70: .4byte 0x000003FF
.L0802FB74: .4byte 0xFFF00000
.L0802FB78:
    mov r3, sp
    mov r0, sp
    ldrb r4, [r0, #3]
    lsrs r2, r4, #2
    ldrh r1, [r0, #4]
    ldr r5, .L0802FBB4 @ =0x000003FF
    ands r1, r5
    lsls r1, r1, #6
    orrs r1, r2
    lsls r1, r1, #0x10
    movs r7, #0x80
    lsls r7, r7, #0xd
    adds r1, r1, r7
.L0802FB92:
    lsrs r2, r1, #0x10
    movs r0, #0x3f
    ands r2, r0
    lsls r2, r2, #2
    movs r0, #3
    ands r0, r4
    orrs r0, r2
    strb r0, [r3, #3]
    lsrs r1, r1, #0x16
    ands r1, r5
    ldrh r2, [r3, #4]
    ldr r0, .L0802FBB8 @ =0xFFFFFC00
    ands r0, r2
    orrs r0, r1
    strh r0, [r3, #4]
    b .L0802FBDA
    .align 2, 0
.L0802FBB4: .4byte 0x000003FF
.L0802FBB8: .4byte 0xFFFFFC00
.L0802FBBC:
    ldr r0, [sp]
    lsls r1, r0, #6
    asrs r1, r1, #0x10
    subs r1, #0x10
    b .L0802FBCE
.L0802FBC6:
    ldr r0, [sp]
    lsls r1, r0, #6
    asrs r1, r1, #0x10
    adds r1, #0x10
.L0802FBCE:
    lsls r1, r1, #0x10
    lsrs r1, r1, #6
    ldr r2, .L0802FC0C @ =0xFC0003FF
    ands r2, r0
    orrs r2, r1
    str r2, [sp]
.L0802FBDA:
    mov r0, sp
    bl func_080A45A8
    cmp r0, #2
    beq .L0802FBE8
    bl .L08031F0E
.L0802FBE8:
    mov r1, sl
    ldr r0, [r1]
    ldr r2, [r0]
    movs r3, #0xa0
    lsls r3, r3, #1
    adds r2, r2, r3
    add r1, sp, #0x64
    ldr r3, .L0802FC10 @ =0x0000034F
    movs r4, #0
    str r3, [sp, #0x64]

    thumb_func_start sub_0802FBFC
sub_0802FBFC: @ 0x0802FBFC
    str r4, [r1, #4]
.L0802FBFE:
    ldr r3, [r2]
.L0802FC00:
    movs r2, #0
    bl _call_via_r3
    bl .L08031F0E
    .align 2, 0
.L0802FC0C: .4byte 0xFC0003FF
.L0802FC10: .4byte 0x0000034F
.L0802FC14:
    movs r1, #0
    mov r4, sl
    ldrh r0, [r4, #0x24]
    cmp r0, #0
    bne .L0802FC20
    movs r1, #1
.L0802FC20:
    adds r3, r1, #0
    cmp r3, #0
    bne .L0802FC2A
    bl sub_08030E0A
.L0802FC2A:
    mov r1, sl
    adds r1, #0x78
    movs r0, #0
    strb r0, [r1]
    movs r3, #0
    mov r5, sl
    ldrh r2, [r5, #4]
    str r1, [sp, #0x160]
    cmp r2, #0x33
    ble .L0802FC46
    ldr r0, .L0802FC94 @ =0x00000233
    cmp r2, r0
    bgt .L0802FC46
    movs r3, #1
.L0802FC46:
    adds r6, r3, #0
    mov r0, sl
    adds r0, #0x3f
    ldrb r1, [r0]
    adds r7, r0, #0
    cmp r1, #0
    blt .L0802FCBC
    cmp r1, #1
    ble .L0802FC60
    cmp r1, #4
    bgt .L0802FCBC
    cmp r1, #3
    blt .L0802FCBC
.L0802FC60:
    ldr r0, .L0802FC98 @ =gUnk_080F1170
    ldr r1, [r0]
    ldr r2, [r0, #4]
    mov r0, sl
    bl func_0802AC2C
    mov r0, sl
    adds r0, #0xb2
    ldrb r3, [r0]
    movs r1, #0
    adds r0, r3, #0
    subs r0, #0x2b
    cmp r0, #0x1a
    bhi .L0802FC7E
    movs r1, #1
.L0802FC7E:
    cmp r1, #0
    beq .L0802FC9C
    mov r1, sl
    ldr r0, [r1]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    adds r1, r3, #0
    bl _call_via_r2
    adds r4, r0, #0
    b .L0802FC9E
    .align 2, 0
.L0802FC94: .4byte 0x00000233
.L0802FC98: .4byte gUnk_080F1170
.L0802FC9C:
    movs r4, #0
.L0802FC9E:
    cmp r4, #0
    beq .L0802FCBC
    ldr r0, [r4, #0x14]
    ldr r1, [r0, #0x44]
    adds r0, r4, #0
    bl _call_via_r1
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802FCBC
    ldr r0, [r4, #0x14]
    ldr r1, [r0, #0x64]
    adds r0, r4, #0
    bl _call_via_r1
.L0802FCBC:
    mov r2, sl
    ldr r4, [r2, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    add r0, sp, #0x6c
    strb r1, [r0]
    bl GetId__C4Tool
    cmp r0, #0x15
    beq .L0802FCE4
    cmp r0, #0x2d
    beq .L0802FD44
    b .L0802FD9A
.L0802FCE4:
    mov r3, sl
    ldr r0, [r3, #0x34]
    movs r4, #0xd2
    lsls r4, r4, #6
    adds r0, r0, r4
    movs r1, #0x15
    bl func_0809C4B4
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802FD9A
    mov r0, sl
    ldr r5, [r0, #0x38]
    mov r4, sp
    adds r4, #0x6d
    adds r0, r4, #0
    movs r1, #0x16
    bl __4ToolUi
    ldrb r1, [r4]
    mov r0, sp
    movs r2, #1
    bl __9ToolStackG4ToolUi
    adds r5, #0x5c
    adds r0, r5, #0
    mov r1, sp
    movs r2, #2
    bl memcpy
    mov r1, sl
    ldr r0, [r1]
    ldr r2, [r0]
    movs r3, #0xa0
    lsls r3, r3, #1
    adds r2, r2, r3
    add r1, sp, #0x70
    ldr r3, .L0802FD40 @ =0x000003DE
    movs r4, #0
    str r3, [sp, #0x70]
    str r4, [r1, #4]
    ldr r3, [r2]
    movs r2, #0
    bl _call_via_r3
    b .L0802FD9A
    .align 2, 0
.L0802FD40: .4byte 0x000003DE
.L0802FD44:
    mov r4, sl
    ldr r0, [r4, #0x34]
    movs r5, #0xd2
    lsls r5, r5, #6
    adds r0, r0, r5
    movs r1, #0x2d
    bl func_0809C4B4
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0802FD9A
    ldr r5, [r4, #0x38]
    add r4, sp, #0x78
    adds r0, r4, #0
    movs r1, #0x2e
    bl __4ToolUi
    ldrb r1, [r4]
    mov r0, sp
    movs r2, #1
    bl __9ToolStackG4ToolUi
    adds r5, #0x5c
    adds r0, r5, #0
    mov r1, sp
    movs r2, #2
    bl memcpy
    mov r1, sl
    ldr r0, [r1]
    ldr r2, [r0]
    movs r3, #0xa0
    lsls r3, r3, #1
    adds r2, r2, r3
    add r1, sp, #0x7c
    ldr r3, .L0802FDB0 @ =0x000003DE
    movs r4, #0
    str r3, [sp, #0x7c]
    str r4, [r1, #4]
    ldr r3, [r2]
    movs r2, #0
    bl _call_via_r3
.L0802FD9A:
    ldrb r0, [r7]
    cmp r0, #0xd
    bls .L0802FDA4
    bl .L08031C7C
.L0802FDA4:
    lsls r0, r0, #2
    ldr r1, .L0802FDB4 @ =.L0802FDB8
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L0802FDB0: .4byte 0x000003DE
.L0802FDB4: .4byte .L0802FDB8
.L0802FDB8: @ jump table
    .4byte .L0802FDF0 @ case 0
    .4byte .L0802FECA @ case 1
    .4byte .L0802FFE8 @ case 2
    .4byte .L080300E2 @ case 3
    .4byte .L08030260 @ case 4
    .4byte .L0803058C @ case 5
    .4byte .L080309F0 @ case 6
    .4byte .L08030AA6 @ case 7
    .4byte .L0803080C @ case 8
    .4byte .L08030BD6 @ case 9
    .4byte .L08030C2A @ case 10
    .4byte .L08030D08 @ case 11
    .4byte .L08030DD4 @ case 12
    .4byte .L08030B5A @ case 13
.L0802FDF0:
    ldr r0, .L0802FE14 @ =gUnk_080F1230
    mov r4, sl
    str r0, [r4, #0x48]
    mov r1, sl
    adds r1, #0x4e
    movs r0, #1
    strb r0, [r1]
    mov r0, sl
    adds r0, #0x40
    ldrb r0, [r0]
    cmp r0, #6
    bhi .L0802FEC4
    lsls r0, r0, #2
    ldr r1, .L0802FE18 @ =.L0802FE1C
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L0802FE14: .4byte gUnk_080F1230
.L0802FE18: .4byte .L0802FE1C
.L0802FE1C: @ jump table
    .4byte .L0802FE38 @ case 0
    .4byte .L0802FE4C @ case 1
    .4byte .L0802FE60 @ case 2
    .4byte .L0802FE74 @ case 3
    .4byte .L0802FE88 @ case 4
    .4byte .L0802FE9C @ case 5
    .4byte .L0802FEB0 @ case 6
.L0802FE38:
    mov r0, sl
    adds r0, #0x4c
    movs r1, #3
    strb r1, [r0]
    adds r0, #1
    strb r1, [r0]
    mov r1, sl
    adds r1, #0x4f
    movs r0, #1
    b .L0802FEC2
.L0802FE4C:
    mov r1, sl
    adds r1, #0x4c
    movs r0, #2
    strb r0, [r1]
    adds r1, #1
    movs r0, #4
    strb r0, [r1]
    adds r1, #2
    movs r0, #1
    b .L0802FEC2
.L0802FE60:
    mov r1, sl
    adds r1, #0x4c
    movs r0, #0
    strb r0, [r1]
    adds r1, #1
    movs r0, #5
    strb r0, [r1]
    adds r1, #2
    movs r0, #1
    b .L0802FEC2
.L0802FE74:
    mov r1, sl
    adds r1, #0x4c
    movs r0, #0
    strb r0, [r1]
    adds r1, #1
    movs r0, #8
    strb r0, [r1]
    adds r1, #2
    movs r0, #1
    b .L0802FEC2
.L0802FE88:
    mov r1, sl
    adds r1, #0x4c
    movs r0, #0
    strb r0, [r1]
    adds r1, #1
    movs r0, #0x18
    strb r0, [r1]
    adds r1, #2
    movs r0, #2
    b .L0802FEC2
.L0802FE9C:
    mov r1, sl
    adds r1, #0x4c
    movs r0, #0
    strb r0, [r1]
    adds r1, #1
    movs r0, #0x50
    strb r0, [r1]
    adds r1, #2
    movs r0, #3
    b .L0802FEC2
.L0802FEB0:
    mov r1, sl
    adds r1, #0x4c
    movs r0, #0
    strb r0, [r1]
    adds r1, #1
    movs r0, #0xe0
    strb r0, [r1]
    adds r1, #2
    movs r0, #4
.L0802FEC2:
    strb r0, [r1]
.L0802FEC4:
    movs r0, #0x1c
    bl sub_08031A5E
.L0802FECA:
    mov r0, sl
    adds r0, #0x40
    ldrb r1, [r0]
    str r0, [sp, #0x140]
    cmp r1, #4
    bls .L0802FEF0
    mov r6, sl
    ldr r0, [r6]
    ldr r3, [r0]
    adds r3, #0xf0
    ldrh r1, [r6, #4]
    ldr r7, [sp, #0x140]
    ldrb r2, [r7]
    ldr r3, [r3]
    bl _call_via_r3
    ldr r1, [sp, #0x160]
    strb r0, [r1]
    b .L0802FFAA
.L0802FEF0:
    mov r2, sl
    movs r3, #0xa
    ldrsh r4, [r2, r3]
    movs r5, #0xe
    ldrsh r7, [r2, r5]
    mov r0, sl
    adds r0, #0x20
    ldrb r0, [r0]
    cmp r0, #1
    beq .L0802FF18
    cmp r0, #1
    bgt .L0802FF0E
    cmp r0, #0
    beq .L0802FF1C
    b .L0802FF26
.L0802FF0E:
    cmp r0, #2
    beq .L0802FF20
    cmp r0, #3
    beq .L0802FF24
    b .L0802FF26
.L0802FF18:
    subs r7, #0x10
    b .L0802FF26
.L0802FF1C:
    adds r7, #0x10
    b .L0802FF26
.L0802FF20:
    subs r4, #0x10
    b .L0802FF26
.L0802FF24:
    adds r4, #0x10
.L0802FF26:
    mov r6, sl
    ldr r0, [r6]
    ldr r1, [r0]
    adds r1, #0xd0
    str r1, [sp, #0x100]
    ldrh r2, [r6, #4]
    mov r6, sp
    ldr r1, .L0802FFDC @ =0x000003FF
    mov sb, r1
    mov r3, sb
    ands r2, r3
    ldrh r3, [r6]
    ldr r5, .L0802FFE0 @ =0xFFFFFC00
    adds r1, r5, #0
    ands r1, r3
    orrs r1, r2
    strh r1, [r6]
    lsls r4, r4, #0x10
    lsrs r2, r4, #0x10
    movs r1, #0x3f
    mov ip, r1
    ands r2, r1
    lsls r2, r2, #2
    str r2, [sp, #0x184]
    ldrb r2, [r6, #1]
    mov r8, r2
    movs r3, #3
    adds r1, r3, #0
    mov r2, r8
    ands r1, r2
    ldr r2, [sp, #0x184]
    orrs r1, r2
    strb r1, [r6, #1]
    lsrs r4, r4, #0x16
    mov r1, sb
    ands r4, r1
    ldrh r2, [r6, #2]
    adds r1, r5, #0
    ands r1, r2
    orrs r1, r4
    strh r1, [r6, #2]
    lsls r2, r7, #0x10
    lsrs r1, r2, #0x10
    mov r4, ip
    ands r1, r4
    lsls r1, r1, #2
    ldrb r4, [r6, #3]
    ands r3, r4
    orrs r3, r1
    strb r3, [r6, #3]
    lsrs r2, r2, #0x16
    mov r7, sb
    ands r2, r7
    ldrh r1, [r6, #4]
    ands r5, r1
    orrs r5, r2
    strh r5, [r6, #4]
    ldr r1, [sp, #0x140]
    ldrb r2, [r1]
    ldr r4, [sp, #0x100]
    ldr r3, [r4]
    mov r1, sp
    bl _call_via_r3
    ldr r5, [sp, #0x160]
    strb r0, [r5]
.L0802FFAA:
    mov r6, sl
    ldr r0, [r6, #0x34]
    ldr r7, .L0802FFE4 @ =0x000034C4
    adds r0, r0, r7
    ldrb r0, [r0]
    cmp r0, #0
    bne .L0802FFD4
    ldr r0, [r6, #0x38]
    movs r1, #2
.L0802FFBC:
    bl func_0800EB2C
    adds r2, r0, #0
    ldr r1, [sp, #0x160]
    ldrb r0, [r1]
    movs r1, #0x32
    cmp r0, #0
    beq .L0802FFCE
    movs r1, #0x64
.L0802FFCE:
    adds r0, r2, #0
    bl func_0800EF88
.L0802FFD4:
    movs r0, #0
    bl .L08031F0A
    .align 2, 0
.L0802FFDC: .4byte 0x000003FF
.L0802FFE0: .4byte 0xFFFFFC00
.L0802FFE4: .4byte 0x000034C4
.L0802FFE8:
    mov r1, sl
    adds r1, #0x4a
    movs r0, #0
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    mov r0, sl
    adds r0, #0x40
    ldrb r0, [r0]
    cmp r0, #6
    bhi .L080300DC
    lsls r0, r0, #2
    ldr r1, .L08030008 @ =.L0803000C
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L08030008: .4byte .L0803000C
.L0803000C: @ jump table
    .4byte .L08030028 @ case 0
    .4byte .L0803003A @ case 1
    .4byte .L08030058 @ case 2
    .4byte .L08030072 @ case 3
    .4byte .L0803008E @ case 4
    .4byte .L080300A8 @ case 5
    .4byte .L080300C2 @ case 6
.L08030028:
    mov r0, sl
    adds r0, #0x48
    movs r2, #0
    movs r1, #1
    strb r1, [r0]
    adds r0, #1
    strb r2, [r0]
    adds r0, #3
    b .L08030086
.L0803003A:
    mov r0, sl
    adds r0, #0x48
    movs r1, #1
    strb r1, [r0]
    mov r2, sl
    adds r2, #0x49
    movs r0, #0xff
    strb r0, [r2]
    mov r0, sl
    adds r0, #0x4c
    strb r1, [r0]
    mov r1, sl
    adds r1, #0x4d
    movs r0, #3
    b .L080300DA
.L08030058:
    mov r1, sl
    adds r1, #0x48
    movs r0, #1
    strb r0, [r1]
    adds r1, #1
    movs r0, #0xff
    strb r0, [r1]
    adds r1, #3
    movs r0, #2
    strb r0, [r1]
    adds r1, #1
    movs r0, #3
    b .L080300DA
.L08030072:
    mov r1, sl
    adds r1, #0x48
    movs r0, #1
    strb r0, [r1]
    adds r1, #1
    movs r0, #0xff
    strb r0, [r1]
    mov r0, sl
    adds r0, #0x4c
    movs r1, #3
.L08030086:
    strb r1, [r0]
    adds r0, #1
    strb r1, [r0]
    b .L080300DC
.L0803008E:
    mov r1, sl
    adds r1, #0x48
    movs r0, #1
    strb r0, [r1]
    adds r1, #1
    movs r0, #0xfe
    strb r0, [r1]
    adds r1, #3
    movs r0, #3
    strb r0, [r1]
    adds r1, #1
    movs r0, #5
    b .L080300DA
.L080300A8:
    mov r1, sl
    adds r1, #0x48
    movs r0, #1
    strb r0, [r1]
    adds r1, #1
    movs r0, #0xfa
    strb r0, [r1]
    adds r1, #3
    movs r0, #6
    strb r0, [r1]
    adds r1, #1
    movs r0, #0xd
    b .L080300DA
.L080300C2:
    mov r1, sl
    adds r1, #0x48
    movs r0, #1
    strb r0, [r1]
    adds r1, #1
    movs r0, #0xf6
    strb r0, [r1]
    adds r1, #3
    movs r0, #0xc
    strb r0, [r1]
    adds r1, #1
    movs r0, #0x15
.L080300DA:
    strb r0, [r1]
.L080300DC:
    movs r0, #0x1a
    bl .L08031E84
.L080300E2:
    cmp r6, #0
    beq .L080301C8
    mov r5, sl
    movs r6, #0xa
    ldrsh r4, [r5, r6]
    movs r0, #0xe
    ldrsh r7, [r5, r0]
    mov r0, sl
    adds r0, #0x20
    ldrb r0, [r0]
    adds r1, r0, #0
    cmp r0, #1
    beq .L08030110
    cmp r0, #1
    bgt .L08030106
    cmp r0, #0
    beq .L08030114
    b .L0803011E
.L08030106:
    cmp r1, #2
    beq .L08030118
    cmp r1, #3
    beq .L0803011C
    b .L0803011E
.L08030110:
    subs r7, #0x10
    b .L0803011E
.L08030114:
    adds r7, #0x10
    b .L0803011E
.L08030118:
    subs r4, #0x10
    b .L0803011E
.L0803011C:
    adds r4, #0x10
.L0803011E:
    mov r1, sl
    ldr r0, [r1]
    ldr r1, [r0]
    adds r1, #0xc8
    str r1, [sp, #0x104]
    mov r3, sl
    ldrh r2, [r3, #4]
    mov r6, sp
    ldr r5, .L080301BC @ =0x000003FF
    mov sb, r5
    mov r1, sb
    ands r2, r1
    ldrh r3, [r6]
    ldr r5, .L080301C0 @ =0xFFFFFC00
    adds r1, r5, #0
    ands r1, r3
    orrs r1, r2
    strh r1, [r6]
    lsls r4, r4, #0x10
    lsrs r2, r4, #0x10
    movs r3, #0x3f
    mov ip, r3
    ands r2, r3
    lsls r2, r2, #2
    str r2, [sp, #0x184]
    ldrb r1, [r6, #1]
    mov r8, r1
    movs r3, #3
    adds r1, r3, #0
    mov r2, r8
    ands r1, r2
    ldr r2, [sp, #0x184]
    orrs r1, r2
    strb r1, [r6, #1]
    lsrs r4, r4, #0x16
    mov r1, sb
    ands r4, r1
    ldrh r2, [r6, #2]
    adds r1, r5, #0
    ands r1, r2
    orrs r1, r4
    strh r1, [r6, #2]
    lsls r2, r7, #0x10
    lsrs r1, r2, #0x10
    mov r4, ip
    ands r1, r4
    lsls r1, r1, #2
    ldrb r4, [r6, #3]
    ands r3, r4
    orrs r3, r1
    strb r3, [r6, #3]
    lsrs r2, r2, #0x16
    mov r7, sb
    ands r2, r7
    ldrh r1, [r6, #4]
    ands r5, r1
    orrs r5, r2
    strh r5, [r6, #4]
    add r4, sp, #0x84
    ldr r1, [sp, #0x104]
    ldr r3, [r1]
    mov r1, sp
    adds r2, r4, #0
    bl _call_via_r3
    ldr r2, [sp, #0x160]
    strb r0, [r2]
    mov r3, sl
    ldr r0, [r3, #0x34]
    ldr r5, .L080301C4 @ =0x000034C4
    adds r0, r0, r5
    ldrb r0, [r0]
    cmp r0, #0
    beq .L080301B4
    b .L0803034C
.L080301B4:
    ldr r0, [r3, #0x38]
    movs r1, #0
    b .L08030334
    .align 2, 0
.L080301BC: .4byte 0x000003FF
.L080301C0: .4byte 0xFFFFFC00
.L080301C4: .4byte 0x000034C4
.L080301C8:
    mov r0, sl
    adds r0, #0x48
    strb r6, [r0]
    adds r0, #8
    movs r4, #0
    strh r6, [r0]
    adds r0, #2
    strb r4, [r0]
    mov r7, sl
    ldr r0, [r7]
    ldr r1, [r0]
    adds r1, #0xf4
    ldr r1, [r1]
    bl _call_via_r1
    ldr r1, .L08030218 @ =gUnk_080F1178
    mov r2, sl
    adds r2, #0x40
    ldrb r0, [r2]
    adds r0, r0, r1
    ldrb r0, [r0]
    mov r1, sl
    adds r1, #0x49
    strb r0, [r1]
    ldrb r0, [r2]
    cmp r0, #4
    bhi .L0803021C
    mov r0, sl
    adds r0, #0x4a
    strb r4, [r0]
    adds r0, #1
    strb r4, [r0]
    adds r0, #1
    movs r1, #1
    strb r1, [r0]
    adds r0, #1
    strb r4, [r0]
    adds r0, #1
    strb r4, [r0]
    b .L0803025A
    .align 2, 0
.L08030218: .4byte gUnk_080F1178
.L0803021C:
    cmp r0, #5
    bhi .L0803023E
    mov r0, sl
    adds r0, #0x4a
    strb r4, [r0]
    mov r1, sl
    adds r1, #0x4b
    movs r0, #1
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    mov r0, sl
    adds r0, #0x4e
    strb r4, [r0]
    b .L0803025A
.L0803023E:
    cmp r0, #6
    bhi .L0803025A
    mov r1, sl
    adds r1, #0x4a
    movs r0, #1
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
    adds r1, #1
    strb r0, [r1]
.L0803025A:
    movs r0, #0x19
    bl .L08031C7E
.L08030260:
    cmp r6, #0
    bne .L08030266
    b .L08030364
.L08030266:
    mov r2, sl
    movs r3, #0xa
    ldrsh r4, [r2, r3]
    movs r5, #0xe
    ldrsh r7, [r2, r5]
    mov r0, sl
    adds r0, #0x20
    ldrb r0, [r0]
    adds r1, r0, #0
    cmp r0, #1
    beq .L08030290
    cmp r0, #1
    bgt .L08030286
    cmp r0, #0
    beq .L08030294
    b .L0803029E
.L08030286:
    cmp r1, #2
    beq .L08030298
    cmp r1, #3
    beq .L0803029C
    b .L0803029E
.L08030290:
    subs r7, #0x10
    b .L0803029E
.L08030294:
    adds r7, #0x10
    b .L0803029E
.L08030298:
    subs r4, #0x10
    b .L0803029E
.L0803029C:
    adds r4, #0x10
.L0803029E:
    mov r6, sl
    ldr r0, [r6]
    ldr r1, [r0]
    adds r1, #0xcc
    str r1, [sp, #0x108]
    ldrh r2, [r6, #4]
    mov r6, sp
    ldr r1, .L08030358 @ =0x000003FF
    mov sb, r1
    mov r3, sb
    ands r2, r3
    ldrh r3, [r6]
    ldr r5, .L0803035C @ =0xFFFFFC00
    adds r1, r5, #0
    ands r1, r3
    orrs r1, r2
    strh r1, [r6]
    lsls r4, r4, #0x10
    lsrs r2, r4, #0x10
    movs r1, #0x3f
    mov ip, r1
    ands r2, r1
    lsls r2, r2, #2
    str r2, [sp, #0x184]
    ldrb r2, [r6, #1]
    mov r8, r2
    movs r3, #3
    adds r1, r3, #0
    mov r2, r8
    ands r1, r2
    ldr r2, [sp, #0x184]
    orrs r1, r2
    strb r1, [r6, #1]
    lsrs r4, r4, #0x16
    mov r1, sb
    ands r4, r1
    ldrh r2, [r6, #2]
    adds r1, r5, #0
    ands r1, r2
    orrs r1, r4
    strh r1, [r6, #2]
    lsls r2, r7, #0x10
    lsrs r1, r2, #0x10
    mov r4, ip
    ands r1, r4
    lsls r1, r1, #2
    ldrb r4, [r6, #3]
    ands r3, r4
    orrs r3, r1
    strb r3, [r6, #3]
    lsrs r2, r2, #0x16
    mov r7, sb
    ands r2, r7
    ldrh r1, [r6, #4]
    ands r5, r1
    orrs r5, r2
    strh r5, [r6, #4]
    add r4, sp, #0x88
    ldr r1, [sp, #0x108]
    ldr r3, [r1]
    mov r1, sp
    adds r2, r4, #0
    bl _call_via_r3
    ldr r2, [sp, #0x160]
    strb r0, [r2]
    mov r3, sl
    ldr r0, [r3, #0x34]
    ldr r5, .L08030360 @ =0x000034C4
    adds r0, r0, r5
    ldrb r0, [r0]
    cmp r0, #0
    bne .L0803034C
    ldr r0, [r3, #0x38]
    movs r1, #3
.L08030334:
    bl func_0800EB2C
    adds r2, r0, #0
    ldr r6, [sp, #0x160]
    ldrb r0, [r6]
    movs r1, #0x32
    cmp r0, #0
    beq .L08030346
    movs r1, #0x64
.L08030346:
    adds r0, r2, #0
    bl func_0800EF88
.L0803034C:
    ldr r1, [r4]
    mov r0, sl
    bl func_08025B64
    bl .L08031F0E
    .align 2, 0
.L08030358: .4byte 0x000003FF
.L0803035C: .4byte 0xFFFFFC00
.L08030360: .4byte 0x000034C4
.L08030364:
    mov r0, sl
    adds r0, #0x40
    ldrb r1, [r0]
    str r0, [sp, #0x140]
    cmp r1, #6
    bne .L08030382
    mov r7, sl
    ldr r0, [r7]
    ldr r3, [r0]
    adds r3, #0xec
    ldrh r1, [r7, #4]
    ldr r4, [sp, #0x140]
    ldrb r2, [r4]
    ldr r3, [r3]
    b .L08030560
.L08030382:
    cmp r1, #5
    beq .L08030388
    b .L080304AC
.L08030388:
    movs r1, #0
    mov r6, sl
    adds r6, #0x20
    str r6, [sp, #0x138]
    add r7, sp, #0x8c
    mov r8, r7
    mov r7, sp
    mov sb, r8
.L08030398:
    movs r0, #0
    subs r2, r1, #4
    str r2, [sp, #0x12c]
    adds r1, #1
    str r1, [sp, #0x130]
    str r2, [sp, #0x10c]
.L080303A4:
    adds r0, #1
    mov r3, r8
    str r0, [r3]
    ldr r4, [sp, #0x10c]
    mov r5, sb
    str r4, [r5, #4]
    ldr r6, [sp, #0x138]
    ldrb r1, [r6]
    str r0, [sp, #0x134]
    cmp r1, #1
    beq .L080303D8
    cmp r1, #1
    bgt .L080303C4
    cmp r1, #0
    beq .L080303CA
    b .L080303F4
.L080303C4:
    cmp r1, #2
    beq .L080303EA
    b .L080303F4
.L080303CA:
    mov r0, r8
    ldr r1, [r0]
    ldr r2, [sp, #0x10c]
    mov r3, sb
    str r2, [r3]
    str r1, [r3, #4]
    b .L080303F4
.L080303D8:
    mov r4, r8
    ldr r1, [r4]
    ldr r5, [sp, #0x12c]
    rsbs r0, r5, #0
    mov r6, sb
    str r0, [r6]
    rsbs r0, r1, #0
    str r0, [r6, #4]
    b .L080303F4
.L080303EA:
    mov r1, r8
    ldr r0, [r1]
    rsbs r0, r0, #0
    mov r2, sb
    str r0, [r2]
.L080303F4:
    mov r3, sl
    ldr r0, [r3]
    ldr r6, [r0]
    adds r6, #0xc4
    mov ip, r6
    ldrh r4, [r3, #4]
    movs r5, #0xa
    ldrsh r1, [r3, r5]
    mov r6, r8
    ldr r3, [r6]
    mov r5, sl
    movs r6, #0xe
    ldrsh r2, [r5, r6]
    mov r6, sb
    ldr r5, [r6, #4]
    lsls r3, r3, #4
    adds r3, r3, r1
    lsls r5, r5, #4
    adds r5, r5, r2
    ldr r1, .L080304A4 @ =0x000003FF
    ands r4, r1
    ldrh r2, [r7]
    ldr r1, .L080304A8 @ =0xFFFFFC00
    ands r1, r2
    orrs r1, r4
    strh r1, [r7]
    lsls r3, r3, #0x10
    lsrs r2, r3, #0x10
    movs r4, #0x3f
    ands r2, r4
    lsls r2, r2, #2
    ldrb r4, [r7, #1]
    movs r1, #3
    ands r1, r4
    orrs r1, r2
    strb r1, [r7, #1]
    lsrs r3, r3, #0x16
    ldr r6, .L080304A4 @ =0x000003FF
    ands r3, r6
    ldrh r2, [r7, #2]
    ldr r1, .L080304A8 @ =0xFFFFFC00
    ands r1, r2
    orrs r1, r3
    strh r1, [r7, #2]
    lsls r5, r5, #0x10
    lsrs r2, r5, #0x10
    movs r1, #0x3f
    ands r2, r1
    lsls r2, r2, #2
    ldrb r3, [r7, #3]
    movs r1, #3
    ands r1, r3
    orrs r1, r2
    strb r1, [r7, #3]
    lsrs r5, r5, #0x16
    ands r5, r6
    ldrh r2, [r7, #4]
    ldr r1, .L080304A8 @ =0xFFFFFC00
    ands r1, r2
    orrs r1, r5
    strh r1, [r7, #4]
    ldr r3, [sp, #0x140]
    ldrb r2, [r3]
    mov r4, ip
    ldr r3, [r4]
    mov r1, sp
    bl _call_via_r3
    ldr r5, [sp, #0x160]
    ldrb r1, [r5]
    rsbs r2, r1, #0
    orrs r2, r1
    lsls r0, r0, #0x18
    lsrs r0, r0, #0x18
    rsbs r1, r0, #0
    orrs r1, r0
    orrs r1, r2
    lsrs r1, r1, #0x1f
    strb r1, [r5]
    ldr r0, [sp, #0x134]
    cmp r0, #8
    ble .L080303A4
    ldr r1, [sp, #0x130]
    cmp r1, #8
    bgt .L080304A0
    b .L08030398
.L080304A0:
    b .L08030568
    .align 2, 0
.L080304A4: .4byte 0x000003FF
.L080304A8: .4byte 0xFFFFFC00
.L080304AC:
    mov r6, sl
    movs r7, #0xa
    ldrsh r4, [r6, r7]
    movs r0, #0xe
    ldrsh r7, [r6, r0]
    mov r0, sl
    adds r0, #0x20
    ldrb r0, [r0]
    cmp r0, #1
    beq .L080304D4
    cmp r0, #1
    bgt .L080304CA
    cmp r0, #0
    beq .L080304D8
    b .L080304E2
.L080304CA:
    cmp r0, #2
    beq .L080304DC
    cmp r0, #3
    beq .L080304E0
    b .L080304E2
.L080304D4:
    subs r7, #0x10
    b .L080304E2
.L080304D8:
    adds r7, #0x10
    b .L080304E2
.L080304DC:
    subs r4, #0x10
    b .L080304E2
.L080304E0:
    adds r4, #0x10
.L080304E2:
    mov r1, sl
    ldr r0, [r1]
    ldr r1, [r0]
    adds r1, #0xc4
    str r1, [sp, #0x110]
    mov r3, sl
    ldrh r2, [r3, #4]
    mov r6, sp
    ldr r5, .L08030580 @ =0x000003FF
    mov sb, r5
    mov r1, sb
    ands r2, r1
    ldrh r3, [r6]
    ldr r5, .L08030584 @ =0xFFFFFC00
    adds r1, r5, #0
    ands r1, r3
    orrs r1, r2
    strh r1, [r6]
    lsls r4, r4, #0x10
    lsrs r2, r4, #0x10
    movs r3, #0x3f
    mov ip, r3
    ands r2, r3
    lsls r2, r2, #2
    str r2, [sp, #0x184]
    ldrb r1, [r6, #1]
    mov r8, r1
    movs r3, #3
    adds r1, r3, #0
    mov r2, r8
    ands r1, r2
    ldr r2, [sp, #0x184]
    orrs r1, r2
    strb r1, [r6, #1]
    lsrs r4, r4, #0x16
    mov r1, sb
    ands r4, r1
    ldrh r2, [r6, #2]
    adds r1, r5, #0
    ands r1, r2
    orrs r1, r4
    strh r1, [r6, #2]
    lsls r2, r7, #0x10
    lsrs r1, r2, #0x10
    mov r4, ip
    ands r1, r4
    lsls r1, r1, #2
    ldrb r4, [r6, #3]
    ands r3, r4
    orrs r3, r1
    strb r3, [r6, #3]
    lsrs r2, r2, #0x16
    mov r7, sb
    ands r2, r7
    ldrh r1, [r6, #4]
    ands r5, r1
    orrs r5, r2
    strh r5, [r6, #4]
    ldr r1, [sp, #0x140]
    ldrb r2, [r1]
    ldr r4, [sp, #0x110]
    ldr r3, [r4]
    mov r1, sp
.L08030560:
    bl _call_via_r3
    ldr r5, [sp, #0x160]
    strb r0, [r5]
.L08030568:
    mov r6, sl
    ldr r0, [r6, #0x34]
    ldr r7, .L08030588 @ =0x000034C4
    adds r0, r0, r7
    ldrb r0, [r0]
    cmp r0, #0
    beq .L08030578
    b .L0802FFD4
.L08030578:
    ldr r0, [r6, #0x38]
    movs r1, #3
    b .L0802FFBC
    .align 2, 0
.L08030580: .4byte 0x000003FF
.L08030584: .4byte 0xFFFFFC00
.L08030588: .4byte 0x000034C4
.L0803058C:
    mov r2, sl
    adds r2, #0x88
    ldr r0, [r2, #4]
    ldr r1, [r2, #0xc]
    adds r0, r0, r1
    str r0, [r2, #4]
    ldr r0, [r2, #8]
    ldr r1, [r2, #0x10]
    adds r0, r0, r1
    str r0, [r2, #8]
    ldr r0, [r2, #0x18]
    ldr r3, .L080305B4 @ =0xFFFFC7D7
    adds r0, r0, r3
    str r0, [r2, #0x18]
    ldr r1, [r2, #0x14]
    adds r1, r1, r0
    cmp r1, #0
    ble .L080305B8
    str r1, [r2, #0x14]
    b .L080305BE
    .align 2, 0
.L080305B4: .4byte 0xFFFFC7D7
.L080305B8:
    movs r0, #0
    str r0, [r2, #0x14]
    str r0, [r2, #0x18]
.L080305BE:
    mov r4, sl
    ldrh r4, [r4, #4]
    str r4, [sp, #0x114]
    mov r5, sl
    movs r6, #0xa
    ldrsh r5, [r5, r6]
    mov r8, r5
    mov r7, sl
    movs r0, #0xe
    ldrsh r6, [r7, r0]
    mov r0, sl
    adds r0, #0x20
    ldrb r0, [r0]
    adds r1, r0, #0
    cmp r0, #1
    beq .L080305F6
    cmp r0, #1
    bgt .L080305E8
    cmp r0, #0
    beq .L080305F2
    b .L08030606
.L080305E8:
    cmp r1, #2
    beq .L080305FA
    cmp r1, #3
    beq .L08030602
    b .L08030606
.L080305F2:
    adds r6, #0x30
    b .L08030606
.L080305F6:
    subs r6, #0x30
    b .L08030606
.L080305FA:
    movs r1, #0x30
    rsbs r1, r1, #0
    add r8, r1
    b .L08030606
.L08030602:
    movs r2, #0x30
    add r8, r2
.L08030606:
    mov r3, sl
    ldr r3, [r3]
    mov sb, r3
    ldr r1, [r3]
    mov r0, sp
    ldr r3, [r1, #0x34]
    mov r1, sb
    ldr r2, [sp, #0x114]
    bl _call_via_r3
    mov r1, sp
    mov r5, r8
    asrs r4, r5, #3
    asrs r3, r6, #3
    ldr r2, [sp]
    ldrh r0, [r1, #8]
    cmp r2, #0
    beq .L0803064C
    cmp r4, r0
    bhi .L0803064C
    ldrh r1, [r1, #0xa]
    cmp r3, r1
    bhi .L0803064C
    ldr r1, [sp, #4]
    muls r0, r3, r0
    adds r0, r0, r4
    cmp r1, #0
    beq .L08030642
    adds r0, r1, r0
    ldrb r0, [r0]
.L08030642:
    lsls r0, r0, #2
    adds r0, r2, r0
    b .L0803064E
.L08030648:
    ldr r0, [r4]
    b .L080306B0
.L0803064C:
    movs r0, #0
.L0803064E:
    cmp r0, #0
    bne .L08030654
    b .L080307D8
.L08030654:
    ldr r0, [r0]
    lsls r0, r0, #0x1e
    cmp r0, #0
    blt .L0803065E
    b .L080307D8
.L0803065E:
    mov r7, sb
    ldr r0, [r7]
    movs r1, #0xa6
    lsls r1, r1, #1
    adds r0, r0, r1
    ldr r1, [r0]
    mov r0, sb
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    mov r2, sl
    adds r2, #0x54
    str r2, [sp, #0x158]
    add r7, sp, #0x10
    mov r3, r8
    lsls r3, r3, #0x10
    str r3, [sp, #0x16c]
    lsls r6, r6, #0x10
    str r6, [sp, #0x170]
    mov r6, sp
    adds r6, #0x94
    str r6, [sp, #0x164]
    add r0, sp, #0x18
    mov r8, r0
    mov r1, sl
    adds r1, #0x60
    str r1, [sp, #0x15c]
    cmp r4, r5
    beq .L080306AC
.L0803069A:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08030648
    adds r4, #4
    cmp r4, r5
    bne .L0803069A
.L080306AC:
    subs r0, r5, #4
    ldr r0, [r0]
.L080306B0:
    movs r1, #0x6d
    bl func_08008B6C
    movs r6, #0
    ldr r2, [sp, #0x158]
    strh r6, [r2]
    ldr r3, .L080307B0 @ =0x000003FF
    adds r4, r3, #0
    ldr r5, [sp, #0x114]
    ands r5, r4
    ldrh r1, [r7]
    ldr r3, .L080307B4 @ =0xFFFFFC00
    adds r0, r3, #0
    ands r0, r1
    orrs r0, r5
    strh r0, [r7]
    ldr r0, [sp, #0x16c]
    lsrs r1, r0, #0x10
    movs r5, #0x3f
    ands r1, r5
    lsls r1, r1, #2
    ldrb r2, [r7, #1]
    movs r0, #3
    ands r0, r2
    orrs r0, r1
    strb r0, [r7, #1]
    ldr r2, [sp, #0x16c]
    lsrs r1, r2, #0x16
    ands r1, r4
    ldrh r2, [r7, #2]
    adds r0, r3, #0
    ands r0, r2
    orrs r0, r1
    strh r0, [r7, #2]
    ldr r0, [sp, #0x170]
    lsrs r1, r0, #0x10
    ands r1, r5
    lsls r1, r1, #2
    ldrb r2, [r7, #3]
    movs r0, #3
    ands r0, r2
    orrs r0, r1
    strb r0, [r7, #3]
    ldr r1, [sp, #0x170]
    lsrs r0, r1, #0x16
    ands r0, r4
    ldrh r1, [r7, #4]
    ands r3, r1
    orrs r3, r0
    strh r3, [r7, #4]
    mov r2, sb
    ldr r0, [r2]
    movs r3, #0xa2
    lsls r3, r3, #1
    adds r0, r0, r3
    ldr r1, [r0]
    mov r0, sb
    bl _call_via_r1
    adds r2, r0, #0
    adds r2, #0xa
    ldr r0, [sp, #0x164]
    adds r1, r7, #0
    bl func_080A3E90
    add r0, sp, #0x94
    ldr r1, [r0, #4]
    ldr r0, [r0]
    mov r4, sl
    str r0, [r4, #0x58]
    str r1, [r4, #0x5c]
    ldr r0, .L080307B8 @ =gUnk_080F0E80
    str r0, [sp, #0x18]
    mov r5, r8
    strh r6, [r5, #4]
    add r0, sp, #0x20
    bl __12RucksackItem
    strb r6, [r5, #0xc]
    strb r6, [r5, #0xd]
    movs r0, #0x3b
    str r0, [r5, #0x10]
    strb r6, [r5, #0x14]
    ldr r1, [sp, #0x15c]
    mov r0, r8
    ldm r0!, {r2, r3, r7}
    stm r1!, {r2, r3, r7}
    ldm r0!, {r4, r5, r6}
    stm r1!, {r4, r5, r6}
    mov r7, sl
    ldr r0, [r7, #0x5c]
    cmp r0, #0
    bne .L080307C4
    ldr r0, [r7, #0x34]
    ldr r1, .L080307BC @ =0x0000218B
    adds r0, r0, r1
    ldrb r0, [r0]
    movs r4, #3
    ands r4, r0
    cmp r4, #0
    bne .L080307C4
    bl rand
    asrs r0, r0, #4
    movs r1, #0xff
    ands r0, r1
    cmp r0, #1
    bgt .L080307C4
    mov r3, sb
    ldr r2, [r3]
    movs r5, #0xa0
    lsls r5, r5, #1
    adds r2, r2, r5
    add r1, sp, #0x9c
    ldr r0, .L080307C0 @ =0x00000331
    str r0, [r1]
    str r4, [r1, #4]
    ldr r3, [r2]
    mov r0, sb
    movs r2, #0
    bl _call_via_r3
    movs r7, #0
    ldr r6, [sp, #0x13c]
    strb r7, [r6]
    bl .L08031D78
    .align 2, 0
.L080307B0: .4byte 0x000003FF
.L080307B4: .4byte 0xFFFFFC00
.L080307B8: .4byte gUnk_080F0E80
.L080307BC: .4byte 0x0000218B
.L080307C0: .4byte 0x00000331
.L080307C4:
    movs r0, #0x1e
    ldr r1, [sp, #0x13c]
    strb r0, [r1]
    mov r0, sl
    movs r1, #0xa0
    movs r2, #0
    bl func_0802A4C0
    bl .L08031F0E
.L080307D8:
    add r4, sp, #0x10
    ldr r0, .L08030808 @ =gUnk_080F0E80
    str r0, [sp, #0x10]
    movs r5, #0
    movs r0, #0
    strh r0, [r4, #4]
    add r0, sp, #0x18
    bl __12RucksackItem
    strb r5, [r4, #0xc]
    strb r5, [r4, #0xd]
    movs r0, #0x3b
    str r0, [r4, #0x10]
    strb r5, [r4, #0x14]
    mov r0, sl
    adds r0, #0x60
    ldm r4!, {r2, r3, r5}
    stm r0!, {r2, r3, r5}
    ldm r4!, {r1, r6, r7}
    stm r0!, {r1, r6, r7}
    movs r0, #0x20
    ldr r2, [sp, #0x13c]
    strb r0, [r2]
    b .L08030F4C
    .align 2, 0
.L08030808: .4byte gUnk_080F0E80
.L0803080C:
    mov r3, sl
    ldr r4, [r3, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    add r0, sp, #0xa4
    strb r1, [r0]
    bl GetId__C4Tool
    cmp r0, #0x44
    bne .L08030908
    movs r0, #0
    mov r4, sp
    adds r4, #0xa5
    str r4, [sp, #0x168]
    mov r7, sp
.L08030838:
    movs r5, #0
    mov sb, r5
    lsls r6, r0, #4
    str r6, [sp, #0x178]
    adds r0, #1
    str r0, [sp, #0x174]
.L08030844:
    mov r0, sl
    ldr r4, [r0, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    ldr r1, [sp, #0x168]
    strb r0, [r1]
    mov r0, sp
    adds r0, #0xa5
    bl GetId__C4Tool
    bl func_080245E0
    adds r2, r0, #0
    mov r3, sl
    ldr r0, [r3]
    ldr r4, [r0]
    mov r8, r4
    movs r5, #0xdc
    add r8, r5
    ldrh r5, [r3, #4]
    movs r6, #0xa
    ldrsh r1, [r3, r6]
    movs r4, #0xe
    ldrsh r6, [r3, r4]
    mov r3, sb
    lsls r4, r3, #4
    adds r4, r4, r1
    subs r4, #0x10
    ldr r1, [sp, #0x178]
    adds r6, r1, r6
    subs r6, #0x10
    ldr r3, .L08030900 @ =0x000003FF
    ands r5, r3
    ldrh r3, [r7]
    ldr r1, .L08030904 @ =0xFFFFFC00
    ands r1, r3
    orrs r1, r5
    strh r1, [r7]
    lsls r4, r4, #0x10
    lsrs r3, r4, #0x10
    movs r5, #0x3f
    ands r3, r5
    lsls r3, r3, #2
    ldrb r5, [r7, #1]
    movs r1, #3
    ands r1, r5
    orrs r1, r3
    strb r1, [r7, #1]
    lsrs r4, r4, #0x16
    ldr r1, .L08030900 @ =0x000003FF
    ands r4, r1
    ldrh r3, [r7, #2]
    ldr r1, .L08030904 @ =0xFFFFFC00
    ands r1, r3
    orrs r1, r4
    strh r1, [r7, #2]
    lsls r6, r6, #0x10
    lsrs r3, r6, #0x10
    movs r4, #0x3f
    ands r3, r4
    lsls r3, r3, #2
    ldrb r4, [r7, #3]
    movs r1, #3
    ands r1, r4
    orrs r1, r3
    strb r1, [r7, #3]
    lsrs r6, r6, #0x16
    ldr r5, .L08030900 @ =0x000003FF
    ands r6, r5
    ldrh r3, [r7, #4]
    ldr r1, .L08030904 @ =0xFFFFFC00
    ands r1, r3
    orrs r1, r6
    strh r1, [r7, #4]
    mov r6, r8
    ldr r3, [r6]
    mov r1, sp
    bl _call_via_r3
    movs r0, #1
    add sb, r0
    mov r1, sb
    cmp r1, #2
    ble .L08030844
    ldr r0, [sp, #0x174]
    cmp r0, #2
    ble .L08030838
    b .L080309D6
    .align 2, 0
.L08030900: .4byte 0x000003FF
.L08030904: .4byte 0xFFFFFC00
.L08030908:
    mov r2, sl
    ldr r4, [r2, #0x38]
    adds r0, r4, #0
    adds r0, #0x5c
    bl GetTool__C9ToolStack
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_0800E550
    adds r1, r0, #0
    mov r0, sp
    adds r0, #0xa6
    strb r1, [r0]
    bl GetId__C4Tool
    bl func_080245E0
    str r0, [sp, #0x118]
    movs r0, #0
    mov r7, sp
    ldr r3, .L080309E8 @ =0x000003FF
    mov sb, r3
.L08030936:
    movs r4, #0
    mov r8, r4
    lsls r5, r0, #4
    str r5, [sp, #0x180]
    adds r0, #1
    str r0, [sp, #0x17c]
.L08030942:
    mov r6, sl
    ldr r0, [r6]
    ldr r6, [r0]
    adds r6, #0xdc
    mov r1, sl
    ldrh r4, [r1, #4]
    movs r2, #0xa
    ldrsh r1, [r1, r2]
    mov r3, sl
    movs r2, #0xe
    ldrsh r5, [r3, r2]
    mov r2, r8
    lsls r3, r2, #4
    adds r3, r3, r1
    subs r3, #0x10
    ldr r1, [sp, #0x180]
    adds r5, r1, r5
    subs r5, #0x10
    mov r2, sb
    ands r4, r2
    ldrh r2, [r7]
    ldr r1, .L080309EC @ =0xFFFFFC00
    ands r1, r2
    orrs r1, r4
    strh r1, [r7]
    lsls r3, r3, #0x10
    lsrs r2, r3, #0x10
    movs r4, #0x3f
    ands r2, r4
    lsls r2, r2, #2
    ldrb r4, [r7, #1]
    movs r1, #3
    ands r1, r4
    orrs r1, r2
    strb r1, [r7, #1]
    lsrs r3, r3, #0x16
    mov r1, sb
    ands r3, r1
    ldrh r2, [r7, #2]
    ldr r1, .L080309EC @ =0xFFFFFC00
    ands r1, r2
    orrs r1, r3
    strh r1, [r7, #2]
    lsls r5, r5, #0x10
    lsrs r2, r5, #0x10
    movs r3, #0x3f
    ands r2, r3
    lsls r2, r2, #2
    ldrb r3, [r7, #3]
    movs r1, #3
    ands r1, r3
    orrs r1, r2
    strb r1, [r7, #3]
    lsrs r5, r5, #0x16
    mov r4, sb
    ands r5, r4
    ldrh r2, [r7, #4]
    ldr r1, .L080309EC @ =0xFFFFFC00
    ands r1, r2
    orrs r1, r5
    strh r1, [r7, #4]
    ldr r3, [r6]
    mov r1, sp
    ldr r2, [sp, #0x118]
    bl _call_via_r3
    movs r5, #1
    add r8, r5
    mov r6, r8
    cmp r6, #2
    ble .L08030942
    ldr r0, [sp, #0x17c]
    cmp r0, #2
    ble .L08030936
.L080309D6:
    mov r7, sl
    ldr r0, [r7, #0x38]
    adds r0, #0x5c
    movs r1, #1
    bl SubtractAmount__9ToolStackUi
    bl .L08031C7C
    .align 2, 0
.L080309E8: .4byte 0x000003FF
.L080309EC: .4byte 0xFFFFFC00
.L080309F0:
    movs r2, #3
    mov r8, r2
    mov r1, sl
    adds r1, #0xb2
    ldrb r3, [r1]
    movs r2, #0
    adds r0, r3, #0
    subs r0, #0x2b
    adds r4, r1, #0
    cmp r0, #0x1a
    bhi .L08030A08
    movs r2, #1
.L08030A08:
    cmp r2, #0
    beq .L08030A1E
    mov r5, sl
    ldr r0, [r5]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    adds r1, r3, #0
    bl _call_via_r2
    adds r5, r0, #0
    b .L08030A20
.L08030A1E:
    movs r5, #0
.L08030A20:
    cmp r5, #0
    beq .L08030A74
    ldr r0, [r5, #0x14]
    ldr r1, [r0, #0x48]
    adds r0, r5, #0
    bl _call_via_r1
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08030A74
    mov r6, sl
    ldr r0, [r6, #0x34]
    movs r7, #0xbe
    lsls r7, r7, #3
    adds r0, r0, r7
    bl GetFreePregnancyStall__C4Barn
    adds r6, r0, #0
    cmp r6, #0
    blt .L08030A74
    ldrb r0, [r4]
    adds r4, r0, #0
    subs r4, #0x36
    cmp r4, #0xf
    bhi .L08030A74
    ldr r0, [r5, #0x14]
    ldr r1, [r0, #0x68]
    adds r0, r5, #0
    bl _call_via_r1
    mov r1, sl
    ldr r0, [r1, #0x34]
    adds r0, r0, r7
    adds r1, r6, #0
    adds r2, r4, #0
    bl MoveToPregnancyStall__4BarnUiUi
    mov r0, sl
    adds r0, #0xb1
    strb r4, [r0]
    movs r2, #1
    mov r8, r2
.L08030A74:
    mov r3, sl
    ldr r0, [r3]
    ldr r2, [r0]
    movs r4, #0xa0
    lsls r4, r4, #1
    adds r2, r2, r4
    add r1, sp, #0xa8
    movs r4, #0
    mov r5, r8
    str r5, [r1]
    str r4, [r1, #4]
    ldr r3, [r2]
    movs r2, #0
    bl _call_via_r3
    mov r6, sl
    ldr r0, [r6, #0x38]
    adds r0, #0x5c
    movs r1, #1
    bl SubtractAmount__9ToolStackUi
    ldr r7, [sp, #0x13c]
    strb r4, [r7]
    bl .L08031F0E
.L08030AA6:
    movs r0, #3
    mov r8, r0
    mov r1, sl
    adds r1, #0xb2
    ldrb r3, [r1]
    movs r2, #0
    adds r0, r3, #0
    subs r0, #0x2b
    adds r4, r1, #0
    cmp r0, #0x1a
    bhi .L08030ABE
    movs r2, #1
.L08030ABE:
    cmp r2, #0
    beq .L08030AD4
    mov r1, sl
    ldr r0, [r1]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    adds r1, r3, #0
    bl _call_via_r2
    adds r5, r0, #0
    b .L08030AD6
.L08030AD4:
    movs r5, #0
.L08030AD6:
    cmp r5, #0
    beq .L08030B2A
    ldr r0, [r5, #0x14]
    ldr r1, [r0, #0x4c]
    adds r0, r5, #0
    bl _call_via_r1
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08030B2A
    mov r2, sl
    ldr r0, [r2, #0x34]
    movs r7, #0xbe
    lsls r7, r7, #3
    adds r0, r0, r7
    bl GetFreePregnancyStall__C4Barn
    adds r6, r0, #0
    cmp r6, #0
    blt .L08030B2A
    ldrb r0, [r4]
    adds r4, r0, #0
    subs r4, #0x36
    cmp r4, #0xf
    bhi .L08030B2A
    ldr r0, [r5, #0x14]
    ldr r1, [r0, #0x6c]
    adds r0, r5, #0
    bl _call_via_r1
    mov r3, sl
    ldr r0, [r3, #0x34]
    adds r0, r0, r7
    adds r1, r6, #0
    adds r2, r4, #0
    bl MoveToPregnancyStall__4BarnUiUi
    mov r0, sl
    adds r0, #0xb1
    strb r4, [r0]
    movs r4, #1
    mov r8, r4
.L08030B2A:
    mov r5, sl
    ldr r0, [r5]
    ldr r2, [r0]
    movs r6, #0xa0
    lsls r6, r6, #1
    adds r2, r2, r6
    add r1, sp, #0xb0
    movs r4, #0
    mov r7, r8
    str r7, [r1]
    str r4, [r1, #4]
    ldr r3, [r2]
    movs r2, #0
    bl _call_via_r3
    ldr r0, [r5, #0x38]
    adds r0, #0x5c
    movs r1, #1
    bl SubtractAmount__9ToolStackUi
    ldr r0, [sp, #0x13c]
    strb r4, [r0]
    bl .L08031F0E
.L08030B5A:
    movs r5, #3
    mov r0, sl
    adds r0, #0xb2
    ldrb r3, [r0]
    movs r1, #0
    adds r0, r3, #0
    subs r0, #0x2b
    cmp r0, #0x1a
    bhi .L08030B6E
    movs r1, #1
.L08030B6E:
    cmp r1, #0
    beq .L08030B84
    mov r1, sl
    ldr r0, [r1]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    adds r1, r3, #0
    bl _call_via_r2
    adds r4, r0, #0
    b .L08030B86
.L08030B84:
    movs r4, #0
.L08030B86:
    cmp r4, #0
    beq .L08030BA6
    ldr r0, [r4, #0x14]
    ldr r1, [r0, #0x5c]
    adds r0, r4, #0
    bl _call_via_r1
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08030BA6
    ldr r0, [r4, #0x14]
    ldr r1, [r0, #0x7c]
    adds r0, r4, #0
    bl _call_via_r1
    movs r5, #2
.L08030BA6:
    mov r2, sl
    ldr r0, [r2]
    ldr r2, [r0]
    movs r3, #0xa0
    lsls r3, r3, #1
    adds r2, r2, r3
    add r1, sp, #0xb8
    movs r4, #0
    str r5, [r1]
    str r4, [r1, #4]
    ldr r3, [r2]
    movs r2, #0
    bl _call_via_r3
    mov r5, sl
    ldr r0, [r5, #0x38]
    adds r0, #0x5c
    movs r1, #1
    bl SubtractAmount__9ToolStackUi
    ldr r6, [sp, #0x13c]
    strb r4, [r6]
    bl .L08031F0E
.L08030BD6:
    mov r0, sl
    adds r0, #0xb2
    ldrb r3, [r0]
    movs r1, #0
    adds r0, r3, #0
    subs r0, #0x2b
    cmp r0, #0x1a
    bhi .L08030BE8
    movs r1, #1
.L08030BE8:
    cmp r1, #0
    beq .L08030BFE
    mov r7, sl
    ldr r0, [r7]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    adds r1, r3, #0
    bl _call_via_r2
    adds r4, r0, #0
    b .L08030C00
.L08030BFE:
    movs r4, #0
.L08030C00:
    cmp r4, #0
    bne .L08030C08
    bl .L08031C7C
.L08030C08:
    ldr r0, [r4, #0x14]
    ldr r1, [r0, #0x50]
    adds r0, r4, #0
    bl _call_via_r1
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08030C1C
    bl .L08031C7C
.L08030C1C:
    ldr r0, [r4, #0x14]
    ldr r1, [r0, #0x70]
    adds r0, r4, #0
    bl _call_via_r1
    bl .L08031C7C
.L08030C2A:
    mov r0, sl
    adds r0, #0xb2
    ldrb r3, [r0]
    movs r1, #0
    adds r0, r3, #0
    subs r0, #0x2b
    cmp r0, #0x1a
    bhi .L08030C3C
    movs r1, #1
.L08030C3C:
    cmp r1, #0
    beq .L08030C52
    mov r2, sl
    ldr r0, [r2]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    adds r1, r3, #0
    bl _call_via_r2
    adds r4, r0, #0
    b .L08030C54
.L08030C52:
    movs r4, #0
.L08030C54:
    cmp r4, #0
    beq .L08030CEA
    ldr r0, [r4, #0x14]
    ldr r1, [r0, #0x54]
    adds r0, r4, #0
    bl _call_via_r1
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08030CEA
    ldr r0, [r4, #0x14]
    ldr r1, [r0, #0x74]
    adds r0, r4, #0
    bl _call_via_r1
    movs r1, #0x1c
    cmp r0, #5
    bhi .L08030CB6
    lsls r0, r0, #2
    ldr r1, .L08030C84 @ =.L08030C88
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L08030C84: .4byte .L08030C88
.L08030C88: @ jump table
    .4byte .L08030CA0 @ case 0
    .4byte .L08030CA4 @ case 1
    .4byte .L08030CA8 @ case 2
    .4byte .L08030CAC @ case 3
    .4byte .L08030CB0 @ case 4
    .4byte .L08030CB4 @ case 5
.L08030CA0:
    movs r1, #0x1c
    b .L08030CB6
.L08030CA4:
    movs r1, #0x1d
    b .L08030CB6
.L08030CA8:
    movs r1, #0x1e
    b .L08030CB6
.L08030CAC:
    movs r1, #0x1f
    b .L08030CB6
.L08030CB0:
    movs r1, #0x20
    b .L08030CB6
.L08030CB4:
    movs r1, #0x21
.L08030CB6:
    mov r3, sl
    ldr r5, [r3, #0x14]
    add r4, sp, #4
    adds r0, r4, #0
    bl __4FoodUi
    ldrb r1, [r4]
    mov r0, sp
    adds r0, #5
    ldrb r0, [r0]
    lsls r0, r0, #8
    orrs r0, r1
    mov r1, sp
    adds r1, #6
    ldrb r1, [r1]
    lsls r1, r1, #0x10
    orrs r1, r0
    mov r0, sp
    bl __12RucksackItemG4Food
    ldr r3, [r5, #0x5c]
    mov r0, sl
    mov r1, sp
    movs r2, #0
    bl _call_via_r3
.L08030CEA:
    mov r4, sl
    ldr r0, [r4, #0x34]
    ldr r5, .L08030D04 @ =0x00001C2C
    adds r0, r0, r5
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08030D00
    bl .L08031F0E
.L08030D00:
    bl .L08031D92
    .align 2, 0
.L08030D04: .4byte 0x00001C2C
.L08030D08:
    mov r0, sl
    adds r0, #0xb2
    ldrb r3, [r0]
    movs r1, #0
    adds r0, r3, #0
    subs r0, #0x2b
    cmp r0, #0x1a
    bhi .L08030D1A
    movs r1, #1
.L08030D1A:
    cmp r1, #0
    beq .L08030D30
    mov r7, sl
    ldr r0, [r7]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    adds r1, r3, #0
    bl _call_via_r2
    adds r4, r0, #0
    b .L08030D32
.L08030D30:
    movs r4, #0
.L08030D32:
    cmp r4, #0
    beq .L08030DB2
    ldr r0, [r4, #0x14]
    ldr r1, [r0, #0x58]
    adds r0, r4, #0
    bl _call_via_r1
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08030DB2
    ldr r0, [r4, #0x14]
    ldr r1, [r0, #0x78]
    adds r0, r4, #0
    bl _call_via_r1
    movs r1, #5
    cmp r0, #5
    bhi .L08030D92
    lsls r0, r0, #2
    ldr r1, .L08030D60 @ =.L08030D64
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L08030D60: .4byte .L08030D64
.L08030D64: @ jump table
    .4byte .L08030D7C @ case 0
    .4byte .L08030D80 @ case 1
    .4byte .L08030D84 @ case 2
    .4byte .L08030D88 @ case 3
    .4byte .L08030D8C @ case 4
    .4byte .L08030D90 @ case 5
.L08030D7C:
    movs r1, #5
    b .L08030D92
.L08030D80:
    movs r1, #6
    b .L08030D92
.L08030D84:
    movs r1, #7
    b .L08030D92
.L08030D88:
    movs r1, #8
    b .L08030D92
.L08030D8C:
    movs r1, #9
    b .L08030D92
.L08030D90:
    movs r1, #0xa
.L08030D92:
    mov r0, sl
    ldr r5, [r0, #0x14]
    add r4, sp, #0xc0
    adds r0, r4, #0
    bl __7ArticleUi
    ldrb r1, [r4]
    mov r0, sp
    bl __12RucksackItemG7Article
    ldr r3, [r5, #0x5c]
    mov r0, sl
    mov r1, sp
    movs r2, #0
    bl _call_via_r3
.L08030DB2:
    mov r1, sl
    ldr r0, [r1, #0x34]
    ldr r2, .L08030DD0 @ =0x00001C2C
    adds r0, r0, r2
    bl func_0800F190
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08030DC8
    bl .L08031F0E
.L08030DC8:
    movs r0, #0
    bl .L08031E84
    .align 2, 0
.L08030DD0: .4byte 0x00001C2C
.L08030DD4:
    mov r0, sp
    mov r1, sl
    bl GetLocation__C7AEntity
    mov r5, sp
    movs r4, #0x2b
.L08030DE0:
    mov r6, sl
    ldr r0, [r6]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    adds r1, r4, #0
    bl _call_via_r2
    adds r1, r0, #0
    cmp r1, #0
    beq .L08030E00
    ldr r0, [r1, #0x14]
    ldr r2, [r0, #0x3c]
    adds r0, r1, #0
    adds r1, r5, #0
    bl _call_via_r2
.L08030E00:
    adds r4, #1
    cmp r4, #0x45
    bls .L08030DE0
    bl sub_0803192E

    non_word_aligned_thumb_func_start sub_08030E0A
sub_08030E0A: @ 0x08030E0A
    mov r0, sl
    adds r0, #0x3f
    ldrb r0, [r0]
    cmp r0, #5
    beq .L08030E18
    bl .L08031F0E
.L08030E18:
    mov r2, sl
    adds r2, #0x88
    ldr r0, [r2, #4]
    ldr r1, [r2, #0xc]
    adds r0, r0, r1
    str r0, [r2, #4]
    ldr r0, [r2, #8]
    ldr r1, [r2, #0x10]
    adds r0, r0, r1
    str r0, [r2, #8]
    ldr r0, [r2, #0x18]
    ldr r4, .L08030E44 @ =0xFFFFC7D7
    adds r0, r0, r4
    str r0, [r2, #0x18]
    ldr r1, [r2, #0x14]
    adds r1, r1, r0
    cmp r1, #0
    ble .L08030E48
    str r1, [r2, #0x14]
    bl .L08031F0E
    .align 2, 0
.L08030E44: .4byte 0xFFFFC7D7
.L08030E48:
    str r3, [r2, #0x14]
    str r3, [r2, #0x18]
    bl .L08031F0E
.L08030E50:
    mov r0, sl
    adds r0, #0xc3
    ldrb r0, [r0]
    cmp r0, #0
    bne .L08030F46
    cmp r4, #0
    beq .L08030E70
    ldrh r0, [r4, #4]
    movs r1, #2
    ands r0, r1
    cmp r0, #0
    beq .L08030E70
    movs r0, #0x20
    ldr r6, [sp, #0x13c]
    strb r0, [r6]
    b .L08030F4C
.L08030E70:
    mov r2, sl
    adds r2, #0x58
    ldrh r0, [r2]
    cmp r0, #0
    bne .L08030E7E
    bl .L08031F0E
.L08030E7E:
    mov r1, sl
    adds r1, #0x54
    ldrh r0, [r1]
    adds r0, #1
    strh r0, [r1]
    lsls r0, r0, #0x10
    lsrs r0, r0, #0x10
    ldrh r2, [r2]
    cmp r0, r2
    beq .L08030E96
    bl .L08031F0E
.L08030E96:
    movs r0, #0
    strh r0, [r1]
    mov r0, sl
    adds r0, #0x40
    ldrb r0, [r0]
    movs r4, #0x1e
    cmp r0, #6
    bne .L08030EA8
    movs r4, #0x3c
.L08030EA8:
    bl rand
    asrs r0, r0, #2
    movs r1, #0x64
    bl __modsi3
    cmp r0, r4
    ble .L08030EBC
    bl .L08031F0E
.L08030EBC:
    movs r0, #0x1f
    ldr r7, [sp, #0x13c]
    strb r0, [r7]
    mov r0, sl
    movs r1, #0xa1
    movs r2, #0
    bl func_0802A4C0
    mov r0, sl
    movs r1, #2
    movs r2, #0
    bl func_08032384
    mov r1, sl
    adds r1, #0x78
    movs r0, #1
    strb r0, [r1]
    bl .L08031F0E
.L08030EE2:
    mov r2, sl
    adds r2, #0x54
    ldrh r0, [r2]
    adds r0, #1
    strh r0, [r2]
    mov r1, sl
    adds r1, #0x5a
    lsls r0, r0, #0x10
    lsrs r0, r0, #0x10
    ldrh r1, [r1]
    cmp r0, r1
    bne .L08030F0E
    movs r0, #0
    strh r0, [r2]
    movs r0, #0x1e
    ldr r1, [sp, #0x13c]
    strb r0, [r1]
    mov r0, sl
    movs r1, #0xa0
    movs r2, #0
    bl func_0802A4C0
.L08030F0E:
    cmp r4, #0
    bne .L08030F16
    bl .L08031F0E
.L08030F16:
    ldrh r0, [r4, #4]
    movs r1, #2
    ands r0, r1
    cmp r0, #0
    bne .L08030F24
    bl .L08031F0E
.L08030F24:
    mov r2, sl
    ldr r1, [r2, #0x5c]
    mov r0, sl
    adds r0, #0x40
    ldrb r2, [r0]
    mov r4, sl
    ldr r3, [r4, #0x34]
    mov r0, sp
    bl func_080A3F4C
    mov r1, sl
    adds r1, #0x60
    mov r0, sp
    ldm r0!, {r5, r6, r7}
    stm r1!, {r5, r6, r7}
    ldm r0!, {r2, r3, r4}
    stm r1!, {r2, r3, r4}
.L08030F46:
    movs r0, #0x20
    ldr r5, [sp, #0x13c]
    strb r0, [r5]
.L08030F4C:
    mov r0, sl
    movs r1, #0xa2
    movs r2, #1
    bl func_0802A4C0
    bl .L08031F0E
.L08030F5A:
    movs r1, #0
    mov r6, sl
    ldrh r0, [r6, #0x24]
    cmp r0, #0
    bne .L08030F66
    movs r1, #1
.L08030F66:
    cmp r1, #0
    bne .L08030F6E
    bl .L08031F0E
.L08030F6E:
    mov r0, sl
    bl func_0802A7D8
    mov r7, sl
    ldr r0, [r7, #0x34]
    ldr r1, .L08030FBC @ =0x000034C4
    adds r0, r0, r1
    ldrb r0, [r0]
    cmp r0, #0
    bne .L08030FA0
    ldr r0, [r7, #0x38]
    movs r1, #5
    bl func_0800EB2C
    adds r2, r0, #0
    mov r0, sl
    adds r0, #0x78
    ldrb r0, [r0]
    movs r1, #0x32
    cmp r0, #0
    beq .L08030F9A
    movs r1, #0x64
.L08030F9A:
    adds r0, r2, #0
    bl func_0800EF88
.L08030FA0:
    mov r0, sl
    adds r0, #0x60
    ldrb r0, [r0, #0xc]
    cmp r0, #0
    bne .L08030FB8
    mov r0, sl
    adds r0, #0x68
    bl IsEmpty__C12RucksackItem
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08030FC0
.L08030FB8:
    movs r0, #1
    b .L08030FC2
    .align 2, 0
.L08030FBC: .4byte 0x000034C4
.L08030FC0:
    movs r0, #0
.L08030FC2:
    cmp r0, #0
    bne .L08030FCA
    bl sub_08031E0A
.L08030FCA:
    mov r0, sl
    adds r0, #0x6c
    ldrb r0, [r0]
    cmp r0, #0
    beq .L08030FE0
    mov r2, sl
    ldr r0, [r2, #0x14]
    adds r0, #0x80
    ldr r1, [r0]
    bl .L08031EA6
.L08030FE0:
    mov r0, sl
    adds r0, #0x6d
    ldrb r4, [r0]
    cmp r4, #0
    bne .L08030FEC
    b .L08031120
.L08030FEC:
    mov r3, sl
    ldr r0, [r3, #0x70]
    subs r0, #0x35
    cmp r0, #5
    bhi .L0803101C
    lsls r0, r0, #2
    ldr r1, .L08031000 @ =.L08031004
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L08031000: .4byte .L08031004
.L08031004: @ jump table
    .4byte .L0803101C @ case 0
    .4byte .L08031030 @ case 1
    .4byte .L0803103E @ case 2
    .4byte .L08031050 @ case 3
    .4byte .L08031060 @ case 4
    .4byte .L0803106E @ case 5
.L0803101C:
    mov r4, sl
    ldr r0, [r4, #0x38]
    adds r0, #0x54
    ldr r1, .L0803102C @ =0x00000103
    bl func_0800F510
    b .L0803107A
    .align 2, 0
.L0803102C: .4byte 0x00000103
.L08031030:
    mov r5, sl
    ldr r0, [r5, #0x38]
    adds r0, #0x54
    movs r1, #7
    bl func_0800F510
    b .L0803107A
.L0803103E:
    mov r6, sl
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    ldr r1, .L0803104C @ =0x00000141
    bl func_0800F510
    b .L0803107A
    .align 2, 0
.L0803104C: .4byte 0x00000141
.L08031050:
    mov r7, sl
    ldr r0, [r7, #0x38]
    adds r0, #0x54
    movs r1, #0x85
    lsls r1, r1, #1
    bl func_0800F510
    b .L0803107A
.L08031060:
    mov r1, sl
    ldr r0, [r1, #0x38]
    adds r0, #0x54
    movs r1, #0x69
    bl func_0800F510
    b .L0803107A
.L0803106E:
    mov r2, sl
    ldr r0, [r2, #0x38]
    adds r0, #0x54
    movs r1, #0xff
    bl func_0800F510
.L0803107A:
    mov r0, sl
    bl func_0802A588
    movs r4, #0
    movs r0, #0x21
    ldr r3, [sp, #0x13c]
    strb r0, [r3]
    mov r0, sl
    adds r0, #0x20
    ldrb r3, [r0]
    cmp r3, #1
    beq .L080310CE
    cmp r3, #1
    bgt .L0803109C
    cmp r3, #0
    beq .L080310E0
    b .L080310F2
.L0803109C:
    cmp r3, #2
    beq .L080310A6
    cmp r3, #3
    beq .L080310BC
    b .L080310F2
.L080310A6:
    mov r0, sl
    adds r0, #0x88
    ldr r1, .L080310B8 @ =0xFFF60000
    movs r2, #0xc0
    lsls r2, r2, #0xc
    str r1, [r0, #4]
    str r4, [r0, #8]
    b .L080310F0
    .align 2, 0
.L080310B8: .4byte 0xFFF60000
.L080310BC:
    mov r0, sl
    adds r0, #0x88
    movs r1, #0xa0
    lsls r1, r1, #0xc
    movs r2, #0xc0
    lsls r2, r2, #0xc
    str r1, [r0, #4]
    str r4, [r0, #8]
    b .L080310F0
.L080310CE:
    mov r0, sl
    adds r0, #0x88
    ldr r1, .L080310DC @ =0xFFF60000
    movs r2, #0xc0
    lsls r2, r2, #0xc
    str r4, [r0, #4]
    b .L080310EE
    .align 2, 0
.L080310DC: .4byte 0xFFF60000
.L080310E0:
    mov r0, sl
    adds r0, #0x88
    movs r1, #0xa0
    lsls r1, r1, #0xc
    movs r2, #0xc0
    lsls r2, r2, #0xc
    str r3, [r0, #4]
.L080310EE:
    str r1, [r0, #8]
.L080310F0:
    str r2, [r0, #0x14]
.L080310F2:
    mov r4, sl
    ldr r0, [r4]
    ldr r1, [r0]
    movs r5, #0xa6
    lsls r5, r5, #1
    adds r1, r1, r5
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    beq .L080311DE
.L0803110C:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0803119C
    adds r4, #4
    cmp r4, r5
    bne .L0803110C
    b .L080311DE
.L08031120:
    mov r0, sl
    adds r0, #0x68
    bl IsEmpty__C12RucksackItem
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L080311EC
    mov r6, sl
    ldr r0, [r6, #0x38]
    adds r0, #0x54
    ldr r1, [r6, #0x68]
    str r1, [sp]
    bl func_0800F418
    mov r0, sl
    bl func_0802A588
    movs r0, #0x21
    ldr r7, [sp, #0x13c]
    strb r0, [r7]
    mov r0, sl
    adds r0, #0x20
    ldrb r0, [r0]
    cmp r0, #1
    beq .L0803118E
    cmp r0, #1
    bgt .L0803115C
    cmp r0, #0
    beq .L080311A0
    b .L080311B2
.L0803115C:
    cmp r0, #2
    beq .L08031166
    cmp r0, #3
    beq .L0803117C
    b .L080311B2
.L08031166:
    mov r0, sl
    adds r0, #0x88
    ldr r1, .L08031178 @ =0xFFF60000
    movs r2, #0xc0
    lsls r2, r2, #0xc
    str r1, [r0, #4]
    str r4, [r0, #8]
    b .L080311B0
    .align 2, 0
.L08031178: .4byte 0xFFF60000
.L0803117C:
    mov r0, sl
    adds r0, #0x88
    movs r1, #0xa0
    lsls r1, r1, #0xc
    movs r2, #0xc0
    lsls r2, r2, #0xc
    str r1, [r0, #4]
    str r4, [r0, #8]
    b .L080311B0
.L0803118E:
    mov r0, sl
    adds r0, #0x88
    ldr r1, .L08031198 @ =0xFFF60000
    b .L080311A8
    .align 2, 0
.L08031198: .4byte 0xFFF60000
.L0803119C:
    ldr r0, [r4]
    b .L080311E2
.L080311A0:
    mov r0, sl
    adds r0, #0x88
    movs r1, #0xa0
    lsls r1, r1, #0xc
.L080311A8:
    movs r2, #0xc0
    lsls r2, r2, #0xc
    str r4, [r0, #4]
    str r1, [r0, #8]
.L080311B0:
    str r2, [r0, #0x14]
.L080311B2:
    mov r1, sl
    ldr r0, [r1]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    beq .L080311DE
.L080311CC:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0803119C
    adds r4, #4
    cmp r4, r5
    bne .L080311CC
.L080311DE:
    subs r0, r5, #4
    ldr r0, [r0]
.L080311E2:
    movs r1, #0x6a
    bl func_08008B6C
    bl .L08031F0E
.L080311EC:
    ldr r3, [sp, #0x13c]
    strb r4, [r3]
    bl .L08031F0E
.L080311F4:
    movs r1, #0
    mov r5, sl
    ldrh r0, [r5, #0x24]
    cmp r0, #0
    bne .L08031200
    movs r1, #1
.L08031200:
    cmp r1, #0
    bne .L08031208
    bl .L08031F0E
.L08031208:
    mov r6, sl
    ldr r0, [r6]
    ldr r2, [r0]
    movs r7, #0xa0
    lsls r7, r7, #1
    adds r2, r2, r7
    add r1, sp, #0xc4
    movs r3, #0xf4
    lsls r3, r3, #2
    movs r4, #0
    str r3, [r1]
    str r4, [r1, #4]
    ldr r3, [r2]
    movs r2, #0
    bl _call_via_r3
    ldr r0, [sp, #0x13c]
    strb r4, [r0]
    mov r0, sl
    adds r0, #0x88
    movs r1, #0xa8
    lsls r1, r1, #0xd
    str r4, [r0, #4]
    str r4, [r0, #8]
    str r1, [r0, #0x14]
    bl .L08031F0E
.L0803123E:
    mov r1, sl
    ldr r1, [r1]
    str r1, [sp, #0x11c]
    movs r2, #0
    str r2, [sp, #0x120]
    mov r3, sl
    adds r3, #0x4a
    str r3, [sp, #0x14c]
    mov r4, sl
    adds r4, #0x48
    str r4, [sp, #0x144]
    mov r5, sl
    adds r5, #0x49
    str r5, [sp, #0x148]
.L0803125A:
    ldr r6, [sp, #0x14c]
    ldr r7, [sp, #0x120]
    adds r0, r6, r7
    ldrb r0, [r0]
    cmp r0, #0
    bne .L08031268
    b .L0803144E
.L08031268:
    ldr r1, [sp, #0x144]
    ldrb r0, [r1]
    adds r3, r0, #1
    add r1, sp, #0xcc
    str r3, [r1]
    adds r2, r7, #0
    subs r2, #2
    str r2, [r1, #4]
    mov r0, sl
    adds r0, #0x20
    ldrb r0, [r0]
    adds r4, r1, #0
    cmp r0, #1
    beq .L0803129C
    cmp r0, #1
    bgt .L0803128E
    cmp r0, #0
    beq .L08031294
    b .L080312AA
.L0803128E:
    cmp r0, #2
    beq .L080312A6
    b .L080312AA
.L08031294:
    ldr r0, [r4]
    str r2, [r4]
    str r0, [r4, #4]
    b .L080312AA
.L0803129C:
    rsbs r0, r2, #0
    str r0, [r4]
    rsbs r0, r3, #0
    str r0, [r4, #4]
    b .L080312AA
.L080312A6:
    rsbs r0, r3, #0
    str r0, [r4]
.L080312AA:
    mov r3, sl
    ldrh r2, [r3, #4]
    movs r5, #0xa
    ldrsh r1, [r3, r5]
    ldr r4, [r4]
    movs r6, #0xe
    ldrsh r3, [r3, r6]
    add r0, sp, #0xcc
    ldr r6, [r0, #4]
    mov sb, sp
    lsls r4, r4, #4
    adds r4, r4, r1
    lsls r6, r6, #4
    adds r6, r6, r3
    ldr r7, .L0803138C @ =0x000003FF
    mov ip, r7
    adds r1, r2, #0
    mov r0, ip
    ands r1, r0
    mov r5, sb
    ldrh r3, [r5]
    ldr r7, .L08031390 @ =0xFFFFFC00
    mov r8, r7
    mov r0, r8
    ands r0, r3
    orrs r0, r1
    strh r0, [r5]
    lsls r4, r4, #0x10
    lsrs r1, r4, #0x10
    movs r7, #0x3f
    ands r1, r7
    lsls r1, r1, #2
    ldrb r5, [r5, #1]
    movs r3, #3
    adds r0, r3, #0
    ands r0, r5
    orrs r0, r1
    mov r1, sb
    strb r0, [r1, #1]
    lsrs r4, r4, #0x16
    mov r5, ip
    ands r4, r5
    ldrh r1, [r1, #2]
    mov r0, r8
    ands r0, r1
    orrs r0, r4
    mov r1, sb
    strh r0, [r1, #2]
    lsls r6, r6, #0x10
    lsrs r0, r6, #0x10
    ands r0, r7
    lsls r0, r0, #2
    ldrb r1, [r1, #3]
    ands r3, r1
    orrs r3, r0
    mov r4, sb
    strb r3, [r4, #3]
    lsrs r6, r6, #0x16
    ands r6, r5
    ldrh r0, [r4, #4]
    mov r5, r8
    ands r5, r0
    orrs r5, r6
    strh r5, [r4, #4]
    add r4, sp, #8
    ldr r6, [sp, #0x11c]
    ldr r1, [r6]
    adds r0, r4, #0
    ldr r3, [r1, #0x34]
    adds r1, r6, #0
    bl _call_via_r3
    ldr r0, [sp]
    lsls r0, r0, #6
    asrs r0, r0, #0x10
    cmp r0, #0
    bge .L08031346
    adds r0, #7
.L08031346:
    asrs r5, r0, #3
    mov r0, sp
    ldrb r2, [r0, #3]
    lsrs r2, r2, #2
    ldrh r0, [r0, #4]
    ldr r1, .L0803138C @ =0x000003FF
    ands r0, r1
    lsls r0, r0, #6
    orrs r0, r2
    lsls r0, r0, #0x10
    asrs r0, r0, #0x10
    cmp r0, #0
    bge .L08031362
    adds r0, #7
.L08031362:
    asrs r3, r0, #3
    ldr r2, [sp, #8]
    ldrh r0, [r4, #8]
    cmp r2, #0
    beq .L08031394
    cmp r5, r0
    bhi .L08031394
    ldrh r7, [r4, #0xa]
    cmp r3, r7
    bhi .L08031394
    ldr r1, [r4, #4]
    muls r0, r3, r0
    adds r0, r0, r5
    cmp r1, #0
    beq .L08031384
    adds r0, r1, r0
    ldrb r0, [r0]
.L08031384:
    lsls r0, r0, #2
    adds r0, r2, r0
    b .L08031396
    .align 2, 0
.L0803138C: .4byte 0x000003FF
.L08031390: .4byte 0xFFFFFC00
.L08031394:
    movs r0, #0
.L08031396:
    cmp r0, #0
    beq .L0803144E
    ldr r1, [r0]
    lsls r0, r1, #0x1f
    cmp r0, #0
    bne .L080313A8
    lsls r0, r1, #0x1e
    cmp r0, #0
    bge .L080313B4
.L080313A8:
    ldr r0, [sp, #0x14c]
    ldr r2, [sp, #0x120]
    adds r1, r0, r2
    movs r0, #0
    strb r0, [r1]
    b .L0803144E
.L080313B4:
    ldr r3, [sp, #0x11c]
    ldr r0, [r3]
    adds r0, #0xc0
    ldr r2, [r0]
    adds r0, r3, #0
    mov r1, sp
    bl _call_via_r2
    adds r4, r0, #0
    cmp r4, #4
    bne .L080313DC
    mov r5, sl
    ldr r0, [r5, #0x34]
    adds r0, #0x14
    bl GetUnkFlag12__C4Farm
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L080313DC
    movs r4, #1
.L080313DC:
    cmp r4, #4
    bhi .L08031436
    lsls r0, r4, #2
    ldr r1, .L080313EC @ =.L080313F0
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L080313EC: .4byte .L080313F0
.L080313F0: @ jump table
    .4byte .L08031436 @ case 0
    .4byte .L08031436 @ case 1
    .4byte .L08031404 @ case 2
    .4byte .L08031436 @ case 3
    .4byte .L08031424 @ case 4
.L08031404:
    bl rand
    adds r1, r0, #0
    mov r2, sl
    adds r2, #0x50
    cmp r1, #0
    bge .L08031414
    adds r0, #0xf
.L08031414:
    asrs r0, r0, #4
    lsls r0, r0, #4
    subs r0, r1, r0
    adds r0, #5
    ldrh r6, [r2]
    adds r0, r0, r6
    strh r0, [r2]
    b .L08031436
.L08031424:
    mov r7, sl
    ldr r0, [r7, #0x34]
    adds r0, #0x14
    bl method_08009F80__4Farm
    mov r1, sl
    adds r1, #0x52
    movs r0, #1
    strb r0, [r1]
.L08031436:
    movs r3, #0
    mov r2, sl
    adds r2, #0x78
    ldrb r1, [r2]
    cmp r4, #0
    beq .L08031446
    movs r0, #1
    orrs r1, r0
.L08031446:
    cmp r1, #0
    beq .L0803144C
    movs r3, #1
.L0803144C:
    strb r3, [r2]
.L0803144E:
    ldr r0, [sp, #0x120]
    adds r0, #1
    str r0, [sp, #0x120]
    cmp r0, #4
    bhi .L0803145A
    b .L0803125A
.L0803145A:
    ldr r1, [sp, #0x144]
    ldrb r0, [r1]
    adds r0, #1
    strb r0, [r1]
    lsls r0, r0, #0x18
    lsrs r0, r0, #0x18
    ldr r2, [sp, #0x148]
    ldrb r2, [r2]
    cmp r0, r2
    beq .L08031472
    bl .L08031F0E
.L08031472:
    mov r3, sl
    ldr r0, [r3, #0x34]
    ldr r4, .L080314B8 @ =0x000034C4
    adds r0, r0, r4
    ldrb r0, [r0]
    cmp r0, #0
    bne .L0803149E
    ldr r0, [r3, #0x38]
    movs r1, #0
    bl func_0800EB2C
    adds r2, r0, #0
    mov r0, sl
    adds r0, #0x78
    ldrb r0, [r0]
    movs r1, #0x32
    cmp r0, #0
    beq .L08031498
    movs r1, #0x64
.L08031498:
    adds r0, r2, #0
    bl func_0800EF88
.L0803149E:
    mov r0, sl
    adds r0, #0x52
    ldrb r0, [r0]
    cmp r0, #0
    beq .L080314BC
    mov r5, sl
    ldr r0, [r5, #0x14]
    adds r0, #0x80
    ldr r1, [r0]
    mov r0, sl
    bl _call_via_r1
    b .L080314D4
    .align 2, 0
.L080314B8: .4byte 0x000034C4
.L080314BC:
    mov r1, sl
    adds r1, #0x50
    ldrh r0, [r1]
    cmp r0, #0
    beq .L080314D0
    adds r1, r0, #0
    mov r0, sl
    bl func_0802771C
    b .L080314D4
.L080314D0:
    ldr r6, [sp, #0x13c]
    strb r0, [r6]
.L080314D4:
    ldr r7, [sp, #0x11c]
    ldr r0, [r7]
    adds r0, #0xf8
    ldr r1, [r0]
    adds r0, r7, #0
    bl _call_via_r1
    bl .L08031F0E
.L080314E6:
    mov r3, sl
    adds r3, #0x4e
    mov r0, sl
    adds r0, #0x4f
    ldrb r2, [r3]
    ldrb r0, [r0]
    cmp r2, r0
    beq .L0803150A
    movs r1, #0
    mov r4, sl
    ldrh r0, [r4, #0x24]
    cmp r0, #0
    bne .L08031502
    movs r1, #1
.L08031502:
    cmp r1, #0
    beq .L0803150A
    adds r0, r2, #1
    strb r0, [r3]
.L0803150A:
    mov r5, sl
    ldr r6, [r5, #0x48]
    adds r5, r6, #0
    adds r5, #0xe1
    mov r4, sl
    adds r4, #0x4c
    adds r0, r6, #0
    adds r1, r5, #0
    adds r2, r4, #0
    bl func_080DC67C
    str r4, [sp, #0x154]
    cmp r0, r5
    beq .L08031618
    subs r5, r0, r6
    adds r0, r5, #0
    movs r1, #0xf
    bl __umodsi3
    subs r6, r0, #7
    add r4, sp, #0xd4
    str r6, [r4]
    adds r0, r5, #0
    movs r1, #0xf
    bl __udivsi3
    subs r1, r0, #7
    str r1, [r4, #4]
    mov r0, sl
    adds r0, #0x20
    ldrb r0, [r0]
    cmp r0, #1
    beq .L08031564
    cmp r0, #1
    bgt .L08031556
    cmp r0, #0
    beq .L0803155C
    b .L08031572
.L08031556:
    cmp r0, #2
    beq .L0803156E
    b .L08031572
.L0803155C:
    ldr r0, [r4]
    str r1, [r4]
    str r0, [r4, #4]
    b .L08031572
.L08031564:
    rsbs r0, r1, #0
    str r0, [r4]
    rsbs r0, r6, #0
    str r0, [r4, #4]
    b .L08031572
.L0803156E:
    rsbs r0, r6, #0
    str r0, [r4]
.L08031572:
    mov r6, sl
    ldrh r2, [r6, #4]
    movs r7, #0xa
    ldrsh r1, [r6, r7]
    ldr r3, [r4]
    movs r0, #0xe
    ldrsh r5, [r6, r0]
    add r0, sp, #0xd4
    ldr r4, [r0, #4]
    mov r6, sp
    lsls r3, r3, #4
    adds r3, r3, r1
    lsls r4, r4, #4
    adds r4, r4, r5
    ldr r1, .L0803166C @ =0x000003FF
    mov sb, r1
    mov r5, sb
    ands r2, r5
    ldrh r1, [r6]
    ldr r5, .L08031670 @ =0xFFFFFC00
    adds r0, r5, #0
    ands r0, r1
    orrs r0, r2
    strh r0, [r6]
    lsls r3, r3, #0x10
    lsrs r1, r3, #0x10
    movs r7, #0x3f
    mov ip, r7
    mov r0, ip
    ands r1, r0
    lsls r1, r1, #2
    ldrb r2, [r6, #1]
    mov r8, r2
    movs r2, #3
    adds r0, r2, #0
    mov r7, r8
    ands r0, r7
    orrs r0, r1
    strb r0, [r6, #1]
    lsrs r3, r3, #0x16
    mov r0, sb
    ands r3, r0
    ldrh r1, [r6, #2]
    adds r0, r5, #0
    ands r0, r1
    orrs r0, r3
    strh r0, [r6, #2]
    lsls r4, r4, #0x10
    lsrs r0, r4, #0x10
    mov r1, ip
    ands r0, r1
    lsls r0, r0, #2
    ldrb r1, [r6, #3]
    ands r2, r1
    orrs r2, r0
    strb r2, [r6, #3]
    lsrs r4, r4, #0x16
    mov r2, sb
    ands r4, r2
    ldrh r0, [r6, #4]
    ands r5, r0
    orrs r5, r4
    strh r5, [r6, #4]
    mov r3, sl
    ldr r0, [r3]
    ldr r1, [r0]
    adds r1, #0xd4
    ldr r2, [r1]
    mov r1, sp
    bl _call_via_r2
    mov r3, sl
    adds r3, #0x78
    ldrb r1, [r3]
    rsbs r2, r1, #0
    orrs r2, r1
    lsls r0, r0, #0x18
    lsrs r0, r0, #0x18
    rsbs r1, r0, #0
    orrs r1, r0
    orrs r1, r2
    lsrs r1, r1, #0x1f
    strb r1, [r3]
.L08031618:
    mov r0, sl
    adds r0, #0x4d
    ldr r4, [sp, #0x154]
    ldrb r1, [r4]
    ldrb r0, [r0]
    cmp r0, r1
    bhi .L08031678
    mov r5, sl
    ldr r0, [r5, #0x34]
    ldr r6, .L08031674 @ =0x000034C4
    adds r0, r0, r6
    ldrb r0, [r0]
    cmp r0, #0
    bne .L08031652
    ldr r0, [r5, #0x38]
    movs r1, #1
    bl func_0800EB2C
    adds r2, r0, #0
    mov r0, sl
    adds r0, #0x78
    ldrb r0, [r0]
    movs r1, #0x32
    cmp r0, #0
    beq .L0803164C
    movs r1, #0x64
.L0803164C:
    adds r0, r2, #0
    bl func_0800EF88
.L08031652:
    movs r1, #0
    mov r7, sl
    ldrh r0, [r7, #0x24]
    cmp r0, #0
    bne .L0803165E
    movs r1, #1
.L0803165E:
    cmp r1, #0
    beq .L08031664
    b .L08031C7C
.L08031664:
    movs r0, #0x1d
    bl .L08031F0A
    .align 2, 0
.L0803166C: .4byte 0x000003FF
.L08031670: .4byte 0xFFFFFC00
.L08031674: .4byte 0x000034C4
.L08031678:
    adds r0, r1, #1
    ldr r3, [sp, #0x154]
    strb r0, [r3]
    bl .L08031F0E
.L08031682:
    movs r1, #0
    mov r4, sl
    ldrh r0, [r4, #0x24]
    cmp r0, #0
    bne .L0803168E
    movs r1, #1
.L0803168E:
    cmp r1, #0
    bne .L08031696
    bl .L08031F0E
.L08031696:
    b .L08031A5C
.L08031698:
    movs r1, #0
    mov r6, sl
    ldrh r0, [r6, #0x24]
    cmp r0, #0
    bne .L080316A4
    movs r1, #1
.L080316A4:
    cmp r1, #0
    bne .L080316AC
    bl .L08031F0E
.L080316AC:
    movs r0, #0
    ldr r7, [sp, #0x13c]
    strb r0, [r7]
    mov r0, sl
    bl func_0802AA84
    adds r1, r0, #0
    mov r2, sl
    ldr r0, [r2, #0x38]
    bl func_0800ED3C
    bl .L08031F0E
.L080316C6:
    mov r3, sl
    ldr r0, [r3, #0x38]
    bl func_0800E94C
    cmp r0, #0
    bne .L08031708
    mov r4, sl
    ldr r0, [r4, #0x34]
    ldr r5, .L08031704 @ =0x000034C4
    adds r0, r0, r5
    ldrb r0, [r0]
    cmp r0, #0
    beq .L080316E2
    b .L08031D92
.L080316E2:
    ldr r0, [r4, #0x38]
    movs r1, #4
    bl func_0800EB2C
    adds r2, r0, #0
    mov r0, sl
    adds r0, #0x78
    ldrb r0, [r0]
    movs r1, #0x32
    cmp r0, #0
    beq .L080316FA
    movs r1, #0x64
.L080316FA:
    adds r0, r2, #0
    bl func_0800EF88
    b .L08031D92
    .align 2, 0
.L08031704: .4byte 0x000034C4
.L08031708:
    mov r0, sl
    adds r0, #0x48
    mov r3, sl
    adds r3, #0x4a
    ldrb r0, [r0]
    lsls r0, r0, #0x18
    asrs r0, r0, #0x18
    ldrb r7, [r3]
    adds r6, r0, r7
    add r1, sp, #0xdc
    str r6, [r1]
    mov r0, sl
    adds r0, #0x49
    mov r2, sl
    adds r2, #0x4b
    ldrb r0, [r0]
    lsls r0, r0, #0x18
    asrs r0, r0, #0x18
    ldrb r4, [r2]
    adds r5, r0, r4
    str r5, [r1, #4]
    mov r0, sl
    adds r0, #0x20
    ldrb r0, [r0]
    str r3, [sp, #0x14c]
    str r2, [sp, #0x150]
    cmp r0, #1
    beq .L08031758
    cmp r0, #1
    bgt .L0803174A
    cmp r0, #0
    beq .L08031750
    b .L08031766
.L0803174A:
    cmp r0, #2
    beq .L08031762
    b .L08031766
.L08031750:
    ldr r0, [r1]
    str r5, [r1]
    str r0, [r1, #4]
    b .L08031766
.L08031758:
    rsbs r0, r5, #0
    str r0, [r1]
    rsbs r0, r6, #0
    str r0, [r1, #4]
    b .L08031766
.L08031762:
    rsbs r0, r6, #0
    str r0, [r1]
.L08031766:
    mov r5, sl
    ldr r0, [r5]
    ldr r2, [r0]
    adds r2, #0xd8
    str r2, [sp, #0x124]
    ldrh r3, [r5, #4]
    movs r6, #0xa
    ldrsh r2, [r5, r6]
    ldr r4, [r1]
    movs r7, #0xe
    ldrsh r6, [r5, r7]
    add r1, sp, #0xdc
    ldr r5, [r1, #4]
    mov r8, sp
    lsls r4, r4, #4
    adds r4, r4, r2
    lsls r5, r5, #4
    adds r5, r5, r6
    str r5, [sp, #0x188]
    ldr r1, .L08031874 @ =0x000003FF
    adds r7, r1, #0
    ands r3, r7
    mov r5, r8
    ldrh r2, [r5]
    ldr r6, .L08031878 @ =0xFFFFFC00
    adds r1, r6, #0
    ands r1, r2
    orrs r1, r3
    strh r1, [r5]
    lsls r4, r4, #0x10
    lsrs r2, r4, #0x10
    movs r1, #0x3f
    mov ip, r1
    ands r2, r1
    lsls r2, r2, #2
    ldrb r3, [r5, #1]
    mov sb, r3
    movs r3, #3
    adds r1, r3, #0
    mov r5, sb
    ands r1, r5
    orrs r1, r2
    mov r2, r8
    strb r1, [r2, #1]
    lsrs r4, r4, #0x16
    ands r4, r7
    ldrh r2, [r2, #2]
    adds r1, r6, #0
    ands r1, r2
    orrs r1, r4
    mov r4, r8
    strh r1, [r4, #2]
    ldr r1, [sp, #0x188]
    lsls r5, r1, #0x10
    lsrs r1, r5, #0x10
    mov r2, ip
    ands r1, r2
    lsls r1, r1, #2
    ldrb r2, [r4, #3]
    ands r3, r2
    orrs r3, r1
    strb r3, [r4, #3]
    lsrs r5, r5, #0x16
    ands r5, r7
    ldrh r1, [r4, #4]
    ands r6, r1
    orrs r6, r5
    strh r6, [r4, #4]
    ldr r3, [sp, #0x124]
    ldr r2, [r3]
    mov r1, sp
    bl _call_via_r2
    mov r4, sl
    adds r4, #0x78
    ldrb r1, [r4]
    rsbs r2, r1, #0
    orrs r2, r1
    lsls r0, r0, #0x18
    lsrs r0, r0, #0x18
    rsbs r1, r0, #0
    orrs r1, r0
    orrs r1, r2
    lsrs r1, r1, #0x1f
    strb r1, [r4]
    mov r5, sl
    ldr r0, [r5, #0x38]
    movs r1, #1
    bl func_0800ED54
    ldr r1, [sp, #0x150]
    ldrb r0, [r1]
    adds r0, #1
    strb r0, [r1]
    movs r2, #0xff
    mov r1, sl
    adds r1, #0x4d
    lsls r0, r0, #0x18
    lsrs r0, r0, #0x18
    ldrb r1, [r1]
    cmp r0, r1
    beq .L08031834
    b .L08031F0E
.L08031834:
    ldr r6, [sp, #0x14c]
    ldrb r0, [r6]
    adds r0, #1
    strb r0, [r6]
    mov r1, sl
    adds r1, #0x4c
    ands r0, r2
    ldrb r1, [r1]
    cmp r0, r1
    bne .L08031880
    ldr r0, [r5, #0x34]
    ldr r7, .L0803187C @ =0x000034C4
    adds r0, r0, r7
    ldrb r0, [r0]
    cmp r0, #0
    beq .L08031856
    b .L08031C7C
.L08031856:
    ldr r0, [r5, #0x38]
    movs r1, #4
    bl func_0800EB2C
    adds r2, r0, #0
    ldrb r0, [r4]
    movs r1, #0x32
    cmp r0, #0
    beq .L0803186A
    movs r1, #0x64
.L0803186A:
    adds r0, r2, #0
    bl func_0800EF88
    b .L08031C7C
    .align 2, 0
.L08031874: .4byte 0x000003FF
.L08031878: .4byte 0xFFFFFC00
.L0803187C: .4byte 0x000034C4
.L08031880:
    movs r0, #0
    ldr r2, [sp, #0x150]
    b .L08031F0C
.L08031886:
    mov r1, sl
    adds r1, #0x3d
    ldrb r0, [r1]
    subs r0, #1
    strb r0, [r1]
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08031898
    b .L08031F0E
.L08031898:
    movs r0, #5
    ldr r3, [sp, #0x13c]
    strb r0, [r3]
    b .L08031D78
.L080318A0:
    movs r1, #0
    mov r4, sl
    ldrh r0, [r4, #0x24]
    cmp r0, #0
    bne .L080318AC
    movs r1, #1
.L080318AC:
    cmp r1, #0
    bne .L080318B2
    b .L08031F0E
.L080318B2:
    mov r6, sl
    ldr r5, [r6]
    add r4, sp, #8
    adds r0, r4, #0
    mov r1, sl
    bl GetLocation__C12AActorEntity
    mov r0, sp
    adds r1, r4, #0
    movs r2, #6
    bl memcpy
    mov r2, sl
    adds r2, #0x79
    ldrb r1, [r2]
    movs r0, #1
    ands r0, r1
    adds r4, r2, #0
    cmp r0, #0
    beq .L080318F0
    ldr r0, [r5]
    ldr r2, [r0, #0x40]
    adds r0, r5, #0
    movs r1, #0x2b
    bl _call_via_r2
    cmp r0, #0
    beq .L080318F0
    mov r1, sp
    bl func_08021444
.L080318F0:
    ldrb r1, [r4]
    movs r0, #2
    ands r0, r1
    cmp r0, #0
    beq .L08031910
    ldr r0, [r5]
    ldr r2, [r0, #0x40]
    adds r0, r5, #0
    movs r1, #0x2c
    bl _call_via_r2
    cmp r0, #0
    beq .L08031910
    mov r1, sp
    bl func_080221F0
.L08031910:
    movs r4, #1
.L08031912:
    ldr r0, [r5]
    ldr r2, [r0, #0x40]
    adds r0, r5, #0
    adds r1, r4, #0
    bl _call_via_r2
    cmp r0, #0
    beq .L08031928
    mov r1, sp
    bl func_08035A48
.L08031928:
    adds r4, #1
    cmp r4, #0x23
    ble .L08031912

    non_word_aligned_thumb_func_start sub_0803192E
sub_0803192E: @ 0x0803192E
    movs r0, #0
    ldr r7, [sp, #0x13c]
    strb r0, [r7]
    b .L08031F0E
.L08031936:
    movs r1, #0
    mov r2, sl
    ldrh r0, [r2, #0x24]
    cmp r0, #0
    bne .L08031942
    movs r1, #1
.L08031942:
    cmp r1, #0
    bne .L08031948
    b .L08031F0E
.L08031948:
    movs r0, #4
    b .L08031E84
.L0803194C:
    ldr r0, [r4]
    b .L0803199E
.L08031950:
    movs r1, #0
    mov r4, sl
    ldrh r0, [r4, #0x24]
    cmp r0, #0
    bne .L0803195C
    movs r1, #1
.L0803195C:
    cmp r1, #0
    bne .L08031962
    b .L08031F0E
.L08031962:
    mov r0, sl
    bl func_0802A588
    movs r0, #0x14
    ldr r5, [sp, #0x13c]
    strb r0, [r5]
    mov r6, sl
    ldr r0, [r6]
    ldr r1, [r0]
    movs r7, #0xa6
    lsls r7, r7, #1
    adds r1, r1, r7
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    beq .L0803199A
.L08031988:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0803194C
    adds r4, #4
    cmp r4, r5
    bne .L08031988
.L0803199A:
    subs r0, r5, #4
    ldr r0, [r0]
.L0803199E:
    movs r1, #0x6b
    bl func_08008B6C
    b .L08031F0E
.L080319A6:
    movs r1, #0
    mov r2, sl
    ldrh r0, [r2, #0x24]
    cmp r0, #0
    bne .L080319B2
    movs r1, #1
.L080319B2:
    cmp r1, #0
    bne .L080319B8
    b .L08031F0E
.L080319B8:
    movs r0, #4
    b .L08031E84
.L080319BC:
    movs r1, #0
    mov r4, sl
    ldrh r0, [r4, #0x24]
    cmp r0, #0
    bne .L080319C8
    movs r1, #1
.L080319C8:
    cmp r1, #0
    bne .L080319CE
    b .L08031F0E
.L080319CE:
    movs r0, #6
    ldr r5, [sp, #0x13c]
    strb r0, [r5]
    mov r0, sl
    movs r1, #8
    movs r2, #1
    bl func_08032384
    b .L08031F0E
.L080319E0:
    movs r1, #0
    mov r6, sl
    ldrh r0, [r6, #0x24]
    cmp r0, #0
    bne .L080319EC
    movs r1, #1
.L080319EC:
    cmp r1, #0
    beq .L08031A24
    mov r7, sl
    ldr r0, [r7]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    ldr r1, [r0, #8]
    str r1, [r7, #8]
    ldr r1, [r0, #0xc]
    str r1, [r7, #0xc]
    movs r1, #0
    str r1, [r7, #0x18]
    str r1, [r7, #0x1c]
    adds r0, #0x20
    ldrb r1, [r0]
    mov r0, sl
    adds r0, #0x20
    ldrb r0, [r0]
    cmp r0, r1
    beq .L08031A20
    mov r0, sl
    bl SetAnimFacing__12AActorEntityUi
.L08031A20:
    movs r0, #7
    b .L08031C7E
.L08031A24:
    mov r0, sl
    adds r0, #0xb8
    ldr r0, [r0]
    mov r2, sl
    str r0, [r2, #0x18]
    mov r0, sl
    adds r0, #0xbc
    ldr r0, [r0]
    str r0, [r2, #0x1c]
    b .L08031F0E
.L08031A38:
    movs r1, #0
    mov r3, sl
    ldrh r0, [r3, #0x24]
    cmp r0, #0
    bne .L08031A44
    movs r1, #1
.L08031A44:
    cmp r1, #0
    bne .L08031A4A
    b .L08031F0E
.L08031A4A:
    mov r4, sl
    ldr r0, [r4]
    ldr r1, [r0]
    ldr r2, [r1, #0x40]
    movs r1, #0x2c
    bl _call_via_r2
    bl func_08021F3C
.L08031A5C:
    movs r0, #0

    non_word_aligned_thumb_func_start sub_08031A5E
sub_08031A5E: @ 0x08031A5E
    ldr r5, [sp, #0x13c]
    strb r0, [r5]
    b .L08031F0E
.L08031A64:
    movs r1, #0
    mov r6, sl
    ldrh r0, [r6, #0x24]
    cmp r0, #0
    bne .L08031A70
    movs r1, #1
.L08031A70:
    cmp r1, #0
    bne .L08031A76
    b .L08031F0E
.L08031A76:
    movs r0, #0
    ldr r7, [sp, #0x13c]
    strb r0, [r7]
    mov r1, sl
    adds r1, #0x88
    movs r2, #0xa8
    lsls r2, r2, #0xd
    str r0, [r1, #4]
    str r0, [r1, #8]
    str r2, [r1, #0x14]
    mov r0, sl
    bl func_0802B054
    b .L08031F0E
.L08031A92:
    movs r1, #0
    mov r2, sl
    ldrh r0, [r2, #0x24]
    cmp r0, #0
    bne .L08031A9E
    movs r1, #1
.L08031A9E:
    cmp r1, #0
    bne .L08031AA4
    b .L08031F0E
.L08031AA4:
    movs r0, #0
    b .L08031E84
.L08031AA8:
    movs r1, #0
    mov r4, sl
    ldrh r0, [r4, #0x24]
    cmp r0, #0
    bne .L08031AB4
    movs r1, #1
.L08031AB4:
    cmp r1, #0
    bne .L08031ABA
    b .L08031F0E
.L08031ABA:
    mov r5, sl
    ldr r0, [r5, #0x14]
    b .L08031EA4
.L08031AC0:
    movs r1, #0
    mov r6, sl
    ldrh r0, [r6, #0x24]
    cmp r0, #0
    bne .L08031ACC
    movs r1, #1
.L08031ACC:
    cmp r1, #0
    bne .L08031AD2
    b .L08031F0E
.L08031AD2:
    movs r4, #0
    movs r0, #0x2b
    ldr r7, [sp, #0x13c]
    strb r0, [r7]
    mov r1, sl
    ldr r0, [r1]
    ldr r3, [r0]
    movs r2, #0xa0
    lsls r2, r2, #1
    adds r3, r3, r2
    add r1, sp, #0xe4
    ldr r2, .L08031AF8 @ =0x000002B6
    str r2, [r1]
    str r4, [r1, #4]
    ldr r3, [r3]
    movs r2, #2
    bl _call_via_r3
    b .L08031F0E
    .align 2, 0
.L08031AF8: .4byte 0x000002B6
.L08031AFC:
    movs r1, #0
    mov r3, sl
    ldrh r0, [r3, #0x24]
    cmp r0, #0
    bne .L08031B08
    movs r1, #1
.L08031B08:
    cmp r1, #0
    beq .L08031B54
    movs r0, #0
    movs r1, #7
    ldr r4, [sp, #0x13c]
    strb r1, [r4]
    mov r1, sl
    adds r1, #0x3e
    strb r0, [r1]
    mov r0, sl
    adds r0, #0x20
    ldrb r0, [r0]
    cmp r0, #0
    blt .L08031BEE
    cmp r0, #1
    ble .L08031B40
    cmp r0, #3
    bgt .L08031BEE
    mov r5, sl
    ldr r1, [r5, #8]
    mov r0, sl
    adds r0, #0x84
    movs r6, #0
    ldrsh r0, [r0, r6]
    lsls r0, r0, #0x10
    subs r0, r0, r1
    str r0, [r5, #0x18]
    b .L08031BEE
.L08031B40:
    mov r7, sl
    ldr r1, [r7, #0xc]
    mov r0, sl
    adds r0, #0x84
    movs r2, #0
    ldrsh r0, [r0, r2]
    lsls r0, r0, #0x10
    subs r0, r0, r1
    str r0, [r7, #0x1c]
    b .L08031BEE
.L08031B54:
    mov r0, sl
    adds r0, #0x20
    ldrb r0, [r0]
    cmp r0, #0
    bge .L08031B60
    b .L08031F0E
.L08031B60:
    cmp r0, #1
    ble .L08031B76
    cmp r0, #3
    ble .L08031B6A
    b .L08031F0E
.L08031B6A:
    mov r0, sl
    adds r0, #0x80
    ldr r0, [r0]
    mov r3, sl
    str r0, [r3, #0x18]
    b .L08031F0E
.L08031B76:
    mov r0, sl
    adds r0, #0x80
    ldr r0, [r0]
    mov r4, sl
    str r0, [r4, #0x1c]
    b .L08031F0E
.L08031B82:
    movs r1, #0
    mov r5, sl
    ldrh r0, [r5, #0x24]
    cmp r0, #0
    bne .L08031B8E
    movs r1, #1
.L08031B8E:
    cmp r1, #0
    beq .L08031BF6
    movs r0, #0
    ldr r6, [sp, #0x13c]
    strb r0, [r6]
    mov r1, sl
    adds r1, #0x3e
    strb r0, [r1]
    mov r0, sl
    adds r0, #0x20
    ldrb r0, [r0]
    cmp r0, #0
    blt .L08031BD6
    cmp r0, #1
    ble .L08031BC4
    cmp r0, #3
    bgt .L08031BD6
    mov r7, sl
    ldr r1, [r7, #8]
    mov r0, sl
    adds r0, #0x84
    movs r2, #0
    ldrsh r0, [r0, r2]
    lsls r0, r0, #0x10
    subs r0, r0, r1
    str r0, [r7, #0x18]
    b .L08031BD6
.L08031BC4:
    mov r3, sl
    ldr r1, [r3, #0xc]
    mov r0, sl
    adds r0, #0x84
    movs r4, #0
    ldrsh r0, [r0, r4]
    lsls r0, r0, #0x10
    subs r0, r0, r1
    str r0, [r3, #0x1c]
.L08031BD6:
    mov r3, sl
    adds r3, #0x88
    movs r1, #0
    ldrb r0, [r3]
    cmp r0, #1
    bne .L08031BE4
    movs r1, #1
.L08031BE4:
    cmp r1, #0
    beq .L08031BEE
    movs r2, #0xa8
    lsls r2, r2, #0xd
    str r2, [r3, #0x14]
.L08031BEE:
    mov r0, sl
    bl func_0802AD80
    b .L08031F0E
.L08031BF6:
    mov r5, sl
    ldrh r3, [r5, #0x24]
    cmp r3, #0x10
    bhi .L08031C24
    mov r0, sl
    adds r0, #0x20
    ldrb r0, [r0]
    cmp r0, #0
    blt .L08031C24
    cmp r0, #1
    ble .L08031C1A
    cmp r0, #3
    bgt .L08031C24
    mov r0, sl
    adds r0, #0x80
    ldr r0, [r0]
    str r0, [r5, #0x18]
    b .L08031C24
.L08031C1A:
    mov r0, sl
    adds r0, #0x80
    ldr r0, [r0]
    mov r6, sl
    str r0, [r6, #0x1c]
.L08031C24:
    mov r0, sl
    adds r0, #0x88
    movs r2, #0
    ldrb r1, [r0]
    adds r4, r0, #0
    cmp r1, #1
    bne .L08031C34
    movs r2, #1
.L08031C34:
    cmp r2, #0
    bne .L08031C3A
    b .L08031F0E
.L08031C3A:
    ldr r2, [r4, #0x14]
    adds r0, r2, #0
    cmp r3, #0xc
    beq .L08031C56
    cmp r3, #0xc
    bhi .L08031C4C
    cmp r3, #4
    beq .L08031C50
    b .L08031C5A
.L08031C4C:
    cmp r3, #0x10
    bne .L08031C5A
.L08031C50:
    movs r2, #0xe8
    lsls r2, r2, #0xd
    b .L08031C5A
.L08031C56:
    movs r2, #0x84
    lsls r2, r2, #0xe
.L08031C5A:
    cmp r2, r0
    bne .L08031C60
    b .L08031F0E
.L08031C60:
    str r2, [r4, #0x14]
    b .L08031F0E
.L08031C64:
    movs r1, #0
    mov r7, sl
    ldrh r0, [r7, #0x24]
    cmp r0, #0
    bne .L08031C70
    movs r1, #1
.L08031C70:
    cmp r1, #0
    bne .L08031C76
    b .L08031F0E
.L08031C76:
    mov r0, sl
    bl func_0802A588
.L08031C7C:
    movs r0, #0
.L08031C7E:
    ldr r1, [sp, #0x13c]
    strb r0, [r1]
    b .L08031F0E
.L08031C84:
    mov r1, sl
    adds r1, #0x3d
    ldrb r0, [r1]
    subs r0, #1
    strb r0, [r1]
    lsls r0, r0, #0x18
    lsrs r2, r0, #0x18
    cmp r2, #0
    beq .L08031C98
    b .L08031F0E
.L08031C98:
    movs r0, #0x30
    ldr r3, [sp, #0x13c]
    strb r0, [r3]
    movs r0, #0x1e
    strb r0, [r1]
    mov r0, sl
    adds r0, #0x88
    movs r1, #0xa8
    lsls r1, r1, #0xd
    str r2, [r0, #4]
    str r2, [r0, #8]
    str r1, [r0, #0x14]
    b .L08031F0E
.L08031CB2:
    ldr r0, [r4]
    b .L08031D04
.L08031CB6:
    mov r1, sl
    adds r1, #0x3d
    ldrb r0, [r1]
    subs r0, #1
    strb r0, [r1]
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08031CC8
    b .L08031F0E
.L08031CC8:
    movs r0, #0xf
    ldr r4, [sp, #0x13c]
    strb r0, [r4]
    mov r0, sl
    bl func_0802A7D8
    mov r5, sl
    ldr r0, [r5]
    ldr r1, [r0]
    movs r6, #0xa6
    lsls r6, r6, #1
    adds r1, r1, r6
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    beq .L08031D00
.L08031CEE:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08031CB2
    adds r4, #4
    cmp r4, r5
    bne .L08031CEE
.L08031D00:
    subs r0, r5, #4
    ldr r0, [r0]
.L08031D04:
    movs r1, #0x65
    bl func_08008B6C
    b .L08031F0E
.L08031D0C:
    movs r1, #0
    mov r7, sl
    ldrh r0, [r7, #0x24]
    cmp r0, #0
    bne .L08031D18
    movs r1, #1
.L08031D18:
    cmp r1, #0
    bne .L08031D1E
    b .L08031F0E
.L08031D1E:
    movs r0, #0x32
    ldr r1, [sp, #0x13c]
    strb r0, [r1]
    b .L08031E26
.L08031D26:
    ldr r0, [r4]
    b .L08031D72
.L08031D2A:
    mov r1, sl
    adds r1, #0x3d
    ldrb r0, [r1]
    subs r0, #1
    strb r0, [r1]
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08031D3C
    b .L08031F0E
.L08031D3C:
    movs r0, #0x33
    ldr r2, [sp, #0x13c]
    strb r0, [r2]
    mov r3, sl
    ldr r0, [r3]
    ldr r1, [r0]
    movs r4, #0xa6
    lsls r4, r4, #1
    adds r1, r1, r4
    ldr r1, [r1]
    bl _call_via_r1
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    beq .L08031D6E
.L08031D5C:
    ldr r0, [r4]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08031D26
    adds r4, #4
    cmp r4, r5
    bne .L08031D5C
.L08031D6E:
    subs r0, r5, #4
    ldr r0, [r0]
.L08031D72:
    movs r1, #0x6b

    thumb_func_start sub_08031D74
sub_08031D74: @ 0x08031D74
    bl func_08008B6C
.L08031D78:
    mov r0, sl
    bl func_0802A7D8
    b .L08031F0E
.L08031D80:
    movs r1, #0
    mov r5, sl
    ldrh r0, [r5, #0x24]
    cmp r0, #0
    bne .L08031D8C
    movs r1, #1
.L08031D8C:
    cmp r1, #0
    bne .L08031D92
    b .L08031F0E
.L08031D92:
    movs r0, #0
    ldr r6, [sp, #0x13c]
    strb r0, [r6]
    b .L08031F0E
.L08031D9A:
    movs r1, #0
    mov r7, sl
    ldrh r0, [r7, #0x24]
    cmp r0, #0
    bne .L08031DA6
    movs r1, #1
.L08031DA6:
    cmp r1, #0
    bne .L08031DAC
    b .L08031F0E
.L08031DAC:
    movs r0, #0x38
    ldr r1, [sp, #0x13c]
    strb r0, [r1]
    b .L08031E26
.L08031DB4:
    ldr r0, [r5]
    b .L08031DFE
.L08031DB8:
    mov r1, sl
    adds r1, #0x3d
    ldrb r0, [r1]
    subs r0, #1
    strb r0, [r1]
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08031DCA
    b .L08031F0E
.L08031DCA:
    mov r2, sl
    ldr r0, [r2]
    ldr r1, [r0]
    movs r3, #0xa6
    lsls r3, r3, #1
    adds r1, r1, r3
    ldr r1, [r1]
    bl _call_via_r1
    ldr r5, [r0]
    ldr r6, [r0, #4]
    mov r4, sl
    adds r4, #0x88
    cmp r5, r6
    beq .L08031DFA
.L08031DE8:
    ldr r0, [r5]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08031DB4
    adds r5, #4
    cmp r5, r6
    bne .L08031DE8
.L08031DFA:
    subs r0, r6, #4
    ldr r0, [r0]
.L08031DFE:
    movs r1, #0x65
    bl func_08008B6C
    movs r0, #0
    strb r0, [r4]
    movs r0, #0xf

    non_word_aligned_thumb_func_start sub_08031E0A
sub_08031E0A: @ 0x08031E0A
    ldr r4, [sp, #0x13c]
    strb r0, [r4]
    b .L08031F0E
.L08031E10:
    movs r1, #0
    mov r5, sl
    ldrh r0, [r5, #0x24]
    cmp r0, #0
    bne .L08031E1C
    movs r1, #1
.L08031E1C:
    cmp r1, #0
    beq .L08031F0E
    movs r0, #0x39
    ldr r6, [sp, #0x13c]
    strb r0, [r6]
.L08031E26:
    mov r1, sl
    adds r1, #0x3d
    movs r0, #0x1e
    strb r0, [r1]
    b .L08031F0E
.L08031E30:
    ldr r0, [r5]
    b .L08031E78
.L08031E34:
    mov r1, sl
    adds r1, #0x3d
    ldrb r0, [r1]
    subs r0, #1
    strb r0, [r1]
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08031F0E
    mov r7, sl
    ldr r0, [r7]
    ldr r1, [r0]
    movs r2, #0xa6
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldr r5, [r0]
    ldr r6, [r0, #4]
    mov r4, sl
    adds r4, #0x88
    cmp r5, r6
    beq .L08031E74
.L08031E62:
    ldr r0, [r5]
    bl func_08008CD0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08031E30
    adds r5, #4
    cmp r5, r6
    bne .L08031E62
.L08031E74:
    subs r0, r6, #4
    ldr r0, [r0]
.L08031E78:
    movs r1, #0x66
    bl func_08008B6C
    movs r0, #0
    strb r0, [r4]
    movs r0, #0x10
.L08031E84:
    ldr r3, [sp, #0x13c]
    strb r0, [r3]
    b .L08031F0E
.L08031E8A:
    mov r1, sl
    adds r1, #0x3d
    ldrb r0, [r1]
    subs r0, #1
    strb r0, [r1]
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08031F0E
    mov r0, sl
    bl func_0802B054
    mov r4, sl
    ldr r0, [r4, #0x14]
.L08031EA4:
    ldr r1, [r0, #0x70]
.L08031EA6:
    mov r0, sl
    bl _call_via_r1
    b .L08031F0E
.L08031EAE:
    mov r0, sl
    bl func_0802AEA4
    lsls r0, r0, #0x18
    lsrs r0, r0, #0x18
    cmp r0, #0
    beq .L08031F0A
    mov r0, sl
    adds r0, #0x20
    ldrb r0, [r0]
    adds r1, r0, #0
    cmp r0, #1
    beq .L08031EE8
    cmp r0, #1
    bgt .L08031ED2
    cmp r0, #0
    beq .L08031EDC
    b .L08031F0E
.L08031ED2:
    cmp r1, #2
    beq .L08031F00
    cmp r1, #3
    beq .L08031EF2
    b .L08031F0E
.L08031EDC:
    ldr r0, .L08031EE4 @ =0xFFFF0000
    mov r5, sl
    str r0, [r5, #0x1c]
    b .L08031F0E
    .align 2, 0
.L08031EE4: .4byte 0xFFFF0000
.L08031EE8:
    movs r0, #0x80
    lsls r0, r0, #9
    mov r6, sl
    str r0, [r6, #0x1c]
    b .L08031F0E
.L08031EF2:
    ldr r0, .L08031EFC @ =0xFFFF0000
    mov r7, sl
    str r0, [r7, #0x18]
    b .L08031F0E
    .align 2, 0
.L08031EFC: .4byte 0xFFFF0000
.L08031F00:
    movs r0, #0x80
    lsls r0, r0, #9
    mov r1, sl
    str r0, [r1, #0x18]
    b .L08031F0E
.L08031F0A:
    ldr r2, [sp, #0x13c]
.L08031F0C:
    strb r0, [r2]
.L08031F0E:
    add sp, #0x18c
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08031F20:
    .byte 0x02, 0x49, 0x40, 0x18, 0x01, 0x21, 0x01, 0x70, 0x70, 0x47, 0x00, 0x00, 0x81, 0x02, 0x00, 0x00
    .byte 0x30, 0xB5, 0x05, 0x1C, 0x0C, 0x1C, 0x28, 0x68, 0x00, 0x68, 0x01, 0x68, 0x89, 0x6E, 0xA1, 0xF0
    .byte 0xE7, 0xFC, 0x01, 0x1C, 0x28, 0x1C, 0xB4, 0x30, 0x22, 0x1C, 0x2C, 0xF0, 0x81, 0xFC, 0x28, 0x1C
    .byte 0xC8, 0x30, 0x00, 0x22, 0x01, 0x21, 0x01, 0x70, 0x02, 0x30, 0x02, 0x70, 0x01, 0x30, 0x01, 0x70
    .byte 0x30, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0x30, 0xB5, 0x05, 0x1C, 0x0C, 0x1C, 0x28, 0x68
    .byte 0x00, 0x68, 0x01, 0x68, 0x49, 0x6E, 0xA1, 0xF0, 0xCB, 0xFC, 0x01, 0x1C, 0x28, 0x1C, 0xB4, 0x30
    .byte 0x22, 0x1C, 0x2C, 0xF0, 0x65, 0xFC, 0x28, 0x1C, 0xC8, 0x30, 0x00, 0x22, 0x01, 0x21, 0x01, 0x70
    .byte 0x02, 0x30, 0x02, 0x70, 0x01, 0x30, 0x01, 0x70, 0x30, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00
    .byte 0x00, 0xB5, 0x02, 0x1C, 0xB2, 0x30, 0x03, 0x78, 0x00, 0x21, 0x18, 0x1C, 0x2B, 0x38, 0x1A, 0x28
    .byte 0x00, 0xD8, 0x01, 0x21, 0x00, 0x29, 0x01, 0xD1, 0x00, 0x20, 0x05, 0xE0, 0x10, 0x68, 0x01, 0x68
    .byte 0x0A, 0x6C, 0x19, 0x1C, 0xA1, 0xF0, 0xA6, 0xFC, 0x02, 0xBC, 0x08, 0x47, 0x00, 0xB5, 0x00, 0x20
    .byte 0x2B, 0x39, 0x1A, 0x29, 0x00, 0xD8, 0x01, 0x20, 0x02, 0xBC, 0x08, 0x47, 0x00, 0xB5, 0x01, 0x2A
    .byte 0x0C, 0xD0, 0x01, 0x2A, 0x02, 0xDC, 0x00, 0x2A, 0x03, 0xD0, 0x11, 0xE0, 0x02, 0x2A, 0x0C, 0xD0
    .byte 0x0E, 0xE0, 0x0A, 0x68, 0x48, 0x68, 0x08, 0x60, 0x4A, 0x60, 0x09, 0xE0, 0x0A, 0x68, 0x48, 0x68
    .byte 0x40, 0x42, 0x08, 0x60, 0x50, 0x42, 0x48, 0x60, 0x02, 0xE0, 0x08, 0x68, 0x40, 0x42, 0x08, 0x60
    .byte 0x01, 0xBC, 0x00, 0x47, 0x88, 0x30, 0x70, 0x47, 0xC2, 0x30, 0x00, 0x78, 0x70, 0x47, 0x00, 0x00
    .byte 0xC2, 0x30, 0x01, 0x70, 0x70, 0x47, 0x00, 0x00, 0x60, 0x30, 0x70, 0x47, 0xC1, 0x30, 0x00, 0x78
    .byte 0x70, 0x47, 0x00, 0x00, 0xB0, 0x30, 0x00, 0x78, 0x70, 0x47, 0x00, 0x00, 0xAC, 0x30, 0x00, 0x68
    .byte 0x70, 0x47, 0x00, 0x00, 0xA8, 0x30, 0x00, 0x68, 0x70, 0x47, 0x00, 0x00, 0xB1, 0x30, 0x00, 0x78
    .byte 0x70, 0x47, 0x00, 0x00, 0x7A, 0x30, 0x00, 0x78, 0x70, 0x47, 0x00, 0x00

    thumb_func_start func_0803205C
func_0803205C: @ 0x0803205C
    push {lr}
    movs r1, #0
    adds r0, #0x3c
    ldrb r0, [r0]
    cmp r0, #7
    beq .L0803206C
    cmp r0, #0x2d
    bne .L0803206E
.L0803206C:
    movs r1, #1
.L0803206E:
    adds r0, r1, #0
    pop {r1}
    bx r1
.L08032074:
    .byte 0xC0, 0x30, 0x00, 0x78, 0x70, 0x47, 0x00, 0x00, 0xCB, 0x1F, 0x03, 0x80
    .byte 0x13, 0x1C, 0x09, 0x3B, 0x43, 0x80, 0x07, 0x31, 0x81, 0x80, 0x05, 0x32, 0xC2, 0x80, 0x70, 0x47

    thumb_func_start func_08032090
func_08032090: @ 0x08032090
    push {r4, lr}
    sub sp, #0x10
    adds r4, r0, #0
    adds r2, r1, #0
    ldr r1, [r4]
    mov r0, sp
    ldr r3, [r1, #0xc]
    adds r1, r4, #0
    bl _call_via_r3
    ldr r0, [sp]
    ldr r1, [sp, #4]
    str r0, [sp, #8]
    str r1, [sp, #0xc]
    add r2, sp, #8
    movs r4, #0
    movs r3, #0
    ldr r0, [sp, #8]
    movs r1, #0
    cmp r0, #0
    beq .L080320BC
    ldrh r1, [r2, #4]
.L080320BC:
    adds r2, r1, #0
    cmp r4, r2
    bhs .L080320D0
    adds r1, r0, #0
.L080320C4:
    ldrh r0, [r1, #2]
    adds r4, r4, r0
    adds r1, #4
    adds r3, #1
    cmp r3, r2
    blo .L080320C4
.L080320D0:
    adds r0, r4, #0
    add sp, #0x10
    pop {r4}
    pop {r1}
    bx r1
    .align 2, 0
