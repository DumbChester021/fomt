    .INCLUDE "asm/macro.inc"
    .SYNTAX UNIFIED

    thumb_func_start func_0803242C
func_0803242C: @ 0x0803242C
    push {r4, r5, r6, r7, lr}
    mov r7, r8
    push {r7}
    adds r3, r0, #0
    mov r8, r1
    ldrh r0, [r3, #0x24]
    cmp r0, #0
    beq .L08032440
    subs r0, #1
    b .L08032442
.L08032440:
    ldrh r0, [r3, #0x26]
.L08032442:
    strh r0, [r3, #0x24]
    ldr r4, [r3, #0x28]
    cmp r4, #0
    beq .L080324A6
    movs r2, #0
    adds r0, r3, #0
    adds r0, #0x2e
    ldrb r0, [r0]
    cmp r0, #0
    bne .L08032458
    movs r2, #1
.L08032458:
    mov ip, r2
    cmp r2, #0
    beq .L08032462
    ldr r2, [r3, #8]
    b .L08032464
.L08032462:
    ldr r2, [r3, #0xc]
.L08032464:
    asrs r5, r2, #0x10
    movs r0, #0x2c
    ldrsh r6, [r3, r0]
    subs r0, r6, r5
    adds r7, r0, #0
    cmp r0, #0
    bne .L08032476
    str r0, [r3, #0x28]
    b .L080324A6
.L08032476:
    adds r1, r2, r4
    cmp r0, #0
    bgt .L0803247E
    subs r1, r2, r4
.L0803247E:
    adds r2, r1, #0
    asrs r0, r2, #0x10
    cmp r0, r5
    beq .L0803249A
    subs r0, r6, r0
    cmp r7, #0
    ble .L08032492
    cmp r0, #0
    ble .L08032496
    b .L0803249A
.L08032492:
    cmp r0, #0
    blt .L0803249A
.L08032496:
    movs r0, #0
    str r0, [r3, #0x28]
.L0803249A:
    mov r0, ip
    cmp r0, #0
    beq .L080324A4
    str r2, [r3, #8]
    b .L080324A6
.L080324A4:
    str r2, [r3, #0xc]
.L080324A6:
    adds r0, r3, #0
    mov r1, r8
    bl vfunc_2C__7AEntityUi
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0

    thumb_func_start func_080324B8
func_080324B8: @ 0x080324B8
    movs r0, #0
    bx lr

    thumb_func_start func_080324BC
func_080324BC: @ 0x080324BC
    push {r4, r5, r6, r7, lr}
    mov r7, sb
    mov r6, r8
    push {r6, r7}
    sub sp, #0xc
    adds r7, r0, #0
    adds r4, r1, #0
    adds r5, r2, #0
    mov sb, r3
    add r0, sp, #0x34
    ldrb r0, [r0]
    mov r8, r0
    str r4, [r7]
    ldr r0, .L0803255C @ =vtable_unk_080E68B4
    str r0, [r7, #4]
    ldr r0, [r4]
    ldr r1, [r0]
    ldr r1, [r1, #0x68]
    bl _call_via_r1
    adds r1, r0, #0
    ldrh r2, [r4, #0x22]
    adds r0, r4, #0
    adds r0, #0x20
    ldrb r0, [r0]
    adds r2, r2, r0
    ldr r3, [r4]
    adds r0, r7, #0
    adds r0, #8
    str r5, [sp]
    mov r5, sb
    str r5, [sp, #4]
    add r5, sp, #8
    mov r6, r8
    strb r6, [r5]
    bl func_080A4A00
    ldr r0, [r4]
    ldr r1, [r0]
    ldr r1, [r1, #0x6c]
    bl _call_via_r1
    adds r1, r0, #0
    ldr r3, [r4]
    adds r0, r7, #0
    adds r0, #0x48
    movs r2, #2
    str r2, [sp]
    movs r2, #0xe
    str r2, [sp, #4]
    movs r2, #0
    strb r2, [r5]
    movs r2, #0
    bl func_080A4A00
    adds r0, r7, #0
    adds r0, #0x88
    movs r1, #0
    add r2, sp, #0x28
    ldrb r2, [r2]
    strb r2, [r0]
    adds r0, #1
    strb r1, [r0]
    adds r0, #1
    ldr r3, [sp, #0x2c]
    lsls r6, r3, #2
    strb r6, [r0]
    adds r0, #1
    add r5, sp, #0x30
    ldrb r5, [r5]
    strb r5, [r0]
    adds r0, r7, #0
    add sp, #0xc
    pop {r3, r4}
    mov r8, r3
    mov sb, r4
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    .align 2, 0
.L0803255C: .4byte vtable_unk_080E68B4

    thumb_func_start func_08032560
func_08032560: @ 0x08032560
    push {r4, r5, r6, r7, lr}
    mov r7, sb
    mov r6, r8
    push {r6, r7}
    sub sp, #0x14
    adds r7, r0, #0
    adds r5, r1, #0
    adds r4, r2, #0
    mov sb, r3
    ldr r6, [sp, #0x30]
    add r0, sp, #0x40
    ldrb r0, [r0]
    mov r8, r0
    str r5, [r7]
    ldr r0, .L08032608 @ =vtable_unk_080E68B4
    str r0, [r7, #4]
    ldr r0, [r5]
    ldr r1, [r0]
    ldr r1, [r1, #0x68]
    bl _call_via_r1
    adds r1, r0, #0
    ldrh r2, [r5, #0x22]
    adds r0, r5, #0
    adds r0, #0x20
    ldrb r0, [r0]
    adds r2, r2, r0
    ldr r3, [r5]
    adds r0, r7, #0
    adds r0, #8
    str r4, [sp]
    mov r4, sb
    str r4, [sp, #4]
    str r6, [sp, #8]
    add r4, sp, #0xc
    mov r6, r8
    strb r6, [r4]
    bl func_080A49A0
    ldr r0, [r5]
    ldr r1, [r0]
    ldr r1, [r1, #0x6c]
    bl _call_via_r1
    adds r1, r0, #0
    ldr r3, [r5]
    adds r0, r7, #0
    adds r0, #0x48
    movs r2, #2
    str r2, [sp]
    movs r2, #0xe
    str r2, [sp, #4]
    add r4, sp, #8
    movs r2, #0
    strb r2, [r4]
    movs r2, #0
    bl func_080A4A00
    adds r0, r7, #0
    adds r0, #0x88
    movs r1, #0
    add r2, sp, #0x34
    ldrb r2, [r2]
    strb r2, [r0]
    adds r0, #1
    strb r1, [r0]
    adds r0, #1
    ldr r3, [sp, #0x38]
    lsls r3, r3, #2
    str r3, [sp, #0x10]
    strb r3, [r0]
    adds r0, #1
    add r6, sp, #0x3c
    ldrb r6, [r6]
    strb r6, [r0]
    adds r0, r7, #0
    add sp, #0x14
    pop {r3, r4}
    mov r8, r3
    mov sb, r4
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    .align 2, 0
.L08032608: .4byte vtable_unk_080E68B4

    thumb_func_start func_0803260C
func_0803260C: @ 0x0803260C
    push {r4, r5, r6, r7, lr}
    adds r4, r0, #0
    adds r1, r4, #0
    adds r1, #0x47
    ldrb r0, [r1]
    cmp r0, #0
    bne .L08032630
    adds r0, r4, #0
    adds r0, #0x30
    bl func_0805E8F0
    lsls r0, r0, #0x1e
    cmp r0, #0
    bge .L08032634
    adds r1, r4, #0
    adds r1, #0x44
    movs r0, #1
    b .L08032632
.L08032630:
    movs r0, #0
.L08032632:
    strb r0, [r1]
.L08032634:
    adds r1, r4, #0
    adds r1, #0x8a
    ldrb r0, [r1]
    lsls r0, r0, #0x1e
    lsrs r5, r0, #0x1e
    adds r6, r1, #0
    cmp r5, #0
    beq .L0803268A
    movs r7, #0
    subs r1, #3
    ldrb r0, [r1]
    cmp r0, #0
    bne .L0803266A
    adds r0, r4, #0
    adds r0, #0x70
    bl func_0805E8F0
    adds r2, r0, #0
    lsls r0, r2, #0x1e
    cmp r0, #0
    bge .L08032666
    adds r1, r4, #0
    adds r1, #0x84
    movs r0, #1
    strb r0, [r1]
.L08032666:
    adds r0, r2, #0
    b .L08032670
.L0803266A:
    movs r0, #0
    strb r0, [r1]
    movs r0, #2
.L08032670:
    lsls r0, r0, #0x1d
    cmp r0, #0
    bge .L0803267C
    cmp r5, #2
    beq .L0803267C
    movs r7, #1
.L0803267C:
    cmp r7, #0
    beq .L0803268A
    ldrb r1, [r6]
    movs r0, #4
    rsbs r0, r0, #0
    ands r0, r1
    strb r0, [r6]
.L0803268A:
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0

    .section .text.after_func_08032690, "ax", %progbits
    thumb_func_start func_08032900
func_08032900: @ 0x08032900
    push {lr}
    cmp r0, #2
    bne .L0803292C
    ldr r0, .L08032920 @ =0xFFFFFEF0
    adds r1, r1, r0
    ldr r0, .L08032924 @ =0x000002AF
    cmp r1, r0
    bhi .L08032928
    cmp r2, #0xaf
    ble .L08032928
    subs r0, #0x60
    cmp r2, r0
    bgt .L08032928
    movs r0, #1
    b .L0803292E
    .align 2, 0
.L08032920: .4byte 0xFFFFFEF0
.L08032924: .4byte 0x000002AF
.L08032928:
    movs r0, #2
    b .L0803292E
.L0803292C:
    movs r0, #0
.L0803292E:
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_08032934
func_08032934: @ 0x08032934
    push {r4, r5, lr}
    sub sp, #4
    adds r5, r0, #0
    adds r4, r2, #0
    ldrh r0, [r4, #8]
    str r0, [sp]
    adds r0, r5, #0
    movs r3, #2
    bl __12AActorEntityP10GameObjectRC13ActorLocationUiUi
    ldr r0, .L08032958 @ =vtable_unk_080E6828
    str r0, [r5, #0x14]
    str r4, [r5, #0x30]
    adds r0, r5, #0
    add sp, #4
    pop {r4, r5}
    pop {r1}
    bx r1
    .align 2, 0
.L08032958: .4byte vtable_unk_080E6828
.L0803295C:
    .byte 0x70, 0xB5, 0x82, 0xB0
    .byte 0x05, 0x1C, 0x0E, 0x1C, 0x11, 0x48, 0x68, 0x61, 0x2C, 0x6B, 0x68, 0x46, 0x29, 0x1C, 0xFF, 0xF7
    .byte 0xFF, 0xFB, 0x68, 0x46, 0x06, 0xC8, 0x06, 0xC4, 0x69, 0x8C, 0x28, 0x6B, 0x01, 0x81, 0x0C, 0x48
    .byte 0x68, 0x61, 0x29, 0x69, 0x00, 0x29, 0x05, 0xD0, 0x48, 0x68, 0x82, 0x68, 0x08, 0x1C, 0x03, 0x21
    .byte 0xA0, 0xF0, 0xC0, 0xFF, 0x01, 0x20, 0x30, 0x40, 0x00, 0x28, 0x02, 0xD0, 0x28, 0x1C, 0xCD, 0xF7
    .byte 0x33, 0xFE, 0x02, 0xB0, 0x70, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0x28, 0x68, 0x0E, 0x08
    .byte 0x50, 0x62, 0x0E, 0x08, 0x10, 0xB5, 0x04, 0x1C, 0x8C, 0x20, 0xCD, 0xF7, 0x0B, 0xFE, 0x21, 0x1C
    .byte 0x00, 0xF0, 0x1E, 0xF8, 0x10, 0xBC, 0x02, 0xBC, 0x08, 0x47, 0x00, 0x00, 0x00, 0x6B, 0x40, 0x89
    .byte 0x70, 0x47, 0x00, 0x00, 0x00, 0x6B, 0x41, 0x81, 0x70, 0x47, 0x00, 0x00, 0x10, 0xB5, 0x0A, 0x23
    .byte 0xCA, 0x5E, 0x0E, 0x24, 0x0B, 0x5F, 0xD1, 0x1F, 0x01, 0x80, 0x19, 0x1C, 0x0A, 0x39, 0x41, 0x80
    .byte 0x07, 0x32, 0x82, 0x80, 0x04, 0x33, 0xC3, 0x80, 0x10, 0xBC, 0x04, 0xBC, 0x10, 0x47, 0x00, 0x00

    @ 3295c:       b570            push    {r4, r5, r6, lr}
    @ 3295e:       b082            sub     sp, #8
    @ 32960:       1c05            adds    r5, r0, #0
    @ 32962:       1c0e            adds    r6, r1, #0
    @ 32964:       4811            ldr     r0, [pc, #68]   @ (0x329ac)
    @ 32966:       6168            str     r0, [r5, #20]
    @ 32968:       6b2c            ldr     r4, [r5, #48]   @ 0x30
    @ 3296a:       4668            mov     r0, sp
    @ 3296c:       1c29            adds    r1, r5, #0
    @ 3296e:       f7ff fbff       bl      0x32170
    @ 32972:       4668            mov     r0, sp
    @ 32974:       c806            ldmia   r0!, {r1, r2}
    @ 32976:       c406            stmia   r4!, {r1, r2}
    @ 32978:       8c69            ldrh    r1, [r5, #34]   @ 0x22
    @ 3297a:       6b28            ldr     r0, [r5, #48]   @ 0x30
    @ 3297c:       8101            strh    r1, [r0, #8]
    @ 3297e:       480c            ldr     r0, [pc, #48]   @ (0x329b0)
    @ 32980:       6168            str     r0, [r5, #20]
    @ 32982:       6929            ldr     r1, [r5, #16]
    @ 32984:       2900            cmp     r1, #0
    @ 32986:       d005            beq.n   0x32994
    @ 32988:       6848            ldr     r0, [r1, #4]
    @ 3298a:       6882            ldr     r2, [r0, #8]
    @ 3298c:       1c08            adds    r0, r1, #0
    @ 3298e:       2103            movs    r1, #3
    @ 32990:       f0a0 ffc0       bl      0xd3914
    @ 32994:       2001            movs    r0, #1
    @ 32996:       4030            ands    r0, r6
    @ 32998:       2800            cmp     r0, #0
    @ 3299a:       d002            beq.n   0x329a2
    @ 3299c:       1c28            adds    r0, r5, #0
    @ 3299e:       f7cd fe33       bl      0x608
    @ 329a2:       b002            add     sp, #8
    @ 329a4:       bc70            pop     {r4, r5, r6}
    @ 329a6:       bc01            pop     {r0}
    @ 329a8:       4700            bx      r0
    @ 329aa:       0000            movs    r0, r0
    @ 329ac:       6828            ldr     r0, [r5, #0]
    @ 329ae:       080e            lsrs    r6, r1, #32
    @ 329b0:       6250            str     r0, [r2, #36]   @ 0x24
    @ 329b2:       080e            lsrs    r6, r1, #32
    @ 329b4:       b510            push    {r4, lr}
    @ 329b6:       1c04            adds    r4, r0, #0
    @ 329b8:       208c            movs    r0, #140        @ 0x8c
    @ 329ba:       f7cd fe0b       bl      __builtin_new
    @ 329be:       1c21            adds    r1, r4, #0
    @ 329c0:       f000 f81e       bl      0x32a00
    @ 329c4:       bc10            pop     {r4}
    @ 329c6:       bc02            pop     {r1}
    @ 329c8:       4708            bx      r1
    @ 329ca:       0000            movs    r0, r0
    @ 329cc:       6b00            ldr     r0, [r0, #48]   @ 0x30
    @ 329ce:       8940            ldrh    r0, [r0, #10]
    @ 329d0:       4770            bx      lr
    @ 329d2:       0000            movs    r0, r0
    @ 329d4:       6b00            ldr     r0, [r0, #48]   @ 0x30
    @ 329d6:       8141            strh    r1, [r0, #10]
    @ 329d8:       4770            bx      lr
    @ 329da:       0000            movs    r0, r0
    @ 329dc:       b510            push    {r4, lr}
    @ 329de:       230a            movs    r3, #10
    @ 329e0:       5eca            ldrsh   r2, [r1, r3]
    @ 329e2:       240e            movs    r4, #14
    @ 329e4:       5f0b            ldrsh   r3, [r1, r4]
    @ 329e6:       1fd1            subs    r1, r2, #7
    @ 329e8:       8001            strh    r1, [r0, #0]
    @ 329ea:       1c19            adds    r1, r3, #0
    @ 329ec:       390a            subs    r1, #10
    @ 329ee:       8041            strh    r1, [r0, #2]
    @ 329f0:       3207            adds    r2, #7
    @ 329f2:       8082            strh    r2, [r0, #4]
    @ 329f4:       3304            adds    r3, #4
    @ 329f6:       80c3            strh    r3, [r0, #6]
    @ 329f8:       bc10            pop     {r4}
    @ 329fa:       bc04            pop     {r2}
    @ 329fc:       4710            bx      r2
    @ 329fe:       0000            movs    r0, r0

    thumb_func_start func_08032A00
func_08032A00: @ 0x08032A00
    push {r4, lr}
    sub sp, #0x10
    adds r4, r0, #0
    movs r0, #1
    str r0, [sp]
    movs r0, #0
    str r0, [sp, #4]
    str r0, [sp, #8]
    add r2, sp, #0xc
    strb r0, [r2]
    adds r0, r4, #0
    movs r2, #6
    movs r3, #0x20
    bl func_080324BC
    ldr r0, .L08032A2C @ =vtable_unk_080E6864
    str r0, [r4, #4]
    adds r0, r4, #0
    add sp, #0x10
    pop {r4}
    pop {r1}
    bx r1
    .align 2, 0
.L08032A2C: .4byte vtable_unk_080E6864

    thumb_func_start func_08032A30
func_08032A30: @ 0x08032A30
    push {lr}
    adds r1, r0, #0
    ldrh r0, [r1, #0x24]
    cmp r0, #0
    beq .L08032A3E
    subs r0, #1
    b .L08032A40
.L08032A3E:
    ldrh r0, [r1, #0x26]
.L08032A40:
    strh r0, [r1, #0x24]
    ldr r2, [r1, #0x10]
    cmp r2, #0
    beq .L08032A52
    ldr r0, [r2, #4]
    ldr r1, [r0, #0xc]
    adds r0, r2, #0
    bl _call_via_r1
.L08032A52:
    pop {r0}
    bx r0
    .align 2, 0
.L08032A58:
    .byte 0x00, 0xB5, 0x30, 0x30, 0x2B, 0xF0, 0x1A, 0xFF
    .byte 0x02, 0xBC, 0x08, 0x47, 0x00, 0xB5, 0x01, 0x1C, 0x30, 0x31, 0x00, 0x22, 0xC8, 0x89, 0x00, 0x28
    .byte 0x04, 0xD0, 0x10, 0x20, 0x09, 0x5E, 0x48, 0x42, 0x08, 0x43, 0xC2, 0x0F, 0x10, 0x1C, 0x02, 0xBC
    .byte 0x08, 0x47, 0x00, 0x00, 0x44, 0x30, 0x00, 0x78, 0x70, 0x47, 0x00, 0x00, 0x8B, 0x30, 0x01, 0x70
    .byte 0x70, 0x47, 0x00, 0x00, 0x89, 0x30, 0x01, 0x70, 0x70, 0x47, 0x00, 0x00, 0x88, 0x30, 0x01, 0x70
    .byte 0x70, 0x47, 0x00, 0x00, 0x8A, 0x30, 0x02, 0x78, 0x04, 0x21, 0x49, 0x42, 0x11, 0x40, 0x01, 0x70
    .byte 0x70, 0x47, 0x00, 0x00, 0x30, 0xB5, 0x05, 0x1C, 0x14, 0x06, 0x24, 0x0E, 0x70, 0x30, 0x2B, 0xF0
    .byte 0xCF, 0xFE, 0x28, 0x1C, 0x84, 0x30, 0x00, 0x22, 0x01, 0x21, 0x01, 0x70, 0x02, 0x30, 0x02, 0x70
    .byte 0x01, 0x30, 0x01, 0x70, 0x01, 0x23, 0x00, 0x2C, 0x00, 0xD0, 0x02, 0x23, 0x2A, 0x1C, 0x8A, 0x32
    .byte 0x11, 0x78, 0x04, 0x20, 0x40, 0x42, 0x08, 0x40, 0x18, 0x43, 0x10, 0x70, 0x30, 0xBC, 0x01, 0xBC
    .byte 0x00, 0x47, 0x00, 0x00, 0x8A, 0x30, 0x89, 0x00, 0x03, 0x78, 0x03, 0x22, 0x1A, 0x40, 0x0A, 0x43
    .byte 0x02, 0x70, 0x70, 0x47, 0x10, 0xB5, 0x04, 0x1C, 0x30, 0x30, 0x2B, 0xF0, 0xA9, 0xFE, 0x20, 0x1C
    .byte 0x44, 0x30, 0x00, 0x22, 0x01, 0x21, 0x01, 0x70, 0x02, 0x30, 0x02, 0x70, 0x01, 0x30, 0x01, 0x70
    .byte 0x10, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0x80, 0x8C, 0x70, 0x47, 0x00, 0xB5, 0x00, 0x21
    .byte 0x80, 0x8C, 0x00, 0x28, 0x00, 0xD1, 0x01, 0x21, 0x08, 0x1C, 0x02, 0xBC, 0x08, 0x47, 0x00, 0x00
    .byte 0x70, 0x47, 0x00, 0x00, 0x00, 0xB5, 0x02, 0x1C, 0x50, 0x8C, 0x88, 0x42, 0x02, 0xD0, 0x10, 0x1C
    .byte 0xFF, 0xF7, 0x2E, 0xFB, 0x01, 0xBC, 0x00, 0x47, 0x40, 0x8C, 0x70, 0x47, 0x41, 0x8C, 0x20, 0x30
    .byte 0x00, 0x78, 0x09, 0x18, 0x08, 0x1C, 0x70, 0x47, 0x00, 0xB5, 0x02, 0x1C, 0x20, 0x30, 0x00, 0x78
    .byte 0x88, 0x42, 0x02, 0xD0, 0x10, 0x1C, 0xFF, 0xF7, 0x0F, 0xFB, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00
    .byte 0x20, 0x30, 0x00, 0x78, 0x70, 0x47, 0x00, 0x00, 0x0E, 0x22, 0x81, 0x5E, 0x80, 0x20, 0x00, 0x02
    .byte 0x40, 0x1A, 0x70, 0x47, 0x21, 0x30, 0x01, 0x70, 0x70, 0x47, 0x00, 0x00, 0x21, 0x30, 0x00, 0x78
    .byte 0x70, 0x47, 0x00, 0x00, 0xC1, 0x61, 0x70, 0x47, 0xC0, 0x69, 0x70, 0x47, 0x81, 0x61, 0x70, 0x47
    .byte 0x80, 0x69, 0x70, 0x47

    @ 32a58:       b500            push    {lr}
    @ 32a5a:       3030            adds    r0, #48 @ 0x30
    @ 32a5c:       f02b ff1a       bl      func_0805E894
    @ 32a60:       bc02            pop     {r1}
    @ 32a62:       4708            bx      r1

    @ 32a64:       b500            push    {lr}
    @ 32a66:       1c01            adds    r1, r0, #0
    @ 32a68:       3130            adds    r1, #48 @ 0x30
    @ 32a6a:       2200            movs    r2, #0
    @ 32a6c:       89c8            ldrh    r0, [r1, #14]
    @ 32a6e:       2800            cmp     r0, #0
    @ 32a70:       d004            beq.n   0x32a7c
    @ 32a72:       2010            movs    r0, #16
    @ 32a74:       5e09            ldrsh   r1, [r1, r0]
    @ 32a76:       4248            negs    r0, r1
    @ 32a78:       4308            orrs    r0, r1
    @ 32a7a:       0fc2            lsrs    r2, r0, #31
    @ 32a7c:       1c10            adds    r0, r2, #0
    @ 32a7e:       bc02            pop     {r1}
    @ 32a80:       4708            bx      r1

    @ 32a82:       0000            movs    r0, r0

    @ 32a84:       3044            adds    r0, #68 @ 0x44
    @ 32a86:       7800            ldrb    r0, [r0, #0]
    @ 32a88:       4770            bx      lr

    @ 32a8a:       0000            movs    r0, r0
    @ 32a8c:       308b            adds    r0, #139        @ 0x8b
    @ 32a8e:       7001            strb    r1, [r0, #0]
    @ 32a90:       4770            bx      lr

    @ 32a92:       0000            movs    r0, r0
    @ 32a94:       3089            adds    r0, #137        @ 0x89
    @ 32a96:       7001            strb    r1, [r0, #0]
    @ 32a98:       4770            bx      lr

    @ 32a9a:       0000            movs    r0, r0
    @ 32a9c:       3088            adds    r0, #136        @ 0x88
    @ 32a9e:       7001            strb    r1, [r0, #0]
    @ 32aa0:       4770            bx      lr

    @ 32aa2:       0000            movs    r0, r0
    @ 32aa4:       308a            adds    r0, #138        @ 0x8a
    @ 32aa6:       7802            ldrb    r2, [r0, #0]
    @ 32aa8:       2104            movs    r1, #4
    @ 32aaa:       4249            negs    r1, r1
    @ 32aac:       4011            ands    r1, r2
    @ 32aae:       7001            strb    r1, [r0, #0]
    @ 32ab0:       4770            bx      lr

    @ 32ab2:       0000            movs    r0, r0

    @ 32ab4:       b530            push    {r4, r5, lr}
    @ 32ab6:       1c05            adds    r5, r0, #0
    @ 32ab8:       0614            lsls    r4, r2, #24
    @ 32aba:       0e24            lsrs    r4, r4, #24
    @ 32abc:       3070            adds    r0, #112        @ 0x70
    @ 32abe:       f02b fecf       bl      func_0805E860
    @ 32ac2:       1c28            adds    r0, r5, #0
    @ 32ac4:       3084            adds    r0, #132        @ 0x84
    @ 32ac6:       2200            movs    r2, #0
    @ 32ac8:       2101            movs    r1, #1
    @ 32aca:       7001            strb    r1, [r0, #0]
    @ 32acc:       3002            adds    r0, #2
    @ 32ace:       7002            strb    r2, [r0, #0]
    @ 32ad0:       3001            adds    r0, #1
    @ 32ad2:       7001            strb    r1, [r0, #0]
    @ 32ad4:       2301            movs    r3, #1
    @ 32ad6:       2c00            cmp     r4, #0
    @ 32ad8:       d000            beq.n   0x32adc
    @ 32ada:       2302            movs    r3, #2
    @ 32adc:       1c2a            adds    r2, r5, #0
    @ 32ade:       328a            adds    r2, #138        @ 0x8a
    @ 32ae0:       7811            ldrb    r1, [r2, #0]
    @ 32ae2:       2004            movs    r0, #4
    @ 32ae4:       4240            negs    r0, r0
    @ 32ae6:       4008            ands    r0, r1
    @ 32ae8:       4318            orrs    r0, r3
    @ 32aea:       7010            strb    r0, [r2, #0]
    @ 32aec:       bc30            pop     {r4, r5}
    @ 32aee:       bc01            pop     {r0}
    @ 32af0:       4700            bx      r0

    @ 32af2:       0000            movs    r0, r0

    @ 32af4:       308a            adds    r0, #138        @ 0x8a
    @ 32af6:       0089            lsls    r1, r1, #2
    @ 32af8:       7803            ldrb    r3, [r0, #0]
    @ 32afa:       2203            movs    r2, #3
    @ 32afc:       401a            ands    r2, r3
    @ 32afe:       430a            orrs    r2, r1
    @ 32b00:       7002            strb    r2, [r0, #0]
    @ 32b02:       4770            bx      lr

    @ 32b04:       b510            push    {r4, lr}
    @ 32b06:       1c04            adds    r4, r0, #0
    @ 32b08:       3030            adds    r0, #48 @ 0x30
    @ 32b0a:       f02b fea9       bl      func_0805E860
    @ 32b0e:       1c20            adds    r0, r4, #0
    @ 32b10:       3044            adds    r0, #68 @ 0x44
    @ 32b12:       2200            movs    r2, #0
    @ 32b14:       2101            movs    r1, #1
    @ 32b16:       7001            strb    r1, [r0, #0]
    @ 32b18:       3002            adds    r0, #2
    @ 32b1a:       7002            strb    r2, [r0, #0]
    @ 32b1c:       3001            adds    r0, #1
    @ 32b1e:       7001            strb    r1, [r0, #0]
    @ 32b20:       bc10            pop     {r4}
    @ 32b22:       bc01            pop     {r0}
    @ 32b24:       4700            bx      r0

    @ 32b26:       0000            movs    r0, r0

    @ 32b28:       8c80            ldrh    r0, [r0, #36]   @ 0x24
    @ 32b2a:       4770            bx      lr

    @ 32b2c:       b500            push    {lr}
    @ 32b2e:       2100            movs    r1, #0
    @ 32b30:       8c80            ldrh    r0, [r0, #36]   @ 0x24
    @ 32b32:       2800            cmp     r0, #0
    @ 32b34:       d100            bne.n   0x32b38
    @ 32b36:       2101            movs    r1, #1
    @ 32b38:       1c08            adds    r0, r1, #0
    @ 32b3a:       bc02            pop     {r1}
    @ 32b3c:       4708            bx      r1

    @ 32b3e:       0000            movs    r0, r0
    @ 32b40:       4770            bx      lr

    @ 32b42:       0000            movs    r0, r0

    @ SetAnim2
    @ 32b44:       b500            push    {lr}
    @ 32b46:       1c02            adds    r2, r0, #0
    @ 32b48:       8c50            ldrh    r0, [r2, #34]   @ 0x22
    @ 32b4a:       4288            cmp     r0, r1
    @ 32b4c:       d002            beq.n   0x32b54
    @ 32b4e:       1c10            adds    r0, r2, #0
    @ 32b50:       f7ff fb2e       bl      SetAnim__12AActorEntityUi
    @ 32b54:       bc01            pop     {r0}
    @ 32b56:       4700            bx      r0

    @ GetAnim?
    @ 32b58:       8c40            ldrh    r0, [r0, #34]   @ 0x22
    @ 32b5a:       4770            bx      lr

    @ 32b5c:       8c41            ldrh    r1, [r0, #34]   @ 0x22
    @ 32b5e:       3020            adds    r0, #32
    @ 32b60:       7800            ldrb    r0, [r0, #0]
    @ 32b62:       1809            adds    r1, r1, r0
    @ 32b64:       1c08            adds    r0, r1, #0
    @ 32b66:       4770            bx      lr

    @ 32b68:       b500            push    {lr}
    @ 32b6a:       1c02            adds    r2, r0, #0
    @ 32b6c:       3020            adds    r0, #32
    @ 32b6e:       7800            ldrb    r0, [r0, #0]
    @ 32b70:       4288            cmp     r0, r1
    @ 32b72:       d002            beq.n   0x32b7a
    @ 32b74:       1c10            adds    r0, r2, #0
    @ 32b76:       f7ff fb0f       bl      0x32198
    @ 32b7a:       bc01            pop     {r0}
    @ 32b7c:       4700            bx      r0

    @ 32b7e:       0000            movs    r0, r0

    @ 32b80:       3020            adds    r0, #32
    @ 32b82:       7800            ldrb    r0, [r0, #0]
    @ 32b84:       4770            bx      lr

    @ 32b86:       0000            movs    r0, r0

    @ 32b88:       220e            movs    r2, #14
    @ 32b8a:       5e81            ldrsh   r1, [r0, r2]
    @ 32b8c:       2080            movs    r0, #128        @ 0x80
    @ 32b8e:       0200            lsls    r0, r0, #8
    @ 32b90:       1a40            subs    r0, r0, r1
    @ 32b92:       4770            bx      lr

    @ 32b94:       3021            adds    r0, #33 @ 0x21
    @ 32b96:       7001            strb    r1, [r0, #0]
    @ 32b98:       4770            bx      lr

    @ 32b9a:       0000            movs    r0, r0

    @ 32b9c:       3021            adds    r0, #33 @ 0x21
    @ 32b9e:       7800            ldrb    r0, [r0, #0]
    @ 32ba0:       4770            bx      lr

    @ 32ba2:       0000            movs    r0, r0

    @ 32ba4:       61c1            str     r1, [r0, #28]
    @ 32ba6:       4770            bx      lr

    @ 32ba8:       69c0            ldr     r0, [r0, #28]
    @ 32baa:       4770            bx      lr

    @ 32bac:       6181            str     r1, [r0, #24]
    @ 32bae:       4770            bx      lr

    @ 32bb0:       6980            ldr     r0, [r0, #24]
    @ 32bb2:       4770            bx      lr

    thumb_func_start func_08032BB4
func_08032BB4: @ 0x08032BB4
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #0x48
    str r0, [sp, #0x28]
    str r1, [sp, #0x2c]
    mov sl, r2
    str r3, [sp, #0x30]
    mov r2, sp
    ldrb r1, [r2]
    movs r4, #0x10
    rsbs r4, r4, #0
    adds r0, r4, #0
    ands r0, r1
    strb r0, [r2]
    movs r0, #0
    str r0, [sp, #0x34]
    ldr r1, [sp, #0x30]
    cmp r1, #0x25
    beq .L08032BE2
    b .L08032E1C
.L08032BE2:
    ldr r2, [sp, #0x2c]
    ldr r3, .L08032C30 @ =0x000005DC
    adds r7, r2, r3
    adds r0, r7, #0
    bl GetStoredBushelCount__C4Barn
    cmp r0, #0
    bne .L08032BF4
    b .L08032E1C
.L08032BF4:
    movs r6, #0
    str r6, [sp, #0x38]
    adds r0, r7, #0
    bl GetPregnancyStallCapacity__C4Barn
    mov sb, r0
    ldr r0, [sp, #0x34]
    cmp r0, sb
    bhs .L08032CA6
    add r1, sp, #0x14
    mov r8, r1
.L08032C0A:
    adds r0, r7, #0
    adds r1, r6, #0
    bl GetPregnancyStallLinkedStall__C4BarnUi
    mvns r0, r0
    lsrs r4, r0, #0x1f
    adds r0, r7, #0
    adds r1, r6, #0
    bl HasBushelForPregnancyStall__C4BarnUi
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08032C34
    cmp r4, #0
    bne .L08032CA0
    ldr r2, [sp, #0x38]
    adds r2, #1
    str r2, [sp, #0x38]
    b .L08032CA0
    .align 2, 0
.L08032C30: .4byte 0x000005DC
.L08032C34:
    cmp r4, #0
    beq .L08032CA0
    add r0, sp, #0x10
    adds r1, r7, #0
    adds r2, r6, #0
    bl method_0800D0C0__C4BarnUi
    ldr r0, [sp, #0x10]
    str r0, [sp, #0x14]
    mov r3, r8
    movs r0, #0
    ldrsh r1, [r3, r0]
    ldr r2, [sp, #0x68]
    subs r1, r1, r2
    movs r2, #2
    ldrsh r0, [r3, r2]
    ldr r3, [sp, #0x6c]
    subs r0, r0, r3
    adds r2, r1, #0
    muls r2, r1, r2
    adds r1, r2, #0
    adds r3, r0, #0
    muls r3, r0, r3
    adds r0, r3, #0
    adds r5, r1, r0
    mov r0, sp
    ldrb r0, [r0]
    lsls r0, r0, #0x1c
    cmp r0, #0
    beq .L08032C76
    ldr r0, [sp, #0x34]
    cmp r5, r0
    bhs .L08032CA0
.L08032C76:
    add r4, sp, #8
    ldrb r1, [r4]
    movs r0, #0x10
    rsbs r0, r0, #0
    ands r0, r1
    movs r1, #5
    orrs r0, r1
    strb r0, [r4]
    strb r6, [r4, #1]
    ldr r0, [sp, #0x70]
    adds r1, r4, #0
    bl func_0809E968
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08032CA0
    mov r1, sp
    adds r0, r4, #0
    ldm r0!, {r2, r3}
    stm r1!, {r2, r3}
    str r5, [sp, #0x34]
.L08032CA0:
    adds r6, #1
    cmp r6, sb
    blo .L08032C0A
.L08032CA6:
    movs r6, #0
    mov sb, r6
    ldr r1, [sp, #0x2c]
    ldr r2, .L08032D30 @ =0x000005DC
    adds r0, r1, r2
    bl GetCapacity__C4Barn
    adds r6, r0, #0
    movs r5, #0
    cmp sb, r6
    bhs .L08032D06
.L08032CBC:
    adds r0, r7, #0
    adds r1, r5, #0
    bl GetBarnAnimal__C4BarnUi
    adds r4, r0, #0
    cmp r4, #0
    beq .L08032D00
    mov r3, sl
    ldr r0, [r3]
    adds r1, r5, #0
    adds r1, #0x36
    ldr r2, [r0, #0x44]
    mov r0, sl
    bl _call_via_r2
    cmp r0, #0
    beq .L08032D00
    ldrh r0, [r0, #4]
    cmp r0, #0x25
    bne .L08032D00
    adds r0, r4, #0
    bl HasBeenFed__C9Livestock
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08032D00
    adds r0, r4, #0
    bl IsPregnant__C10BarnAnimal
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08032D00
    movs r0, #1
    add sb, r0
.L08032D00:
    adds r5, #1
    cmp r5, r6
    blo .L08032CBC
.L08032D06:
    mov r1, sb
    cmp r1, #0
    bne .L08032D0E
    b .L08032E1C
.L08032D0E:
    str r6, [sp, #0x3c]
    movs r2, #0
    mov r8, r2
    movs r4, #0
    cmp r8, r6
    bhs .L08032D4E
.L08032D1A:
    adds r0, r7, #0
    adds r1, r4, #0
    bl HasBushelForStall__C4BarnUi
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08032D34
    ldr r3, [sp, #0x38]
    adds r3, #1
    str r3, [sp, #0x38]
    b .L08032D46
    .align 2, 0
.L08032D30: .4byte 0x000005DC
.L08032D34:
    cmp r4, #0xf
    bhi .L08032D46
    movs r1, #0x1f
    ands r1, r4
    movs r0, #1
    lsls r0, r1
    mov r6, r8
    orrs r6, r0
    mov r8, r6
.L08032D46:
    adds r4, #1
    ldr r0, [sp, #0x3c]
    cmp r4, r0
    blo .L08032D1A
.L08032D4E:
    ldr r1, [sp, #0x38]
    cmp sb, r1
    bls .L08032E1C
    movs r3, #0
    movs r4, #0x1f
    movs r5, #1
    ldr r2, [sp, #0x70]
.L08032D5C:
    ldrb r0, [r2]
    lsls r0, r0, #0x1c
    lsrs r0, r0, #0x1c
    cmp r0, #4
    bne .L08032D7E
    ldr r6, [sp, #0x38]
    adds r6, #1
    str r6, [sp, #0x38]
    ldrb r1, [r2, #1]
    cmp r1, #0xf
    bhi .L08032D7E
    ands r1, r4
    adds r0, r5, #0
    lsls r0, r1
    mov r1, r8
    bics r1, r0
    mov r8, r1
.L08032D7E:
    adds r2, #8
    adds r3, #1
    cmp r3, #6
    bls .L08032D5C
    ldr r2, [sp, #0x38]
    cmp sb, r2
    bls .L08032E1C
    movs r4, #0
    ldr r3, [sp, #0x3c]
    cmp r4, r3
    bhs .L08032E1C
    mov r6, sp
    adds r6, #0x1c
    str r6, [sp, #0x44]
    add r5, sp, #8
    movs r0, #0x10
    rsbs r0, r0, #0
    mov sb, r0
.L08032DA2:
    movs r0, #0
    cmp r4, #0xf
    bhi .L08032DBA
    movs r0, #0x1f
    ands r0, r4
    movs r1, #1
    lsls r1, r0
    mov r2, r8
    ands r1, r2
    rsbs r0, r1, #0
    orrs r0, r1
    lsrs r0, r0, #0x1f
.L08032DBA:
    cmp r0, #0
    beq .L08032E14
    add r0, sp, #0x18
    adds r1, r7, #0
    adds r2, r4, #0
    bl method_0800D074__C4BarnUi
    ldr r0, [sp, #0x18]
    str r0, [sp, #0x1c]
    ldr r3, [sp, #0x44]
    movs r6, #0
    ldrsh r1, [r3, r6]
    ldr r0, [sp, #0x68]
    subs r1, r1, r0
    movs r2, #2
    ldrsh r0, [r3, r2]
    ldr r3, [sp, #0x6c]
    subs r0, r0, r3
    adds r6, r1, #0
    muls r6, r1, r6
    adds r1, r6, #0
    adds r2, r0, #0
    muls r2, r0, r2
    adds r0, r2, #0
    adds r2, r1, r0
    mov r0, sp
    ldrb r0, [r0]
    lsls r0, r0, #0x1c
    cmp r0, #0
    beq .L08032DFC
    ldr r3, [sp, #0x34]
    cmp r2, r3
    bhs .L08032E14
.L08032DFC:
    ldrb r1, [r5]
    mov r0, sb
    ands r0, r1
    movs r1, #4
    orrs r0, r1
    strb r0, [r5]
    strb r4, [r5, #1]
    mov r1, sp
    adds r0, r5, #0
    ldm r0!, {r3, r6}
    stm r1!, {r3, r6}
    str r2, [sp, #0x34]
.L08032E14:
    adds r4, #1
    ldr r6, [sp, #0x3c]
    cmp r4, r6
    blo .L08032DA2
.L08032E1C:
    ldr r0, [sp, #0x30]
    cmp r0, #0x11
    beq .L08032E24
    b .L08032F8C
.L08032E24:
    ldr r1, [sp, #0x2c]
    movs r2, #0xff
    lsls r2, r2, #2
    adds r7, r1, r2
    adds r0, r7, #0
    bl GetStoredBushelCount__C4Coop
    cmp r0, #0
    bne .L08032E38
    b .L08032F8C
.L08032E38:
    adds r0, r7, #0
    bl GetCapacity__C4Coop
    adds r6, r0, #0
    movs r3, #0
    mov sb, r3
    movs r5, #0
    cmp sb, r6
    bhs .L08032E88
.L08032E4A:
    adds r0, r7, #0
    adds r1, r5, #0
    bl GetChicken__C4CoopUi
    adds r4, r0, #0
    cmp r4, #0
    beq .L08032E82
    mov r1, sl
    ldr r0, [r1]
    adds r1, r5, #0
    adds r1, #0x2e
    ldr r2, [r0, #0x44]
    mov r0, sl
    bl _call_via_r2
    cmp r0, #0
    beq .L08032E82
    ldrh r0, [r0, #4]
    cmp r0, #0x11
    bne .L08032E82
    adds r0, r4, #0
    bl HasBeenFed__C9Livestock
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08032E82
    movs r2, #1
    add sb, r2
.L08032E82:
    adds r5, #1
    cmp r5, r6
    blo .L08032E4A
.L08032E88:
    mov r3, sb
    cmp r3, #0
    beq .L08032F8C
    str r6, [sp, #0x40]
    movs r5, #0
    mov r8, r5
    movs r4, #0
    cmp r8, r6
    bhs .L08032EC6
.L08032E9A:
    adds r0, r7, #0
    adds r1, r4, #0
    bl HasBushelForEnt__C4CoopUi
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08032EAC
    adds r5, #1
    b .L08032EBE
.L08032EAC:
    cmp r4, #7
    bhi .L08032EBE
    movs r1, #0x1f
    ands r1, r4
    movs r0, #1
    lsls r0, r1
    mov r6, r8
    orrs r6, r0
    mov r8, r6
.L08032EBE:
    adds r4, #1
    ldr r0, [sp, #0x40]
    cmp r4, r0
    blo .L08032E9A
.L08032EC6:
    cmp sb, r5
    bls .L08032F8C
    movs r3, #0
    movs r4, #0x1f
    movs r6, #1
    ldr r2, [sp, #0x70]
.L08032ED2:
    ldrb r0, [r2]
    lsls r0, r0, #0x1c
    lsrs r0, r0, #0x1c
    cmp r0, #3
    bne .L08032EF0
    adds r5, #1
    ldrb r1, [r2, #1]
    cmp r1, #7
    bhi .L08032EF0
    ands r1, r4
    adds r0, r6, #0
    lsls r0, r1
    mov r1, r8
    bics r1, r0
    mov r8, r1
.L08032EF0:
    adds r2, #8
    adds r3, #1
    cmp r3, #6
    bls .L08032ED2
    cmp sb, r5
    bls .L08032F8C
    movs r4, #0
    ldr r2, [sp, #0x40]
    cmp r4, r2
    bhs .L08032F8C
    mov r3, sp
    adds r3, #0x24
    str r3, [sp, #0x44]
    add r5, sp, #8
    movs r6, #0x10
    rsbs r6, r6, #0
    mov sb, r6
.L08032F12:
    movs r0, #0
    cmp r4, #7
    bhi .L08032F2A
    movs r0, #0x1f
    ands r0, r4
    movs r1, #1
    lsls r1, r0
    mov r0, r8
    ands r1, r0
    rsbs r0, r1, #0
    orrs r0, r1
    lsrs r0, r0, #0x1f
.L08032F2A:
    cmp r0, #0
    beq .L08032F84
    add r0, sp, #0x20
    adds r1, r7, #0
    adds r2, r4, #0
    bl method_0800C6F0__C4CoopUi
    ldr r0, [sp, #0x20]
    str r0, [sp, #0x24]
    ldr r2, [sp, #0x44]
    movs r3, #0
    ldrsh r1, [r2, r3]
    ldr r6, [sp, #0x68]
    subs r1, r1, r6
    movs r3, #2
    ldrsh r0, [r2, r3]
    ldr r6, [sp, #0x6c]
    subs r0, r0, r6
    adds r2, r1, #0
    muls r2, r1, r2
    adds r1, r2, #0
    adds r3, r0, #0
    muls r3, r0, r3
    adds r0, r3, #0
    adds r2, r1, r0
    mov r0, sp
    ldrb r0, [r0]
    lsls r0, r0, #0x1c
    cmp r0, #0
    beq .L08032F6C
    ldr r6, [sp, #0x34]
    cmp r2, r6
    bhs .L08032F84
.L08032F6C:
    ldrb r1, [r5]
    mov r0, sb
    ands r0, r1
    movs r1, #3
    orrs r0, r1
    strb r0, [r5]
    strb r4, [r5, #1]
    mov r1, sp
    adds r0, r5, #0
    ldm r0!, {r3, r6}
    stm r1!, {r3, r6}
    str r2, [sp, #0x34]
.L08032F84:
    adds r4, #1
    ldr r0, [sp, #0x40]
    cmp r4, r0
    blo .L08032F12
.L08032F8C:
    movs r6, #0x36
    movs r7, #0x10
    rsbs r7, r7, #0
.L08032F92:
    mov r1, sl
    ldr r0, [r1]
    ldr r2, [r0, #0x44]
    mov r0, sl
    adds r1, r6, #0
    bl _call_via_r2
    adds r4, r0, #0
    cmp r4, #0
    beq .L0803303A
    ldrh r0, [r4, #4]
    ldr r2, [sp, #0x30]
    cmp r0, r2
    bne .L0803303A
    ldr r0, [r4, #0x14]
    ldr r1, [r0, #0x50]
    adds r0, r4, #0
    bl _call_via_r1
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08032FDE
    ldr r0, [r4, #0x14]
    ldr r1, [r0, #0x54]
    adds r0, r4, #0
    bl _call_via_r1
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08032FDE
    ldr r0, [r4, #0x14]
    ldr r1, [r0, #0x58]
    adds r0, r4, #0
    bl _call_via_r1
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0803303A
.L08032FDE:
    movs r3, #0xa
    ldrsh r1, [r4, r3]
    ldr r0, [sp, #0x68]
    subs r1, r1, r0
    movs r2, #0xe
    ldrsh r0, [r4, r2]
    ldr r3, [sp, #0x6c]
    subs r0, r0, r3
    adds r2, r1, #0
    muls r2, r1, r2
    adds r1, r2, #0
    adds r3, r0, #0
    muls r3, r0, r3
    adds r0, r3, #0
    adds r1, r1, r0
    adds r5, r1, #0
    mov r0, sp
    ldrb r0, [r0]
    lsls r0, r0, #0x1c
    cmp r0, #0
    beq .L0803300E
    ldr r0, [sp, #0x34]
    cmp r1, r0
    bhs .L0803303A
.L0803300E:
    add r4, sp, #8
    ldrb r1, [r4]
    adds r0, r7, #0
    ands r0, r1
    movs r1, #6
    orrs r0, r1
    strb r0, [r4]
    adds r0, r6, #0
    subs r0, #0x36
    strb r0, [r4, #1]
    ldr r0, [sp, #0x70]
    adds r1, r4, #0
    bl func_0809E968
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0803303A
    mov r1, sp
    adds r0, r4, #0
    ldm r0!, {r2, r3}
    stm r1!, {r2, r3}
    str r5, [sp, #0x34]
.L0803303A:
    adds r6, #1
    cmp r6, #0x45
    bls .L08032F92
    movs r4, #0x2e
.L08033042:
    mov r6, sl
    ldr r0, [r6]
    ldr r2, [r0, #0x44]
    mov r0, sl
    adds r1, r4, #0
    bl _call_via_r2
    adds r4, #1
    cmp r4, #0x35
    bls .L08033042
    movs r5, #0x4c
    movs r7, #0x10
    rsbs r7, r7, #0
.L0803305C:
    mov r1, sl
    ldr r0, [r1]
    ldr r2, [r0, #0x44]
    mov r0, sl
    adds r1, r5, #0
    bl _call_via_r2
    adds r2, r0, #0
    cmp r2, #0
    beq .L080330D4
    ldrh r0, [r2, #4]
    ldr r3, [sp, #0x30]
    cmp r0, r3
    bne .L080330D4
    movs r6, #0xa
    ldrsh r1, [r2, r6]
    ldr r0, [sp, #0x68]
    subs r1, r1, r0
    movs r3, #0xe
    ldrsh r0, [r2, r3]
    ldr r6, [sp, #0x6c]
    subs r0, r0, r6
    adds r2, r1, #0
    muls r2, r1, r2
    adds r1, r2, #0
    adds r3, r0, #0
    muls r3, r0, r3
    adds r0, r3, #0
    adds r1, r1, r0
    adds r6, r1, #0
    mov r0, sp
    ldrb r0, [r0]
    lsls r0, r0, #0x1c
    cmp r0, #0
    beq .L080330A8
    ldr r0, [sp, #0x34]
    cmp r1, r0
    bhs .L080330D4
.L080330A8:
    add r4, sp, #8
    ldrb r1, [r4]
    adds r0, r7, #0
    ands r0, r1
    movs r1, #8
    orrs r0, r1
    strb r0, [r4]
    adds r0, r5, #0
    subs r0, #0x4c
    strb r0, [r4, #1]
    ldr r0, [sp, #0x70]
    adds r1, r4, #0
    bl func_0809E968
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L080330D4
    mov r1, sp
    adds r0, r4, #0
    ldm r0!, {r2, r3}
    stm r1!, {r2, r3}
    str r6, [sp, #0x34]
.L080330D4:
    adds r5, #1
    cmp r5, #0x53
    bls .L0803305C
    ldr r1, [sp, #0x28]
    mov r0, sp
    ldm r0!, {r2, r6}
    stm r1!, {r2, r6}
    ldr r0, [sp, #0x28]
    add sp, #0x48
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1

    thumb_func_start func_080330F4
func_080330F4: @ 0x080330F4
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #0x6c
    str r0, [sp, #0x44]
    adds r5, r1, #0
    adds r7, r2, #0
    adds r4, r3, #0
    ldr r3, [sp, #0x8c]
    add r2, sp, #0xc
    ldrb r1, [r2]
    movs r6, #0x10
    rsbs r6, r6, #0
    adds r0, r6, #0
    ands r0, r1
    strb r0, [r2]
    ldrb r1, [r4, #1]
    lsrs r1, r1, #2
    ldrh r0, [r4, #2]
    ldr r2, .L08033150 @ =0x000003FF
    ands r0, r2
    lsls r0, r0, #6
    orrs r0, r1
    lsls r0, r0, #0x10
    asrs r0, r0, #0x10
    str r0, [sp, #0x48]
    ldrb r1, [r4, #3]
    lsrs r1, r1, #2
    ldrh r0, [r4, #4]
    ands r0, r2
    lsls r0, r0, #6
    orrs r0, r1
    lsls r0, r0, #0x10
    asrs r0, r0, #0x10
    mov sl, r0
    cmp r3, #1
    bne .L08033144
    b .L08033286
.L08033144:
    cmp r3, #1
    bgt .L08033154
    cmp r3, #0
    beq .L0803315C
    b .L0803356A
    .align 2, 0
.L08033150: .4byte 0x000003FF
.L08033154:
    cmp r3, #2
    bne .L0803315A
    b .L0803333C
.L0803315A:
    b .L0803356A
.L0803315C:
    movs r0, #0
    str r0, [sp, #0x4c]
    mov sb, r0
    ldr r1, .L080331F4 @ =0x000009C8
    adds r1, r5, r1
    str r1, [sp, #0x50]
    mov r2, sp
    adds r2, #0x20
    str r2, [sp, #0x54]
.L0803316E:
    movs r7, #0
    mov r3, sb
    lsls r3, r3, #1
    str r3, [sp, #0x64]
    mov r4, sb
    adds r4, #1
    str r4, [sp, #0x60]
    ldr r6, [sp, #0x48]
    rsbs r0, r6, #0
    movs r1, #0x8c
    lsls r1, r1, #1
    adds r6, r0, r1
.L08033186:
    ldr r0, [sp, #0x64]
    adds r0, #0x17
    lsls r0, r0, #3
    mov r2, sl
    subs r0, r0, r2
    adds r1, r6, #0
    muls r1, r6, r1
    adds r3, r0, #0
    muls r3, r0, r3
    adds r0, r3, #0
    adds r1, r1, r0
    mov r8, r1
    add r0, sp, #0xc
    ldrb r0, [r0]
    lsls r0, r0, #0x1c
    cmp r0, #0
    beq .L080331AE
    ldr r4, [sp, #0x4c]
    cmp r8, r4
    bhs .L08033272
.L080331AE:
    movs r0, #0x2b
    mov r1, sb
    muls r1, r0, r1
    adds r0, r1, #0
    adds r0, r7, r0
    lsls r0, r0, #2
    ldr r2, [sp, #0x50]
    adds r0, r2, r0
    ldr r1, [r0]
    lsls r0, r1, #0x14
    lsrs r0, r0, #0x1c
    cmp r0, #5
    bne .L080331EE
    str r1, [sp, #0x1c]
    add r0, sp, #0x14
    add r1, sp, #0x1c
    bl method_0800A4A4__9FieldPlot
    add r5, sp, #0x14
    adds r0, r5, #0
    bl IsEmpty__C12RucksackItem
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L080331EE
    adds r0, r5, #0
    bl GetKind__C12RucksackItem
    cmp r0, #0
    beq .L080331F8
    cmp r0, #1
    beq .L08033220
.L080331EE:
    movs r1, #0
    b .L0803323E
    .align 2, 0
.L080331F4: .4byte 0x000009C8
.L080331F8:
    add r0, sp, #0x18
    adds r1, r5, #0
    bl GetFood__C12RucksackItem
    add r0, sp, #0x18
    ldrb r1, [r0]
    adds r0, #1
    ldrb r0, [r0]
    lsls r0, r0, #8
    orrs r0, r1
    mov r1, sp
    adds r1, #0x1a
    ldrb r1, [r1]
    lsls r1, r1, #0x10
    orrs r1, r0
    ldr r0, [sp, #0x54]
    bl __7ProductG4Food
    ldr r0, [sp, #0x54]
    b .L08033234
.L08033220:
    mov r4, sp
    adds r4, #0x21
    adds r0, r5, #0
    bl GetArticle__C12RucksackItem
    adds r1, r0, #0
    adds r0, r4, #0
    bl __7ProductG7Article
    adds r0, r4, #0
.L08033234:
    bl GetPrice__C7Product
    rsbs r1, r0, #0
    orrs r1, r0
    lsrs r1, r1, #0x1f
.L0803323E:
    cmp r1, #0
    beq .L08033272
    add r4, sp, #0x14
    ldrb r1, [r4]
    movs r0, #0x10
    rsbs r0, r0, #0
    ands r0, r1
    movs r1, #2
    orrs r0, r1
    strb r0, [r4]
    strb r7, [r4, #1]
    mov r3, sb
    strb r3, [r4, #2]
    ldr r0, [sp, #0x90]
    adds r1, r4, #0
    bl func_0809E968
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08033272
    add r1, sp, #0xc
    adds r0, r4, #0
    ldm r0!, {r2, r4}
    stm r1!, {r2, r4}
    mov r3, r8
    str r3, [sp, #0x4c]
.L08033272:
    adds r6, #0x10
    adds r7, #1
    cmp r7, #0x2a
    bls .L08033186
    ldr r4, [sp, #0x60]
    mov sb, r4
    cmp r4, #0x18
    bhi .L08033284
    b .L0803316E
.L08033284:
    b .L0803356A
.L08033286:
    movs r0, #0
    str r0, [sp, #0x58]
    movs r7, #0
    ldr r1, .L08033338 @ =0x000009C8
    adds r1, r1, r5
    mov sb, r1
.L08033292:
    movs r6, #0
    adds r2, r7, #1
    mov r8, r2
    ldr r3, [sp, #0x48]
    rsbs r0, r3, #0
    movs r4, #0x8c
    lsls r4, r4, #1
    adds r5, r0, r4
.L080332A2:
    movs r0, #0x2b
    muls r0, r7, r0
    adds r0, r6, r0
    lsls r0, r0, #2
    add r0, sb
    ldr r1, [r0]
    lsls r0, r1, #0x14
    lsrs r2, r0, #0x1c
    movs r3, #0
    lsls r0, r1, #0x1e
    lsrs r0, r0, #0x1e
    cmp r0, #1
    bne .L080332CE
    subs r0, r2, #1
    cmp r0, #3
    bhi .L080332CE
    lsls r0, r1, #0x18
    lsrs r0, r0, #0x1a
    movs r1, #0x14
    eors r0, r1
    rsbs r0, r0, #0
    lsrs r3, r0, #0x1f
.L080332CE:
    cmp r3, #0
    beq .L08033328
    lsls r0, r7, #4
    adds r0, #0xb8
    mov r1, sl
    subs r0, r0, r1
    adds r1, r5, #0
    muls r1, r5, r1
    adds r2, r0, #0
    muls r2, r0, r2
    adds r0, r2, #0
    adds r1, r1, r0
    adds r2, r1, #0
    add r0, sp, #0xc
    ldrb r0, [r0]
    lsls r0, r0, #0x1c
    cmp r0, #0
    beq .L080332F8
    ldr r3, [sp, #0x58]
    cmp r1, r3
    bhs .L08033328
.L080332F8:
    add r4, sp, #0x14
    ldrb r1, [r4]
    movs r0, #0x10
    rsbs r0, r0, #0
    ands r0, r1
    movs r1, #1
    orrs r0, r1
    strb r0, [r4]
    strb r6, [r4, #1]
    strb r7, [r4, #2]
    ldr r0, [sp, #0x90]
    adds r1, r4, #0
    str r2, [sp, #0x68]
    bl func_0809E968
    lsls r0, r0, #0x18
    ldr r2, [sp, #0x68]
    cmp r0, #0
    bne .L08033328
    add r1, sp, #0xc
    adds r0, r4, #0
    ldm r0!, {r3, r4}
    stm r1!, {r3, r4}
    str r2, [sp, #0x58]
.L08033328:
    adds r5, #0x10
    adds r6, #1
    cmp r6, #0x2a
    bls .L080332A2
    mov r7, r8
    cmp r7, #0x18
    bls .L08033292
    b .L0803356A
    .align 2, 0
.L08033338: .4byte 0x000009C8
.L0803333C:
    add r0, sp, #0x24
    bl smethod_08009ADC__4Farm
    ldr r0, [sp, #0x24]
    str r0, [sp, #0x28]
    add r6, sp, #0x28
    mov r8, r6
    add r0, sp, #0x2c
    bl smethod_08009AE8__4Farm
    ldr r0, [sp, #0x2c]
    str r0, [sp, #0x30]
    add r6, sp, #0x30
    add r0, sp, #0x34
    bl method_0800CE58__4Barn
    ldr r0, [sp, #0x34]
    str r0, [sp, #0x38]
    mov r0, sp
    adds r0, #0x38
    str r0, [sp, #0x5c]
    add r0, sp, #0x3c
    bl method_0800C554__4Coop
    ldr r0, [sp, #0x3c]
    str r0, [sp, #0x40]
    add r1, sp, #0x40
    mov sb, r1
    ldrh r0, [r4]
    lsls r0, r0, #0x16
    lsrs r0, r0, #0x16
    cmp r0, #0x11
    bne .L08033380
    b .L080334EA
.L08033380:
    cmp r0, #0x11
    bgt .L0803338A
    cmp r0, #2
    beq .L08033390
    b .L0803356A
.L0803338A:
    cmp r0, #0x25
    beq .L08033466
    b .L0803356A
.L08033390:
    ldr r2, [sp, #0x48]
    str r2, [sp]
    mov r3, sl
    str r3, [sp, #4]
    ldr r4, [sp, #0x90]
    str r4, [sp, #8]
    add r4, sp, #0x14
    adds r0, r4, #0
    adds r1, r5, #0
    adds r2, r7, #0
    movs r3, #2
    bl func_08032BB4
    add r1, sp, #0xc
    adds r0, r4, #0
    ldm r0!, {r2, r3}
    stm r1!, {r2, r3}
    add r0, sp, #0xc
    ldrb r0, [r0]
    lsls r0, r0, #0x1c
    cmp r0, #0
    beq .L080333BE
    b .L0803356A
.L080333BE:
    mov r1, r8
    movs r2, #0
    ldrsh r0, [r1, r2]
    ldr r1, [sp, #0x48]
    subs r3, r0, r1
    mov r2, r8
    movs r1, #2
    ldrsh r0, [r2, r1]
    mov r2, sl
    subs r1, r0, r2
    adds r2, r3, #0
    muls r2, r3, r2
    adds r0, r1, #0
    muls r0, r1, r0
    adds r2, r2, r0
    movs r3, #0
    ldrsh r0, [r6, r3]
    ldr r1, [sp, #0x48]
    subs r3, r0, r1
    movs r1, #2
    ldrsh r0, [r6, r1]
    mov r6, sl
    subs r1, r0, r6
    adds r0, r3, #0
    muls r0, r3, r0
    adds r3, r1, #0
    muls r3, r1, r3
    adds r1, r3, #0
    adds r0, r0, r1
    cmp r2, r0
    bhi .L08033418
    ldr r6, [sp, #0x5c]
    movs r1, #0
    ldrsh r0, [r6, r1]
    str r0, [sp]
    movs r2, #2
    ldrsh r0, [r6, r2]
    str r0, [sp, #4]
    ldr r3, [sp, #0x90]
    str r3, [sp, #8]
    adds r0, r4, #0
    adds r1, r5, #0
    adds r2, r7, #0
    movs r3, #0x25
    b .L080334AC
.L08033418:
    mov r6, sb
    movs r1, #0
    ldrsh r0, [r6, r1]
    str r0, [sp]
    movs r2, #2
    ldrsh r0, [r6, r2]
    str r0, [sp, #4]
    ldr r3, [sp, #0x90]
    str r3, [sp, #8]
    adds r0, r4, #0
    adds r1, r5, #0
    adds r2, r7, #0
    movs r3, #0x11
    bl func_08032BB4
    add r1, sp, #0xc
    adds r0, r4, #0
    ldm r0!, {r2, r6}
    stm r1!, {r2, r6}
    add r0, sp, #0xc
    ldrb r0, [r0]
    lsls r0, r0, #0x1c
    cmp r0, #0
    beq .L0803344A
    b .L0803356A
.L0803344A:
    ldr r3, [sp, #0x5c]
    movs r6, #0
    ldrsh r0, [r3, r6]
    str r0, [sp]
    movs r1, #2
    ldrsh r0, [r3, r1]
    str r0, [sp, #4]
    ldr r2, [sp, #0x90]
    str r2, [sp, #8]
    adds r0, r4, #0
    adds r1, r5, #0
    adds r2, r7, #0
    movs r3, #0x25
    b .L080334DC
.L08033466:
    ldr r6, [sp, #0x48]
    str r6, [sp]
    mov r0, sl
    str r0, [sp, #4]
    ldr r1, [sp, #0x90]
    str r1, [sp, #8]
    add r4, sp, #0x14
    adds r0, r4, #0
    adds r1, r5, #0
    adds r2, r7, #0
    movs r3, #0x25
    bl func_08032BB4
    add r1, sp, #0xc
    adds r0, r4, #0
    ldm r0!, {r2, r3}
    stm r1!, {r2, r3}
    add r0, sp, #0xc
    ldrb r0, [r0]
    lsls r0, r0, #0x1c
    cmp r0, #0
    bne .L0803356A
    mov r6, r8
    movs r1, #0
    ldrsh r0, [r6, r1]
    str r0, [sp]
    movs r2, #2
    ldrsh r0, [r6, r2]
    str r0, [sp, #4]
    ldr r3, [sp, #0x90]
    str r3, [sp, #8]
    adds r0, r4, #0
    adds r1, r5, #0
    adds r2, r7, #0
    movs r3, #2
.L080334AC:
    bl func_08032BB4
    add r1, sp, #0xc
    adds r0, r4, #0
    ldm r0!, {r2, r6}
    stm r1!, {r2, r6}
    add r0, sp, #0xc
    ldrb r0, [r0]
    lsls r0, r0, #0x1c
    cmp r0, #0
    bne .L0803356A
    mov r3, sb
    movs r6, #0
    ldrsh r0, [r3, r6]
    str r0, [sp]
    movs r1, #2
    ldrsh r0, [r3, r1]
    str r0, [sp, #4]
    ldr r2, [sp, #0x90]
    str r2, [sp, #8]
    adds r0, r4, #0
    adds r1, r5, #0
    adds r2, r7, #0
    movs r3, #0x11
.L080334DC:
    bl func_08032BB4
    add r1, sp, #0xc
    adds r0, r4, #0
    ldm r0!, {r3, r4}
    stm r1!, {r3, r4}
    b .L0803356A
.L080334EA:
    ldr r0, [sp, #0x48]
    str r0, [sp]
    mov r1, sl
    str r1, [sp, #4]
    ldr r2, [sp, #0x90]
    str r2, [sp, #8]
    add r4, sp, #0x14
    adds r0, r4, #0
    adds r1, r5, #0
    adds r2, r7, #0
    movs r3, #0x11
    bl func_08032BB4
    add r1, sp, #0xc
    adds r0, r4, #0
    ldm r0!, {r2, r3}
    stm r1!, {r2, r3}
    add r0, sp, #0xc
    ldrb r0, [r0]
    lsls r0, r0, #0x1c
    cmp r0, #0
    bne .L0803356A
    movs r3, #0
    ldrsh r0, [r6, r3]
    str r0, [sp]
    movs r1, #2
    ldrsh r0, [r6, r1]
    str r0, [sp, #4]
    ldr r2, [sp, #0x90]
    str r2, [sp, #8]
    adds r0, r4, #0
    adds r1, r5, #0
    adds r2, r7, #0
    movs r3, #2
    bl func_08032BB4
    add r1, sp, #0xc
    adds r0, r4, #0
    ldm r0!, {r3, r6}
    stm r1!, {r3, r6}
    add r0, sp, #0xc
    ldrb r0, [r0]
    lsls r0, r0, #0x1c
    cmp r0, #0
    bne .L0803356A
    ldr r1, [sp, #0x5c]
    movs r2, #0
    ldrsh r0, [r1, r2]
    str r0, [sp]
    movs r3, #2
    ldrsh r0, [r1, r3]
    str r0, [sp, #4]
    ldr r6, [sp, #0x90]
    str r6, [sp, #8]
    adds r0, r4, #0
    adds r1, r5, #0
    adds r2, r7, #0
    movs r3, #0x25
    bl func_08032BB4
    add r1, sp, #0xc
    adds r0, r4, #0
    ldm r0!, {r2, r3}
    stm r1!, {r2, r3}
.L0803356A:
    ldr r1, [sp, #0x44]
    add r0, sp, #0xc
    ldm r0!, {r4, r6}
    stm r1!, {r4, r6}
    ldr r0, [sp, #0x44]
    add sp, #0x6c
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1

    thumb_func_start func_08033584
func_08033584: @ 0x08033584
    push {r4, r5, r6, lr}
    sub sp, #0x10
    adds r4, r0, #0
    adds r5, r1, #0
    adds r3, r2, #0
    ldrb r0, [r4]
    lsls r0, r0, #0x1c
    lsrs r0, r0, #0x1c
    cmp r0, #8
    bhi .L08033648
    lsls r0, r0, #2
    ldr r1, .L080335A4 @ =.L080335A8
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L080335A4: .4byte .L080335A8
.L080335A8: @ jump table
    .4byte .L08033648 @ case 0
    .4byte .L080335CC @ case 1
    .4byte .L08033608 @ case 2
    .4byte .L080336A4 @ case 3
    .4byte .L080336C0 @ case 4
    .4byte .L080336E0 @ case 5
    .4byte .L08033708 @ case 6
    .4byte .L08033754 @ case 7
    .4byte .L08033764 @ case 8
.L080335CC:
    ldrb r2, [r4, #2]
    ldr r0, .L08033604 @ =0x000009C8
    adds r1, r5, r0
    movs r0, #0x2b
    muls r0, r2, r0
    ldrb r4, [r4, #1]
    adds r0, r0, r4
    lsls r0, r0, #2
    adds r1, r1, r0
    ldr r1, [r1]
    lsls r0, r1, #0x14
    lsrs r2, r0, #0x1c
    movs r3, #0
    lsls r0, r1, #0x1e
    lsrs r0, r0, #0x1e
    cmp r0, #1
    bne .L08033600
    subs r0, r2, #1
    cmp r0, #3
    bhi .L08033600
    lsls r0, r1, #0x18
    lsrs r0, r0, #0x1a
    movs r1, #0x14
    eors r0, r1
    rsbs r0, r0, #0
    lsrs r3, r0, #0x1f
.L08033600:
    adds r0, r3, #0
    b .L0803377A
    .align 2, 0
.L08033604: .4byte 0x000009C8
.L08033608:
    ldrb r2, [r4, #2]
    ldr r0, .L0803364C @ =0x000009C8
    adds r1, r5, r0
    movs r0, #0x2b
    muls r0, r2, r0
    ldrb r4, [r4, #1]
    adds r0, r0, r4
    lsls r0, r0, #2
    adds r1, r1, r0
    ldr r1, [r1]
    lsls r0, r1, #0x14
    lsrs r0, r0, #0x1c
    cmp r0, #5
    bne .L08033648
    str r1, [sp, #8]
    add r1, sp, #8
    mov r0, sp
    bl method_0800A4A4__9FieldPlot
    mov r0, sp
    bl IsEmpty__C12RucksackItem
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08033648
    mov r0, sp
    bl GetKind__C12RucksackItem
    cmp r0, #0
    beq .L08033650
    cmp r0, #1
    beq .L08033684
.L08033648:
    movs r0, #0
    b .L0803377A
    .align 2, 0
.L0803364C: .4byte 0x000009C8
.L08033650:
    add r4, sp, #0xc
    add r0, sp, #4
    mov r1, sp
    bl GetFood__C12RucksackItem
    add r0, sp, #4
    ldrb r1, [r0]
    adds r0, #1
    ldrb r0, [r0]
    lsls r0, r0, #8
    orrs r0, r1
    mov r1, sp
    adds r1, #6
    ldrb r1, [r1]
    lsls r1, r1, #0x10
    orrs r1, r0
    adds r0, r4, #0
    bl __7ProductG4Food
    adds r0, r4, #0
    bl GetPrice__C7Product
    rsbs r1, r0, #0
    orrs r1, r0
    lsrs r0, r1, #0x1f
    b .L0803377A
.L08033684:
    mov r4, sp
    adds r4, #0xd
    mov r0, sp
    bl GetArticle__C12RucksackItem
    adds r1, r0, #0
    adds r0, r4, #0
    bl __7ProductG7Article
    adds r0, r4, #0
    bl GetPrice__C7Product
    rsbs r1, r0, #0
    orrs r1, r0
    lsrs r0, r1, #0x1f
    b .L0803377A
.L080336A4:
    movs r6, #0
    movs r0, #0xff
    lsls r0, r0, #2
    adds r5, r5, r0
    adds r0, r5, #0
    bl GetStoredBushelCount__C4Coop
    cmp r0, #0
    beq .L08033700
    ldrb r1, [r4, #1]
    adds r0, r5, #0
    bl HasBushelForEnt__C4CoopUi
    b .L080336F8
.L080336C0:
    movs r6, #0
    ldr r0, .L080336DC @ =0x000005DC
    adds r5, r5, r0
    adds r0, r5, #0
    bl GetStoredBushelCount__C4Barn
    cmp r0, #0
    beq .L08033700
    ldrb r1, [r4, #1]
    adds r0, r5, #0
    bl HasBushelForStall__C4BarnUi
    b .L080336F8
    .align 2, 0
.L080336DC: .4byte 0x000005DC
.L080336E0:
    movs r6, #0
    ldr r0, .L08033704 @ =0x000005DC
    adds r5, r5, r0
    adds r0, r5, #0
    bl GetStoredBushelCount__C4Barn
    cmp r0, #0
    beq .L08033700
    ldrb r1, [r4, #1]
    adds r0, r5, #0
    bl HasBushelForPregnancyStall__C4BarnUi
.L080336F8:
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08033700
    movs r6, #1
.L08033700:
    adds r0, r6, #0
    b .L0803377A
    .align 2, 0
.L08033704: .4byte 0x000005DC
.L08033708:
    ldrb r1, [r4, #1]
    adds r1, #0x36
    ldr r0, [r3]
    ldr r2, [r0, #0x44]
    adds r0, r3, #0
    bl _call_via_r2
    adds r4, r0, #0
    movs r5, #0
    cmp r4, #0
    beq .L08033750
    ldr r0, [r4, #0x14]
    ldr r1, [r0, #0x50]
    adds r0, r4, #0
    bl _call_via_r1
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0803374E
    ldr r0, [r4, #0x14]
    ldr r1, [r0, #0x54]
    adds r0, r4, #0
    bl _call_via_r1
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0803374E
    ldr r0, [r4, #0x14]
    ldr r1, [r0, #0x58]
    adds r0, r4, #0
    bl _call_via_r1
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08033750
.L0803374E:
    movs r5, #1
.L08033750:
    adds r0, r5, #0
    b .L0803377A
.L08033754:
    ldrb r1, [r4, #1]
    adds r1, #0x2e
    ldr r0, [r3]
    ldr r2, [r0, #0x44]
    adds r0, r3, #0
    bl _call_via_r2
    b .L08033648
.L08033764:
    ldrb r1, [r4, #1]
    adds r1, #0x4c
    ldr r0, [r3]
    ldr r2, [r0, #0x44]
    adds r0, r3, #0
    bl _call_via_r2
    adds r1, r0, #0
    rsbs r0, r1, #0
    orrs r0, r1
    lsrs r0, r0, #0x1f
.L0803377A:
    add sp, #0x10
    pop {r4, r5, r6}
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_08033784
func_08033784: @ 0x08033784
    push {r4, lr}
    adds r3, r0, #0
    adds r4, r2, #0
    ldrb r0, [r3]
    lsls r0, r0, #0x1c
    lsrs r0, r0, #0x1c
    cmp r0, #8
    bhi .L080337F2
    lsls r0, r0, #2
    ldr r1, .L080337A0 @ =.L080337A4
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L080337A0: .4byte .L080337A4
.L080337A4: @ jump table
    .4byte .L080337F2 @ case 0
    .4byte .L080337C8 @ case 1
    .4byte .L080337C8 @ case 2
    .4byte .L080337CC @ case 3
    .4byte .L080337D0 @ case 4
    .4byte .L080337D0 @ case 5
    .4byte .L080337D4 @ case 6
    .4byte .L080337DA @ case 7
    .4byte .L080337E0 @ case 8
.L080337C8:
    movs r0, #2
    b .L080337FA
.L080337CC:
    movs r0, #0x11
    b .L080337FA
.L080337D0:
    movs r0, #0x25
    b .L080337FA
.L080337D4:
    ldrb r1, [r3, #1]
    adds r1, #0x36
    b .L080337E4
.L080337DA:
    ldrb r1, [r3, #1]
    adds r1, #0x2e
    b .L080337E4
.L080337E0:
    ldrb r1, [r3, #1]
    adds r1, #0x4c
.L080337E4:
    ldr r0, [r4]
    ldr r2, [r0, #0x44]
    adds r0, r4, #0
    bl _call_via_r2
    cmp r0, #0
    bne .L080337F8
.L080337F2:
    movs r0, #0x8d
    lsls r0, r0, #2
    b .L080337FA
.L080337F8:
    ldrh r0, [r0, #4]
.L080337FA:
    pop {r4}
    pop {r1}
    bx r1

    thumb_func_start func_08033800
func_08033800: @ 0x08033800
    push {r4, lr}
    adds r4, r0, #0
    adds r0, r1, #0
    adds r1, r2, #0
    ldr r2, [r0]
    ldr r2, [r2, #0x44]
    bl _call_via_r2
    adds r1, r0, #0
    cmp r1, #0
    beq .L08033822
    movs r2, #0xa
    ldrsh r0, [r1, r2]
    movs r2, #0xe
    ldrsh r1, [r1, r2]
    strh r0, [r4]
    b .L08033824
.L08033822:
    strh r1, [r4]
.L08033824:
    strh r1, [r4, #2]
    adds r0, r4, #0
    pop {r4}
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_08033830
func_08033830: @ 0x08033830
    push {r4, r5, lr}
    adds r5, r0, #0
    adds r4, r1, #0
    ldrb r0, [r4]
    lsls r0, r0, #0x1c
    lsrs r0, r0, #0x1c
    cmp r0, #8
    bhi .L08033874
    lsls r0, r0, #2
    ldr r1, .L0803384C @ =.L08033850
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L0803384C: .4byte .L08033850
.L08033850: @ jump table
    .4byte .L08033874 @ case 0
    .4byte .L0803387C @ case 1
    .4byte .L0803387C @ case 2
    .4byte .L08033892 @ case 3
    .4byte .L080338A2 @ case 4
    .4byte .L080338B4 @ case 5
    .4byte .L080338C8 @ case 6
    .4byte .L080338CE @ case 7
    .4byte .L080338DC @ case 8
.L08033874:
    movs r0, #0
    strh r0, [r5]
    strh r0, [r5, #2]
    b .L080338E8
.L0803387C:
    ldrb r0, [r4, #1]
    ldrb r1, [r4, #2]
    lsls r0, r0, #4
    movs r2, #0x8c
    lsls r2, r2, #1
    adds r0, r0, r2
    lsls r1, r1, #4
    adds r1, #0xb8
    strh r0, [r5]
    strh r1, [r5, #2]
    b .L080338E8
.L08033892:
    movs r0, #0xff
    lsls r0, r0, #2
    adds r1, r2, r0
    ldrb r2, [r4, #1]
    adds r0, r5, #0
    bl method_0800C6F0__C4CoopUi
    b .L080338E8
.L080338A2:
    ldr r0, .L080338B0 @ =0x000005DC
    adds r1, r2, r0
    ldrb r2, [r4, #1]
    adds r0, r5, #0
    bl method_0800D074__C4BarnUi
    b .L080338E8
    .align 2, 0
.L080338B0: .4byte 0x000005DC
.L080338B4:
    ldr r0, .L080338C4 @ =0x000005DC
    adds r1, r2, r0
    ldrb r2, [r4, #1]
    adds r0, r5, #0
    bl method_0800D0C0__C4BarnUi
    b .L080338E8
    .align 2, 0
.L080338C4: .4byte 0x000005DC
.L080338C8:
    ldrb r2, [r4, #1]
    adds r2, #0x36
    b .L080338D2
.L080338CE:
    ldrb r2, [r4, #1]
    adds r2, #0x2e
.L080338D2:
    adds r0, r5, #0
    adds r1, r3, #0
    bl func_08033800
    b .L080338E8
.L080338DC:
    ldrb r2, [r4, #1]
    adds r2, #0x4c
    adds r0, r5, #0
    adds r1, r3, #0
    bl func_08033800
.L080338E8:
    adds r0, r5, #0
    pop {r4, r5}
    pop {r1}
    bx r1

    thumb_func_start func_080338F0
func_080338F0: @ 0x080338F0
    push {r4, lr}
    adds r4, r0, #0
    movs r0, #0x80
    lsls r0, r0, #2
    bl func_080AB788
    movs r1, #0
    movs r2, #0x80
    lsls r2, r2, #1
    adds r4, r4, r2
    cmp r0, r4
    bhs .L0803390A
    movs r1, #1
.L0803390A:
    adds r0, r1, #0
    pop {r4}
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_08033914
func_08033914: @ 0x08033914
    movs r1, #0xc0
    lsls r1, r1, #9
    adds r0, #1
    muls r0, r1, r0
    lsrs r0, r0, #8
    movs r1, #0x80
    lsls r1, r1, #8
    adds r0, r0, r1
    bx lr
    .align 2, 0

    thumb_func_start func_08033928
func_08033928: @ 0x08033928
    push {r4, r5, r6, r7, lr}
    mov r7, r8
    push {r7}
    sub sp, #0x14
    adds r7, r0, #0
    adds r5, r1, #0
    adds r6, r2, #0
    adds r4, r3, #0
    ldr r1, .L080339A4 @ =gUnk_080F149C
    lsls r0, r6, #2
    adds r0, r0, r1
    ldr r2, [r0]
    add r0, sp, #4
    adds r1, r4, #0
    bl func_080A03B8
    ldr r1, .L080339A8 @ =gUnk_080F14E2
    lsls r0, r6, #1
    adds r0, r0, r1
    ldrh r0, [r0]
    str r0, [sp]
    adds r0, r7, #0
    adds r1, r5, #0
    add r2, sp, #4
    movs r3, #2
    bl __12AActorEntityP10GameObjectRC13ActorLocationUiUi
    ldr r0, .L080339AC @ =vtable_unk_080E68C8
    str r0, [r7, #0x14]
    adds r0, r7, #0
    adds r0, #0x30
    movs r5, #0
    strb r6, [r0]
    adds r0, r4, #0
    adds r1, r6, #0
    bl func_080A099C
    str r0, [r7, #0x34]
    movs r0, #0x87
    lsls r0, r0, #3
    adds r4, r4, r0
    str r4, [r7, #0x38]
    ldr r0, [sp, #0x2c]
    str r0, [r7, #0x3c]
    adds r0, r7, #0
    adds r0, #0x41
    strb r5, [r0]
    adds r0, #1
    strb r5, [r0]
    movs r0, #0x80
    lsls r0, r0, #8
    mov r8, r0
    ldr r0, [r7, #0x34]
    ldr r0, [r0, #0x1c]
    cmp r0, #5
    bhi .L08033A08
    lsls r0, r0, #2
    ldr r1, .L080339B0 @ =.L080339B4
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L080339A4: .4byte gUnk_080F149C
.L080339A8: .4byte gUnk_080F14E2
.L080339AC: .4byte vtable_unk_080E68C8
.L080339B0: .4byte .L080339B4
.L080339B4: @ jump table
    .4byte .L080339D8 @ case 0
    .4byte .L08033A06 @ case 1
    .4byte .L080339D0 @ case 2
    .4byte .L080339EC @ case 3
    .4byte .L080339CC @ case 4
    .4byte .L08033A06 @ case 5
.L080339CC:
    movs r5, #4
    b .L08033A08
.L080339D0:
    ldr r0, [r7, #0x34]
    adds r0, #0x22
    ldrb r5, [r0]
    b .L08033A08
.L080339D8:
    add r4, sp, #0xc
    adds r0, r4, #0
    adds r1, r6, #0
    bl func_0809E804
    adds r0, r7, #0
    adds r1, r4, #0
    bl SetLocation__12AActorEntityRC13ActorLocation
    b .L08033A08
.L080339EC:
    movs r5, #1
    ldr r4, [r7, #0x34]
    adds r0, r4, #0
    bl GetCurrentTask__C13HarvestSprite
    adds r1, r0, #0
    adds r0, r4, #0
    bl GetTaskExp__C13HarvestSpriteQ213HarvestSprite4Task
    bl func_08033914
    mov r8, r0
    b .L08033A08
.L08033A06:
    movs r5, #1
.L08033A08:
    mvns r1, r5
    adds r0, r7, #0
    adds r0, #0x40
    strb r1, [r0]
    subs r0, #0x20
    ldrb r2, [r0]
    adds r0, r7, #0
    adds r1, r5, #0
    mov r3, r8
    bl func_08034180
    adds r0, r7, #0
    add sp, #0x14
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
.L08033A2C:
    .byte 0x70, 0xB5, 0x82, 0xB0
    .byte 0x05, 0x1C, 0x0E, 0x1C, 0x10, 0x48, 0x68, 0x61, 0x6C, 0x6B, 0x68, 0x46, 0x29, 0x1C, 0xFE, 0xF7
    .byte 0x97, 0xFB, 0x20, 0x1C, 0x69, 0x46, 0x6A, 0xF0, 0x8F, 0xFC, 0x0C, 0x48, 0x68, 0x61, 0x29, 0x69
    .byte 0x00, 0x29, 0x05, 0xD0, 0x48, 0x68, 0x82, 0x68, 0x08, 0x1C, 0x03, 0x21, 0x9F, 0xF0, 0x5A, 0xFF
    .byte 0x01, 0x20, 0x30, 0x40, 0x00, 0x28, 0x02, 0xD0, 0x28, 0x1C, 0xCC, 0xF7, 0xCD, 0xFD, 0x02, 0xB0
    .byte 0x70, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0xC8, 0x68, 0x0E, 0x08, 0x50, 0x62, 0x0E, 0x08
    .byte 0x30, 0xB5, 0x04, 0x1C, 0xD4, 0x20, 0xCC, 0xF7, 0xA5, 0xFD, 0x21, 0x1C, 0x00, 0xF0, 0xC2, 0xFF
    .byte 0x05, 0x1C, 0x01, 0x21, 0x49, 0x42, 0x40, 0x34, 0x20, 0x78, 0x02, 0x28, 0x02, 0xD0, 0x03, 0x28
    .byte 0x02, 0xD0, 0x02, 0xE0, 0x08, 0x21, 0x02, 0xE0, 0x05, 0x21, 0x00, 0x29, 0x15, 0xDB, 0x28, 0x1C
    .byte 0x70, 0x30, 0x2A, 0xF0, 0xD5, 0xFE, 0x28, 0x1C, 0x84, 0x30, 0x00, 0x22, 0x01, 0x21, 0x01, 0x70
    .byte 0x02, 0x30, 0x02, 0x70, 0x01, 0x30, 0x01, 0x70, 0x2B, 0x1C, 0x8A, 0x33, 0x02, 0x22, 0x19, 0x78
    .byte 0x04, 0x20, 0x40, 0x42, 0x08, 0x40, 0x10, 0x43, 0x18, 0x70, 0x28, 0x1C, 0x30, 0xBC, 0x02, 0xBC
    .byte 0x08, 0x47, 0x00, 0x00, 0x00, 0xB5, 0x00, 0x21, 0x81, 0x71, 0x02, 0x1C, 0x42, 0x32, 0x01, 0x21
    .byte 0x11, 0x70, 0x00, 0xF0, 0x43, 0xF8, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0x03, 0x49, 0x30, 0x30
    .byte 0x00, 0x78, 0x40, 0x00, 0x40, 0x18, 0x00, 0x88, 0x70, 0x47, 0x00, 0x00, 0xD4, 0x14, 0x0F, 0x08
    .byte 0x10, 0xB5, 0x04, 0x1C, 0xEC, 0xF7, 0x84, 0xF9, 0x60, 0x6B, 0x6A, 0xF0, 0x5F, 0xFC, 0x10, 0xBC
    .byte 0x01, 0xBC, 0x00, 0x47

    thumb_func_start func_08033B24
func_08033B24: @ 0x08033B24
    push {r4, r5, r6, lr}
    sub sp, #0x18
    adds r6, r0, #0
    adds r0, #0x30
    ldrb r0, [r0]
    ldr r1, [r6, #0x38]
    lsls r0, r0, #3
    adds r1, r1, r0
    ldrb r0, [r1]
    lsls r0, r0, #0x1c
    cmp r0, #0
    beq .L08033B40
    movs r0, #0
    b .L08033B74
.L08033B40:
    ldr r5, [r6]
    add r4, sp, #0x10
    adds r0, r4, #0
    adds r1, r6, #0
    bl GetLocation__C7AEntity
    ldr r0, [r6, #0x34]
    bl GetCurrentTask__C13HarvestSprite
    ldr r1, [r6, #0x3c]
    str r0, [sp]
    ldr r0, [r6, #0x38]
    str r0, [sp, #4]
    add r0, sp, #8
    adds r2, r5, #0
    adds r3, r4, #0
    bl func_080330F4
    add r0, sp, #8
    movs r1, #0
    ldrb r0, [r0]
    lsls r0, r0, #0x1c
    cmp r0, #0
    bne .L08033B72
    movs r1, #1
.L08033B72:
    adds r0, r1, #0
.L08033B74:
    add sp, #0x18
    pop {r4, r5, r6}
    pop {r1}
    bx r1

    thumb_func_start func_08033B7C
func_08033B7C: @ 0x08033B7C
    adds r0, #0x41
    movs r1, #0
    strb r1, [r0]
    bx lr

    thumb_func_start func_08033B84
func_08033B84: @ 0x08033B84
    push {lr}
    ldr r0, [r0, #0x10]
    cmp r0, #0
    beq .L08033B90
    bl func_08034BFC
.L08033B90:
    pop {r0}
    bx r0
.L08033B94:
    .byte 0xF0, 0xB5, 0x57, 0x46, 0x4E, 0x46, 0x45, 0x46, 0xE0, 0xB4, 0xAB, 0xB0
    .byte 0x07, 0x1C, 0x0A, 0x1C, 0x78, 0x6B, 0x80, 0x46, 0x39, 0x68, 0x8A, 0x46, 0xC0, 0x69, 0x05, 0x28
    .byte 0x12, 0xD8, 0x80, 0x00, 0x01, 0x49, 0x40, 0x18, 0x00, 0x68, 0x87, 0x46, 0xC0, 0x3B, 0x03, 0x08
    .byte 0xD8, 0x3B, 0x03, 0x08, 0x64, 0x3C, 0x03, 0x08, 0x94, 0x3C, 0x03, 0x08, 0xFC, 0x3D, 0x03, 0x08
    .byte 0x54, 0x40, 0x03, 0x08, 0x78, 0x40, 0x03, 0x08, 0x10, 0x79, 0x00, 0x28, 0x00, 0xD1, 0x97, 0xE2
    .byte 0x40, 0x46, 0x6A, 0xF0, 0x3B, 0xFD, 0x03, 0x28, 0x00, 0xD1, 0x91, 0xE2, 0x40, 0x46, 0x6A, 0xF0
    .byte 0x39, 0xFD, 0x00, 0x28, 0x00, 0xD1, 0x8B, 0xE2, 0x52, 0x46, 0x10, 0x68, 0xA2, 0x23, 0x5B, 0x00
    .byte 0xC0, 0x18, 0x01, 0x68, 0x50, 0x46, 0x9F, 0xF0, 0x83, 0xFE, 0x02, 0x1C, 0x91, 0x7A, 0x1F, 0x20
    .byte 0x08, 0x40, 0x06, 0x28, 0x00, 0xD0, 0x7B, 0xE2, 0x50, 0x89, 0x40, 0x05, 0x80, 0x0E, 0x39, 0x1C
    .byte 0x30, 0x31, 0x09, 0x78, 0x01, 0x31, 0x88, 0x42, 0x00, 0xD0, 0x71, 0xE2, 0x10, 0x68, 0x03, 0x38
    .byte 0x01, 0x28, 0x13, 0xD9, 0xB4, 0x22, 0x52, 0x00, 0x08, 0x23, 0x5B, 0x42, 0x38, 0x1C, 0x02, 0x21
    .byte 0xEC, 0xF7, 0x1A, 0xF9, 0x12, 0xA9, 0x40, 0x46, 0x6A, 0xF0, 0xC2, 0xFD, 0x80, 0x23, 0x1B, 0x02
    .byte 0x38, 0x1C, 0x01, 0x21, 0x00, 0x22, 0x00, 0xF0, 0x93, 0xFA, 0x59, 0xE2, 0x40, 0x46, 0x6A, 0xF0
    .byte 0x7D, 0xFD, 0x55, 0xE2, 0xB8, 0x88, 0x02, 0x28, 0x0E, 0xD0, 0xB4, 0x22, 0x52, 0x00, 0x08, 0x23
    .byte 0x5B, 0x42, 0x38, 0x1C, 0x02, 0x21, 0xEC, 0xF7, 0xFF, 0xF8, 0x80, 0x23, 0x1B, 0x02, 0x38, 0x1C
    .byte 0x01, 0x21, 0x00, 0x22, 0x00, 0xF0, 0x7C, 0xFA, 0x0E, 0x24, 0x38, 0x5F, 0x77, 0x28, 0x00, 0xDC
    .byte 0x3E, 0xE2, 0xE9, 0xE1, 0x45, 0x46, 0x20, 0x35, 0x25, 0x95, 0x46, 0x46, 0x30, 0x8C, 0x00, 0x28
    .byte 0x00, 0xD0, 0xA7, 0xE0, 0x38, 0x1C, 0x00, 0xF0, 0x4B, 0xFE, 0x00, 0x06, 0x00, 0x28, 0x00, 0xD0
    .byte 0x2E, 0xE2, 0xE8, 0x78, 0x00, 0x28, 0x04, 0xD0, 0x01, 0x38, 0xE8, 0x70, 0x00, 0x06, 0x00, 0x28
    .byte 0x06, 0xD1, 0x38, 0x1C, 0x00, 0xF0, 0xCC, 0xFA, 0x00, 0x06, 0x00, 0x28, 0x00, 0xD0, 0x1F, 0xE2
    .byte 0x0F, 0x4D, 0x28, 0x1C, 0x05, 0x21, 0x77, 0xF0, 0xA9, 0xFD, 0x84, 0x00, 0x64, 0x19, 0x00, 0x26
    .byte 0x25, 0x99, 0x88, 0x70, 0x3C, 0x25, 0xA0, 0x78, 0x68, 0x43, 0x77, 0xF0, 0x4D, 0xFD, 0x61, 0x78
    .byte 0x69, 0x43, 0x09, 0x18, 0x25, 0x9A, 0x11, 0x80, 0xBC, 0x88, 0x13, 0xA8, 0x06, 0x80, 0x46, 0x80
    .byte 0x81, 0x46, 0x11, 0x2C, 0x25, 0xD0, 0x11, 0x2C, 0x04, 0xDC, 0x02, 0x2C, 0x05, 0xD0, 0x2C, 0xE0
    .byte 0x3C, 0x14, 0x0F, 0x08, 0x25, 0x2C, 0x0F, 0xD0, 0x27, 0xE0, 0x48, 0x20, 0x77, 0xF0, 0x34, 0xFD
    .byte 0x80, 0x30, 0x4B, 0x46, 0x18, 0x80, 0x48, 0x20, 0x77, 0xF0, 0x2E, 0xFD, 0x94, 0x25, 0x6D, 0x00
    .byte 0x40, 0x19, 0x4E, 0x46, 0x70, 0x80, 0x18, 0xE0, 0x68, 0x20, 0x77, 0xF0, 0x25, 0xFD, 0x48, 0x30
    .byte 0x49, 0x46, 0x08, 0x80, 0x30, 0x20, 0x77, 0xF0, 0x1F, 0xFD, 0x60, 0x30, 0x4A, 0x46, 0x50, 0x80
    .byte 0x0B, 0xE0, 0x40, 0x20, 0x77, 0xF0, 0x18, 0xFD, 0x90, 0x30, 0x4B, 0x46, 0x18, 0x80, 0x30, 0x20
    .byte 0x77, 0xF0, 0x12, 0xFD, 0x70, 0x30, 0x4D, 0x46, 0x68, 0x80, 0x38, 0x1C, 0x20, 0x30, 0x00, 0x78
    .byte 0x80, 0x46, 0x56, 0x46, 0x31, 0x68, 0x02, 0xA8, 0x4B, 0x6B, 0x51, 0x46, 0x22, 0x1C, 0x9F, 0xF0
    .byte 0xCB, 0xFD, 0x79, 0x69, 0x14, 0xA8, 0xCA, 0x68, 0x39, 0x1C, 0x9F, 0xF0, 0xC3, 0xFD, 0x14, 0x98
    .byte 0x15, 0x99, 0x29, 0x90, 0x2A, 0x91, 0x05, 0xAC, 0x20, 0x21, 0x8A, 0x46, 0x00, 0x25, 0x21, 0x21
    .byte 0x05, 0x91, 0x21, 0x20, 0x40, 0x42, 0x60, 0x60, 0xA0, 0x60, 0xE1, 0x60, 0x0A, 0xA9, 0x02, 0xA8
    .byte 0x4C, 0xC8, 0x4C, 0xC1, 0x29, 0x98, 0x2A, 0x99, 0x0D, 0x90, 0x0E, 0x91, 0x51, 0x46, 0xA1, 0x62
    .byte 0xE5, 0x62, 0x25, 0x63, 0x0A, 0x22, 0xB8, 0x5E, 0x0E, 0x23, 0xF9, 0x5E, 0x4D, 0x46, 0x00, 0x26
    .byte 0xAA, 0x5F, 0x13, 0xAB, 0x02, 0x25, 0x5B, 0x5F, 0x00, 0x94, 0x46, 0x46, 0x01, 0x96, 0x77, 0xF0
    .byte 0x2F, 0xFF, 0x02, 0x1C, 0x25, 0x98, 0x81, 0x78, 0x80, 0x23, 0x1B, 0x02, 0x38, 0x1C, 0x00, 0xF0
    .byte 0xC7, 0xF9, 0x8D, 0xE1, 0x01, 0x38, 0x41, 0x46, 0x08, 0x84, 0x89, 0xE1, 0x42, 0x46, 0x20, 0x32
    .byte 0x26, 0x92, 0x3C, 0x1C, 0x30, 0x34, 0x20, 0x78, 0xB9, 0x6B, 0xC0, 0x00, 0x09, 0x18, 0x89, 0x46
    .byte 0xF9, 0x6B, 0x48, 0x46, 0x52, 0x46, 0xFF, 0xF7, 0xB5, 0xFC, 0x06, 0x1C, 0xBD, 0x88, 0x0A, 0x20
    .byte 0x3B, 0x5E, 0x27, 0x93, 0x0E, 0x22, 0xB9, 0x5E, 0x28, 0x91, 0x16, 0xA8, 0x03, 0x80, 0x41, 0x80
    .byte 0xAE, 0x42, 0x08, 0xD1, 0xFA, 0x6B, 0x17, 0xA8, 0x49, 0x46, 0x53, 0x46, 0xFF, 0xF7, 0xF8, 0xFC
    .byte 0x17, 0x98, 0x16, 0x90, 0x27, 0xE0, 0x11, 0x2D, 0x1D, 0xD0, 0x11, 0x2D, 0x02, 0xDC, 0x02, 0x2D
    .byte 0x03, 0xD0, 0x1E, 0xE0, 0x25, 0x2D, 0x10, 0xD0, 0x1B, 0xE0, 0x11, 0x2E, 0x07, 0xD0, 0x25, 0x2E
    .byte 0x17, 0xD1, 0x18, 0xA8, 0xD5, 0xF7, 0x3A, 0xFE, 0x18, 0x98, 0x16, 0x90, 0x13, 0xE0, 0x19, 0xA8
    .byte 0xD5, 0xF7, 0x3A, 0xFE, 0x19, 0x98, 0x16, 0x90, 0x0D, 0xE0, 0x1A, 0xA8, 0xD8, 0xF7, 0xEC, 0xFF
    .byte 0x1A, 0x98, 0x16, 0x90, 0x07, 0xE0, 0x1B, 0xA8, 0xD8, 0xF7, 0x64, 0xFB, 0x1B, 0x98, 0x16, 0x90
    .byte 0x01, 0xE0, 0x8D, 0x26, 0xB6, 0x00, 0x8D, 0x20, 0x80, 0x00, 0x86, 0x42, 0x77, 0xD0, 0x16, 0xAB
    .byte 0x00, 0x22, 0x98, 0x5E, 0x27, 0x99, 0x40, 0x1A, 0x00, 0x28, 0x00, 0xDA, 0x40, 0x42, 0x07, 0x28
    .byte 0x6D, 0xDC, 0x5A, 0x23, 0x6B, 0x44, 0x00, 0x22, 0x98, 0x5E, 0x28, 0x99, 0x40, 0x1A, 0x00, 0x28
    .byte 0x00, 0xDA, 0x40, 0x42, 0x07, 0x28, 0x62, 0xDC, 0x38, 0x1C, 0x00, 0xF0, 0x39, 0xFD, 0x00, 0x06
    .byte 0x01, 0x0E, 0x00, 0x29, 0x00, 0xD0, 0x1B, 0xE1, 0xAE, 0x42, 0x19, 0xD1, 0x38, 0x1C, 0x00, 0xF0
    .byte 0x45, 0xFA, 0x00, 0x06, 0x00, 0x28, 0x00, 0xD1, 0xBE, 0xE0, 0x08, 0x49, 0x1C, 0x98, 0x08, 0x40
    .byte 0x3C, 0x21, 0x08, 0x43, 0x1C, 0x90, 0x1C, 0xA9, 0x40, 0x46, 0x6A, 0xF0, 0x79, 0xFC, 0x38, 0x1C
    .byte 0x20, 0x30, 0x02, 0x78, 0x38, 0x1C, 0x04, 0x21, 0xE3, 0xE0, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF
    .byte 0x02, 0x24, 0x1D, 0xA8, 0x01, 0x80, 0x41, 0x80, 0x80, 0x46, 0x11, 0x2D, 0x1C, 0xD0, 0x11, 0x2D
    .byte 0x02, 0xDC, 0x02, 0x2D, 0x03, 0xD0, 0x1C, 0xE0, 0x25, 0x2D, 0x10, 0xD0, 0x19, 0xE0, 0x11, 0x2E
    .byte 0x07, 0xD0, 0x25, 0x2E, 0x15, 0xD1, 0x25, 0x24, 0x1E, 0xA8, 0xD8, 0xF7, 0x8D, 0xFF, 0x1E, 0x98
    .byte 0x0E, 0xE0, 0x11, 0x24, 0x1F, 0xA8, 0xD8, 0xF7, 0x05, 0xFB, 0x1F, 0x98, 0x08, 0xE0, 0x20, 0xA8
    .byte 0xD5, 0xF7, 0xC4, 0xFD, 0x20, 0x98, 0x03, 0xE0, 0x21, 0xA8, 0xD5, 0xF7, 0xC5, 0xFD, 0x21, 0x98
    .byte 0x1D, 0x90, 0x43, 0x46, 0x00, 0x25, 0x5A, 0x5F, 0x1D, 0xA8, 0x02, 0x26, 0x83, 0x5F, 0x38, 0x1C
    .byte 0x21, 0x1C, 0xEB, 0xF7, 0x81, 0xFF, 0x38, 0x1C, 0x20, 0x30, 0x02, 0x78, 0x38, 0x1C, 0x00, 0x21
    .byte 0x00, 0x23, 0x00, 0xF0, 0xFD, 0xF8, 0x00, 0x20, 0x26, 0x99, 0x08, 0x80, 0xC0, 0xE0, 0x26, 0x9A
    .byte 0x10, 0x88, 0x00, 0x28, 0x5A, 0xD1, 0x38, 0x1C, 0x00, 0xF0, 0xD2, 0xFC, 0x00, 0x06, 0x00, 0x28
    .byte 0x00, 0xD0, 0xB5, 0xE0, 0x21, 0x78, 0xB8, 0x6B, 0xC9, 0x00, 0x40, 0x18, 0xF9, 0x6B, 0x52, 0x46
    .byte 0xFF, 0xF7, 0xE8, 0xFA, 0x00, 0x06, 0x00, 0x28, 0x56, 0xD0, 0x40, 0x46, 0x6A, 0xF0, 0x4E, 0xFB
    .byte 0x01, 0x1C, 0x40, 0x46, 0x6A, 0xF0, 0x52, 0xFB, 0xFF, 0xF7, 0xA4, 0xFC, 0x06, 0x1C, 0x16, 0xAC
    .byte 0x00, 0x23, 0xE1, 0x5E, 0x25, 0x1C, 0x02, 0x22, 0xA8, 0x5E, 0x28, 0x9B, 0xC0, 0x1A, 0x27, 0x9C
    .byte 0x09, 0x1B, 0x00, 0x29, 0x00, 0xDA, 0x49, 0x42, 0x00, 0x28, 0x00, 0xDA, 0x40, 0x42, 0x08, 0x18
    .byte 0xC1, 0x0F, 0x40, 0x18, 0x40, 0x10, 0x00, 0x04, 0x31, 0x1C, 0x9C, 0xF0, 0x65, 0xFF, 0x23, 0xAB
    .byte 0x18, 0x60, 0xB4, 0x22, 0x22, 0xA8, 0x02, 0x60, 0x19, 0x68, 0x8A, 0x42, 0x00, 0xD9, 0x18, 0x1C
    .byte 0x00, 0x68, 0x77, 0xF0, 0xB9, 0xFB, 0x26, 0x99, 0x08, 0x80, 0x38, 0x1C, 0x20, 0x30, 0x04, 0x78
    .byte 0x02, 0xA8, 0x77, 0xF0, 0x0B, 0xFD, 0x16, 0xA8, 0x00, 0x23, 0xC2, 0x5E, 0x02, 0x21, 0x6B, 0x5E
    .byte 0x02, 0xAD, 0x00, 0x95, 0x01, 0x94, 0x27, 0x98, 0x28, 0x99, 0x77, 0xF0, 0x01, 0xFE, 0x02, 0x1C
    .byte 0x38, 0x1C, 0x01, 0x21, 0x33, 0x1C, 0x00, 0xF0, 0x9B, 0xF8, 0x61, 0xE0, 0x01, 0x38, 0x26, 0x9E
    .byte 0x30, 0x80, 0x5D, 0xE0, 0x41, 0x46, 0x08, 0x8C, 0x00, 0x28, 0x09, 0xD1, 0x38, 0x1C, 0x00, 0xF0
    .byte 0x6F, 0xFC, 0x00, 0x06, 0x00, 0x28, 0x53, 0xD1, 0x38, 0x1C, 0x00, 0xF0, 0x35, 0xF9, 0x4F, 0xE0
    .byte 0x01, 0x38, 0x42, 0x46, 0x10, 0x84, 0x4B, 0xE0, 0x0A, 0x23, 0xF9, 0x5E, 0xB4, 0x20, 0x40, 0x00
    .byte 0x81, 0x42, 0x2A, 0xD1, 0xF8, 0x69, 0x00, 0x28, 0x07, 0xDB, 0x80, 0x23, 0x1B, 0x02, 0x38, 0x1C
    .byte 0x01, 0x21, 0x01, 0x22, 0x00, 0xF0, 0x74, 0xF8, 0x3A, 0xE0, 0x0E, 0x24, 0x39, 0x5F, 0x08, 0x20
    .byte 0x40, 0x42, 0x81, 0x42, 0x34, 0xDC, 0x40, 0x46, 0x6A, 0xF0, 0x58, 0xFB, 0x24, 0xA9, 0x40, 0x46
    .byte 0x6A, 0xF0, 0x8A, 0xFB, 0x38, 0x1C, 0x30, 0x30, 0x01, 0x78, 0x02, 0xA8, 0x6A, 0xF0, 0xA2, 0xFB
    .byte 0x38, 0x1C, 0x02, 0xA9, 0xFE, 0xF7, 0x2A, 0xF8, 0x38, 0x1C, 0x20, 0x30, 0x02, 0x78, 0x38, 0x1C
    .byte 0x00, 0x21, 0x00, 0x23, 0x00, 0xF0, 0x54, 0xF8, 0x1A, 0xE0, 0xBA, 0x69, 0x00, 0x23, 0x05, 0x48
    .byte 0x81, 0x42, 0x00, 0xDC, 0x01, 0x23, 0x18, 0x1C, 0x00, 0x28, 0x05, 0xD0, 0x00, 0x2A, 0x05, 0xDD
    .byte 0x0E, 0xE0, 0x00, 0x00, 0x67, 0x01, 0x00, 0x00, 0x00, 0x2A, 0x09, 0xDB, 0x02, 0x22, 0x00, 0x28
    .byte 0x00, 0xD0, 0x03, 0x22, 0x80, 0x23, 0x1B, 0x02, 0x38, 0x1C, 0x01, 0x21, 0x00, 0xF0, 0x38, 0xF8
    .byte 0x3C, 0x1C, 0x42, 0x34, 0x20, 0x78, 0x00, 0x28, 0x0E, 0xD0, 0x38, 0x1C, 0x40, 0x30, 0x01, 0x78
    .byte 0x38, 0x1C, 0x00, 0xF0, 0x91, 0xF8, 0x01, 0x1C, 0x78, 0x8C, 0x88, 0x42, 0x02, 0xD0, 0x38, 0x1C
    .byte 0xFE, 0xF7, 0x3E, 0xF8, 0x00, 0x20, 0x20, 0x70, 0xF9, 0x69, 0x00, 0x29, 0x02, 0xD0, 0xF8, 0x68
    .byte 0x40, 0x18, 0xF8, 0x60, 0xB9, 0x69, 0x00, 0x29, 0x02, 0xD0, 0xB8, 0x68, 0x40, 0x18, 0xB8, 0x60
    .byte 0xB8, 0x8C, 0x00, 0x28, 0x01, 0xD0, 0x01, 0x38, 0x00, 0xE0, 0xF8, 0x8C, 0xB8, 0x84, 0x3C, 0x69
    .byte 0x00, 0x2C, 0x04, 0xD0, 0x60, 0x68, 0xC1, 0x68, 0x20, 0x1C, 0x9F, 0xF0, 0xD1, 0xFB, 0x2B, 0xB0
    .byte 0x38, 0xBC, 0x98, 0x46, 0xA1, 0x46, 0xAA, 0x46, 0xF0, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00

    thumb_func_start func_08034180
func_08034180: @ 0x08034180
    push {r4, r5, r6, r7, lr}
    adds r4, r0, #0
    adds r7, r1, #0
    adds r5, r2, #0
    adds r6, r3, #0
    bl func_08034248
    adds r1, r0, #0
    ldrh r0, [r4, #0x22]
    cmp r0, r1
    beq .L0803419C
    adds r0, r4, #0
    bl SetAnim__12AActorEntityUi
.L0803419C:
    adds r0, r4, #0
    adds r0, #0x20
    ldrb r0, [r0]
    cmp r0, r5
    beq .L080341AE
    adds r0, r4, #0
    adds r1, r5, #0
    bl SetAnimFacing__12AActorEntityUi
.L080341AE:
    adds r0, r4, #0
    adds r0, #0x42
    movs r1, #0
    strb r1, [r0]
    cmp r7, #1
    beq .L080341D0
    cmp r7, #1
    bgt .L080341C4
    cmp r7, #0
    beq .L080341C8
    b .L0803420A
.L080341C4:
    cmp r7, #4
    bgt .L0803420A
.L080341C8:
    movs r0, #0
    str r0, [r4, #0x18]
    str r0, [r4, #0x1c]
    b .L0803420A
.L080341D0:
    adds r0, r6, #0
    cmp r6, #0
    bge .L080341D8
    rsbs r0, r6, #0
.L080341D8:
    adds r6, r0, #0
    cmp r5, #1
    beq .L080341F8
    cmp r5, #1
    bgt .L080341E8
    cmp r5, #0
    beq .L080341F2
    b .L0803420A
.L080341E8:
    cmp r5, #2
    beq .L08034200
    cmp r5, #3
    beq .L08034206
    b .L0803420A
.L080341F2:
    str r6, [r4, #0x1c]
    str r1, [r4, #0x18]
    b .L0803420A
.L080341F8:
    rsbs r0, r6, #0
    str r0, [r4, #0x1c]
    str r1, [r4, #0x18]
    b .L0803420A
.L08034200:
    rsbs r0, r6, #0
    str r0, [r4, #0x18]
    b .L08034208
.L08034206:
    str r6, [r4, #0x18]
.L08034208:
    str r1, [r4, #0x1c]
.L0803420A:
    adds r0, r4, #0
    adds r0, #0x40
    adds r5, r0, #0
    ldrb r0, [r5]
    cmp r7, r0
    beq .L0803423E
    movs r1, #1
    rsbs r1, r1, #0
    cmp r7, #2
    beq .L08034224
    cmp r7, #3
    beq .L08034228
    b .L0803422A
.L08034224:
    movs r1, #8
    b .L0803422E
.L08034228:
    movs r1, #5
.L0803422A:
    cmp r1, #0
    blt .L08034238
.L0803422E:
    adds r0, r4, #0
    movs r2, #1
    bl func_08032384
    b .L0803423E
.L08034238:
    adds r0, r4, #0
    bl func_080323C8
.L0803423E:
    strb r7, [r5]
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0

    thumb_func_start func_08034248
func_08034248: @ 0x08034248
    ldr r3, .L0803425C @ =gUnk_080F1450
    adds r0, #0x30
    ldrb r2, [r0]
    lsls r0, r2, #2
    adds r0, r0, r2
    adds r0, r0, r1
    lsls r0, r0, #1
    adds r0, r0, r3
    ldrh r0, [r0]
    bx lr
    .align 2, 0
.L0803425C: .4byte gUnk_080F1450

    thumb_func_start func_08034260
func_08034260: @ 0x08034260
    push {r4, r5, r6, r7, lr}
    sub sp, #0x1c
    adds r6, r0, #0
    adds r7, r6, #0
    adds r7, #0x41
    ldrb r0, [r7]
    cmp r0, #0
    beq .L08034274
    movs r0, #0
    b .L080342CA
.L08034274:
    ldr r5, [r6]
    add r4, sp, #0x10
    adds r0, r4, #0
    adds r1, r6, #0
    bl GetLocation__C7AEntity
    ldr r0, [r6, #0x34]
    bl GetCurrentTask__C13HarvestSprite
    ldr r1, [r6, #0x3c]
    str r0, [sp]
    ldr r0, [r6, #0x38]
    str r0, [sp, #4]
    add r0, sp, #8
    adds r2, r5, #0
    adds r3, r4, #0
    bl func_080330F4
    add r0, sp, #8
    ldrb r0, [r0]
    lsls r0, r0, #0x1c
    cmp r0, #0
    bne .L080342AA
    movs r0, #1
    strb r0, [r7]
    movs r0, #0
    b .L080342CA
.L080342AA:
    ldr r0, [r6, #0x38]
    adds r1, r6, #0
    adds r1, #0x30
    ldrb r1, [r1]
    add r2, sp, #8
    bl func_0809E988
    ldr r1, .L080342D4 @ =0xFFFF0000
    ldr r0, [sp, #0x18]
    ands r0, r1
    str r0, [sp, #0x18]
    ldr r0, [r6, #0x34]
    add r1, sp, #0x18
    bl method_0809E7E4__13HarvestSpritePC15UnkBarnAnimal2C
    movs r0, #1
.L080342CA:
    add sp, #0x1c
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    .align 2, 0
.L080342D4: .4byte 0xFFFF0000

    thumb_func_start func_080342D8
func_080342D8: @ 0x080342D8
    push {r4, r5, lr}
    sub sp, #4
    adds r5, r0, #0
    ldr r0, [r5, #0x34]
    bl GetFriendship__C3Npc
    bl func_080338F0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L080342FA
    adds r0, r5, #0
    bl func_08034260
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08034356
.L080342FA:
    movs r0, #0xb4
    bl func_080AB788
    lsls r0, r0, #0x10
    lsrs r0, r0, #0x10
    ldr r2, .L08034360 @ =0xFFFF0000
    ldr r1, [sp]
    ands r1, r2
    orrs r1, r0
    ldr r0, .L08034364 @ =0xFF00FFFF
    ands r1, r0
    str r1, [sp]
    ldr r4, [r5, #0x34]
    adds r0, r4, #0
    bl GetCurrentTask__C13HarvestSprite
    adds r1, r0, #0
    adds r0, r4, #0
    bl GetTaskExp__C13HarvestSpriteQ213HarvestSprite4Task
    adds r1, r0, #0
    movs r0, #0x80
    lsls r0, r0, #1
    subs r0, r0, r1
    bl func_080AB788
    lsrs r0, r0, #6
    adds r0, #2
    lsls r0, r0, #0x18
    ldr r2, .L08034368 @ =0x00FFFFFF
    ldr r1, [sp]
    ands r1, r2
    orrs r1, r0
    str r1, [sp]
    ldr r0, [r5, #0x34]
    mov r1, sp
    bl method_0809E7D8__13HarvestSpritePC15UnkBarnAnimal2C
    adds r0, r5, #0
    adds r0, #0x20
    ldrb r2, [r0]
    adds r0, r5, #0
    movs r1, #0
    movs r3, #0
    bl func_08034180
.L08034356:
    add sp, #4
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L08034360: .4byte 0xFFFF0000
.L08034364: .4byte 0xFF00FFFF
.L08034368: .4byte 0x00FFFFFF

    thumb_func_start func_0803436C
func_0803436C: @ 0x0803436C
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #0x2c
    str r0, [sp, #0x24]
    ldr r0, [r0]
    str r0, [sp, #0x28]
    ldr r3, [sp, #0x24]
    adds r3, #0x30
    ldrb r1, [r3]
    ldr r2, [sp, #0x24]
    ldr r0, [r2, #0x38]
    lsls r1, r1, #3
    mov r2, sp
    adds r1, r0, r1
    ldm r1!, {r4, r5}
    stm r2!, {r4, r5}
    ldrb r1, [r3]
    bl func_0809E994
    ldr r0, [sp, #0x24]
    ldr r1, [r0, #0x3c]
    mov r0, sp
    ldr r2, [sp, #0x28]
    bl func_08033584
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L080343AC
    b .L080348FA
.L080343AC:
    ldr r1, [sp, #0x24]
    ldr r5, [r1, #0x10]
    cmp r5, #0
    beq .L0803441A
    ldr r2, [r1, #0x3c]
    add r4, sp, #0x18
    adds r0, r4, #0
    mov r1, sp
    ldr r3, [sp, #0x28]
    bl func_08033830
    mov r0, sp
    ldrb r0, [r0]
    lsls r0, r0, #0x1c
    lsrs r0, r0, #0x1c
    cmp r0, #4
    beq .L080343E4
    cmp r0, #4
    bgt .L080343D8
    cmp r0, #3
    beq .L080343DE
    b .L08034404
.L080343D8:
    cmp r0, #5
    beq .L080343FE
    b .L08034404
.L080343DE:
    ldrh r0, [r4, #2]
    subs r0, #0x18
    b .L08034402
.L080343E4:
    movs r0, #2
    ldrsh r2, [r4, r0]
    mov r0, sp
    ldrb r0, [r0, #1]
    movs r1, #7
    ands r0, r1
    adds r1, r2, #0
    adds r1, #0x18
    cmp r0, #3
    bhi .L080343FA
    subs r1, #0x38
.L080343FA:
    strh r1, [r4, #2]
    b .L08034404
.L080343FE:
    ldrh r0, [r4, #2]
    subs r0, #0x28
.L08034402:
    strh r0, [r4, #2]
.L08034404:
    ldr r0, [sp, #0x24]
    adds r0, #0x30
    ldrb r1, [r0]
    movs r0, #0
    ldrsh r2, [r4, r0]
    add r0, sp, #0x18
    movs r4, #2
    ldrsh r3, [r0, r4]
    adds r0, r5, #0
    bl func_08034BFC
.L0803441A:
    mov r0, sp
    ldrb r0, [r0]
    lsls r0, r0, #0x1c
    lsrs r0, r0, #0x1c
    cmp r0, #8
    bls .L08034428
    b .L080348FA
.L08034428:
    lsls r0, r0, #2
    ldr r1, .L08034434 @ =.L08034438
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L08034434: .4byte .L08034438
.L08034438: @ jump table
    .4byte .L080348FA @ case 0
    .4byte .L0803445C @ case 1
    .4byte .L080344E4 @ case 2
    .4byte .L080345EA @ case 3
    .4byte .L08034616 @ case 4
    .4byte .L08034644 @ case 5
    .4byte .L08034680 @ case 6
    .4byte .L080347EC @ case 7
    .4byte .L08034834 @ case 8
.L0803445C:
    ldr r5, [sp, #0x28]
    ldr r5, [r5]
    mov sb, r5
    movs r0, #0xd8
    add sb, r0
    ldr r1, [sp, #0x24]
    movs r2, #0xa
    ldrsh r6, [r1, r2]
    movs r5, #0xe
    ldrsh r4, [r1, r5]
    mov r8, r4
    add r4, sp, #8
    movs r2, #2
    ldrh r1, [r4]
    ldr r3, .L080344E0 @ =0xFFFFFC00
    adds r0, r3, #0
    ands r0, r1
    orrs r0, r2
    strh r0, [r4]
    lsls r6, r6, #0x10
    lsrs r1, r6, #0x10
    movs r0, #0x3f
    mov sl, r0
    ands r1, r0
    lsls r1, r1, #2
    ldrb r5, [r4, #1]
    movs r2, #3
    adds r0, r2, #0
    ands r0, r5
    orrs r0, r1
    strb r0, [r4, #1]
    lsrs r6, r6, #0x16
    ldrh r1, [r4, #2]
    adds r0, r3, #0
    ands r0, r1
    orrs r0, r6
    strh r0, [r4, #2]
    mov r1, r8
    lsls r1, r1, #0x10
    mov r8, r1
    lsrs r0, r1, #0x10
    mov r5, sl
    ands r0, r5
    lsls r0, r0, #2
    ldrb r1, [r4, #3]
    ands r2, r1
    orrs r2, r0
    strb r2, [r4, #3]
    mov r0, r8
    lsrs r0, r0, #0x16
    mov r8, r0
    ldrh r0, [r4, #4]
    ands r3, r0
    mov r1, r8
    orrs r3, r1
    strh r3, [r4, #4]
    mov r5, sb
    ldr r2, [r5]
    ldr r0, [sp, #0x28]
    adds r1, r4, #0
    bl _call_via_r2
    movs r6, #1
    mov r8, r4
    b .L080348FE
    .align 2, 0
.L080344E0: .4byte 0xFFFFFC00
.L080344E4:
    add r0, sp, #8
    mov sb, r0
    bl __12RucksackItem
    ldr r1, [sp, #0x28]
    ldr r1, [r1]
    mov r8, r1
    movs r2, #0xe0
    add r8, r2
    ldr r4, [sp, #0x24]
    movs r0, #0xa
    ldrsh r5, [r4, r0]
    movs r1, #0xe
    ldrsh r6, [r4, r1]
    add r7, sp, #0x10
    movs r2, #2
    ldrh r1, [r7]
    ldr r3, .L08034580 @ =0xFFFFFC00
    adds r0, r3, #0
    ands r0, r1
    orrs r0, r2
    strh r0, [r7]
    lsls r5, r5, #0x10
    lsrs r1, r5, #0x10
    movs r2, #0x3f
    mov sl, r2
    ands r1, r2
    lsls r1, r1, #2
    ldrb r4, [r7, #1]
    movs r2, #3
    adds r0, r2, #0
    ands r0, r4
    orrs r0, r1
    strb r0, [r7, #1]
    lsrs r5, r5, #0x16
    ldrh r1, [r7, #2]
    adds r0, r3, #0
    ands r0, r1
    orrs r0, r5
    strh r0, [r7, #2]
    lsls r6, r6, #0x10
    lsrs r0, r6, #0x10
    mov r4, sl
    ands r0, r4
    lsls r0, r0, #2
    ldrb r1, [r7, #3]
    ands r2, r1
    orrs r2, r0
    strb r2, [r7, #3]
    lsrs r6, r6, #0x16
    ldrh r0, [r7, #4]
    ands r3, r0
    orrs r3, r6
    strh r3, [r7, #4]
    mov r5, r8
    ldr r3, [r5]
    ldr r0, [sp, #0x28]
    adds r1, r7, #0
    mov r2, sb
    bl _call_via_r3
    mov r0, sb
    bl IsEmpty__C12RucksackItem
    lsls r0, r0, #0x18
    mov r8, sb
    cmp r0, #0
    beq .L0803456E
    b .L080348FA
.L0803456E:
    mov r0, r8
    bl GetKind__C12RucksackItem
    cmp r0, #0
    beq .L08034584
    cmp r0, #1
    beq .L080345C0
    b .L080348FA
    .align 2, 0
.L08034580: .4byte 0xFFFFFC00
.L08034584:
    ldr r0, [sp, #0x28]
    ldr r4, [r0]
    movs r1, #0xae
    lsls r1, r1, #1
    adds r4, r4, r1
    add r5, sp, #0x1c
    adds r0, r7, #0
    mov r1, r8
    bl GetFood__C12RucksackItem
    ldrb r1, [r7]
    mov r0, sp
    adds r0, #0x11
    ldrb r0, [r0]
    lsls r0, r0, #8
    orrs r0, r1
    mov r1, sp
    adds r1, #0x12
    ldrb r1, [r1]
    lsls r1, r1, #0x10
    orrs r1, r0
    adds r0, r5, #0
    bl __7ProductG4Food
    ldr r2, [r4]
    ldr r0, [sp, #0x28]
    adds r1, r5, #0
    bl _call_via_r2
    b .L080345E6
.L080345C0:
    ldr r2, [sp, #0x28]
    ldr r4, [r2]
    movs r5, #0xae
    lsls r5, r5, #1
    adds r4, r4, r5
    mov r5, sp
    adds r5, #0x1d
    mov r0, r8
    bl GetArticle__C12RucksackItem
    adds r1, r0, #0
    adds r0, r5, #0
    bl __7ProductG7Article
    ldr r2, [r4]
    ldr r0, [sp, #0x28]
    adds r1, r5, #0
    bl _call_via_r2
.L080345E6:
    movs r6, #0
    b .L080348FE
.L080345EA:
    ldr r1, [sp, #0x24]
    ldr r0, [r1, #0x3c]
    movs r4, #0xff
    lsls r4, r4, #2
    adds r0, r0, r4
    movs r1, #1
    bl SubtractStoredBushels__4CoopUi
    ldr r2, [sp, #0x24]
    ldr r0, [r2, #0x3c]
    adds r0, r0, r4
    mov r1, sp
    ldrb r1, [r1, #1]
    bl SetEntBushel__4CoopUi
    ldr r4, [sp, #0x28]
    ldr r0, [r4]
    adds r0, #0xa0
    mov r1, sp
    ldrb r1, [r1, #1]
    ldr r2, [r0]
    b .L0803466E
.L08034616:
    ldr r1, [sp, #0x24]
    ldr r0, [r1, #0x3c]
    ldr r4, .L08034640 @ =0x000005DC
    adds r0, r0, r4
    movs r1, #1
    bl SubtractStoredBushels__4BarnUi
    ldr r2, [sp, #0x24]
    ldr r0, [r2, #0x3c]
    adds r0, r0, r4
    mov r1, sp
    ldrb r1, [r1, #1]
    bl SetBushelForStall__4BarnUi
    ldr r4, [sp, #0x28]
    ldr r0, [r4]
    adds r0, #0x9c
    mov r1, sp
    ldrb r1, [r1, #1]
    ldr r2, [r0]
    b .L0803466E
    .align 2, 0
.L08034640: .4byte 0x000005DC
.L08034644:
    ldr r1, [sp, #0x24]
    ldr r0, [r1, #0x3c]
    ldr r4, .L0803467C @ =0x000005DC
    adds r0, r0, r4
    movs r1, #1
    bl SubtractStoredBushels__4BarnUi
    ldr r2, [sp, #0x24]
    ldr r0, [r2, #0x3c]
    adds r0, r0, r4
    mov r1, sp
    ldrb r1, [r1, #1]
    bl SetBushelForPregnancyStall__4BarnUi
    ldr r4, [sp, #0x28]
    ldr r2, [r4]
    adds r2, #0x9c
    mov r0, sp
    ldrb r1, [r0, #1]
    adds r1, #0x10
    ldr r2, [r2]
.L0803466E:
    adds r0, r4, #0
    bl _call_via_r2
    movs r6, #2
    add r5, sp, #8
    mov r8, r5
    b .L080348FE
    .align 2, 0
.L0803467C: .4byte 0x000005DC
.L08034680:
    mov r0, sp
    ldrb r1, [r0, #1]
    adds r1, #0x36
    ldr r2, [sp, #0x28]
    ldr r0, [r2]
    ldr r2, [r0, #0x40]
    ldr r0, [sp, #0x28]
    bl _call_via_r2
    adds r7, r0, #0
    cmp r7, #0
    bne .L0803469A
    b .L080348FA
.L0803469A:
    ldr r0, [r7, #0x14]
    ldr r1, [r0, #0x50]
    adds r0, r7, #0
    bl _call_via_r1
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L080346B4
    ldr r0, [r7, #0x14]
    ldr r1, [r0, #0x70]
    adds r0, r7, #0
    bl _call_via_r1
.L080346B4:
    ldr r0, [r7, #0x14]
    ldr r1, [r0, #0x54]
    adds r0, r7, #0
    bl _call_via_r1
    lsls r0, r0, #0x18
    add r4, sp, #8
    mov r8, r4
    cmp r0, #0
    beq .L08034754
    ldr r0, [r7, #0x14]
    ldr r1, [r0, #0x74]
    adds r0, r7, #0
    bl _call_via_r1
    movs r1, #0x1c
    cmp r0, #5
    bhi .L08034716
    lsls r0, r0, #2
    ldr r1, .L080346E4 @ =.L080346E8
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L080346E4: .4byte .L080346E8
.L080346E8: @ jump table
    .4byte .L08034700 @ case 0
    .4byte .L08034704 @ case 1
    .4byte .L08034708 @ case 2
    .4byte .L0803470C @ case 3
    .4byte .L08034710 @ case 4
    .4byte .L08034714 @ case 5
.L08034700:
    movs r1, #0x1c
    b .L08034716
.L08034704:
    movs r1, #0x1d
    b .L08034716
.L08034708:
    movs r1, #0x1e
    b .L08034716
.L0803470C:
    movs r1, #0x1f
    b .L08034716
.L08034710:
    movs r1, #0x20
    b .L08034716
.L08034714:
    movs r1, #0x21
.L08034716:
    ldr r5, [sp, #0x28]
    ldr r4, [r5]
    movs r0, #0xae
    lsls r0, r0, #1
    adds r4, r4, r0
    mov r6, sp
    adds r6, #0x1e
    add r5, sp, #8
    adds r0, r5, #0
    bl __4FoodUi
    ldrb r1, [r5]
    mov r0, sp
    adds r0, #9
    ldrb r0, [r0]
    lsls r0, r0, #8
    orrs r0, r1
    mov r1, sp
    adds r1, #0xa
    ldrb r1, [r1]
    lsls r1, r1, #0x10
    orrs r1, r0
    adds r0, r6, #0
    bl __7ProductG4Food
    ldr r2, [r4]
    ldr r0, [sp, #0x28]
    adds r1, r6, #0
    bl _call_via_r2
    mov r8, r5
.L08034754:
    ldr r0, [r7, #0x14]
    ldr r1, [r0, #0x58]
    adds r0, r7, #0
    bl _call_via_r1
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L080347DA
    ldr r0, [r7, #0x14]
    ldr r1, [r0, #0x78]
    adds r0, r7, #0
    bl _call_via_r1
    movs r1, #5
    cmp r0, #5
    bhi .L080347B2
    lsls r0, r0, #2
    ldr r1, .L08034780 @ =.L08034784
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L08034780: .4byte .L08034784
.L08034784: @ jump table
    .4byte .L0803479C @ case 0
    .4byte .L080347A0 @ case 1
    .4byte .L080347A4 @ case 2
    .4byte .L080347A8 @ case 3
    .4byte .L080347AC @ case 4
    .4byte .L080347B0 @ case 5
.L0803479C:
    movs r1, #5
    b .L080347B2
.L080347A0:
    movs r1, #6
    b .L080347B2
.L080347A4:
    movs r1, #7
    b .L080347B2
.L080347A8:
    movs r1, #8
    b .L080347B2
.L080347AC:
    movs r1, #9
    b .L080347B2
.L080347B0:
    movs r1, #0xa
.L080347B2:
    ldr r2, [sp, #0x28]
    ldr r5, [r2]
    movs r4, #0xae
    lsls r4, r4, #1
    adds r5, r5, r4
    mov r6, sp
    adds r6, #0x1f
    add r4, sp, #0x20
    adds r0, r4, #0
    bl __7ArticleUi
    ldrb r1, [r4]
    adds r0, r6, #0
    bl __7ProductG7Article
    ldr r2, [r5]
    ldr r0, [sp, #0x28]
    adds r1, r6, #0
    bl _call_via_r2
.L080347DA:
    ldr r0, [r7, #0x14]
    adds r0, #0x88
    ldr r2, [r0]
    adds r0, r7, #0
    movs r1, #0x3c
    bl _call_via_r2
    movs r6, #2
    b .L080348FE
.L080347EC:
    mov r0, sp
    ldrb r1, [r0, #1]
    adds r1, #0x2e
    ldr r5, [sp, #0x28]
    ldr r0, [r5]
    ldr r2, [r0, #0x40]
    adds r0, r5, #0
    bl _call_via_r2
    adds r4, r0, #0
    cmp r4, #0
    beq .L080348FA
    ldr r0, [r4, #0x14]
    ldr r1, [r0, #0x50]
    adds r0, r4, #0
    bl _call_via_r1
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0803481E
    ldr r0, [r4, #0x14]
    ldr r1, [r0, #0x70]
    adds r0, r4, #0
    bl _call_via_r1
.L0803481E:
    ldr r0, [r4, #0x14]
    adds r0, #0x88
    ldr r2, [r0]
    adds r0, r4, #0
    movs r1, #0x3c
    bl _call_via_r2
    movs r6, #2
    add r0, sp, #8
    mov r8, r0
    b .L080348FE
.L08034834:
    mov r0, sp
    ldrb r1, [r0, #1]
    adds r4, r1, #0
    adds r4, #0x4c
    ldr r2, [sp, #0x24]
    ldr r0, [r2, #0x3c]
    movs r5, #0xff
    lsls r5, r5, #2
    adds r0, r0, r5
    bl GetEgg__C4CoopUi
    cmp r0, #0
    beq .L080348FA
    ldrb r0, [r0, #6]
    lsls r0, r0, #0x1d
    lsrs r0, r0, #0x1d
    movs r7, #0xf
    cmp r0, #5
    bhi .L08034896
    lsls r0, r0, #2
    ldr r1, .L08034864 @ =.L08034868
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L08034864: .4byte .L08034868
.L08034868: @ jump table
    .4byte .L08034880 @ case 0
    .4byte .L08034884 @ case 1
    .4byte .L08034888 @ case 2
    .4byte .L0803488C @ case 3
    .4byte .L08034890 @ case 4
    .4byte .L08034894 @ case 5
.L08034880:
    movs r7, #0xf
    b .L08034896
.L08034884:
    movs r7, #0x10
    b .L08034896
.L08034888:
    movs r7, #0x11
    b .L08034896
.L0803488C:
    movs r7, #0x12
    b .L08034896
.L08034890:
    movs r7, #0x13
    b .L08034896
.L08034894:
    movs r7, #0x14
.L08034896:
    ldr r1, [sp, #0x24]
    ldr r0, [r1]
    ldr r1, [r0]
    ldr r2, [r1, #0x3c]
    adds r1, r4, #0
    bl _call_via_r2
    ldr r2, [sp, #0x24]
    ldr r0, [r2, #0x3c]
    movs r4, #0xff
    lsls r4, r4, #2
    adds r0, r0, r4
    mov r1, sp
    ldrb r1, [r1, #1]
    bl method_0800C9B8__4CoopUi
    ldr r5, [sp, #0x28]
    ldr r4, [r5]
    movs r0, #0xae
    lsls r0, r0, #1
    adds r4, r4, r0
    mov r6, sp
    adds r6, #0x21
    add r5, sp, #8
    adds r0, r5, #0
    adds r1, r7, #0
    bl __4FoodUi
    ldrb r1, [r5]
    mov r0, sp
    adds r0, #9
    ldrb r0, [r0]
    lsls r0, r0, #8
    orrs r0, r1
    mov r1, sp
    adds r1, #0xa
    ldrb r1, [r1]
    lsls r1, r1, #0x10
    orrs r1, r0
    adds r0, r6, #0
    bl __7ProductG4Food
    ldr r2, [r4]
    ldr r0, [sp, #0x28]
    adds r1, r6, #0
    bl _call_via_r2
    movs r6, #2
    mov r8, r5
    b .L080348FE
.L080348FA:
    movs r0, #0
    b .L0803492A
.L080348FE:
    ldr r1, .L0803493C @ =gUnk_080F1496
    mov r0, r8
    movs r2, #3
    bl memcpy
    cmp r6, #3
    beq .L08034928
    movs r0, #0xc8
    bl func_080AB788
    mov r2, r8
    adds r1, r2, r6
    ldrb r1, [r1]
    cmp r0, r1
    bhs .L08034928
    ldr r4, [sp, #0x24]
    ldr r0, [r4, #0x34]
    adds r1, r6, #0
    movs r2, #1
    bl AddTaskExp__13HarvestSpriteQ213HarvestSprite4Taski
.L08034928:
    movs r0, #1
.L0803492A:
    add sp, #0x2c
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    .align 2, 0
.L0803493C: .4byte gUnk_080F1496

    thumb_func_start func_08034940
func_08034940: @ 0x08034940
    push {r4, r5, lr}
    sub sp, #0xc
    adds r5, r0, #0
    ldr r0, [r5]
    ldr r1, [r0]
    movs r2, #0xa2
    lsls r2, r2, #1
    adds r1, r1, r2
    ldr r1, [r1]
    bl _call_via_r1
    ldrh r2, [r0, #0xa]
    lsls r0, r2, #0x1b
    lsrs r0, r0, #0x1b
    cmp r0, #5
    bls .L0803497C
    subs r0, #6
    lsls r1, r0, #4
    subs r1, r1, r0
    lsls r1, r1, #2
    lsls r0, r2, #0x15
    lsrs r0, r0, #0x1a
    adds r1, r1, r0
    adds r0, r5, #0
    adds r0, #0x30
    ldrb r0, [r0]
    ldr r2, .L080349A8 @ =0x00000385
    adds r0, r0, r2
    cmp r1, r0
    blo .L08034A08
.L0803497C:
    ldrh r0, [r5, #4]
    cmp r0, #0x11
    beq .L080349AC
    cmp r0, #0x11
    ble .L080349C4
    cmp r0, #0x25
    bne .L080349C4
    mov r4, sp
    mov r0, sp
    bl smethod_08009ADC__4Farm
    mov r0, sp
    movs r1, #0
    ldrsh r2, [r0, r1]
    movs r0, #2
    ldrsh r3, [r4, r0]
    adds r0, r5, #0
    movs r1, #2
    bl SetLocation__7AEntityUiii
    b .L080349C4
    .align 2, 0
.L080349A8: .4byte 0x00000385
.L080349AC:
    add r4, sp, #4
    adds r0, r4, #0
    bl smethod_08009AE8__4Farm
    movs r1, #0
    ldrsh r2, [r4, r1]
    movs r0, #2
    ldrsh r3, [r4, r0]
    adds r0, r5, #0
    movs r1, #2
    bl SetLocation__7AEntityUiii
.L080349C4:
    ldr r0, [r5, #0x38]
    adds r1, r5, #0
    adds r1, #0x30
    ldrb r1, [r1]
    bl func_0809E994
    ldr r0, [r5, #0x34]
    add r1, sp, #8
    bl method_0809E7FC__13HarvestSprite
    movs r2, #0xa
    ldrsh r1, [r5, r2]
    movs r0, #0xb4
    lsls r0, r0, #1
    cmp r1, r0
    bne .L080349E8
    movs r2, #1
    b .L080349F2
.L080349E8:
    ldr r0, .L08034A04 @ =0x00000167
    movs r2, #2
    cmp r1, r0
    bgt .L080349F2
    movs r2, #3
.L080349F2:
    movs r3, #0x80
    lsls r3, r3, #8
    adds r0, r5, #0
    movs r1, #1
    bl func_08034180
    movs r0, #1
    b .L08034A0A
    .align 2, 0
.L08034A04: .4byte 0x00000167
.L08034A08:
    movs r0, #0
.L08034A0A:
    add sp, #0xc
    pop {r4, r5}
    pop {r1}
    bx r1
    .align 2, 0

    thumb_func_start func_08034A14
func_08034A14: @ 0x08034A14
    push {r4, r5, r6, lr}
    mov r6, sb
    mov r5, r8
    push {r5, r6}
    sub sp, #0x10
    mov r8, r0
    adds r4, r1, #0
    ldr r0, .L08034A94 @ =gUnk_080F14B8
    mov sb, r0
    adds r5, r4, #0
    adds r5, #0x30
    ldrb r0, [r5]
    lsls r0, r0, #2
    add r0, sb
    ldr r3, [r0]
    movs r6, #0
    str r6, [sp]
    movs r0, #4
    str r0, [sp, #4]
    str r6, [sp, #8]
    add r0, sp, #0xc
    strb r6, [r0]
    mov r0, r8
    movs r2, #3
    bl func_080324BC
    ldr r0, .L08034A98 @ =vtable_unk_080E6904
    mov r1, r8
    str r0, [r1, #4]
    ldr r0, [r4]
    ldr r1, [r0]
    ldr r1, [r1, #0x68]
    bl _call_via_r1
    adds r1, r0, #0
    ldr r2, .L08034A9C @ =gUnk_080F14F0
    ldrb r5, [r5]
    lsls r0, r5, #1
    adds r0, r0, r2
    ldrh r2, [r0]
    ldr r3, [r4]
    lsls r5, r5, #2
    add r5, sb
    mov r0, r8
    adds r0, #0x8c
    movs r4, #2
    str r4, [sp]
    ldr r4, [r5]
    str r4, [sp, #4]
    add r4, sp, #8
    strb r6, [r4]
    bl func_080A4A00
    mov r0, r8
    adds r0, #0xd0
    strh r6, [r0]
    mov r0, r8
    add sp, #0x10
    pop {r3, r4}
    mov r8, r3
    mov sb, r4
    pop {r4, r5, r6}
    pop {r1}
    bx r1
    .align 2, 0
.L08034A94: .4byte gUnk_080F14B8
.L08034A98: .4byte vtable_unk_080E6904
.L08034A9C: .4byte gUnk_080F14F0
.L08034AA0:
    .byte 0x10, 0xB5, 0x04, 0x1C, 0xFD, 0xF7, 0xB2, 0xFD, 0x20, 0x1C, 0xD0, 0x30, 0x00, 0x88, 0x00, 0x28
    .byte 0x16, 0xD0, 0x21, 0x1C, 0xCB, 0x31, 0x08, 0x78, 0x00, 0x28, 0x0A, 0xD1, 0x20, 0x1C, 0xB4, 0x30
    .byte 0x29, 0xF0, 0x16, 0xFF, 0x80, 0x07, 0x00, 0x28, 0x05, 0xDA, 0x21, 0x1C, 0xC8, 0x31, 0x01, 0x20
    .byte 0x00, 0xE0, 0x00, 0x20, 0x08, 0x70, 0x21, 0x1C, 0xD0, 0x31, 0x08, 0x88, 0x01, 0x38, 0x08, 0x80
    .byte 0x10, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0xF0, 0xB5, 0x57, 0x46, 0x4E, 0x46, 0x45, 0x46
    .byte 0xE0, 0xB4, 0x8F, 0xB0, 0x05, 0x1C, 0x0C, 0x1C, 0xFD, 0xF7, 0xCA, 0xFD, 0x28, 0x1C, 0xD0, 0x30
    .byte 0x00, 0x88, 0x00, 0x28, 0x71, 0xD0, 0x0D, 0xAB, 0x20, 0x68, 0xA1, 0x68, 0x0D, 0x90, 0x59, 0x60
    .byte 0x28, 0x1C, 0xCC, 0x30, 0x00, 0x22, 0x81, 0x5E, 0x02, 0x30, 0x00, 0x26, 0x82, 0x5F, 0x0C, 0x26
    .byte 0xA0, 0x5F, 0x09, 0x1A, 0x89, 0x46, 0x0E, 0x21, 0x60, 0x5E, 0x10, 0x1A, 0x80, 0x46, 0x80, 0x20
    .byte 0x00, 0x02, 0x84, 0x1A, 0x2E, 0x1C, 0x8C, 0x36, 0x9A, 0x46, 0x28, 0x1C, 0xB4, 0x30, 0x01, 0x68
    .byte 0x0B, 0x68, 0x82, 0x89, 0x04, 0x30, 0x92, 0x00, 0x00, 0x68, 0x80, 0x18, 0x02, 0x88, 0x05, 0xA8
    .byte 0x1B, 0x69, 0x9E, 0xF0, 0xE1, 0xFE, 0x05, 0xAF, 0x52, 0x46, 0x53, 0x68, 0x32, 0x68, 0x28, 0x1C
    .byte 0x90, 0x30, 0x41, 0x68, 0x48, 0x42, 0x08, 0x43, 0x00, 0x28, 0x13, 0xDA, 0xB0, 0x89, 0x29, 0x1C
    .byte 0x9C, 0x31, 0x00, 0x94, 0x3C, 0x1C, 0x01, 0x94, 0x02, 0x92, 0x03, 0x90, 0x04, 0x91, 0x18, 0x1C
    .byte 0x49, 0x46, 0x42, 0x46, 0x55, 0x23, 0x02, 0x4C, 0x9E, 0xF0, 0xC8, 0xFE, 0x03, 0xE0, 0x00, 0x00
    .byte 0xDC, 0x04, 0x00, 0x03, 0x00, 0x20, 0x00, 0x28, 0x27, 0xD0, 0x30, 0x1C, 0x3C, 0x30, 0x01, 0x78
    .byte 0x05, 0x1C, 0x00, 0x29, 0x21, 0xD0, 0x50, 0x46, 0x01, 0x68, 0x3A, 0x1C, 0x08, 0x32, 0x30, 0x1C
    .byte 0x6F, 0xF0, 0x2C, 0xFE, 0x30, 0x1C, 0x3D, 0x30, 0x00, 0x78, 0x00, 0x28, 0x06, 0xD0, 0x39, 0x1C
    .byte 0x10, 0x31, 0x30, 0x1C, 0x01, 0x22, 0x6F, 0xF0, 0xBD, 0xFE, 0x0C, 0xE0, 0x34, 0x1C, 0x3E, 0x34
    .byte 0x20, 0x78, 0x00, 0x28, 0x07, 0xD1, 0x39, 0x1C, 0x10, 0x31, 0x30, 0x1C, 0x01, 0x22, 0x6F, 0xF0
    .byte 0xB1, 0xFE, 0x01, 0x20, 0x20, 0x70, 0x00, 0x20, 0x28, 0x70, 0x0F, 0xB0, 0x38, 0xBC, 0x98, 0x46
    .byte 0xA1, 0x46, 0xAA, 0x46, 0xF0, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00

    thumb_func_start func_08034BFC
func_08034BFC: @ 0x08034BFC
    push {r4, r5, r6, lr}
    adds r6, r0, #0
    adds r4, r2, #0
    adds r5, r3, #0
    ldr r0, .L08034C3C @ =gUnk_080F14F0
    lsls r1, r1, #1
    adds r1, r1, r0
    ldrh r1, [r1]
    adds r0, r6, #0
    adds r0, #0xb4
    bl func_0805E860
    adds r0, r6, #0
    adds r0, #0xc8
    movs r2, #0
    movs r1, #1
    strb r1, [r0]
    adds r0, #2
    strb r2, [r0]
    adds r0, #1
    strb r1, [r0]
    adds r0, #1
    strh r4, [r0]
    adds r0, #2
    strh r5, [r0]
    adds r1, r6, #0
    adds r1, #0xd0
    movs r0, #0x3c
    strh r0, [r1]
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L08034C3C: .4byte gUnk_080F14F0
.L08034C40:
    .byte 0x30, 0x30, 0x00, 0x78, 0x70, 0x47, 0x00, 0x00, 0x00, 0x69, 0x70, 0x47, 0x10, 0xB5, 0x0C, 0x1C
    .byte 0x13, 0x1C, 0x01, 0x1C, 0x30, 0x31, 0x09, 0x78, 0x22, 0x1C, 0xFE, 0xF7, 0x93, 0xFF, 0x10, 0xBC
    .byte 0x01, 0xBC, 0x00, 0x47

    @ 34c40:       3030            adds    r0, #48 @ 0x30
    @ 34c42:       7800            ldrb    r0, [r0, #0]
    @ 34c44:       4770            bx      lr
    @ 34c46:       0000            movs    r0, r0
    @ 34c48:       6900            ldr     r0, [r0, #16]
    @ 34c4a:       4770            bx      lr
    @ 34c4c:       b510            push    {r4, lr}
    @ 34c4e:       1c0c            adds    r4, r1, #0
    @ 34c50:       1c13            adds    r3, r2, #0
    @ 34c52:       1c01            adds    r1, r0, #0
    @ 34c54:       3130            adds    r1, #48 @ 0x30
    @ 34c56:       7809            ldrb    r1, [r1, #0]
    @ 34c58:       1c22            adds    r2, r4, #0
    @ 34c5a:       f7fe ff93       bl      func_08033B84
    @ 34c5e:       bc10            pop     {r4}
    @ 34c60:       bc01            pop     {r0}
    @ 34c62:       4700            bx      r0

    thumb_func_start func_08034C64
func_08034C64: @ 0x08034C64
    push {r4, r5, r6, lr}
    sub sp, #8
    adds r6, r1, #0
    ldr r4, .L08034CDC @ =gUnk_080F29C0
    ldr r1, [r4]
    bl _call_via_r1
    ldr r1, [r4, #8]
    lsls r0, r0, #2
    adds r0, r0, r1
    ldr r5, [r0]
    cmp r5, #0
    beq .L08034CE0
    ldrh r1, [r6]
    lsls r0, r1, #0x1b
    lsrs r0, r0, #0x1b
    subs r2, r0, #6
    cmp r2, #0
    bge .L08034C8C
    adds r2, #0x18
.L08034C8C:
    lsls r0, r2, #4
    subs r0, r0, r2
    lsls r0, r0, #2
    lsls r1, r1, #0x15
    lsrs r1, r1, #0x1a
    adds r0, r0, r1
    str r0, [sp, #4]
    ldr r4, [r5, #4]
    ldrh r1, [r5]
    lsls r1, r1, #3
    adds r1, r4, r1
    movs r0, #0
    str r0, [sp]
    adds r0, r4, #0
    add r2, sp, #4
    movs r3, #0
    bl func_080D7ECC
    subs r0, r0, r4
    asrs r0, r0, #3
    subs r0, #1
    ldrh r1, [r5]
    cmp r0, r1
    bhs .L08034CE0
    ldr r1, [r5, #4]
    lsls r0, r0, #3
    adds r0, r0, r1
    ldr r0, [r0, #4]
    cmp r0, #0
    beq .L08034CE0
    ldrh r1, [r0, #0xa]
    lsls r1, r1, #0x16
    lsrs r1, r1, #0x16
    movs r0, #0x1d
    eors r1, r0
    rsbs r0, r1, #0
    orrs r0, r1
    lsrs r0, r0, #0x1f
    b .L08034CE2
    .align 2, 0
.L08034CDC: .4byte gUnk_080F29C0
.L08034CE0:
    movs r0, #0
.L08034CE2:
    add sp, #8
    pop {r4, r5, r6}
    pop {r1}
    bx r1
    .align 2, 0
