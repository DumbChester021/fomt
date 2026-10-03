
	.INCLUDE "asm/macro.inc"
	.SYNTAX UNIFIED

	.section ".text.code_080D3BC0"

	thumb_func_start func_080D3BC0
func_080D3BC0: @ 0x080D3BC0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, .L080D3BD0 @ =gUnk_03000CD4
.L080D3BC6:
	ldr r0, [r5]
	cmp r0, #0
	bne .L080D3BD4
.L080D3BCC:
	b .L080D3BCC
	.align 2, 0
.L080D3BD0: .4byte gUnk_03000CD4
.L080D3BD4:
	bl _call_via_r0
	adds r0, r4, #0
	bl malloc
	cmp r0, #0
	beq .L080D3BC6
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start func_080D3BE8
func_080D3BE8: @ 0x080D3BE8
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #4
	bl __builtin_new
	bl func_08004C48
	str r0, [sp]
	mov r1, sp
	str r1, [sp, #4]
	str r0, [sp, #8]
	adds r2, r1, #0
	movs r1, #0
	str r1, [r2]
	str r0, [r4]
	ldr r1, [sp]
	cmp r1, #0
	beq .L080D3C1A
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080D3C1A:
	adds r0, r4, #0
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start func_080D3C24
func_080D3C24: @ 0x080D3C24
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #8
	bl __builtin_new
	bl func_08004B58
	str r0, [sp]
	mov r1, sp
	str r1, [sp, #4]
	str r0, [sp, #8]
	adds r2, r1, #0
	movs r1, #0
	str r1, [r2]
	str r0, [r4]
	ldr r1, [sp]
	cmp r1, #0
	beq .L080D3C56
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080D3C56:
	adds r0, r4, #0
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start func_080D3C60
func_080D3C60: @ 0x080D3C60
	push {lr}
	bl func_0800080C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080D3C6C
func_080D3C6C: @ 0x080D3C6C
	push {lr}
	bl func_0800080C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080D3C78
func_080D3C78: @ 0x080D3C78
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, .L080D3E70 @ =0x00006D20
	adds r4, r5, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	ldr r1, .L080D3E74 @ =0x00006D18
	adds r4, r5, r1
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	ldr r2, .L080D3E78 @ =0x00006D10
	adds r4, r5, r2
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	ldr r0, .L080D3E7C @ =0x00006D08
	adds r4, r5, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	movs r1, #0xda
	lsls r1, r1, #7
	adds r4, r5, r1
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	ldr r2, .L080D3E80 @ =0x00006CF8
	adds r4, r5, r2
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	ldr r0, .L080D3E84 @ =0x00006CF0
	adds r4, r5, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	ldr r1, .L080D3E88 @ =0x00006CE8
	adds r4, r5, r1
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	ldr r2, .L080D3E8C @ =0x00006CE0
	adds r4, r5, r2
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	ldr r0, .L080D3E90 @ =0x00006CD8
	adds r4, r5, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	ldr r1, .L080D3E94 @ =0x00006CD0
	adds r4, r5, r1
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	ldr r2, .L080D3E98 @ =0x00006CC8
	adds r4, r5, r2
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	ldr r0, .L080D3E9C @ =0x00006CC0
	adds r4, r5, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	ldr r1, .L080D3EA0 @ =0x00006CB8
	adds r4, r5, r1
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	ldr r2, .L080D3EA4 @ =0x00006CB0
	adds r4, r5, r2
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	ldr r0, .L080D3EA8 @ =0x00006CA8
	adds r4, r5, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	ldr r1, .L080D3EAC @ =0x00006CA0
	adds r4, r5, r1
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	ldr r2, .L080D3EB0 @ =0x00006C98
	adds r4, r5, r2
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	ldr r0, .L080D3EB4 @ =0x00006C90
	adds r4, r5, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	ldr r1, .L080D3EB8 @ =0x00006C88
	adds r4, r5, r1
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	movs r2, #0xd9
	lsls r2, r2, #7
	adds r4, r5, r2
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	ldr r0, .L080D3EBC @ =0x00006C78
	adds r4, r5, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	ldr r1, .L080D3EC0 @ =0x00006C74
	adds r0, r5, r1
	movs r1, #2
	bl func_08007184
	ldr r2, .L080D3EC4 @ =0x00006C70
	adds r0, r5, r2
	movs r1, #2
	bl func_080079E8
	ldr r1, .L080D3EC8 @ =0x00006A70
	adds r0, r5, r1
	ldr r1, .L080D3ECC @ =vtable_unk_080E5A28
	str r1, [r0]
	ldr r2, .L080D3ED0 @ =0x00006A40
	adds r0, r5, r2
	str r1, [r0]
	subs r2, #0x30
	adds r0, r5, r2
	str r1, [r0]
	adds r0, r5, #0
	adds r1, r6, #0
	bl func_080086BC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080D3E70: .4byte 0x00006D20
.L080D3E74: .4byte 0x00006D18
.L080D3E78: .4byte 0x00006D10
.L080D3E7C: .4byte 0x00006D08
.L080D3E80: .4byte 0x00006CF8
.L080D3E84: .4byte 0x00006CF0
.L080D3E88: .4byte 0x00006CE8
.L080D3E8C: .4byte 0x00006CE0
.L080D3E90: .4byte 0x00006CD8
.L080D3E94: .4byte 0x00006CD0
.L080D3E98: .4byte 0x00006CC8
.L080D3E9C: .4byte 0x00006CC0
.L080D3EA0: .4byte 0x00006CB8
.L080D3EA4: .4byte 0x00006CB0
.L080D3EA8: .4byte 0x00006CA8
.L080D3EAC: .4byte 0x00006CA0
.L080D3EB0: .4byte 0x00006C98
.L080D3EB4: .4byte 0x00006C90
.L080D3EB8: .4byte 0x00006C88
.L080D3EBC: .4byte 0x00006C78
.L080D3EC0: .4byte 0x00006C74
.L080D3EC4: .4byte 0x00006C70
.L080D3EC8: .4byte 0x00006A70
.L080D3ECC: .4byte vtable_unk_080E5A28
.L080D3ED0: .4byte 0x00006A40

	thumb_func_start func_080D3ED4
func_080D3ED4: @ 0x080D3ED4
	push {lr}
	adds r2, r0, #0
	ldr r0, .L080D3EF0 @ =vtable_unk_080E5A28
	str r0, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L080D3EEA
	adds r0, r2, #0
	bl __builtin_delete
.L080D3EEA:
	pop {r0}
	bx r0
	.align 2, 0
.L080D3EF0: .4byte vtable_unk_080E5A28

	thumb_func_start func_080D3EF4
func_080D3EF4: @ 0x080D3EF4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov sb, r0
	adds r5, r1, #0
	str r0, [sp, #0x10]
	mov sl, sp
	ldr r0, .L080D3FEC @ =0x00000554
	bl __builtin_new
	ldr r1, [r5, #4]
	movs r4, #0
	str r4, [r5, #4]
	adds r6, r0, #0
	ldr r0, .L080D3FF0 @ =vtable_unk_080E5BF8
	str r0, [r6]
	str r4, [sp, #4]
	str r1, [r6, #4]
	adds r0, r6, #0
	adds r0, #8
	bl __12ScriptEnginePv
	movs r1, #0xd9
	lsls r1, r1, #2
	adds r0, r6, r1
	strb r4, [r0]
	movs r0, #0xdb
	lsls r0, r0, #2
	adds r1, r6, r0
	strb r4, [r1]
	movs r0, #0x1d
	str r0, [r1, #4]
	movs r1, #0xdd
	lsls r1, r1, #2
	adds r2, r6, r1
	ldrb r1, [r2]
	subs r0, #0x3d
	ands r0, r1
	movs r1, #6
	orrs r0, r1
	strb r0, [r2]
	ldrh r1, [r2]
	ldr r0, .L080D3FF4 @ =0xFFFFF81F
	ands r0, r1
	strh r0, [r2]
	movs r1, #0xde
	lsls r1, r1, #2
	adds r0, r6, r1
	str r4, [r0]
	adds r1, #0x14
	adds r0, r6, r1
	str r4, [r0]
	movs r1, #0x9a
	lsls r1, r1, #3
	adds r0, r6, r1
	str r4, [r0]
	ldr r0, .L080D3FF8 @ =0x000004DC
	adds r4, r6, r0
	movs r5, #5
	add r1, sp, #8
	mov r8, r1
	movs r7, #1
	rsbs r7, r7, #0
.L080D3F78:
	adds r0, r4, #0
	bl func_080D4130
	adds r4, #0xc
	subs r5, #1
	cmp r5, r7
	bne .L080D3F78
	ldr r0, .L080D3FFC @ =0x00000524
	adds r4, r6, r0
	movs r5, #3
	movs r7, #1
	rsbs r7, r7, #0
.L080D3F90:
	adds r0, r4, #0
	bl func_080D40CC
	adds r4, #0xc
	subs r5, #1
	cmp r5, r7
	bne .L080D3F90
	ldr r0, .L080D4000 @ =gUnk_0300040C
	str r6, [r0]
	ldr r0, [sp, #4]
	cmp r0, #0
	beq .L080D3FAE
	movs r1, #3
	bl func_080D4480
.L080D3FAE:
	mov r1, sl
	str r6, [r1]
	ldr r2, [sp]
	mov r0, sp
	str r0, [sp, #8]
	mov r1, r8
	str r2, [r1, #4]
	ldr r1, [sp, #8]
	movs r0, #0
	str r0, [r1]
	ldr r0, [sp, #0x10]
	str r2, [r0]
	ldr r1, [sp]
	cmp r1, #0
	beq .L080D3FD8
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080D3FD8:
	mov r0, sb
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L080D3FEC: .4byte 0x00000554
.L080D3FF0: .4byte vtable_unk_080E5BF8
.L080D3FF4: .4byte 0xFFFFF81F
.L080D3FF8: .4byte 0x000004DC
.L080D3FFC: .4byte 0x00000524
.L080D4000: .4byte gUnk_0300040C

	thumb_func_start func_080D4004
func_080D4004: @ 0x080D4004
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #8
	bl __builtin_new
	bl func_080036F8
	str r0, [sp]
	mov r1, sp
	str r1, [sp, #4]
	str r0, [sp, #8]
	adds r2, r1, #0
	movs r1, #0
	str r1, [r2]
	str r0, [r4]
	ldr r1, [sp]
	cmp r1, #0
	beq .L080D4036
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080D4036:
	adds r0, r4, #0
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start func_080D4040
func_080D4040: @ 0x080D4040
	push {lr}
	bl func_0800080C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080D404C
func_080D404C: @ 0x080D404C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq .L080D405E
	movs r1, #3
	bl func_080D4480
.L080D405E:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0800080C
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_080D406C
func_080D406C: @ 0x080D406C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r5, #0
	adds r4, #0x54
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	ldr r0, .L080D40C8 @ =vtable_unk_080E5A28
	str r0, [r5, #0x1c]
	adds r0, r5, #0
	adds r0, #0x10
	movs r1, #2
	bl func_08050D0C
	ldr r1, [r5, #0xc]
	cmp r1, #0
	beq .L080D40B8
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080D40B8:
	adds r0, r5, #0
	adds r1, r6, #0
	bl func_080086BC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080D40C8: .4byte vtable_unk_080E5A28

	thumb_func_start func_080D40CC
func_080D40CC: @ 0x080D40CC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	adds r5, r0, #0
	mov r2, sp
	movs r4, #0x8d
	lsls r4, r4, #2
	movs r6, #0
	ldrh r1, [r2]
	ldr r3, .L080D412C @ =0xFFFFFC00
	adds r0, r3, #0
	ands r0, r1
	orrs r0, r4
	strh r0, [r2]
	movs r0, #0
	mov r8, r0
	ldrb r4, [r2, #1]
	movs r1, #3
	adds r0, r1, #0
	ands r0, r4
	strb r0, [r2, #1]
	ldrh r4, [r2, #2]
	adds r0, r3, #0
	ands r0, r4
	strh r0, [r2, #2]
	ldrb r0, [r2, #3]
	ands r1, r0
	strb r1, [r2, #3]
	ldrh r0, [r2, #4]
	ands r3, r0
	strh r3, [r2, #4]
	adds r0, r5, #0
	mov r1, sp
	movs r2, #6
	bl memcpy
	mov r0, r8
	strb r0, [r5, #6]
	strh r6, [r5, #8]
	strh r6, [r5, #0xa]
	adds r0, r5, #0
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L080D412C: .4byte 0xFFFFFC00

	thumb_func_start func_080D4130
func_080D4130: @ 0x080D4130
	push {r4, r5, lr}
	ldrb r2, [r0]
	movs r1, #4
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
	adds r4, r0, #2
	movs r5, #0x8d
	lsls r5, r5, #2
	ldrh r2, [r0, #2]
	ldr r3, .L080D4174 @ =0xFFFFFC00
	adds r1, r3, #0
	ands r1, r2
	orrs r1, r5
	strh r1, [r0, #2]
	ldrb r5, [r4, #1]
	movs r2, #3
	adds r1, r2, #0
	ands r1, r5
	strb r1, [r4, #1]
	ldrh r5, [r4, #2]
	adds r1, r3, #0
	ands r1, r5
	strh r1, [r4, #2]
	ldrb r1, [r4, #3]
	ands r2, r1
	strb r2, [r4, #3]
	ldrh r1, [r4, #4]
	ands r3, r1
	strh r3, [r4, #4]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L080D4174: .4byte 0xFFFFFC00

	thumb_func_start func_080D4178
func_080D4178: @ 0x080D4178
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	ldrb r3, [r6]
	lsls r1, r3, #0x1f
	lsrs r1, r1, #0x1f
	ldrb r2, [r5]
	movs r4, #2
	rsbs r4, r4, #0
	adds r0, r4, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #2
	ands r1, r3
	movs r2, #3
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #4
	ands r1, r3
	subs r2, #2
	ands r0, r2
	orrs r0, r1
	movs r1, #8
	ands r1, r3
	subs r2, #4
	ands r0, r2
	orrs r0, r1
	movs r1, #0x10
	ands r1, r3
	subs r2, #8
	ands r0, r2
	orrs r0, r1
	strb r0, [r5]
	ldrh r0, [r6]
	movs r1, #0xff
	lsls r1, r1, #5
	ands r1, r0
	ldrh r2, [r5]
	ldr r0, .L080D441C @ =0xFFFFE01F
	ands r0, r2
	orrs r0, r1
	strh r0, [r5]
	ldr r2, [r6]
	movs r0, #0xf8
	lsls r0, r0, #0xa
	ands r2, r0
	ldr r0, [r5]
	ldr r1, .L080D4420 @ =0xFFFC1FFF
	ands r0, r1
	orrs r0, r2
	str r0, [r5]
	ldrh r0, [r6, #2]
	movs r1, #0xfe
	lsls r1, r1, #1
	ands r1, r0
	ldrh r2, [r5, #2]
	ldr r0, .L080D4424 @ =0xFFFFFE03
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, #2]
	ldrb r2, [r6, #3]
	movs r1, #0x7e
	ands r1, r2
	ldrb r3, [r5, #3]
	movs r0, #0x7f
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	lsrs r2, r2, #7
	lsls r2, r2, #7
	movs r1, #0x7f
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, #3]
	ldrb r0, [r6, #4]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	ldrb r1, [r5, #4]
	ands r4, r1
	orrs r4, r0
	strb r4, [r5, #4]
	adds r1, r5, #0
	adds r1, #8
	adds r0, r6, #0
	adds r0, #8
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	adds r0, r5, #0
	adds r0, #0x14
	adds r1, r6, #0
	adds r1, #0x14
	bl func_080D64C8
	ldr r1, .L080D4428 @ =0x00001AA8
	adds r0, r5, r1
	adds r1, r6, r1
	bl func_080D6B40
	ldr r1, .L080D442C @ =0x00001BD8
	adds r0, r5, r1
	adds r1, r6, r1
	bl func_080D68C0
	ldr r1, .L080D4430 @ =0x00001C70
	adds r0, r5, r1
	adds r1, r6, r1
	bl func_080D67C8
	movs r0, #0xe5
	lsls r0, r0, #5
	adds r1, r5, r0
	adds r0, r0, r6
	mov ip, r0
	movs r0, #0
	str r0, [r1]
	mov r0, ip
	ldr r7, [r0]
	ldr r2, .L080D4434 @ =0x00001CA4
	adds r0, r6, r2
	adds r4, r0, r7
	adds r2, r0, #0
	ldr r0, .L080D4434 @ =0x00001CA4
	adds r3, r5, r0
	cmp r2, r4
	beq .L080D428E
.L080D427E:
	cmp r3, #0
	beq .L080D4286
	ldrb r0, [r2]
	strb r0, [r3]
.L080D4286:
	adds r2, #1
	adds r3, #1
	cmp r2, r4
	bne .L080D427E
.L080D428E:
	str r7, [r1]
	adds r0, r1, #0
	adds r0, #0x24
	mov r1, ip
	adds r1, #0x24
	movs r2, #6
	bl memcpy
	ldr r1, .L080D4438 @ =0x00001CCC
	adds r0, r5, r1
	adds r1, r6, r1
	movs r2, #6
	bl memcpy
	ldr r1, .L080D443C @ =0x00001CD4
	adds r0, r5, r1
	adds r1, r6, r1
	bl func_080D60B0
	ldr r1, .L080D4440 @ =0x0000214C
	adds r0, r5, r1
	adds r1, r6, r1
	bl func_080D44D4
	ldr r0, .L080D4444 @ =0x000021CC
	adds r4, r5, r0
	adds r0, r0, r6
	mov ip, r0
	ldr r0, [r0]
	str r0, [r4]
	mov r1, ip
	ldr r0, [r1, #4]
	str r0, [r4, #4]
	ldr r3, .L080D4448 @ =0x000021D4
	adds r2, r5, r3
	movs r3, #7
	ldr r0, .L080D4448 @ =0x000021D4
	adds r1, r6, r0
	movs r7, #1
	rsbs r7, r7, #0
.L080D42DE:
	ldrb r0, [r1]
	strb r0, [r2]
	adds r2, #1
	adds r1, #1
	subs r3, #1
	cmp r3, r7
	bne .L080D42DE
	adds r3, r4, #0
	adds r3, #0x10
	movs r1, #3
	mov r2, ip
	adds r2, #0x10
	adds r7, r4, #0
	adds r7, #0x14
	movs r0, #0x14
	add r0, ip
	mov r8, r0
	movs r0, #0x24
	adds r0, r0, r4
	mov sb, r0
	movs r0, #0x24
	add r0, ip
	mov sl, r0
	adds r4, #0x34
	str r4, [sp]
	mov r4, ip
	adds r4, #0x34
	str r4, [sp, #4]
	movs r4, #1
	rsbs r4, r4, #0
.L080D431A:
	ldrb r0, [r2]
	strb r0, [r3]
	adds r3, #1
	adds r2, #1
	subs r1, #1
	cmp r1, r4
	bne .L080D431A
	adds r0, r7, #0
	mov r1, r8
	bl strcpy
	mov r0, sb
	mov r1, sl
	bl strcpy
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl strcpy
	ldr r0, .L080D444C @ =0x00002210
	adds r1, r5, r0
	adds r0, r6, r0
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, .L080D4450 @ =0x00002214
	adds r0, r5, r1
	adds r1, r6, r1
	ldr r2, .L080D4454 @ =0x00000A08
	bl memcpy
	ldr r1, .L080D4458 @ =0x00002C1C
	adds r0, r5, r1
	adds r1, r6, r1
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldr r0, .L080D445C @ =0x00002C4C
	adds r1, r5, r0
	adds r0, r6, r0
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, .L080D4460 @ =0x00002C74
	adds r1, r5, r0
	adds r0, r6, r0
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	movs r1, #0xb2
	lsls r1, r1, #6
	adds r0, r5, r1
	adds r1, r6, r1
	movs r2, #0xec
	lsls r2, r2, #1
	bl memcpy
	ldr r1, .L080D4464 @ =0x00002E58
	adds r0, r5, r1
	adds r1, r6, r1
	movs r2, #0xc5
	lsls r2, r2, #3
	bl memcpy
	movs r0, #0xd2
	lsls r0, r0, #6
	adds r1, r5, r0
	adds r0, r6, r0
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	ldr r1, .L080D4468 @ =0x00003494
	adds r0, r5, r1
	adds r1, r6, r1
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldr r0, .L080D446C @ =0x000034C4
	adds r1, r6, r0
	ldrb r1, [r1]
	adds r0, r5, r0
	strb r1, [r0]
	ldr r0, .L080D4470 @ =0x000034C5
	adds r1, r6, r0
	ldrb r1, [r1]
	adds r0, r5, r0
	strb r1, [r0]
	ldr r0, .L080D4474 @ =0x000034C8
	adds r1, r5, r0
	adds r0, r6, r0
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, .L080D4478 @ =0x000034D8
	adds r1, r5, r0
	adds r0, r6, r0
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, .L080D447C @ =0x000034DC
	adds r0, r5, r1
	adds r1, r6, r1
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	adds r0, r5, #0
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L080D441C: .4byte 0xFFFFE01F
.L080D4420: .4byte 0xFFFC1FFF
.L080D4424: .4byte 0xFFFFFE03
.L080D4428: .4byte 0x00001AA8
.L080D442C: .4byte 0x00001BD8
.L080D4430: .4byte 0x00001C70
.L080D4434: .4byte 0x00001CA4
.L080D4438: .4byte 0x00001CCC
.L080D443C: .4byte 0x00001CD4
.L080D4440: .4byte 0x0000214C
.L080D4444: .4byte 0x000021CC
.L080D4448: .4byte 0x000021D4
.L080D444C: .4byte 0x00002210
.L080D4450: .4byte 0x00002214
.L080D4454: .4byte 0x00000A08
.L080D4458: .4byte 0x00002C1C
.L080D445C: .4byte 0x00002C4C
.L080D4460: .4byte 0x00002C74
.L080D4464: .4byte 0x00002E58
.L080D4468: .4byte 0x00003494
.L080D446C: .4byte 0x000034C4
.L080D4470: .4byte 0x000034C5
.L080D4474: .4byte 0x000034C8
.L080D4478: .4byte 0x000034D8
.L080D447C: .4byte 0x000034DC

	thumb_func_start func_080D4480
func_080D4480: @ 0x080D4480
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #0xe5
	lsls r0, r0, #5
	adds r1, r4, r0
	ldr r0, [r1]
	adds r0, #4
	adds r1, r1, r0
	ldr r2, .L080D44C8 @ =0x00001CA4
	adds r0, r4, r2
	cmp r0, r1
	beq .L080D44A0
.L080D449A:
	adds r0, #1
	cmp r0, r1
	bne .L080D449A
.L080D44A0:
	ldr r1, .L080D44CC @ =0x00001C38
	adds r0, r4, r1
	movs r1, #2
	bl func_080D6B00
	ldr r2, .L080D44D0 @ =0x00001AA8
	adds r0, r4, r2
	movs r1, #2
	bl func_080D6C08
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq .L080D44C2
	adds r0, r4, #0
	bl __builtin_delete
.L080D44C2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080D44C8: .4byte 0x00001CA4
.L080D44CC: .4byte 0x00001C38
.L080D44D0: .4byte 0x00001AA8

	thumb_func_start func_080D44D4
func_080D44D4: @ 0x080D44D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r7, r0, #0
	mov sl, r1
	movs r0, #0
	adds r3, r7, #0
	stm r3!, {r0}
	ldm r1!, {r4}
	lsls r0, r4, #1
	adds r0, r0, r1
	cmp r0, r1
	beq .L080D44FC
	subs r2, r0, r1
	adds r0, r3, #0
	bl memmove
.L080D44FC:
	str r4, [r7]
	mov r1, sl
	ldrh r0, [r1, #0xc]
	strh r0, [r7, #0xc]
	ldrb r2, [r1, #0xe]
	lsls r1, r2, #0x1f
	lsrs r1, r1, #0x1f
	ldrb r3, [r7, #0xe]
	movs r4, #2
	rsbs r4, r4, #0
	mov ip, r4
	mov r0, ip
	ands r0, r3
	orrs r0, r1
	movs r1, #6
	ands r1, r2
	subs r4, #5
	ands r0, r4
	orrs r0, r1
	movs r1, #8
	ands r1, r2
	movs r5, #9
	rsbs r5, r5, #0
	ands r0, r5
	orrs r0, r1
	movs r1, #0x30
	ands r1, r2
	movs r6, #0x31
	rsbs r6, r6, #0
	ands r0, r6
	orrs r0, r1
	lsrs r2, r2, #6
	lsls r2, r2, #6
	movs r1, #0x3f
	ands r0, r1
	orrs r0, r2
	strb r0, [r7, #0xe]
	mov r3, sl
	ldrb r2, [r3, #0xf]
	lsls r1, r2, #0x1f
	lsrs r1, r1, #0x1f
	ldrb r3, [r7, #0xf]
	mov r0, ip
	ands r0, r3
	orrs r1, r0
	movs r0, #2
	ands r0, r2
	adds r6, #0x2e
	ands r1, r6
	orrs r1, r0
	movs r0, #4
	ands r0, r2
	movs r3, #5
	rsbs r3, r3, #0
	ands r1, r3
	orrs r1, r0
	movs r0, #0x18
	ands r0, r2
	subs r6, #0x16
	mov r8, r6
	ands r1, r6
	orrs r1, r0
	movs r0, #0x20
	ands r0, r2
	subs r3, #0x1c
	ands r1, r3
	orrs r1, r0
	lsrs r2, r2, #6
	lsls r2, r2, #6
	movs r6, #0x3f
	ands r1, r6
	orrs r1, r2
	strb r1, [r7, #0xf]
	mov r0, sl
	ldrb r2, [r0, #0x10]
	lsls r1, r2, #0x1f
	lsrs r1, r1, #0x1f
	ldrb r3, [r7, #0x10]
	mov r0, ip
	ands r0, r3
	orrs r1, r0
	movs r0, #6
	ands r0, r2
	ands r1, r4
	orrs r1, r0
	movs r0, #8
	ands r0, r2
	ands r1, r5
	orrs r1, r0
	movs r0, #0x10
	ands r0, r2
	movs r3, #0x11
	rsbs r3, r3, #0
	ands r1, r3
	orrs r1, r0
	movs r0, #0x20
	ands r0, r2
	subs r6, #0x60
	ands r1, r6
	orrs r1, r0
	movs r0, #0x40
	ands r0, r2
	subs r3, #0x30
	ands r1, r3
	orrs r1, r0
	lsrs r2, r2, #7
	lsls r2, r2, #7
	movs r6, #0x7f
	ands r1, r6
	orrs r1, r2
	strb r1, [r7, #0x10]
	mov r0, sl
	ldrb r3, [r0, #0x11]
	lsls r1, r3, #0x1f
	lsrs r1, r1, #0x1f
	ldrb r2, [r7, #0x11]
	mov r0, ip
	ands r0, r2
	orrs r1, r0
	movs r0, #2
	ands r0, r3
	movs r2, #3
	rsbs r2, r2, #0
	ands r1, r2
	orrs r1, r0
	movs r0, #4
	ands r0, r3
	subs r6, #0x84
	ands r1, r6
	orrs r1, r0
	movs r0, #8
	ands r0, r3
	ands r1, r5
	orrs r1, r0
	movs r0, #0x10
	ands r0, r3
	subs r2, #0xe
	ands r1, r2
	orrs r1, r0
	movs r0, #0x60
	ands r0, r3
	movs r3, #0x61
	rsbs r3, r3, #0
	ands r1, r3
	orrs r1, r0
	strb r1, [r7, #0x11]
	mov r5, sl
	ldr r1, [r5, #0x10]
	movs r0, #0xc0
	lsls r0, r0, #9
	ands r1, r0
	ldr r0, [r7, #0x10]
	ldr r6, .L080D4A18 @ =0xFFFE7FFF
	ands r0, r6
	orrs r0, r1
	str r0, [r7, #0x10]
	ldrb r3, [r5, #0x12]
	movs r1, #6
	ands r1, r3
	ldrb r2, [r7, #0x12]
	adds r0, r4, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #0x18
	ands r1, r3
	mov r2, r8
	ands r0, r2
	orrs r0, r1
	movs r1, #0x60
	ands r1, r3
	movs r3, #0x61
	rsbs r3, r3, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r7, #0x12]
	ldrh r0, [r5, #0x12]
	movs r1, #0xc0
	lsls r1, r1, #1
	ands r1, r0
	ldrh r2, [r7, #0x12]
	ldr r0, .L080D4A1C @ =0xFFFFFE7F
	ands r0, r2
	orrs r0, r1
	strh r0, [r7, #0x12]
	ldrb r3, [r5, #0x13]
	movs r1, #6
	ands r1, r3
	ldrb r2, [r7, #0x13]
	adds r0, r4, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #0x18
	ands r1, r3
	mov r5, r8
	ands r0, r5
	orrs r0, r1
	movs r1, #0x60
	ands r1, r3
	movs r6, #0x61
	rsbs r6, r6, #0
	ands r0, r6
	orrs r0, r1
	lsrs r3, r3, #7
	mov r1, sl
	ldrb r2, [r1, #0x14]
	movs r5, #1
	ands r2, r5
	lsls r2, r2, #1
	orrs r2, r3
	adds r1, r2, #0
	ands r1, r5
	lsls r1, r1, #7
	movs r6, #0x7f
	ands r0, r6
	orrs r0, r1
	strb r0, [r7, #0x13]
	lsrs r2, r2, #1
	ands r2, r5
	ldrb r1, [r7, #0x14]
	mov r0, ip
	ands r0, r1
	orrs r0, r2
	mov r1, sl
	ldrb r2, [r1, #0x14]
	movs r1, #6
	ands r1, r2
	ands r0, r4
	orrs r0, r1
	movs r1, #0x18
	ands r1, r2
	mov r3, r8
	ands r0, r3
	orrs r0, r1
	movs r1, #0x60
	ands r1, r2
	subs r5, #0x62
	ands r0, r5
	orrs r0, r1
	strb r0, [r7, #0x14]
	mov r6, sl
	ldrh r0, [r6, #0x14]
	movs r1, #0xc0
	lsls r1, r1, #1
	ands r1, r0
	ldrh r2, [r7, #0x14]
	ldr r0, .L080D4A1C @ =0xFFFFFE7F
	ands r0, r2
	orrs r0, r1
	strh r0, [r7, #0x14]
	ldrb r3, [r6, #0x15]
	movs r1, #6
	ands r1, r3
	ldrb r2, [r7, #0x15]
	adds r0, r4, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #0x18
	ands r1, r3
	mov r2, r8
	ands r0, r2
	orrs r0, r1
	movs r1, #0x60
	ands r1, r3
	ands r0, r5
	orrs r0, r1
	strb r0, [r7, #0x15]
	ldr r1, [r6, #0x14]
	movs r0, #0xc0
	lsls r0, r0, #9
	ands r1, r0
	ldr r0, [r7, #0x14]
	ldr r3, .L080D4A18 @ =0xFFFE7FFF
	ands r0, r3
	orrs r0, r1
	str r0, [r7, #0x14]
	ldrb r3, [r6, #0x16]
	movs r1, #6
	ands r1, r3
	ldrb r2, [r7, #0x16]
	adds r0, r4, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #0x18
	ands r1, r3
	mov r5, r8
	ands r0, r5
	orrs r0, r1
	movs r1, #0x60
	ands r1, r3
	movs r6, #0x61
	rsbs r6, r6, #0
	ands r0, r6
	orrs r0, r1
	strb r0, [r7, #0x16]
	mov r1, sl
	ldrh r0, [r1, #0x16]
	movs r1, #0xc0
	lsls r1, r1, #1
	ands r1, r0
	ldrh r2, [r7, #0x16]
	ldr r0, .L080D4A1C @ =0xFFFFFE7F
	ands r0, r2
	orrs r0, r1
	strh r0, [r7, #0x16]
	mov r2, sl
	ldrb r3, [r2, #0x17]
	movs r1, #6
	ands r1, r3
	ldrb r2, [r7, #0x17]
	adds r0, r4, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #0x18
	ands r1, r3
	ands r0, r5
	orrs r0, r1
	movs r1, #0x60
	ands r1, r3
	ands r0, r6
	orrs r0, r1
	lsrs r3, r3, #7
	mov r5, sl
	ldrb r1, [r5, #0x18]
	movs r6, #1
	ands r1, r6
	lsls r1, r1, #1
	orrs r1, r3
	adds r2, r1, #0
	ands r2, r6
	lsls r2, r2, #7
	movs r3, #0x7f
	ands r0, r3
	orrs r0, r2
	strb r0, [r7, #0x17]
	lsrs r1, r1, #1
	ands r1, r6
	ldrb r2, [r7, #0x18]
	mov r0, ip
	ands r0, r2
	orrs r1, r0
	ldrb r2, [r5, #0x18]
	movs r0, #6
	ands r0, r2
	ands r1, r4
	orrs r1, r0
	movs r0, #0x18
	ands r0, r2
	mov r5, r8
	ands r1, r5
	orrs r1, r0
	movs r0, #0x60
	ands r0, r2
	subs r6, #0x62
	ands r1, r6
	orrs r1, r0
	strb r1, [r7, #0x18]
	mov r1, sl
	ldrh r0, [r1, #0x18]
	movs r1, #0xc0
	lsls r1, r1, #1
	ands r1, r0
	ldrh r2, [r7, #0x18]
	ldr r0, .L080D4A1C @ =0xFFFFFE7F
	ands r0, r2
	orrs r0, r1
	strh r0, [r7, #0x18]
	mov r2, sl
	ldrb r3, [r2, #0x19]
	movs r1, #6
	ands r1, r3
	ldrb r2, [r7, #0x19]
	adds r0, r4, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #0x18
	ands r1, r3
	ands r0, r5
	orrs r0, r1
	movs r1, #0x60
	ands r1, r3
	ands r0, r6
	orrs r0, r1
	strb r0, [r7, #0x19]
	mov r3, sl
	ldr r1, [r3, #0x18]
	movs r0, #0xc0
	lsls r0, r0, #9
	ands r1, r0
	ldr r0, [r7, #0x18]
	ldr r5, .L080D4A18 @ =0xFFFE7FFF
	ands r0, r5
	orrs r0, r1
	str r0, [r7, #0x18]
	ldrb r3, [r3, #0x1a]
	movs r1, #6
	ands r1, r3
	ldrb r2, [r7, #0x1a]
	adds r0, r4, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #0x18
	ands r1, r3
	mov r6, r8
	ands r0, r6
	orrs r0, r1
	movs r1, #0x60
	ands r1, r3
	movs r2, #0x61
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r7, #0x1a]
	mov r3, sl
	ldrh r0, [r3, #0x1a]
	movs r1, #0xc0
	lsls r1, r1, #1
	ands r1, r0
	ldrh r2, [r7, #0x1a]
	ldr r0, .L080D4A1C @ =0xFFFFFE7F
	ands r0, r2
	orrs r0, r1
	strh r0, [r7, #0x1a]
	ldrb r3, [r3, #0x1b]
	movs r1, #6
	ands r1, r3
	ldrb r2, [r7, #0x1b]
	adds r0, r4, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #0x18
	ands r1, r3
	ands r0, r6
	orrs r0, r1
	movs r1, #0x60
	ands r1, r3
	movs r5, #0x61
	rsbs r5, r5, #0
	ands r0, r5
	orrs r0, r1
	lsrs r3, r3, #7
	mov r6, sl
	ldrb r1, [r6, #0x1c]
	movs r2, #1
	ands r1, r2
	lsls r1, r1, #1
	orrs r1, r3
	adds r2, r1, #0
	movs r3, #1
	ands r2, r3
	lsls r2, r2, #7
	movs r5, #0x7f
	ands r0, r5
	orrs r0, r2
	strb r0, [r7, #0x1b]
	lsrs r1, r1, #1
	ands r1, r3
	ldrb r2, [r7, #0x1c]
	mov r0, ip
	ands r0, r2
	orrs r1, r0
	ldrb r2, [r6, #0x1c]
	movs r0, #6
	ands r0, r2
	ands r1, r4
	orrs r1, r0
	movs r0, #0x18
	ands r0, r2
	mov r6, r8
	ands r1, r6
	orrs r1, r0
	movs r0, #0x60
	ands r0, r2
	movs r2, #0x61
	rsbs r2, r2, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, #0x1c]
	mov r3, sl
	ldrh r0, [r3, #0x1c]
	movs r1, #0xc0
	lsls r1, r1, #1
	ands r1, r0
	ldrh r2, [r7, #0x1c]
	ldr r0, .L080D4A1C @ =0xFFFFFE7F
	ands r0, r2
	orrs r0, r1
	strh r0, [r7, #0x1c]
	ldrb r3, [r3, #0x1d]
	movs r1, #6
	ands r1, r3
	ldrb r2, [r7, #0x1d]
	adds r0, r4, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #0x18
	ands r1, r3
	ands r0, r6
	orrs r0, r1
	movs r1, #0x60
	ands r1, r3
	subs r5, #0xe0
	ands r0, r5
	orrs r0, r1
	strb r0, [r7, #0x1d]
	mov r6, sl
	ldr r1, [r6, #0x1c]
	movs r0, #0xc0
	lsls r0, r0, #9
	ands r1, r0
	ldr r0, [r7, #0x1c]
	ldr r2, .L080D4A18 @ =0xFFFE7FFF
	ands r0, r2
	orrs r0, r1
	str r0, [r7, #0x1c]
	ldrb r3, [r6, #0x1e]
	movs r1, #6
	ands r1, r3
	ldrb r2, [r7, #0x1e]
	adds r0, r4, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #0x18
	ands r1, r3
	mov r5, r8
	ands r0, r5
	orrs r0, r1
	movs r1, #0x60
	ands r1, r3
	movs r6, #0x61
	rsbs r6, r6, #0
	ands r0, r6
	orrs r0, r1
	strb r0, [r7, #0x1e]
	mov r1, sl
	ldrh r0, [r1, #0x1e]
	movs r1, #0xc0
	lsls r1, r1, #1
	ands r1, r0
	ldrh r2, [r7, #0x1e]
	ldr r0, .L080D4A1C @ =0xFFFFFE7F
	ands r0, r2
	orrs r0, r1
	strh r0, [r7, #0x1e]
	mov r2, sl
	ldrb r3, [r2, #0x1f]
	movs r0, #6
	ands r0, r3
	ldrb r2, [r7, #0x1f]
	adds r1, r4, #0
	ands r1, r2
	orrs r1, r0
	movs r0, #0x18
	ands r0, r3
	ands r1, r5
	orrs r1, r0
	movs r0, #0x60
	ands r0, r3
	ands r1, r6
	orrs r1, r0
	lsrs r3, r3, #7
	mov r5, sl
	adds r5, #0x20
	ldrb r0, [r5]
	movs r6, #1
	ands r0, r6
	lsls r0, r0, #1
	orrs r0, r3
	adds r2, r0, #0
	ands r2, r6
	lsls r2, r2, #7
	movs r3, #0x7f
	ands r1, r3
	orrs r1, r2
	strb r1, [r7, #0x1f]
	lsrs r0, r0, #1
	ands r0, r6
	adds r3, r7, #0
	adds r3, #0x20
	ldrb r1, [r3]
	mov r6, ip
	ands r6, r1
	orrs r0, r6
	ldrb r2, [r5]
	movs r1, #6
	ands r1, r2
	ands r0, r4
	orrs r0, r1
	movs r1, #0x18
	ands r1, r2
	mov r5, r8
	ands r0, r5
	orrs r0, r1
	movs r1, #0x60
	ands r1, r2
	movs r6, #0x61
	rsbs r6, r6, #0
	ands r0, r6
	orrs r0, r1
	strb r0, [r3]
	mov r1, sl
	ldrh r0, [r1, #0x20]
	movs r1, #0xc0
	lsls r1, r1, #1
	ands r1, r0
	ldrh r2, [r7, #0x20]
	ldr r0, .L080D4A1C @ =0xFFFFFE7F
	ands r0, r2
	orrs r0, r1
	strh r0, [r7, #0x20]
	mov r0, sl
	adds r0, #0x21
	ldrb r3, [r0]
	adds r5, r7, #0
	adds r5, #0x21
	movs r1, #6
	ands r1, r3
	ldrb r2, [r5]
	adds r0, r4, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #0x18
	ands r1, r3
	mov r2, r8
	ands r0, r2
	orrs r0, r1
	movs r1, #0x60
	ands r1, r3
	ands r0, r6
	orrs r0, r1
	strb r0, [r5]
	mov r3, sl
	ldr r1, [r3, #0x20]
	movs r0, #0xc0
	lsls r0, r0, #9
	ands r1, r0
	ldr r0, [r7, #0x20]
	ldr r5, .L080D4A18 @ =0xFFFE7FFF
	ands r0, r5
	orrs r0, r1
	str r0, [r7, #0x20]
	mov r0, sl
	adds r0, #0x22
	ldrb r3, [r0]
	adds r5, r7, #0
	adds r5, #0x22
	movs r1, #6
	ands r1, r3
	ldrb r2, [r5]
	adds r0, r4, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #0x18
	b .L080D4A20
	.align 2, 0
.L080D4A18: .4byte 0xFFFE7FFF
.L080D4A1C: .4byte 0xFFFFFE7F
.L080D4A20:
	ands r1, r3
	mov r6, r8
	ands r0, r6
	orrs r0, r1
	movs r1, #0x20
	ands r1, r3
	movs r2, #0x21
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #0x40
	ands r1, r3
	movs r3, #0x41
	rsbs r3, r3, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r5]
	mov r0, sl
	adds r0, #0x23
	ldrb r0, [r0]
	lsrs r0, r0, #4
	mov r5, sl
	adds r5, #0x24
	str r5, [sp, #0x14]
	ldrb r1, [r5]
	movs r5, #7
	ands r1, r5
	lsls r1, r1, #4
	orrs r1, r0
	movs r0, #0xf
	adds r2, r1, #0
	ands r2, r0
	movs r6, #0x23
	lsls r2, r2, #4
	ldrb r3, [r6, r7]
	ands r0, r3
	orrs r0, r2
	strb r0, [r6, r7]
	lsrs r1, r1, #4
	adds r3, r7, #0
	adds r3, #0x24
	ands r1, r5
	ldrb r2, [r3]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	ldr r5, [sp, #0x14]
	ldrb r2, [r5]
	movs r1, #0x18
	ands r1, r2
	mov r6, r8
	ands r0, r6
	orrs r0, r1
	movs r1, #0x60
	ands r1, r2
	movs r2, #0x61
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	mov r3, sl
	ldrh r1, [r3, #0x24]
	movs r0, #0xc0
	lsls r0, r0, #1
	ands r0, r1
	ldrh r1, [r7, #0x24]
	ldr r5, .L080D4E90 @ =0xFFFFFE7F
	ands r5, r1
	orrs r5, r0
	strh r5, [r7, #0x24]
	mov r0, sl
	adds r0, #0x25
	ldrb r1, [r0]
	adds r3, r7, #0
	adds r3, #0x25
	movs r0, #6
	ands r0, r1
	ldrb r2, [r3]
	ands r4, r2
	orrs r4, r0
	movs r0, #0x18
	ands r0, r1
	ands r4, r6
	orrs r4, r0
	movs r0, #0x60
	ands r0, r1
	movs r2, #0x61
	rsbs r2, r2, #0
	ands r4, r2
	orrs r4, r0
	lsrs r1, r1, #7
	lsls r1, r1, #7
	movs r5, #0x7f
	ands r4, r5
	orrs r4, r1
	strb r4, [r3]
	mov r0, sl
	adds r0, #0x26
	ldrb r2, [r0]
	lsls r1, r2, #0x1e
	adds r5, r7, #0
	adds r5, #0x26
	lsrs r1, r1, #0x1e
	ldrb r3, [r5]
	movs r4, #4
	rsbs r4, r4, #0
	adds r0, r4, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0xc
	ands r1, r2
	movs r6, #0xd
	rsbs r6, r6, #0
	mov r8, r6
	ands r0, r6
	orrs r0, r1
	movs r1, #0x30
	ands r1, r2
	movs r3, #0x31
	rsbs r3, r3, #0
	ands r0, r3
	orrs r0, r1
	lsrs r2, r2, #6
	lsls r2, r2, #6
	movs r6, #0x3f
	ands r0, r6
	orrs r0, r2
	strb r0, [r5]
	mov r0, sl
	adds r0, #0x27
	ldrb r2, [r0]
	lsls r1, r2, #0x1e
	adds r5, #1
	lsrs r1, r1, #0x1e
	ldrb r3, [r5]
	adds r0, r4, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0xc
	ands r1, r2
	mov r3, r8
	ands r0, r3
	orrs r0, r1
	movs r1, #0x30
	ands r1, r2
	subs r6, #0x70
	ands r0, r6
	orrs r0, r1
	lsrs r2, r2, #6
	lsls r2, r2, #6
	movs r1, #0x3f
	ands r0, r1
	orrs r0, r2
	strb r0, [r5]
	mov r0, sl
	adds r0, #0x28
	ldrb r2, [r0]
	lsls r1, r2, #0x1e
	adds r5, #1
	lsrs r1, r1, #0x1e
	ldrb r3, [r5]
	adds r0, r4, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0xc
	ands r1, r2
	mov r3, r8
	ands r0, r3
	orrs r0, r1
	movs r1, #0x30
	ands r1, r2
	ands r0, r6
	orrs r0, r1
	lsrs r2, r2, #6
	lsls r2, r2, #6
	movs r6, #0x3f
	ands r0, r6
	orrs r0, r2
	strb r0, [r5]
	mov r0, sl
	adds r0, #0x29
	ldrb r3, [r0]
	lsls r1, r3, #0x1e
	adds r5, #1
	lsrs r1, r1, #0x1e
	ldrb r2, [r5]
	adds r0, r4, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #0xc
	ands r1, r3
	mov r2, r8
	ands r0, r2
	orrs r0, r1
	movs r1, #0x10
	ands r1, r3
	movs r2, #0x11
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #0x20
	ands r1, r3
	subs r6, #0x60
	ands r0, r6
	orrs r0, r1
	movs r1, #0x40
	ands r1, r3
	subs r2, #0x30
	ands r0, r2
	orrs r0, r1
	lsrs r3, r3, #7
	lsls r3, r3, #7
	movs r1, #0x7f
	ands r0, r1
	orrs r0, r3
	strb r0, [r5]
	mov r0, sl
	adds r0, #0x2a
	ldrb r3, [r0]
	lsls r1, r3, #0x1f
	lsrs r1, r1, #0x1f
	adds r5, #1
	ldrb r2, [r5]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	orrs r1, r0
	movs r0, #6
	ands r0, r3
	movs r2, #7
	rsbs r2, r2, #0
	ands r1, r2
	orrs r1, r0
	movs r0, #0x18
	ands r0, r3
	adds r6, #8
	ands r1, r6
	orrs r1, r0
	movs r0, #0x60
	ands r0, r3
	subs r2, #0x5a
	ands r1, r2
	orrs r1, r0
	strb r1, [r5]
	mov r3, sl
	ldrh r0, [r3, #0x2a]
	movs r1, #0xc0
	lsls r1, r1, #1
	ands r1, r0
	ldrh r2, [r7, #0x2a]
	ldr r0, .L080D4E90 @ =0xFFFFFE7F
	ands r0, r2
	orrs r0, r1
	strh r0, [r7, #0x2a]
	mov r0, sl
	adds r0, #0x2b
	ldrb r3, [r0]
	adds r5, #1
	movs r1, #6
	ands r1, r3
	ldrb r2, [r5]
	movs r0, #7
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #8
	ands r1, r3
	movs r2, #9
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #0x30
	ands r1, r3
	subs r6, #0x18
	ands r0, r6
	orrs r0, r1
	lsrs r3, r3, #6
	lsls r3, r3, #6
	movs r1, #0x3f
	ands r0, r1
	orrs r0, r3
	strb r0, [r5]
	mov r0, sl
	adds r0, #0x2c
	ldrb r3, [r0]
	lsls r1, r3, #0x1f
	lsrs r1, r1, #0x1f
	adds r5, #1
	ldrb r2, [r5]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	orrs r1, r0
	movs r0, #6
	ands r0, r3
	movs r2, #7
	rsbs r2, r2, #0
	ands r1, r2
	orrs r1, r0
	movs r0, #0x38
	ands r0, r3
	subs r2, #0x32
	ands r1, r2
	orrs r1, r0
	lsrs r3, r3, #6
	lsls r3, r3, #6
	movs r6, #0x3f
	ands r1, r6
	orrs r1, r3
	strb r1, [r5]
	mov r0, sl
	adds r0, #0x2d
	ldrb r3, [r0]
	lsls r1, r3, #0x1e
	adds r5, #1
	lsrs r1, r1, #0x1e
	ldrb r2, [r5]
	adds r0, r4, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #0xc
	ands r1, r3
	mov r2, r8
	ands r0, r2
	orrs r0, r1
	movs r1, #0x30
	ands r1, r3
	movs r3, #0x31
	rsbs r3, r3, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r5]
	mov r5, sl
	ldr r1, [r5, #0x2c]
	movs r0, #0xf0
	lsls r0, r0, #0xa
	ands r1, r0
	ldr r0, [r7, #0x2c]
	ldr r6, .L080D4E94 @ =0xFFFC3FFF
	ands r0, r6
	orrs r0, r1
	str r0, [r7, #0x2c]
	mov r0, sl
	adds r0, #0x2e
	ldrb r2, [r0]
	adds r5, r7, #0
	adds r5, #0x2e
	movs r1, #4
	ands r1, r2
	ldrb r3, [r5]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0x18
	ands r1, r2
	movs r3, #0x19
	rsbs r3, r3, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0x60
	ands r1, r2
	movs r6, #0x61
	rsbs r6, r6, #0
	ands r0, r6
	orrs r0, r1
	lsrs r2, r2, #7
	lsls r2, r2, #7
	movs r1, #0x7f
	ands r0, r1
	orrs r0, r2
	strb r0, [r5]
	mov r0, sl
	adds r0, #0x2f
	ldrb r3, [r0]
	lsls r0, r3, #0x1b
	movs r2, #0x2f
	adds r2, r2, r7
	mov ip, r2
	lsrs r0, r0, #0x1b
	ldrb r1, [r2]
	movs r2, #0x20
	rsbs r2, r2, #0
	ands r2, r1
	orrs r2, r0
	movs r0, #0x60
	ands r0, r3
	ands r2, r6
	orrs r2, r0
	lsrs r3, r3, #7
	mov r5, sl
	adds r5, #0x30
	ldrb r1, [r5]
	movs r6, #1
	ands r1, r6
	lsls r1, r1, #1
	orrs r1, r3
	adds r0, r1, #0
	ands r0, r6
	lsls r0, r0, #7
	movs r3, #0x7f
	ands r2, r3
	orrs r2, r0
	mov r6, ip
	strb r2, [r6]
	lsrs r1, r1, #1
	adds r3, r7, #0
	adds r3, #0x30
	movs r0, #1
	ands r1, r0
	ldrb r2, [r3]
	subs r0, #3
	ands r0, r2
	orrs r0, r1
	ldrb r2, [r5]
	movs r1, #6
	ands r1, r2
	movs r5, #7
	rsbs r5, r5, #0
	ands r0, r5
	orrs r0, r1
	movs r1, #0x18
	ands r1, r2
	movs r6, #0x19
	rsbs r6, r6, #0
	ands r0, r6
	orrs r0, r1
	movs r1, #0x60
	ands r1, r2
	subs r5, #0x5a
	ands r0, r5
	orrs r0, r1
	lsrs r2, r2, #7
	lsls r2, r2, #7
	movs r6, #0x7f
	ands r0, r6
	orrs r0, r2
	strb r0, [r3]
	mov r0, sl
	adds r0, #0x31
	ldrb r2, [r0]
	lsls r1, r2, #0x1e
	adds r5, r7, #0
	adds r5, #0x31
	lsrs r1, r1, #0x1e
	ldrb r3, [r5]
	adds r0, r4, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0xc
	ands r1, r2
	mov r3, r8
	ands r0, r3
	orrs r0, r1
	movs r1, #0x30
	ands r1, r2
	subs r6, #0xb0
	ands r0, r6
	orrs r0, r1
	lsrs r2, r2, #6
	lsls r2, r2, #6
	movs r1, #0x3f
	ands r0, r1
	orrs r0, r2
	strb r0, [r5]
	mov r0, sl
	adds r0, #0x32
	ldrb r2, [r0]
	lsls r1, r2, #0x1e
	adds r5, #1
	lsrs r1, r1, #0x1e
	ldrb r3, [r5]
	adds r0, r4, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0xc
	ands r1, r2
	mov r3, r8
	ands r0, r3
	orrs r0, r1
	movs r1, #0x30
	ands r1, r2
	ands r0, r6
	orrs r0, r1
	lsrs r2, r2, #6
	lsls r2, r2, #6
	movs r6, #0x3f
	ands r0, r6
	orrs r0, r2
	strb r0, [r5]
	mov r0, sl
	adds r0, #0x33
	ldrb r1, [r0]
	lsls r0, r1, #0x1e
	adds r3, r7, #0
	adds r3, #0x33
	lsrs r0, r0, #0x1e
	ldrb r2, [r3]
	ands r4, r2
	orrs r4, r0
	movs r0, #0xc
	ands r0, r1
	mov r2, r8
	ands r4, r2
	orrs r4, r0
	movs r0, #0x30
	ands r0, r1
	movs r5, #0x31
	rsbs r5, r5, #0
	mov ip, r5
	ands r4, r5
	orrs r4, r0
	lsrs r1, r1, #6
	lsls r1, r1, #6
	ands r4, r6
	orrs r4, r1
	strb r4, [r3]
	mov r0, sl
	adds r0, #0x34
	ldrb r2, [r0]
	lsls r1, r2, #0x1e
	adds r4, r7, #0
	adds r4, #0x34
	lsrs r1, r1, #0x1e
	ldrb r3, [r4]
	adds r5, #0x2d
	adds r0, r5, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0xc
	ands r1, r2
	subs r6, #0x4c
	ands r0, r6
	orrs r0, r1
	movs r1, #0x30
	ands r1, r2
	mov r3, ip
	ands r0, r3
	orrs r0, r1
	lsrs r2, r2, #6
	lsls r2, r2, #6
	movs r6, #0x3f
	ands r0, r6
	orrs r0, r2
	strb r0, [r4]
	mov r0, sl
	adds r0, #0x35
	ldrb r2, [r0]
	lsls r1, r2, #0x1e
	adds r4, #1
	lsrs r1, r1, #0x1e
	ldrb r3, [r4]
	adds r0, r5, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0xc
	ands r1, r2
	movs r3, #0xd
	rsbs r3, r3, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0x30
	ands r1, r2
	mov r6, ip
	ands r0, r6
	orrs r0, r1
	b .L080D4E98
	.align 2, 0
.L080D4E90: .4byte 0xFFFFFE7F
.L080D4E94: .4byte 0xFFFC3FFF
.L080D4E98:
	lsrs r2, r2, #6
	lsls r2, r2, #6
	movs r1, #0x3f
	ands r0, r1
	orrs r0, r2
	strb r0, [r4]
	mov r0, sl
	adds r0, #0x36
	ldrb r3, [r0]
	lsls r1, r3, #0x1e
	adds r4, #1
	lsrs r1, r1, #0x1e
	ldrb r2, [r4]
	adds r0, r5, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #4
	ands r1, r3
	movs r2, #5
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #0x18
	ands r1, r3
	movs r6, #0x19
	rsbs r6, r6, #0
	ands r0, r6
	orrs r0, r1
	movs r1, #0x60
	ands r1, r3
	subs r2, #0x5c
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	mov r3, sl
	ldrh r0, [r3, #0x36]
	movs r1, #0xc0
	lsls r1, r1, #1
	ands r1, r0
	ldrh r2, [r7, #0x36]
	ldr r0, .L080D52D4 @ =0xFFFFFE7F
	ands r0, r2
	orrs r0, r1
	strh r0, [r7, #0x36]
	mov r0, sl
	adds r0, #0x37
	ldrb r3, [r0]
	movs r4, #0x37
	adds r4, r4, r7
	mov r8, r4
	movs r1, #6
	ands r1, r3
	ldrb r2, [r4]
	movs r0, #7
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #0x18
	ands r1, r3
	ands r0, r6
	orrs r0, r1
	movs r1, #0x60
	ands r1, r3
	subs r6, #0x48
	ands r0, r6
	orrs r0, r1
	lsrs r3, r3, #7
	mov r4, sl
	adds r4, #0x38
	ldrb r1, [r4]
	movs r2, #1
	ands r1, r2
	lsls r1, r1, #1
	orrs r1, r3
	adds r2, r1, #0
	movs r3, #1
	ands r2, r3
	lsls r2, r2, #7
	movs r6, #0x7f
	ands r0, r6
	orrs r0, r2
	mov r2, r8
	strb r0, [r2]
	lsrs r1, r1, #1
	ands r1, r3
	movs r3, #0x38
	adds r3, r3, r7
	mov r8, r3
	ldrb r2, [r3]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	orrs r1, r0
	ldrb r3, [r4]
	movs r0, #2
	ands r0, r3
	movs r2, #3
	rsbs r2, r2, #0
	ands r1, r2
	orrs r1, r0
	movs r0, #0xc
	ands r0, r3
	movs r4, #0xd
	rsbs r4, r4, #0
	ands r1, r4
	orrs r1, r0
	movs r0, #0x30
	ands r0, r3
	mov r6, ip
	ands r1, r6
	orrs r1, r0
	lsrs r3, r3, #6
	lsls r3, r3, #6
	movs r0, #0x3f
	ands r1, r0
	orrs r1, r3
	mov r2, r8
	strb r1, [r2]
	mov r0, sl
	adds r0, #0x39
	ldrb r2, [r0]
	lsls r1, r2, #0x1e
	adds r4, r7, #0
	adds r4, #0x39
	lsrs r1, r1, #0x1e
	ldrb r3, [r4]
	adds r0, r5, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0xc
	ands r1, r2
	movs r3, #0xd
	rsbs r3, r3, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0x30
	ands r1, r2
	ands r0, r6
	orrs r0, r1
	lsrs r2, r2, #6
	lsls r2, r2, #6
	movs r6, #0x3f
	ands r0, r6
	orrs r0, r2
	strb r0, [r4]
	mov r0, sl
	adds r0, #0x3a
	ldrb r3, [r0]
	lsls r1, r3, #0x1e
	adds r4, #1
	lsrs r1, r1, #0x1e
	ldrb r2, [r4]
	adds r0, r5, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #0x1c
	ands r1, r3
	movs r2, #0x1d
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #0x60
	ands r1, r3
	subs r2, #0x44
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	mov r3, sl
	ldrh r0, [r3, #0x3a]
	movs r1, #0xc0
	lsls r1, r1, #1
	ands r1, r0
	ldrh r2, [r7, #0x3a]
	ldr r0, .L080D52D4 @ =0xFFFFFE7F
	ands r0, r2
	orrs r0, r1
	strh r0, [r7, #0x3a]
	mov r0, sl
	adds r0, #0x3b
	ldrb r3, [r0]
	movs r4, #0x3b
	adds r4, r4, r7
	mov r8, r4
	movs r1, #6
	ands r1, r3
	ldrb r2, [r4]
	movs r0, #7
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #0x18
	ands r1, r3
	subs r6, #0x58
	ands r0, r6
	orrs r0, r1
	movs r1, #0x60
	ands r1, r3
	movs r2, #0x61
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r1
	lsrs r3, r3, #7
	mov r4, sl
	adds r4, #0x3c
	ldrb r1, [r4]
	movs r6, #1
	ands r1, r6
	lsls r1, r1, #1
	orrs r1, r3
	adds r2, r1, #0
	ands r2, r6
	lsls r2, r2, #7
	movs r3, #0x7f
	ands r0, r3
	orrs r0, r2
	mov r6, r8
	strb r0, [r6]
	lsrs r1, r1, #1
	movs r0, #1
	ands r1, r0
	adds r3, r7, #0
	adds r3, #0x3c
	ldrb r2, [r3]
	subs r0, #3
	ands r0, r2
	orrs r1, r0
	ldrb r2, [r4]
	movs r0, #6
	ands r0, r2
	movs r4, #7
	rsbs r4, r4, #0
	ands r1, r4
	orrs r1, r0
	movs r0, #0x18
	ands r0, r2
	movs r6, #0x19
	rsbs r6, r6, #0
	ands r1, r6
	orrs r1, r0
	movs r0, #0x60
	ands r0, r2
	movs r2, #0x61
	rsbs r2, r2, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3]
	mov r3, sl
	ldrh r0, [r3, #0x3c]
	movs r1, #0xe0
	lsls r1, r1, #2
	ands r1, r0
	ldrh r2, [r7, #0x3c]
	ldr r0, .L080D52D8 @ =0xFFFFFC7F
	ands r0, r2
	orrs r0, r1
	strh r0, [r7, #0x3c]
	mov r0, sl
	adds r0, #0x3d
	ldrb r3, [r0]
	adds r4, r7, #0
	adds r4, #0x3d
	movs r1, #0xc
	ands r1, r3
	ldrb r2, [r4]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #0x30
	ands r1, r3
	mov r6, ip
	ands r0, r6
	orrs r0, r1
	strb r0, [r4]
	mov r0, sl
	ldr r1, [r0, #0x3c]
	movs r0, #0xf0
	lsls r0, r0, #0xa
	ands r1, r0
	ldr r0, [r7, #0x3c]
	ldr r2, .L080D52DC @ =0xFFFC3FFF
	ands r0, r2
	orrs r0, r1
	str r0, [r7, #0x3c]
	mov r0, sl
	adds r0, #0x3e
	ldrb r2, [r0]
	adds r4, #1
	movs r1, #0xc
	ands r1, r2
	ldrb r3, [r4]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0x30
	ands r1, r2
	ands r0, r6
	orrs r0, r1
	lsrs r2, r2, #6
	lsls r2, r2, #6
	movs r3, #0x3f
	ands r0, r3
	orrs r0, r2
	strb r0, [r4]
	mov r0, sl
	adds r0, #0x3f
	ldrb r3, [r0]
	lsls r0, r3, #0x1e
	movs r4, #0x3f
	adds r4, r4, r7
	mov r8, r4
	lsrs r0, r0, #0x1e
	ldrb r2, [r4]
	adds r1, r5, #0
	ands r1, r2
	orrs r1, r0
	movs r0, #4
	ands r0, r3
	movs r6, #5
	rsbs r6, r6, #0
	ands r1, r6
	orrs r1, r0
	movs r0, #0x18
	ands r0, r3
	movs r2, #0x19
	rsbs r2, r2, #0
	ands r1, r2
	orrs r1, r0
	lsrs r3, r3, #5
	mov r4, sl
	adds r4, #0x40
	ldrb r0, [r4]
	movs r6, #1
	ands r0, r6
	lsls r0, r0, #3
	orrs r0, r3
	lsls r3, r3, #5
	movs r2, #0x1f
	ands r1, r2
	orrs r1, r3
	mov r2, r8
	strb r1, [r2]
	lsrs r0, r0, #3
	ands r0, r6
	adds r3, r7, #0
	adds r3, #0x40
	ldrb r1, [r3]
	movs r2, #2
	rsbs r2, r2, #0
	ands r2, r1
	orrs r0, r2
	ldrb r2, [r4]
	movs r1, #6
	ands r1, r2
	subs r6, #8
	ands r0, r6
	orrs r0, r1
	movs r1, #0x18
	ands r1, r2
	subs r6, #0x12
	ands r0, r6
	orrs r0, r1
	movs r1, #0x60
	ands r1, r2
	movs r2, #0x61
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	ldrh r1, [r4]
	movs r0, #0xc0
	lsls r0, r0, #1
	ands r0, r1
	ldrh r1, [r3]
	ldr r2, .L080D52D4 @ =0xFFFFFE7F
	ands r2, r1
	orrs r2, r0
	strh r2, [r3]
	mov r0, sl
	adds r0, #0x41
	ldrb r3, [r0]
	adds r4, r7, #0
	adds r4, #0x41
	movs r1, #6
	ands r1, r3
	ldrb r2, [r4]
	movs r0, #7
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #0x18
	ands r1, r3
	ands r0, r6
	orrs r0, r1
	strb r0, [r4]
	mov r3, sl
	ldr r2, [r3, #0x40]
	movs r0, #0xf0
	lsls r0, r0, #9
	ands r2, r0
	ldr r0, [r7, #0x40]
	ldr r1, .L080D52E0 @ =0xFFFE1FFF
	ands r0, r1
	orrs r0, r2
	str r0, [r7, #0x40]
	mov r0, sl
	adds r0, #0x42
	ldrb r1, [r0]
	adds r3, r7, #0
	adds r3, #0x42
	movs r0, #6
	ands r0, r1
	ldrb r2, [r3]
	movs r4, #7
	rsbs r4, r4, #0
	ands r4, r2
	orrs r4, r0
	movs r0, #0x18
	ands r0, r1
	ands r4, r6
	orrs r4, r0
	movs r0, #0x20
	ands r0, r1
	subs r6, #8
	ands r4, r6
	orrs r4, r0
	lsrs r1, r1, #6
	lsls r1, r1, #6
	movs r0, #0x3f
	mov r8, r0
	ands r4, r0
	orrs r4, r1
	strb r4, [r3]
	mov r0, sl
	adds r0, #0x43
	ldrb r2, [r0]
	lsls r1, r2, #0x1e
	adds r4, r7, #0
	adds r4, #0x43
	lsrs r1, r1, #0x1e
	ldrb r3, [r4]
	adds r0, r5, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0xc
	ands r1, r2
	movs r3, #0xd
	rsbs r3, r3, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0x30
	ands r1, r2
	subs r6, #0x10
	ands r0, r6
	orrs r0, r1
	lsrs r2, r2, #6
	lsls r2, r2, #6
	mov r1, r8
	ands r0, r1
	orrs r0, r2
	strb r0, [r4]
	mov r0, sl
	adds r0, #0x44
	ldrb r2, [r0]
	lsls r1, r2, #0x1e
	adds r4, #1
	lsrs r1, r1, #0x1e
	ldrb r3, [r4]
	adds r0, r5, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0xc
	ands r1, r2
	movs r3, #0xd
	rsbs r3, r3, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0x30
	ands r1, r2
	ands r0, r6
	orrs r0, r1
	lsrs r2, r2, #6
	lsls r2, r2, #6
	mov r6, r8
	ands r0, r6
	orrs r0, r2
	strb r0, [r4]
	mov r0, sl
	adds r0, #0x45
	ldrb r2, [r0]
	lsls r1, r2, #0x1e
	adds r4, #1
	lsrs r1, r1, #0x1e
	ldrb r3, [r4]
	adds r0, r5, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0xc
	ands r1, r2
	movs r3, #0xd
	rsbs r3, r3, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0x30
	ands r1, r2
	movs r6, #0x31
	rsbs r6, r6, #0
	ands r0, r6
	orrs r0, r1
	lsrs r2, r2, #6
	lsls r2, r2, #6
	mov r1, r8
	ands r0, r1
	orrs r0, r2
	strb r0, [r4]
	mov r0, sl
	adds r0, #0x46
	ldrb r2, [r0]
	lsls r1, r2, #0x1e
	adds r4, #1
	lsrs r1, r1, #0x1e
	ldrb r3, [r4]
	adds r0, r5, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0xc
	ands r1, r2
	movs r3, #0xd
	rsbs r3, r3, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0x30
	ands r1, r2
	ands r0, r6
	orrs r0, r1
	lsrs r2, r2, #6
	lsls r2, r2, #6
	mov r6, r8
	ands r0, r6
	b .L080D52E4
	.align 2, 0
.L080D52D4: .4byte 0xFFFFFE7F
.L080D52D8: .4byte 0xFFFFFC7F
.L080D52DC: .4byte 0xFFFC3FFF
.L080D52E0: .4byte 0xFFFE1FFF
.L080D52E4:
	orrs r0, r2
	strb r0, [r4]
	mov r0, sl
	adds r0, #0x47
	ldrb r2, [r0]
	lsls r1, r2, #0x1e
	adds r4, #1
	lsrs r1, r1, #0x1e
	ldrb r3, [r4]
	adds r0, r5, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0xc
	ands r1, r2
	movs r3, #0xd
	rsbs r3, r3, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0x30
	ands r1, r2
	movs r6, #0x31
	rsbs r6, r6, #0
	ands r0, r6
	orrs r0, r1
	lsrs r2, r2, #6
	lsls r2, r2, #6
	mov r1, r8
	ands r0, r1
	orrs r0, r2
	strb r0, [r4]
	mov r0, sl
	adds r0, #0x48
	ldrb r2, [r0]
	lsls r1, r2, #0x1e
	adds r4, #1
	lsrs r1, r1, #0x1e
	ldrb r3, [r4]
	adds r0, r5, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0xc
	ands r1, r2
	movs r3, #0xd
	rsbs r3, r3, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0x30
	ands r1, r2
	ands r0, r6
	orrs r0, r1
	lsrs r2, r2, #6
	lsls r2, r2, #6
	mov r6, r8
	ands r0, r6
	orrs r0, r2
	strb r0, [r4]
	mov r0, sl
	adds r0, #0x49
	ldrb r2, [r0]
	lsls r1, r2, #0x1e
	adds r4, #1
	lsrs r1, r1, #0x1e
	ldrb r3, [r4]
	adds r0, r5, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0xc
	ands r1, r2
	movs r3, #0xd
	rsbs r3, r3, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0x30
	ands r1, r2
	movs r6, #0x31
	rsbs r6, r6, #0
	ands r0, r6
	orrs r0, r1
	lsrs r2, r2, #6
	lsls r2, r2, #6
	mov r1, r8
	ands r0, r1
	orrs r0, r2
	strb r0, [r4]
	mov r0, sl
	adds r0, #0x4a
	ldrb r2, [r0]
	lsls r1, r2, #0x1e
	adds r4, #1
	lsrs r1, r1, #0x1e
	ldrb r3, [r4]
	adds r0, r5, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0xc
	ands r1, r2
	movs r3, #0xd
	rsbs r3, r3, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0x30
	ands r1, r2
	ands r0, r6
	orrs r0, r1
	lsrs r2, r2, #6
	lsls r2, r2, #6
	mov r6, r8
	ands r0, r6
	orrs r0, r2
	strb r0, [r4]
	mov r0, sl
	adds r0, #0x4b
	ldrb r2, [r0]
	lsls r1, r2, #0x1e
	adds r4, #1
	lsrs r1, r1, #0x1e
	ldrb r3, [r4]
	adds r0, r5, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0xc
	ands r1, r2
	movs r3, #0xd
	rsbs r3, r3, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0x30
	ands r1, r2
	movs r6, #0x31
	rsbs r6, r6, #0
	ands r0, r6
	orrs r0, r1
	lsrs r2, r2, #6
	lsls r2, r2, #6
	mov r1, r8
	ands r0, r1
	orrs r0, r2
	strb r0, [r4]
	mov r0, sl
	adds r0, #0x4c
	ldrb r2, [r0]
	lsls r1, r2, #0x1e
	adds r4, #1
	lsrs r1, r1, #0x1e
	ldrb r3, [r4]
	adds r0, r5, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0xc
	ands r1, r2
	movs r3, #0xd
	rsbs r3, r3, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0x30
	ands r1, r2
	ands r0, r6
	orrs r0, r1
	lsrs r2, r2, #6
	lsls r2, r2, #6
	mov r6, r8
	ands r0, r6
	orrs r0, r2
	strb r0, [r4]
	mov r0, sl
	adds r0, #0x4d
	ldrb r3, [r0]
	lsls r1, r3, #0x1e
	adds r4, #1
	lsrs r1, r1, #0x1e
	ldrb r2, [r4]
	adds r0, r5, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #4
	ands r1, r3
	movs r2, #5
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #8
	ands r1, r3
	movs r6, #9
	rsbs r6, r6, #0
	ands r0, r6
	orrs r0, r1
	movs r1, #0x10
	ands r1, r3
	subs r2, #0xc
	ands r0, r2
	orrs r0, r1
	movs r1, #0x20
	ands r1, r3
	subs r6, #0x18
	ands r0, r6
	orrs r0, r1
	movs r1, #0x40
	ands r1, r3
	subs r2, #0x30
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	mov r3, sl
	ldr r2, [r3, #0x4c]
	movs r4, #3
	mov r8, r4
	movs r0, #0xc0
	lsls r0, r0, #9
	ands r2, r0
	ldr r0, [r7, #0x4c]
	ldr r1, .L080D5874 @ =0xFFFE7FFF
	ands r0, r1
	orrs r0, r2
	str r0, [r7, #0x4c]
	movs r6, #0x4e
	add r6, sl
	mov sb, r6
	ldrb r3, [r6]
	adds r4, r7, #0
	adds r4, #0x4e
	movs r1, #2
	ands r1, r3
	ldrb r2, [r4]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #0xc
	ands r1, r3
	movs r2, #0xd
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #0x10
	ands r1, r3
	movs r6, #0x11
	rsbs r6, r6, #0
	ands r0, r6
	orrs r0, r1
	movs r1, #0x60
	ands r1, r3
	subs r2, #0x54
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	mov r3, sb
	ldrh r0, [r3]
	movs r1, #0xc0
	lsls r1, r1, #1
	ands r1, r0
	ldrh r2, [r4]
	ldr r0, .L080D5878 @ =0xFFFFFE7F
	ands r0, r2
	orrs r0, r1
	strh r0, [r4]
	mov r0, sl
	adds r0, #0x4f
	ldrb r3, [r0]
	movs r4, #0x4f
	adds r4, r4, r7
	mov ip, r4
	movs r1, #0xe
	ands r1, r3
	ldrb r2, [r4]
	movs r0, #0xf
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #0x30
	ands r1, r3
	subs r6, #0x20
	ands r0, r6
	orrs r0, r1
	movs r1, #0x40
	ands r1, r3
	movs r2, #0x41
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r1
	lsrs r3, r3, #7
	mov r4, sl
	adds r4, #0x50
	ldrb r2, [r4]
	mov r6, r8
	ands r2, r6
	lsls r2, r2, #1
	orrs r2, r3
	adds r1, r2, #0
	movs r3, #1
	ands r1, r3
	lsls r1, r1, #7
	movs r6, #0x7f
	ands r0, r6
	orrs r0, r1
	mov r1, ip
	strb r0, [r1]
	lsrs r2, r2, #1
	adds r3, r7, #0
	adds r3, #0x50
	mov r6, r8
	ands r2, r6
	ldrb r1, [r3]
	adds r0, r5, #0
	ands r0, r1
	orrs r0, r2
	ldrb r2, [r4]
	movs r1, #0xc
	ands r1, r2
	movs r4, #0xd
	rsbs r4, r4, #0
	ands r0, r4
	orrs r0, r1
	movs r1, #0x10
	ands r1, r2
	movs r6, #0x11
	rsbs r6, r6, #0
	ands r0, r6
	orrs r0, r1
	movs r1, #0x60
	ands r1, r2
	subs r4, #0x54
	ands r0, r4
	orrs r0, r1
	lsrs r2, r2, #7
	lsls r2, r2, #7
	movs r6, #0x7f
	ands r0, r6
	orrs r0, r2
	strb r0, [r3]
	mov r0, sl
	adds r0, #0x51
	ldrb r2, [r0]
	lsls r1, r2, #0x1e
	adds r4, r7, #0
	adds r4, #0x51
	lsrs r1, r1, #0x1e
	ldrb r3, [r4]
	adds r0, r5, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #4
	ands r1, r2
	movs r3, #5
	rsbs r3, r3, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0x18
	ands r1, r2
	subs r6, #0x98
	ands r0, r6
	orrs r0, r1
	movs r1, #0x20
	ands r1, r2
	subs r3, #0x1c
	ands r0, r3
	orrs r0, r1
	lsrs r2, r2, #6
	lsls r2, r2, #6
	movs r6, #0x3f
	mov ip, r6
	ands r0, r6
	orrs r0, r2
	strb r0, [r4]
	mov r0, sl
	adds r0, #0x52
	str r0, [sp, #8]
	ldrb r3, [r0]
	lsls r1, r3, #0x1f
	lsrs r1, r1, #0x1f
	adds r4, #1
	ldrb r2, [r4]
	subs r6, #0x41
	mov r8, r6
	mov r0, r8
	ands r0, r2
	orrs r1, r0
	movs r0, #6
	ands r0, r3
	movs r2, #7
	rsbs r2, r2, #0
	ands r1, r2
	orrs r1, r0
	movs r0, #8
	ands r0, r3
	subs r6, #7
	ands r1, r6
	orrs r1, r0
	movs r0, #0x30
	ands r0, r3
	subs r2, #0x2a
	ands r1, r2
	orrs r1, r0
	strb r1, [r4]
	ldr r3, [sp, #8]
	ldrh r0, [r3]
	movs r1, #0xe0
	lsls r1, r1, #1
	ands r1, r0
	ldrh r2, [r4]
	ldr r0, .L080D587C @ =0xFFFFFE3F
	ands r0, r2
	orrs r0, r1
	strh r0, [r4]
	mov r0, sl
	adds r0, #0x53
	ldrb r2, [r0]
	adds r4, #1
	movs r1, #6
	ands r1, r2
	ldrb r3, [r4]
	movs r0, #7
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #8
	ands r1, r2
	ands r0, r6
	orrs r0, r1
	movs r1, #0x30
	ands r1, r2
	subs r6, #0x28
	ands r0, r6
	orrs r0, r1
	lsrs r2, r2, #6
	lsls r2, r2, #6
	mov r1, ip
	ands r0, r1
	orrs r0, r2
	strb r0, [r4]
	mov r0, sl
	adds r0, #0x54
	ldrb r2, [r0]
	lsls r1, r2, #0x1e
	adds r4, #1
	lsrs r1, r1, #0x1e
	ldrb r3, [r4]
	adds r0, r5, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #4
	ands r1, r2
	movs r3, #5
	rsbs r3, r3, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #8
	ands r1, r2
	adds r6, #0x28
	ands r0, r6
	orrs r0, r1
	movs r1, #0x10
	ands r1, r2
	subs r3, #0xc
	ands r0, r3
	orrs r0, r1
	movs r1, #0x60
	ands r1, r2
	subs r6, #0x58
	ands r0, r6
	orrs r0, r1
	lsrs r2, r2, #7
	lsls r2, r2, #7
	movs r1, #0x7f
	ands r0, r1
	orrs r0, r2
	strb r0, [r4]
	mov r0, sl
	adds r0, #0x55
	ldrb r2, [r0]
	lsls r1, r2, #0x1e
	adds r4, #1
	lsrs r1, r1, #0x1e
	ldrb r3, [r4]
	adds r0, r5, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #4
	ands r1, r2
	movs r3, #5
	rsbs r3, r3, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0x18
	ands r1, r2
	adds r6, #0x48
	ands r0, r6
	orrs r0, r1
	movs r1, #0x20
	ands r1, r2
	subs r3, #0x1c
	ands r0, r3
	orrs r0, r1
	lsrs r2, r2, #6
	lsls r2, r2, #6
	mov r6, ip
	ands r0, r6
	orrs r0, r2
	strb r0, [r4]
	mov r0, sl
	adds r0, #0x56
	ldrb r2, [r0]
	lsls r1, r2, #0x1f
	lsrs r1, r1, #0x1f
	adds r4, #1
	ldrb r3, [r4]
	mov r0, r8
	ands r0, r3
	orrs r1, r0
	movs r0, #6
	ands r0, r2
	movs r3, #7
	rsbs r3, r3, #0
	ands r1, r3
	orrs r1, r0
	movs r0, #8
	ands r0, r2
	movs r6, #9
	rsbs r6, r6, #0
	ands r1, r6
	orrs r1, r0
	movs r0, #0x30
	ands r0, r2
	subs r3, #0x2a
	ands r1, r3
	orrs r1, r0
	lsrs r2, r2, #6
	lsls r2, r2, #6
	mov r6, ip
	ands r1, r6
	orrs r1, r2
	strb r1, [r4]
	mov r0, sl
	adds r0, #0x57
	ldrb r3, [r0]
	lsls r0, r3, #0x1e
	movs r1, #0x57
	adds r1, r1, r7
	mov ip, r1
	lsrs r0, r0, #0x1e
	ldrb r2, [r1]
	adds r1, r5, #0
	ands r1, r2
	orrs r1, r0
	movs r0, #0xc
	ands r0, r3
	movs r2, #0xd
	rsbs r2, r2, #0
	ands r1, r2
	orrs r1, r0
	movs r0, #0x30
	ands r0, r3
	movs r4, #0x31
	rsbs r4, r4, #0
	ands r1, r4
	orrs r1, r0
	movs r0, #0x40
	ands r0, r3
	movs r6, #0x41
	rsbs r6, r6, #0
	ands r1, r6
	orrs r1, r0
	lsrs r3, r3, #7
	mov r4, sl
	adds r4, #0x58
	ldrb r0, [r4]
	movs r2, #1
	ands r0, r2
	lsls r0, r0, #1
	orrs r0, r3
	adds r2, r0, #0
	movs r3, #1
	ands r2, r3
	lsls r2, r2, #7
	movs r6, #0x7f
	ands r1, r6
	orrs r1, r2
	mov r2, ip
	strb r1, [r2]
	lsrs r0, r0, #1
	ands r0, r3
	adds r3, r7, #0
	adds r3, #0x58
	ldrb r2, [r3]
	mov r1, r8
	ands r1, r2
	orrs r0, r1
	ldrb r2, [r4]
	movs r1, #2
	ands r1, r2
	movs r4, #3
	rsbs r4, r4, #0
	ands r0, r4
	orrs r0, r1
	movs r1, #0xc
	ands r1, r2
	subs r6, #0x8c
	ands r0, r6
	orrs r0, r1
	movs r1, #0x10
	ands r1, r2
	subs r4, #0xe
	ands r0, r4
	orrs r0, r1
	movs r1, #0x60
	ands r1, r2
	subs r6, #0x54
	ands r0, r6
	orrs r0, r1
	lsrs r2, r2, #7
	lsls r2, r2, #7
	movs r1, #0x7f
	ands r0, r1
	orrs r0, r2
	strb r0, [r3]
	mov r0, sl
	adds r0, #0x59
	ldrb r3, [r0]
	lsls r1, r3, #0x1e
	adds r4, r7, #0
	adds r4, #0x59
	lsrs r1, r1, #0x1e
	ldrb r2, [r4]
	adds r0, r5, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #4
	ands r1, r3
	movs r2, #5
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #0x18
	ands r1, r3
	adds r6, #0x48
	ands r0, r6
	orrs r0, r1
	movs r1, #0x60
	ands r1, r3
	subs r2, #0x5c
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	mov r3, sl
	ldr r2, [r3, #0x58]
	movs r0, #0xe0
	lsls r0, r0, #0xa
	ands r2, r0
	ldr r0, [r7, #0x58]
	ldr r1, .L080D5880 @ =0xFFFC7FFF
	ands r0, r1
	orrs r0, r2
	str r0, [r7, #0x58]
	movs r4, #0x5a
	add r4, sl
	mov ip, r4
	ldrb r3, [r4]
	adds r4, r7, #0
	adds r4, #0x5a
	movs r1, #4
	ands r1, r3
	ldrb r2, [r4]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #8
	ands r1, r3
	adds r6, #0x10
	ands r0, r6
	orrs r0, r1
	movs r1, #0x10
	ands r1, r3
	movs r2, #0x11
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #0x20
	ands r1, r3
	subs r6, #0x18
	ands r0, r6
	orrs r0, r1
	movs r1, #0x40
	ands r1, r3
	subs r2, #0x30
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	mov r3, ip
	ldrh r1, [r3]
	movs r0, #0xc0
	lsls r0, r0, #1
	ands r0, r1
	ldrh r1, [r4]
	ldr r6, .L080D5878 @ =0xFFFFFE7F
	ands r6, r1
	orrs r6, r0
	strh r6, [r4]
	mov r0, sl
	adds r0, #0x5b
	ldrb r3, [r0]
	movs r1, #0x5b
	adds r1, r1, r7
	mov sb, r1
	movs r1, #6
	ands r1, r3
	mov r4, sb
	ldrb r2, [r4]
	movs r0, #7
	rsbs r0, r0, #0
	ands r0, r2
	b .L080D5884
	.align 2, 0
.L080D5874: .4byte 0xFFFE7FFF
.L080D5878: .4byte 0xFFFFFE7F
.L080D587C: .4byte 0xFFFFFE3F
.L080D5880: .4byte 0xFFFC7FFF
.L080D5884:
	orrs r0, r1
	movs r1, #0x18
	ands r1, r3
	movs r6, #0x19
	rsbs r6, r6, #0
	ands r0, r6
	orrs r0, r1
	movs r1, #0x60
	ands r1, r3
	movs r2, #0x61
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r1
	lsrs r3, r3, #7
	mov r4, sl
	adds r4, #0x5c
	ldrb r2, [r4]
	movs r6, #1
	ands r2, r6
	lsls r2, r2, #1
	orrs r2, r3
	adds r1, r2, #0
	ands r1, r6
	lsls r1, r1, #7
	movs r3, #0x7f
	ands r0, r3
	orrs r0, r1
	mov r6, sb
	strb r0, [r6]
	lsrs r2, r2, #1
	adds r3, r7, #0
	adds r3, #0x5c
	movs r0, #1
	ands r2, r0
	ldrb r1, [r3]
	mov r0, r8
	ands r0, r1
	orrs r0, r2
	ldrb r2, [r4]
	movs r1, #6
	ands r1, r2
	movs r4, #7
	rsbs r4, r4, #0
	ands r0, r4
	orrs r0, r1
	movs r1, #0x18
	ands r1, r2
	movs r6, #0x19
	rsbs r6, r6, #0
	ands r0, r6
	orrs r0, r1
	lsrs r2, r2, #5
	lsls r2, r2, #5
	movs r1, #0x1f
	ands r0, r1
	orrs r0, r2
	strb r0, [r3]
	mov r0, sl
	adds r0, #0x5d
	ldrb r2, [r0]
	lsls r1, r2, #0x1e
	adds r4, r7, #0
	adds r4, #0x5d
	lsrs r1, r1, #0x1e
	ldrb r3, [r4]
	adds r0, r5, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0xc
	ands r1, r2
	movs r3, #0xd
	rsbs r3, r3, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0x10
	ands r1, r2
	adds r6, #8
	ands r0, r6
	orrs r0, r1
	movs r1, #0x20
	ands r1, r2
	subs r3, #0x14
	ands r0, r3
	orrs r0, r1
	movs r1, #0x40
	ands r1, r2
	subs r6, #0x30
	ands r0, r6
	orrs r0, r1
	lsrs r2, r2, #7
	lsls r2, r2, #7
	movs r1, #0x7f
	ands r0, r1
	orrs r0, r2
	strb r0, [r4]
	mov r0, sl
	adds r0, #0x5e
	ldrb r2, [r0]
	lsls r0, r2, #0x1f
	lsrs r0, r0, #0x1f
	adds r4, #1
	ldrb r3, [r4]
	mov r1, r8
	ands r1, r3
	orrs r0, r1
	movs r1, #2
	ands r1, r2
	movs r3, #3
	rsbs r3, r3, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #4
	ands r1, r2
	adds r6, #0x3c
	ands r0, r6
	orrs r0, r1
	movs r1, #8
	ands r1, r2
	subs r3, #6
	ands r0, r3
	orrs r0, r1
	movs r1, #0x10
	ands r1, r2
	subs r6, #0xc
	ands r0, r6
	orrs r0, r1
	movs r1, #0x20
	ands r1, r2
	subs r3, #0x18
	ands r0, r3
	orrs r0, r1
	movs r1, #0x40
	ands r1, r2
	subs r6, #0x30
	ands r0, r6
	orrs r0, r1
	lsrs r2, r2, #7
	lsls r2, r2, #7
	movs r1, #0x7f
	ands r0, r1
	orrs r0, r2
	strb r0, [r4]
	mov r0, sl
	adds r0, #0x5f
	ldrb r2, [r0]
	lsls r0, r2, #0x1f
	lsrs r0, r0, #0x1f
	adds r3, r7, #0
	adds r3, #0x5f
	ldrb r1, [r3]
	mov r4, r8
	ands r4, r1
	orrs r0, r4
	movs r1, #2
	ands r1, r2
	adds r6, #0x3e
	ands r0, r6
	orrs r0, r1
	movs r1, #4
	ands r1, r2
	movs r4, #5
	rsbs r4, r4, #0
	ands r0, r4
	orrs r0, r1
	movs r1, #8
	ands r1, r2
	subs r6, #6
	ands r0, r6
	orrs r0, r1
	movs r1, #0x30
	ands r1, r2
	subs r4, #0x2c
	mov ip, r4
	ands r0, r4
	orrs r0, r1
	lsrs r2, r2, #6
	lsls r2, r2, #6
	movs r6, #0x3f
	ands r0, r6
	orrs r0, r2
	strb r0, [r3]
	mov r0, sl
	adds r0, #0x60
	ldrb r2, [r0]
	lsls r1, r2, #0x1e
	adds r4, r7, #0
	adds r4, #0x60
	lsrs r1, r1, #0x1e
	ldrb r3, [r4]
	adds r0, r5, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0xc
	ands r1, r2
	movs r3, #0xd
	rsbs r3, r3, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0x30
	ands r1, r2
	mov r6, ip
	ands r0, r6
	orrs r0, r1
	lsrs r2, r2, #6
	lsls r2, r2, #6
	movs r1, #0x3f
	ands r0, r1
	orrs r0, r2
	strb r0, [r4]
	mov r0, sl
	adds r0, #0x61
	ldrb r1, [r0]
	lsls r0, r1, #0x1e
	adds r3, r7, #0
	adds r3, #0x61
	lsrs r0, r0, #0x1e
	ldrb r2, [r3]
	ands r5, r2
	orrs r5, r0
	movs r0, #0xc
	ands r0, r1
	movs r2, #0xd
	rsbs r2, r2, #0
	ands r5, r2
	orrs r5, r0
	movs r0, #0x30
	ands r0, r1
	ands r5, r6
	orrs r5, r0
	lsrs r1, r1, #6
	lsls r1, r1, #6
	movs r4, #0x3f
	ands r5, r4
	orrs r5, r1
	strb r5, [r3]
	mov r0, sl
	adds r0, #0x62
	ldrb r2, [r0]
	lsls r1, r2, #0x1e
	movs r5, #0x62
	adds r5, r5, r7
	mov r8, r5
	lsrs r1, r1, #0x1e
	ldrb r3, [r5]
	subs r4, #0x43
	adds r0, r4, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0xc
	ands r1, r2
	movs r5, #0xd
	rsbs r5, r5, #0
	ands r0, r5
	orrs r0, r1
	movs r1, #0x30
	ands r1, r2
	ands r0, r6
	orrs r0, r1
	lsrs r2, r2, #6
	lsls r2, r2, #6
	movs r6, #0x3f
	ands r0, r6
	orrs r0, r2
	mov r1, r8
	strb r0, [r1]
	mov r0, sl
	adds r0, #0x63
	ldrb r2, [r0]
	lsls r1, r2, #0x1e
	movs r3, #0x63
	adds r3, r3, r7
	mov r8, r3
	lsrs r1, r1, #0x1e
	ldrb r3, [r3]
	adds r0, r4, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0xc
	ands r1, r2
	ands r0, r5
	orrs r0, r1
	movs r1, #0x30
	ands r1, r2
	mov r6, ip
	ands r0, r6
	orrs r0, r1
	lsrs r2, r2, #6
	lsls r2, r2, #6
	movs r1, #0x3f
	ands r0, r1
	orrs r0, r2
	mov r2, r8
	strb r0, [r2]
	mov r0, sl
	adds r0, #0x64
	ldrb r2, [r0]
	lsls r1, r2, #0x1e
	movs r3, #0x64
	adds r3, r3, r7
	mov r8, r3
	lsrs r1, r1, #0x1e
	ldrb r3, [r3]
	adds r0, r4, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0xc
	ands r1, r2
	ands r0, r5
	orrs r0, r1
	movs r1, #0x30
	ands r1, r2
	ands r0, r6
	orrs r0, r1
	lsrs r2, r2, #6
	lsls r2, r2, #6
	movs r6, #0x3f
	ands r0, r6
	orrs r0, r2
	mov r1, r8
	strb r0, [r1]
	mov r0, sl
	adds r0, #0x65
	ldrb r2, [r0]
	lsls r1, r2, #0x1e
	movs r3, #0x65
	adds r3, r3, r7
	mov r8, r3
	lsrs r1, r1, #0x1e
	ldrb r3, [r3]
	adds r0, r4, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0xc
	ands r1, r2
	ands r0, r5
	orrs r0, r1
	movs r1, #0x30
	ands r1, r2
	mov r6, ip
	ands r0, r6
	orrs r0, r1
	lsrs r2, r2, #6
	lsls r2, r2, #6
	movs r1, #0x3f
	ands r0, r1
	orrs r0, r2
	mov r2, r8
	strb r0, [r2]
	mov r0, sl
	adds r0, #0x66
	ldrb r2, [r0]
	lsls r1, r2, #0x1e
	movs r3, #0x66
	adds r3, r3, r7
	mov r8, r3
	lsrs r1, r1, #0x1e
	ldrb r3, [r3]
	adds r0, r4, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0xc
	ands r1, r2
	ands r0, r5
	orrs r0, r1
	movs r1, #0x30
	ands r1, r2
	ands r0, r6
	orrs r0, r1
	lsrs r2, r2, #6
	lsls r2, r2, #6
	movs r6, #0x3f
	ands r0, r6
	orrs r0, r2
	mov r1, r8
	strb r0, [r1]
	mov r0, sl
	adds r0, #0x67
	ldrb r2, [r0]
	lsls r1, r2, #0x1e
	movs r3, #0x67
	adds r3, r3, r7
	mov r8, r3
	lsrs r1, r1, #0x1e
	ldrb r3, [r3]
	adds r0, r4, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0xc
	ands r1, r2
	ands r0, r5
	orrs r0, r1
	movs r1, #0x30
	ands r1, r2
	mov r6, ip
	ands r0, r6
	orrs r0, r1
	lsrs r2, r2, #6
	lsls r2, r2, #6
	movs r1, #0x3f
	ands r0, r1
	orrs r0, r2
	mov r2, r8
	strb r0, [r2]
	movs r3, #0x68
	add r3, sl
	mov r8, r3
	ldrb r2, [r3]
	lsls r0, r2, #0x1e
	adds r3, r7, #0
	adds r3, #0x68
	lsrs r0, r0, #0x1e
	ldrb r1, [r3]
	ands r4, r1
	orrs r4, r0
	movs r0, #0xc
	ands r0, r2
	ands r4, r5
	orrs r4, r0
	movs r0, #0x30
	ands r0, r2
	ands r4, r6
	orrs r4, r0
	strb r4, [r3]
	mov r4, r8
	ldrh r0, [r4]
	movs r1, #0xff
	lsls r1, r1, #6
	ands r1, r0
	ldrh r2, [r3]
	ldr r4, .L080D5FC8 @ =0xFFFFC03F
	adds r0, r4, #0
	ands r0, r2
	orrs r0, r1
	strh r0, [r3]
	mov r5, sl
	ldr r1, [r5, #0x68]
	movs r0, #0xff
	lsls r0, r0, #0xe
	ands r1, r0
	ldr r0, [r7, #0x68]
	ldr r6, .L080D5FCC @ =0xFFC03FFF
	ands r0, r6
	orrs r0, r1
	str r0, [r7, #0x68]
	mov r0, sl
	adds r0, #0x6a
	ldrh r0, [r0]
	adds r3, #2
	movs r1, #0xff
	lsls r1, r1, #6
	ands r1, r0
	ldrh r2, [r3]
	adds r0, r4, #0
	ands r0, r2
	orrs r0, r1
	strh r0, [r3]
	mov r0, sl
	adds r0, #0x6b
	ldrb r0, [r0]
	lsrs r0, r0, #6
	movs r1, #0x6c
	add r1, sl
	mov r8, r1
	ldrb r1, [r1]
	movs r2, #0x3f
	ands r1, r2
	lsls r1, r1, #2
	orrs r1, r0
	adds r2, r1, #0
	movs r3, #3
	ands r2, r3
	adds r5, r7, #0
	adds r5, #0x6b
	lsls r2, r2, #6
	ldrb r3, [r5]
	movs r0, #0x3f
	ands r0, r3
	orrs r0, r2
	strb r0, [r5]
	lsrs r1, r1, #2
	adds r3, r7, #0
	adds r3, #0x6c
	movs r5, #0x3f
	ands r1, r5
	ldrb r2, [r3]
	subs r5, #0x7f
	adds r0, r5, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	mov r6, r8
	ldrh r0, [r6]
	movs r1, #0xff
	lsls r1, r1, #6
	ands r1, r0
	ldrh r2, [r3]
	adds r0, r4, #0
	ands r0, r2
	orrs r0, r1
	strh r0, [r3]
	mov r0, sl
	ldr r1, [r0, #0x6c]
	movs r0, #0xff
	lsls r0, r0, #0xe
	ands r1, r0
	ldr r0, [r7, #0x6c]
	ldr r2, .L080D5FCC @ =0xFFC03FFF
	ands r0, r2
	orrs r0, r1
	str r0, [r7, #0x6c]
	mov r0, sl
	adds r0, #0x6e
	ldrh r0, [r0]
	adds r3, #2
	movs r1, #0xff
	lsls r1, r1, #6
	ands r1, r0
	ldrh r2, [r3]
	adds r0, r4, #0
	ands r0, r2
	orrs r0, r1
	strh r0, [r3]
	mov r0, sl
	adds r0, #0x6f
	ldrb r0, [r0]
	lsrs r0, r0, #6
	movs r3, #0x70
	add r3, sl
	mov r8, r3
	ldrb r1, [r3]
	movs r6, #0x3f
	ands r1, r6
	lsls r1, r1, #2
	orrs r1, r0
	adds r2, r1, #0
	movs r0, #3
	ands r2, r0
	movs r3, #0x6f
	adds r3, r3, r7
	mov ip, r3
	lsls r2, r2, #6
	ldrb r3, [r3]
	movs r0, #0x3f
	ands r0, r3
	orrs r0, r2
	mov r6, ip
	strb r0, [r6]
	lsrs r1, r1, #2
	adds r3, r7, #0
	adds r3, #0x70
	movs r0, #0x3f
	ands r1, r0
	ldrb r2, [r3]
	adds r0, r5, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	mov r1, r8
	ldrh r0, [r1]
	movs r1, #0xff
	lsls r1, r1, #6
	ands r1, r0
	ldrh r2, [r3]
	adds r0, r4, #0
	ands r0, r2
	orrs r0, r1
	strh r0, [r3]
	mov r2, sl
	ldr r1, [r2, #0x70]
	movs r0, #0xff
	lsls r0, r0, #0xe
	ands r1, r0
	ldr r0, [r7, #0x70]
	ldr r3, .L080D5FCC @ =0xFFC03FFF
	ands r0, r3
	orrs r0, r1
	str r0, [r7, #0x70]
	mov r0, sl
	adds r0, #0x72
	ldrh r1, [r0]
	adds r2, r7, #0
	adds r2, #0x72
	movs r0, #0xff
	lsls r0, r0, #6
	ands r0, r1
	ldrh r1, [r2]
	ands r4, r1
	orrs r4, r0
	strh r4, [r2]
	mov r0, sl
	adds r0, #0x73
	ldrb r0, [r0]
	lsrs r0, r0, #6
	mov r4, sl
	adds r4, #0x74
	ldrb r1, [r4]
	movs r6, #0x3f
	ands r1, r6
	lsls r1, r1, #2
	orrs r1, r0
	adds r2, r1, #0
	movs r0, #3
	ands r2, r0
	movs r3, #0x73
	adds r3, r3, r7
	mov r8, r3
	lsls r2, r2, #6
	ldrb r3, [r3]
	movs r0, #0x3f
	ands r0, r3
	orrs r0, r2
	mov r6, r8
	strb r0, [r6]
	lsrs r1, r1, #2
	adds r3, r7, #0
	adds r3, #0x74
	movs r0, #0x3f
	ands r1, r0
	ldrb r0, [r3]
	ands r5, r0
	orrs r5, r1
	strb r5, [r3]
	ldrh r0, [r4]
	movs r1, #0xe0
	lsls r1, r1, #1
	ands r1, r0
	ldrh r2, [r3]
	ldr r0, .L080D5FD0 @ =0xFFFFFE3F
	ands r0, r2
	orrs r0, r1
	strh r0, [r3]
	mov r0, sl
	adds r0, #0x75
	ldrb r2, [r0]
	adds r4, r7, #0
	adds r4, #0x75
	movs r1, #6
	ands r1, r2
	ldrb r3, [r4]
	movs r0, #7
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #8
	ands r1, r2
	movs r3, #9
	rsbs r3, r3, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0x10
	ands r1, r2
	movs r5, #0x11
	rsbs r5, r5, #0
	ands r0, r5
	orrs r0, r1
	movs r1, #0x20
	ands r1, r2
	movs r6, #0x21
	rsbs r6, r6, #0
	mov r8, r6
	ands r0, r6
	orrs r0, r1
	movs r1, #0x40
	ands r1, r2
	subs r3, #0x38
	ands r0, r3
	orrs r0, r1
	lsrs r2, r2, #7
	lsls r2, r2, #7
	movs r5, #0x7f
	ands r0, r5
	orrs r0, r2
	strb r0, [r4]
	mov r6, sl
	adds r6, #0x76
	str r6, [sp, #0x10]
	ldrb r2, [r6]
	lsls r1, r2, #0x1f
	lsrs r1, r1, #0x1f
	adds r4, #1
	ldrb r3, [r4]
	subs r5, #0x81
	adds r0, r5, #0
	ands r0, r3
	orrs r1, r0
	movs r0, #2
	ands r0, r2
	movs r3, #3
	rsbs r3, r3, #0
	mov ip, r3
	ands r1, r3
	orrs r1, r0
	movs r0, #4
	ands r0, r2
	movs r6, #5
	rsbs r6, r6, #0
	ands r1, r6
	orrs r1, r0
	movs r0, #8
	ands r0, r2
	subs r3, #6
	ands r1, r3
	orrs r1, r0
	movs r0, #0x10
	ands r0, r2
	subs r6, #0xc
	ands r1, r6
	orrs r1, r0
	movs r0, #0x20
	ands r0, r2
	mov r3, r8
	ands r1, r3
	orrs r1, r0
	movs r0, #0x40
	ands r0, r2
	subs r6, #0x30
	ands r1, r6
	orrs r1, r0
	strb r1, [r4]
	ldr r1, [sp, #0x10]
	ldrh r0, [r1]
	movs r1, #0xf0
	lsls r1, r1, #3
	ands r1, r0
	ldrh r2, [r4]
	ldr r0, .L080D5FD4 @ =0xFFFFF87F
	ands r0, r2
	orrs r0, r1
	strh r0, [r4]
	mov r0, sl
	adds r0, #0x77
	ldrb r3, [r0]
	movs r2, #0x77
	adds r2, r2, r7
	mov sb, r2
	movs r1, #0x78
	ands r1, r3
	ldrb r2, [r2]
	movs r0, #0x79
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	lsrs r3, r3, #7
	mov r4, sl
	adds r4, #0x78
	ldrb r2, [r4]
	movs r1, #7
	lsls r3, r3, #7
	movs r6, #0x7f
	ands r0, r6
	orrs r0, r3
	mov r3, sb
	strb r0, [r3]
	adds r3, r7, #0
	adds r3, #0x78
	ands r2, r1
	ldrb r1, [r3]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r1
	orrs r0, r2
	ldrb r2, [r4]
	movs r1, #8
	ands r1, r2
	movs r4, #9
	rsbs r4, r4, #0
	ands r0, r4
	orrs r0, r1
	movs r1, #0x10
	ands r1, r2
	subs r6, #0x90
	ands r0, r6
	orrs r0, r1
	movs r1, #0x20
	ands r1, r2
	mov r4, r8
	ands r0, r4
	orrs r0, r1
	movs r1, #0x40
	ands r1, r2
	subs r6, #0x30
	ands r0, r6
	orrs r0, r1
	lsrs r2, r2, #7
	lsls r2, r2, #7
	movs r1, #0x7f
	ands r0, r1
	orrs r0, r2
	strb r0, [r3]
	mov r0, sl
	adds r0, #0x79
	ldrb r2, [r0]
	lsls r0, r2, #0x1f
	lsrs r0, r0, #0x1f
	adds r4, r7, #0
	adds r4, #0x79
	ldrb r3, [r4]
	adds r1, r5, #0
	ands r1, r3
	orrs r0, r1
	movs r1, #2
	ands r1, r2
	mov r3, ip
	ands r0, r3
	orrs r0, r1
	movs r1, #4
	ands r1, r2
	adds r6, #0x3c
	ands r0, r6
	orrs r0, r1
	movs r1, #8
	ands r1, r2
	movs r3, #9
	rsbs r3, r3, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0x10
	ands r1, r2
	subs r6, #0xc
	ands r0, r6
	orrs r0, r1
	movs r1, #0x20
	ands r1, r2
	mov r3, r8
	ands r0, r3
	orrs r0, r1
	movs r1, #0x40
	ands r1, r2
	subs r6, #0x30
	ands r0, r6
	orrs r0, r1
	lsrs r2, r2, #7
	lsls r2, r2, #7
	movs r1, #0x7f
	ands r0, r1
	orrs r0, r2
	strb r0, [r4]
	mov r4, sl
	adds r4, #0x7a
	ldrb r1, [r4]
	lsls r1, r1, #0x1f
	lsrs r1, r1, #0x1f
	adds r3, r7, #0
	adds r3, #0x7a
	ldrb r2, [r3]
	adds r0, r5, #0
	ands r0, r2
	orrs r1, r0
	strb r1, [r3]
	ldrh r0, [r4]
	movs r1, #0xff
	lsls r1, r1, #1
	ands r1, r0
	ldrh r2, [r3]
	ldr r0, .L080D5FD8 @ =0xFFFFFE01
	ands r0, r2
	orrs r0, r1
	strh r0, [r3]
	mov r0, sl
	adds r0, #0x7b
	ldrb r2, [r0]
	adds r4, r7, #0
	adds r4, #0x7b
	movs r1, #2
	ands r1, r2
	ldrb r3, [r4]
	mov r0, ip
	ands r0, r3
	orrs r0, r1
	movs r1, #4
	ands r1, r2
	movs r3, #5
	rsbs r3, r3, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #8
	ands r1, r2
	adds r6, #0x38
	ands r0, r6
	orrs r0, r1
	movs r1, #0x10
	ands r1, r2
	subs r3, #0xc
	ands r0, r3
	orrs r0, r1
	movs r1, #0x20
	ands r1, r2
	mov r6, r8
	ands r0, r6
	orrs r0, r1
	movs r1, #0x40
	ands r1, r2
	subs r3, #0x30
	ands r0, r3
	orrs r0, r1
	lsrs r2, r2, #7
	lsls r2, r2, #7
	movs r6, #0x7f
	ands r0, r6
	orrs r0, r2
	strb r0, [r4]
	mov r0, sl
	adds r0, #0x7c
	ldrb r2, [r0]
	lsls r1, r2, #0x1f
	lsrs r1, r1, #0x1f
	adds r4, #1
	ldrb r3, [r4]
	adds r0, r5, #0
	ands r0, r3
	orrs r1, r0
	movs r0, #2
	ands r0, r2
	mov r3, ip
	ands r1, r3
	orrs r1, r0
	movs r0, #4
	ands r0, r2
	subs r6, #0x84
	ands r1, r6
	orrs r1, r0
	movs r0, #8
	ands r0, r2
	movs r3, #9
	rsbs r3, r3, #0
	ands r1, r3
	orrs r1, r0
	lsrs r2, r2, #4
	lsls r2, r2, #4
	b .L080D5FDC
	.align 2, 0
.L080D5FC8: .4byte 0xFFFFC03F
.L080D5FCC: .4byte 0xFFC03FFF
.L080D5FD0: .4byte 0xFFFFFE3F
.L080D5FD4: .4byte 0xFFFFF87F
.L080D5FD8: .4byte 0xFFFFFE01
.L080D5FDC:
	movs r0, #0xf
	ands r1, r0
	orrs r1, r2
	strb r1, [r4]
	mov r0, sl
	adds r0, #0x7d
	ldrb r3, [r0]
	lsls r0, r3, #0x1f
	lsrs r0, r0, #0x1f
	adds r4, #1
	ldrb r1, [r4]
	ands r5, r1
	orrs r0, r5
	movs r1, #0x1e
	ands r1, r3
	movs r2, #0x1f
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #0x20
	ands r1, r3
	mov r5, r8
	ands r0, r5
	orrs r0, r1
	movs r1, #0x40
	ands r1, r3
	subs r6, #0x3c
	ands r0, r6
	orrs r0, r1
	lsrs r3, r3, #7
	lsls r3, r3, #7
	movs r1, #0x7f
	ands r0, r1
	orrs r0, r3
	strb r0, [r4]
	mov r5, sl
	adds r5, #0x7e
	ldrb r3, [r5]
	lsls r1, r3, #0x1e
	adds r4, #1
	lsrs r1, r1, #0x1e
	ldrb r2, [r4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #4
	ands r1, r3
	movs r2, #5
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #8
	ands r1, r3
	adds r6, #0x38
	ands r0, r6
	orrs r0, r1
	movs r1, #0x10
	ands r1, r3
	subs r2, #0xc
	ands r0, r2
	orrs r0, r1
	movs r1, #0x20
	ands r1, r3
	mov r6, r8
	ands r0, r6
	orrs r0, r1
	movs r1, #0x40
	ands r1, r3
	subs r2, #0x30
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	ldrh r0, [r5]
	movs r1, #0xe0
	lsls r1, r1, #2
	ands r1, r0
	ldrh r2, [r4]
	ldr r0, .L080D60AC @ =0xFFFFFC7F
	ands r0, r2
	orrs r0, r1
	strh r0, [r4]
	mov r0, sl
	adds r0, #0x7f
	ldrb r1, [r0]
	lsrs r1, r1, #2
	adds r3, r7, #0
	adds r3, #0x7f
	lsls r1, r1, #2
	ldrb r2, [r3]
	movs r0, #3
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	adds r0, r7, #0
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L080D60AC: .4byte 0xFFFFFC7F

	thumb_func_start func_080D60B0
func_080D60B0: @ 0x080D60B0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r1, [r5]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1a
	ldrb r2, [r4]
	movs r0, #0x40
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	ldrh r0, [r5]
	movs r1, #0xfe
	lsls r1, r1, #5
	ands r1, r0
	ldrh r2, [r4]
	ldr r0, .L080D64AC @ =0xFFFFE03F
	ands r0, r2
	orrs r0, r1
	strh r0, [r4]
	ldr r2, [r5]
	movs r0, #0xff
	lsls r0, r0, #0xd
	ands r2, r0
	ldr r0, [r4]
	ldr r1, .L080D64B0 @ =0xFFE01FFF
	ands r0, r1
	orrs r0, r2
	str r0, [r4]
	ldrb r0, [r5, #2]
	movs r1, #0x20
	ands r1, r0
	ldrb r2, [r4, #2]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #2]
	ldrh r0, [r5, #2]
	movs r1, #0xe0
	lsls r1, r1, #1
	ands r1, r0
	ldrh r2, [r4, #2]
	ldr r0, .L080D64B4 @ =0xFFFFFE3F
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #2]
	ldrb r3, [r5, #3]
	movs r1, #2
	ands r1, r3
	ldrb r2, [r4, #3]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #0x1c
	ands r1, r3
	movs r2, #0x1d
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #3]
	adds r1, r4, #4
	adds r0, r5, #4
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	adds r0, r4, #0
	adds r0, #0x18
	adds r1, r5, #0
	adds r1, #0x18
	bl strcpy
	adds r1, r4, #0
	adds r1, #0x28
	adds r0, r5, #0
	adds r0, #0x28
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	adds r1, #1
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	lsls r1, r1, #0x1f
	adds r3, r4, #0
	adds r3, #0x2a
	lsrs r1, r1, #0x1f
	ldrb r2, [r3]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	ldr r0, [r5, #0x2c]
	str r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x30
	adds r0, r5, #0
	adds r0, #0x30
	ldm r0!, {r2, r6}
	stm r1!, {r2, r6}
	adds r1, r4, #0
	adds r1, #0x38
	adds r0, r5, #0
	adds r0, #0x38
	ldm r0!, {r3, r6}
	stm r1!, {r3, r6}
	adds r1, r4, #0
	adds r1, #0x40
	adds r0, r5, #0
	adds r0, #0x40
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	adds r1, r4, #0
	adds r1, #0x48
	adds r0, r5, #0
	adds r0, #0x48
	ldm r0!, {r2, r6}
	stm r1!, {r2, r6}
	adds r1, r4, #0
	adds r1, #0x50
	adds r0, r5, #0
	adds r0, #0x50
	ldm r0!, {r3, r6}
	stm r1!, {r3, r6}
	adds r1, r4, #0
	adds r1, #0x58
	adds r0, r5, #0
	adds r0, #0x58
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	adds r1, r4, #0
	adds r1, #0x60
	adds r0, r5, #0
	adds r0, #0x60
	ldm r0!, {r2, r6}
	stm r1!, {r2, r6}
	adds r1, r4, #0
	adds r1, #0x68
	adds r0, r5, #0
	adds r0, #0x68
	ldm r0!, {r3, r6}
	stm r1!, {r3, r6}
	adds r1, r4, #0
	adds r1, #0x70
	adds r0, r5, #0
	adds r0, #0x70
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	adds r1, r4, #0
	adds r1, #0x84
	adds r0, r5, #0
	adds r0, #0x84
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r6}
	stm r1!, {r2, r6}
	adds r1, r4, #0
	adds r1, #0x98
	adds r0, r5, #0
	adds r0, #0x98
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	adds r1, r4, #0
	adds r1, #0xb0
	adds r0, r5, #0
	adds r0, #0xb0
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r3, r6}
	stm r1!, {r3, r6}
	adds r1, r4, #0
	adds r1, #0xc4
	adds r0, r5, #0
	adds r0, #0xc4
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	adds r1, r4, #0
	adds r1, #0xd8
	adds r0, r5, #0
	adds r0, #0xd8
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	adds r1, r4, #0
	adds r1, #0xf0
	adds r0, r5, #0
	adds r0, #0xf0
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r6}
	stm r1!, {r2, r6}
	movs r0, #0x82
	lsls r0, r0, #1
	adds r1, r4, r0
	adds r0, r5, r0
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r3, r6}
	stm r1!, {r3, r6}
	movs r0, #0x8c
	lsls r0, r0, #1
	adds r1, r4, r0
	adds r0, r5, r0
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	movs r0, #0x96
	lsls r0, r0, #1
	adds r1, r4, r0
	adds r0, r5, r0
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r6}
	stm r1!, {r2, r6}
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r1, r4, r0
	adds r0, r5, r0
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r3, r6}
	stm r1!, {r3, r6}
	movs r1, #0xaa
	lsls r1, r1, #1
	adds r0, r4, r1
	adds r1, r5, r1
	ldm r1!, {r2, r3, r6}
	stm r0!, {r2, r3, r6}
	ldm r1!, {r2, r3, r6}
	stm r0!, {r2, r3, r6}
	movs r0, #0xb6
	lsls r0, r0, #1
	adds r1, r4, r0
	adds r0, r5, r0
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	movs r0, #0xc0
	lsls r0, r0, #1
	adds r1, r4, r0
	adds r0, r5, r0
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r6}
	stm r1!, {r2, r6}
	movs r0, #0xca
	lsls r0, r0, #1
	adds r1, r4, r0
	adds r0, r5, r0
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r3, r6}
	stm r1!, {r3, r6}
	movs r0, #0xd4
	lsls r0, r0, #1
	adds r1, r4, r0
	adds r0, r5, r0
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	movs r0, #0xde
	lsls r0, r0, #1
	adds r1, r4, r0
	adds r0, r5, r0
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r6}
	stm r1!, {r2, r6}
	movs r0, #0xe8
	lsls r0, r0, #1
	adds r1, r4, r0
	adds r0, r5, r0
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r3, r6}
	stm r1!, {r3, r6}
	movs r1, #0xf2
	lsls r1, r1, #1
	adds r0, r4, r1
	adds r1, r5, r1
	ldm r1!, {r2, r3, r6}
	stm r0!, {r2, r3, r6}
	ldm r1!, {r2, r3, r6}
	stm r0!, {r2, r3, r6}
	movs r0, #0xfe
	lsls r0, r0, #1
	adds r1, r4, r0
	adds r0, r5, r0
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	movs r1, #0x84
	lsls r1, r1, #2
	adds r0, r4, r1
	adds r1, r5, r1
	ldm r1!, {r2, r3, r6}
	stm r0!, {r2, r3, r6}
	ldm r1!, {r2, r3, r6}
	stm r0!, {r2, r3, r6}
	movs r0, #0x8a
	lsls r0, r0, #2
	adds r1, r4, r0
	adds r0, r5, r0
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r6}
	stm r1!, {r2, r6}
	movs r0, #0x8f
	lsls r0, r0, #2
	adds r1, r4, r0
	adds r0, r5, r0
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r3, r6}
	stm r1!, {r3, r6}
	movs r0, #0x94
	lsls r0, r0, #2
	adds r1, r4, r0
	adds r0, r5, r0
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	movs r1, #0x99
	lsls r1, r1, #2
	adds r0, r4, r1
	adds r1, r5, r1
	ldm r1!, {r2, r3, r6}
	stm r0!, {r2, r3, r6}
	ldm r1!, {r2, r3, r6}
	stm r0!, {r2, r3, r6}
	movs r0, #0x9f
	lsls r0, r0, #2
	adds r1, r4, r0
	adds r0, r5, r0
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r6}
	stm r1!, {r2, r6}
	movs r1, #0xa4
	lsls r1, r1, #2
	adds r0, r4, r1
	adds r1, r5, r1
	ldm r1!, {r2, r3, r6}
	stm r0!, {r2, r3, r6}
	ldm r1!, {r2, r3, r6}
	stm r0!, {r2, r3, r6}
	movs r0, #0xaa
	lsls r0, r0, #2
	adds r1, r4, r0
	adds r0, r5, r0
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r3, r6}
	stm r1!, {r3, r6}
	movs r0, #0xaf
	lsls r0, r0, #2
	adds r1, r4, r0
	adds r0, r5, r0
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	movs r0, #0xb4
	lsls r0, r0, #2
	adds r1, r4, r0
	adds r0, r5, r0
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r6}
	stm r1!, {r2, r6}
	movs r1, #0xb9
	lsls r1, r1, #2
	adds r0, r4, r1
	adds r1, r5, r1
	ldm r1!, {r2, r3, r6}
	stm r0!, {r2, r3, r6}
	ldm r1!, {r2, r3, r6}
	stm r0!, {r2, r3, r6}
	movs r0, #0xbf
	lsls r0, r0, #2
	adds r1, r4, r0
	adds r0, r5, r0
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r3, r6}
	stm r1!, {r3, r6}
	movs r1, #0xc4
	lsls r1, r1, #2
	adds r0, r4, r1
	adds r1, r5, r1
	ldm r1!, {r2, r3, r6}
	stm r0!, {r2, r3, r6}
	ldm r1!, {r2, r3, r6}
	stm r0!, {r2, r3, r6}
	movs r0, #0xca
	lsls r0, r0, #2
	adds r1, r4, r0
	adds r0, r5, r0
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	movs r1, #0xcf
	lsls r1, r1, #2
	adds r0, r4, r1
	adds r1, r5, r1
	ldm r1!, {r2, r3, r6}
	stm r0!, {r2, r3, r6}
	ldm r1!, {r2, r3, r6}
	stm r0!, {r2, r3, r6}
	ldm r1!, {r2, r3, r6}
	stm r0!, {r2, r3, r6}
	movs r1, #0xd8
	lsls r1, r1, #2
	adds r0, r4, r1
	adds r1, r5, r1
	ldm r1!, {r2, r3, r6}
	stm r0!, {r2, r3, r6}
	ldm r1!, {r2, r3, r6}
	stm r0!, {r2, r3, r6}
	ldm r1!, {r2, r3, r6}
	stm r0!, {r2, r3, r6}
	movs r1, #0xe1
	lsls r1, r1, #2
	adds r0, r4, r1
	adds r1, r5, r1
	ldm r1!, {r2, r3, r6}
	stm r0!, {r2, r3, r6}
	ldm r1!, {r2, r3, r6}
	stm r0!, {r2, r3, r6}
	ldm r1!, {r2, r3, r6}
	stm r0!, {r2, r3, r6}
	movs r1, #0xea
	lsls r1, r1, #2
	adds r0, r4, r1
	adds r1, r5, r1
	ldm r1!, {r2, r3, r6}
	stm r0!, {r2, r3, r6}
	ldm r1!, {r2, r3, r6}
	stm r0!, {r2, r3, r6}
	ldm r1!, {r2, r3, r6}
	stm r0!, {r2, r3, r6}
	movs r1, #0xf3
	lsls r1, r1, #2
	adds r0, r4, r1
	adds r1, r5, r1
	ldm r1!, {r2, r3, r6}
	stm r0!, {r2, r3, r6}
	ldm r1!, {r2, r3, r6}
	stm r0!, {r2, r3, r6}
	ldm r1!, {r2, r3, r6}
	stm r0!, {r2, r3, r6}
	movs r1, #0xfc
	lsls r1, r1, #2
	adds r0, r4, r1
	adds r1, r5, r1
	ldm r1!, {r2, r3, r6}
	stm r0!, {r2, r3, r6}
	ldm r1!, {r2, r3, r6}
	stm r0!, {r2, r3, r6}
	ldm r1!, {r2, r3, r6}
	stm r0!, {r2, r3, r6}
	ldr r1, .L080D64B8 @ =0x00000414
	adds r0, r4, r1
	adds r1, r5, r1
	ldm r1!, {r2, r3, r6}
	stm r0!, {r2, r3, r6}
	ldm r1!, {r2, r3, r6}
	stm r0!, {r2, r3, r6}
	ldm r1!, {r2, r3, r6}
	stm r0!, {r2, r3, r6}
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r4, r1
	adds r1, r5, r1
	movs r2, #0x38
	bl memcpy
	movs r0, #0x8e
	lsls r0, r0, #3
	adds r1, r4, r0
	adds r0, r5, r0
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, .L080D64BC @ =0x00000474
	adds r5, r5, r0
	ldrb r1, [r5]
	adds r0, r4, r0
	strb r1, [r0]
	adds r0, r4, #0
	b .L080D64C0
	.align 2, 0
.L080D64AC: .4byte 0xFFFFE03F
.L080D64B0: .4byte 0xFFE01FFF
.L080D64B4: .4byte 0xFFFFFE3F
.L080D64B8: .4byte 0x00000414
.L080D64BC: .4byte 0x00000474
.L080D64C0:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080D64C8
func_080D64C8: @ 0x080D64C8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl strcpy
	ldrh r1, [r5, #0x10]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x16
	ldrh r2, [r4, #0x10]
	ldr r0, .L080D656C @ =0xFFFFFC00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #0x10]
	ldrb r3, [r5, #0x11]
	movs r1, #4
	ands r1, r3
	ldrb r2, [r4, #0x11]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #8
	ands r1, r3
	movs r2, #9
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #0x10
	ands r1, r3
	subs r2, #8
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #0x11]
	adds r3, r4, #0
	adds r3, #0x14
	movs r1, #0xa
	adds r2, r5, #0
	adds r2, #0x14
	movs r6, #1
	rsbs r6, r6, #0
.L080D6518:
	ldm r2!, {r0}
	stm r3!, {r0}
	subs r1, #1
	cmp r1, r6
	bne .L080D6518
	adds r0, r4, #0
	adds r0, #0x40
	adds r1, r5, #0
	adds r1, #0x40
	movs r2, #0xd0
	lsls r2, r2, #1
	bl memcpy
	movs r1, #0xf0
	lsls r1, r1, #1
	adds r0, r4, r1
	adds r1, r5, r1
	movs r2, #0x87
	lsls r2, r2, #2
	bl memcpy
	movs r1, #0xff
	lsls r1, r1, #2
	adds r0, r4, r1
	adds r1, r5, r1
	bl func_080D66A4
	ldr r1, .L080D6570 @ =0x000005DC
	adds r0, r4, r1
	adds r1, r5, r1
	bl func_080D657C
	ldr r1, .L080D6574 @ =0x000009C8
	adds r0, r4, r1
	adds r1, r5, r1
	ldr r2, .L080D6578 @ =0x000010CC
	bl memcpy
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L080D656C: .4byte 0xFFFFFC00
.L080D6570: .4byte 0x000005DC
.L080D6574: .4byte 0x000009C8
.L080D6578: .4byte 0x000010CC

	thumb_func_start func_080D657C
func_080D657C: @ 0x080D657C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r4, r1, #0
	ldrb r1, [r4]
	lsls r1, r1, #0x1f
	lsrs r1, r1, #0x1f
	ldrb r2, [r6]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6]
	ldrh r0, [r4]
	ldr r1, .L080D6684 @ =0x000007FE
	ands r1, r0
	ldrh r2, [r6]
	ldr r0, .L080D6688 @ =0xFFFFF801
	ands r0, r2
	orrs r0, r1
	strh r0, [r6]
	ldrb r3, [r4, #1]
	movs r1, #8
	ands r1, r3
	ldrb r2, [r6, #1]
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #0x10
	ands r1, r3
	movs r2, #0x11
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, #1]
	ldr r2, [r4]
	ldr r0, .L080D668C @ =0x1FFFE000
	ands r2, r0
	ldr r0, [r6]
	ldr r1, .L080D6690 @ =0xE0001FFF
	ands r0, r1
	orrs r0, r2
	str r0, [r6]
	ldrb r2, [r4, #3]
	movs r1, #0x60
	ands r1, r2
	ldrb r3, [r6, #3]
	movs r0, #0x61
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	lsrs r2, r2, #7
	lsls r2, r2, #7
	movs r1, #0x7f
	ands r0, r1
	orrs r0, r2
	strb r0, [r6, #3]
	ldrb r1, [r4, #4]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	ldrb r2, [r6, #4]
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, #4]
	ldrh r0, [r4, #4]
	ldr r1, .L080D6694 @ =0x00003FF0
	ands r1, r0
	ldrh r2, [r6, #4]
	ldr r0, .L080D6698 @ =0xFFFFC00F
	ands r0, r2
	orrs r0, r1
	strh r0, [r6, #4]
	ldr r2, [r4, #4]
	ldr r0, .L080D669C @ =0x00FFC000
	ands r2, r0
	ldr r0, [r6, #4]
	ldr r1, .L080D66A0 @ =0xFF003FFF
	ands r0, r1
	orrs r0, r2
	str r0, [r6, #4]
	adds r2, r6, #7
	movs r3, #1
	adds r1, r4, #7
	movs r5, #1
	rsbs r5, r5, #0
.L080D662E:
	ldrb r0, [r1]
	strb r0, [r2]
	adds r2, #1
	adds r1, #1
	subs r3, #1
	cmp r3, r5
	bne .L080D662E
	adds r0, r6, #0
	adds r0, #0xc
	adds r1, r4, #0
	adds r1, #0xc
	bl strcpy
	adds r0, r6, #0
	adds r0, #0x1c
	adds r1, r4, #0
	adds r1, #0x1c
	bl strcpy
	adds r5, r6, #0
	adds r5, #0x2c
	movs r7, #0xf
	adds r4, #0x2c
	movs r0, #1
	rsbs r0, r0, #0
	mov r8, r0
.L080D6662:
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x3c
	bl memcpy
	adds r5, #0x3c
	adds r4, #0x3c
	subs r7, #1
	cmp r7, r8
	bne .L080D6662
	adds r0, r6, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L080D6684: .4byte 0x000007FE
.L080D6688: .4byte 0xFFFFF801
.L080D668C: .4byte 0x1FFFE000
.L080D6690: .4byte 0xE0001FFF
.L080D6694: .4byte 0x00003FF0
.L080D6698: .4byte 0xFFFFC00F
.L080D669C: .4byte 0x00FFC000
.L080D66A0: .4byte 0xFF003FFF

	thumb_func_start func_080D66A4
func_080D66A4: @ 0x080D66A4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	adds r6, r1, #0
	ldrb r1, [r6]
	lsls r1, r1, #0x1f
	lsrs r1, r1, #0x1f
	ldrb r2, [r4]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	ldrh r0, [r6]
	ldr r1, .L080D67BC @ =0x000007FE
	ands r1, r0
	ldrh r2, [r4]
	ldr r0, .L080D67C0 @ =0xFFFFF801
	ands r0, r2
	orrs r0, r1
	strh r0, [r4]
	ldrb r0, [r6, #1]
	movs r1, #8
	ands r1, r0
	ldrb r2, [r4, #1]
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #1]
	ldr r2, [r6]
	movs r0, #0xff
	lsls r0, r0, #0xc
	ands r2, r0
	ldr r0, [r4]
	ldr r1, .L080D67C4 @ =0xFFF00FFF
	ands r0, r1
	orrs r0, r2
	str r0, [r4]
	ldrb r2, [r6, #2]
	movs r1, #0x10
	ands r1, r2
	ldrb r3, [r4, #2]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	lsrs r2, r2, #5
	lsls r2, r2, #5
	movs r1, #0x1f
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, #2]
	ldrb r2, [r6, #3]
	ldrb r0, [r6, #4]
	movs r3, #3
	ands r0, r3
	lsrs r1, r2, #8
	strb r2, [r4, #3]
	orrs r1, r0
	ands r1, r3
	ldrb r2, [r4, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #4]
	adds r0, r4, #0
	adds r0, #8
	adds r1, r6, #0
	adds r1, #8
	bl strcpy
	movs r0, #0x18
	adds r0, r0, r4
	mov ip, r0
	movs r1, #7
	mov r8, r1
	adds r2, r6, #0
	adds r2, #0x18
	movs r3, #1
	rsbs r3, r3, #0
	mov sb, r3
.L080D674E:
	mov r1, ip
	adds r0, r2, #0
	ldm r0!, {r3, r5, r7}
	stm r1!, {r3, r5, r7}
	ldm r0!, {r3, r5, r7}
	stm r1!, {r3, r5, r7}
	ldm r0!, {r3, r5, r7}
	stm r1!, {r3, r5, r7}
	ldm r0!, {r3, r5, r7}
	stm r1!, {r3, r5, r7}
	movs r5, #0x30
	add ip, r5
	adds r2, #0x30
	movs r7, #1
	rsbs r7, r7, #0
	add r8, r7
	cmp r8, sb
	bne .L080D674E
	movs r0, #0xcc
	lsls r0, r0, #1
	adds r3, r4, r0
	movs r1, #7
	mov r8, r1
	adds r2, r6, r0
	adds r5, r7, #0
	mov sb, r5
.L080D6782:
	adds r1, r3, #0
	adds r0, r2, #0
	ldm r0!, {r5, r7}
	stm r1!, {r5, r7}
	adds r3, #8
	adds r2, #8
	movs r7, #1
	rsbs r7, r7, #0
	add r8, r7
	cmp r8, sb
	bne .L080D6782
	movs r0, #0xec
	lsls r0, r0, #1
	adds r2, r4, r0
	movs r3, #1
	adds r1, r6, r0
	adds r5, r7, #0
.L080D67A4:
	ldm r1!, {r0}
	stm r2!, {r0}
	subs r3, #1
	cmp r3, r5
	bne .L080D67A4
	adds r0, r4, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L080D67BC: .4byte 0x000007FE
.L080D67C0: .4byte 0xFFFFF801
.L080D67C4: .4byte 0xFFF00FFF

	thumb_func_start func_080D67C8
func_080D67C8: @ 0x080D67C8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl __as__6AnimalRC6Animal
	ldrb r0, [r5, #0x1c]
	strb r0, [r4, #0x1c]
	ldrb r3, [r5, #0x1d]
	lsls r1, r3, #0x1f
	lsrs r1, r1, #0x1f
	ldrb r2, [r4, #0x1d]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #2
	ands r1, r3
	movs r2, #3
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #0x1d]
	ldr r0, [r5, #0x20]
	str r0, [r4, #0x20]
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	str r0, [r4, #0x24]
	str r1, [r4, #0x28]
	ldrh r1, [r5, #0x2c]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x16
	ldrh r2, [r4, #0x2c]
	ldr r0, .L080D6844 @ =0xFFFFFC00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	adds r3, r4, #0
	adds r3, #0x2d
	movs r1, #0x1c
	ands r1, r0
	ldrb r2, [r3]
	movs r0, #0x1d
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	ldr r2, [r5, #0x2c]
	movs r0, #0xff
	lsls r0, r0, #0xd
	ands r2, r0
	ldr r0, [r4, #0x2c]
	ldr r1, .L080D6848 @ =0xFFE01FFF
	ands r0, r1
	orrs r0, r2
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L080D6844: .4byte 0xFFFFFC00
.L080D6848: .4byte 0xFFE01FFF

	.section ".text.code_080D68C0"

	thumb_func_start func_080D68C0
func_080D68C0: @ 0x080D68C0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	mov r8, r1
	bl strcpy
	adds r0, r7, #0
	adds r0, #0x10
	mov r1, r8
	adds r1, #0x10
	bl strcpy
	adds r1, r7, #0
	adds r1, #0x20
	mov r0, r8
	adds r0, #0x20
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, #4
	mov r0, r8
	adds r0, #0x24
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	adds r3, r7, #0
	adds r3, #0x2c
	movs r1, #5
	mov r2, r8
	adds r2, #0x2c
	movs r4, #1
	rsbs r4, r4, #0
.L080D68FE:
	ldm r2!, {r0}
	stm r3!, {r0}
	subs r1, #1
	cmp r1, r4
	bne .L080D68FE
	mov r4, r8
	adds r4, #0x44
	ldrb r3, [r4]
	lsls r1, r3, #0x1c
	adds r5, r7, #0
	adds r5, #0x44
	lsrs r1, r1, #0x1c
	ldrb r2, [r5]
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #0x10
	ands r1, r3
	movs r2, #0x11
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #0x20
	ands r1, r3
	subs r2, #0x10
	ands r0, r2
	orrs r0, r1
	movs r1, #0x40
	ands r1, r3
	subs r2, #0x20
	ands r0, r2
	orrs r0, r1
	strb r0, [r5]
	ldrh r0, [r4]
	movs r1, #0xff
	lsls r1, r1, #7
	ands r1, r0
	ldrh r2, [r5]
	ldr r4, .L080D6A68 @ =0xFFFF807F
	adds r0, r4, #0
	ands r0, r2
	orrs r0, r1
	strh r0, [r5]
	mov r0, r8
	ldr r2, [r0, #0x44]
	movs r0, #0xff
	lsls r0, r0, #0xf
	ands r2, r0
	ldr r0, [r7, #0x44]
	ldr r1, .L080D6A6C @ =0xFF807FFF
	ands r0, r1
	orrs r0, r2
	str r0, [r7, #0x44]
	mov r0, r8
	adds r0, #0x46
	ldrh r0, [r0]
	adds r3, r7, #0
	adds r3, #0x46
	movs r1, #0xff
	lsls r1, r1, #7
	ands r1, r0
	ldrh r2, [r3]
	adds r0, r4, #0
	ands r0, r2
	orrs r0, r1
	strh r0, [r3]
	mov r0, r8
	adds r0, #0x47
	ldrb r1, [r0]
	lsrs r1, r1, #7
	mov r2, r8
	ldr r3, [r2, #0x48]
	ldr r5, .L080D6A70 @ =0x1FFFFFFF
	adds r6, r7, #0
	adds r6, #0x47
	lsls r1, r1, #7
	ldrb r2, [r6]
	movs r0, #0x7f
	ands r0, r2
	orrs r0, r1
	strb r0, [r6]
	ands r3, r5
	ldr r0, [r7, #0x48]
	movs r1, #0xe0
	lsls r1, r1, #0x18
	ands r0, r1
	orrs r0, r3
	str r0, [r7, #0x48]
	mov r0, r8
	adds r0, #0x4b
	ldrb r1, [r0]
	lsrs r1, r1, #5
	adds r3, r7, #0
	adds r3, #0x4b
	lsls r1, r1, #5
	ldrb r2, [r3]
	movs r5, #0x1f
	adds r0, r5, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	mov r6, r8
	adds r6, #0x4c
	ldrb r1, [r6]
	lsls r1, r1, #0x19
	adds r3, #1
	lsrs r1, r1, #0x19
	ldrb r2, [r3]
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	ldrh r1, [r6]
	movs r0, #0xff
	lsls r0, r0, #7
	ands r0, r1
	ldrh r1, [r3]
	ands r4, r1
	orrs r4, r0
	strh r4, [r3]
	mov r3, r8
	ldr r2, [r3, #0x4c]
	lsrs r2, r2, #0xf
	mov r0, r8
	adds r0, #0x50
	ldrh r4, [r0]
	ldr r6, .L080D6A74 @ =0x00001FFF
	ands r4, r6
	lsrs r3, r2, #0x11
	lsls r2, r2, #0xf
	ldr r0, [r7, #0x4c]
	ldr r1, .L080D6A78 @ =0x00007FFF
	ands r0, r1
	orrs r0, r2
	str r0, [r7, #0x4c]
	orrs r3, r4
	adds r2, r7, #0
	adds r2, #0x50
	ands r3, r6
	ldrh r1, [r2]
	ldr r0, .L080D6A7C @ =0xFFFFE000
	ands r0, r1
	orrs r0, r3
	strh r0, [r2]
	mov r0, r8
	adds r0, #0x51
	ldrb r0, [r0]
	lsrs r0, r0, #5
	adds r2, #1
	lsls r0, r0, #5
	ldrb r1, [r2]
	ands r5, r1
	orrs r5, r0
	strb r5, [r2]
	adds r1, r7, #0
	adds r1, #0x54
	mov r0, r8
	adds r0, #0x54
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	adds r0, r7, #0
	adds r0, #0x5c
	mov r1, r8
	adds r1, #0x5c
	movs r2, #2
	bl memcpy
	adds r0, r7, #0
	adds r0, #0x60
	mov r1, r8
	adds r1, #0x60
	bl func_080D6A80
	adds r0, r7, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L080D6A68: .4byte 0xFFFF807F
.L080D6A6C: .4byte 0xFF807FFF
.L080D6A70: .4byte 0x1FFFFFFF
.L080D6A74: .4byte 0x00001FFF
.L080D6A78: .4byte 0x00007FFF
.L080D6A7C: .4byte 0xFFFFE000

	thumb_func_start func_080D6A80
func_080D6A80: @ 0x080D6A80
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	adds r4, r1, #0
	movs r0, #0
	adds r2, r7, #0
	stm r2!, {r0}
	adds r0, r4, #0
	ldm r0!, {r5}
	lsls r1, r5, #2
	adds r1, r1, r0
	adds r3, r0, #0
	cmp r3, r1
	beq .L080D6AB0
.L080D6AA0:
	cmp r2, #0
	beq .L080D6AA8
	ldr r0, [r3]
	str r0, [r2]
.L080D6AA8:
	adds r3, #4
	adds r2, #4
	cmp r3, r1
	bne .L080D6AA0
.L080D6AB0:
	str r5, [r7]
	movs r0, #0x24
	adds r0, r0, r7
	mov sb, r0
	movs r0, #0
	str r0, [r7, #0x24]
	ldr r1, [r4, #0x24]
	mov r8, r1
	adds r1, r4, #0
	adds r1, #0x28
	mov r2, r8
	lsls r0, r2, #1
	adds r6, r0, r1
	adds r4, r1, #0
	adds r5, r7, #0
	adds r5, #0x28
	cmp r4, r6
	beq .L080D6AEA
.L080D6AD4:
	cmp r5, #0
	beq .L080D6AE2
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #2
	bl memcpy
.L080D6AE2:
	adds r4, #2
	adds r5, #2
	cmp r4, r6
	bne .L080D6AD4
.L080D6AEA:
	mov r0, r8
	mov r1, sb
	str r0, [r1]
	adds r0, r7, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080D6B00
func_080D6B00: @ 0x080D6B00
	push {lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x24]
	lsls r0, r0, #1
	adds r0, r0, r3
	adds r0, #0x28
	adds r2, r3, #0
	adds r2, #0x28
	cmp r2, r0
	beq .L080D6B1A
.L080D6B14:
	adds r2, #2
	cmp r2, r0
	bne .L080D6B14
.L080D6B1A:
	ldr r0, [r3]
	lsls r0, r0, #2
	adds r0, #4
	adds r2, r3, r0
	adds r0, r3, #4
	cmp r0, r2
	beq .L080D6B2E
.L080D6B28:
	adds r0, #4
	cmp r0, r2
	bne .L080D6B28
.L080D6B2E:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L080D6B3C
	adds r0, r3, #0
	bl __builtin_delete
.L080D6B3C:
	pop {r0}
	bx r0

	thumb_func_start func_080D6B40
func_080D6B40: @ 0x080D6B40
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, [r6]
	str r0, [r5]
	ldrb r3, [r6, #4]
	lsls r1, r3, #0x1f
	lsrs r1, r1, #0x1f
	ldrb r2, [r5, #4]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #2
	ands r1, r3
	movs r2, #3
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #4]
	movs r0, #8
	adds r0, r0, r5
	mov ip, r0
	movs r0, #0
	str r0, [r5, #8]
	ldr r7, [r6, #8]
	adds r1, r6, #0
	adds r1, #0xc
	lsls r0, r7, #3
	adds r4, r0, r1
	adds r2, r1, #0
	adds r3, r5, #0
	adds r3, #0xc
	cmp r2, r4
	beq .L080D6B9A
.L080D6B86:
	cmp r3, #0
	beq .L080D6B92
	ldr r0, [r2]
	ldr r1, [r2, #4]
	str r0, [r3]
	str r1, [r3, #4]
.L080D6B92:
	adds r2, #8
	adds r3, #8
	cmp r2, r4
	bne .L080D6B86
.L080D6B9A:
	mov r2, ip
	str r7, [r2]
	movs r0, #0xfc
	adds r0, r0, r5
	mov ip, r0
	adds r1, r6, #0
	adds r1, #0xfc
	movs r0, #0
	mov r2, ip
	str r0, [r2]
	ldr r7, [r1]
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r6, r0
	lsls r0, r7, #3
	adds r4, r0, r1
	adds r2, r1, #0
	movs r0, #0x80
	lsls r0, r0, #1
	adds r3, r5, r0
	cmp r2, r4
	beq .L080D6BDA
.L080D6BC6:
	cmp r3, #0
	beq .L080D6BD2
	ldr r0, [r2]
	ldr r1, [r2, #4]
	str r0, [r3]
	str r1, [r3, #4]
.L080D6BD2:
	adds r2, #8
	adds r3, #8
	cmp r2, r4
	bne .L080D6BC6
.L080D6BDA:
	mov r2, ip
	str r7, [r2]
	movs r0, #0x90
	lsls r0, r0, #1
	adds r2, r5, r0
	adds r0, r6, r0
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, #4]
	movs r0, #0x94
	lsls r0, r0, #1
	adds r2, r5, r0
	adds r0, r6, r0
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, #4]
	adds r0, r5, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080D6C08
func_080D6C08: @ 0x080D6C08
	push {r4, lr}
	adds r2, r0, #0
	adds r3, r1, #0
	adds r1, r2, #0
	adds r1, #0xfc
	ldr r0, [r1]
	lsls r0, r0, #3
	adds r0, #4
	adds r1, r1, r0
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r2, r4
	cmp r0, r1
	beq .L080D6C2A
.L080D6C24:
	adds r0, #8
	cmp r0, r1
	bne .L080D6C24
.L080D6C2A:
	adds r1, r2, #0
	adds r1, #8
	ldr r0, [r2, #8]
	lsls r0, r0, #3
	adds r0, #4
	adds r1, r1, r0
	adds r0, r2, #0
	adds r0, #0xc
	cmp r0, r1
	beq .L080D6C44
.L080D6C3E:
	adds r0, #8
	cmp r0, r1
	bne .L080D6C3E
.L080D6C44:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq .L080D6C52
	adds r0, r2, #0
	bl __builtin_delete
.L080D6C52:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_080D6C58
func_080D6C58: @ 0x080D6C58
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov sb, r0
	adds r5, r1, #0
	str r0, [sp, #0x10]
	add r1, sp, #4
	mov sl, r1
	ldr r0, .L080D6D70 @ =0x00000554
	bl __builtin_new
	adds r6, r5, #4
	movs r1, #0x14
	adds r1, r1, r5
	mov r8, r1
	adds r4, r5, #0
	adds r4, #0x28
	adds r7, r0, #0
	adds r0, r5, #0
	adds r0, #0x24
	ldrb r5, [r0]
	ldr r0, .L080D6D74 @ =vtable_unk_080E5BF8
	str r0, [r7]
	ldr r0, .L080D6D78 @ =0x000034F4
	bl __builtin_new
	str r4, [sp]
	adds r1, r6, #0
	mov r2, r8
	adds r3, r5, #0
	bl func_08010358
	adds r1, r0, #0
	str r1, [r7, #4]
	adds r0, r7, #0
	adds r0, #8
	bl __12ScriptEnginePv
	movs r0, #0xd9
	lsls r0, r0, #2
	adds r1, r7, r0
	movs r3, #0
	movs r0, #1
	strb r0, [r1]
	movs r0, #0xda
	lsls r0, r0, #2
	adds r1, r7, r0
	movs r0, #0xab
	str r0, [r1]
	movs r0, #0xdb
	lsls r0, r0, #2
	adds r1, r7, r0
	strb r3, [r1]
	movs r0, #0x1d
	str r0, [r1, #4]
	movs r1, #0xdd
	lsls r1, r1, #2
	adds r2, r7, r1
	ldrb r1, [r2]
	subs r0, #0x3d
	ands r0, r1
	movs r1, #6
	orrs r0, r1
	strb r0, [r2]
	ldrh r1, [r2]
	ldr r0, .L080D6D7C @ =0xFFFFF81F
	ands r0, r1
	strh r0, [r2]
	movs r1, #0xde
	lsls r1, r1, #2
	adds r0, r7, r1
	str r3, [r0]
	adds r1, #0x14
	adds r0, r7, r1
	str r3, [r0]
	movs r1, #0x9a
	lsls r1, r1, #3
	adds r0, r7, r1
	str r3, [r0]
	ldr r0, .L080D6D80 @ =0x000004DC
	adds r4, r7, r0
	movs r5, #5
	add r1, sp, #8
	mov r8, r1
	movs r6, #1
	rsbs r6, r6, #0
.L080D6D0A:
	adds r0, r4, #0
	bl func_080D4130
	adds r4, #0xc
	subs r5, #1
	cmp r5, r6
	bne .L080D6D0A
	ldr r0, .L080D6D84 @ =0x00000524
	adds r4, r7, r0
	movs r5, #3
	movs r6, #1
	rsbs r6, r6, #0
.L080D6D22:
	adds r0, r4, #0
	bl func_080D40CC
	adds r4, #0xc
	subs r5, #1
	cmp r5, r6
	bne .L080D6D22
	ldr r0, .L080D6D88 @ =gUnk_0300040C
	str r7, [r0]
	mov r1, sl
	str r7, [r1]
	ldr r2, [sp, #4]
	add r0, sp, #4
	str r0, [sp, #8]
	mov r1, r8
	str r2, [r1, #4]
	ldr r1, [sp, #8]
	movs r0, #0
	str r0, [r1]
	ldr r0, [sp, #0x10]
	str r2, [r0]
	ldr r1, [sp, #4]
	cmp r1, #0
	beq .L080D6D5E
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080D6D5E:
	mov r0, sb
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L080D6D70: .4byte 0x00000554
.L080D6D74: .4byte vtable_unk_080E5BF8
.L080D6D78: .4byte 0x000034F4
.L080D6D7C: .4byte 0xFFFFF81F
.L080D6D80: .4byte 0x000004DC
.L080D6D84: .4byte 0x00000524
.L080D6D88: .4byte gUnk_0300040C

	thumb_func_start func_080D6D8C
func_080D6D8C: @ 0x080D6D8C
	push {lr}
	bl func_0800080C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080D6D98
func_080D6D98: @ 0x080D6D98
	push {lr}
	adds r3, r0, #0
	lsls r1, r1, #2
	subs r1, #4
	adds r1, r3, r1
	str r2, [r1]
	cmp r1, r3
	beq .L080D6DB2
.L080D6DA8:
	adds r0, r1, #0
	subs r1, #4
	str r0, [r1]
	cmp r1, r3
	bne .L080D6DA8
.L080D6DB2:
	adds r0, r1, #0
	pop {r1}
	bx r1

	thumb_func_start func_080D6DB8
func_080D6DB8: @ 0x080D6DB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	ldr r0, [r7, #0xc]
	ldr r2, [r7]
	subs r0, r0, r2
	asrs r0, r0, #3
	cmp r0, r1
	bhs .L080D6E88
	ldr r3, [r7, #4]
	subs r0, r3, r2
	asrs r0, r0, #3
	mov sl, r0
	cmp r2, #0
	beq .L080D6E54
	adds r5, r2, #0
	adds r6, r3, #0
	cmp r1, #0
	beq .L080D6DFA
	lsls r4, r1, #3
	adds r0, r4, #0
	bl malloc
	mov r8, r4
	cmp r0, #0
	bne .L080D6DFE
	mov r0, r8
	bl func_080D3BC0
	b .L080D6DFE
.L080D6DFA:
	movs r0, #0
	mov r8, r0
.L080D6DFE:
	mov sb, r0
	mov r4, sb
	mov r0, sl
	lsls r0, r0, #3
	mov sl, r0
	cmp r5, r6
	beq .L080D6E28
.L080D6E0C:
	cmp r4, #0
	beq .L080D6E20
	adds r0, r4, #0
	bl func_08007128
	ldr r1, [r5, #4]
	adds r0, r4, #0
	bl func_0800745C
	str r0, [r4, #4]
.L080D6E20:
	adds r5, #8
	adds r4, #8
	cmp r5, r6
	bne .L080D6E0C
.L080D6E28:
	mov r6, sb
	ldr r5, [r7, #4]
	ldr r4, [r7]
	cmp r4, r5
	beq .L080D6E48
.L080D6E32:
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	adds r4, #8
	cmp r4, r5
	bne .L080D6E32
.L080D6E48:
	ldr r0, [r7]
	cmp r0, #0
	beq .L080D6E7A
	bl free
	b .L080D6E7A
.L080D6E54:
	cmp r1, #0
	beq .L080D6E6E
	lsls r4, r1, #3
	adds r0, r4, #0
	bl malloc
	mov r8, r4
	cmp r0, #0
	bne .L080D6E72
	mov r0, r8
	bl func_080D3BC0
	b .L080D6E72
.L080D6E6E:
	movs r0, #0
	mov r8, r0
.L080D6E72:
	adds r6, r0, #0
	mov r1, sl
	lsls r1, r1, #3
	mov sl, r1
.L080D6E7A:
	mov r2, sl
	adds r0, r2, r6
	mov r2, r8
	adds r1, r2, r6
	str r6, [r7]
	str r0, [r7, #4]
	str r1, [r7, #0xc]
.L080D6E88:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080D6E98
func_080D6E98: @ 0x080D6E98
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0, #4]
	str r1, [r0, #8]
	movs r2, #0
	movs r1, #1
	strb r1, [r0]
	strb r2, [r0, #1]
	bx lr
	.align 2, 0

	thumb_func_start func_080D6EAC
func_080D6EAC: @ 0x080D6EAC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r4, #4
	bl func_080D6E98
	adds r0, r4, #0
	adds r0, #0x10
	bl func_080D6E98
	movs r1, #0
	movs r0, #1
	strb r0, [r4]
	strb r1, [r4, #1]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_080D6ECC
func_080D6ECC: @ 0x080D6ECC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r4, #4
	bl func_080D6EAC
	adds r0, r4, #0
	adds r0, #0x20
	bl func_080D6EAC
	movs r1, #0
	movs r0, #1
	strb r0, [r4]
	strb r1, [r4, #1]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_080D6EEC
func_080D6EEC: @ 0x080D6EEC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r4, #4
	bl func_080D6ECC
	adds r0, r4, #0
	adds r0, #0x40
	bl func_080D6ECC
	movs r1, #0
	movs r0, #1
	strb r0, [r4]
	strb r1, [r4, #1]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_080D6F0C
func_080D6F0C: @ 0x080D6F0C
	movs r1, #0
	str r1, [r0, #8]
	str r1, [r0, #4]
	strb r1, [r0]
	movs r1, #1
	strb r1, [r0, #1]
	bx lr
	.align 2, 0

	thumb_func_start func_080D6F1C
func_080D6F1C: @ 0x080D6F1C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x10
	bl func_080D6F0C
	adds r0, r4, #4
	bl func_080D6F0C
	movs r0, #0
	strb r0, [r4]
	movs r0, #1
	strb r0, [r4, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080D6F3C
func_080D6F3C: @ 0x080D6F3C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x20
	bl func_080D6F1C
	adds r0, r4, #4
	bl func_080D6F1C
	movs r0, #0
	strb r0, [r4]
	movs r0, #1
	strb r0, [r4, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080D6F5C
func_080D6F5C: @ 0x080D6F5C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x40
	bl func_080D6F3C
	adds r0, r4, #4
	bl func_080D6F3C
	movs r0, #0
	strb r0, [r4]
	movs r0, #1
	strb r0, [r4, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080D6F7C
func_080D6F7C: @ 0x080D6F7C
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r3, r1, #0
	str r2, [sp]
	cmp r3, #0x3f
	bhi .L080D700C
	cmp r2, #0
	beq .L080D700C
	cmp r3, #0
	bne .L080D6F9C
	cmp r2, #0x3f
	bls .L080D6F9C
	bl func_080D6E98
	b .L080D700C
.L080D6F9C:
	cmp r3, #0x1f
	bhi .L080D6FC0
	movs r0, #0x20
	subs r0, r0, r3
	str r0, [sp, #4]
	add r1, sp, #4
	mov r5, sp
	cmp r2, r0
	bls .L080D6FB0
	adds r5, r1, #0
.L080D6FB0:
	ldr r0, [r5]
	movs r1, #1
	lsls r1, r0
	subs r1, #1
	lsls r1, r3
	ldr r0, [r4, #4]
	orrs r0, r1
	str r0, [r4, #4]
.L080D6FC0:
	adds r0, r3, r2
	cmp r0, #0x20
	bls .L080D6FE2
	movs r2, #0
	cmp r3, #0x1f
	bls .L080D6FD0
	adds r2, r3, #0
	subs r2, #0x20
.L080D6FD0:
	subs r0, #0x20
	subs r0, r0, r2
	movs r1, #1
	lsls r1, r0
	subs r1, #1
	lsls r1, r2
	ldr r0, [r4, #8]
	orrs r0, r1
	str r0, [r4, #8]
.L080D6FE2:
	movs r2, #0
	movs r1, #0
	ldr r0, [r4, #4]
	adds r0, #1
	cmp r0, #0
	bne .L080D6FF0
	movs r1, #1
.L080D6FF0:
	cmp r1, #0
	beq .L080D7006
	movs r1, #0
	ldr r0, [r4, #8]
	adds r0, #1
	cmp r0, #0
	bne .L080D7000
	movs r1, #1
.L080D7000:
	cmp r1, #0
	beq .L080D7006
	movs r2, #1
.L080D7006:
	movs r0, #0
	strb r2, [r4]
	strb r0, [r4, #1]
.L080D700C:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_080D7014
func_080D7014: @ 0x080D7014
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	str r2, [sp]
	cmp r4, #0x7f
	bhi .L080D708C
	adds r0, r2, #0
	cmp r0, #0
	beq .L080D708C
	cmp r4, #0
	bne .L080D7038
	cmp r0, #0x7f
	bls .L080D7038
	adds r0, r5, #0
	bl func_080D6EAC
	b .L080D708C
.L080D7038:
	cmp r4, #0x3f
	bhi .L080D7058
	movs r0, #0x40
	subs r0, r0, r4
	str r0, [sp, #4]
	add r3, sp, #4
	ldr r1, [sp]
	mov r2, sp
	cmp r1, r0
	bls .L080D704E
	adds r2, r3, #0
.L080D704E:
	ldr r2, [r2]
	adds r0, r5, #4
	adds r1, r4, #0
	bl func_080D6F7C
.L080D7058:
	ldr r0, [sp]
	adds r0, r4, r0
	cmp r0, #0x40
	bls .L080D7078
	movs r1, #0
	cmp r4, #0x3f
	bls .L080D706A
	adds r1, r4, #0
	subs r1, #0x40
.L080D706A:
	adds r2, r0, #0
	subs r2, #0x40
	subs r2, r2, r1
	adds r0, r5, #0
	adds r0, #0x10
	bl func_080D6F7C
.L080D7078:
	movs r1, #0
	ldrb r0, [r5, #4]
	cmp r0, #0
	beq .L080D7086
	ldrb r0, [r5, #0x10]
	rsbs r0, r0, #0
	lsrs r1, r0, #0x1f
.L080D7086:
	movs r0, #0
	strb r1, [r5]
	strb r0, [r5, #1]
.L080D708C:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_080D7094
func_080D7094: @ 0x080D7094
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	str r2, [sp]
	cmp r4, #0xff
	bhi .L080D7110
	adds r0, r2, #0
	cmp r0, #0
	beq .L080D7110
	cmp r4, #0
	bne .L080D70B8
	cmp r0, #0xff
	bls .L080D70B8
	adds r0, r5, #0
	bl func_080D6ECC
	b .L080D7110
.L080D70B8:
	cmp r4, #0x7f
	bhi .L080D70D8
	movs r0, #0x80
	subs r0, r0, r4
	str r0, [sp, #4]
	add r3, sp, #4
	ldr r1, [sp]
	mov r2, sp
	cmp r1, r0
	bls .L080D70CE
	adds r2, r3, #0
.L080D70CE:
	ldr r2, [r2]
	adds r0, r5, #4
	adds r1, r4, #0
	bl func_080D7014
.L080D70D8:
	ldr r0, [sp]
	adds r0, r4, r0
	cmp r0, #0x80
	bls .L080D70F8
	movs r1, #0
	cmp r4, #0x7f
	bls .L080D70EA
	adds r1, r4, #0
	subs r1, #0x80
.L080D70EA:
	adds r2, r0, #0
	subs r2, #0x80
	subs r2, r2, r1
	adds r0, r5, #0
	adds r0, #0x20
	bl func_080D7014
.L080D70F8:
	movs r1, #0
	ldrb r0, [r5, #4]
	cmp r0, #0
	beq .L080D710A
	adds r0, r5, #0
	adds r0, #0x20
	ldrb r0, [r0]
	rsbs r0, r0, #0
	lsrs r1, r0, #0x1f
.L080D710A:
	movs r0, #0
	strb r1, [r5]
	strb r0, [r5, #1]
.L080D7110:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_080D7118
func_080D7118: @ 0x080D7118
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	str r2, [sp]
	ldr r1, .L080D7140 @ =0x000001FF
	cmp r4, r1
	bhi .L080D71A0
	adds r0, r2, #0
	cmp r0, #0
	beq .L080D71A0
	cmp r4, #0
	bne .L080D7144
	cmp r0, r1
	bls .L080D7144
	adds r0, r5, #0
	bl func_080D6EEC
	b .L080D71A0
	.align 2, 0
.L080D7140: .4byte 0x000001FF
.L080D7144:
	cmp r4, #0xff
	bhi .L080D7166
	movs r0, #0x80
	lsls r0, r0, #1
	subs r0, r0, r4
	str r0, [sp, #4]
	add r3, sp, #4
	ldr r1, [sp]
	mov r2, sp
	cmp r1, r0
	bls .L080D715C
	adds r2, r3, #0
.L080D715C:
	ldr r2, [r2]
	adds r0, r5, #4
	adds r1, r4, #0
	bl func_080D7094
.L080D7166:
	ldr r0, [sp]
	adds r2, r4, r0
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r2, r0
	bls .L080D7188
	movs r1, #0
	cmp r4, #0xff
	bls .L080D717C
	ldr r3, .L080D71A8 @ =0xFFFFFF00
	adds r1, r4, r3
.L080D717C:
	subs r2, r2, r0
	subs r2, r2, r1
	adds r0, r5, #0
	adds r0, #0x40
	bl func_080D7094
.L080D7188:
	movs r1, #0
	ldrb r0, [r5, #4]
	cmp r0, #0
	beq .L080D719A
	adds r0, r5, #0
	adds r0, #0x40
	ldrb r0, [r0]
	rsbs r0, r0, #0
	lsrs r1, r0, #0x1f
.L080D719A:
	movs r0, #0
	strb r1, [r5]
	strb r0, [r5, #1]
.L080D71A0:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080D71A8: .4byte 0xFFFFFF00

	thumb_func_start func_080D71AC
func_080D71AC: @ 0x080D71AC
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r3, r1, #0
	str r2, [sp]
	cmp r3, #0x3f
	bhi .L080D7238
	cmp r2, #0
	beq .L080D7238
	cmp r3, #0
	bne .L080D71CC
	cmp r2, #0x3f
	bls .L080D71CC
	bl func_080D6F0C
	b .L080D7238
.L080D71CC:
	cmp r3, #0x1f
	bhi .L080D71F0
	movs r0, #0x20
	subs r0, r0, r3
	str r0, [sp, #4]
	add r1, sp, #4
	mov r5, sp
	cmp r2, r0
	bls .L080D71E0
	adds r5, r1, #0
.L080D71E0:
	ldr r0, [r5]
	movs r1, #1
	lsls r1, r0
	subs r1, #1
	lsls r1, r3
	ldr r0, [r4, #4]
	bics r0, r1
	str r0, [r4, #4]
.L080D71F0:
	adds r0, r3, r2
	cmp r0, #0x20
	bls .L080D7212
	movs r2, #0
	cmp r3, #0x1f
	bls .L080D7200
	adds r2, r3, #0
	subs r2, #0x20
.L080D7200:
	subs r0, #0x20
	subs r0, r0, r2
	movs r1, #1
	lsls r1, r0
	subs r1, #1
	lsls r1, r2
	ldr r0, [r4, #8]
	bics r0, r1
	str r0, [r4, #8]
.L080D7212:
	movs r0, #0
	strb r0, [r4]
	movs r2, #0
	movs r1, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	bne .L080D7222
	movs r1, #1
.L080D7222:
	cmp r1, #0
	beq .L080D7236
	movs r1, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	bne .L080D7230
	movs r1, #1
.L080D7230:
	cmp r1, #0
	beq .L080D7236
	movs r2, #1
.L080D7236:
	strb r2, [r4, #1]
.L080D7238:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_080D7240
func_080D7240: @ 0x080D7240
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	str r2, [sp]
	cmp r4, #0x7f
	bhi .L080D72BA
	adds r0, r2, #0
	cmp r0, #0
	beq .L080D72BA
	cmp r4, #0
	bne .L080D7264
	cmp r0, #0x7f
	bls .L080D7264
	adds r0, r5, #0
	bl func_080D6F1C
	b .L080D72BA
.L080D7264:
	adds r6, r5, #4
	cmp r4, #0x3f
	bhi .L080D7286
	movs r0, #0x40
	subs r0, r0, r4
	str r0, [sp, #4]
	add r3, sp, #4
	ldr r1, [sp]
	mov r2, sp
	cmp r1, r0
	bls .L080D727C
	adds r2, r3, #0
.L080D727C:
	ldr r2, [r2]
	adds r0, r6, #0
	adds r1, r4, #0
	bl func_080D71AC
.L080D7286:
	ldr r0, [sp]
	adds r0, r4, r0
	cmp r0, #0x40
	bls .L080D72A6
	movs r1, #0
	cmp r4, #0x3f
	bls .L080D7298
	adds r1, r4, #0
	subs r1, #0x40
.L080D7298:
	adds r2, r0, #0
	subs r2, #0x40
	subs r2, r2, r1
	adds r0, r5, #0
	adds r0, #0x10
	bl func_080D71AC
.L080D72A6:
	movs r0, #0
	strb r0, [r5]
	movs r1, #0
	ldrb r0, [r6, #1]
	cmp r0, #0
	beq .L080D72B8
	ldrb r0, [r5, #0x11]
	rsbs r0, r0, #0
	lsrs r1, r0, #0x1f
.L080D72B8:
	strb r1, [r5, #1]
.L080D72BA:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080D72C4
func_080D72C4: @ 0x080D72C4
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	str r2, [sp]
	cmp r4, #0xff
	bhi .L080D7342
	adds r0, r2, #0
	cmp r0, #0
	beq .L080D7342
	cmp r4, #0
	bne .L080D72E8
	cmp r0, #0xff
	bls .L080D72E8
	adds r0, r5, #0
	bl func_080D6F3C
	b .L080D7342
.L080D72E8:
	adds r6, r5, #4
	cmp r4, #0x7f
	bhi .L080D730A
	movs r0, #0x80
	subs r0, r0, r4
	str r0, [sp, #4]
	add r3, sp, #4
	ldr r1, [sp]
	mov r2, sp
	cmp r1, r0
	bls .L080D7300
	adds r2, r3, #0
.L080D7300:
	ldr r2, [r2]
	adds r0, r6, #0
	adds r1, r4, #0
	bl func_080D7240
.L080D730A:
	ldr r0, [sp]
	adds r0, r4, r0
	cmp r0, #0x80
	bls .L080D732A
	movs r1, #0
	cmp r4, #0x7f
	bls .L080D731C
	adds r1, r4, #0
	subs r1, #0x80
.L080D731C:
	adds r2, r0, #0
	subs r2, #0x80
	subs r2, r2, r1
	adds r0, r5, #0
	adds r0, #0x20
	bl func_080D7240
.L080D732A:
	movs r0, #0
	strb r0, [r5]
	movs r1, #0
	ldrb r0, [r6, #1]
	cmp r0, #0
	beq .L080D7340
	adds r0, r5, #0
	adds r0, #0x20
	ldrb r0, [r0, #1]
	rsbs r0, r0, #0
	lsrs r1, r0, #0x1f
.L080D7340:
	strb r1, [r5, #1]
.L080D7342:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080D734C
func_080D734C: @ 0x080D734C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	str r2, [sp]
	ldr r1, .L080D7374 @ =0x000001FF
	cmp r4, r1
	bhi .L080D73D6
	adds r0, r2, #0
	cmp r0, #0
	beq .L080D73D6
	cmp r4, #0
	bne .L080D7378
	cmp r0, r1
	bls .L080D7378
	adds r0, r5, #0
	bl func_080D6F5C
	b .L080D73D6
	.align 2, 0
.L080D7374: .4byte 0x000001FF
.L080D7378:
	adds r6, r5, #4
	cmp r4, #0xff
	bhi .L080D739C
	movs r0, #0x80
	lsls r0, r0, #1
	subs r0, r0, r4
	str r0, [sp, #4]
	add r3, sp, #4
	ldr r1, [sp]
	mov r2, sp
	cmp r1, r0
	bls .L080D7392
	adds r2, r3, #0
.L080D7392:
	ldr r2, [r2]
	adds r0, r6, #0
	adds r1, r4, #0
	bl func_080D72C4
.L080D739C:
	ldr r0, [sp]
	adds r2, r4, r0
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r2, r0
	bls .L080D73BE
	movs r1, #0
	cmp r4, #0xff
	bls .L080D73B2
	ldr r3, .L080D73E0 @ =0xFFFFFF00
	adds r1, r4, r3
.L080D73B2:
	subs r2, r2, r0
	subs r2, r2, r1
	adds r0, r5, #0
	adds r0, #0x40
	bl func_080D72C4
.L080D73BE:
	movs r0, #0
	strb r0, [r5]
	movs r1, #0
	ldrb r0, [r6, #1]
	cmp r0, #0
	beq .L080D73D4
	adds r0, r5, #0
	adds r0, #0x40
	ldrb r0, [r0, #1]
	rsbs r0, r0, #0
	lsrs r1, r0, #0x1f
.L080D73D4:
	strb r1, [r5, #1]
.L080D73D6:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080D73E0: .4byte 0xFFFFFF00

	thumb_func_start func_080D73E4
func_080D73E4: @ 0x080D73E4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r7, r1, #0
	cmp r7, #5
	bhi .L080D745E
	movs r0, #0
	mov r8, r0
	adds r4, r6, #4
.L080D73F8:
	movs r1, #0
	ldr r0, [r4]
	adds r0, #1
	cmp r0, #0
	bne .L080D7404
	movs r1, #1
.L080D7404:
	adds r5, r1, #0
	cmp r5, #0
	bne .L080D7450
	adds r0, r4, #0
	adds r1, r7, #0
	bl func_080077DC
	adds r2, r0, #0
	movs r0, #0
	cmp r2, #0x1f
	bhi .L080D741C
	movs r0, #1
.L080D741C:
	cmp r0, #0
	beq .L080D7450
	strb r5, [r6, #1]
	movs r3, #0
	movs r1, #0
	ldr r0, [r6, #4]
	adds r0, #1
	cmp r0, #0
	bne .L080D7430
	movs r1, #1
.L080D7430:
	cmp r1, #0
	beq .L080D7446
	movs r1, #0
	ldr r0, [r6, #8]
	adds r0, #1
	cmp r0, #0
	bne .L080D7440
	movs r1, #1
.L080D7440:
	cmp r1, #0
	beq .L080D7446
	movs r3, #1
.L080D7446:
	strb r3, [r6]
	mov r1, r8
	lsls r0, r1, #5
	orrs r0, r2
	b .L080D7474
.L080D7450:
	adds r4, #4
	movs r0, #1
	add r8, r0
	mov r1, r8
	cmp r1, #1
	ble .L080D73F8
	b .L080D7472
.L080D745E:
	cmp r7, #6
	bne .L080D7472
	ldrb r0, [r6, #1]
	cmp r0, #0
	beq .L080D7472
	adds r0, r6, #0
	bl func_080D6E98
	movs r0, #0
	b .L080D7474
.L080D7472:
	movs r0, #0x40
.L080D7474:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080D7480
func_080D7480: @ 0x080D7480
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r1, #0
	cmp r7, #6
	bhi .L080D74D2
	movs r3, #0
	adds r4, r6, #4
.L080D7490:
	ldrb r5, [r4]
	cmp r5, #0
	bne .L080D74C8
	adds r0, r4, #0
	adds r1, r7, #0
	str r3, [sp]
	bl func_080D73E4
	adds r2, r0, #0
	movs r0, #0
	ldr r3, [sp]
	cmp r2, #0x3f
	bhi .L080D74AC
	movs r0, #1
.L080D74AC:
	cmp r0, #0
	beq .L080D74C8
	strb r5, [r6, #1]
	movs r1, #0
	ldrb r0, [r6, #4]
	cmp r0, #0
	beq .L080D74C0
	ldrb r0, [r6, #0x10]
	rsbs r0, r0, #0
	lsrs r1, r0, #0x1f
.L080D74C0:
	strb r1, [r6]
	lsls r0, r3, #6
	orrs r0, r2
	b .L080D74E8
.L080D74C8:
	adds r4, #0xc
	adds r3, #1
	cmp r3, #1
	ble .L080D7490
	b .L080D74E6
.L080D74D2:
	cmp r7, #7
	bne .L080D74E6
	ldrb r0, [r6, #1]
	cmp r0, #0
	beq .L080D74E6
	adds r0, r6, #0
	bl func_080D6EAC
	movs r0, #0
	b .L080D74E8
.L080D74E6:
	movs r0, #0x80
.L080D74E8:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start func_080D74F0
func_080D74F0: @ 0x080D74F0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r1, #0
	cmp r7, #7
	bhi .L080D7546
	movs r3, #0
	adds r4, r6, #4
.L080D7500:
	ldrb r5, [r4]
	cmp r5, #0
	bne .L080D753C
	adds r0, r4, #0
	adds r1, r7, #0
	str r3, [sp]
	bl func_080D7480
	adds r2, r0, #0
	movs r0, #0
	ldr r3, [sp]
	cmp r2, #0x7f
	bhi .L080D751C
	movs r0, #1
.L080D751C:
	cmp r0, #0
	beq .L080D753C
	strb r5, [r6, #1]
	movs r1, #0
	ldrb r0, [r6, #4]
	cmp r0, #0
	beq .L080D7534
	adds r0, r6, #0
	adds r0, #0x20
	ldrb r0, [r0]
	rsbs r0, r0, #0
	lsrs r1, r0, #0x1f
.L080D7534:
	strb r1, [r6]
	lsls r0, r3, #7
	orrs r0, r2
	b .L080D755E
.L080D753C:
	adds r4, #0x1c
	adds r3, #1
	cmp r3, #1
	ble .L080D7500
	b .L080D755A
.L080D7546:
	cmp r7, #8
	bne .L080D755A
	ldrb r0, [r6, #1]
	cmp r0, #0
	beq .L080D755A
	adds r0, r6, #0
	bl func_080D6ECC
	movs r0, #0
	b .L080D755E
.L080D755A:
	movs r0, #0x80
	lsls r0, r0, #1
.L080D755E:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080D7568
func_080D7568: @ 0x080D7568
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r1, #0
	cmp r7, #8
	bhi .L080D75BE
	movs r3, #0
	adds r4, r6, #4
.L080D7578:
	ldrb r5, [r4]
	cmp r5, #0
	bne .L080D75B4
	adds r0, r4, #0
	adds r1, r7, #0
	str r3, [sp]
	bl func_080D74F0
	adds r2, r0, #0
	movs r0, #0
	ldr r3, [sp]
	cmp r2, #0xff
	bhi .L080D7594
	movs r0, #1
.L080D7594:
	cmp r0, #0
	beq .L080D75B4
	strb r5, [r6, #1]
	movs r1, #0
	ldrb r0, [r6, #4]
	cmp r0, #0
	beq .L080D75AC
	adds r0, r6, #0
	adds r0, #0x40
	ldrb r0, [r0]
	rsbs r0, r0, #0
	lsrs r1, r0, #0x1f
.L080D75AC:
	strb r1, [r6]
	lsls r0, r3, #8
	orrs r0, r2
	b .L080D75D6
.L080D75B4:
	adds r4, #0x3c
	adds r3, #1
	cmp r3, #1
	ble .L080D7578
	b .L080D75D2
.L080D75BE:
	cmp r7, #9
	bne .L080D75D2
	ldrb r0, [r6, #1]
	cmp r0, #0
	beq .L080D75D2
	adds r0, r6, #0
	bl func_080D6EEC
	movs r0, #0
	b .L080D75D6
.L080D75D2:
	movs r0, #0x80
	lsls r0, r0, #2
.L080D75D6:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080D75E0
func_080D75E0: @ 0x080D75E0
	push {r4, lr}
	adds r4, r0, #0
	cmp r2, #5
	bhi .L080D7622
	movs r0, #0x20
	ands r0, r1
	adds r3, r4, #4
	cmp r0, #0
	beq .L080D75F4
	adds r3, #4
.L080D75F4:
	adds r0, r3, #0
	bl func_08007844
	movs r0, #0
	strb r0, [r4]
	movs r2, #0
	movs r1, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	bne .L080D760A
	movs r1, #1
.L080D760A:
	cmp r1, #0
	beq .L080D761E
	movs r1, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	bne .L080D7618
	movs r1, #1
.L080D7618:
	cmp r1, #0
	beq .L080D761E
	movs r2, #1
.L080D761E:
	strb r2, [r4, #1]
	b .L080D762C
.L080D7622:
	cmp r2, #6
	bne .L080D762C
	adds r0, r4, #0
	bl func_080D6F0C
.L080D762C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080D7634
func_080D7634: @ 0x080D7634
	push {r4, r5, lr}
	adds r4, r0, #0
	cmp r2, #6
	bhi .L080D7668
	movs r0, #0x40
	ands r0, r1
	adds r5, r4, #4
	adds r3, r5, #0
	cmp r0, #0
	beq .L080D764C
	adds r3, r4, #0
	adds r3, #0x10
.L080D764C:
	adds r0, r3, #0
	bl func_080D75E0
	movs r0, #0
	strb r0, [r4]
	movs r1, #0
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq .L080D7664
	ldrb r0, [r4, #0x11]
	rsbs r0, r0, #0
	lsrs r1, r0, #0x1f
.L080D7664:
	strb r1, [r4, #1]
	b .L080D7672
.L080D7668:
	cmp r2, #7
	bne .L080D7672
	adds r0, r4, #0
	bl func_080D6F1C
.L080D7672:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_080D7678
func_080D7678: @ 0x080D7678
	push {r4, r5, lr}
	adds r4, r0, #0
	cmp r2, #7
	bhi .L080D76B0
	movs r0, #0x80
	ands r0, r1
	adds r5, r4, #4
	adds r3, r5, #0
	cmp r0, #0
	beq .L080D7690
	adds r3, r4, #0
	adds r3, #0x20
.L080D7690:
	adds r0, r3, #0
	bl func_080D7634
	movs r0, #0
	strb r0, [r4]
	movs r1, #0
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq .L080D76AC
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r0, [r0, #1]
	rsbs r0, r0, #0
	lsrs r1, r0, #0x1f
.L080D76AC:
	strb r1, [r4, #1]
	b .L080D76BA
.L080D76B0:
	cmp r2, #8
	bne .L080D76BA
	adds r0, r4, #0
	bl func_080D6F3C
.L080D76BA:
	pop {r4, r5}
	pop {r0}
	bx r0

	.section ".text.after_resource_entry_pool_init"

	thumb_func_start func_080D772C
func_080D772C: @ 0x080D772C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	ldr r0, [r7, #0xc]
	ldr r2, [r7]
	subs r0, r0, r2
	asrs r0, r0, #3
	cmp r0, r1
	bhs .L080D77FC
	ldr r3, [r7, #4]
	subs r0, r3, r2
	asrs r0, r0, #3
	mov sl, r0
	cmp r2, #0
	beq .L080D77C8
	adds r5, r2, #0
	adds r6, r3, #0
	cmp r1, #0
	beq .L080D776E
	lsls r4, r1, #3
	adds r0, r4, #0
	bl malloc
	mov r8, r4
	cmp r0, #0
	bne .L080D7772
	mov r0, r8
	bl func_080D3BC0
	b .L080D7772
.L080D776E:
	movs r0, #0
	mov r8, r0
.L080D7772:
	mov sb, r0
	mov r4, sb
	mov r0, sl
	lsls r0, r0, #3
	mov sl, r0
	cmp r5, r6
	beq .L080D779C
.L080D7780:
	cmp r4, #0
	beq .L080D7794
	adds r0, r4, #0
	bl func_08007874
	ldr r1, [r5, #4]
	adds r0, r4, #0
	bl func_08007CD8
	str r0, [r4, #4]
.L080D7794:
	adds r5, #8
	adds r4, #8
	cmp r5, r6
	bne .L080D7780
.L080D779C:
	mov r6, sb
	ldr r5, [r7, #4]
	ldr r4, [r7]
	cmp r4, r5
	beq .L080D77BC
.L080D77A6:
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	adds r4, #8
	cmp r4, r5
	bne .L080D77A6
.L080D77BC:
	ldr r0, [r7]
	cmp r0, #0
	beq .L080D77EE
	bl free
	b .L080D77EE
.L080D77C8:
	cmp r1, #0
	beq .L080D77E2
	lsls r4, r1, #3
	adds r0, r4, #0
	bl malloc
	mov r8, r4
	cmp r0, #0
	bne .L080D77E6
	mov r0, r8
	bl func_080D3BC0
	b .L080D77E6
.L080D77E2:
	movs r0, #0
	mov r8, r0
.L080D77E6:
	adds r6, r0, #0
	mov r1, sl
	lsls r1, r1, #3
	mov sl, r1
.L080D77EE:
	mov r2, sl
	adds r0, r2, r6
	mov r2, r8
	adds r1, r2, r6
	str r6, [r7]
	str r0, [r7, #4]
	str r1, [r7, #0xc]
.L080D77FC:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080D780C
func_080D780C: @ 0x080D780C
	push {lr}
	ldr r0, [r0, #0xc]
	bl func_080096F0
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080D781C
func_080D781C: @ 0x080D781C
	push {lr}
	ldr r0, [r0, #0xc]
	bl func_08009864
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080D782C
func_080D782C: @ 0x080D782C
	push {r4, lr}
	ldr r4, [r0, #0xc]
	movs r2, #0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	cmp r0, r1
	bne .L080D783C
	movs r2, #1
.L080D783C:
	cmp r2, #0
	bne .L080D785E
	subs r1, r1, r0
	asrs r1, r1, #4
	lsls r1, r1, #4
	adds r1, r0, r1
	bl func_08008FE4
	ldr r0, [r4]
	adds r2, r0, #0
	ldr r1, [r4, #4]
	cmp r2, r1
	beq .L080D785C
.L080D7856:
	adds r0, #0x10
	cmp r0, r1
	bne .L080D7856
.L080D785C:
	str r2, [r4, #4]
.L080D785E:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080D7868
func_080D7868: @ 0x080D7868
	push {lr}
	bl func_080098AC
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080D7874
func_080D7874: @ 0x080D7874
	push {lr}
	bl func_080098AC
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080D7880
func_080D7880: @ 0x080D7880
	push {lr}
	bl func_080098AC
	pop {r0}
	bx r0
	.align 2, 0
.L080D788C:
	.byte 0x70, 0xB5, 0x81, 0xB0
	.byte 0x06, 0x1C, 0x6D, 0x46, 0x01, 0x24, 0x01, 0x20, 0x28, 0xF7, 0x46, 0xFE, 0x04, 0x40, 0x2C, 0x80
	.byte 0x30, 0x1C, 0x32, 0xF7, 0x6F, 0xF8, 0x69, 0x46, 0x08, 0x88, 0x00, 0x28, 0x01, 0xD0, 0x28, 0xF7
	.byte 0x21, 0xFE, 0x01, 0xB0, 0x70, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0x30, 0xB5, 0x04, 0x1C
	.byte 0x0D, 0x1C, 0x06, 0x48, 0xA0, 0x60, 0x20, 0x1C, 0x31, 0xF7, 0x50, 0xFE, 0x20, 0x1C, 0x29, 0x1C
	.byte 0x32, 0xF7, 0x04, 0xF8, 0x30, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0x90, 0x5B, 0x0E, 0x08

	thumb_func_start func_080D78E0
func_080D78E0: @ 0x080D78E0
	push {lr}
	ldr r0, .L080D78F4 @ =gUnk_03000410
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r1, [r0, #8]
	ldr r1, [r1, #8]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
.L080D78F4: .4byte gUnk_03000410

	thumb_func_start func_080D78F8
func_080D78F8: @ 0x080D78F8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, .L080D7934 @ =vtable_unk_080E5B3C
	str r0, [r5, #0x14]
	ldr r0, [r1]
	str r0, [r5]
	movs r4, #1
	movs r0, #1
	bl func_08000528
	ands r4, r0
	strh r4, [r5, #4]
	ldr r0, .L080D7938 @ =gUnk_03000410
	ldr r1, [r0]
	str r5, [r0]
	str r1, [r5, #8]
	ldr r0, .L080D793C @ =vtable_unk_080E5B48
	str r0, [r5, #0xc]
	ldr r1, .L080D7940 @ =func_080D78E0
	movs r0, #0
	bl func_080D100C
	str r0, [r5, #0x10]
	movs r0, #1
	bl func_0800050C
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L080D7934: .4byte vtable_unk_080E5B3C
.L080D7938: .4byte gUnk_03000410
.L080D793C: .4byte vtable_unk_080E5B48
.L080D7940: .4byte func_080D78E0

	thumb_func_start func_080D7944
func_080D7944: @ 0x080D7944
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L080D7984 @ =vtable_unk_080E5B3C
	str r0, [r4, #0x14]
	movs r0, #1
	bl func_08000528
	ldr r1, [r4, #0x10]
	movs r0, #0
	bl func_080D100C
	ldr r0, .L080D7988 @ =vtable_unk_080E5B54
	str r0, [r4, #0xc]
	ldr r1, .L080D798C @ =gUnk_03000410
	ldr r0, [r4, #8]
	str r0, [r1]
	ldrh r0, [r4, #4]
	cmp r0, #0
	beq .L080D7970
	bl func_080004F4
.L080D7970:
	movs r0, #1
	ands r5, r0
	cmp r5, #0
	beq .L080D797E
	adds r0, r4, #0
	bl __builtin_delete
.L080D797E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080D7984: .4byte vtable_unk_080E5B3C
.L080D7988: .4byte vtable_unk_080E5B54
.L080D798C: .4byte gUnk_03000410
.L080D7990:
	.byte 0x70, 0xB5, 0x46, 0x46, 0x40, 0xB4, 0x81, 0xB0, 0x06, 0x1C, 0x88, 0x46, 0x6D, 0x46, 0x01, 0x24
	.byte 0x01, 0x20, 0x28, 0xF7, 0xC1, 0xFD, 0x04, 0x40, 0x2C, 0x80, 0x30, 0x1C, 0x41, 0x46, 0x31, 0xF7
	.byte 0xC7, 0xFF, 0x69, 0x46, 0x08, 0x88, 0x00, 0x28, 0x01, 0xD0, 0x28, 0xF7, 0x9B, 0xFD, 0x01, 0xB0
	.byte 0x08, 0xBC, 0x98, 0x46, 0x70, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00

	thumb_func_start func_080D79CC
func_080D79CC: @ 0x080D79CC
	push {r4, r5, lr}
	adds r5, r1, #0
	adds r4, r0, #0
	subs r4, #0x1c
	ldr r1, .L080D79F0 @ =vtable_unk_080E5B0C
	str r1, [r4, #0x30]
	ldr r1, .L080D79F4 @ =vtable_unk_080E5B18
	str r1, [r4, #8]
	movs r1, #0
	bl func_080D7944
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0800959C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080D79F0: .4byte vtable_unk_080E5B0C
.L080D79F4: .4byte vtable_unk_080E5B18
.L080D79F8:
	.byte 0x70, 0xB5, 0x46, 0x46, 0x40, 0xB4, 0x81, 0xB0
	.byte 0x06, 0x1C, 0x88, 0x46, 0x6D, 0x46, 0x01, 0x24, 0x01, 0x20, 0x28, 0xF7, 0x8D, 0xFD, 0x04, 0x40
	.byte 0x2C, 0x80, 0x30, 0x1C, 0x41, 0x46, 0x31, 0xF7, 0xA7, 0xFF, 0x69, 0x46, 0x08, 0x88, 0x00, 0x28
	.byte 0x01, 0xD0, 0x28, 0xF7, 0x67, 0xFD, 0x01, 0xB0, 0x08, 0xBC, 0x98, 0x46, 0x70, 0xBC, 0x01, 0xBC
	.byte 0x00, 0x47, 0x00, 0x00, 0x70, 0xB5, 0x46, 0x46, 0x40, 0xB4, 0x81, 0xB0, 0x06, 0x1C, 0x88, 0x46
	.byte 0x6D, 0x46, 0x01, 0x24, 0x01, 0x20, 0x28, 0xF7, 0x6F, 0xFD, 0x04, 0x40, 0x2C, 0x80, 0x30, 0x1C
	.byte 0x41, 0x46, 0x31, 0xF7, 0xAD, 0xFF, 0x69, 0x46, 0x08, 0x88, 0x00, 0x28, 0x01, 0xD0, 0x28, 0xF7
	.byte 0x49, 0xFD, 0x01, 0xB0, 0x08, 0xBC, 0x98, 0x46, 0x70, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00
	.byte 0x70, 0xB5, 0x46, 0x46, 0x40, 0xB4, 0x81, 0xB0, 0x06, 0x1C, 0x88, 0x46, 0x6D, 0x46, 0x01, 0x24
	.byte 0x01, 0x20, 0x28, 0xF7, 0x51, 0xFD, 0x04, 0x40, 0x2C, 0x80, 0x30, 0x1C, 0x41, 0x46, 0x31, 0xF7
	.byte 0xA1, 0xFF, 0x69, 0x46, 0x08, 0x88, 0x00, 0x28, 0x01, 0xD0, 0x28, 0xF7, 0x2B, 0xFD, 0x01, 0xB0
	.byte 0x08, 0xBC, 0x98, 0x46, 0x70, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00

	thumb_func_start func_080D7AAC
func_080D7AAC: @ 0x080D7AAC
	push {lr}
	adds r3, r0, #0
	ldr r0, .L080D7ACC @ =vtable_unk_080E5B54
	str r0, [r3, #4]
	ldr r2, .L080D7AD0 @ =gUnk_03000410
	ldr r0, [r3]
	str r0, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L080D7AC8
	adds r0, r3, #0
	bl __builtin_delete
.L080D7AC8:
	pop {r0}
	bx r0
	.align 2, 0
.L080D7ACC: .4byte vtable_unk_080E5B54
.L080D7AD0: .4byte gUnk_03000410

	thumb_func_start func_080D7AD4
func_080D7AD4: @ 0x080D7AD4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L080D7AFC @ =vtable_unk_080E5B0C
	str r0, [r4, #0x30]
	ldr r0, .L080D7B00 @ =vtable_unk_080E5B18
	str r0, [r4, #8]
	adds r0, r4, #0
	adds r0, #0x1c
	movs r1, #0
	bl func_080D7944
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0800959C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080D7AFC: .4byte vtable_unk_080E5B0C
.L080D7B00: .4byte vtable_unk_080E5B18

	thumb_func_start func_080D7B04
func_080D7B04: @ 0x080D7B04
	push {lr}
	adds r3, r0, #0
	ldr r0, .L080D7B24 @ =vtable_unk_080E5B54
	str r0, [r3, #4]
	ldr r2, .L080D7B28 @ =gUnk_03000410
	ldr r0, [r3]
	str r0, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L080D7B20
	adds r0, r3, #0
	bl __builtin_delete
.L080D7B20:
	pop {r0}
	bx r0
	.align 2, 0
.L080D7B24: .4byte vtable_unk_080E5B54
.L080D7B28: .4byte gUnk_03000410

	thumb_func_start func_080D7B2C
func_080D7B2C: @ 0x080D7B2C
	push {lr}
	bl func_080098AC
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080D7B38
func_080D7B38: @ 0x080D7B38
	push {lr}
	bl func_080098AC
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080D7B44
func_080D7B44: @ 0x080D7B44
	push {lr}
	bl func_080098AC
	pop {r0}
	bx r0
	.align 2, 0

	.section ".text.code_080D7CFC"

	thumb_func_start func_080D7E64
func_080D7E64: @ 0x080D7E64
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r5, r1, #0
	movs r0, #0xac
	lsls r0, r0, #1
	adds r1, r3, r0
	ldr r0, [r1]
	lsls r0, r0, #3
	adds r0, #4
	adds r1, r1, r0
	movs r2, #0xae
	lsls r2, r2, #1
	adds r0, r3, r2
	cmp r0, r1
	beq .L080D7E88
.L080D7E82:
	adds r0, #8
	cmp r0, r1
	bne .L080D7E82
.L080D7E88:
	adds r1, r3, #0
	adds r1, #0x14
	ldr r0, [r3, #0x14]
	lsls r0, r0, #3
	adds r0, #4
	adds r1, r1, r0
	adds r2, r3, #0
	adds r2, #0x18
	adds r4, r3, #4
	ldr r0, [r3]
	cmp r2, r1
	beq .L080D7EA6
.L080D7EA0:
	adds r2, #8
	cmp r2, r1
	bne .L080D7EA0
.L080D7EA6:
	lsls r0, r0, #3
	adds r0, #4
	adds r0, r3, r0
	adds r1, r4, #0
	cmp r1, r0
	beq .L080D7EB8
.L080D7EB2:
	adds r1, #8
	cmp r1, r0
	bne .L080D7EB2
.L080D7EB8:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq .L080D7EC6
	adds r0, r3, #0
	bl __builtin_delete
.L080D7EC6:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_080D7ECC
func_080D7ECC: @ 0x080D7ECC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	subs r1, r1, r4
	asrs r1, r1, #3
	cmp r1, #0
	ble .L080D7EFE
	ldr r5, [r2]
.L080D7EDA:
	asrs r3, r1, #1
	lsls r0, r3, #3
	adds r0, r4, r0
	movs r2, #0
	ldrh r6, [r0]
	cmp r5, r6
	bhs .L080D7EEA
	movs r2, #1
.L080D7EEA:
	cmp r2, #0
	beq .L080D7EF2
	adds r1, r3, #0
	b .L080D7EFA
.L080D7EF2:
	adds r4, r0, #0
	adds r4, #8
	subs r0, r1, r3
	subs r1, r0, #1
.L080D7EFA:
	cmp r1, #0
	bgt .L080D7EDA
.L080D7EFE:
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080D7F08
func_080D7F08: @ 0x080D7F08
	push {r4, r5, lr}
	movs r4, #1
	adds r5, r0, #0
	adds r5, #0xa8
.L080D7F10:
	ldr r0, [r5]
	ldr r1, [r0]
	ldr r2, [r1, #0x40]
	adds r1, r4, #0
	bl _call_via_r2
	adds r1, r0, #0
	cmp r1, #0
	beq .L080D7F2E
	ldr r0, [r1, #0x14]
	ldr r2, [r0, #0x3c]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080D7F2E:
	adds r4, #1
	cmp r4, #0x23
	bls .L080D7F10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080D7F3C
func_080D7F3C: @ 0x080D7F3C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0xa8
	ldr r0, [r0]
	ldr r1, [r0]
	movs r2, #0x92
	lsls r2, r2, #1
	adds r1, r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	adds r4, #0x9c
	movs r0, #2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080D7F60
func_080D7F60: @ 0x080D7F60
	push {lr}
	adds r0, #0xac
	ldr r0, [r0]
	cmp r0, #0
	beq .L080D7F6E
	bl func_08050E8C
.L080D7F6E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080D7F74
func_080D7F74: @ 0x080D7F74
	push {lr}
	adds r0, #0xac
	ldr r0, [r0]
	cmp r0, #0
	beq .L080D7F82
	bl func_08050E5C
.L080D7F82:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080D7F88
func_080D7F88: @ 0x080D7F88
	push {lr}
	adds r0, #0xac
	ldr r0, [r0]
	cmp r0, #0
	beq .L080D7F96
	bl func_08050E74
.L080D7F96:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080D7F9C
func_080D7F9C: @ 0x080D7F9C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	adds r4, r3, #0
	mov sl, r2
	cmp r1, #0x49
	bgt .L080D8058
	adds r0, #0xa8
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r1, #0x40]
	ldr r1, [sp, #0x14]
	bl _call_via_r2
	adds r7, r0, #0
	cmp r7, #0
	bne .L080D7FCA
	b .L080D8106
.L080D7FCA:
	add r1, sp, #8
	ldr r0, .L080D8050 @ =0x000003FF
	mov r8, r0
	mov r2, sl
	mov r0, r8
	ands r2, r0
	ldrh r3, [r1]
	ldr r5, .L080D8054 @ =0xFFFFFC00
	adds r0, r5, #0
	ands r0, r3
	orrs r0, r2
	strh r0, [r1]
	lsls r4, r4, #0x10
	lsrs r2, r4, #0x10
	movs r0, #0x3f
	mov sb, r0
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
	ldr r4, [sp, #0x38]
	lsls r2, r4, #0x10
	lsrs r0, r2, #0x10
	mov r4, sb
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
	mov r4, sp
	mov r0, sp
	movs r2, #6
	bl memcpy
	ldr r0, [sp, #0x3c]
	strb r0, [r4, #6]
	adds r0, r7, #0
	mov r1, sp
	bl SetLocation__12AActorEntityRC13ActorLocation
	ldr r0, [r7, #0x14]
	ldr r1, [r0, #0x20]
	adds r0, r7, #0
	bl _call_via_r1
	b .L080D8106
	.align 2, 0
.L080D8050: .4byte 0x000003FF
.L080D8054: .4byte 0xFFFFFC00
.L080D8058:
	ldr r0, [sp, #0x10]
	adds r0, #0xa8
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r1, #0x40]
	ldr r1, [sp, #0x14]
	bl _call_via_r2
	adds r7, r0, #0
	cmp r7, #0
	beq .L080D8106
	mov r5, sp
	ldr r1, .L080D8130 @ =0x000003FF
	mov r8, r1
	mov r1, sl
	mov r2, r8
	ands r1, r2
	ldrh r2, [r5]
	ldr r3, .L080D8134 @ =0xFFFFFC00
	adds r0, r3, #0
	ands r0, r2
	orrs r0, r1
	strh r0, [r5]
	lsls r2, r4, #0x10
	lsrs r0, r2, #0x10
	movs r4, #0x3f
	mov sb, r4
	ands r0, r4
	lsls r0, r0, #2
	ldrb r1, [r5, #1]
	movs r4, #3
	adds r6, r4, #0
	ands r6, r1
	orrs r6, r0
	strb r6, [r5, #1]
	lsrs r2, r2, #0x16
	mov r0, r8
	ands r2, r0
	ldrh r1, [r5, #2]
	adds r0, r3, #0
	ands r0, r1
	orrs r0, r2
	strh r0, [r5, #2]
	ldr r2, [sp, #0x38]
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	mov r2, sb
	ands r0, r2
	lsls r0, r0, #2
	ldrb r2, [r5, #3]
	ands r4, r2
	orrs r4, r0
	strb r4, [r5, #3]
	lsrs r1, r1, #0x16
	mov r0, r8
	ands r1, r0
	ldrh r0, [r5, #4]
	ands r3, r0
	orrs r3, r1
	strh r3, [r5, #4]
	mov r0, sp
	ldrh r1, [r0]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x16
	lsrs r6, r6, #2
	ldrh r2, [r0, #2]
	ldr r5, .L080D8130 @ =0x000003FF
	ands r2, r5
	lsls r2, r2, #6
	orrs r2, r6
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	lsrs r4, r4, #2
	ldrh r3, [r0, #4]
	ands r3, r5
	lsls r3, r3, #6
	orrs r3, r4
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r7, #0
	bl SetLocation__7AEntityUiii
	ldr r0, [r7, #0x14]
	ldr r1, [r0, #0x20]
	adds r0, r7, #0
	bl _call_via_r1
.L080D8106:
	ldr r1, [sp, #0x14]
	cmp r1, #0
	bne .L080D815A
	mov r2, sl
	cmp r2, #0x19
	bne .L080D8120
	ldr r0, [sp, #0x10]
	adds r0, #0x8c
	ldr r0, [r0]
	ldr r4, .L080D8138 @ =0x00001CD4
	adds r0, r0, r4
	bl func_080A0A90
.L080D8120:
	movs r1, #0
	mov r0, sl
	subs r0, #0x35
	cmp r0, #0xfe
	bhi .L080D813C
	mov r1, sl
	subs r1, #0x34
	b .L080D8148
	.align 2, 0
.L080D8130: .4byte 0x000003FF
.L080D8134: .4byte 0xFFFFFC00
.L080D8138: .4byte 0x00001CD4
.L080D813C:
	ldr r0, .L080D816C @ =0xFFFFFECB
	add r0, sl
	cmp r0, #0xfe
	bhi .L080D8148
	ldr r1, .L080D8170 @ =0xFFFFFECC
	add r1, sl
.L080D8148:
	cmp r1, #0
	ble .L080D815A
	ldr r0, [sp, #0x10]
	adds r0, #0x8c
	ldr r0, [r0]
	ldr r2, .L080D8174 @ =0x00001BD8
	adds r0, r0, r2
	bl func_0800EECC
.L080D815A:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080D816C: .4byte 0xFFFFFECB
.L080D8170: .4byte 0xFFFFFECC
.L080D8174: .4byte 0x00001BD8

	thumb_func_start sub_080D8178
sub_080D8178: @ 0x080D8178
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r4, .L080D82D8 @ =0xFFFFFA70
	add sp, r4
	ldr r2, .L080D82DC @ =0x000004DC
	add r2, sp
	str r0, [r2]
	mov sl, r1
	add r0, sp, #0x10
	movs r1, #0x1e
	movs r2, #4
	bl func_080091A4
	add r6, sp, #0x34
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0x20
	bl func_08009744
	mov r7, sl
	adds r7, #0x10
	movs r2, #0
	mov r3, sl
	ldrh r0, [r3, #0x10]
	movs r1, #0x80
	orrs r0, r1
	strh r0, [r3, #0x10]
	movs r4, #0x87
	lsls r4, r4, #3
	add r4, sp
	str r2, [r4]
	str r2, [r4, #4]
	ldr r0, .L080D82E0 @ =vtable_unk_080E5AF0
	str r0, [r4, #8]
	str r7, [r4, #0xc]
	mov r5, sl
	adds r5, #0x68
	adds r0, r5, #0
	bl func_08008AE0
	ldr r1, [r0, #8]
	ldr r2, [r1, #0x10]
	adds r1, r4, #0
	bl _call_via_r2
	adds r0, r5, #0
	bl func_08008AF0
	adds r0, r4, #0
	movs r1, #2
	bl func_080098AC
	movs r1, #0x87
	lsls r1, r1, #3
	add r1, sp
	movs r5, #0xf2
	lsls r5, r5, #5
	adds r0, r5, #0
	strh r0, [r1]
	ldrh r0, [r4]
	mov r2, sl
	strh r0, [r2, #0x10]
	movs r0, #0x3f
	strh r0, [r1]
	mov r1, sl
	adds r1, #0x60
	ldrh r0, [r4]
	strh r0, [r1]
	mov r5, sl
	adds r5, #0xd0
	adds r2, #0xc0
	ldr r0, .L080D82E4 @ =0x0000046C
	add r0, sp
	str r2, [r0]
	ldr r3, .L080D82E4 @ =0x0000046C
	add r3, sp
	movs r0, #0x9c
	lsls r0, r0, #3
	add r0, sp
	str r3, [r0]
	ldr r1, [r5, #4]
	ldr r0, [r5, #0xc]
	cmp r1, r0
	beq .L080D8308
	cmp r1, #0
	beq .L080D822C
	str r2, [r1]
.L080D822C:
	ldr r0, [r5, #4]
	adds r0, #4
	str r0, [r5, #4]
	ldr r1, .L080D82E8 @ =0x00000544
	add r1, sp
	str r7, [r1]
	adds r6, r5, #0
	movs r2, #0xc4
	add r2, sl
	mov r8, r2
	movs r3, #0x8f
	lsls r3, r3, #3
	add r3, sp
	movs r4, #0xa7
	lsls r4, r4, #3
	add r4, sp
	str r3, [r4]
	mov r5, sl
	adds r5, #0xc8
	ldr r7, .L080D82EC @ =0x0000056C
	add r7, sp
	str r5, [r7]
	ldr r0, .L080D82F0 @ =0x00000484
	add r0, sp
	ldr r1, .L080D82F4 @ =0x0000053C
	add r1, sp
	str r0, [r1]
	mov r2, sl
	adds r2, #0xcc
	movs r3, #0xae
	lsls r3, r3, #3
	add r3, sp
	str r2, [r3]
	movs r4, #0x92
	lsls r4, r4, #3
	add r4, sp
	movs r5, #0xa8
	lsls r5, r5, #3
	add r5, sp
	str r4, [r5]
	mov r7, sl
	adds r7, #0xa0
	ldr r0, .L080D82F8 @ =0x0000055C
	add r0, sp
	str r7, [r0]
	mov r1, sl
	adds r1, #0x8c
	movs r2, #0xaa
	lsls r2, r2, #3
	add r2, sp
	str r1, [r2]
	mov r3, sl
	adds r3, #0xb0
	movs r4, #0xad
	lsls r4, r4, #3
	add r4, sp
	str r3, [r4]
	mov r5, sl
	adds r5, #0x90
	ldr r7, .L080D82FC @ =0x00000554
	add r7, sp
	str r5, [r7]
	mov r0, sl
	adds r0, #0xa8
	ldr r1, .L080D8300 @ =0x00000564
	add r1, sp
	str r0, [r1]
	mov r2, sl
	adds r2, #0x88
	ldr r3, .L080D8304 @ =0x0000054C
	add r3, sp
	str r2, [r3]
	mov r4, sl
	adds r4, #0x9c
	movs r5, #0xab
	lsls r5, r5, #3
	add r5, sp
	str r4, [r5]
	mov r7, sl
	adds r7, #0xa4
	movs r0, #0xac
	lsls r0, r0, #3
	add r0, sp
	str r7, [r0]
	b .L080D843A
	.align 2, 0
.L080D82D8: .4byte 0xFFFFFA70
.L080D82DC: .4byte 0x000004DC
.L080D82E0: .4byte vtable_unk_080E5AF0
.L080D82E4: .4byte 0x0000046C
.L080D82E8: .4byte 0x00000544
.L080D82EC: .4byte 0x0000056C
.L080D82F0: .4byte 0x00000484
.L080D82F4: .4byte 0x0000053C
.L080D82F8: .4byte 0x0000055C
.L080D82FC: .4byte 0x00000554
.L080D8300: .4byte 0x00000564
.L080D8304: .4byte 0x0000054C
.L080D8308:
	adds r6, r1, #0
	movs r0, #1
	ldr r1, .L080D8350 @ =0x00000474
	add r1, sp
	str r0, [r1]
	ldr r0, [r5]
	subs r0, r6, r0
	asrs r4, r0, #2
	movs r0, #0x8e
	lsls r0, r0, #3
	add r0, sp
	str r4, [r0]
	ldr r2, .L080D8350 @ =0x00000474
	add r2, sp
	ldr r0, [r1]
	movs r1, #0x8e
	lsls r1, r1, #3
	add r1, sp
	cmp r4, r0
	bhs .L080D8332
	adds r1, r2, #0
.L080D8332:
	ldr r0, [r1]
	adds r0, r4, r0
	cmp r0, #0
	beq .L080D8354
	lsls r4, r0, #2
	adds r0, r4, #0
	bl malloc
	mov sb, r4
	cmp r0, #0
	bne .L080D8358
	mov r0, sb
	bl func_080D3BC0
	b .L080D8358
	.align 2, 0
.L080D8350: .4byte 0x00000474
.L080D8354:
	movs r0, #0
	mov sb, r0
.L080D8358:
	adds r7, r0, #0
	ldr r1, [r5]
	cmp r6, r1
	beq .L080D836C
	subs r4, r6, r1
	adds r2, r4, #0
	bl memmove
	adds r4, r0, r4
	b .L080D836E
.L080D836C:
	adds r4, r7, #0
.L080D836E:
	ldr r0, .L080D846C @ =0x00000474
	add r0, sp
	ldr r1, [r0]
	mov r2, sl
	adds r2, #0x10
	ldr r3, .L080D8470 @ =0x00000544
	add r3, sp
	str r2, [r3]
	mov r6, sl
	adds r6, #0xd0
	ldr r2, [r5]
	movs r0, #0xc4
	add r0, sl
	mov r8, r0
	movs r3, #0x8f
	lsls r3, r3, #3
	add r3, sp
	movs r0, #0xa7
	lsls r0, r0, #3
	add r0, sp
	str r3, [r0]
	mov r3, sl
	adds r3, #0xc8
	ldr r0, .L080D8474 @ =0x0000056C
	add r0, sp
	str r3, [r0]
	ldr r3, .L080D8478 @ =0x00000484
	add r3, sp
	ldr r0, .L080D847C @ =0x0000053C
	add r0, sp
	str r3, [r0]
	mov r3, sl
	adds r3, #0xcc
	movs r0, #0xae
	lsls r0, r0, #3
	add r0, sp
	str r3, [r0]
	movs r3, #0x92
	lsls r3, r3, #3
	add r3, sp
	movs r0, #0xa8
	lsls r0, r0, #3
	add r0, sp
	str r3, [r0]
	mov r3, sl
	adds r3, #0xa0
	ldr r0, .L080D8480 @ =0x0000055C
	add r0, sp
	str r3, [r0]
	subs r3, #0x14
	movs r0, #0xaa
	lsls r0, r0, #3
	add r0, sp
	str r3, [r0]
	adds r3, #0x24
	movs r0, #0xad
	lsls r0, r0, #3
	add r0, sp
	str r3, [r0]
	subs r3, #0x20
	ldr r0, .L080D8484 @ =0x00000554
	add r0, sp
	str r3, [r0]
	adds r3, #0x18
	ldr r0, .L080D8488 @ =0x00000564
	add r0, sp
	str r3, [r0]
	subs r3, #0x20
	ldr r0, .L080D848C @ =0x0000054C
	add r0, sp
	str r3, [r0]
	adds r3, #0x14
	movs r0, #0xab
	lsls r0, r0, #3
	add r0, sp
	str r3, [r0]
	adds r3, #8
	movs r0, #0xac
	lsls r0, r0, #3
	add r0, sp
	str r3, [r0]
	cmp r1, #0
	beq .L080D8426
.L080D8414:
	movs r3, #0x9c
	lsls r3, r3, #3
	add r3, sp
	ldr r3, [r3]
	ldr r0, [r3]
	stm r4!, {r0}
	subs r1, #1
	cmp r1, #0
	bne .L080D8414
.L080D8426:
	cmp r2, #0
	beq .L080D8430
	adds r0, r2, #0
	bl free
.L080D8430:
	mov r1, sb
	adds r0, r1, r7
	str r7, [r5]
	str r4, [r5, #4]
	str r0, [r5, #0xc]
.L080D843A:
	mov sb, r6
	movs r0, #0x8f
	lsls r0, r0, #3
	add r0, sp
	mov r2, r8
	str r2, [r0]
	movs r3, #0xa7
	lsls r3, r3, #3
	add r3, sp
	ldr r3, [r3]
	ldr r4, .L080D8490 @ =0x000004E4
	add r4, sp
	str r3, [r4]
	ldr r4, [r6, #4]
	ldr r0, [r6, #0xc]
	cmp r4, r0
	beq .L080D8494
	cmp r4, #0
	beq .L080D8462
	str r2, [r4]
.L080D8462:
	ldr r0, [r6, #4]
	adds r0, #4
	str r0, [r6, #4]
	b .L080D8532
	.align 2, 0
.L080D846C: .4byte 0x00000474
.L080D8470: .4byte 0x00000544
.L080D8474: .4byte 0x0000056C
.L080D8478: .4byte 0x00000484
.L080D847C: .4byte 0x0000053C
.L080D8480: .4byte 0x0000055C
.L080D8484: .4byte 0x00000554
.L080D8488: .4byte 0x00000564
.L080D848C: .4byte 0x0000054C
.L080D8490: .4byte 0x000004E4
.L080D8494:
	adds r7, r4, #0
	movs r0, #1
	movs r1, #0x90
	lsls r1, r1, #3
	add r1, sp
	str r0, [r1]
	ldr r0, [r6]
	subs r0, r7, r0
	asrs r4, r0, #2
	ldr r0, .L080D84DC @ =0x0000047C
	add r0, sp
	str r4, [r0]
	movs r2, #0x90
	lsls r2, r2, #3
	add r2, sp
	ldr r0, [r1]
	ldr r1, .L080D84DC @ =0x0000047C
	add r1, sp
	cmp r4, r0
	bhs .L080D84BE
	adds r1, r2, #0
.L080D84BE:
	ldr r0, [r1]
	adds r0, r4, r0
	cmp r0, #0
	beq .L080D84E0
	lsls r4, r0, #2
	adds r0, r4, #0
	bl malloc
	mov r8, r4
	cmp r0, #0
	bne .L080D84E4
	mov r0, r8
	bl func_080D3BC0
	b .L080D84E4
	.align 2, 0
.L080D84DC: .4byte 0x0000047C
.L080D84E0:
	movs r0, #0
	mov r8, r0
.L080D84E4:
	adds r5, r0, #0
	mov r4, sb
	ldr r1, [r4]
	cmp r7, r1
	beq .L080D84FA
	subs r4, r7, r1
	adds r2, r4, #0
	bl memmove
	adds r4, r0, r4
	b .L080D84FC
.L080D84FA:
	adds r4, r5, #0
.L080D84FC:
	movs r0, #0x90
	lsls r0, r0, #3
	add r0, sp
	ldr r1, [r0]
	mov r7, sb
	ldr r2, [r7]
	cmp r1, #0
	beq .L080D851C
.L080D850C:
	ldr r3, .L080D8564 @ =0x000004E4
	add r3, sp
	ldr r3, [r3]
	ldr r0, [r3]
	stm r4!, {r0}
	subs r1, #1
	cmp r1, #0
	bne .L080D850C
.L080D851C:
	cmp r2, #0
	beq .L080D8526
	adds r0, r2, #0
	bl free
.L080D8526:
	mov r7, r8
	adds r0, r7, r5
	mov r1, sb
	str r5, [r1]
	str r4, [r1, #4]
	str r0, [r1, #0xc]
.L080D8532:
	mov sb, r6
	ldr r0, .L080D8568 @ =0x00000484
	add r0, sp
	ldr r2, .L080D856C @ =0x0000056C
	add r2, sp
	ldr r2, [r2]
	str r2, [r0]
	ldr r3, .L080D8570 @ =0x0000053C
	add r3, sp
	ldr r3, [r3]
	movs r4, #0x9d
	lsls r4, r4, #3
	add r4, sp
	str r3, [r4]
	ldr r4, [r6, #4]
	ldr r0, [r6, #0xc]
	cmp r4, r0
	beq .L080D8574
	cmp r4, #0
	beq .L080D855C
	str r2, [r4]
.L080D855C:
	ldr r0, [r6, #4]
	adds r0, #4
	str r0, [r6, #4]
	b .L080D8614
	.align 2, 0
.L080D8564: .4byte 0x000004E4
.L080D8568: .4byte 0x00000484
.L080D856C: .4byte 0x0000056C
.L080D8570: .4byte 0x0000053C
.L080D8574:
	adds r7, r4, #0
	movs r0, #1
	ldr r1, .L080D85BC @ =0x0000048C
	add r1, sp
	str r0, [r1]
	ldr r0, [r6]
	subs r0, r7, r0
	asrs r4, r0, #2
	movs r0, #0x91
	lsls r0, r0, #3
	add r0, sp
	str r4, [r0]
	ldr r2, .L080D85BC @ =0x0000048C
	add r2, sp
	ldr r0, [r1]
	movs r1, #0x91
	lsls r1, r1, #3
	add r1, sp
	cmp r4, r0
	bhs .L080D859E
	adds r1, r2, #0
.L080D859E:
	ldr r0, [r1]
	adds r0, r4, r0
	cmp r0, #0
	beq .L080D85C0
	lsls r4, r0, #2
	adds r0, r4, #0
	bl malloc
	mov r8, r4
	cmp r0, #0
	bne .L080D85C4
	mov r0, r8
	bl func_080D3BC0
	b .L080D85C4
	.align 2, 0
.L080D85BC: .4byte 0x0000048C
.L080D85C0:
	movs r0, #0
	mov r8, r0
.L080D85C4:
	adds r5, r0, #0
	mov r0, sb
	ldr r1, [r0]
	cmp r7, r1
	beq .L080D85DC
	subs r4, r7, r1
	adds r0, r5, #0
	adds r2, r4, #0
	bl memmove
	adds r4, r0, r4
	b .L080D85DE
.L080D85DC:
	adds r4, r5, #0
.L080D85DE:
	ldr r0, .L080D8648 @ =0x0000048C
	add r0, sp
	ldr r1, [r0]
	mov r3, sb
	ldr r2, [r3]
	cmp r1, #0
	beq .L080D85FE
.L080D85EC:
	movs r7, #0x9d
	lsls r7, r7, #3
	add r7, sp
	ldr r7, [r7]
	ldr r0, [r7]
	stm r4!, {r0}
	subs r1, #1
	cmp r1, #0
	bne .L080D85EC
.L080D85FE:
	cmp r2, #0
	beq .L080D8608
	adds r0, r2, #0
	bl free
.L080D8608:
	mov r1, r8
	adds r0, r1, r5
	mov r2, sb
	str r5, [r2]
	str r4, [r2, #4]
	str r0, [r2, #0xc]
.L080D8614:
	adds r5, r6, #0
	movs r0, #0x92
	lsls r0, r0, #3
	add r0, sp
	movs r3, #0xae
	lsls r3, r3, #3
	add r3, sp
	ldr r3, [r3]
	str r3, [r0]
	movs r4, #0xa8
	lsls r4, r4, #3
	add r4, sp
	ldr r4, [r4]
	mov sb, r4
	ldr r4, [r5, #4]
	ldr r0, [r5, #0xc]
	cmp r4, r0
	beq .L080D864C
	cmp r4, #0
	beq .L080D863E
	str r3, [r4]
.L080D863E:
	ldr r0, [r5, #4]
	adds r0, #4
	str r0, [r5, #4]
	b .L080D86E0
	.align 2, 0
.L080D8648: .4byte 0x0000048C
.L080D864C:
	adds r7, r4, #0
	movs r0, #1
	movs r1, #0x93
	lsls r1, r1, #3
	add r1, sp
	str r0, [r1]
	ldr r0, [r5]
	subs r0, r7, r0
	asrs r4, r0, #2
	ldr r0, .L080D8694 @ =0x00000494
	add r0, sp
	str r4, [r0]
	movs r2, #0x93
	lsls r2, r2, #3
	add r2, sp
	ldr r0, [r1]
	ldr r1, .L080D8694 @ =0x00000494
	add r1, sp
	cmp r4, r0
	bhs .L080D8676
	adds r1, r2, #0
.L080D8676:
	ldr r0, [r1]
	adds r0, r4, r0
	cmp r0, #0
	beq .L080D8698
	lsls r4, r0, #2
	adds r0, r4, #0
	bl malloc
	mov r8, r4
	cmp r0, #0
	bne .L080D869C
	mov r0, r8
	bl func_080D3BC0
	b .L080D869C
	.align 2, 0
.L080D8694: .4byte 0x00000494
.L080D8698:
	movs r0, #0
	mov r8, r0
.L080D869C:
	adds r6, r0, #0
	ldr r1, [r5]
	cmp r7, r1
	beq .L080D86B0
	subs r4, r7, r1
	adds r2, r4, #0
	bl memmove
	adds r4, r0, r4
	b .L080D86B2
.L080D86B0:
	adds r4, r6, #0
.L080D86B2:
	movs r0, #0x93
	lsls r0, r0, #3
	add r0, sp
	ldr r1, [r0]
	ldr r2, [r5]
	cmp r1, #0
	beq .L080D86CC
.L080D86C0:
	mov r7, sb
	ldr r0, [r7]
	stm r4!, {r0}
	subs r1, #1
	cmp r1, #0
	bne .L080D86C0
.L080D86CC:
	cmp r2, #0
	beq .L080D86D6
	adds r0, r2, #0
	bl free
.L080D86D6:
	mov r1, r8
	adds r0, r1, r6
	str r6, [r5]
	str r4, [r5, #4]
	str r0, [r5, #0xc]
.L080D86E0:
	movs r0, #4
	bl __builtin_new
	ldr r2, .L080D87FC @ =0x00000544
	add r2, sp
	ldr r1, [r2]
	bl func_08009300
	ldr r3, .L080D8800 @ =0x0000055C
	add r3, sp
	ldr r5, [r3]
	adds r4, r0, #0
	adds r6, r5, #0
	ldr r0, [r6]
	cmp r4, r0
	beq .L080D870A
	cmp r0, #0
	beq .L080D870A
	movs r1, #3
	bl func_08009324
.L080D870A:
	str r4, [r5]
	movs r0, #0x68
	bl __builtin_new
	movs r7, #0xaa
	lsls r7, r7, #3
	add r7, sp
	ldr r7, [r7]
	ldr r1, [r7]
	bl func_0803B4B0
	movs r1, #0xad
	lsls r1, r1, #3
	add r1, sp
	ldr r5, [r1]
	adds r4, r0, #0
	ldr r1, [r5]
	cmp r4, r1
	beq .L080D8740
	cmp r1, #0
	beq .L080D8740
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080D8740:
	str r4, [r5]
	ldr r2, .L080D8804 @ =0x00000554
	add r2, sp
	ldr r2, [r2]
	ldr r0, [r2]
	cmp r0, #0x2a
	bne .L080D8814
	mov r0, sl
	adds r0, #0x94
	ldrb r1, [r0]
	adds r6, r0, #0
	cmp r1, #0
	beq .L080D8814
	ldr r3, .L080D8808 @ =0x00000564
	add r3, sp
	ldr r5, [r3]
	movs r4, #0xaa
	lsls r4, r4, #3
	add r4, sp
	ldr r4, [r4]
	ldr r1, [r4]
	ldr r7, .L080D880C @ =0x0000054C
	add r7, sp
	ldr r7, [r7]
	ldr r2, [r7]
	movs r4, #0x87
	lsls r4, r4, #3
	add r4, sp
	adds r0, r4, #0
	movs r3, #0
	bl func_0801FB7C
	ldr r2, [r4]
	ldr r1, .L080D8810 @ =0x0000049C
	add r1, sp
	ldr r0, .L080D8810 @ =0x0000049C
	add r0, sp
	str r4, [r0]
	str r2, [r1, #4]
	movs r0, #0
	str r0, [r4]
	adds r4, r2, #0
	ldr r0, .L080D8808 @ =0x00000564
	add r0, sp
	ldr r0, [r0]
	ldr r1, [r0]
	cmp r4, r1
	beq .L080D87B0
	cmp r1, #0
	beq .L080D87B0
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080D87B0:
	str r4, [r5]
	movs r0, #0x87
	lsls r0, r0, #3
	add r0, sp
	ldr r1, [r0]
	cmp r1, #0
	beq .L080D87CA
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080D87CA:
	ldr r1, [r6]
	lsls r1, r1, #8
	lsrs r1, r1, #0x10
	mov r0, sl
	adds r0, #0x98
	movs r2, #0
	ldrsh r5, [r0, r2]
	adds r0, #2
	movs r3, #0
	ldrsh r4, [r0, r3]
	mov r0, sl
	adds r2, r5, #0
	adds r3, r4, #0
	bl func_080DC2B4
	movs r0, #0
	str r0, [sp]
	mov r0, sl
	movs r1, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl func_080DC360
	b .L080D8884
	.align 2, 0
.L080D87FC: .4byte 0x00000544
.L080D8800: .4byte 0x0000055C
.L080D8804: .4byte 0x00000554
.L080D8808: .4byte 0x00000564
.L080D880C: .4byte 0x0000054C
.L080D8810: .4byte 0x0000049C
.L080D8814:
	ldr r4, .L080D88A8 @ =0x00000564
	add r4, sp
	ldr r5, [r4]
	movs r6, #0xaa
	lsls r6, r6, #3
	add r6, sp
	ldr r6, [r6]
	ldr r1, [r6]
	ldr r7, .L080D88AC @ =0x0000054C
	add r7, sp
	ldr r7, [r7]
	ldr r2, [r7]
	movs r4, #0x87
	lsls r4, r4, #3
	add r4, sp
	adds r0, r4, #0
	movs r3, #1
	bl func_0801FB7C
	ldr r2, [r4]
	ldr r1, .L080D88B0 @ =0x000004A4
	add r1, sp
	ldr r0, .L080D88B0 @ =0x000004A4
	add r0, sp
	str r4, [r0]
	str r2, [r1, #4]
	movs r0, #0
	str r0, [r4]
	adds r4, r2, #0
	ldr r0, .L080D88A8 @ =0x00000564
	add r0, sp
	ldr r0, [r0]
	ldr r1, [r0]
	cmp r4, r1
	beq .L080D886A
	cmp r1, #0
	beq .L080D886A
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080D886A:
	str r4, [r5]
	movs r0, #0x87
	lsls r0, r0, #3
	add r0, sp
	ldr r1, [r0]
	cmp r1, #0
	beq .L080D8884
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080D8884:
	movs r0, #0
	movs r1, #0xab
	lsls r1, r1, #3
	add r1, sp
	ldr r1, [r1]
	str r0, [r1]
	ldr r2, .L080D88B4 @ =0x00000554
	add r2, sp
	ldr r2, [r2]
	ldr r0, [r2]
	cmp r0, #0x2f
	bls .L080D889E
	b .L080D8FE8
.L080D889E:
	lsls r0, r0, #2
	ldr r1, .L080D88B8 @ =.L080D88BC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L080D88A8: .4byte 0x00000564
.L080D88AC: .4byte 0x0000054C
.L080D88B0: .4byte 0x000004A4
.L080D88B4: .4byte 0x00000554
.L080D88B8: .4byte .L080D88BC
.L080D88BC: @ jump table
	.4byte .L080D897C @ case 0
	.4byte .L080D89D4 @ case 1
	.4byte .L080D8FE8 @ case 2
	.4byte .L080D8BC8 @ case 3
	.4byte .L080D8B6E @ case 4
	.4byte .L080D8C30 @ case 5
	.4byte .L080D8C8C @ case 6
	.4byte .L080D8AC4 @ case 7
	.4byte .L080D8B20 @ case 8
	.4byte .L080D8CE8 @ case 9
	.4byte .L080D8DE0 @ case 10
	.4byte .L080D8DE0 @ case 11
	.4byte .L080D8DE0 @ case 12
	.4byte .L080D8DE0 @ case 13
	.4byte .L080D8DE0 @ case 14
	.4byte .L080D8DE0 @ case 15
	.4byte .L080D8DE0 @ case 16
	.4byte .L080D8DE0 @ case 17
	.4byte .L080D8DE0 @ case 18
	.4byte .L080D8DE0 @ case 19
	.4byte .L080D8DE0 @ case 20
	.4byte .L080D8DE0 @ case 21
	.4byte .L080D8DE0 @ case 22
	.4byte .L080D8DE0 @ case 23
	.4byte .L080D8DE0 @ case 24
	.4byte .L080D8DE0 @ case 25
	.4byte .L080D8DE0 @ case 26
	.4byte .L080D8DE0 @ case 27
	.4byte .L080D8DE0 @ case 28
	.4byte .L080D8DE0 @ case 29
	.4byte .L080D8DE0 @ case 30
	.4byte .L080D8DE0 @ case 31
	.4byte .L080D8E24 @ case 32
	.4byte .L080D8FA8 @ case 33
	.4byte .L080D8FA8 @ case 34
	.4byte .L080D8FA8 @ case 35
	.4byte .L080D8FA8 @ case 36
	.4byte .L080D8E6C @ case 37
	.4byte .L080D8DE0 @ case 38
	.4byte .L080D8F3C @ case 39
	.4byte .L080D8DE0 @ case 40
	.4byte .L080D8DA4 @ case 41
	.4byte .L080D8DE0 @ case 42
	.4byte .L080D8DE0 @ case 43
	.4byte .L080D8DE0 @ case 44
	.4byte .L080D8EF4 @ case 45
	.4byte .L080D8DE0 @ case 46
	.4byte .L080D8DE0 @ case 47
.L080D897C:
	ldr r1, .L080D89C0 @ =0x00000363
	mov r0, sl
	movs r2, #0
	bl func_080DC294
	ldr r0, .L080D89C4 @ =gUnk_0300040C
	ldr r2, [r0]
	movs r3, #0xdb
	lsls r3, r3, #2
	adds r2, r2, r3
	movs r0, #0x20
	rsbs r0, r0, #0
	ldr r4, .L080D89C8 @ =0x000004EC
	add r4, sp
	ldrh r4, [r4]
	ands r0, r4
	movs r1, #6
	orrs r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, .L080D89CC @ =0xFFFFFF00
	ldr r5, .L080D89C8 @ =0x000004EC
	add r5, sp
	ldrh r5, [r5]
	ands r1, r5
	orrs r1, r0
	ldr r0, .L080D89D0 @ =0xFFFFF81F
	ands r1, r0
	movs r3, #0x1d
	movs r0, #1
	strb r0, [r2]
	str r3, [r2, #4]
	strh r1, [r2, #8]
	b .L080D8FE8
	.align 2, 0
.L080D89C0: .4byte 0x00000363
.L080D89C4: .4byte gUnk_0300040C
.L080D89C8: .4byte 0x000004EC
.L080D89CC: .4byte 0xFFFFFF00
.L080D89D0: .4byte 0xFFFFF81F
.L080D89D4:
	ldr r6, .L080D8AB4 @ =0x00000564
	add r6, sp
	ldr r6, [r6]
	ldr r0, [r6]
	ldr r1, [r0]
	movs r7, #0x94
	lsls r7, r7, #1
	adds r1, r1, r7
	ldr r1, [r1]
	bl _call_via_r1
	movs r0, #0xc
	bl __builtin_new
	movs r1, #1
	str r1, [sp]
	movs r1, #0
	movs r2, #0x1f
	movs r3, #0
	bl func_0803C54C
	mov r4, sl
	adds r4, #0xb4
	adds r5, r0, #0
	ldr r1, [r4]
	adds r6, r4, #0
	cmp r5, r1
	beq .L080D8A1C
	cmp r1, #0
	beq .L080D8A1C
	ldr r0, [r1, #4]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080D8A1C:
	str r5, [r4]
	movs r0, #0xaa
	lsls r0, r0, #3
	add r0, sp
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, .L080D8AB8 @ =0x00002210
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge .L080D8A48
	ldr r3, .L080D8ABC @ =0x000034C4
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne .L080D8A48
	ldr r0, [r6]
	ldr r1, [r0, #4]
	ldr r1, [r1, #0xc]
	bl _call_via_r1
.L080D8A48:
	ldr r4, [r6]
	movs r5, #0
	ldr r7, .L080D8AB4 @ =0x00000564
	add r7, sp
	ldr r7, [r7]
	ldr r0, [r7]
	ldr r1, [r0]
	adds r1, #0xb0
	ldr r1, [r1]
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080D8A7C
	movs r1, #0xaa
	lsls r1, r1, #3
	add r1, sp
	ldr r1, [r1]
	ldr r0, [r1]
	ldrh r1, [r0, #0x12]
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x1a
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L080D8A7E
.L080D8A7C:
	movs r5, #1
.L080D8A7E:
	adds r2, r5, #0
	movs r3, #0xaa
	lsls r3, r3, #3
	add r3, sp
	ldr r3, [r3]
	ldr r1, [r3]
	adds r1, #0x10
	adds r0, r4, #0
	adds r0, #8
	bl func_0803CD4C
	ldr r0, [r6]
	movs r4, #0xaa
	lsls r4, r4, #3
	add r4, sp
	ldr r4, [r4]
	ldr r1, [r4]
	ldr r1, [r1, #8]
	adds r0, #8
	bl func_0803D3A0
	ldr r5, .L080D8AC0 @ =0x0000055C
	add r5, sp
	ldr r5, [r5]
	ldr r0, [r5]
	b .L080D8D7C
	.align 2, 0
.L080D8AB4: .4byte 0x00000564
.L080D8AB8: .4byte 0x00002210
.L080D8ABC: .4byte 0x000034C4
.L080D8AC0: .4byte 0x0000055C
.L080D8AC4:
	movs r4, #1
	movs r6, #0xab
	lsls r6, r6, #3
	add r6, sp
	ldr r6, [r6]
	str r4, [r6]
	movs r0, #0x10
	bl __builtin_new
	str r4, [sp]
	movs r1, #4
	str r1, [sp, #4]
	movs r1, #0
	movs r2, #0x1f
	movs r3, #0
	bl func_0803BF78
	mov r4, sl
	adds r4, #0xb8
	adds r5, r0, #0
	ldr r1, [r4]
	adds r7, r4, #0
	cmp r5, r1
	beq .L080D8B04
	cmp r1, #0
	beq .L080D8B04
	ldr r0, [r1, #4]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080D8B04:
	str r5, [r4]
	ldr r0, [r7]
	ldr r1, [r0, #4]
	ldr r1, [r1, #0xc]
	bl _call_via_r1
	ldr r7, .L080D8B1C @ =0x0000055C
	add r7, sp
	ldr r7, [r7]
	ldr r0, [r7]
	b .L080D8D7C
	.align 2, 0
.L080D8B1C: .4byte 0x0000055C
.L080D8B20:
	movs r4, #1
	movs r0, #0xab
	lsls r0, r0, #3
	add r0, sp
	ldr r0, [r0]
	str r4, [r0]
	movs r0, #0x10
	bl __builtin_new
	str r4, [sp]
	movs r1, #5
	str r1, [sp, #4]
	movs r1, #0
	movs r2, #0x1f
	movs r3, #0
	bl func_0803BF78
	mov r4, sl
	adds r4, #0xb8
	adds r5, r0, #0
	ldr r1, [r4]
	adds r7, r4, #0
	cmp r5, r1
	beq .L080D8B60
	cmp r1, #0
	beq .L080D8B60
	ldr r0, [r1, #4]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080D8B60:
	str r5, [r4]
	ldr r0, [r7]
	ldr r1, [r0, #4]
	ldr r1, [r1, #0xc]
	bl _call_via_r1
	b .L080D8D74
.L080D8B6E:
	movs r4, #1
	movs r2, #0xab
	lsls r2, r2, #3
	add r2, sp
	ldr r2, [r2]
	str r4, [r2]
	movs r0, #0x10
	bl __builtin_new
	str r4, [sp]
	str r4, [sp, #4]
	movs r1, #0
	movs r2, #0x1f
	movs r3, #0
	bl func_0803BF78
	mov r4, sl
	adds r4, #0xb8
	adds r5, r0, #0
	ldr r1, [r4]
	adds r7, r4, #0
	cmp r5, r1
	beq .L080D8BAC
	cmp r1, #0
	beq .L080D8BAC
	ldr r0, [r1, #4]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080D8BAC:
	str r5, [r4]
	ldr r0, [r7]
	ldr r1, [r0, #4]
	ldr r1, [r1, #0xc]
	bl _call_via_r1
	ldr r3, .L080D8BC4 @ =0x0000055C
	add r3, sp
	ldr r3, [r3]
	ldr r0, [r3]
	b .L080D8D7C
	.align 2, 0
.L080D8BC4: .4byte 0x0000055C
.L080D8BC8:
	movs r4, #1
	movs r5, #0xab
	lsls r5, r5, #3
	add r5, sp
	ldr r5, [r5]
	str r4, [r5]
	ldr r6, .L080D8C2C @ =0x00000564
	add r6, sp
	ldr r6, [r6]
	ldr r0, [r6]
	ldr r1, [r0]
	movs r7, #0x94
	lsls r7, r7, #1
	adds r1, r1, r7
	ldr r1, [r1]
	bl _call_via_r1
	movs r0, #0x10
	bl __builtin_new
	str r4, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r2, #0x1f
	movs r3, #0
	bl func_0803BF78
	mov r4, sl
	adds r4, #0xb8
	adds r5, r0, #0
	ldr r1, [r4]
	adds r7, r4, #0
	cmp r5, r1
	beq .L080D8C1C
	cmp r1, #0
	beq .L080D8C1C
	ldr r0, [r1, #4]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080D8C1C:
	str r5, [r4]
	ldr r0, [r7]
	ldr r1, [r0, #4]
	ldr r1, [r1, #0xc]
	bl _call_via_r1
	b .L080D8D74
	.align 2, 0
.L080D8C2C: .4byte 0x00000564
.L080D8C30:
	movs r4, #1
	movs r2, #0xab
	lsls r2, r2, #3
	add r2, sp
	ldr r2, [r2]
	str r4, [r2]
	movs r0, #0x10
	bl __builtin_new
	str r4, [sp]
	movs r1, #2
	str r1, [sp, #4]
	movs r1, #0
	movs r2, #0x1f
	movs r3, #0
	bl func_0803BF78
	mov r4, sl
	adds r4, #0xb8
	adds r5, r0, #0
	ldr r1, [r4]
	adds r7, r4, #0
	cmp r5, r1
	beq .L080D8C70
	cmp r1, #0
	beq .L080D8C70
	ldr r0, [r1, #4]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080D8C70:
	str r5, [r4]
	ldr r0, [r7]
	ldr r1, [r0, #4]
	ldr r1, [r1, #0xc]
	bl _call_via_r1
	ldr r3, .L080D8C88 @ =0x0000055C
	add r3, sp
	ldr r3, [r3]
	ldr r0, [r3]
	b .L080D8D7C
	.align 2, 0
.L080D8C88: .4byte 0x0000055C
.L080D8C8C:
	movs r4, #1
	movs r5, #0xab
	lsls r5, r5, #3
	add r5, sp
	ldr r5, [r5]
	str r4, [r5]
	movs r0, #0x10
	bl __builtin_new
	str r4, [sp]
	movs r1, #3
	str r1, [sp, #4]
	movs r1, #0
	movs r2, #0x1f
	movs r3, #0
	bl func_0803BF78
	mov r4, sl
	adds r4, #0xb8
	adds r5, r0, #0
	ldr r1, [r4]
	adds r7, r4, #0
	cmp r5, r1
	beq .L080D8CCC
	cmp r1, #0
	beq .L080D8CCC
	ldr r0, [r1, #4]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080D8CCC:
	str r5, [r4]
	ldr r0, [r7]
	ldr r1, [r0, #4]
	ldr r1, [r1, #0xc]
	bl _call_via_r1
	ldr r6, .L080D8CE4 @ =0x0000055C
	add r6, sp
	ldr r6, [r6]
	ldr r0, [r6]
	b .L080D8D7C
	.align 2, 0
.L080D8CE4: .4byte 0x0000055C
.L080D8CE8:
	movs r0, #6
	movs r7, #0xab
	lsls r7, r7, #3
	add r7, sp
	ldr r7, [r7]
	str r0, [r7]
	movs r0, #4
	bl __builtin_new
	adds r6, r0, #0
	movs r5, #0x87
	lsls r5, r5, #3
	add r5, sp
	adds r0, r5, #0
	bl func_0800835C
	ldr r4, .L080D8D88 @ =0x0000043C
	add r4, sp
	adds r0, r4, #0
	bl func_0800770C
	movs r0, #1
	str r0, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0x1f
	movs r3, #0
	bl func_08050CC0
	mov r4, sl
	adds r4, #0xac
	adds r5, r0, #0
	ldr r0, [r4]
	adds r6, r4, #0
	cmp r5, r0
	beq .L080D8D3E
	cmp r0, #0
	beq .L080D8D3E
	movs r1, #3
	bl func_08050D0C
.L080D8D3E:
	str r5, [r4]
	ldr r0, .L080D8D88 @ =0x0000043C
	add r0, sp
	movs r1, #2
	bl func_08007714
	movs r0, #0x87
	lsls r0, r0, #3
	add r0, sp
	movs r1, #2
	bl func_08008364
	ldr r0, [r6]
	bl func_08050D68
	ldr r0, [r6]
	ldr r1, .L080D8D8C @ =gUnk_080F05B8
	ldr r2, .L080D8D90 @ =gUnk_080F05C0
	ldr r3, .L080D8D94 @ =gUnk_080F05C8
	ldr r5, .L080D8D98 @ =gUnk_080F05D4
	movs r4, #0
	str r5, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	bl func_08050E0C
.L080D8D74:
	ldr r1, .L080D8D9C @ =0x0000055C
	add r1, sp
	ldr r1, [r1]
	ldr r0, [r1]
.L080D8D7C:
	ldr r1, .L080D8DA0 @ =0x00000889
	movs r2, #1
	movs r3, #1
	bl func_0800934C
	b .L080D8FE8
	.align 2, 0
.L080D8D88: .4byte 0x0000043C
.L080D8D8C: .4byte gUnk_080F05B8
.L080D8D90: .4byte gUnk_080F05C0
.L080D8D94: .4byte gUnk_080F05C8
.L080D8D98: .4byte gUnk_080F05D4
.L080D8D9C: .4byte 0x0000055C
.L080D8DA0: .4byte 0x00000889
.L080D8DA4:
	ldr r0, .L080D8E10 @ =gUnk_0300040C
	ldr r2, [r0]
	movs r3, #0xdb
	lsls r3, r3, #2
	adds r2, r2, r3
	movs r0, #0x20
	rsbs r0, r0, #0
	movs r4, #0x9e
	lsls r4, r4, #3
	add r4, sp
	ldrh r4, [r4]
	ands r0, r4
	movs r1, #6
	orrs r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, .L080D8E14 @ =0xFFFFFF00
	movs r5, #0x9e
	lsls r5, r5, #3
	add r5, sp
	ldrh r5, [r5]
	ands r1, r5
	orrs r1, r0
	ldr r0, .L080D8E18 @ =0xFFFFF81F
	ands r1, r0
	movs r3, #0x1d
	movs r0, #1
	strb r0, [r2]
	str r3, [r2, #4]
	strh r1, [r2, #8]
.L080D8DE0:
	mov r1, sl
	adds r1, #0xe8
	movs r3, #0
	movs r0, #1
	strb r0, [r1]
	mov r0, sl
	adds r0, #0xe9
	strb r3, [r0]
	mov r6, sl
	ldrh r1, [r6, #0x10]
	ldr r0, .L080D8E1C @ =0x0000F0FF
	ands r0, r1
	strh r0, [r6, #0x10]
	mov r2, sl
	adds r2, #0x60
	ldrh r1, [r2]
	ldr r0, .L080D8E20 @ =0x0000FF3F
	ands r0, r1
	strh r0, [r2]
	mov r0, sl
	adds r0, #0x5c
	strh r3, [r0]
	b .L080D8F8E
	.align 2, 0
.L080D8E10: .4byte gUnk_0300040C
.L080D8E14: .4byte 0xFFFFFF00
.L080D8E18: .4byte 0xFFFFF81F
.L080D8E1C: .4byte 0x0000F0FF
.L080D8E20: .4byte 0x0000FF3F
.L080D8E24:
	mov r1, sl
	adds r1, #0xe8
	movs r3, #0
	movs r0, #1
	strb r0, [r1]
	mov r0, sl
	adds r0, #0xe9
	strb r3, [r0]
	mov r7, sl
	ldrh r1, [r7, #0x10]
	ldr r0, .L080D8E60 @ =0x0000F0FF
	ands r0, r1
	strh r0, [r7, #0x10]
	mov r2, sl
	adds r2, #0x60
	ldrh r1, [r2]
	ldr r0, .L080D8E64 @ =0x0000FF3F
	ands r0, r1
	strh r0, [r2]
	mov r0, sl
	adds r0, #0x5c
	strh r3, [r0]
	ldr r0, .L080D8E68 @ =gUnk_0300040C
	ldr r0, [r0]
	adds r0, #8
	mov r1, sl
	adds r1, #0x94
	ldr r1, [r1]
	b .L080D8F8A
	.align 2, 0
.L080D8E60: .4byte 0x0000F0FF
.L080D8E64: .4byte 0x0000FF3F
.L080D8E68: .4byte gUnk_0300040C
.L080D8E6C:
	mov r1, sl
	adds r1, #0xe8
	movs r3, #0
	movs r0, #1
	strb r0, [r1]
	mov r0, sl
	adds r0, #0xe9
	strb r3, [r0]
	mov r0, sl
	ldrh r1, [r0, #0x10]
	ldr r0, .L080D8EB8 @ =0x0000F0FF
	ands r0, r1
	mov r1, sl
	strh r0, [r1, #0x10]
	mov r2, sl
	adds r2, #0x60
	ldrh r1, [r2]
	ldr r0, .L080D8EBC @ =0x0000FF3F
	ands r0, r1
	strh r0, [r2]
	mov r0, sl
	adds r0, #0x5c
	strh r3, [r0]
	movs r2, #0xaa
	lsls r2, r2, #3
	add r2, sp
	ldr r2, [r2]
	ldr r1, [r2]
	ldr r3, .L080D8EC0 @ =0x00002C4A
	adds r0, r1, r3
	ldrb r2, [r0]
	lsls r0, r2, #0x19
	cmp r0, #0
	bge .L080D8EC4
	movs r1, #1
	rsbs r1, r1, #0
	b .L080D8EE6
	.align 2, 0
.L080D8EB8: .4byte 0x0000F0FF
.L080D8EBC: .4byte 0x0000FF3F
.L080D8EC0: .4byte 0x00002C4A
.L080D8EC4:
	ldr r4, .L080D8EE0 @ =0x00002C48
	adds r0, r1, r4
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #3
	bne .L080D8EE4
	lsrs r0, r2, #7
	movs r1, #2
	cmp r0, #0
	beq .L080D8EE6
	movs r1, #1
	b .L080D8EE6
	.align 2, 0
.L080D8EE0: .4byte 0x00002C48
.L080D8EE4:
	movs r1, #0
.L080D8EE6:
	ldr r0, .L080D8EF0 @ =gUnk_0300040C
	ldr r0, [r0]
	adds r0, #8
	b .L080D8F8A
	.align 2, 0
.L080D8EF0: .4byte gUnk_0300040C
.L080D8EF4:
	mov r1, sl
	adds r1, #0xe8
	movs r3, #0
	movs r0, #1
	strb r0, [r1]
	mov r0, sl
	adds r0, #0xe9
	strb r3, [r0]
	mov r5, sl
	ldrh r1, [r5, #0x10]
	ldr r0, .L080D8F30 @ =0x0000F0FF
	ands r0, r1
	strh r0, [r5, #0x10]
	mov r2, sl
	adds r2, #0x60
	ldrh r1, [r2]
	ldr r0, .L080D8F34 @ =0x0000FF3F
	ands r0, r1
	strh r0, [r2]
	mov r0, sl
	adds r0, #0x5c
	strh r3, [r0]
	ldr r0, .L080D8F38 @ =gUnk_0300040C
	ldr r0, [r0]
	adds r0, #8
	mov r1, sl
	adds r1, #0x94
	ldr r1, [r1]
	b .L080D8F8A
	.align 2, 0
.L080D8F30: .4byte 0x0000F0FF
.L080D8F34: .4byte 0x0000FF3F
.L080D8F38: .4byte gUnk_0300040C
.L080D8F3C:
	mov r1, sl
	adds r1, #0xe8
	movs r3, #0
	movs r0, #1
	strb r0, [r1]
	mov r0, sl
	adds r0, #0xe9
	strb r3, [r0]
	mov r6, sl
	ldrh r1, [r6, #0x10]
	ldr r0, .L080D8F98 @ =0x0000F0FF
	ands r0, r1
	strh r0, [r6, #0x10]
	mov r2, sl
	adds r2, #0x60
	ldrh r1, [r2]
	ldr r0, .L080D8F9C @ =0x0000FF3F
	ands r0, r1
	strh r0, [r2]
	mov r0, sl
	adds r0, #0x5c
	strh r3, [r0]
	ldr r0, .L080D8FA0 @ =gUnk_0300040C
	ldr r0, [r0]
	adds r2, r0, #0
	adds r2, #8
	movs r7, #0xaa
	lsls r7, r7, #3
	add r7, sp
	ldr r7, [r7]
	ldr r0, [r7]
	ldr r1, .L080D8FA4 @ =0x00002C4C
	adds r0, r0, r1
	movs r1, #0
	ldrb r0, [r0]
	cmp r0, #0
	bne .L080D8F88
	movs r1, #1
.L080D8F88:
	adds r0, r2, #0
.L080D8F8A:
	bl Push__12ScriptEnginei
.L080D8F8E:
	mov r0, sl
	bl func_080D7F3C
	b .L080D8FE8
	.align 2, 0
.L080D8F98: .4byte 0x0000F0FF
.L080D8F9C: .4byte 0x0000FF3F
.L080D8FA0: .4byte gUnk_0300040C
.L080D8FA4: .4byte 0x00002C4C
.L080D8FA8:
	mov r1, sl
	adds r1, #0xe8
	movs r3, #0
	movs r0, #1
	strb r0, [r1]
	mov r0, sl
	adds r0, #0xe9
	strb r3, [r0]
	mov r2, sl
	ldrh r1, [r2, #0x10]
	ldr r0, .L080D9024 @ =0x0000F0FF
	ands r0, r1
	strh r0, [r2, #0x10]
	adds r2, #0x60
	ldrh r1, [r2]
	ldr r0, .L080D9028 @ =0x0000FF3F
	ands r0, r1
	strh r0, [r2]
	mov r0, sl
	adds r0, #0x5c
	strh r3, [r0]
	ldr r0, .L080D902C @ =gUnk_0300040C
	ldr r0, [r0]
	adds r0, #8
	mov r1, sl
	adds r1, #0x94
	ldrb r1, [r1]
	bl Push__12ScriptEnginei
	mov r0, sl
	bl func_080D7F3C
.L080D8FE8:
	add r0, sp, #0x10
	bl func_08009268
	movs r3, #0xaa
	lsls r3, r3, #3
	add r3, sp
	ldr r3, [r3]
	ldr r0, [r3]
	ldr r1, [r0, #0x10]
	ldr r0, .L080D9030 @ =0x000004CC
	add r0, sp
	str r1, [r0]
	bl rand
	movs r4, #0
	ldr r5, .L080D9034 @ =0x000004F4
	add r5, sp
	str r4, [r5]
	movs r6, #0xab
	lsls r6, r6, #3
	add r6, sp
	ldr r6, [r6]
	ldr r0, [r6]
	cmp r0, #0x1d
	bhi .L080D90F4
	lsls r0, r0, #2
	ldr r1, .L080D9038 @ =.L080D903C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L080D9024: .4byte 0x0000F0FF
.L080D9028: .4byte 0x0000FF3F
.L080D902C: .4byte gUnk_0300040C
.L080D9030: .4byte 0x000004CC
.L080D9034: .4byte 0x000004F4
.L080D9038: .4byte .L080D903C
.L080D903C: @ jump table
	.4byte .L080D90B4 @ case 0
	.4byte .L080D90DC @ case 1
	.4byte .L080D90DC @ case 2
	.4byte .L080D90DC @ case 3
	.4byte .L080D90DC @ case 4
	.4byte .L080D90DC @ case 5
	.4byte .L080D90DC @ case 6
	.4byte .L080D90DC @ case 7
	.4byte .L080D90DC @ case 8
	.4byte .L080D90DC @ case 9
	.4byte .L080D90DC @ case 10
	.4byte .L080D90DC @ case 11
	.4byte .L080D90DC @ case 12
	.4byte .L080D90DC @ case 13
	.4byte .L080D90DC @ case 14
	.4byte .L080D90DC @ case 15
	.4byte .L080D90DC @ case 16
	.4byte .L080D90DC @ case 17
	.4byte .L080D90EC @ case 18
	.4byte .L080D90EC @ case 19
	.4byte .L080D90DC @ case 20
	.4byte .L080D90EC @ case 21
	.4byte .L080D90EC @ case 22
	.4byte .L080D90EC @ case 23
	.4byte .L080D90DC @ case 24
	.4byte .L080D90EC @ case 25
	.4byte .L080D90EC @ case 26
	.4byte .L080D90EC @ case 27
	.4byte .L080D90EC @ case 28
	.4byte .L080D90EC @ case 29
.L080D90B4:
	ldr r7, .L080D90D4 @ =0x0000055C
	add r7, sp
	ldr r7, [r7]
	ldr r0, [r7]
	bl func_080094A4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	ldr r0, .L080D90D8 @ =0x000004F4
	add r0, sp
	str r1, [r0]
	b .L080D90F4
	.align 2, 0
.L080D90D4: .4byte 0x0000055C
.L080D90D8: .4byte 0x000004F4
.L080D90DC:
	movs r1, #1
	ldr r2, .L080D90E8 @ =0x000004F4
	add r2, sp
	str r1, [r2]
	b .L080D90F4
	.align 2, 0
.L080D90E8: .4byte 0x000004F4
.L080D90EC:
	movs r3, #0
	ldr r4, .L080D9110 @ =0x000004F4
	add r4, sp
	str r3, [r4]
.L080D90F4:
	movs r5, #0xab
	lsls r5, r5, #3
	add r5, sp
	ldr r5, [r5]
	ldr r0, [r5]
	cmp r0, #0x1d
	bls .L080D9104
	b .L080D93E8
.L080D9104:
	lsls r0, r0, #2
	ldr r1, .L080D9114 @ =.L080D9118
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L080D9110: .4byte 0x000004F4
.L080D9114: .4byte .L080D9118
.L080D9118: @ jump table
	.4byte .L080D9190 @ case 0
	.4byte .L080D91BC @ case 1
	.4byte .L080D921C @ case 2
	.4byte .L080D9190 @ case 3
	.4byte .L080D9190 @ case 4
	.4byte .L080D9190 @ case 5
	.4byte .L080D91F4 @ case 6
	.4byte .L080D9190 @ case 7
	.4byte .L080D91BC @ case 8
	.4byte .L080D91BC @ case 9
	.4byte .L080D91F4 @ case 10
	.4byte .L080D91F4 @ case 11
	.4byte .L080D91F4 @ case 12
	.4byte .L080D91BC @ case 13
	.4byte .L080D9288 @ case 14
	.4byte .L080D9288 @ case 15
	.4byte .L080D9288 @ case 16
	.4byte .L080D92C4 @ case 17
	.4byte .L080D935C @ case 18
	.4byte .L080D93B4 @ case 19
	.4byte .L080D9288 @ case 20
	.4byte .L080D924C @ case 21
	.4byte .L080D924C @ case 22
	.4byte .L080D924C @ case 23
	.4byte .L080D924C @ case 24
	.4byte .L080D924C @ case 25
	.4byte .L080D924C @ case 26
	.4byte .L080D924C @ case 27
	.4byte .L080D924C @ case 28
	.4byte .L080D924C @ case 29
.L080D9190:
	mov r0, sl
	adds r0, #0xb4
	ldr r5, [r0]
	mov r6, sl
	adds r6, #0x6c
	subs r0, #0x4c
	bl func_08008AE0
	ldr r1, [r5, #4]
	str r0, [sp]
	ldr r4, [r1, #0x2c]
	adds r0, r5, #0
	add r1, sp, #0x34
	ldr r7, .L080D91B8 @ =0x00000544
	add r7, sp
	ldr r2, [r7]
	adds r3, r6, #0
	bl _call_via_r4
	b .L080D93E8
	.align 2, 0
.L080D91B8: .4byte 0x00000544
.L080D91BC:
	mov r0, sl
	adds r0, #0xb8
	ldr r5, [r0]
	mov r4, sl
	adds r4, #0x6c
	subs r0, #0x50
	bl func_08008AE0
	str r4, [sp]
	str r0, [sp, #4]
	ldr r0, .L080D91EC @ =0x0000056C
	add r0, sp
	ldr r0, [r0]
	str r0, [sp, #8]
	adds r0, r5, #0
	add r1, sp, #0x10
	add r2, sp, #0x34
	ldr r4, .L080D91F0 @ =0x00000544
	add r4, sp
	ldr r3, [r4]
	bl func_0803C00C
	b .L080D93E8
	.align 2, 0
.L080D91EC: .4byte 0x0000056C
.L080D91F0: .4byte 0x00000544
.L080D91F4:
	mov r0, sl
	adds r0, #0xac
	ldr r5, [r0]
	mov r4, sl
	adds r4, #0x6c
	subs r0, #0x44
	bl func_08008AE0
	str r4, [sp]
	str r0, [sp, #4]
	ldr r6, .L080D9218 @ =0x0000056C
	add r6, sp
	ldr r6, [r6]
	str r6, [sp, #8]
	adds r0, r5, #0
	add r1, sp, #0x10
	b .L080D9342
	.align 2, 0
.L080D9218: .4byte 0x0000056C
.L080D921C:
	mov r0, sl
	adds r0, #0xac
	ldr r5, [r0]
	cmp r5, #0
	beq .L080D924C
	mov r4, sl
	adds r4, #0x6c
	subs r0, #0x44
	bl func_08008AE0
	str r4, [sp]
	str r0, [sp, #4]
	ldr r0, .L080D9280 @ =0x0000056C
	add r0, sp
	ldr r0, [r0]
	str r0, [sp, #8]
	adds r0, r5, #0
	add r1, sp, #0x10
	add r2, sp, #0x34
	ldr r4, .L080D9284 @ =0x00000544
	add r4, sp
	ldr r3, [r4]
	bl func_08050D3C
.L080D924C:
	mov r0, sl
	adds r0, #0xe8
	ldrb r0, [r0]
	cmp r0, #0
	beq .L080D9258
	b .L080D93E8
.L080D9258:
	mov r0, sl
	adds r0, #0xb4
	ldr r6, [r0]
	cmp r6, #0
	bne .L080D9264
	b .L080D93E8
.L080D9264:
	mov r5, sl
	adds r5, #0x6c
	subs r0, #0x4c
	bl func_08008AE0
	ldr r1, [r6, #4]
	str r0, [sp]
	ldr r4, [r1, #0x2c]
	adds r0, r6, #0
	add r1, sp, #0x34
	ldr r6, .L080D9284 @ =0x00000544
	add r6, sp
	ldr r2, [r6]
	b .L080D93A2
	.align 2, 0
.L080D9280: .4byte 0x0000056C
.L080D9284: .4byte 0x00000544
.L080D9288:
	mov r0, sl
	adds r0, #0xac
	ldr r5, [r0]
	cmp r5, #0
	bne .L080D9294
	b .L080D93E8
.L080D9294:
	mov r4, sl
	adds r4, #0x6c
	subs r0, #0x44
	bl func_08008AE0
	str r4, [sp]
	str r0, [sp, #4]
	ldr r7, .L080D92BC @ =0x0000056C
	add r7, sp
	ldr r7, [r7]
	str r7, [sp, #8]
	adds r0, r5, #0
	add r1, sp, #0x10
	add r2, sp, #0x34
	ldr r4, .L080D92C0 @ =0x00000544
	add r4, sp
	ldr r3, [r4]
	bl func_08050D3C
	b .L080D93E8
	.align 2, 0
.L080D92BC: .4byte 0x0000056C
.L080D92C0: .4byte 0x00000544
.L080D92C4:
	mov r0, sl
	adds r0, #0xac
	ldr r5, [r0]
	cmp r5, #0
	bne .L080D92D0
	b .L080D93E8
.L080D92D0:
	add r0, sp, #0x10
	ldrh r2, [r0, #8]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, .L080D9350 @ =0xFFFFFF00
	adds r1, r3, #0
	ands r1, r2
	orrs r1, r0
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ands r1, r3
	orrs r1, r0
	movs r0, #0x7f
	ands r0, r1
	ands r1, r3
	orrs r1, r0
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ands r1, r3
	orrs r1, r0
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ands r1, r3
	orrs r1, r0
	movs r0, #0x89
	lsls r0, r0, #3
	add r0, sp
	bl func_080091E8
	mov r4, sl
	adds r4, #0x6c
	mov r0, sl
	adds r0, #0x68
	bl func_08008AE0
	str r4, [sp]
	str r0, [sp, #4]
	ldr r6, .L080D9354 @ =0x0000056C
	add r6, sp
	ldr r6, [r6]
	str r6, [sp, #8]
	adds r0, r5, #0
	movs r1, #0x89
	lsls r1, r1, #3
	add r1, sp
.L080D9342:
	add r2, sp, #0x34
	ldr r7, .L080D9358 @ =0x00000544
	add r7, sp
	ldr r3, [r7]
	bl func_08050D3C
	b .L080D93E8
	.align 2, 0
.L080D9350: .4byte 0xFFFFFF00
.L080D9354: .4byte 0x0000056C
.L080D9358: .4byte 0x00000544
.L080D935C:
	ldr r1, .L080D93AC @ =0x0000055C
	add r1, sp
	ldr r1, [r1]
	ldr r0, [r1]
	bl func_080094A4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	rsbs r1, r0, #0
	orrs r1, r0
	cmp r1, #0
	bge .L080D93E8
	mov r0, sl
	adds r0, #0xe8
	ldrb r0, [r0]
	cmp r0, #0
	bne .L080D93E8
	mov r0, sl
	adds r0, #0xb4
	ldr r6, [r0]
	cmp r6, #0
	beq .L080D93E8
	mov r5, sl
	adds r5, #0x6c
	subs r0, #0x4c
	bl func_08008AE0
	ldr r1, [r6, #4]
	str r0, [sp]
	ldr r4, [r1, #0x2c]
	adds r0, r6, #0
	add r1, sp, #0x34
	ldr r3, .L080D93B0 @ =0x00000544
	add r3, sp
	ldr r2, [r3]
.L080D93A2:
	adds r3, r5, #0
	bl _call_via_r4
	b .L080D93E8
	.align 2, 0
.L080D93AC: .4byte 0x0000055C
.L080D93B0: .4byte 0x00000544
.L080D93B4:
	mov r0, sl
	adds r0, #0xe8
	ldrb r0, [r0]
	cmp r0, #0
	bne .L080D93E8
	mov r0, sl
	adds r0, #0xb4
	ldr r6, [r0]
	cmp r6, #0
	beq .L080D93E8
	mov r5, sl
	adds r5, #0x6c
	subs r0, #0x4c
	bl func_08008AE0
	ldr r1, [r6, #4]
	str r0, [sp]
	ldr r4, [r1, #0x2c]
	adds r0, r6, #0
	add r1, sp, #0x34
	ldr r6, .L080D9404 @ =0x00000544
	add r6, sp
	ldr r2, [r6]
	adds r3, r5, #0
	bl _call_via_r4
.L080D93E8:
	movs r7, #0xab
	lsls r7, r7, #3
	add r7, sp
	ldr r7, [r7]
	ldr r0, [r7]
	cmp r0, #0x1d
	bls .L080D93FA
	bl .L080DAAE6
.L080D93FA:
	lsls r0, r0, #2
	ldr r1, .L080D9408 @ =.L080D940C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L080D9404: .4byte 0x00000544
.L080D9408: .4byte .L080D940C
.L080D940C: @ jump table
	.4byte .L080D9484 @ case 0
	.4byte .L080D9D46 @ case 1
	.4byte .L080DA278 @ case 2
	.4byte .L080D9630 @ case 3
	.4byte .L080D9708 @ case 4
	.4byte .L080D97E4 @ case 5
	.4byte .L080D99B4 @ case 6
	.4byte .L080D9CD4 @ case 7
	.4byte .L080DA13A @ case 8
	.4byte .L080DA238 @ case 9
	.4byte .L080D9C28 @ case 10
	.4byte .L080D9C96 @ case 11
	.4byte .L080D9974 @ case 12
	.4byte .L080D98D4 @ case 13
	.4byte .L080DA584 @ case 14
	.4byte .L080DA596 @ case 15
	.4byte .L080DA5BC @ case 16
	.4byte .L080DA5CE @ case 17
	.4byte .L080DA6E8 @ case 18
	.4byte .L080DA738 @ case 19
	.4byte .L080DA79C @ case 20
	.4byte .L080DA758 @ case 21
	.4byte .L080DA778 @ case 22
	.4byte .L080DA7C8 @ case 23
	.4byte .L080DAA50 @ case 24
	.4byte .L080DA7E0 @ case 25
	.4byte .L080DA814 @ case 26
	.4byte .L080DAA6C @ case 27
	.4byte .L080DAA9C @ case 28
	.4byte .L080DAACC @ case 29
.L080D9484:
	add r0, sp, #0x10
	ldrh r5, [r0, #4]
	ldrh r1, [r0]
	ldr r0, .L080D958C @ =0x000004AC
	add r0, sp
	str r1, [r0]
	movs r0, #0xc
	ands r0, r5
	cmp r0, #0
	bne .L080D949C
	bl .L080DAAE6
.L080D949C:
	mov r0, sl
	adds r0, #0xb4
	ldr r0, [r0]
	bl func_0803BE9C
	adds r6, r0, #0
	ldr r1, .L080D9590 @ =0x00000564
	add r1, sp
	ldr r1, [r1]
	ldr r0, [r1]
	ldr r1, [r0]
	ldr r2, [r1, #0x40]
	movs r1, #0x4b
	bl _call_via_r2
	adds r3, r0, #0
	ldr r0, .L080D9594 @ =gUnk_0300040C
	ldr r4, [r0]
	movs r2, #0xde
	lsls r2, r2, #2
	adds r2, r2, r4
	mov r8, r2
	ldr r7, .L080D9590 @ =0x00000564
	add r7, sp
	ldr r7, [r7]
	ldr r0, [r7]
	ldr r1, [r0]
	ldr r2, [r1, #0x40]
	movs r1, #0
	movs r7, #0xb0
	lsls r7, r7, #3
	add r7, sp
	str r3, [r7]
	bl _call_via_r2
	adds r2, r0, #0
	movs r0, #0xb0
	lsls r0, r0, #3
	add r0, sp
	ldr r3, [r0]
	cmp r6, #3
	beq .L080D94F8
	cmp r6, #0
	beq .L080D94F8
	bl .L080DAAE6
.L080D94F8:
	movs r6, #0
	movs r1, #0
	mov r7, r8
	ldr r0, [r7]
	cmp r0, #0
	bne .L080D9506
	movs r1, #1
.L080D9506:
	cmp r1, #0
	beq .L080D9534
	movs r1, #0xe3
	lsls r1, r1, #2
	adds r0, r4, r1
	movs r1, #0
	ldr r0, [r0]
	cmp r0, #0
	bne .L080D951A
	movs r1, #1
.L080D951A:
	cmp r1, #0
	beq .L080D9534
	movs r7, #0x9a
	lsls r7, r7, #3
	adds r0, r4, r7
	movs r1, #0
	ldr r0, [r0]
	cmp r0, #0
	bne .L080D952E
	movs r1, #1
.L080D952E:
	cmp r1, #0
	beq .L080D9534
	movs r6, #1
.L080D9534:
	cmp r6, #0
	bne .L080D953C
	bl .L080DAAE6
.L080D953C:
	cmp r3, #0
	beq .L080D955C
	adds r0, r3, #0
	ldr r1, .L080D9598 @ =0x0000057C
	add r1, sp
	str r2, [r1]
	bl func_08038108
	lsls r0, r0, #0x18
	ldr r3, .L080D9598 @ =0x0000057C
	add r3, sp
	ldr r2, [r3]
	cmp r0, #0
	beq .L080D955C
	bl .L080DAAE6
.L080D955C:
	ldr r0, [r2, #0x14]
	adds r0, #0x94
	ldr r1, [r0]
	adds r0, r2, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080D9572
	bl .L080DAAE6
.L080D9572:
	ldr r0, .L080D958C @ =0x000004AC
	add r0, sp
	ldrb r1, [r0, #1]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L080D95C4
	movs r0, #8
	ands r0, r5
	cmp r0, #0
	beq .L080D959C
	movs r0, #4
	b .L080D9606
	.align 2, 0
.L080D958C: .4byte 0x000004AC
.L080D9590: .4byte 0x00000564
.L080D9594: .4byte gUnk_0300040C
.L080D9598: .4byte 0x0000057C
.L080D959C:
	movs r0, #4
	ands r5, r0
	cmp r5, #0
	bne .L080D95A8
	bl .L080DAAE6
.L080D95A8:
	movs r0, #5
	movs r6, #0xab
	lsls r6, r6, #3
	add r6, sp
	ldr r6, [r6]
	str r0, [r6]
	ldr r7, .L080D95C0 @ =0x0000055C
	add r7, sp
	ldr r7, [r7]
	ldr r0, [r7]
	b .L080D9618
	.align 2, 0
.L080D95C0: .4byte 0x0000055C
.L080D95C4:
	movs r1, #0xaa
	lsls r1, r1, #3
	add r1, sp
	ldr r1, [r1]
	ldr r0, [r1]
	ldr r2, .L080D95F4 @ =0x000034C4
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne .L080D95F8
	movs r0, #8
	ands r0, r5
	cmp r0, #0
	beq .L080D95F8
	mov r0, sl
	adds r0, #0xb4
	ldr r0, [r0]
	ldr r1, [r0, #4]
	ldr r1, [r1, #0x14]
	bl _call_via_r1
	movs r0, #7
	bl .L080DA804
	.align 2, 0
.L080D95F4: .4byte 0x000034C4
.L080D95F8:
	movs r0, #4
	ands r5, r0
	cmp r5, #0
	bne .L080D9604
	bl .L080DAAE6
.L080D9604:
	movs r0, #3
.L080D9606:
	movs r4, #0xab
	lsls r4, r4, #3
	add r4, sp
	ldr r4, [r4]
	str r0, [r4]
	ldr r5, .L080D9628 @ =0x0000055C
	add r5, sp
	ldr r5, [r5]
	ldr r0, [r5]
.L080D9618:
	ldr r1, .L080D962C @ =0x00000889
	movs r2, #1
	movs r3, #1
	bl func_08009378
	bl .L080DAAE6
	.align 2, 0
.L080D9628: .4byte 0x0000055C
.L080D962C: .4byte 0x00000889
.L080D9630:
	ldr r6, .L080D96F4 @ =0x0000055C
	add r6, sp
	ldr r6, [r6]
	ldr r0, [r6]
	bl func_080094A4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r7, r1, #0x1f
	cmp r7, #0
	beq .L080D964E
	bl .L080DAAE6
.L080D964E:
	movs r4, #0x87
	lsls r4, r4, #3
	add r4, sp
	movs r0, #1
	mov r8, r0
	str r0, [r4]
	movs r0, #0x14
	bl __builtin_new
	movs r1, #0xaa
	lsls r1, r1, #3
	add r1, sp
	ldr r1, [r1]
	ldr r1, [r1]
	mov sb, r1
	movs r5, #0x89
	lsls r5, r5, #3
	add r5, sp
	adds r1, r5, #0
	ldm r4!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldr r1, .L080D96F8 @ =vtable_unk_080E5E74
	str r1, [r0]
	mov r1, sb
	str r1, [r0, #4]
	adds r2, r0, #0
	adds r2, #8
	movs r1, #0x89
	lsls r1, r1, #3
	add r1, sp
	ldm r1!, {r3, r4, r6}
	stm r2!, {r3, r4, r6}
	ldr r4, .L080D96FC @ =0x00000444
	add r4, sp
	str r0, [r4]
	movs r0, #0x10
	bl __builtin_new
	ldr r2, [r4]
	str r7, [r4]
	str r2, [r5]
	movs r1, #0xaa
	lsls r1, r1, #3
	add r1, sp
	ldr r1, [r1]
	ldr r3, [r1]
	ldr r1, .L080D9700 @ =vtable_unk_080E5EB4
	str r1, [r0]
	str r7, [r5]
	str r2, [r0, #4]
	str r3, [r0, #8]
	mov r2, r8
	strb r2, [r0, #0xc]
	movs r3, #0xac
	lsls r3, r3, #3
	add r3, sp
	ldr r5, [r3]
	adds r4, r0, #0
	adds r6, r5, #0
	ldr r1, [r6]
	cmp r4, r1
	beq .L080D96DA
	cmp r1, #0
	beq .L080D96DA
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080D96DA:
	str r4, [r5]
	movs r7, #0xac
	lsls r7, r7, #3
	add r7, sp
	ldr r7, [r7]
	ldr r0, [r7]
	movs r1, #0
	str r1, [r7]
	ldr r3, .L080D9704 @ =0x000004DC
	add r3, sp
	ldr r3, [r3]
	str r0, [r3]
	b .L080D98A0
	.align 2, 0
.L080D96F4: .4byte 0x0000055C
.L080D96F8: .4byte vtable_unk_080E5E74
.L080D96FC: .4byte 0x00000444
.L080D9700: .4byte vtable_unk_080E5EB4
.L080D9704: .4byte 0x000004DC
.L080D9708:
	ldr r4, .L080D97CC @ =0x0000055C
	add r4, sp
	ldr r4, [r4]
	ldr r0, [r4]
	bl func_080094A4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	lsls r4, r1, #0x18
	lsrs r7, r4, #0x18
	cmp r7, #0
	beq .L080D972A
	bl .L080DAAE6
.L080D972A:
	movs r0, #0x10
	bl __builtin_new
	adds r6, r0, #0
	movs r5, #0xaa
	lsls r5, r5, #3
	add r5, sp
	ldr r5, [r5]
	ldr r5, [r5]
	mov r8, r5
	ldr r0, .L080D97D0 @ =vtable_unk_080E5C14
	str r0, [r6]
	str r5, [r6, #4]
	movs r0, #0x14
	bl __builtin_new
	ldr r1, .L080D97D4 @ =vtable_unk_080E5E44
	str r1, [r0]
	strb r7, [r0, #4]
	adds r5, r0, #6
	movs r3, #0x8d
	lsls r3, r3, #2
	ldrh r2, [r0, #6]
	ldr r4, .L080D97D8 @ =0xFFFFFC00
	adds r1, r4, #0
	ands r1, r2
	orrs r1, r3
	strh r1, [r0, #6]
	ldrb r2, [r5, #1]
	movs r3, #3
	adds r1, r3, #0
	ands r1, r2
	strb r1, [r5, #1]
	ldrh r2, [r5, #2]
	adds r1, r4, #0
	ands r1, r2
	strh r1, [r5, #2]
	ldrb r1, [r5, #3]
	ands r3, r1
	strb r3, [r5, #3]
	ldrh r1, [r5, #4]
	ands r4, r1
	strh r4, [r5, #4]
	ldr r1, .L080D97DC @ =vtable_unk_080E5C24
	str r1, [r0]
	mov r1, r8
	str r1, [r0, #0xc]
	str r7, [r0, #0x10]
	str r0, [r6, #8]
	str r7, [r6, #0xc]
	movs r2, #0xac
	lsls r2, r2, #3
	add r2, sp
	ldr r4, [r2]
	adds r3, r4, #0
	ldr r1, [r3]
	cmp r6, r1
	beq .L080D97AE
	cmp r1, #0
	beq .L080D97AE
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080D97AE:
	str r6, [r4]
	movs r4, #0xac
	lsls r4, r4, #3
	add r4, sp
	ldr r4, [r4]
	ldr r1, [r4]
	movs r0, #0
	str r0, [r4]
	ldr r6, .L080D97E0 @ =0x000004DC
	add r6, sp
	ldr r6, [r6]
	str r1, [r6]
	bl func_080DB0CC
	.align 2, 0
.L080D97CC: .4byte 0x0000055C
.L080D97D0: .4byte vtable_unk_080E5C14
.L080D97D4: .4byte vtable_unk_080E5E44
.L080D97D8: .4byte 0xFFFFFC00
.L080D97DC: .4byte vtable_unk_080E5C24
.L080D97E0: .4byte 0x000004DC
.L080D97E4:
	ldr r7, .L080D98C0 @ =0x0000055C
	add r7, sp
	ldr r7, [r7]
	ldr r0, [r7]
	bl func_080094A4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r6, r1, #0x1f
	cmp r6, #0
	beq .L080D9802
	bl .L080DAAE6
.L080D9802:
	movs r4, #0x87
	lsls r4, r4, #3
	add r4, sp
	movs r0, #1
	str r0, [r4]
	movs r0, #0x14
	bl __builtin_new
	movs r1, #0xaa
	lsls r1, r1, #3
	add r1, sp
	ldr r1, [r1]
	ldr r1, [r1]
	mov r8, r1
	movs r5, #0x89
	lsls r5, r5, #3
	add r5, sp
	adds r1, r5, #0
	ldm r4!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldr r1, .L080D98C4 @ =vtable_unk_080E5E74
	str r1, [r0]
	mov r1, r8
	str r1, [r0, #4]
	adds r2, r0, #0
	adds r2, #8
	movs r1, #0x89
	lsls r1, r1, #3
	add r1, sp
	ldm r1!, {r3, r4, r7}
	stm r2!, {r3, r4, r7}
	ldr r4, .L080D98C8 @ =0x00000444
	add r4, sp
	str r0, [r4]
	movs r0, #0xc
	bl __builtin_new
	ldr r3, [r4]
	str r6, [r4]
	str r3, [r5]
	movs r1, #0xaa
	lsls r1, r1, #3
	add r1, sp
	ldr r1, [r1]
	ldr r2, [r1]
	ldr r1, .L080D98CC @ =vtable_unk_080E5E94
	str r1, [r0]
	str r2, [r0, #4]
	str r6, [r5]
	str r3, [r0, #8]
	movs r2, #0xac
	lsls r2, r2, #3
	add r2, sp
	ldr r5, [r2]
	adds r4, r0, #0
	adds r3, r5, #0
	ldr r1, [r3]
	cmp r4, r1
	beq .L080D9888
	cmp r1, #0
	beq .L080D9888
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080D9888:
	str r4, [r5]
	movs r4, #0xac
	lsls r4, r4, #3
	add r4, sp
	ldr r4, [r4]
	ldr r0, [r4]
	movs r1, #0
	str r1, [r4]
	ldr r6, .L080D98D0 @ =0x000004DC
	add r6, sp
	ldr r6, [r6]
	str r0, [r6]
.L080D98A0:
	ldr r0, .L080D98C8 @ =0x00000444
	add r0, sp
	ldr r1, [r0]
	cmp r1, #0
	bne .L080D98AE
	bl func_080DB0CC
.L080D98AE:
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
	bl func_080DB0CC
	.align 2, 0
.L080D98C0: .4byte 0x0000055C
.L080D98C4: .4byte vtable_unk_080E5E74
.L080D98C8: .4byte 0x00000444
.L080D98CC: .4byte vtable_unk_080E5E94
.L080D98D0: .4byte 0x000004DC
.L080D98D4:
	mov r4, sl
	adds r4, #0xb8
	ldr r0, [r4]
	bl func_0803BE9C
	cmp r0, #0
	beq .L080D98E6
	bl .L080DAAE6
.L080D98E6:
	movs r5, #0
	ldr r1, [r4]
	cmp r5, r1
	beq .L080D98FE
	cmp r1, #0
	beq .L080D98FE
	ldr r0, [r1, #4]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080D98FE:
	str r5, [r4]
	movs r0, #4
	bl __builtin_new
	adds r6, r0, #0
	movs r5, #0x87
	lsls r5, r5, #3
	add r5, sp
	adds r0, r5, #0
	bl func_0800835C
	ldr r4, .L080D9970 @ =0x0000043C
	add r4, sp
	adds r0, r4, #0
	bl func_0800770C
	movs r0, #1
	str r0, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0x1f
	movs r3, #0
	bl func_08050CC0
	mov r4, sl
	adds r4, #0xac
	adds r5, r0, #0
	ldr r0, [r4]
	adds r6, r4, #0
	cmp r5, r0
	beq .L080D994A
	cmp r0, #0
	beq .L080D994A
	movs r1, #3
	bl func_08050D0C
.L080D994A:
	str r5, [r4]
	ldr r0, .L080D9970 @ =0x0000043C
	add r0, sp
	movs r1, #2
	bl func_08007714
	movs r0, #0x87
	lsls r0, r0, #3
	add r0, sp
	movs r1, #2
	bl func_08008364
	ldr r0, [r6]
	bl func_08050D5C
	movs r0, #0xc
	bl .L080DA858
	.align 2, 0
.L080D9970: .4byte 0x0000043C
.L080D9974:
	mov r4, sl
	adds r4, #0xac
	ldr r0, [r4]
	bl func_08050D34
	cmp r0, #3
	beq .L080D9986
	bl .L080DAAE6
.L080D9986:
	ldr r0, [r4]
	ldr r1, .L080D99A4 @ =gUnk_080F05B8
	ldr r2, .L080D99A8 @ =gUnk_080F05C0
	ldr r3, .L080D99AC @ =gUnk_080F05C8
	ldr r5, .L080D99B0 @ =gUnk_080F05D4
	movs r4, #0
	str r5, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	bl func_08050E0C
	movs r0, #6
	bl .L080DAABA
	.align 2, 0
.L080D99A4: .4byte gUnk_080F05B8
.L080D99A8: .4byte gUnk_080F05C0
.L080D99AC: .4byte gUnk_080F05C8
.L080D99B0: .4byte gUnk_080F05D4
.L080D99B4:
	ldr r2, .L080D99FC @ =0x0000055C
	add r2, sp
	ldr r2, [r2]
	ldr r0, [r2]
	bl func_080094A4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r6, r1, #0x1f
	cmp r6, #0
	beq .L080D99D2
	bl .L080DAAE6
.L080D99D2:
	mov r4, sl
	adds r4, #0xac
	ldr r0, [r4]
	bl func_08050D34
	cmp r0, #6
	bne .L080D9A00
	add r0, sp, #0x10
	ldrh r0, [r0, #4]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne .L080D99F0
	bl .L080DAAE6
.L080D99F0:
	ldr r0, [r4]
	bl func_08050D74
	movs r0, #0xa
	bl .L080DA804
	.align 2, 0
.L080D99FC: .4byte 0x0000055C
.L080D9A00:
	ldr r0, [r4]
	bl func_08050DF0
	cmp r0, #2
	beq .L080D9AAC
	cmp r0, #2
	bgt .L080D9A16
	cmp r0, #1
	beq .L080D9A26
	bl .L080DAAE6
.L080D9A16:
	cmp r0, #3
	bne .L080D9A1C
	b .L080D9B40
.L080D9A1C:
	cmp r0, #4
	bne .L080D9A22
	b .L080D9C1C
.L080D9A22:
	bl .L080DAAE6
.L080D9A26:
	ldr r4, .L080D9A9C @ =0x0000055C
	add r4, sp
	ldr r4, [r4]
	ldr r0, [r4]
	ldr r1, .L080D9AA0 @ =0x00000889
	movs r2, #1
	movs r3, #1
	bl func_08009378
	movs r0, #0xb
	movs r5, #0xab
	lsls r5, r5, #3
	add r5, sp
	ldr r5, [r5]
	str r0, [r5]
	movs r4, #0x87
	lsls r4, r4, #3
	add r4, sp
	movs r0, #9
	str r0, [r4]
	movs r0, #0x14
	bl __builtin_new
	movs r7, #0xaa
	lsls r7, r7, #3
	add r7, sp
	ldr r7, [r7]
	ldr r7, [r7]
	mov r8, r7
	movs r5, #0x89
	lsls r5, r5, #3
	add r5, sp
	adds r1, r5, #0
	ldm r4!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldr r1, .L080D9AA4 @ =vtable_unk_080E5E74
	str r1, [r0]
	mov r1, r8
	str r1, [r0, #4]
	adds r2, r0, #0
	adds r2, #8
	movs r1, #0x89
	lsls r1, r1, #3
	add r1, sp
	ldm r1!, {r3, r4, r7}
	stm r2!, {r3, r4, r7}
	ldr r1, .L080D9AA8 @ =0x00000444
	add r1, sp
	str r6, [r1]
	str r0, [r5]
	movs r0, #0xc
	bl __builtin_new
	adds r1, r5, #0
	movs r2, #0
	bl func_0803B6FC
	b .L080D9BC6
	.align 2, 0
.L080D9A9C: .4byte 0x0000055C
.L080D9AA0: .4byte 0x00000889
.L080D9AA4: .4byte vtable_unk_080E5E74
.L080D9AA8: .4byte 0x00000444
.L080D9AAC:
	ldr r3, .L080D9B30 @ =0x0000055C
	add r3, sp
	ldr r3, [r3]
	ldr r0, [r3]
	ldr r1, .L080D9B34 @ =0x00000889
	movs r2, #1
	movs r3, #1
	bl func_08009378
	movs r0, #0xb
	movs r4, #0xab
	lsls r4, r4, #3
	add r4, sp
	ldr r4, [r4]
	str r0, [r4]
	movs r4, #0x87
	lsls r4, r4, #3
	add r4, sp
	movs r0, #9
	str r0, [r4]
	movs r0, #0x14
	bl __builtin_new
	movs r5, #0xaa
	lsls r5, r5, #3
	add r5, sp
	ldr r5, [r5]
	ldr r5, [r5]
	mov r8, r5
	movs r5, #0x89
	lsls r5, r5, #3
	add r5, sp
	adds r1, r5, #0
	ldm r4!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldr r1, .L080D9B38 @ =vtable_unk_080E5E74
	str r1, [r0]
	mov r4, r8
	str r4, [r0, #4]
	adds r2, r0, #0
	adds r2, #8
	movs r1, #0x89
	lsls r1, r1, #3
	add r1, sp
	ldm r1!, {r3, r4, r7}
	stm r2!, {r3, r4, r7}
	ldr r1, .L080D9B3C @ =0x00000444
	add r1, sp
	str r6, [r1]
	str r0, [r5]
	movs r0, #0xc
	bl __builtin_new
	adds r1, r5, #0
	movs r2, #1
	bl func_0803B6FC
	movs r6, #0xac
	lsls r6, r6, #3
	add r6, sp
	ldr r5, [r6]
	adds r4, r0, #0
	adds r7, r5, #0
	ldr r1, [r7]
	b .L080D9BD4
	.align 2, 0
.L080D9B30: .4byte 0x0000055C
.L080D9B34: .4byte 0x00000889
.L080D9B38: .4byte vtable_unk_080E5E74
.L080D9B3C: .4byte 0x00000444
.L080D9B40:
	ldr r1, .L080D9C08 @ =0x0000055C
	add r1, sp
	ldr r1, [r1]
	ldr r0, [r1]
	ldr r1, .L080D9C0C @ =0x00000889
	movs r2, #1
	movs r3, #1
	bl func_08009378
	movs r0, #0xb
	movs r2, #0xab
	lsls r2, r2, #3
	add r2, sp
	ldr r2, [r2]
	str r0, [r2]
	movs r4, #0x87
	lsls r4, r4, #3
	add r4, sp
	movs r0, #9
	str r0, [r4]
	movs r0, #0x14
	bl __builtin_new
	movs r3, #0xaa
	lsls r3, r3, #3
	add r3, sp
	ldr r3, [r3]
	ldr r3, [r3]
	mov r8, r3
	movs r5, #0x89
	lsls r5, r5, #3
	add r5, sp
	adds r1, r5, #0
	ldm r4!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldr r1, .L080D9C10 @ =vtable_unk_080E5E74
	str r1, [r0]
	mov r4, r8
	str r4, [r0, #4]
	adds r2, r0, #0
	adds r2, #8
	movs r1, #0x89
	lsls r1, r1, #3
	add r1, sp
	ldm r1!, {r3, r4, r7}
	stm r2!, {r3, r4, r7}
	ldr r4, .L080D9C14 @ =0x00000444
	add r4, sp
	str r0, [r4]
	movs r0, #0x10
	bl __builtin_new
	ldr r2, [r4]
	str r6, [r4]
	str r2, [r5]
	movs r7, #0xaa
	lsls r7, r7, #3
	add r7, sp
	ldr r7, [r7]
	ldr r3, [r7]
	movs r4, #0x88
	ldr r1, .L080D9C18 @ =vtable_unk_080E5D54
	str r1, [r0]
	str r6, [r5]
	str r2, [r0, #4]
	str r3, [r0, #8]
	str r4, [r0, #0xc]
.L080D9BC6:
	movs r1, #0xac
	lsls r1, r1, #3
	add r1, sp
	ldr r5, [r1]
	adds r4, r0, #0
	adds r2, r5, #0
	ldr r1, [r2]
.L080D9BD4:
	cmp r4, r1
	beq .L080D9BE8
	cmp r1, #0
	beq .L080D9BE8
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080D9BE8:
	str r4, [r5]
	ldr r0, .L080D9C14 @ =0x00000444
	add r0, sp
	ldr r1, [r0]
	cmp r1, #0
	bne .L080D9BF8
	bl .L080DAAE6
.L080D9BF8:
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
	bl .L080DAAE6
	.align 2, 0
.L080D9C08: .4byte 0x0000055C
.L080D9C0C: .4byte 0x00000889
.L080D9C10: .4byte vtable_unk_080E5E74
.L080D9C14: .4byte 0x00000444
.L080D9C18: .4byte vtable_unk_080E5D54
.L080D9C1C:
	ldr r0, [r4]
	bl func_08050D74
	movs r0, #0xa
	bl .L080DA804
.L080D9C28:
	mov r4, sl
	adds r4, #0xac
	ldr r0, [r4]
	bl func_08050D34
	cmp r0, #0
	beq .L080D9C3A
	bl .L080DAAE6
.L080D9C3A:
	movs r5, #0
	ldr r0, [r4]
	cmp r5, r0
	beq .L080D9C4C
	cmp r0, #0
	beq .L080D9C4C
	movs r1, #3
	bl func_08050D0C
.L080D9C4C:
	str r5, [r4]
	movs r0, #0x10
	bl __builtin_new
	movs r1, #1
	str r1, [sp]
	movs r1, #6
	str r1, [sp, #4]
	movs r1, #0
	movs r2, #0x1f
	movs r3, #0
	bl func_0803BF78
	mov r4, sl
	adds r4, #0xb8
	adds r5, r0, #0
	ldr r1, [r4]
	adds r7, r4, #0
	cmp r5, r1
	beq .L080D9C84
	cmp r1, #0
	beq .L080D9C84
	ldr r0, [r1, #4]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080D9C84:
	str r5, [r4]
	ldr r0, [r7]
	ldr r1, [r0, #4]
	ldr r1, [r1, #0xc]
	bl _call_via_r1
	movs r0, #1
	bl sub_080DA76C
.L080D9C96:
	ldr r5, .L080D9CCC @ =0x0000055C
	add r5, sp
	ldr r5, [r5]
	ldr r0, [r5]
	bl func_080094A4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	cmp r1, #0
	beq .L080D9CB4
	bl .L080DAAE6
.L080D9CB4:
	movs r6, #0xac
	lsls r6, r6, #3
	add r6, sp
	ldr r6, [r6]
	ldr r0, [r6]
	str r1, [r6]
	ldr r1, .L080D9CD0 @ =0x000004DC
	add r1, sp
	ldr r1, [r1]
	str r0, [r1]
	bl func_080DB0CC
	.align 2, 0
.L080D9CCC: .4byte 0x0000055C
.L080D9CD0: .4byte 0x000004DC
.L080D9CD4:
	mov r4, sl
	adds r4, #0xb4
	ldr r0, [r4]
	bl func_0803BE9C
	cmp r0, #0
	beq .L080D9CE6
	bl .L080DAAE6
.L080D9CE6:
	movs r5, #0
	ldr r1, [r4]
	cmp r5, r1
	beq .L080D9CFE
	cmp r1, #0
	beq .L080D9CFE
	ldr r0, [r1, #4]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080D9CFE:
	str r5, [r4]
	movs r0, #0x10
	bl __builtin_new
	movs r1, #1
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r2, #0x1f
	movs r3, #0
	bl func_0803BF78
	mov r4, sl
	adds r4, #0xb8
	adds r5, r0, #0
	ldr r1, [r4]
	adds r7, r4, #0
	cmp r5, r1
	beq .L080D9D34
	cmp r1, #0
	beq .L080D9D34
	ldr r0, [r1, #4]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080D9D34:
	str r5, [r4]
	ldr r0, [r7]
	ldr r1, [r0, #4]
	ldr r1, [r1, #0xc]
	bl _call_via_r1
	movs r0, #1
	bl .L080DAADC
.L080D9D46:
	mov r4, sl
	adds r4, #0xb8
	ldr r0, [r4]
	bl func_0803BE9C
	adds r7, r4, #0
	cmp r0, #3
	beq .L080D9D5A
	bl .L080DAAE6
.L080D9D5A:
	add r0, sp, #0x10
	ldrh r2, [r0, #4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne .L080D9D68
	b .L080DA11C
.L080D9D68:
	movs r3, #0
	movs r5, #0x9f
	lsls r5, r5, #3
	add r5, sp
	str r3, [r5]
	ldr r0, [r4]
	bl func_0803C540
	cmp r0, #6
	bls .L080D9D7E
	b .L080DA0E4
.L080D9D7E:
	lsls r0, r0, #2
	ldr r1, .L080D9D88 @ =.L080D9D8C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L080D9D88: .4byte .L080D9D8C
.L080D9D8C: @ jump table
	.4byte .L080D9DA8 @ case 0
	.4byte .L080DA014 @ case 1
	.4byte .L080D9E1C @ case 2
	.4byte .L080D9EBC @ case 3
	.4byte .L080D9F30 @ case 4
	.4byte .L080D9FA8 @ case 5
	.4byte .L080DA0C4 @ case 6
.L080D9DA8:
	movs r4, #0x87
	lsls r4, r4, #3
	add r4, sp
	movs r0, #3
	str r0, [r4]
	movs r0, #0x14
	bl __builtin_new
	movs r6, #0xaa
	lsls r6, r6, #3
	add r6, sp
	ldr r6, [r6]
	ldr r6, [r6]
	mov r8, r6
	movs r6, #0x89
	lsls r6, r6, #3
	add r6, sp
	adds r1, r6, #0
	ldm r4!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldr r1, .L080D9E10 @ =vtable_unk_080E5E74
	str r1, [r0]
	mov r1, r8
	str r1, [r0, #4]
	adds r2, r0, #0
	adds r2, #8
	movs r1, #0x89
	lsls r1, r1, #3
	add r1, sp
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldr r4, .L080D9E14 @ =0x00000444
	add r4, sp
	str r0, [r4]
	movs r0, #0xc
	bl __builtin_new
	ldr r5, [r4]
	movs r3, #0
	str r3, [r4]
	str r5, [r6]
	movs r1, #0xaa
	lsls r1, r1, #3
	add r1, sp
	ldr r1, [r1]
	ldr r2, [r1]
	ldr r1, .L080D9E18 @ =vtable_unk_080E5E54
	str r1, [r0]
	str r2, [r0, #4]
	str r3, [r6]
	str r5, [r0, #8]
	b .L080DA07A
	.align 2, 0
.L080D9E10: .4byte vtable_unk_080E5E74
.L080D9E14: .4byte 0x00000444
.L080D9E18: .4byte vtable_unk_080E5E54
.L080D9E1C:
	movs r0, #0x10
	bl __builtin_new
	adds r6, r0, #0
	movs r4, #0xaa
	lsls r4, r4, #3
	add r4, sp
	ldr r4, [r4]
	ldr r4, [r4]
	mov r8, r4
	movs r5, #1
	mov sb, r5
	ldr r0, .L080D9EAC @ =vtable_unk_080E5C14
	str r0, [r6]
	str r4, [r6, #4]
	movs r0, #0x14
	bl __builtin_new
	ldr r1, .L080D9EB0 @ =vtable_unk_080E5E44
	str r1, [r0]
	movs r1, #0
	strb r1, [r0, #4]
	adds r5, r0, #6
	movs r3, #0x8d
	lsls r3, r3, #2
	ldrh r2, [r0, #6]
	ldr r4, .L080D9EB4 @ =0xFFFFFC00
	adds r1, r4, #0
	ands r1, r2
	orrs r1, r3
	strh r1, [r0, #6]
	ldrb r2, [r5, #1]
	movs r3, #3
	adds r1, r3, #0
	ands r1, r2
	strb r1, [r5, #1]
	ldrh r2, [r5, #2]
	adds r1, r4, #0
	ands r1, r2
	strh r1, [r5, #2]
	ldrb r1, [r5, #3]
	ands r3, r1
	strb r3, [r5, #3]
	ldrh r1, [r5, #4]
	ands r4, r1
	strh r4, [r5, #4]
	ldr r1, .L080D9EB8 @ =vtable_unk_080E5C24
	str r1, [r0]
	mov r1, r8
	str r1, [r0, #0xc]
	mov r2, sb
	str r2, [r0, #0x10]
	str r0, [r6, #8]
	str r2, [r6, #0xc]
	movs r3, #0xac
	lsls r3, r3, #3
	add r3, sp
	ldr r4, [r3]
	adds r5, r4, #0
	ldr r1, [r5]
	cmp r6, r1
	beq .L080D9EA8
	cmp r1, #0
	beq .L080D9EA8
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080D9EA8:
	str r6, [r4]
	b .L080DA0E4
	.align 2, 0
.L080D9EAC: .4byte vtable_unk_080E5C14
.L080D9EB0: .4byte vtable_unk_080E5E44
.L080D9EB4: .4byte 0xFFFFFC00
.L080D9EB8: .4byte vtable_unk_080E5C24
.L080D9EBC:
	movs r4, #0x87
	lsls r4, r4, #3
	add r4, sp
	movs r0, #6
	str r0, [r4]
	movs r0, #0x14
	bl __builtin_new
	movs r6, #0xaa
	lsls r6, r6, #3
	add r6, sp
	ldr r6, [r6]
	ldr r6, [r6]
	mov r8, r6
	movs r6, #0x89
	lsls r6, r6, #3
	add r6, sp
	adds r1, r6, #0
	ldm r4!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldr r1, .L080D9F24 @ =vtable_unk_080E5E74
	str r1, [r0]
	mov r1, r8
	str r1, [r0, #4]
	adds r2, r0, #0
	adds r2, #8
	movs r1, #0x89
	lsls r1, r1, #3
	add r1, sp
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldr r4, .L080D9F28 @ =0x00000444
	add r4, sp
	str r0, [r4]
	movs r0, #0xc
	bl __builtin_new
	ldr r5, [r4]
	movs r3, #0
	str r3, [r4]
	str r5, [r6]
	movs r1, #0xaa
	lsls r1, r1, #3
	add r1, sp
	ldr r1, [r1]
	ldr r2, [r1]
	ldr r1, .L080D9F2C @ =vtable_unk_080E5E94
	str r1, [r0]
	str r2, [r0, #4]
	str r3, [r6]
	str r5, [r0, #8]
	b .L080DA07A
	.align 2, 0
.L080D9F24: .4byte vtable_unk_080E5E74
.L080D9F28: .4byte 0x00000444
.L080D9F2C: .4byte vtable_unk_080E5E94
.L080D9F30:
	movs r4, #0x87
	lsls r4, r4, #3
	add r4, sp
	movs r0, #7
	str r0, [r4]
	movs r0, #0x14
	bl __builtin_new
	movs r5, #0xaa
	lsls r5, r5, #3
	add r5, sp
	ldr r5, [r5]
	ldr r5, [r5]
	mov r8, r5
	movs r6, #0x89
	lsls r6, r6, #3
	add r6, sp
	adds r1, r6, #0
	ldm r4!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldr r1, .L080D9F9C @ =vtable_unk_080E5E74
	str r1, [r0]
	mov r1, r8
	str r1, [r0, #4]
	adds r2, r0, #0
	adds r2, #8
	movs r1, #0x89
	lsls r1, r1, #3
	add r1, sp
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldr r4, .L080D9FA0 @ =0x00000444
	add r4, sp
	str r0, [r4]
	movs r0, #0x10
	bl __builtin_new
	ldr r5, [r4]
	movs r2, #0
	str r2, [r4]
	str r5, [r6]
	movs r1, #0xaa
	lsls r1, r1, #3
	add r1, sp
	ldr r1, [r1]
	ldr r3, [r1]
	ldr r1, .L080D9FA4 @ =vtable_unk_080E5EB4
	str r1, [r0]
	str r2, [r6]
	str r5, [r0, #4]
	str r3, [r0, #8]
	strb r2, [r0, #0xc]
	b .L080DA07A
	.align 2, 0
.L080D9F9C: .4byte vtable_unk_080E5E74
.L080D9FA0: .4byte 0x00000444
.L080D9FA4: .4byte vtable_unk_080E5EB4
.L080D9FA8:
	movs r4, #0x87
	lsls r4, r4, #3
	add r4, sp
	movs r0, #8
	str r0, [r4]
	movs r0, #0x14
	bl __builtin_new
	movs r5, #0xaa
	lsls r5, r5, #3
	add r5, sp
	ldr r5, [r5]
	ldr r5, [r5]
	mov r8, r5
	movs r6, #0x89
	lsls r6, r6, #3
	add r6, sp
	adds r1, r6, #0
	ldm r4!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldr r1, .L080DA008 @ =vtable_unk_080E5E74
	str r1, [r0]
	mov r1, r8
	str r1, [r0, #4]
	adds r2, r0, #0
	adds r2, #8
	movs r1, #0x89
	lsls r1, r1, #3
	add r1, sp
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldr r4, .L080DA00C @ =0x00000444
	add r4, sp
	str r0, [r4]
	movs r0, #0xc
	bl __builtin_new
	ldr r5, [r4]
	movs r2, #0
	str r2, [r4]
	str r5, [r6]
	movs r1, #0xaa
	lsls r1, r1, #3
	add r1, sp
	ldr r1, [r1]
	ldr r3, [r1]
	ldr r1, .L080DA010 @ =vtable_unk_080E5EA4
	b .L080DA072
	.align 2, 0
.L080DA008: .4byte vtable_unk_080E5E74
.L080DA00C: .4byte 0x00000444
.L080DA010: .4byte vtable_unk_080E5EA4
.L080DA014:
	movs r4, #0x87
	lsls r4, r4, #3
	add r4, sp
	movs r0, #4
	str r0, [r4]
	movs r0, #0x14
	bl __builtin_new
	movs r5, #0xaa
	lsls r5, r5, #3
	add r5, sp
	ldr r5, [r5]
	ldr r5, [r5]
	mov r8, r5
	movs r6, #0x89
	lsls r6, r6, #3
	add r6, sp
	adds r1, r6, #0
	ldm r4!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldr r1, .L080DA0B8 @ =vtable_unk_080E5E74
	str r1, [r0]
	mov r1, r8
	str r1, [r0, #4]
	adds r2, r0, #0
	adds r2, #8
	movs r1, #0x89
	lsls r1, r1, #3
	add r1, sp
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldr r4, .L080DA0BC @ =0x00000444
	add r4, sp
	str r0, [r4]
	movs r0, #0xc
	bl __builtin_new
	ldr r5, [r4]
	movs r2, #0
	str r2, [r4]
	str r5, [r6]
	movs r1, #0xaa
	lsls r1, r1, #3
	add r1, sp
	ldr r1, [r1]
	ldr r3, [r1]
	ldr r1, .L080DA0C0 @ =vtable_unk_080E5CF4
.L080DA072:
	str r1, [r0]
	str r2, [r6]
	str r5, [r0, #4]
	str r3, [r0, #8]
.L080DA07A:
	movs r2, #0xac
	lsls r2, r2, #3
	add r2, sp
	ldr r5, [r2]
	adds r4, r0, #0
	adds r3, r5, #0
	ldr r1, [r3]
	cmp r4, r1
	beq .L080DA09C
	cmp r1, #0
	beq .L080DA09C
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DA09C:
	str r4, [r5]
	ldr r0, .L080DA0BC @ =0x00000444
	add r0, sp
	ldr r1, [r0]
	cmp r1, #0
	beq .L080DA0E4
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
	b .L080DA0E4
	.align 2, 0
.L080DA0B8: .4byte vtable_unk_080E5E74
.L080DA0BC: .4byte 0x00000444
.L080DA0C0: .4byte vtable_unk_080E5CF4
.L080DA0C4:
	movs r4, #1
	movs r5, #0x9f
	lsls r5, r5, #3
	add r5, sp
	str r4, [r5]
	ldr r0, [r7]
	ldr r1, [r0, #4]
	ldr r1, [r1, #0x14]
	bl _call_via_r1
	movs r0, #0xd
	movs r6, #0xab
	lsls r6, r6, #3
	add r6, sp
	ldr r6, [r6]
	str r0, [r6]
.L080DA0E4:
	movs r0, #0x9f
	lsls r0, r0, #3
	add r0, sp
	ldr r0, [r0]
	cmp r0, #0
	beq .L080DA0F4
	bl .L080DAAE6
.L080DA0F4:
	ldr r0, [r7]
	bl func_0803C544
	ldr r1, .L080DA114 @ =0x0000055C
	add r1, sp
	ldr r1, [r1]
	ldr r0, [r1]
	ldr r1, .L080DA118 @ =0x00000889
	movs r2, #1
	movs r3, #1
	bl func_08009378
	movs r0, #9
	bl .L080DAADC
	.align 2, 0
.L080DA114: .4byte 0x0000055C
.L080DA118: .4byte 0x00000889
.L080DA11C:
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1f
	lsls r0, r2, #0x1e
	lsrs r0, r0, #0x1f
	cmn r1, r0
	bne .L080DA12C
	bl .L080DAAE6
.L080DA12C:
	ldr r0, [r4]
	ldr r1, [r0, #4]
	ldr r1, [r1, #0x14]
	bl _call_via_r1
	movs r0, #8
	b .L080DA804
.L080DA13A:
	mov r4, sl
	adds r4, #0xb8
	ldr r0, [r4]
	bl func_0803BE9C
	cmp r0, #0
	beq .L080DA14C
	bl .L080DAAE6
.L080DA14C:
	movs r5, #0
	ldr r1, [r4]
	cmp r5, r1
	beq .L080DA164
	cmp r1, #0
	beq .L080DA164
	ldr r0, [r1, #4]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DA164:
	str r5, [r4]
	movs r0, #0xc
	bl __builtin_new
	movs r1, #1
	str r1, [sp]
	movs r1, #0
	movs r2, #0x1f
	movs r3, #0
	bl func_0803C54C
	mov r4, sl
	adds r4, #0xb4
	adds r5, r0, #0
	ldr r1, [r4]
	adds r6, r4, #0
	cmp r5, r1
	beq .L080DA198
	cmp r1, #0
	beq .L080DA198
	ldr r0, [r1, #4]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DA198:
	str r5, [r4]
	movs r4, #0xaa
	lsls r4, r4, #3
	add r4, sp
	ldr r4, [r4]
	ldr r1, [r4]
	ldr r5, .L080DA22C @ =0x00002210
	adds r0, r1, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge .L080DA1C4
	ldr r7, .L080DA230 @ =0x000034C4
	adds r0, r1, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne .L080DA1C4
	ldr r0, [r6]
	ldr r1, [r0, #4]
	ldr r1, [r1, #0xc]
	bl _call_via_r1
.L080DA1C4:
	ldr r4, [r6]
	movs r5, #0
	ldr r1, .L080DA234 @ =0x00000564
	add r1, sp
	ldr r1, [r1]
	ldr r0, [r1]
	ldr r1, [r0]
	adds r1, #0xb0
	ldr r1, [r1]
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080DA1F8
	movs r2, #0xaa
	lsls r2, r2, #3
	add r2, sp
	ldr r2, [r2]
	ldr r0, [r2]
	ldrh r1, [r0, #0x12]
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x1a
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L080DA1FA
.L080DA1F8:
	movs r5, #1
.L080DA1FA:
	adds r2, r5, #0
	movs r3, #0xaa
	lsls r3, r3, #3
	add r3, sp
	ldr r3, [r3]
	ldr r1, [r3]
	adds r1, #0x10
	adds r0, r4, #0
	adds r0, #8
	bl func_0803CD4C
	mov r0, sl
	adds r0, #0xb4
	ldr r0, [r0]
	movs r4, #0xaa
	lsls r4, r4, #3
	add r4, sp
	ldr r4, [r4]
	ldr r1, [r4]
	ldr r1, [r1, #8]
	adds r0, #8
	bl func_0803D3A0
	movs r0, #0
	b .L080DA790
	.align 2, 0
.L080DA22C: .4byte 0x00002210
.L080DA230: .4byte 0x000034C4
.L080DA234: .4byte 0x00000564
.L080DA238:
	ldr r6, .L080DA270 @ =0x0000055C
	add r6, sp
	ldr r6, [r6]
	ldr r0, [r6]
	bl func_080094A4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	cmp r1, #0
	beq .L080DA256
	bl .L080DAAE6
.L080DA256:
	movs r7, #0xac
	lsls r7, r7, #3
	add r7, sp
	ldr r7, [r7]
	ldr r0, [r7]
	str r1, [r7]
	ldr r3, .L080DA274 @ =0x000004DC
	add r3, sp
	ldr r3, [r3]
	str r0, [r3]
	bl func_080DB0CC
	.align 2, 0
.L080DA270: .4byte 0x0000055C
.L080DA274: .4byte 0x000004DC
.L080DA278:
	ldr r4, .L080DA33C @ =gUnk_0300040C
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #8
	movs r5, #0xd5
	lsls r5, r5, #2
	adds r1, r1, r5
	ldr r1, [r1]
	ldr r1, [r1, #0xc]
	@ 080DA28A bl [method_0803EFD8__13AScriptEngine]
	bl _call_via_r1
	cmp r0, #0
	beq .L080DA296
	bl .L080DAAE6
.L080DA296:
	ldr r4, [r4]
	movs r6, #0xde
	lsls r6, r6, #2
	adds r5, r4, r6
	movs r2, #0
	movs r1, #0
	ldr r0, [r5]
	cmp r0, #0
	bne .L080DA2AA
	movs r1, #1
.L080DA2AA:
	cmp r1, #0
	beq .L080DA2D8
	movs r7, #0xe3
	lsls r7, r7, #2
	adds r0, r4, r7
	movs r1, #0
	ldr r0, [r0]
	cmp r0, #0
	bne .L080DA2BE
	movs r1, #1
.L080DA2BE:
	cmp r1, #0
	beq .L080DA2D8
	movs r1, #0x9a
	lsls r1, r1, #3
	adds r0, r4, r1
	movs r1, #0
	ldr r0, [r0]
	cmp r0, #0
	bne .L080DA2D2
	movs r1, #1
.L080DA2D2:
	cmp r1, #0
	beq .L080DA2D8
	movs r2, #1
.L080DA2D8:
	adds r3, r2, #0
	cmp r3, #0
	beq .L080DA2E0
	b .L080DA468
.L080DA2E0:
	movs r1, #0
	ldr r0, [r5]
	cmp r0, #0
	bne .L080DA2EA
	movs r1, #1
.L080DA2EA:
	cmp r1, #0
	bne .L080DA344
	adds r7, r5, #4
	ldr r1, [r5, #4]
	ldr r2, [r5, #8]
	ldr r3, .L080DA340 @ =0x000004FC
	add r3, sp
	str r1, [r3]
	str r2, [r3, #4]
	ldr r4, .L080DA33C @ =gUnk_0300040C
	mov r8, r4
	movs r3, #0x96
	lsls r3, r3, #3
	add r3, sp
	cmp r0, #0
	beq .L080DA332
	lsls r0, r0, #3
	adds r0, #4
	adds r0, r5, r0
	adds r1, r5, #0
	adds r1, #0xc
	cmp r1, r0
	beq .L080DA32C
	adds r6, r1, #0
	subs r0, r0, r6
	asrs r2, r0, #3
	cmp r2, #0
	ble .L080DA32C
.L080DA322:
	ldm r6!, {r0, r1}
	stm r7!, {r0, r1}
	subs r2, #1
	cmp r2, #0
	bgt .L080DA322
.L080DA32C:
	ldr r0, [r5]
	subs r0, #1
	str r0, [r5]
.L080DA332:
	movs r0, #0x96
	lsls r0, r0, #3
	add r0, sp
	ldr r6, .L080DA340 @ =0x000004FC
	b .L080DA3A6
	.align 2, 0
.L080DA33C: .4byte gUnk_0300040C
.L080DA340: .4byte 0x000004FC
.L080DA344:
	adds r4, r5, #0
	adds r4, #0x14
	movs r1, #0
	ldr r0, [r5, #0x14]
	cmp r0, #0
	bne .L080DA352
	movs r1, #1
.L080DA352:
	cmp r1, #0
	bne .L080DA3BC
	adds r7, r5, #0
	adds r7, #0x18
	ldr r1, [r5, #0x18]
	ldr r2, [r5, #0x1c]
	ldr r3, .L080DA3B4 @ =0x00000504
	add r3, sp
	str r1, [r3]
	str r2, [r3, #4]
	adds r6, r4, #0
	ldr r4, .L080DA3B8 @ =gUnk_0300040C
	mov r8, r4
	movs r3, #0x96
	lsls r3, r3, #3
	add r3, sp
	cmp r0, #0
	beq .L080DA39E
	lsls r0, r0, #3
	adds r0, #4
	adds r1, r6, r0
	adds r0, r5, #0
	adds r0, #0x20
	cmp r0, r1
	beq .L080DA398
	adds r5, r0, #0
	subs r0, r1, r5
	asrs r2, r0, #3
	cmp r2, #0
	ble .L080DA398
.L080DA38E:
	ldm r5!, {r0, r1}
	stm r7!, {r0, r1}
	subs r2, #1
	cmp r2, #0
	bgt .L080DA38E
.L080DA398:
	ldr r0, [r6]
	subs r0, #1
	str r0, [r6]
.L080DA39E:
	movs r0, #0x96
	lsls r0, r0, #3
	add r0, sp
	ldr r6, .L080DA3B4 @ =0x00000504
.L080DA3A6:
	add r6, sp
	ldr r5, [r6]
	ldr r6, [r6, #4]
	str r5, [r0]
	str r6, [r0, #4]
	b .L080DA44E
	.align 2, 0
.L080DA3B4: .4byte 0x00000504
.L080DA3B8: .4byte gUnk_0300040C
.L080DA3BC:
	movs r7, #0xac
	lsls r7, r7, #1
	adds r6, r5, r7
	movs r1, #0
	ldr r0, [r6]
	cmp r0, #0
	bne .L080DA3CC
	movs r1, #1
.L080DA3CC:
	cmp r1, #0
	bne .L080DA438
	movs r1, #0xae
	lsls r1, r1, #1
	adds r4, r5, r1
	ldr r1, [r4]
	ldr r2, [r4, #4]
	ldr r3, .L080DA430 @ =0x0000050C
	add r3, sp
	str r1, [r3]
	str r2, [r3, #4]
	ldr r7, .L080DA434 @ =gUnk_0300040C
	mov r8, r7
	movs r3, #0x96
	lsls r3, r3, #3
	add r3, sp
	cmp r0, #0
	beq .L080DA41C
	lsls r0, r0, #3
	adds r0, #4
	adds r1, r6, r0
	movs r2, #0xb2
	lsls r2, r2, #1
	adds r0, r5, r2
	cmp r0, r1
	beq .L080DA416
	adds r5, r0, #0
	adds r7, r4, #0
	subs r0, r1, r5
	asrs r2, r0, #3
	cmp r2, #0
	ble .L080DA416
.L080DA40C:
	ldm r5!, {r0, r1}
	stm r7!, {r0, r1}
	subs r2, #1
	cmp r2, #0
	bgt .L080DA40C
.L080DA416:
	ldr r0, [r6]
	subs r0, #1
	str r0, [r6]
.L080DA41C:
	movs r0, #0x96
	lsls r0, r0, #3
	add r0, sp
	ldr r5, .L080DA430 @ =0x0000050C
	add r5, sp
	ldr r4, [r5]
	ldr r5, [r5, #4]
	str r4, [r0]
	str r5, [r0, #4]
	b .L080DA44E
	.align 2, 0
.L080DA430: .4byte 0x0000050C
.L080DA434: .4byte gUnk_0300040C
.L080DA438:
	movs r1, #0x96
	lsls r1, r1, #3
	add r1, sp
	movs r0, #0x96
	lsls r0, r0, #3
	add r0, sp
	str r3, [r0]
	str r3, [r1, #4]
	ldr r6, .L080DA464 @ =gUnk_0300040C
	mov r8, r6
	adds r3, r1, #0
.L080DA44E:
	mov r7, r8
	ldr r0, [r7]
	adds r0, #8
	movs r1, #0x96
	lsls r1, r1, #3
	add r1, sp
	ldr r1, [r1]
	ldr r2, [r3, #4]
	bl LoadById__12ScriptEngineii
	b .L080DAAE6
	.align 2, 0
.L080DA464: .4byte gUnk_0300040C
.L080DA468:
	mov r4, sl
	adds r4, #0xac
	ldr r0, [r4]
	cmp r0, #0
	beq .L080DA480
	movs r5, #0
	cmp r5, r0
	beq .L080DA47E
	movs r1, #3
	bl func_08050D0C
.L080DA47E:
	str r5, [r4]
.L080DA480:
	mov r4, sl
	adds r4, #0xf0
	movs r5, #0
	ldr r0, [r4]
	cmp r5, r0
	beq .L080DA490
	bl __builtin_delete
.L080DA490:
	str r5, [r4]
	ldr r1, .L080DA578 @ =0x00000564
	add r1, sp
	ldr r1, [r1]
	ldr r0, [r1]
	ldr r1, [r0]
	movs r2, #0x94
	lsls r2, r2, #1
	adds r1, r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	mov r0, sl
	adds r0, #0xb4
	ldr r1, [r0]
	adds r6, r0, #0
	cmp r1, #0
	bne .L080DA4E4
	movs r0, #0xc
	bl __builtin_new
	movs r1, #1
	str r1, [sp]
	movs r1, #0
	movs r2, #0x1f
	movs r3, #0
	bl func_0803C54C
	adds r5, r6, #0
	adds r4, r0, #0
	ldr r1, [r6]
	cmp r4, r1
	beq .L080DA4E2
	cmp r1, #0
	beq .L080DA4E2
	ldr r0, [r1, #4]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DA4E2:
	str r4, [r5]
.L080DA4E4:
	movs r3, #0xaa
	lsls r3, r3, #3
	add r3, sp
	ldr r3, [r3]
	ldr r1, [r3]
	ldr r4, .L080DA57C @ =0x00002210
	adds r0, r1, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge .L080DA50E
	ldr r5, .L080DA580 @ =0x000034C4
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne .L080DA50E
	ldr r0, [r6]
	ldr r1, [r0, #4]
	ldr r1, [r1, #0x10]
	bl _call_via_r1
.L080DA50E:
	ldr r4, [r6]
	movs r5, #0
	ldr r6, .L080DA578 @ =0x00000564
	add r6, sp
	ldr r6, [r6]
	ldr r0, [r6]
	ldr r1, [r0]
	adds r1, #0xb0
	ldr r1, [r1]
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080DA542
	movs r7, #0xaa
	lsls r7, r7, #3
	add r7, sp
	ldr r7, [r7]
	ldr r0, [r7]
	ldrh r1, [r0, #0x12]
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x1a
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L080DA544
.L080DA542:
	movs r5, #1
.L080DA544:
	adds r2, r5, #0
	movs r0, #0xaa
	lsls r0, r0, #3
	add r0, sp
	ldr r0, [r0]
	ldr r1, [r0]
	adds r1, #0x10
	adds r0, r4, #0
	adds r0, #8
	bl func_0803CD4C
	mov r0, sl
	adds r0, #0xb4
	ldr r0, [r0]
	movs r2, #0xaa
	lsls r2, r2, #3
	add r2, sp
	ldr r2, [r2]
	ldr r1, [r2]
	ldr r1, [r1, #8]
	adds r0, #8
	bl func_0803D3A0
	movs r0, #0
	b .L080DA804
	.align 2, 0
.L080DA578: .4byte 0x00000564
.L080DA57C: .4byte 0x00002210
.L080DA580: .4byte 0x000034C4
.L080DA584:
	mov r0, sl
	adds r0, #0xac
	ldr r0, [r0]
	bl func_08050D34
	cmp r0, #3
	beq .L080DA594
	b .L080DAAE6
.L080DA594:
	b .L080DA76A
.L080DA596:
	mov r4, sl
	adds r4, #0xac
	ldr r0, [r4]
	bl func_08050D34
	cmp r0, #0
	beq .L080DA5A6
	b .L080DAAE6
.L080DA5A6:
	movs r5, #0
	ldr r0, [r4]
	cmp r5, r0
	beq .L080DA5B8
	cmp r0, #0
	beq .L080DA5B8
	movs r1, #3
	bl func_08050D0C
.L080DA5B8:
	str r5, [r4]
	b .L080DA78E
.L080DA5BC:
	mov r0, sl
	adds r0, #0xac
	ldr r0, [r0]
	bl func_08050D34
	cmp r0, #3
	beq .L080DA5CC
	b .L080DAAE6
.L080DA5CC:
	b .L080DAA88
.L080DA5CE:
	add r0, sp, #0x10
	ldrh r4, [r0, #8]
	mov r0, sl
	adds r0, #0xac
	ldr r0, [r0]
	bl func_08050D34
	cmp r0, #6
	bls .L080DA5E2
	b .L080DAAE6
.L080DA5E2:
	lsls r0, r0, #2
	ldr r1, .L080DA5EC @ =.L080DA5F0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L080DA5EC: .4byte .L080DA5F0
.L080DA5F0: @ jump table
	.4byte .L080DA60C @ case 0
	.4byte .L080DA60C @ case 1
	.4byte .L080DA60C @ case 2
	.4byte .L080DA60C @ case 3
	.4byte .L080DA62C @ case 4
	.4byte .L080DA62C @ case 5
	.4byte .L080DA60C @ case 6
.L080DA60C:
	movs r0, #2
	movs r7, #0xab
	lsls r7, r7, #3
	add r7, sp
	ldr r7, [r7]
	str r0, [r7]
	ldr r0, .L080DA628 @ =gUnk_0300040C
	ldr r0, [r0]
	adds r0, #8
	movs r1, #4
	bl Push__12ScriptEnginei
	b .L080DAAE6
	.align 2, 0
.L080DA628: .4byte gUnk_0300040C
.L080DA62C:
	movs r1, #2
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq .L080DA654
	movs r0, #0xab
	lsls r0, r0, #3
	add r0, sp
	ldr r0, [r0]
	str r1, [r0]
	ldr r0, .L080DA650 @ =gUnk_0300040C
	ldr r0, [r0]
	adds r0, #8
	movs r1, #5
	bl Push__12ScriptEnginei
	b .L080DAAE6
	.align 2, 0
.L080DA650: .4byte gUnk_0300040C
.L080DA654:
	movs r0, #0x40
	ands r0, r4
	cmp r0, #0
	beq .L080DA678
	movs r2, #0xab
	lsls r2, r2, #3
	add r2, sp
	ldr r2, [r2]
	str r1, [r2]
	ldr r0, .L080DA674 @ =gUnk_0300040C
	ldr r0, [r0]
	adds r0, #8
	movs r1, #0
	bl Push__12ScriptEnginei
	b .L080DAAE6
	.align 2, 0
.L080DA674: .4byte gUnk_0300040C
.L080DA678:
	movs r0, #0x80
	ands r0, r4
	cmp r0, #0
	beq .L080DA69C
	movs r3, #0xab
	lsls r3, r3, #3
	add r3, sp
	ldr r3, [r3]
	str r1, [r3]
	ldr r0, .L080DA698 @ =gUnk_0300040C
	ldr r0, [r0]
	adds r0, #8
	movs r1, #1
	bl Push__12ScriptEnginei
	b .L080DAAE6
	.align 2, 0
.L080DA698: .4byte gUnk_0300040C
.L080DA69C:
	movs r0, #0x20
	ands r0, r4
	cmp r0, #0
	beq .L080DA6C0
	movs r4, #0xab
	lsls r4, r4, #3
	add r4, sp
	ldr r4, [r4]
	str r1, [r4]
	ldr r0, .L080DA6BC @ =gUnk_0300040C
	ldr r0, [r0]
	adds r0, #8
	movs r1, #2
	bl Push__12ScriptEnginei
	b .L080DAAE6
	.align 2, 0
.L080DA6BC: .4byte gUnk_0300040C
.L080DA6C0:
	movs r0, #0x10
	ands r4, r0
	cmp r4, #0
	bne .L080DA6CA
	b .L080DAAE6
.L080DA6CA:
	movs r5, #0xab
	lsls r5, r5, #3
	add r5, sp
	ldr r5, [r5]
	str r1, [r5]
	ldr r0, .L080DA6E4 @ =gUnk_0300040C
	ldr r0, [r0]
	adds r0, #8
	movs r1, #3
	bl Push__12ScriptEnginei
	b .L080DAAE6
	.align 2, 0
.L080DA6E4: .4byte gUnk_0300040C
.L080DA6E8:
	ldr r6, .L080DA72C @ =0x0000055C
	add r6, sp
	ldr r6, [r6]
	ldr r0, [r6]
	bl func_080094A4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r3, r1, #0x1f
	cmp r3, #0
	beq .L080DA704
	b .L080DAAE6
.L080DA704:
	mov r1, sl
	adds r1, #0xe8
	movs r0, #1
	strb r0, [r1]
	mov r7, sl
	ldrh r1, [r7, #0x10]
	ldr r0, .L080DA730 @ =0x0000F0FF
	ands r0, r1
	strh r0, [r7, #0x10]
	mov r2, sl
	adds r2, #0x60
	ldrh r1, [r2]
	ldr r0, .L080DA734 @ =0x0000FF3F
	ands r0, r1
	strh r0, [r2]
	mov r0, sl
	adds r0, #0x5c
	strh r3, [r0]
	b .L080DAAB8
	.align 2, 0
.L080DA72C: .4byte 0x0000055C
.L080DA730: .4byte 0x0000F0FF
.L080DA734: .4byte 0x0000FF3F
.L080DA738:
	ldr r2, .L080DA754 @ =0x0000055C
	add r2, sp
	ldr r2, [r2]
	ldr r0, [r2]
	bl func_080094A4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	rsbs r1, r0, #0
	orrs r1, r0
	cmp r1, #0
	bge .L080DA752
	b .L080DAAE6
.L080DA752:
	b .L080DA802
	.align 2, 0
.L080DA754: .4byte 0x0000055C
.L080DA758:
	mov r1, sl
	adds r1, #0xe0
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq .L080DA76A
	b .L080DAAE6
.L080DA76A:
	movs r0, #2

	thumb_func_start sub_080DA76C
sub_080DA76C: @ 0x080DA76C
	movs r4, #0xab
	lsls r4, r4, #3
	add r4, sp
	ldr r4, [r4]
	str r0, [r4]
	b .L080DAAE6
.L080DA778:
	mov r4, sl
	adds r4, #0xe4
	ldr r0, [r4]
	bl func_08032370
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080DA78A
	b .L080DAAE6
.L080DA78A:
	movs r0, #0
	str r0, [r4]
.L080DA78E:
	movs r0, #2
.L080DA790:
	movs r5, #0xab
	lsls r5, r5, #3
	add r5, sp
	ldr r5, [r5]
	str r0, [r5]
	b .L080DAAE6
.L080DA79C:
	mov r5, sl
	adds r5, #0xac
	ldr r0, [r5]
	bl func_08050D34
	cmp r0, #6
	bne .L080DA7AC
	b .L080DAAE6
.L080DA7AC:
	ldr r0, .L080DA7C4 @ =gUnk_0300040C
	ldr r4, [r0]
	adds r4, #8
	ldr r0, [r5]
	bl func_08050DF0
	adds r1, r0, #0
	adds r0, r4, #0
	bl Push__12ScriptEnginei
	b .L080DAA88
	.align 2, 0
.L080DA7C4: .4byte gUnk_0300040C
.L080DA7C8:
	ldr r7, .L080DA7DC @ =0x00000564
	add r7, sp
	ldr r7, [r7]
	ldr r0, [r7]
	ldr r1, [r0]
	ldr r1, [r1, #0x28]
	bl _call_via_r1
	b .L080DAAB2
	.align 2, 0
.L080DA7DC: .4byte 0x00000564
.L080DA7E0:
	ldr r2, .L080DA810 @ =0x00000564
	add r2, sp
	ldr r2, [r2]
	ldr r0, [r2]
	ldr r1, [r0]
	ldr r2, [r1, #0x40]
	movs r1, #0
	bl _call_via_r2
	ldr r1, [r0, #0x14]
	ldr r1, [r1, #0x3c]
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080DA802
	b .L080DAAE6
.L080DA802:
	movs r0, #2
.L080DA804:
	movs r3, #0xab
	lsls r3, r3, #3
	add r3, sp
	ldr r3, [r3]
	str r0, [r3]
	b .L080DAAE6
	.align 2, 0
.L080DA810: .4byte 0x00000564
.L080DA814:
	mov r0, sl
	adds r0, #0xef
	ldrb r1, [r0]
	movs r4, #0xaf
	lsls r4, r4, #3
	add r4, sp
	str r0, [r4]
	cmp r1, #0x78
	bne .L080DA868
	subs r0, #5
	movs r3, #0
	strb r3, [r0]
	mov r5, sl
	ldrh r1, [r5, #0x10]
	ldr r0, .L080DA864 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r5, #0x10]
	movs r2, #0x87
	lsls r2, r2, #3
	add r2, sp
	movs r0, #0x3f
	strh r0, [r2]
	mov r1, sl
	adds r1, #0x60
	movs r6, #0x87
	lsls r6, r6, #3
	add r6, sp
	ldrh r0, [r6]
	strh r0, [r1]
	strh r3, [r2]
	adds r1, #2
	ldrh r0, [r6]
	strh r0, [r1]
	movs r0, #2
.L080DA858:
	movs r7, #0xab
	lsls r7, r7, #3
	add r7, sp
	ldr r7, [r7]
	str r0, [r7]
	b .L080DAAE6
	.align 2, 0
.L080DA864: .4byte 0x0000FEFF
.L080DA868:
	mov r0, sl
	adds r0, #0xec
	ldrh r1, [r0]
	mov r8, sl
	movs r0, #0x87
	lsls r0, r0, #3
	add r0, sp
	ldr r2, .L080DA8C4 @ =0x05000002
	movs r3, #2
	bl func_08008F60
	movs r0, #0x87
	lsls r0, r0, #3
	add r0, sp
	ldr r1, .L080DA8C8 @ =0x00000514
	add r1, sp
	str r0, [r1]
	mov r2, sl
	ldr r1, [r2, #4]
	ldr r0, [r2, #0xc]
	cmp r1, r0
	beq .L080DA8CC
	cmp r1, #0
	beq .L080DA8A8
	adds r0, r1, #0
	movs r1, #0x87
	lsls r1, r1, #3
	add r1, sp
	ldm r1!, {r3, r4, r5}
	stm r0!, {r3, r4, r5}
	ldr r1, [r1]
	str r1, [r0]
.L080DA8A8:
	mov r6, sl
	ldr r0, [r6, #4]
	adds r0, #0x10
	str r0, [r6, #4]
	adds r6, #0x62
	movs r7, #0xa9
	lsls r7, r7, #3
	add r7, sp
	str r6, [r7]
	movs r0, #0xee
	add r0, sl
	mov sb, r0
	b .L080DA9FE
	.align 2, 0
.L080DA8C4: .4byte 0x05000002
.L080DA8C8: .4byte 0x00000514
.L080DA8CC:
	ldr r2, .L080DA924 @ =0x00000584
	add r2, sp
	str r1, [r2]
	movs r0, #1
	ldr r1, .L080DA928 @ =0x000004BC
	add r1, sp
	str r0, [r1]
	mov r3, sl
	ldr r0, [r3]
	ldr r4, [r2]
	subs r0, r4, r0
	asrs r4, r0, #4
	movs r0, #0x97
	lsls r0, r0, #3
	add r0, sp
	str r4, [r0]
	ldr r2, .L080DA928 @ =0x000004BC
	add r2, sp
	ldr r0, [r1]
	movs r1, #0x97
	lsls r1, r1, #3
	add r1, sp
	cmp r4, r0
	bhs .L080DA8FE
	adds r1, r2, #0
.L080DA8FE:
	ldr r0, [r1]
	adds r0, r4, r0
	cmp r0, #0
	beq .L080DA92C
	lsls r4, r0, #4
	adds r0, r4, #0
	bl malloc
	movs r5, #0xb1
	lsls r5, r5, #3
	add r5, sp
	str r4, [r5]
	cmp r0, #0
	bne .L080DA936
	adds r0, r4, #0
	bl func_080D3BC0
	b .L080DA936
	.align 2, 0
.L080DA924: .4byte 0x00000584
.L080DA928: .4byte 0x000004BC
.L080DA92C:
	movs r0, #0
	movs r6, #0xb1
	lsls r6, r6, #3
	add r6, sp
	str r0, [r6]
.L080DA936:
	adds r5, r0, #0
	adds r4, r5, #0
	mov r7, r8
	ldr r2, [r7]
	adds r3, r4, #0
	mov r0, sl
	adds r0, #0x62
	movs r1, #0xa9
	lsls r1, r1, #3
	add r1, sp
	str r0, [r1]
	movs r5, #0xee
	add r5, sl
	mov sb, r5
	ldr r6, .L080DA9A0 @ =0x00000584
	add r6, sp
	ldr r6, [r6]
	cmp r2, r6
	beq .L080DA97A
.L080DA95C:
	cmp r3, #0
	beq .L080DA96C
	adds r0, r3, #0
	adds r1, r2, #0
	ldm r1!, {r5, r6, r7}
	stm r0!, {r5, r6, r7}
	ldr r1, [r1]
	str r1, [r0]
.L080DA96C:
	adds r2, #0x10
	adds r3, #0x10
	ldr r7, .L080DA9A0 @ =0x00000584
	add r7, sp
	ldr r7, [r7]
	cmp r2, r7
	bne .L080DA95C
.L080DA97A:
	adds r5, r3, #0
	ldr r0, .L080DA9A4 @ =0x000004BC
	add r0, sp
	ldr r0, [r0]
	cmp r0, #1
	bne .L080DA9AC
	cmp r5, #0
	beq .L080DA99A
	adds r0, r5, #0
	ldr r2, .L080DA9A8 @ =0x00000514
	add r2, sp
	ldr r1, [r2]
	ldm r1!, {r3, r6, r7}
	stm r0!, {r3, r6, r7}
	ldr r1, [r1]
	str r1, [r0]
.L080DA99A:
	adds r5, #0x10
	b .L080DA9D2
	.align 2, 0
.L080DA9A0: .4byte 0x00000584
.L080DA9A4: .4byte 0x000004BC
.L080DA9A8: .4byte 0x00000514
.L080DA9AC:
	adds r3, r0, #0
	adds r2, r5, #0
	cmp r3, #0
	beq .L080DA9D0
.L080DA9B4:
	cmp r2, #0
	beq .L080DA9C8
	adds r0, r2, #0
	ldr r5, .L080DAA48 @ =0x00000514
	add r5, sp
	ldr r1, [r5]
	ldm r1!, {r5, r6, r7}
	stm r0!, {r5, r6, r7}
	ldr r1, [r1]
	str r1, [r0]
.L080DA9C8:
	subs r3, #1
	adds r2, #0x10
	cmp r3, #0
	bne .L080DA9B4
.L080DA9D0:
	adds r5, r2, #0
.L080DA9D2:
	mov r6, r8
	ldr r2, [r6, #4]
	ldr r0, [r6]
	adds r1, r0, #0
	cmp r0, r2
	beq .L080DA9E4
.L080DA9DE:
	adds r1, #0x10
	cmp r1, r2
	bne .L080DA9DE
.L080DA9E4:
	cmp r0, #0
	beq .L080DA9EC
	bl free
.L080DA9EC:
	movs r7, #0xb1
	lsls r7, r7, #3
	add r7, sp
	ldr r7, [r7]
	adds r0, r7, r4
	mov r1, r8
	str r4, [r1]
	str r5, [r1, #4]
	str r0, [r1, #0xc]
.L080DA9FE:
	ldr r1, .L080DAA4C @ =gUnk_080F05D9
	movs r2, #0xaf
	lsls r2, r2, #3
	add r2, sp
	ldr r2, [r2]
	ldrb r0, [r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r3, sb
	strb r0, [r3]
	movs r2, #0x87
	lsls r2, r2, #3
	add r2, sp
	ldrb r0, [r3]
	movs r4, #0x80
	lsls r4, r4, #5
	adds r1, r4, #0
	adds r0, r0, r1
	strh r0, [r2]
	movs r5, #0x87
	lsls r5, r5, #3
	add r5, sp
	ldrh r0, [r5]
	movs r6, #0xa9
	lsls r6, r6, #3
	add r6, sp
	ldr r6, [r6]
	strh r0, [r6]
	movs r7, #0xaf
	lsls r7, r7, #3
	add r7, sp
	ldr r7, [r7]
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	b .L080DAAE6
	.align 2, 0
.L080DAA48: .4byte 0x00000514
.L080DAA4C: .4byte gUnk_080F05D9
.L080DAA50:
	movs r2, #0xac
	lsls r2, r2, #3
	add r2, sp
	ldr r2, [r2]
	ldr r1, [r2]
	movs r0, #0
	str r0, [r2]
	ldr r4, .L080DAA68 @ =0x000004DC
	add r4, sp
	ldr r4, [r4]
	str r1, [r4]
	b func_080DB0CC
	.align 2, 0
.L080DAA68: .4byte 0x000004DC
.L080DAA6C:
	ldr r5, .L080DAA98 @ =0x00000564
	add r5, sp
	ldr r5, [r5]
	ldr r0, [r5]
	ldr r1, [r0]
	ldr r2, [r1, #0x40]
	movs r1, #0x5d
	bl _call_via_r2
	bl func_0803880C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080DAAE6
.L080DAA88:
	movs r0, #2
	movs r6, #0xab
	lsls r6, r6, #3
	add r6, sp
	ldr r6, [r6]
	str r0, [r6]
	b .L080DAAE6
	.align 2, 0
.L080DAA98: .4byte 0x00000564
.L080DAA9C:
	ldr r7, .L080DAAC8 @ =0x00000564
	add r7, sp
	ldr r7, [r7]
	ldr r0, [r7]
	ldr r1, [r0]
	ldr r2, [r1, #0x40]
	movs r1, #0x5d
	bl _call_via_r2
	bl func_080387D8
.L080DAAB2:
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080DAAE6
.L080DAAB8:
	movs r0, #2
.L080DAABA:
	movs r1, #0xab
	lsls r1, r1, #3
	add r1, sp
	ldr r1, [r1]
	str r0, [r1]
	b .L080DAAE6
	.align 2, 0
.L080DAAC8: .4byte 0x00000564
.L080DAACC:
	mov r0, sl
	adds r0, #0xbc
	bl func_08008CD0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080DAAE6
	movs r0, #2
.L080DAADC:
	movs r2, #0xab
	lsls r2, r2, #3
	add r2, sp
	ldr r2, [r2]
	str r0, [r2]
.L080DAAE6:
	ldr r3, .L080DAB80 @ =0x000004F4
	add r3, sp
	ldr r3, [r3]
	cmp r3, #0
	bne .L080DAB10
	movs r1, #0x98
	lsls r1, r1, #3
	add r1, sp
	movs r0, #0x98
	lsls r0, r0, #3
	add r0, sp
	add r4, sp, #0x10
	str r4, [r0]
	ldr r5, .L080DAB84 @ =0x00000564
	add r5, sp
	ldr r5, [r5]
	ldr r0, [r5]
	ldr r2, [r0]
	ldr r2, [r2, #0xc]
	bl _call_via_r2
.L080DAB10:
	mov r0, sl
	adds r0, #0xe8
	ldrb r0, [r0]
	cmp r0, #0
	bne .L080DAB1C
	b .L080DACC0
.L080DAB1C:
	mov r0, sl
	adds r0, #0xe9
	ldrb r0, [r0]
	ldr r1, .L080DAB88 @ =0x0000FFFF
	cmp r0, #0
	beq .L080DAB2A
	movs r1, #0
.L080DAB2A:
	mov r8, sl
	movs r0, #0x87
	lsls r0, r0, #3
	add r0, sp
	movs r2, #0xa0
	lsls r2, r2, #0x13
	movs r3, #2
	bl func_08008F60
	movs r6, #0x87
	lsls r6, r6, #3
	add r6, sp
	movs r7, #0xa3
	lsls r7, r7, #3
	add r7, sp
	str r6, [r7]
	mov r0, sl
	ldr r1, [r0, #4]
	ldr r0, [r0, #0xc]
	cmp r1, r0
	beq .L080DAB90
	cmp r1, #0
	beq .L080DAB6A
	adds r0, r1, #0
	movs r2, #0xa3
	lsls r2, r2, #3
	add r2, sp
	ldr r1, [r2]
	ldm r1!, {r3, r4, r5}
	stm r0!, {r3, r4, r5}
	ldr r1, [r1]
	str r1, [r0]
.L080DAB6A:
	mov r6, sl
	ldr r0, [r6, #4]
	adds r0, #0x10
	str r0, [r6, #4]
	adds r6, #0xb4
	mov r7, sl
	adds r7, #0xea
	ldr r0, .L080DAB8C @ =0x00000574
	add r0, sp
	str r7, [r0]
	b .L080DACF8
	.align 2, 0
.L080DAB80: .4byte 0x000004F4
.L080DAB84: .4byte 0x00000564
.L080DAB88: .4byte 0x0000FFFF
.L080DAB8C: .4byte 0x00000574
.L080DAB90:
	movs r2, #0xb1
	lsls r2, r2, #3
	add r2, sp
	str r1, [r2]
	movs r0, #1
	movs r1, #0x99
	lsls r1, r1, #3
	add r1, sp
	str r0, [r1]
	mov r3, sl
	ldr r0, [r3]
	ldr r4, [r2]
	subs r0, r4, r0
	asrs r4, r0, #4
	ldr r0, .L080DABE4 @ =0x000004C4
	add r0, sp
	str r4, [r0]
	movs r2, #0x99
	lsls r2, r2, #3
	add r2, sp
	ldr r0, [r1]
	ldr r1, .L080DABE4 @ =0x000004C4
	add r1, sp
	cmp r4, r0
	bhs .L080DABC4
	adds r1, r2, #0
.L080DABC4:
	ldr r0, [r1]
	adds r0, r4, r0
	cmp r0, #0
	beq .L080DABE8
	lsls r4, r0, #4
	adds r0, r4, #0
	bl malloc
	mov sb, r4
	cmp r0, #0
	bne .L080DABEC
	mov r0, sb
	bl func_080D3BC0
	b .L080DABEC
	.align 2, 0
.L080DABE4: .4byte 0x000004C4
.L080DABE8:
	movs r0, #0
	mov sb, r0
.L080DABEC:
	adds r5, r0, #0
	ldr r6, .L080DAC5C @ =0x0000058C
	add r6, sp
	str r5, [r6]
	mov r7, r8
	ldr r2, [r7]
	adds r3, r5, #0
	mov r6, sl
	adds r6, #0xb4
	mov r0, sl
	adds r0, #0xea
	ldr r1, .L080DAC60 @ =0x00000574
	add r1, sp
	str r0, [r1]
	movs r4, #0xb1
	lsls r4, r4, #3
	add r4, sp
	ldr r4, [r4]
	cmp r2, r4
	beq .L080DAC34
.L080DAC14:
	cmp r3, #0
	beq .L080DAC24
	adds r0, r3, #0
	adds r1, r2, #0
	ldm r1!, {r4, r5, r7}
	stm r0!, {r4, r5, r7}
	ldr r1, [r1]
	str r1, [r0]
.L080DAC24:
	adds r2, #0x10
	adds r3, #0x10
	movs r5, #0xb1
	lsls r5, r5, #3
	add r5, sp
	ldr r5, [r5]
	cmp r2, r5
	bne .L080DAC14
.L080DAC34:
	adds r5, r3, #0
	movs r0, #0x99
	lsls r0, r0, #3
	add r0, sp
	ldr r0, [r0]
	cmp r0, #1
	bne .L080DAC64
	cmp r5, #0
	beq .L080DAC58
	adds r0, r5, #0
	movs r7, #0xa3
	lsls r7, r7, #3
	add r7, sp
	ldr r1, [r7]
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldr r1, [r1]
	str r1, [r0]
.L080DAC58:
	adds r5, #0x10
	b .L080DAC8C
	.align 2, 0
.L080DAC5C: .4byte 0x0000058C
.L080DAC60: .4byte 0x00000574
.L080DAC64:
	adds r3, r0, #0
	adds r2, r5, #0
	cmp r3, #0
	beq .L080DAC8A
.L080DAC6C:
	cmp r2, #0
	beq .L080DAC82
	adds r0, r2, #0
	movs r5, #0xa3
	lsls r5, r5, #3
	add r5, sp
	ldr r1, [r5]
	ldm r1!, {r4, r5, r7}
	stm r0!, {r4, r5, r7}
	ldr r1, [r1]
	str r1, [r0]
.L080DAC82:
	subs r3, #1
	adds r2, #0x10
	cmp r3, #0
	bne .L080DAC6C
.L080DAC8A:
	adds r5, r2, #0
.L080DAC8C:
	mov r7, r8
	ldr r2, [r7, #4]
	ldr r0, [r7]
	adds r1, r0, #0
	cmp r0, r2
	beq .L080DAC9E
.L080DAC98:
	adds r1, #0x10
	cmp r1, r2
	bne .L080DAC98
.L080DAC9E:
	cmp r0, #0
	beq .L080DACA6
	bl free
.L080DACA6:
	ldr r1, .L080DACBC @ =0x0000058C
	add r1, sp
	ldr r0, [r1]
	add r0, sb
	ldr r2, [r1]
	mov r3, r8
	str r2, [r3]
	str r5, [r3, #4]
	str r0, [r3, #0xc]
	b .L080DACF8
	.align 2, 0
.L080DACBC: .4byte 0x0000058C
.L080DACC0:
	mov r0, sl
	adds r0, #0x6c
	movs r1, #0x87
	lsls r1, r1, #3
	add r1, sp
	mov r4, sl
	str r4, [r1]
	ldr r5, .L080DAE3C @ =0x00000544
	add r5, sp
	ldr r5, [r5]
	str r5, [r1, #4]
	add r6, sp, #0x34
	str r6, [r1, #8]
	str r0, [r1, #0xc]
	ldr r7, .L080DAE40 @ =0x00000564
	add r7, sp
	ldr r7, [r7]
	ldr r0, [r7]
	ldr r2, [r0]
	ldr r2, [r2, #0x10]
	bl _call_via_r2
	mov r6, sl
	adds r6, #0xb4
	adds r4, #0xea
	ldr r0, .L080DAE44 @ =0x00000574
	add r0, sp
	str r4, [r0]
.L080DACF8:
	ldr r1, [r6]
	mov r8, r1
	cmp r1, #0
	bne .L080DAD02
	b .L080DAE90
.L080DAD02:
	movs r2, #0xaa
	lsls r2, r2, #3
	add r2, sp
	ldr r2, [r2]
	ldr r5, [r2]
	movs r3, #0x10
	adds r3, r3, r5
	mov sb, r3
	ldr r7, .L080DAE48 @ =0x000004CC
	add r7, sp
	ldr r0, [r7]
	lsls r0, r0, #5
	ldr r1, [r5, #0x10]
	lsls r4, r1, #5
	lsrs r0, r0, #0x1a
	lsrs r1, r4, #0x1a
	cmp r0, r1
	beq .L080DAE02
	adds r0, r1, #0
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080DADEE
	lsrs r0, r4, #0x1a
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #1
	mov r0, r8
	adds r0, #8
	bl func_0803D340
	ldr r1, [r7]
	lsls r1, r1, #0xb
	ldr r0, [r5, #0x10]
	lsls r2, r0, #0xb
	lsrs r1, r1, #0x1b
	lsrs r0, r2, #0x1b
	cmp r1, r0
	beq .L080DADEE
	ldr r0, [r6]
	lsrs r1, r2, #0x1b
	adds r0, #8
	bl func_0803D240
	ldr r7, .L080DAE48 @ =0x000004CC
	add r7, sp
	ldrb r1, [r7, #1]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x1b
	adds r1, #1
	ldrb r3, [r5, #0x11]
	lsls r0, r3, #0x19
	lsrs r0, r0, #0x1b
	adds r4, r0, #1
	cmp r1, r4
	beq .L080DADEE
	ldr r0, [r6]
	mov r8, r0
	ldrb r2, [r5, #0x10]
	lsls r2, r2, #0x1d
	lsrs r2, r2, #0x1d
	lsls r0, r3, #0x1e
	lsrs r0, r0, #0x1e
	adds r2, #6
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #1
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r1, r1, r4
	subs r1, #1
	cmp r1, #6
	bls .L080DADB0
	adds r0, r1, #0
	movs r1, #7
	bl __umodsi3
	adds r1, r0, #0
.L080DADB0:
	movs r0, #7
	ands r1, r0
	movs r2, #8
	rsbs r2, r2, #0
	ldr r3, .L080DAE4C @ =0x0000051C
	add r3, sp
	ldrb r3, [r3]
	ands r2, r3
	orrs r2, r1
	ldr r0, .L080DAE4C @ =0x0000051C
	add r0, sp
	strb r2, [r0]
	lsls r2, r2, #0x1d
	lsrs r2, r2, #0x1d
	mov r0, r8
	adds r0, #8
	adds r1, r4, #0
	bl func_0803D0F0
	ldrb r1, [r7, #1]
	lsls r1, r1, #0x1e
	ldrb r0, [r5, #0x11]
	lsls r0, r0, #0x1e
	lsrs r2, r0, #0x1e
	cmp r1, r0
	beq .L080DADEE
	ldr r0, [r6]
	adds r0, #8
	adds r1, r2, #0
	bl func_0803D080
.L080DADEE:
	ldr r0, [r6]
	mov r1, sb
	ldr r2, [r1]
	lsls r2, r2, #5
	lsrs r2, r2, #0x1a
	movs r1, #1
	ands r1, r2
	adds r0, #8
	bl func_0803D2E8
.L080DAE02:
	ldr r0, [r6]
	movs r2, #0xaa
	lsls r2, r2, #3
	add r2, sp
	ldr r2, [r2]
	ldr r1, [r2]
	ldr r1, [r1, #8]
	adds r0, #8
	bl func_0803D3A0
	movs r3, #0xaa
	lsls r3, r3, #3
	add r3, sp
	ldr r3, [r3]
	ldr r0, [r3]
	ldr r4, .L080DAE50 @ =0x00001C34
	adds r5, r0, r4
	adds r0, r5, #0
	bl IsEmpty__C9ToolStack
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080DAE54
	ldr r0, [r6]
	adds r0, #8
	bl func_0803D440
	b .L080DAE90
	.align 2, 0
.L080DAE3C: .4byte 0x00000544
.L080DAE40: .4byte 0x00000564
.L080DAE44: .4byte 0x00000574
.L080DAE48: .4byte 0x000004CC
.L080DAE4C: .4byte 0x0000051C
.L080DAE50: .4byte 0x00001C34
.L080DAE54:
	movs r7, #0xaa
	lsls r7, r7, #3
	add r7, sp
	ldr r7, [r7]
	ldr r4, [r7]
	ldr r0, .L080DAFA4 @ =0x00001BD8
	adds r4, r4, r0
	adds r0, r5, #0
	bl GetTool__C9ToolStack
	adds r1, r0, #0
	adds r0, r4, #0
	bl func_0800E550
	movs r1, #0x9a
	lsls r1, r1, #3
	add r1, sp
	strb r0, [r1]
	movs r0, #0x9a
	lsls r0, r0, #3
	add r0, sp
	bl GetIconId__C4Tool
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, [r6]
	adds r0, #8
	bl func_0803D404
.L080DAE90:
	ldr r1, .L080DAFA8 @ =0x00000574
	add r1, sp
	ldr r1, [r1]
	ldrb r0, [r1]
	cmp r0, #0
	bne .L080DAEA8
	ldr r2, .L080DAFAC @ =0x0000055C
	add r2, sp
	ldr r2, [r2]
	ldr r0, [r2]
	bl func_080093AC
.L080DAEA8:
	movs r3, #0xab
	lsls r3, r3, #3
	add r3, sp
	ldr r3, [r3]
	ldr r0, [r3]
	cmp r0, #0
	beq .L080DAEB8
	b .L080DB0BC
.L080DAEB8:
	ldr r0, .L080DAFB0 @ =gUnk_0300040C
	ldr r1, [r0]
	movs r5, #0xde
	lsls r5, r5, #2
	adds r4, r1, r5
	movs r3, #0
	movs r2, #0
	ldr r0, [r4]
	cmp r0, #0
	bne .L080DAECE
	movs r2, #1
.L080DAECE:
	cmp r2, #0
	beq .L080DAEFC
	movs r6, #0xe3
	lsls r6, r6, #2
	adds r0, r1, r6
	movs r2, #0
	ldr r0, [r0]
	cmp r0, #0
	bne .L080DAEE2
	movs r2, #1
.L080DAEE2:
	cmp r2, #0
	beq .L080DAEFC
	movs r7, #0x9a
	lsls r7, r7, #3
	adds r0, r1, r7
	movs r1, #0
	ldr r0, [r0]
	cmp r0, #0
	bne .L080DAEF6
	movs r1, #1
.L080DAEF6:
	cmp r1, #0
	beq .L080DAEFC
	movs r3, #1
.L080DAEFC:
	cmp r3, #0
	beq .L080DAF02
	b .L080DB0BC
.L080DAF02:
	ldr r1, .L080DAFAC @ =0x0000055C
	add r1, sp
	ldr r1, [r1]
	ldr r0, [r1]
	bl func_080094A4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r5, r1, #0x1f
	cmp r5, #0
	beq .L080DAF1E
	b .L080DB0BC
.L080DAF1E:
	ldr r2, .L080DAFB4 @ =0x00000564
	add r2, sp
	ldr r2, [r2]
	ldr r0, [r2]
	ldr r1, [r0]
	ldr r2, [r1, #0x40]
	movs r1, #0
	bl _call_via_r2
	adds r2, r0, #0
	cmp r2, #0
	beq .L080DAF4A
	ldr r0, [r2, #0x14]
	adds r0, #0x98
	ldr r1, [r0]
	adds r0, r2, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080DAF4A
	b .L080DB0BC
.L080DAF4A:
	movs r1, #0
	ldr r0, [r4]
	cmp r0, #0
	bne .L080DAF54
	movs r1, #1
.L080DAF54:
	cmp r1, #0
	bne .L080DAFBC
	adds r6, r4, #4
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	movs r3, #0xa4
	lsls r3, r3, #3
	add r3, sp
	str r1, [r3]
	str r2, [r3, #4]
	ldr r3, .L080DAFB8 @ =0x000004D4
	add r3, sp
	cmp r0, #0
	beq .L080DAF98
	lsls r0, r0, #3
	adds r0, #4
	adds r0, r4, r0
	adds r1, r4, #0
	adds r1, #0xc
	cmp r1, r0
	beq .L080DAF92
	adds r5, r1, #0
	subs r0, r0, r5
	asrs r2, r0, #3
	cmp r2, #0
	ble .L080DAF92
.L080DAF88:
	ldm r5!, {r0, r1}
	stm r6!, {r0, r1}
	subs r2, #1
	cmp r2, #0
	bgt .L080DAF88
.L080DAF92:
	ldr r0, [r4]
	subs r0, #1
	str r0, [r4]
.L080DAF98:
	ldr r0, .L080DAFB8 @ =0x000004D4
	add r0, sp
	movs r5, #0xa4
	lsls r5, r5, #3
	b .L080DB01A
	.align 2, 0
.L080DAFA4: .4byte 0x00001BD8
.L080DAFA8: .4byte 0x00000574
.L080DAFAC: .4byte 0x0000055C
.L080DAFB0: .4byte gUnk_0300040C
.L080DAFB4: .4byte 0x00000564
.L080DAFB8: .4byte 0x000004D4
.L080DAFBC:
	adds r7, r4, #0
	adds r7, #0x14
	movs r1, #0
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne .L080DAFCA
	movs r1, #1
.L080DAFCA:
	cmp r1, #0
	bne .L080DB02C
	adds r6, r4, #0
	adds r6, #0x18
	ldr r1, [r4, #0x18]
	ldr r2, [r4, #0x1c]
	movs r3, #0xa5
	lsls r3, r3, #3
	add r3, sp
	str r1, [r3]
	str r2, [r3, #4]
	adds r5, r7, #0
	ldr r3, .L080DB028 @ =0x000004D4
	add r3, sp
	cmp r0, #0
	beq .L080DB012
	lsls r0, r0, #3
	adds r0, #4
	adds r1, r5, r0
	adds r0, r4, #0
	adds r0, #0x20
	cmp r0, r1
	beq .L080DB00C
	adds r4, r0, #0
	subs r0, r1, r4
	asrs r2, r0, #3
	cmp r2, #0
	ble .L080DB00C
.L080DB002:
	ldm r4!, {r0, r1}
	stm r6!, {r0, r1}
	subs r2, #1
	cmp r2, #0
	bgt .L080DB002
.L080DB00C:
	ldr r0, [r5]
	subs r0, #1
	str r0, [r5]
.L080DB012:
	ldr r0, .L080DB028 @ =0x000004D4
	add r0, sp
	movs r5, #0xa5
	lsls r5, r5, #3
.L080DB01A:
	add r5, sp
	ldr r4, [r5]
	ldr r5, [r5, #4]
	str r4, [r0]
	str r5, [r0, #4]
	b .L080DB0AE
	.align 2, 0
.L080DB028: .4byte 0x000004D4
.L080DB02C:
	movs r6, #0xac
	lsls r6, r6, #1
	adds r7, r4, r6
	movs r1, #0
	ldr r0, [r7]
	cmp r0, #0
	bne .L080DB03C
	movs r1, #1
.L080DB03C:
	cmp r1, #0
	bne .L080DB0A0
	movs r1, #0xae
	lsls r1, r1, #1
	adds r6, r4, r1
	ldr r1, [r6]
	ldr r2, [r6, #4]
	movs r3, #0xa6
	lsls r3, r3, #3
	add r3, sp
	str r1, [r3]
	str r2, [r3, #4]
	adds r5, r7, #0
	ldr r3, .L080DB09C @ =0x000004D4
	add r3, sp
	cmp r0, #0
	beq .L080DB088
	lsls r0, r0, #3
	adds r0, #4
	adds r1, r5, r0
	movs r7, #0xb2
	lsls r7, r7, #1
	adds r0, r4, r7
	cmp r0, r1
	beq .L080DB082
	adds r4, r0, #0
	subs r0, r1, r4
	asrs r2, r0, #3
	cmp r2, #0
	ble .L080DB082
.L080DB078:
	ldm r4!, {r0, r1}
	stm r6!, {r0, r1}
	subs r2, #1
	cmp r2, #0
	bgt .L080DB078
.L080DB082:
	ldr r0, [r5]
	subs r0, #1
	str r0, [r5]
.L080DB088:
	ldr r0, .L080DB09C @ =0x000004D4
	add r0, sp
	movs r2, #0xa6
	lsls r2, r2, #3
	add r2, sp
	ldr r1, [r2]
	ldr r2, [r2, #4]
	str r1, [r0]
	str r2, [r0, #4]
	b .L080DB0AE
	.align 2, 0
.L080DB09C: .4byte 0x000004D4
.L080DB0A0:
	ldr r1, .L080DB0C8 @ =0x000004D4
	add r1, sp
	ldr r0, .L080DB0C8 @ =0x000004D4
	add r0, sp
	str r5, [r0]
	str r5, [r1, #4]
	adds r3, r1, #0
.L080DB0AE:
	ldr r0, .L080DB0C8 @ =0x000004D4
	add r0, sp
	ldr r1, [r0]
	ldr r2, [r3, #4]
	mov r0, sl
	bl func_080DC294
.L080DB0BC:
	mov r0, sl
	add r1, sp, #0x34
	bl func_08011CD8
	bl .L080D8FE8
	.align 2, 0
.L080DB0C8: .4byte 0x000004D4
func_080DB0CC:
	ldr r3, .L080DB0E8 @ =0x000004DC
	add r3, sp
	ldr r0, [r3]
	movs r3, #0xb2
	lsls r3, r3, #3
	add sp, r3
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L080DB0E8: .4byte 0x000004DC

	thumb_func_start func_080DB0EC
func_080DB0EC: @ 0x080DB0EC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r4, #0
	adds r1, #0xf4
	ldr r0, .L080DB1E0 @ =vtable_unk_080E5C08
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0xf0
	ldr r0, [r0]
	bl __builtin_delete
	adds r0, r4, #0
	adds r0, #0xd0
	ldr r0, [r0]
	cmp r0, #0
	beq .L080DB112
	bl free
.L080DB112:
	adds r0, r4, #0
	adds r0, #0xb8
	ldr r1, [r0]
	cmp r1, #0
	beq .L080DB128
	ldr r0, [r1, #4]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DB128:
	adds r0, r4, #0
	adds r0, #0xb4
	ldr r1, [r0]
	cmp r1, #0
	beq .L080DB13E
	ldr r0, [r1, #4]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DB13E:
	adds r0, r4, #0
	adds r0, #0xb0
	ldr r1, [r0]
	cmp r1, #0
	beq .L080DB154
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DB154:
	adds r0, r4, #0
	adds r0, #0xac
	ldr r0, [r0]
	cmp r0, #0
	beq .L080DB164
	movs r1, #3
	bl func_08050D0C
.L080DB164:
	adds r0, r4, #0
	adds r0, #0xa8
	ldr r1, [r0]
	cmp r1, #0
	beq .L080DB17A
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DB17A:
	adds r0, r4, #0
	adds r0, #0xa4
	ldr r1, [r0]
	cmp r1, #0
	beq .L080DB190
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DB190:
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r0, [r0]
	cmp r0, #0
	beq .L080DB1A0
	movs r1, #3
	bl func_08009324
.L080DB1A0:
	adds r0, r4, #0
	adds r0, #0x6c
	movs r1, #2
	bl func_080098DC
	adds r0, r4, #0
	adds r0, #0x68
	movs r1, #2
	bl func_08008A68
	ldr r1, [r4, #4]
	ldr r0, [r4]
	cmp r0, r1
	beq .L080DB1C2
.L080DB1BC:
	adds r0, #0x10
	cmp r0, r1
	bne .L080DB1BC
.L080DB1C2:
	ldr r0, [r4]
	cmp r0, #0
	beq .L080DB1CC
	bl free
.L080DB1CC:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq .L080DB1DA
	adds r0, r4, #0
	bl __builtin_delete
.L080DB1DA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080DB1E0: .4byte vtable_unk_080E5C08

	thumb_func_start func_080DB1E4
func_080DB1E4: @ 0x080DB1E4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	adds r5, r1, #0
	movs r6, #0
	ldr r0, [r5, #0xc]
	cmp r0, #2
	bne .L080DB1F6
	movs r6, #1
.L080DB1F6:
	ldr r0, [r5, #8]
	movs r4, #0
	str r4, [r5, #8]
	str r0, [sp, #4]
	movs r0, #8
	bl __builtin_new
	ldr r1, [r5, #4]
	add r2, sp, #4
	adds r3, r6, #0
	bl func_0807865C
	str r0, [sp]
	mov r1, sp
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r4, [r1]
	str r0, [r7]
	ldr r1, [sp]
	cmp r1, #0
	beq .L080DB22C
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DB22C:
	adds r0, r7, #0
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080DB238
func_080DB238: @ 0x080DB238
	push {r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r6, r0, #0
	adds r5, r1, #0
	movs r0, #0x2a
	str r0, [sp]
	ldr r0, [r5, #0x10]
	cmp r0, #1
	beq .L080DB264
	cmp r0, #1
	bgt .L080DB256
	cmp r0, #0
	beq .L080DB25E
	add r4, sp, #0xc
	b .L080DB2AE
.L080DB256:
	cmp r0, #2
	beq .L080DB276
	add r4, sp, #0xc
	b .L080DB2AE
.L080DB25E:
	add r2, sp, #0xc
	movs r0, #1
	b .L080DB268
.L080DB264:
	add r2, sp, #0xc
	movs r0, #5
.L080DB268:
	str r0, [sp, #0xc]
	mov r1, sp
	adds r0, r2, #0
	ldm r0!, {r3, r4, r7}
	stm r1!, {r3, r4, r7}
	adds r4, r2, #0
	b .L080DB2AE
.L080DB276:
	mov r1, sp
	ldrb r0, [r5, #4]
	strb r0, [r1, #4]
	lsls r0, r0, #0x18
	add r4, sp, #0xc
	cmp r0, #0
	beq .L080DB2AE
	ldrh r1, [r5, #6]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0xe
	ldr r0, [sp, #4]
	ldr r2, .L080DB2E4 @ =0xFF0000FF
	ands r0, r2
	orrs r0, r1
	str r0, [sp, #4]
	mov r3, sp
	ldrb r2, [r5, #7]
	lsrs r2, r2, #2
	ldrh r0, [r5, #8]
	ldr r1, .L080DB2E8 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #6
	orrs r0, r2
	strh r0, [r3, #8]
	mov r1, sp
	ldr r0, [r5, #8]
	lsrs r0, r0, #0xa
	strh r0, [r1, #0xa]
.L080DB2AE:
	movs r0, #8
	bl __builtin_new
	ldr r1, [r5, #0xc]
	mov r2, sp
	bl func_08011DC4
	str r0, [sp, #0xc]
	str r4, [sp, #0x18]
	str r0, [sp, #0x1c]
	movs r1, #0
	str r1, [r4]
	str r0, [r6]
	ldr r1, [sp, #0xc]
	cmp r1, #0
	beq .L080DB2DA
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DB2DA:
	adds r0, r6, #0
	add sp, #0x20
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L080DB2E4: .4byte 0xFF0000FF
.L080DB2E8: .4byte 0x000003FF

	thumb_func_start func_080DB2EC
func_080DB2EC: @ 0x080DB2EC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq .L080DB304
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DB304:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0800080C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DB314
func_080DB314: @ 0x080DB314
	push {lr}
	bl func_0800080C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DB320
func_080DB320: @ 0x080DB320
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	movs r0, #0xc
	bl __builtin_new
	ldr r5, [r4, #4]
	movs r2, #0
	str r2, [r4, #4]
	ldr r3, [r4, #8]
	ldr r1, .L080DB368 @ =vtable_unk_080E5E84
	str r1, [r0]
	str r2, [sp, #4]
	str r5, [r0, #4]
	str r3, [r0, #8]
	str r0, [sp]
	mov r1, sp
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r2, [r1]
	str r0, [r6]
	ldr r1, [sp]
	cmp r1, #0
	beq .L080DB35E
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DB35E:
	adds r0, r6, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L080DB368: .4byte vtable_unk_080E5E84

	thumb_func_start func_080DB36C
func_080DB36C: @ 0x080DB36C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq .L080DB384
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DB384:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0800080C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DB394
func_080DB394: @ 0x080DB394
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, [r4, #4]
	movs r5, #0
	str r5, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0xc
	bl __builtin_new
	add r1, sp, #4
	ldr r2, [r4, #8]
	bl func_0805FCD0
	str r0, [sp]
	mov r1, sp
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r5, [r1]
	str r0, [r6]
	ldr r1, [sp]
	cmp r1, #0
	beq .L080DB3D0
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DB3D0:
	adds r0, r6, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080DB3DC
func_080DB3DC: @ 0x080DB3DC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq .L080DB3F4
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DB3F4:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0800080C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080DB404:
	.byte 0x70, 0xB5, 0x84, 0xB0, 0x06, 0x1C, 0x0C, 0x1C, 0x60, 0x68, 0x00, 0x25
	.byte 0x65, 0x60, 0x01, 0x90, 0x08, 0x20, 0x25, 0xF7, 0xDD, 0xF8, 0x01, 0xA9, 0xA2, 0x68, 0xE3, 0x68
	.byte 0x92, 0xF7, 0x52, 0xFA, 0x00, 0x90, 0x69, 0x46, 0x02, 0x91, 0x03, 0x90, 0x0D, 0x60, 0x30, 0x60
	.byte 0x00, 0x99, 0x00, 0x29, 0x05, 0xD0, 0x08, 0x68, 0x82, 0x68, 0x08, 0x1C, 0x03, 0x21, 0xF8, 0xF7
	.byte 0x69, 0xFA, 0x30, 0x1C, 0x04, 0xB0, 0x70, 0xBC, 0x02, 0xBC, 0x08, 0x47, 0x30, 0xB5, 0x04, 0x1C
	.byte 0x0D, 0x1C, 0x61, 0x68, 0x00, 0x29, 0x05, 0xD0, 0x08, 0x68, 0x82, 0x68, 0x08, 0x1C, 0x03, 0x21
	.byte 0xF8, 0xF7, 0x58, 0xFA, 0x20, 0x1C, 0x29, 0x1C, 0x25, 0xF7, 0xD0, 0xF9, 0x30, 0xBC, 0x01, 0xBC
	.byte 0x00, 0x47, 0x00, 0x00, 0xF0, 0xB5, 0x84, 0xB0, 0x07, 0x1C, 0x0C, 0x1C, 0x14, 0x20, 0x25, 0xF7
	.byte 0xA9, 0xF8, 0x65, 0x68, 0x00, 0x22, 0x62, 0x60, 0x26, 0x7C, 0xA3, 0x68, 0xE4, 0x68, 0x0D, 0x49
	.byte 0x01, 0x60, 0x01, 0x92, 0x45, 0x60, 0x83, 0x60, 0xC4, 0x60, 0x06, 0x74, 0x00, 0x90, 0x69, 0x46
	.byte 0x02, 0x91, 0x03, 0x90, 0x0A, 0x60, 0x38, 0x60, 0x00, 0x99, 0x00, 0x29, 0x05, 0xD0, 0x08, 0x68
	.byte 0x82, 0x68, 0x08, 0x1C, 0x03, 0x21, 0xF8, 0xF7, 0x2D, 0xFA, 0x38, 0x1C, 0x04, 0xB0, 0xF0, 0xBC
	.byte 0x02, 0xBC, 0x08, 0x47, 0xC8, 0x82, 0x0E, 0x08, 0x30, 0xB5, 0x04, 0x1C, 0x0D, 0x1C, 0x61, 0x68
	.byte 0x00, 0x29, 0x05, 0xD0, 0x08, 0x68, 0x82, 0x68, 0x08, 0x1C, 0x03, 0x21, 0xF8, 0xF7, 0x1A, 0xFA
	.byte 0x20, 0x1C, 0x29, 0x1C, 0x25, 0xF7, 0x92, 0xF9, 0x30, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00
	.byte 0x70, 0xB5, 0x84, 0xB0, 0x06, 0x1C, 0x0C, 0x1C, 0x10, 0x20, 0x25, 0xF7, 0x6B, 0xF8, 0x65, 0x68
	.byte 0x00, 0x22, 0x62, 0x60, 0xA3, 0x68, 0xE4, 0x68, 0x0C, 0x49, 0x01, 0x60, 0x01, 0x92, 0x45, 0x60
	.byte 0x83, 0x60, 0xC4, 0x60, 0x00, 0x90, 0x69, 0x46, 0x02, 0x91, 0x03, 0x90, 0x0A, 0x60, 0x30, 0x60
	.byte 0x00, 0x99, 0x00, 0x29, 0x05, 0xD0, 0x08, 0x68, 0x82, 0x68, 0x08, 0x1C, 0x03, 0x21, 0xF8, 0xF7
	.byte 0xF1, 0xF9, 0x30, 0x1C, 0x04, 0xB0, 0x70, 0xBC, 0x02, 0xBC, 0x08, 0x47, 0x88, 0x82, 0x0E, 0x08
	.byte 0x30, 0xB5, 0x04, 0x1C, 0x0D, 0x1C, 0x61, 0x68, 0x00, 0x29, 0x05, 0xD0, 0x08, 0x68, 0x82, 0x68
	.byte 0x08, 0x1C, 0x03, 0x21, 0xF8, 0xF7, 0xDE, 0xF9, 0x20, 0x1C, 0x29, 0x1C, 0x25, 0xF7, 0x56, 0xF9
	.byte 0x30, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0x70, 0xB5, 0x84, 0xB0, 0x06, 0x1C, 0x0C, 0x1C
	.byte 0x10, 0x20, 0x25, 0xF7, 0x2F, 0xF8, 0x65, 0x68, 0x00, 0x22, 0x62, 0x60, 0xA3, 0x68, 0xE4, 0x68
	.byte 0x0C, 0x49, 0x01, 0x60, 0x01, 0x92, 0x45, 0x60, 0x83, 0x60, 0xC4, 0x60, 0x00, 0x90, 0x69, 0x46
	.byte 0x02, 0x91, 0x03, 0x90, 0x0A, 0x60, 0x30, 0x60, 0x00, 0x99, 0x00, 0x29, 0x05, 0xD0, 0x08, 0x68
	.byte 0x82, 0x68, 0x08, 0x1C, 0x03, 0x21, 0xF8, 0xF7, 0xB5, 0xF9, 0x30, 0x1C, 0x04, 0xB0, 0x70, 0xBC
	.byte 0x02, 0xBC, 0x08, 0x47, 0x98, 0x82, 0x0E, 0x08, 0x30, 0xB5, 0x04, 0x1C, 0x0D, 0x1C, 0x61, 0x68
	.byte 0x00, 0x29, 0x05, 0xD0, 0x08, 0x68, 0x82, 0x68, 0x08, 0x1C, 0x03, 0x21, 0xF8, 0xF7, 0xA2, 0xF9
	.byte 0x20, 0x1C, 0x29, 0x1C, 0x25, 0xF7, 0x1A, 0xF9, 0x30, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00
	.byte 0x70, 0xB5, 0x84, 0xB0, 0x06, 0x1C, 0x0C, 0x1C, 0x10, 0x20, 0x24, 0xF7, 0xF3, 0xFF, 0x65, 0x68
	.byte 0x00, 0x22, 0x62, 0x60, 0xA3, 0x68, 0xE4, 0x68, 0x0C, 0x49, 0x01, 0x60, 0x01, 0x92, 0x45, 0x60
	.byte 0x83, 0x60, 0xC4, 0x60, 0x00, 0x90, 0x69, 0x46, 0x02, 0x91, 0x03, 0x90, 0x0A, 0x60, 0x30, 0x60
	.byte 0x00, 0x99, 0x00, 0x29, 0x05, 0xD0, 0x08, 0x68, 0x82, 0x68, 0x08, 0x1C, 0x03, 0x21, 0xF8, 0xF7
	.byte 0x79, 0xF9, 0x30, 0x1C, 0x04, 0xB0, 0x70, 0xBC, 0x02, 0xBC, 0x08, 0x47, 0xA8, 0x82, 0x0E, 0x08

	thumb_func_start func_080DB630
func_080DB630: @ 0x080DB630
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq .L080DB648
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DB648:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0800080C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DB658
func_080DB658: @ 0x080DB658
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	movs r0, #0xc
	bl __builtin_new
	ldr r5, [r4, #4]
	movs r2, #0
	str r2, [r4, #4]
	ldr r3, [r4, #8]
	ldr r1, .L080DB6A0 @ =vtable_unk_080E82B8
	str r1, [r0]
	str r2, [sp, #4]
	str r5, [r0, #4]
	str r3, [r0, #8]
	str r0, [sp]
	mov r1, sp
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r2, [r1]
	str r0, [r6]
	ldr r1, [sp]
	cmp r1, #0
	beq .L080DB696
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DB696:
	adds r0, r6, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L080DB6A0: .4byte vtable_unk_080E82B8

	thumb_func_start func_080DB6A4
func_080DB6A4: @ 0x080DB6A4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq .L080DB6BC
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DB6BC:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0800080C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DB6CC
func_080DB6CC: @ 0x080DB6CC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, [r4, #4]
	movs r5, #0
	str r5, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0xc
	bl __builtin_new
	add r1, sp, #4
	ldr r2, [r4, #8]
	bl func_080A3744
	str r0, [sp]
	mov r1, sp
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r5, [r1]
	str r0, [r6]
	ldr r1, [sp]
	cmp r1, #0
	beq .L080DB708
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DB708:
	adds r0, r6, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080DB714
func_080DB714: @ 0x080DB714
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq .L080DB72C
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DB72C:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0800080C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DB73C
func_080DB73C: @ 0x080DB73C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, [r4, #4]
	movs r5, #0
	str r5, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0xc
	bl __builtin_new
	add r1, sp, #4
	ldr r2, [r4, #8]
	bl func_0808AB38
	str r0, [sp]
	mov r1, sp
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r5, [r1]
	str r0, [r6]
	ldr r1, [sp]
	cmp r1, #0
	beq .L080DB778
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DB778:
	adds r0, r6, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080DB784
func_080DB784: @ 0x080DB784
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq .L080DB79C
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DB79C:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0800080C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DB7AC
func_080DB7AC: @ 0x080DB7AC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, [r4, #4]
	movs r5, #0
	str r5, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0xc
	bl __builtin_new
	add r1, sp, #4
	ldr r2, [r4, #8]
	bl func_0808ECD8
	str r0, [sp]
	mov r1, sp
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r5, [r1]
	str r0, [r6]
	ldr r1, [sp]
	cmp r1, #0
	beq .L080DB7E8
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DB7E8:
	adds r0, r6, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080DB7F4
func_080DB7F4: @ 0x080DB7F4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq .L080DB80C
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DB80C:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0800080C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DB81C
func_080DB81C: @ 0x080DB81C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, [r4, #4]
	movs r5, #0
	str r5, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0xc
	bl __builtin_new
	add r1, sp, #4
	ldr r2, [r4, #8]
	bl func_08090E54
	str r0, [sp]
	mov r1, sp
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r5, [r1]
	str r0, [r6]
	ldr r1, [sp]
	cmp r1, #0
	beq .L080DB858
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DB858:
	adds r0, r6, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080DB864
func_080DB864: @ 0x080DB864
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq .L080DB87C
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DB87C:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0800080C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DB88C
func_080DB88C: @ 0x080DB88C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, [r4, #4]
	movs r5, #0
	str r5, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0xc
	bl __builtin_new
	add r1, sp, #4
	ldr r2, [r4, #8]
	bl func_0808C56C
	str r0, [sp]
	mov r1, sp
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r5, [r1]
	str r0, [r6]
	ldr r1, [sp]
	cmp r1, #0
	beq .L080DB8C8
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DB8C8:
	adds r0, r6, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080DB8D4
func_080DB8D4: @ 0x080DB8D4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq .L080DB8EC
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DB8EC:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0800080C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DB8FC
func_080DB8FC: @ 0x080DB8FC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, [r4, #4]
	movs r5, #0
	str r5, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0xc
	bl __builtin_new
	add r1, sp, #4
	ldr r2, [r4, #8]
	bl func_0805218C
	str r0, [sp]
	mov r1, sp
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r5, [r1]
	str r0, [r6]
	ldr r1, [sp]
	cmp r1, #0
	beq .L080DB938
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DB938:
	adds r0, r6, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080DB944
func_080DB944: @ 0x080DB944
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq .L080DB95C
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DB95C:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0800080C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DB96C
func_080DB96C: @ 0x080DB96C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, [r4, #4]
	movs r5, #0
	str r5, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0xc
	bl __builtin_new
	add r1, sp, #4
	ldr r2, [r4, #8]
	ldrb r3, [r4, #0xc]
	bl func_08057DD8
	str r0, [sp]
	mov r1, sp
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r5, [r1]
	str r0, [r6]
	ldr r1, [sp]
	cmp r1, #0
	beq .L080DB9AA
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DB9AA:
	adds r0, r6, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start func_080DB9B4
func_080DB9B4: @ 0x080DB9B4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq .L080DB9CC
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DB9CC:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0800080C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DB9DC
func_080DB9DC: @ 0x080DB9DC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, [r4, #4]
	movs r5, #0
	str r5, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0xc
	bl __builtin_new
	add r1, sp, #4
	ldr r2, [r4, #8]
	bl func_0805E624
	str r0, [sp]
	mov r1, sp
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r5, [r1]
	str r0, [r6]
	ldr r1, [sp]
	cmp r1, #0
	beq .L080DBA18
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DBA18:
	adds r0, r6, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080DBA24
func_080DBA24: @ 0x080DBA24
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq .L080DBA3C
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DBA3C:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0800080C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DBA4C
func_080DBA4C: @ 0x080DBA4C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, [r4, #4]
	movs r5, #0
	str r5, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0xc
	bl __builtin_new
	add r1, sp, #4
	ldr r2, [r4, #8]
	ldrb r3, [r4, #0xc]
	bl func_0805CEB8
	str r0, [sp]
	mov r1, sp
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r5, [r1]
	str r0, [r6]
	ldr r1, [sp]
	cmp r1, #0
	beq .L080DBA8A
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DBA8A:
	adds r0, r6, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start func_080DBA94
func_080DBA94: @ 0x080DBA94
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq .L080DBAAC
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DBAAC:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0800080C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DBABC
func_080DBABC: @ 0x080DBABC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, [r4, #4]
	movs r5, #0
	str r5, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0xc
	bl __builtin_new
	add r1, sp, #4
	ldr r2, [r4, #8]
	ldrb r3, [r4, #0xc]
	bl func_0809A4D4
	str r0, [sp]
	mov r1, sp
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r5, [r1]
	str r0, [r6]
	ldr r1, [sp]
	cmp r1, #0
	beq .L080DBAFA
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DBAFA:
	adds r0, r6, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start func_080DBB04
func_080DBB04: @ 0x080DBB04
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq .L080DBB1C
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DBB1C:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0800080C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DBB2C
func_080DBB2C: @ 0x080DBB2C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, [r4, #4]
	movs r5, #0
	str r5, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0xc
	bl __builtin_new
	add r1, sp, #4
	ldr r2, [r4, #8]
	ldr r3, [r4, #0xc]
	bl func_0807B038
	str r0, [sp]
	mov r1, sp
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r5, [r1]
	str r0, [r6]
	ldr r1, [sp]
	cmp r1, #0
	beq .L080DBB6A
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DBB6A:
	adds r0, r6, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start func_080DBB74
func_080DBB74: @ 0x080DBB74
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq .L080DBB8C
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DBB8C:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0800080C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DBB9C
func_080DBB9C: @ 0x080DBB9C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, [r4, #4]
	movs r5, #0
	str r5, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0xc
	bl __builtin_new
	add r1, sp, #4
	ldr r2, [r4, #8]
	bl func_08081A40
	str r0, [sp]
	mov r1, sp
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r5, [r1]
	str r0, [r6]
	ldr r1, [sp]
	cmp r1, #0
	beq .L080DBBD8
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DBBD8:
	adds r0, r6, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080DBBE4
func_080DBBE4: @ 0x080DBBE4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq .L080DBBFC
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DBBFC:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0800080C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DBC0C
func_080DBC0C: @ 0x080DBC0C
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [r1, #4]
	movs r4, #0
	str r4, [r1, #4]
	str r0, [sp, #4]
	movs r0, #0xc
	bl __builtin_new
	add r1, sp, #4
	bl func_08077C40
	str r0, [sp]
	mov r1, sp
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r4, [r1]
	str r0, [r5]
	ldr r1, [sp]
	cmp r1, #0
	beq .L080DBC44
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DBC44:
	adds r0, r5, #0
	add sp, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080DBC50
func_080DBC50: @ 0x080DBC50
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq .L080DBC68
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DBC68:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0800080C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DBC78
func_080DBC78: @ 0x080DBC78
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, [r4, #4]
	movs r5, #0
	str r5, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0xc
	bl __builtin_new
	add r1, sp, #4
	ldr r2, [r4, #8]
	bl func_080931B0
	str r0, [sp]
	mov r1, sp
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r5, [r1]
	str r0, [r6]
	ldr r1, [sp]
	cmp r1, #0
	beq .L080DBCB4
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DBCB4:
	adds r0, r6, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080DBCC0
func_080DBCC0: @ 0x080DBCC0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq .L080DBCD8
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DBCD8:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0800080C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DBCE8
func_080DBCE8: @ 0x080DBCE8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, [r4, #4]
	movs r5, #0
	str r5, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0x14
	bl __builtin_new
	add r1, sp, #4
	ldr r2, [r4, #8]
	ldr r3, [r4, #0xc]
	bl func_08088168
	str r0, [sp]
	mov r1, sp
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r5, [r1]
	str r0, [r6]
	ldr r1, [sp]
	cmp r1, #0
	beq .L080DBD26
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DBD26:
	adds r0, r6, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start func_080DBD30
func_080DBD30: @ 0x080DBD30
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq .L080DBD48
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DBD48:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0800080C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DBD58
func_080DBD58: @ 0x080DBD58
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, [r4, #4]
	movs r5, #0
	str r5, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0x14
	bl __builtin_new
	add r1, sp, #4
	ldr r2, [r4, #8]
	ldr r3, [r4, #0xc]
	bl func_0807D070
	str r0, [sp]
	mov r1, sp
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r5, [r1]
	str r0, [r6]
	ldr r1, [sp]
	cmp r1, #0
	beq .L080DBD96
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DBD96:
	adds r0, r6, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start func_080DBDA0
func_080DBDA0: @ 0x080DBDA0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq .L080DBDB8
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DBDB8:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0800080C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DBDC8
func_080DBDC8: @ 0x080DBDC8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, [r4, #4]
	movs r5, #0
	str r5, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0xc
	bl __builtin_new
	add r1, sp, #4
	ldr r2, [r4, #8]
	bl func_08080D94
	str r0, [sp]
	mov r1, sp
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r5, [r1]
	str r0, [r6]
	ldr r1, [sp]
	cmp r1, #0
	beq .L080DBE04
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DBE04:
	adds r0, r6, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080DBE10
func_080DBE10: @ 0x080DBE10
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq .L080DBE28
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DBE28:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0800080C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DBE38
func_080DBE38: @ 0x080DBE38
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, [r4, #4]
	movs r5, #0
	str r5, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0xc
	bl __builtin_new
	add r1, sp, #4
	ldr r2, [r4, #8]
	bl func_0807F580
	str r0, [sp]
	mov r1, sp
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r5, [r1]
	str r0, [r6]
	ldr r1, [sp]
	cmp r1, #0
	beq .L080DBE74
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DBE74:
	adds r0, r6, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080DBE80
func_080DBE80: @ 0x080DBE80
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq .L080DBE98
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DBE98:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0800080C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DBEA8
func_080DBEA8: @ 0x080DBEA8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, [r4, #4]
	movs r5, #0
	str r5, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0xc
	bl __builtin_new
	add r1, sp, #4
	ldr r2, [r4, #8]
	bl func_08082114
	str r0, [sp]
	mov r1, sp
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r5, [r1]
	str r0, [r6]
	ldr r1, [sp]
	cmp r1, #0
	beq .L080DBEE4
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DBEE4:
	adds r0, r6, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080DBEF0
func_080DBEF0: @ 0x080DBEF0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq .L080DBF08
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DBF08:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0800080C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DBF18
func_080DBF18: @ 0x080DBF18
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, [r4, #4]
	movs r5, #0
	str r5, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0xc
	bl __builtin_new
	add r1, sp, #4
	ldr r2, [r4, #8]
	bl func_0808045C
	str r0, [sp]
	mov r1, sp
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r5, [r1]
	str r0, [r6]
	ldr r1, [sp]
	cmp r1, #0
	beq .L080DBF54
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DBF54:
	adds r0, r6, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080DBF60
func_080DBF60: @ 0x080DBF60
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq .L080DBF78
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DBF78:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0800080C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DBF88
func_080DBF88: @ 0x080DBF88
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, [r4, #4]
	movs r5, #0
	str r5, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0xc
	bl __builtin_new
	add r1, sp, #4
	ldr r2, [r4, #8]
	bl func_080854F4
	str r0, [sp]
	mov r1, sp
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r5, [r1]
	str r0, [r6]
	ldr r1, [sp]
	cmp r1, #0
	beq .L080DBFC4
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DBFC4:
	adds r0, r6, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080DBFD0
func_080DBFD0: @ 0x080DBFD0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq .L080DBFE8
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DBFE8:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0800080C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DBFF8
func_080DBFF8: @ 0x080DBFF8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, [r4, #4]
	movs r5, #0
	str r5, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0xc
	bl __builtin_new
	add r1, sp, #4
	ldr r2, [r4, #8]
	bl func_0807EE14
	str r0, [sp]
	mov r1, sp
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r5, [r1]
	str r0, [r6]
	ldr r1, [sp]
	cmp r1, #0
	beq .L080DC034
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DC034:
	adds r0, r6, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080DC040
func_080DC040: @ 0x080DC040
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq .L080DC058
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DC058:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0800080C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DC068
func_080DC068: @ 0x080DC068
	push {r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r7, r0, #0
	adds r5, r1, #0
	ldr r0, [r5, #4]
	movs r6, #0
	str r6, [r5, #4]
	str r0, [sp, #0x14]
	movs r0, #0x20
	bl __builtin_new
	add r1, sp, #0x14
	ldr r2, [r5, #8]
	ldrb r3, [r5, #0x1c]
	ldr r4, [r5, #0xc]
	str r4, [sp]
	ldr r4, [r5, #0x10]
	str r4, [sp, #4]
	ldr r4, [r5, #0x14]
	str r4, [sp, #8]
	ldr r4, [r5, #0x18]
	str r4, [sp, #0xc]
	bl func_08083A7C
	str r0, [sp, #0x10]
	add r1, sp, #0x10
	str r1, [sp, #0x18]
	str r0, [sp, #0x1c]
	str r6, [r1]
	str r0, [r7]
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq .L080DC0B6
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DC0B6:
	adds r0, r7, #0
	add sp, #0x20
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start func_080DC0C0
func_080DC0C0: @ 0x080DC0C0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq .L080DC0D8
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DC0D8:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0800080C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DC0E8
func_080DC0E8: @ 0x080DC0E8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, [r4, #4]
	movs r5, #0
	str r5, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0xc
	bl __builtin_new
	add r1, sp, #4
	ldr r2, [r4, #8]
	ldr r3, [r4, #0xc]
	bl func_0807E438
	str r0, [sp]
	mov r1, sp
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r5, [r1]
	str r0, [r6]
	ldr r1, [sp]
	cmp r1, #0
	beq .L080DC126
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DC126:
	adds r0, r6, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start func_080DC130
func_080DC130: @ 0x080DC130
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq .L080DC148
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DC148:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0800080C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DC158
func_080DC158: @ 0x080DC158
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, [r4, #4]
	movs r5, #0
	str r5, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0xc
	bl __builtin_new
	add r1, sp, #4
	ldr r2, [r4, #8]
	bl func_0807DD38
	str r0, [sp]
	mov r1, sp
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r5, [r1]
	str r0, [r6]
	ldr r1, [sp]
	cmp r1, #0
	beq .L080DC194
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DC194:
	adds r0, r6, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080DC1A0
func_080DC1A0: @ 0x080DC1A0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq .L080DC1B8
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DC1B8:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0800080C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DC1C8
func_080DC1C8: @ 0x080DC1C8
	push {lr}
	bl func_0800080C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DC1D4
func_080DC1D4: @ 0x080DC1D4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, [r4, #8]
	movs r5, #0
	str r5, [r4, #8]
	str r0, [sp, #4]
	movs r0, #8
	bl __builtin_new
	ldr r1, [r4, #4]
	add r2, sp, #4
	bl func_08004B94
	str r0, [sp]
	mov r1, sp
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r5, [r1]
	str r0, [r6]
	ldr r1, [sp]
	cmp r1, #0
	beq .L080DC210
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DC210:
	adds r0, r6, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080DC21C
func_080DC21C: @ 0x080DC21C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq .L080DC234
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DC234:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0800080C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DC244
func_080DC244: @ 0x080DC244
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #8
	bl __builtin_new
	ldr r1, [r4, #4]
	adds r4, #8
	adds r2, r4, #0
	bl func_08011DC4
	str r0, [sp]
	mov r1, sp
	str r1, [sp, #4]
	str r0, [sp, #8]
	adds r2, r1, #0
	movs r1, #0
	str r1, [r2]
	str r0, [r5]
	ldr r1, [sp]
	cmp r1, #0
	beq .L080DC27E
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DC27E:
	adds r0, r5, #0
	add sp, #0xc
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start func_080DC288
func_080DC288: @ 0x080DC288
	push {lr}
	bl func_0800080C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DC294
func_080DC294: @ 0x080DC294
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L080DC2B0 @ =gUnk_0300040C
	ldr r0, [r0]
	adds r0, #8
	bl LoadById__12ScriptEngineii
	adds r0, r4, #0
	bl func_080D7F3C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080DC2B0: .4byte gUnk_0300040C

	thumb_func_start func_080DC2B4
func_080DC2B4: @ 0x080DC2B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp, #8]
	adds r0, #0xa8
	ldr r0, [r0]
	ldr r4, [r0]
	mov ip, r4
	movs r5, #0xb4
	add ip, r5
	mov r8, sp
	ldr r7, .L080DC358 @ =0x000003FF
	mov sl, r7
	mov r4, sl
	ands r1, r4
	mov r7, r8
	ldrh r5, [r7]
	ldr r6, .L080DC35C @ =0xFFFFFC00
	adds r4, r6, #0
	ands r4, r5
	orrs r4, r1
	strh r4, [r7]
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	movs r1, #0x3f
	ands r4, r1
	lsls r4, r4, #2
	ldrb r5, [r7, #1]
	mov sb, r5
	movs r5, #3
	adds r1, r5, #0
	mov r7, sb
	ands r1, r7
	orrs r1, r4
	mov r4, r8
	strb r1, [r4, #1]
	lsrs r2, r2, #0x16
	mov r7, sl
	ands r2, r7
	ldrh r4, [r4, #2]
	adds r1, r6, #0
	ands r1, r4
	orrs r1, r2
	mov r2, r8
	strh r1, [r2, #2]
	lsls r3, r3, #0x10
	lsrs r1, r3, #0x10
	movs r4, #0x3f
	ands r1, r4
	lsls r1, r1, #2
	ldrb r2, [r2, #3]
	ands r5, r2
	orrs r5, r1
	mov r7, r8
	strb r5, [r7, #3]
	lsrs r3, r3, #0x16
	mov r1, sl
	ands r3, r1
	ldrh r1, [r7, #4]
	ands r6, r1
	orrs r6, r3
	strh r6, [r7, #4]
	mov r2, ip
	ldr r3, [r2]
	mov r1, sp
	movs r2, #1
	bl _call_via_r3
	ldr r0, [sp, #8]
	bl func_080D7F08
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080DC358: .4byte 0x000003FF
.L080DC35C: .4byte 0xFFFFFC00

	thumb_func_start func_080DC360
func_080DC360: @ 0x080DC360
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	adds r6, r0, #0
	mov r8, r1
	mov sb, r2
	adds r4, r3, #0
	ldr r5, [sp, #0x20]
	adds r0, #0xa8
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r1, [r1, #0x14]
	bl _call_via_r1
	adds r2, r0, #0
	str r4, [sp]
	str r5, [sp, #4]
	adds r0, r6, #0
	mov r1, r8
	mov r3, sb
	bl func_080D7F9C
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DC3A0
func_080DC3A0: @ 0x080DC3A0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x18
	mov r8, r0
	adds r5, r1, #0
	add r6, sp, #0xc
	movs r7, #0
	str r7, [sp, #0xc]
	ldr r2, [r5, #8]
	mov r0, sp
	adds r1, r6, #0
	bl func_08093A58
	adds r0, r6, #0
	mov r1, sp
	bl func_08093AD4
	ldr r1, [sp, #0xc]
	cmp r1, #0
	beq .L080DC3D6
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DC3D6:
	ldr r4, [r5, #4]
	mov r0, sp
	bl func_08093AC8
	str r0, [r4, #0xc]
	ldr r0, [r5, #4]
	str r7, [r5, #4]
	str r6, [sp, #0x10]
	str r0, [sp, #0x14]
	str r7, [sp, #0xc]
	mov r1, r8
	str r0, [r1]
	mov r0, sp
	movs r1, #2
	bl func_08093A88
	mov r0, r8
	add sp, #0x18
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start func_080DC404
func_080DC404: @ 0x080DC404
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq .L080DC41C
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DC41C:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_080007EC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DC42C
func_080DC42C: @ 0x080DC42C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, [r4, #8]
	movs r5, #0
	str r5, [r4, #8]
	str r0, [sp, #4]
	movs r0, #8
	bl __builtin_new
	ldr r1, [r4, #4]
	add r2, sp, #4
	bl func_080701BC
	str r0, [sp]
	mov r1, sp
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r5, [r1]
	str r0, [r6]
	ldr r1, [sp]
	cmp r1, #0
	beq .L080DC468
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DC468:
	adds r0, r6, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080DC474
func_080DC474: @ 0x080DC474
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq .L080DC48C
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DC48C:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0800080C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DC49C
func_080DC49C: @ 0x080DC49C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, [r4, #4]
	movs r5, #0
	str r5, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0xc
	bl __builtin_new
	add r1, sp, #4
	ldr r2, [r4, #8]
	bl func_080755EC
	str r0, [sp]
	mov r1, sp
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r5, [r1]
	str r0, [r6]
	ldr r1, [sp]
	cmp r1, #0
	beq .L080DC4D8
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DC4D8:
	adds r0, r6, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080DC4E4
func_080DC4E4: @ 0x080DC4E4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq .L080DC4FC
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DC4FC:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0800080C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DC50C
func_080DC50C: @ 0x080DC50C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, [r4, #4]
	movs r5, #0
	str r5, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0xc
	bl __builtin_new
	add r1, sp, #4
	ldr r2, [r4, #8]
	ldrb r3, [r4, #0xc]
	bl func_08069E14
	str r0, [sp]
	mov r1, sp
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r5, [r1]
	str r0, [r6]
	ldr r1, [sp]
	cmp r1, #0
	beq .L080DC54A
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DC54A:
	adds r0, r6, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start func_080DC554
func_080DC554: @ 0x080DC554
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq .L080DC56C
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DC56C:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0800080C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DC57C
func_080DC57C: @ 0x080DC57C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	cmp r4, #0
	beq .L080DC5A0
.L080DC586:
	ldr r1, [r4, #0xc]
	adds r0, r6, #0
	bl func_080DC57C
	ldr r5, [r4, #8]
	cmp r4, #0
	beq .L080DC59A
	adds r0, r4, #0
	bl free
.L080DC59A:
	adds r4, r5, #0
	cmp r4, #0
	bne .L080DC586
.L080DC5A0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080DC5A8:
	.byte 0x00, 0xB5, 0xC8, 0xF7, 0x03, 0xF9, 0x01, 0xBC
	.byte 0x00, 0x47, 0x00, 0x00, 0x00, 0xB5, 0x02, 0x1C, 0x05, 0x48, 0x10, 0x60, 0x01, 0x20, 0x08, 0x40
	.byte 0x00, 0x28, 0x02, 0xD0, 0x10, 0x1C, 0x24, 0xF7, 0x1F, 0xF8, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00
	.byte 0xA0, 0x61, 0x0E, 0x08, 0x00, 0xB5, 0x02, 0x1C, 0x05, 0x48, 0x10, 0x60, 0x01, 0x20, 0x08, 0x40
	.byte 0x00, 0x28, 0x02, 0xD0, 0x10, 0x1C, 0x24, 0xF7, 0x0F, 0xF8, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00
	.byte 0xA0, 0x61, 0x0E, 0x08, 0x30, 0xB5, 0x05, 0x1C, 0x0C, 0x1C, 0x48, 0x30, 0x02, 0x21, 0xC8, 0xF7
	.byte 0xD9, 0xF8, 0x28, 0x1C, 0x08, 0x30, 0x02, 0x21, 0xC8, 0xF7, 0xD4, 0xF8, 0x05, 0x48, 0x68, 0x60
	.byte 0x01, 0x20, 0x20, 0x40, 0x00, 0x28, 0x02, 0xD0, 0x28, 0x1C, 0x23, 0xF7, 0xF5, 0xFF, 0x30, 0xBC
	.byte 0x01, 0xBC, 0x00, 0x47, 0xE0, 0x65, 0x0E, 0x08, 0x30, 0xB5, 0x04, 0x1C, 0x0D, 0x1C, 0x0A, 0x48
	.byte 0x60, 0x61, 0x21, 0x69, 0x00, 0x29, 0x05, 0xD0, 0x48, 0x68, 0x82, 0x68, 0x08, 0x1C, 0x03, 0x21
	.byte 0xF7, 0xF7, 0x68, 0xF9, 0x01, 0x20, 0x28, 0x40, 0x00, 0x28, 0x02, 0xD0, 0x20, 0x1C, 0x23, 0xF7
	.byte 0xDB, 0xFF, 0x30, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x50, 0x62, 0x0E, 0x08, 0x00, 0xB5, 0x02, 0x1C
	.byte 0x05, 0x48, 0x50, 0x60, 0x01, 0x20, 0x08, 0x40, 0x00, 0x28, 0x02, 0xD0, 0x10, 0x1C, 0x23, 0xF7
	.byte 0xCB, 0xFF, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0xE0, 0x65, 0x0E, 0x08

	thumb_func_start func_080DC67C
func_080DC67C: @ 0x080DC67C
	push {r4, r5, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	adds r3, r0, #0
	subs r0, r5, r3
	asrs r2, r0, #2
	cmp r2, #0
	ble .L080DC6B4
	ldrb r1, [r4]
.L080DC68E:
	ldrb r0, [r3]
	cmp r0, r1
	beq .L080DC6E2
	adds r3, #1
	ldrb r0, [r3]
	cmp r0, r1
	beq .L080DC6E2
	adds r3, #1
	ldrb r0, [r3]
	cmp r0, r1
	beq .L080DC6E2
	adds r3, #1
	ldrb r0, [r3]
	cmp r0, r1
	beq .L080DC6E2
	adds r3, #1
	subs r2, #1
	cmp r2, #0
	bgt .L080DC68E
.L080DC6B4:
	subs r0, r5, r3
	cmp r0, #1
	beq .L080DC6DA
	cmp r0, #1
	ble .L080DC6E6
	cmp r0, #2
	beq .L080DC6D0
	cmp r0, #3
	bne .L080DC6E6
	ldrb r0, [r3]
	ldrb r1, [r4]
	cmp r0, r1
	beq .L080DC6E2
	adds r3, #1
.L080DC6D0:
	ldrb r0, [r3]
	ldrb r1, [r4]
	cmp r0, r1
	beq .L080DC6E2
	adds r3, #1
.L080DC6DA:
	ldrb r0, [r3]
	ldrb r4, [r4]
	cmp r0, r4
	bne .L080DC6E6
.L080DC6E2:
	adds r0, r3, #0
	b .L080DC6E8
.L080DC6E6:
	adds r0, r5, #0
.L080DC6E8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L080DC6F0:
	.byte 0x30, 0xB5, 0x04, 0x1C, 0x0D, 0x1C, 0x0A, 0x48, 0x60, 0x61, 0x21, 0x69, 0x00, 0x29, 0x05, 0xD0
	.byte 0x48, 0x68, 0x82, 0x68, 0x08, 0x1C, 0x03, 0x21, 0xF7, 0xF7, 0x04, 0xF9, 0x01, 0x20, 0x28, 0x40
	.byte 0x00, 0x28, 0x02, 0xD0, 0x20, 0x1C, 0x23, 0xF7, 0x77, 0xFF, 0x30, 0xBC, 0x01, 0xBC, 0x00, 0x47
	.byte 0x50, 0x62, 0x0E, 0x08

	thumb_func_start func_080DC724
func_080DC724: @ 0x080DC724
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, #0x8c
	movs r1, #2
	bl func_080A47B4
	adds r0, r5, #0
	adds r0, #0x48
	movs r1, #2
	bl func_080A47B4
	adds r0, r5, #0
	adds r0, #8
	movs r1, #2
	bl func_080A47B4
	ldr r0, .L080DC760 @ =vtable_unk_080E65E0
	str r0, [r5, #4]
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq .L080DC758
	adds r0, r5, #0
	bl __builtin_delete
.L080DC758:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080DC760: .4byte vtable_unk_080E65E0

	thumb_func_start func_080DC764
func_080DC764: @ 0x080DC764
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	adds r2, r6, #0
	adds r2, #0xcc
	ldr r1, [r2]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #4
	adds r5, r2, r0
	adds r4, r6, #0
	adds r4, #0xd0
	cmp r4, r5
	beq .L080DC790
.L080DC782:
	adds r0, r4, #4
	movs r1, #2
	bl func_080A47B4
	adds r4, #0x48
	cmp r4, r5
	bne .L080DC782
.L080DC790:
	adds r0, r6, #0
	adds r0, #0x8c
	movs r1, #2
	bl func_080A47B4
	adds r0, r6, #0
	adds r0, #0x48
	movs r1, #2
	bl func_080A47B4
	adds r0, r6, #0
	adds r0, #8
	movs r1, #2
	bl func_080A47B4
	ldr r0, .L080DC7C8 @ =vtable_unk_080E65E0
	str r0, [r6, #4]
	movs r0, #1
	ands r0, r7
	cmp r0, #0
	beq .L080DC7C0
	adds r0, r6, #0
	bl __builtin_delete
.L080DC7C0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080DC7C8: .4byte vtable_unk_080E65E0
.L080DC7CC:
	.byte 0x30, 0xB5, 0x04, 0x1C
	.byte 0x0D, 0x1C, 0x0A, 0x48, 0x60, 0x61, 0x21, 0x69, 0x00, 0x29, 0x05, 0xD0, 0x48, 0x68, 0x82, 0x68
	.byte 0x08, 0x1C, 0x03, 0x21, 0xF7, 0xF7, 0x96, 0xF8, 0x01, 0x20, 0x28, 0x40, 0x00, 0x28, 0x02, 0xD0
	.byte 0x20, 0x1C, 0x23, 0xF7, 0x09, 0xFF, 0x30, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x50, 0x62, 0x0E, 0x08
	.byte 0x30, 0xB5, 0x04, 0x1C, 0x0D, 0x1C, 0x0A, 0x48, 0x60, 0x61, 0x21, 0x69, 0x00, 0x29, 0x05, 0xD0
	.byte 0x48, 0x68, 0x82, 0x68, 0x08, 0x1C, 0x03, 0x21, 0xF7, 0xF7, 0x7C, 0xF8, 0x01, 0x20, 0x28, 0x40
	.byte 0x00, 0x28, 0x02, 0xD0, 0x20, 0x1C, 0x23, 0xF7, 0xEF, 0xFE, 0x30, 0xBC, 0x01, 0xBC, 0x00, 0x47
	.byte 0x50, 0x62, 0x0E, 0x08, 0x00, 0xB5, 0xC7, 0xF7, 0xBD, 0xFF, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00

	thumb_func_start func_080DC840
func_080DC840: @ 0x080DC840
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	ldr r0, .L080DC88C @ =vtable_unk_080E82D8
	str r0, [r7, #0x24]
	adds r6, r5, #0
	ldm r6!, {r0}
	adds r4, r7, #0
	stm r4!, {r0}
	adds r0, r4, #0
	bl func_08007874
	ldr r1, [r6, #4]
	adds r0, r4, #0
	bl func_08007CD8
	str r0, [r4, #4]
	ldrh r0, [r5, #0xc]
	movs r1, #0
	strh r0, [r7, #0xc]
	str r1, [r7, #0x10]
	ldr r4, [r5, #0x10]
	adds r1, r5, #0
	adds r1, #0x14
	adds r0, r7, #0
	adds r0, #0x14
	adds r2, r1, r4
	cmp r2, r1
	beq .L080DC880
	subs r2, r2, r1
	bl memmove
.L080DC880:
	str r4, [r7, #0x10]
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L080DC88C: .4byte vtable_unk_080E82D8
.L080DC890:
	.byte 0x30, 0xB5, 0x05, 0x1C, 0x0C, 0x1C, 0x48, 0x30, 0x02, 0x21, 0xC7, 0xF7, 0x8B, 0xFF, 0x28, 0x1C
	.byte 0x08, 0x30, 0x02, 0x21, 0xC7, 0xF7, 0x86, 0xFF, 0x05, 0x48, 0x68, 0x60, 0x01, 0x20, 0x20, 0x40
	.byte 0x00, 0x28, 0x02, 0xD0, 0x28, 0x1C, 0x23, 0xF7, 0xA7, 0xFE, 0x30, 0xBC, 0x01, 0xBC, 0x00, 0x47
	.byte 0xE0, 0x65, 0x0E, 0x08, 0x30, 0xB5, 0x04, 0x1C, 0x0D, 0x1C, 0x0A, 0x48, 0x60, 0x61, 0x21, 0x69
	.byte 0x00, 0x29, 0x05, 0xD0, 0x48, 0x68, 0x82, 0x68, 0x08, 0x1C, 0x03, 0x21, 0xF7, 0xF7, 0x1A, 0xF8
	.byte 0x01, 0x20, 0x28, 0x40, 0x00, 0x28, 0x02, 0xD0, 0x20, 0x1C, 0x23, 0xF7, 0x8D, 0xFE, 0x30, 0xBC
	.byte 0x01, 0xBC, 0x00, 0x47, 0x50, 0x62, 0x0E, 0x08

	.section .text.after_func_080DC8F8, "ax", %progbits
	.byte 0x30, 0xB5, 0x05, 0x1C, 0x0C, 0x1C, 0x8C, 0x30, 0x02, 0x21, 0xC7, 0xF7, 0x3D, 0xFF, 0x28, 0x1C
	.byte 0x48, 0x30, 0x02, 0x21, 0xC7, 0xF7, 0x38, 0xFF, 0x28, 0x1C, 0x08, 0x30, 0x02, 0x21, 0xC7, 0xF7
	.byte 0x33, 0xFF, 0x06, 0x48, 0x68, 0x60, 0x01, 0x20, 0x20, 0x40, 0x00, 0x28, 0x02, 0xD0, 0x28, 0x1C
	.byte 0x23, 0xF7, 0x54, 0xFE, 0x30, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0xE0, 0x65, 0x0E, 0x08

	thumb_func_start func_080DC96C
func_080DC96C: @ 0x080DC96C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	subs r1, r1, r4
	asrs r1, r1, #3
	cmp r1, #0
	ble .L080DC99E
	ldr r5, [r2]
.L080DC97A:
	asrs r3, r1, #1
	lsls r0, r3, #3
	adds r0, r4, r0
	movs r2, #0
	ldrh r6, [r0]
	cmp r5, r6
	bhs .L080DC98A
	movs r2, #1
.L080DC98A:
	cmp r2, #0
	beq .L080DC992
	adds r1, r3, #0
	b .L080DC99A
.L080DC992:
	adds r4, r0, #0
	adds r4, #8
	subs r0, r1, r3
	subs r1, r0, #1
.L080DC99A:
	cmp r1, #0
	bgt .L080DC97A
.L080DC99E:
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L080DC9A8:
	.byte 0x00, 0xB5, 0x58, 0xF7, 0x01, 0xFA, 0x01, 0xBC
	.byte 0x00, 0x47, 0x00, 0x00, 0x00, 0xB5, 0x58, 0xF7, 0xFB, 0xF9, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00

	thumb_func_start func_080DC9C0
func_080DC9C0: @ 0x080DC9C0
	push {lr}
	bl _._10ANpcEntity
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DC9CC
func_080DC9CC: @ 0x080DC9CC
	push {lr}
	bl _._10ANpcEntity
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DC9D8
func_080DC9D8: @ 0x080DC9D8
	push {lr}
	bl _._10ANpcEntity
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DC9E4
func_080DC9E4: @ 0x080DC9E4
	push {lr}
	bl _._10ANpcEntity
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DC9F0
func_080DC9F0: @ 0x080DC9F0
	push {lr}
	bl _._10ANpcEntity
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DC9FC
func_080DC9FC: @ 0x080DC9FC
	push {lr}
	bl _._10ANpcEntity
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DCA08
func_080DCA08: @ 0x080DCA08
	push {lr}
	bl _._10ANpcEntity
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DCA14
func_080DCA14: @ 0x080DCA14
	push {lr}
	bl _._10ANpcEntity
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DCA20
func_080DCA20: @ 0x080DCA20
	push {lr}
	bl _._10ANpcEntity
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DCA2C
func_080DCA2C: @ 0x080DCA2C
	push {lr}
	bl _._10ANpcEntity
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DCA38
func_080DCA38: @ 0x080DCA38
	push {lr}
	bl _._10ANpcEntity
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DCA44
func_080DCA44: @ 0x080DCA44
	push {lr}
	bl _._10ANpcEntity
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DCA50
func_080DCA50: @ 0x080DCA50
	push {lr}
	bl _._10ANpcEntity
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DCA5C
func_080DCA5C: @ 0x080DCA5C
	push {lr}
	bl _._10ANpcEntity
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DCA68
func_080DCA68: @ 0x080DCA68
	push {lr}
	bl _._10ANpcEntity
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DCA74
func_080DCA74: @ 0x080DCA74
	push {lr}
	bl _._10ANpcEntity
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DCA80
func_080DCA80: @ 0x080DCA80
	push {lr}
	bl _._10ANpcEntity
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DCA8C
func_080DCA8C: @ 0x080DCA8C
	push {lr}
	bl _._10ANpcEntity
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DCA98
func_080DCA98: @ 0x080DCA98
	push {lr}
	bl _._10ANpcEntity
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DCAA4
func_080DCAA4: @ 0x080DCAA4
	push {lr}
	bl _._10ANpcEntity
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DCAB0
func_080DCAB0: @ 0x080DCAB0
	push {lr}
	bl _._10ANpcEntity
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DCABC
func_080DCABC: @ 0x080DCABC
	push {lr}
	bl _._10ANpcEntity
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DCAC8
func_080DCAC8: @ 0x080DCAC8
	push {lr}
	bl _._10ANpcEntity
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DCAD4
func_080DCAD4: @ 0x080DCAD4
	push {lr}
	bl _._10ANpcEntity
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DCAE0
func_080DCAE0: @ 0x080DCAE0
	push {lr}
	bl _._10ANpcEntity
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DCAEC
func_080DCAEC: @ 0x080DCAEC
	push {lr}
	bl _._10ANpcEntity
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DCAF8
func_080DCAF8: @ 0x080DCAF8
	push {lr}
	bl _._10ANpcEntity
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DCB04
func_080DCB04: @ 0x080DCB04
	push {lr}
	bl _._10ANpcEntity
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DCB10
func_080DCB10: @ 0x080DCB10
	push {lr}
	bl _._10ANpcEntity
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DCB1C
func_080DCB1C: @ 0x080DCB1C
	push {lr}
	bl _._10ANpcEntity
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DCB28
func_080DCB28: @ 0x080DCB28
	push {lr}
	bl _._10ANpcEntity
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DCB34
func_080DCB34: @ 0x080DCB34
	push {lr}
	bl _._10ANpcEntity
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DCB40
func_080DCB40: @ 0x080DCB40
	push {lr}
	bl _._10ANpcEntity
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DCB4C
func_080DCB4C: @ 0x080DCB4C
	push {lr}
	bl func_08037048
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DCB58
func_080DCB58: @ 0x080DCB58
	push {lr}
	bl func_08037048
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DCB64
func_080DCB64: @ 0x080DCB64
	push {lr}
	bl func_08037048
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DCB70
func_080DCB70: @ 0x080DCB70
	push {lr}
	bl func_08037048
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DCB7C
func_080DCB7C: @ 0x080DCB7C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x6c
	mov r8, r0
	mov sl, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0x5c]
	movs r0, #0
	mov r1, r8
	str r0, [r1]
	add r5, sp, #0xc
	mov r2, sl
	ldr r0, [r2]
	ldr r1, [r0, #0x7c]
	mov r0, sl
	bl _call_via_r1
	adds r1, r0, #0
	ldr r3, [sp, #0x5c]
	cmp r3, #0
	beq .L080DCBB8
	ldr r0, .L080DCBB4 @ =gUnk_080F1684
	ldrh r2, [r0, #2]
	b .L080DCBBC
	.align 2, 0
.L080DCBB4: .4byte gUnk_080F1684
.L080DCBB8:
	ldr r0, .L080DCC90 @ =gUnk_080F1684
	ldrh r2, [r0]
.L080DCBBC:
	movs r0, #6
	str r0, [sp]
	movs r0, #0x1d
	str r0, [sp, #4]
	add r4, sp, #8
	movs r0, #0
	strb r0, [r4]
	adds r0, r5, #0
	mov r3, sl
	bl func_080A4A00
	movs r0, #0xc8
	lsls r0, r0, #0xf
	str r0, [r5, #0x40]
	adds r1, r5, #0
	adds r1, #0x44
	movs r0, #0x96
	lsls r0, r0, #1
	strh r0, [r1]
	ldr r0, .L080DCC94 @ =0x00002666
	str r0, [r5, #0x48]
	ldr r0, .L080DCC90 @ =gUnk_080F1684
	ldrb r1, [r0, #4]
	adds r0, r5, #0
	adds r0, #0x4c
	strb r1, [r0]
	adds r1, r5, #0
	adds r1, #0x4d
	movs r0, #1
	strb r0, [r1]
	mov r0, r8
	ldr r1, [r0]
	str r4, [sp, #0x68]
	cmp r1, #4
	bhi .L080DCC1E
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, #4
	add r0, r8
	cmp r0, #0
	beq .L080DCC16
	add r1, sp, #0xc
	bl func_080DCD2C
.L080DCC16:
	mov r1, r8
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
.L080DCC1E:
	add r0, sp, #0xc
	movs r1, #2
	bl func_080A47B4
	movs r2, #0
	str r2, [sp, #0x60]
	add r7, sp, #0xc
	mov r3, sp
	adds r3, #0x59
	str r3, [sp, #0x64]
.L080DCC32:
	bl rand
	movs r1, #3
	bl __modsi3
	adds r6, r0, #0
	bl rand
	movs r1, #0xf0
	lsls r1, r1, #1
	bl __umodsi3
	adds r5, r0, #0
	ldr r4, .L080DCC98 @ =gUnk_080F1672
	bl rand
	movs r1, #3
	bl __modsi3
	adds r0, r0, r4
	ldrb r4, [r0]
	bl rand
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #2
	ldr r1, .L080DCC9C @ =gUnk_080F1678
	adds r0, r0, r1
	ldr r0, [r0]
	mov sb, r0
	mov r2, sl
	ldr r0, [r2]
	ldr r1, [r0, #0x7c]
	mov r0, sl
	bl _call_via_r1
	adds r1, r0, #0
	ldr r3, [sp, #0x5c]
	cmp r3, #0
	beq .L080DCCA0
	lsls r0, r6, #3
	ldr r2, .L080DCC90 @ =gUnk_080F1684
	adds r0, r0, r2
	ldrh r2, [r0, #2]
	b .L080DCCA8
	.align 2, 0
.L080DCC90: .4byte gUnk_080F1684
.L080DCC94: .4byte 0x00002666
.L080DCC98: .4byte gUnk_080F1672
.L080DCC9C: .4byte gUnk_080F1678
.L080DCCA0:
	lsls r0, r6, #3
	ldr r3, .L080DCD28 @ =gUnk_080F1684
	adds r0, r0, r3
	ldrh r2, [r0]
.L080DCCA8:
	movs r0, #6
	str r0, [sp]
	movs r0, #0x1d
	str r0, [sp, #4]
	movs r0, #0
	ldr r3, [sp, #0x68]
	strb r0, [r3]
	adds r0, r7, #0
	mov r3, sl
	bl func_080A4A00
	lsls r0, r5, #0x10
	str r0, [r7, #0x40]
	adds r0, r7, #0
	adds r0, #0x44
	strh r4, [r0]
	mov r0, sb
	str r0, [r7, #0x48]
	lsls r0, r6, #3
	ldr r1, .L080DCD28 @ =gUnk_080F1684
	adds r0, r0, r1
	ldrb r1, [r0, #4]
	adds r0, r7, #0
	adds r0, #0x4c
	strb r1, [r0]
	movs r0, #1
	ldr r2, [sp, #0x64]
	strb r0, [r2]
	mov r3, r8
	ldr r1, [r3]
	cmp r1, #4
	bhi .L080DCD04
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, #4
	add r0, r8
	cmp r0, #0
	beq .L080DCCFC
	add r1, sp, #0xc
	bl func_080DCD2C
.L080DCCFC:
	mov r1, r8
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
.L080DCD04:
	add r0, sp, #0xc
	movs r1, #2
	bl func_080A47B4
	ldr r2, [sp, #0x60]
	adds r2, #1
	str r2, [sp, #0x60]
	cmp r2, #3
	bls .L080DCC32
	mov r0, r8
	add sp, #0x6c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L080DCD28: .4byte gUnk_080F1684

	thumb_func_start func_080DCD2C
func_080DCD2C: @ 0x080DCD2C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl func_080DC840
	ldr r0, .L080DCDAC @ =vtable_unk_080E681C
	str r0, [r4, #0x24]
	adds r1, r4, #0
	adds r1, #0x28
	adds r0, r5, #0
	adds r0, #0x28
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x3c
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x3d
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	adds r1, #1
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	adds r1, #1
	strb r0, [r1]
	ldr r0, [r5, #0x40]
	str r0, [r4, #0x40]
	adds r0, r5, #0
	adds r0, #0x44
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x44
	strh r1, [r0]
	ldr r0, [r5, #0x48]
	str r0, [r4, #0x48]
	adds r0, r5, #0
	adds r0, #0x4c
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x4c
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	adds r2, r4, #0
	adds r2, #0x4d
	strb r0, [r2]
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L080DCDAC: .4byte vtable_unk_080E681C

	thumb_func_start func_080DCDB0
func_080DCDB0: @ 0x080DCDB0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	mov r8, r1
	ldr r0, [r7, #0x14]
	cmp r0, #0
	beq .L080DCDE8
	adds r6, r0, #0
	ldr r1, [r6]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, #4
	adds r5, r6, r0
	adds r4, r6, #4
	cmp r4, r5
	beq .L080DCDE2
.L080DCDD4:
	adds r0, r4, #0
	movs r1, #2
	bl func_080A47B4
	adds r4, #0x50
	cmp r4, r5
	bne .L080DCDD4
.L080DCDE2:
	adds r0, r6, #0
	bl __builtin_delete
.L080DCDE8:
	ldr r0, [r7, #0x10]
	cmp r0, #0
	beq .L080DCE16
	adds r6, r0, #0
	ldr r0, [r6]
	lsls r0, r0, #6
	adds r0, #4
	adds r5, r6, r0
	adds r4, r6, #4
	cmp r4, r5
	beq .L080DCE10
.L080DCDFE:
	ldr r0, [r4, #0x24]
	ldr r2, [r0, #8]
	adds r0, r4, #0
	movs r1, #2
	bl _call_via_r2
	adds r4, #0x40
	cmp r4, r5
	bne .L080DCDFE
.L080DCE10:
	adds r0, r6, #0
	bl __builtin_delete
.L080DCE16:
	ldr r4, [r7, #0xc]
	cmp r4, #0
	beq .L080DCE2A
	adds r0, r4, #0
	movs r1, #2
	bl func_080A47B4
	adds r0, r4, #0
	bl __builtin_delete
.L080DCE2A:
	ldr r4, [r7, #8]
	cmp r4, #0
	beq .L080DCE3E
	adds r0, r4, #0
	movs r1, #2
	bl func_080A47B4
	adds r0, r4, #0
	bl __builtin_delete
.L080DCE3E:
	ldr r0, .L080DCE5C @ =vtable_unk_080E65E0
	str r0, [r7, #4]
	movs r0, #1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq .L080DCE52
	adds r0, r7, #0
	bl __builtin_delete
.L080DCE52:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080DCE5C: .4byte vtable_unk_080E65E0

	thumb_func_start func_080DCE60
func_080DCE60: @ 0x080DCE60
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L080DCE90 @ =__vt_7AEntity
	str r0, [r4, #0x14]
	ldr r1, [r4, #0x10]
	cmp r1, #0
	beq .L080DCE7C
	ldr r0, [r1, #4]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DCE7C:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq .L080DCE8A
	adds r0, r4, #0
	bl __builtin_delete
.L080DCE8A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080DCE90: .4byte __vt_7AEntity

	thumb_func_start func_080DCE94
func_080DCE94: @ 0x080DCE94
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, #8
	movs r1, #2
	bl func_080A47B4
	ldr r0, .L080DCEBC @ =vtable_unk_080E65E0
	str r0, [r5, #4]
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq .L080DCEB4
	adds r0, r5, #0
	bl __builtin_delete
.L080DCEB4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080DCEBC: .4byte vtable_unk_080E65E0

	thumb_func_start func_080DCEC0
func_080DCEC0: @ 0x080DCEC0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, #8
	movs r1, #2
	bl func_080A47B4
	ldr r0, .L080DCEE8 @ =vtable_unk_080E65E0
	str r0, [r5, #4]
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq .L080DCEE0
	adds r0, r5, #0
	bl __builtin_delete
.L080DCEE0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080DCEE8: .4byte vtable_unk_080E65E0

	thumb_func_start func_080DCEEC
func_080DCEEC: @ 0x080DCEEC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L080DCF1C @ =__vt_7AEntity
	str r0, [r4, #0x14]
	ldr r1, [r4, #0x10]
	cmp r1, #0
	beq .L080DCF08
	ldr r0, [r1, #4]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DCF08:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq .L080DCF16
	adds r0, r4, #0
	bl __builtin_delete
.L080DCF16:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080DCF1C: .4byte __vt_7AEntity

	thumb_func_start func_080DCF20
func_080DCF20: @ 0x080DCF20
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, #8
	movs r1, #2
	bl func_080A47B4
	ldr r0, .L080DCF48 @ =vtable_unk_080E65E0
	str r0, [r5, #4]
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq .L080DCF40
	adds r0, r5, #0
	bl __builtin_delete
.L080DCF40:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080DCF48: .4byte vtable_unk_080E65E0

	thumb_func_start func_080DCF4C
func_080DCF4C: @ 0x080DCF4C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	mov sb, r1
	ldr r0, .L080DCFC4 @ =vtable_unk_080E7568
	mov r1, r8
	str r0, [r1, #0x14]
	ldr r0, [r1, #0x10]
	cmp r0, #0
	beq .L080DCF90
	ldr r1, [r1, #0x18]
	movs r6, #0
	ldr r7, [r0, #8]
	cmp r6, r7
	bhs .L080DCF90
	adds r5, r1, #0
	adds r4, r0, #0
	adds r4, #0xc
.L080DCF74:
	ldr r1, [r4]
	cmp r1, #0
	beq .L080DCF86
	ldr r0, [r1, #0x4c]
	ldr r2, [r0, #0x14]
	adds r0, r1, #0
	adds r1, r5, #0
	bl _call_via_r2
.L080DCF86:
	adds r5, #0x10
	adds r4, #4
	adds r6, #1
	cmp r6, r7
	blo .L080DCF74
.L080DCF90:
	ldr r0, .L080DCFC8 @ =__vt_7AEntity
	mov r2, r8
	str r0, [r2, #0x14]
	ldr r1, [r2, #0x10]
	cmp r1, #0
	beq .L080DCFA8
	ldr r0, [r1, #4]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DCFA8:
	movs r0, #1
	mov r1, sb
	ands r0, r1
	cmp r0, #0
	beq .L080DCFB8
	mov r0, r8
	bl __builtin_delete
.L080DCFB8:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080DCFC4: .4byte vtable_unk_080E7568
.L080DCFC8: .4byte __vt_7AEntity

	thumb_func_start func_080DCFCC
func_080DCFCC: @ 0x080DCFCC
	push {r4, lr}
	adds r4, r0, #0
	bl vfunc_14__7AEntity
	movs r0, #0
	strb r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DCFE0
func_080DCFE0: @ 0x080DCFE0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	movs r7, #0
	ldrb r0, [r4, #0x1c]
	cmp r0, #0
	bne .L080DCFF6
	b .L080DD318
.L080DCFF6:
	movs r0, #0x18
	bl __builtin_new
	adds r6, r0, #0
	ldr r0, [r4, #0x18]
	mov sl, r0
	str r4, [r6]
	ldr r0, .L080DD034 @ =vtable_unk_080E76D4
	str r0, [r6, #4]
	str r7, [r6, #8]
	ldr r4, [r4]
	mov r8, r4
	movs r1, #0
	mov sb, r1
.L080DD012:
	mov r2, sb
	lsls r0, r2, #4
	mov r1, sl
	adds r7, r1, r0
	ldrb r0, [r7]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	subs r0, #1
	cmp r0, #0xb
	bls .L080DD028
	b .L080DD2FA
.L080DD028:
	lsls r0, r0, #2
	ldr r1, .L080DD038 @ =.L080DD03C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L080DD034: .4byte vtable_unk_080E76D4
.L080DD038: .4byte .L080DD03C
.L080DD03C: @ jump table
	.4byte .L080DD06C @ case 0
	.4byte .L080DD094 @ case 1
	.4byte .L080DD0B4 @ case 2
	.4byte .L080DD0DC @ case 3
	.4byte .L080DD104 @ case 4
	.4byte .L080DD160 @ case 5
	.4byte .L080DD1D4 @ case 6
	.4byte .L080DD1FC @ case 7
	.4byte .L080DD224 @ case 8
	.4byte .L080DD24C @ case 9
	.4byte .L080DD274 @ case 10
	.4byte .L080DD294 @ case 11
.L080DD06C:
	movs r0, #0x64
	bl __builtin_new
	adds r5, r0, #0
	adds r4, r7, #4
	ldr r2, [r7, #4]
	ldr r0, .L080DD08C @ =0x000009B6
	adds r2, r2, r0
	adds r0, r5, #0
	mov r1, r8
	movs r3, #1
	bl func_08039E98
	ldr r0, .L080DD090 @ =vtable_unk_080E76A4
	b .L080DD2AA
	.align 2, 0
.L080DD08C: .4byte 0x000009B6
.L080DD090: .4byte vtable_unk_080E76A4
.L080DD094:
	movs r0, #0x64
	bl __builtin_new
	adds r5, r0, #0
	adds r4, r7, #4
	ldr r2, [r7, #4]
	adds r2, #0x10
	mov r1, r8
	movs r3, #1
	bl func_08039E98
	ldr r0, .L080DD0B0 @ =vtable_unk_080E768C
	b .L080DD2AA
	.align 2, 0
.L080DD0B0: .4byte vtable_unk_080E768C
.L080DD0B4:
	movs r0, #0x64
	bl __builtin_new
	adds r5, r0, #0
	adds r4, r7, #4
	ldr r2, [r7, #4]
	ldr r0, .L080DD0D4 @ =0x000003DB
	adds r2, r2, r0
	adds r0, r5, #0
	mov r1, r8
	movs r3, #1
	bl func_08039E98
	ldr r0, .L080DD0D8 @ =vtable_unk_080E7674
	b .L080DD2AA
	.align 2, 0
.L080DD0D4: .4byte 0x000003DB
.L080DD0D8: .4byte vtable_unk_080E7674
.L080DD0DC:
	movs r0, #0x64
	bl __builtin_new
	adds r5, r0, #0
	adds r4, r7, #4
	ldr r2, [r7, #4]
	ldr r0, .L080DD0FC @ =0x00000806
	adds r2, r2, r0
	adds r0, r5, #0
	mov r1, r8
	movs r3, #1
	bl func_08039E98
	ldr r0, .L080DD100 @ =vtable_unk_080E765C
	b .L080DD2AA
	.align 2, 0
.L080DD0FC: .4byte 0x00000806
.L080DD100: .4byte vtable_unk_080E765C
.L080DD104:
	movs r0, #0x6c
	bl __builtin_new
	adds r5, r0, #0
	adds r4, r7, #4
	ldr r2, [r7, #4]
	ldr r0, .L080DD158 @ =0x00000202
	adds r2, r2, r0
	adds r0, r5, #0
	mov r1, r8
	movs r3, #1
	bl func_08039E98
	ldr r0, .L080DD15C @ =vtable_unk_080E7644
	str r0, [r5, #0x4c]
	ldr r0, [r7, #4]
	str r0, [r5, #0x50]
	ldrh r0, [r4, #4]
	adds r1, r5, #0
	adds r1, #0x54
	movs r2, #0
	movs r3, #0
	strh r0, [r1]
	ldrh r0, [r4, #6]
	adds r4, r5, #0
	adds r4, #0x56
	strh r0, [r4]
	adds r0, r5, #0
	adds r0, #0x60
	strh r3, [r0]
	adds r0, #2
	strb r2, [r0]
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #0x10
	str r0, [r5, #0x58]
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #0x10
	str r0, [r5, #0x5c]
	str r3, [r5, #0x68]
	b .L080DD2DE
	.align 2, 0
.L080DD158: .4byte 0x00000202
.L080DD15C: .4byte vtable_unk_080E7644
.L080DD160:
	movs r0, #0x88
	bl __builtin_new
	adds r5, r0, #0
	adds r4, r7, #4
	ldr r2, [r7, #4]
	ldr r0, .L080DD1CC @ =0x000002A3
	adds r2, r2, r0
	adds r0, r5, #0
	mov r1, r8
	movs r3, #1
	bl func_08039E98
	ldr r0, .L080DD1D0 @ =vtable_unk_080E762C
	str r0, [r5, #0x4c]
	ldr r0, [r7, #4]
	str r0, [r5, #0x50]
	adds r1, r5, #0
	adds r1, #0x79
	movs r0, #0xff
	strb r0, [r1]
	subs r1, #0x29
	ldrb r2, [r4, #8]
	lsls r2, r2, #0x1c
	asrs r2, r2, #0x1c
	adds r0, r5, #0
	bl func_0803A144
	adds r1, r5, #0
	adds r1, #0x78
	movs r2, #0
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x60
	movs r1, #0
	strh r2, [r0]
	adds r0, #2
	strb r1, [r0]
	subs r0, #0xe
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #0x10
	str r0, [r5, #0x58]
	adds r0, r5, #0
	adds r0, #0x56
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #0x10
	str r0, [r5, #0x5c]
	adds r1, r5, #0
	adds r1, #0x84
	movs r0, #0xf8
	strb r0, [r1]
	b .L080DD2DE
	.align 2, 0
.L080DD1CC: .4byte 0x000002A3
.L080DD1D0: .4byte vtable_unk_080E762C
.L080DD1D4:
	movs r0, #0x64
	bl __builtin_new
	adds r5, r0, #0
	adds r4, r7, #4
	ldr r2, [r7, #4]
	ldr r0, .L080DD1F4 @ =0x0000087B
	adds r2, r2, r0
	adds r0, r5, #0
	mov r1, r8
	movs r3, #1
	bl func_08039E98
	ldr r0, .L080DD1F8 @ =vtable_unk_080E7614
	b .L080DD2AA
	.align 2, 0
.L080DD1F4: .4byte 0x0000087B
.L080DD1F8: .4byte vtable_unk_080E7614
.L080DD1FC:
	movs r0, #0x64
	bl __builtin_new
	adds r5, r0, #0
	adds r4, r7, #4
	ldr r2, [r7, #4]
	ldr r0, .L080DD21C @ =0x0000065C
	adds r2, r2, r0
	adds r0, r5, #0
	mov r1, r8
	movs r3, #1
	bl func_08039E98
	ldr r0, .L080DD220 @ =vtable_unk_080E75FC
	b .L080DD2AA
	.align 2, 0
.L080DD21C: .4byte 0x0000065C
.L080DD220: .4byte vtable_unk_080E75FC
.L080DD224:
	movs r0, #0x64
	bl __builtin_new
	adds r5, r0, #0
	adds r4, r7, #4
	ldr r2, [r7, #4]
	ldr r0, .L080DD244 @ =0x000008F9
	adds r2, r2, r0
	adds r0, r5, #0
	mov r1, r8
	movs r3, #1
	bl func_08039E98
	ldr r0, .L080DD248 @ =vtable_unk_080E75E4
	b .L080DD2AA
	.align 2, 0
.L080DD244: .4byte 0x000008F9
.L080DD248: .4byte vtable_unk_080E75E4
.L080DD24C:
	movs r0, #0x64
	bl __builtin_new
	adds r5, r0, #0
	adds r4, r7, #4
	ldr r2, [r7, #4]
	ldr r0, .L080DD26C @ =0x000009A9
	adds r2, r2, r0
	adds r0, r5, #0
	mov r1, r8
	movs r3, #1
	bl func_08039E98
	ldr r0, .L080DD270 @ =vtable_unk_080E75CC
	b .L080DD2AA
	.align 2, 0
.L080DD26C: .4byte 0x000009A9
.L080DD270: .4byte vtable_unk_080E75CC
.L080DD274:
	movs r0, #0x64
	bl __builtin_new
	adds r5, r0, #0
	adds r4, r7, #4
	mov r1, r8
	ldr r2, .L080DD28C @ =0x000008FD
	movs r3, #1
	bl func_08039E98
	ldr r0, .L080DD290 @ =vtable_unk_080E75B4
	b .L080DD2AA
	.align 2, 0
.L080DD28C: .4byte 0x000008FD
.L080DD290: .4byte vtable_unk_080E75B4
.L080DD294:
	movs r0, #0x64
	bl __builtin_new
	adds r5, r0, #0
	adds r4, r7, #4
	mov r1, r8
	movs r2, #0x15
	movs r3, #0
	bl func_08039E98
	ldr r0, .L080DD314 @ =vtable_unk_080E759C
.L080DD2AA:
	str r0, [r5, #0x4c]
	ldr r0, [r7, #4]
	str r0, [r5, #0x50]
	ldrh r0, [r4, #4]
	adds r2, r5, #0
	adds r2, #0x54
	movs r3, #0
	movs r1, #0
	strh r0, [r2]
	ldrh r0, [r4, #6]
	adds r4, r5, #0
	adds r4, #0x56
	strh r0, [r4]
	adds r0, r5, #0
	adds r0, #0x60
	strh r1, [r0]
	adds r0, #2
	strb r3, [r0]
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #0x10
	str r0, [r5, #0x58]
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #0x10
	str r0, [r5, #0x5c]
.L080DD2DE:
	adds r1, r6, #0
	adds r1, #8
	ldr r0, [r6, #8]
	cmp r0, #2
	bhi .L080DD2FA
	lsls r0, r0, #2
	adds r0, #4
	adds r0, r1, r0
	cmp r0, #0
	beq .L080DD2F4
	str r5, [r0]
.L080DD2F4:
	ldr r0, [r6, #8]
	adds r0, #1
	str r0, [r6, #8]
.L080DD2FA:
	ldrb r1, [r7]
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r7]
	movs r0, #1
	add sb, r0
	mov r1, sb
	cmp r1, #2
	bhi .L080DD310
	b .L080DD012
.L080DD310:
	adds r7, r6, #0
	b .L080DD36E
	.align 2, 0
.L080DD314: .4byte vtable_unk_080E759C
.L080DD318:
	movs r0, #0x18
	bl __builtin_new
	adds r5, r0, #0
	str r4, [r5]
	ldr r0, .L080DD380 @ =vtable_unk_080E76D4
	str r0, [r5, #4]
	str r7, [r5, #8]
	ldr r4, [r4]
	ldr r0, [r4]
	movs r2, #0xa2
	lsls r2, r2, #1
	adds r0, r0, r2
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1b
	movs r6, #0
	subs r0, #6
	cmp r0, #0xb
	bls .L080DD34A
	movs r6, #1
.L080DD34A:
	ldr r0, [r4]
	movs r1, #0xa2
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	adds r0, #8
	bl func_0800E324
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	adds r3, r6, #0
	bl func_0803A394
	adds r7, r5, #0
.L080DD36E:
	adds r0, r7, #0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L080DD380: .4byte vtable_unk_080E76D4
.L080DD384:
	.byte 0x0B, 0x78, 0x10, 0x22, 0x52, 0x42, 0x1A, 0x40, 0x0C, 0x23, 0x1A, 0x43
	.byte 0x0A, 0x70, 0x02, 0x6D, 0x4A, 0x60, 0x02, 0x1C, 0x54, 0x32, 0x12, 0x88, 0x0A, 0x81, 0x56, 0x30
	.byte 0x00, 0x88, 0x48, 0x81, 0x70, 0x47, 0x00, 0x00

	thumb_func_start func_080DD3A8
func_080DD3A8: @ 0x080DD3A8
	push {r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r4, #0x54
	movs r5, #0
	ldrsh r4, [r4, r5]
	str r4, [sp]
	adds r4, r0, #0
	adds r4, #0x56
	movs r5, #0
	ldrsh r4, [r4, r5]
	str r4, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	movs r4, #2
	str r4, [sp, #0xc]
	bl func_08039F90
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_080DD3D4
func_080DD3D4: @ 0x080DD3D4
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x47
	ldrb r0, [r1]
	cmp r0, #0
	bne .L080DD3F8
	adds r0, r4, #0
	adds r0, #0x30
	bl func_0805E8F0
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge .L080DD3FC
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #1
	b .L080DD3FA
.L080DD3F8:
	movs r0, #0
.L080DD3FA:
	strb r0, [r1]
.L080DD3FC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DD404
func_080DD404: @ 0x080DD404
	push {lr}
	bl func_08039F50
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DD410
func_080DD410: @ 0x080DD410
	ldrb r3, [r1]
	movs r2, #0x10
	rsbs r2, r2, #0
	ands r2, r3
	movs r3, #0xb
	orrs r2, r3
	strb r2, [r1]
	ldr r2, [r0, #0x50]
	str r2, [r1, #4]
	adds r2, r0, #0
	adds r2, #0x54
	ldrh r2, [r2]
	strh r2, [r1, #8]
	adds r0, #0x56
	ldrh r0, [r0]
	strh r0, [r1, #0xa]
	bx lr
	.align 2, 0

	thumb_func_start func_080DD434
func_080DD434: @ 0x080DD434
	push {r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r4, #0x54
	movs r5, #0
	ldrsh r4, [r4, r5]
	str r4, [sp]
	adds r4, r0, #0
	adds r4, #0x56
	movs r5, #0
	ldrsh r4, [r4, r5]
	str r4, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	movs r4, #2
	str r4, [sp, #0xc]
	bl func_08039F90
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_080DD460
func_080DD460: @ 0x080DD460
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x62
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq .L080DD476
	cmp r0, #1
	beq .L080DD4A4
	b .L080DD4B8
.L080DD476:
	bl rand
	asrs r0, r0, #4
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	beq .L080DD48C
	adds r0, r4, #0
	movs r1, #0xcf
	bl func_0803A350
.L080DD48C:
	movs r0, #2
	bl func_080AB788
	adds r0, #6
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r0, r4, #0
	adds r0, #0x60
	strh r1, [r0]
	movs r0, #1
	b .L080DD4B6
.L080DD4A4:
	adds r1, r4, #0
	adds r1, #0x60
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge .L080DD4B8
	movs r0, #0
.L080DD4B6:
	strb r0, [r5]
.L080DD4B8:
	adds r1, r4, #0
	adds r1, #0x47
	ldrb r0, [r1]
	cmp r0, #0
	bne .L080DD4D8
	adds r0, r4, #0
	adds r0, #0x30
	bl func_0805E8F0
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge .L080DD4DC
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #1
	b .L080DD4DA
.L080DD4D8:
	movs r0, #0
.L080DD4DA:
	strb r0, [r1]
.L080DD4DC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DD4E4
func_080DD4E4: @ 0x080DD4E4
	push {lr}
	bl func_08039F50
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DD4F0
func_080DD4F0: @ 0x080DD4F0
	ldrb r3, [r1]
	movs r2, #0x10
	rsbs r2, r2, #0
	ands r2, r3
	movs r3, #0xa
	orrs r2, r3
	strb r2, [r1]
	ldr r2, [r0, #0x50]
	str r2, [r1, #4]
	adds r2, r0, #0
	adds r2, #0x54
	ldrh r2, [r2]
	strh r2, [r1, #8]
	adds r0, #0x56
	ldrh r0, [r0]
	strh r0, [r1, #0xa]
	bx lr
	.align 2, 0

	thumb_func_start func_080DD514
func_080DD514: @ 0x080DD514
	push {r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r4, #0x54
	movs r5, #0
	ldrsh r4, [r4, r5]
	str r4, [sp]
	adds r4, r0, #0
	adds r4, #0x56
	movs r5, #0
	ldrsh r4, [r4, r5]
	str r4, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	movs r4, #2
	str r4, [sp, #0xc]
	bl func_08039F90
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_080DD540
func_080DD540: @ 0x080DD540
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x50
	movs r2, #0x80
	lsls r2, r2, #9
	bl func_0803A180
	cmp r0, #0
	beq .L080DD57E
	ldr r0, [r4, #0x50]
	ldr r1, .L080DD584 @ =0x000009A9
	adds r5, r0, r1
	ldrh r0, [r4, #4]
	cmp r0, r5
	beq .L080DD57E
	adds r0, r4, #0
	adds r0, #0x30
	adds r1, r5, #0
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
	strh r5, [r4, #4]
.L080DD57E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080DD584: .4byte 0x000009A9

	thumb_func_start func_080DD588
func_080DD588: @ 0x080DD588
	push {lr}
	bl func_08039F50
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DD594
func_080DD594: @ 0x080DD594
	ldrb r3, [r1]
	movs r2, #0x10
	rsbs r2, r2, #0
	ands r2, r3
	movs r3, #9
	orrs r2, r3
	strb r2, [r1]
	ldr r2, [r0, #0x50]
	str r2, [r1, #4]
	adds r2, r0, #0
	adds r2, #0x54
	ldrh r2, [r2]
	strh r2, [r1, #8]
	adds r0, #0x56
	ldrh r0, [r0]
	strh r0, [r1, #0xa]
	bx lr
	.align 2, 0

	thumb_func_start func_080DD5B8
func_080DD5B8: @ 0x080DD5B8
	push {r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r4, #0x54
	movs r5, #0
	ldrsh r4, [r4, r5]
	str r4, [sp]
	adds r4, r0, #0
	adds r4, #0x56
	movs r5, #0
	ldrsh r4, [r4, r5]
	str r4, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	movs r4, #2
	str r4, [sp, #0xc]
	bl func_08039F90
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_080DD5E4
func_080DD5E4: @ 0x080DD5E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x50
	adds r5, r0, #0
	ldr r4, [r5]
	ldr r0, [r4]
	ldr r2, [r0, #0x40]
	adds r0, r4, #0
	movs r1, #0
	bl _call_via_r2
	cmp r0, #0
	beq .L080DD6FE
	movs r2, #0xa
	ldrsh r1, [r0, r2]
	mov sb, r1
	movs r7, #0xe
	ldrsh r3, [r0, r7]
	mov r8, r3
	movs r0, #0x54
	adds r0, r0, r5
	mov sl, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	mov r2, sb
	subs r0, r2, r0
	cmp r0, #0
	bge .L080DD624
	rsbs r0, r0, #0
.L080DD624:
	cmp r0, #0xf
	bgt .L080DD6FE
	adds r6, r5, #0
	adds r6, #0x56
	movs r3, #0
	ldrsh r0, [r6, r3]
	mov r7, r8
	subs r0, r7, r0
	cmp r0, #0
	bge .L080DD63A
	rsbs r0, r0, #0
.L080DD63A:
	cmp r0, #0xf
	bgt .L080DD6FE
	ldr r1, [r4]
	add r0, sp, #8
	ldr r3, [r1, #0x34]
	adds r1, r4, #0
	movs r2, #0
	bl _call_via_r3
	mov r0, sl
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r4, #0
	ldrsh r3, [r6, r4]
	add r2, sp, #0x48
	adds r0, r1, #0
	subs r0, #8
	movs r7, #0
	mov ip, r7
	strh r0, [r2]
	adds r0, r3, #0
	subs r0, #8
	strh r0, [r2, #2]
	adds r1, #8
	strh r1, [r2, #4]
	adds r3, #8
	strh r3, [r2, #6]
	add r2, sp, #0x14
	movs r1, #0x21
	str r1, [sp, #0x14]
	movs r0, #0x21
	rsbs r0, r0, #0
	str r0, [r2, #4]
	str r0, [r2, #8]
	str r1, [r2, #0xc]
	add r1, sp, #0x28
	add r0, sp, #8
	ldm r0!, {r3, r4, r7}
	stm r1!, {r3, r4, r7}
	ldr r0, [sp, #0x48]
	ldr r1, [sp, #0x4c]
	str r0, [sp, #0x34]
	str r1, [sp, #0x38]
	movs r0, #0x20
	str r0, [r2, #0x28]
	mov r1, ip
	str r1, [r2, #0x2c]
	str r1, [r2, #0x30]
	ldr r4, [r5, #0x50]
	mov r3, sl
	movs r7, #0
	ldrsh r0, [r3, r7]
	movs r3, #0
	ldrsh r1, [r6, r3]
	str r2, [sp]
	str r4, [sp, #4]
	mov r2, sb
	mov r3, r8
	bl func_080ABE58
	adds r1, r0, #0
	str r1, [r5, #0x50]
	adds r6, r5, #0
	adds r6, #0x62
	cmp r4, r1
	bne .L080DD6C6
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #0
	bne .L080DD6F2
.L080DD6C6:
	ldr r7, .L080DD740 @ =0x000008F9
	adds r4, r1, r7
	ldrh r0, [r5, #4]
	cmp r0, r4
	beq .L080DD6F2
	adds r0, r5, #0
	adds r0, #0x30
	adds r1, r4, #0
	bl func_0805E860
	adds r0, r5, #0
	adds r0, #0x44
	movs r1, #1
	strb r1, [r0]
	adds r2, r5, #0
	adds r2, #0x46
	movs r0, #0
	strb r0, [r2]
	adds r0, r5, #0
	adds r0, #0x47
	strb r1, [r0]
	strh r4, [r5, #4]
.L080DD6F2:
	movs r0, #1
	strb r0, [r6]
	adds r1, r5, #0
	adds r1, #0x60
	movs r0, #0x3c
	strh r0, [r1]
.L080DD6FE:
	adds r1, r5, #0
	adds r1, #0x50
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r5, #0
	bl func_0803A180
	cmp r0, #0
	beq .L080DD772
	adds r0, r5, #0
	adds r0, #0x62
	movs r6, #0
	ldrsb r6, [r0, r6]
	cmp r6, #0
	bne .L080DD748
	ldr r0, [r5, #0x50]
	ldr r1, .L080DD744 @ =0x000008F5
	adds r4, r0, r1
	ldrh r0, [r5, #4]
	cmp r0, r4
	beq .L080DD772
	adds r0, r5, #0
	adds r0, #0x30
	adds r1, r4, #0
	bl func_0805E860
	adds r0, r5, #0
	adds r0, #0x44
	movs r1, #1
	strb r1, [r0]
	adds r0, #2
	strb r6, [r0]
	b .L080DD76C
	.align 2, 0
.L080DD740: .4byte 0x000008F9
.L080DD744: .4byte 0x000008F5
.L080DD748:
	ldr r0, [r5, #0x50]
	ldr r2, .L080DD784 @ =0x000008F9
	adds r4, r0, r2
	ldrh r0, [r5, #4]
	cmp r0, r4
	beq .L080DD772
	adds r0, r5, #0
	adds r0, #0x30
	adds r1, r4, #0
	bl func_0805E860
	adds r0, r5, #0
	adds r0, #0x44
	movs r2, #0
	movs r1, #1
	strb r1, [r0]
	adds r0, #2
	strb r2, [r0]
.L080DD76C:
	adds r0, #1
	strb r1, [r0]
	strh r4, [r5, #4]
.L080DD772:
	add sp, #0x50
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080DD784: .4byte 0x000008F9

	thumb_func_start func_080DD788
func_080DD788: @ 0x080DD788
	push {lr}
	bl func_08039F50
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DD794
func_080DD794: @ 0x080DD794
	ldrb r3, [r1]
	movs r2, #0x10
	rsbs r2, r2, #0
	ands r2, r3
	movs r3, #8
	orrs r2, r3
	strb r2, [r1]
	ldr r2, [r0, #0x50]
	str r2, [r1, #4]
	adds r2, r0, #0
	adds r2, #0x54
	ldrh r2, [r2]
	strh r2, [r1, #8]
	adds r0, #0x56
	ldrh r0, [r0]
	strh r0, [r1, #0xa]
	bx lr
	.align 2, 0

	thumb_func_start func_080DD7B8
func_080DD7B8: @ 0x080DD7B8
	push {r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r4, #0x54
	movs r5, #0
	ldrsh r4, [r4, r5]
	str r4, [sp]
	adds r4, r0, #0
	adds r4, #0x56
	movs r5, #0
	ldrsh r4, [r4, r5]
	str r4, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	movs r4, #2
	str r4, [sp, #0xc]
	bl func_08039F90
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_080DD7E4
func_080DD7E4: @ 0x080DD7E4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x50
	movs r2, #0x80
	lsls r2, r2, #8
	bl func_0803A180
	cmp r0, #0
	beq .L080DD854
	adds r0, r4, #0
	adds r0, #0x62
	movs r6, #0
	ldrsb r6, [r0, r6]
	cmp r6, #0
	bne .L080DD82A
	ldr r0, [r4, #0x50]
	movs r1, #0xcb
	lsls r1, r1, #3
	adds r5, r0, r1
	ldrh r0, [r4, #4]
	cmp r0, r5
	beq .L080DD854
	adds r0, r4, #0
	adds r0, #0x30
	adds r1, r5, #0
	bl func_0805E860
	adds r0, r4, #0
	adds r0, #0x44
	movs r1, #1
	strb r1, [r0]
	adds r0, #2
	strb r6, [r0]
	b .L080DD84E
.L080DD82A:
	ldr r0, [r4, #0x50]
	ldr r1, .L080DD85C @ =0x0000065C
	adds r5, r0, r1
	ldrh r0, [r4, #4]
	cmp r0, r5
	beq .L080DD854
	adds r0, r4, #0
	adds r0, #0x30
	adds r1, r5, #0
	bl func_0805E860
	adds r0, r4, #0
	adds r0, #0x44
	movs r2, #0
	movs r1, #1
	strb r1, [r0]
	adds r0, #2
	strb r2, [r0]
.L080DD84E:
	adds r0, #1
	strb r1, [r0]
	strh r5, [r4, #4]
.L080DD854:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080DD85C: .4byte 0x0000065C

	thumb_func_start func_080DD860
func_080DD860: @ 0x080DD860
	push {lr}
	bl func_08039F50
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DD86C
func_080DD86C: @ 0x080DD86C
	ldrb r3, [r1]
	movs r2, #0x10
	rsbs r2, r2, #0
	ands r2, r3
	movs r3, #7
	orrs r2, r3
	strb r2, [r1]
	ldr r2, [r0, #0x50]
	str r2, [r1, #4]
	adds r2, r0, #0
	adds r2, #0x54
	ldrh r2, [r2]
	strh r2, [r1, #8]
	adds r0, #0x56
	ldrh r0, [r0]
	strh r0, [r1, #0xa]
	bx lr
	.align 2, 0

	thumb_func_start func_080DD890
func_080DD890: @ 0x080DD890
	push {r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r4, #0x54
	movs r5, #0
	ldrsh r4, [r4, r5]
	str r4, [sp]
	adds r4, r0, #0
	adds r4, #0x56
	movs r5, #0
	ldrsh r4, [r4, r5]
	str r4, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	movs r4, #2
	str r4, [sp, #0xc]
	bl func_08039F90
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_080DD8BC
func_080DD8BC: @ 0x080DD8BC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x50
	movs r2, #0x80
	lsls r2, r2, #8
	bl func_0803A180
	cmp r0, #0
	beq .L080DD92E
	adds r0, r4, #0
	adds r0, #0x62
	movs r6, #0
	ldrsb r6, [r0, r6]
	cmp r6, #0
	bne .L080DD904
	ldr r0, [r4, #0x50]
	ldr r1, .L080DD900 @ =0x00000877
	adds r5, r0, r1
	ldrh r0, [r4, #4]
	cmp r0, r5
	beq .L080DD92E
	adds r0, r4, #0
	adds r0, #0x30
	adds r1, r5, #0
	bl func_0805E860
	adds r0, r4, #0
	adds r0, #0x44
	movs r1, #1
	strb r1, [r0]
	adds r0, #2
	strb r6, [r0]
	b .L080DD928
	.align 2, 0
.L080DD900: .4byte 0x00000877
.L080DD904:
	ldr r0, [r4, #0x50]
	ldr r1, .L080DD934 @ =0x0000087B
	adds r5, r0, r1
	ldrh r0, [r4, #4]
	cmp r0, r5
	beq .L080DD92E
	adds r0, r4, #0
	adds r0, #0x30
	adds r1, r5, #0
	bl func_0805E860
	adds r0, r4, #0
	adds r0, #0x44
	movs r2, #0
	movs r1, #1
	strb r1, [r0]
	adds r0, #2
	strb r2, [r0]
.L080DD928:
	adds r0, #1
	strb r1, [r0]
	strh r5, [r4, #4]
.L080DD92E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080DD934: .4byte 0x0000087B

	thumb_func_start func_080DD938
func_080DD938: @ 0x080DD938
	push {lr}
	bl func_08039F50
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DD944
func_080DD944: @ 0x080DD944
	push {r4, lr}
	mov ip, r0
	ldrb r2, [r1]
	movs r3, #0x10
	rsbs r3, r3, #0
	adds r0, r3, #0
	ands r0, r2
	movs r2, #6
	orrs r0, r2
	strb r0, [r1]
	mov r2, ip
	ldr r0, [r2, #0x50]
	str r0, [r1, #4]
	mov r0, ip
	adds r0, #0x54
	ldrh r0, [r0]
	strh r0, [r1, #8]
	mov r0, ip
	adds r0, #0x56
	ldrh r0, [r0]
	strh r0, [r1, #0xa]
	mov r0, ip
	adds r0, #0x78
	ldrb r2, [r0]
	movs r4, #0xf
	adds r0, r4, #0
	ands r0, r2
	ldrb r2, [r1, #0xc]
	ands r3, r2
	orrs r3, r0
	mov r0, ip
	adds r0, #0x79
	ldrb r0, [r0]
	lsls r0, r0, #4
	ands r3, r4
	orrs r3, r0
	strb r3, [r1, #0xc]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_080DD994
func_080DD994: @ 0x080DD994
	push {r4, lr}
	sub sp, #0x10
	mov ip, r0
	adds r0, #0x54
	movs r4, #0
	ldrsh r0, [r0, r4]
	str r0, [sp]
	mov r0, ip
	adds r0, #0x56
	movs r4, #0
	ldrsh r0, [r0, r4]
	str r0, [sp, #4]
	mov r0, ip
	adds r0, #0x84
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	mov r0, ip
	bl func_08039F90
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DD9CC
func_080DD9CC: @ 0x080DD9CC
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x62
	movs r4, #0
	ldrsb r4, [r6, r4]
	cmp r4, #1
	beq .L080DDA14
	cmp r4, #1
	bgt .L080DD9E8
	cmp r4, #0
	beq .L080DD9F8
	subs r6, #0x1b
	b .L080DDBD6
.L080DD9E8:
	cmp r4, #2
	beq .L080DDA6C
	adds r6, r5, #0
	adds r6, #0x47
	cmp r4, #3
	bne .L080DD9F6
	b .L080DDB66
.L080DD9F6:
	b .L080DDBD6
.L080DD9F8:
	movs r0, #2
	bl func_080AB788
	adds r0, #0x1e
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r0, r5, #0
	adds r0, #0x60
	strh r1, [r0]
	adds r0, #0x26
	strh r4, [r0]
	movs r0, #1
	b .L080DDA28
.L080DDA14:
	adds r1, r5, #0
	adds r1, #0x60
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge .L080DDA30
	movs r0, #2
.L080DDA28:
	strb r0, [r6]
	adds r6, r5, #0
	adds r6, #0x47
	b .L080DDBD6
.L080DDA30:
	movs r2, #0xb4
	lsls r2, r2, #1
	adds r6, r5, #0
	adds r6, #0x47
	cmp r0, r2
	bgt .L080DDA3E
	b .L080DDBD6
.L080DDA3E:
	adds r1, r5, #0
	adds r1, #0x86
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble .L080DDA50
	b .L080DDBD6
.L080DDA50:
	strh r2, [r1]
	bl rand
	asrs r0, r0, #4
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne .L080DDA62
	b .L080DDBD6
.L080DDA62:
	adds r0, r5, #0
	movs r1, #0xce
	bl func_0803A350
	b .L080DDBD6
.L080DDA6C:
	adds r2, r5, #0
	adds r2, #0x79
	movs r1, #0
	ldrsb r1, [r2, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne .L080DDA8A
	adds r0, r5, #0
	adds r0, #0x78
	ldrb r0, [r0]
	adds r0, #1
	movs r1, #3
	ands r0, r1
	strb r0, [r2]
.L080DDA8A:
	adds r1, r5, #0
	adds r1, #0x64
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r0, r5, #0
	bl func_0803A144
	adds r0, r5, #0
	adds r0, #0x68
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r1, r1, #0x10
	str r1, [r5, #0x6c]
	adds r0, #2
	movs r3, #0
	ldrsh r2, [r0, r3]
	lsls r2, r2, #0x10
	str r2, [r5, #0x70]
	ldr r0, [r5, #0x58]
	subs r1, r1, r0
	str r1, [r5, #0x7c]
	adds r1, r5, #0
	adds r1, #0x80
	ldr r0, [r5, #0x5c]
	subs r2, r2, r0
	str r2, [r1]
	ldr r0, [r5, #0x7c]
	adds r1, r0, #0
	cmp r0, #0
	bge .L080DDACA
	rsbs r1, r0, #0
.L080DDACA:
	asrs r7, r1, #0x11
	adds r1, r2, #0
	cmp r2, #0
	bge .L080DDAD4
	rsbs r1, r2, #0
.L080DDAD4:
	asrs r6, r1, #0x11
	cmp r7, r6
	ble .L080DDB06
	cmp r0, #0
	bge .L080DDAE2
	str r4, [r5, #0x50]
	b .L080DDAE6
.L080DDAE2:
	movs r0, #3
	str r0, [r5, #0x50]
.L080DDAE6:
	ldr r0, [r5, #0x7c]
	adds r1, r7, #0
	bl __divsi3
	str r0, [r5, #0x7c]
	adds r4, r5, #0
	adds r4, #0x80
	ldr r0, [r4]
	adds r1, r7, #0
	bl __divsi3
	str r0, [r4]
	adds r0, r5, #0
	adds r0, #0x60
	strh r7, [r0]
	b .L080DDB30
.L080DDB06:
	cmp r2, #0
	bge .L080DDB0E
	movs r0, #1
	b .L080DDB10
.L080DDB0E:
	movs r0, #0
.L080DDB10:
	str r0, [r5, #0x50]
	ldr r0, [r5, #0x7c]
	adds r1, r6, #0
	bl __divsi3
	str r0, [r5, #0x7c]
	adds r4, r5, #0
	adds r4, #0x80
	ldr r0, [r4]
	adds r1, r6, #0
	bl __divsi3
	str r0, [r4]
	adds r0, r5, #0
	adds r0, #0x60
	strh r6, [r0]
.L080DDB30:
	ldr r4, .L080DDC08 @ =0x000002A9
	ldrh r0, [r5, #4]
	adds r6, r5, #0
	adds r6, #0x47
	cmp r0, r4
	beq .L080DDB58
	adds r0, r5, #0
	adds r0, #0x30
	adds r1, r4, #0
	bl func_0805E860
	adds r1, r5, #0
	adds r1, #0x44
	movs r2, #0
	movs r0, #1
	strb r0, [r1]
	adds r1, #2
	strb r2, [r1]
	strb r0, [r6]
	strh r4, [r5, #4]
.L080DDB58:
	adds r1, r5, #0
	adds r1, #0x62
	movs r0, #3
	strb r0, [r1]
	adds r1, #0x22
	movs r0, #8
	strb r0, [r1]
.L080DDB66:
	ldr r0, [r5, #0x58]
	ldr r1, [r5, #0x7c]
	adds r0, r0, r1
	str r0, [r5, #0x58]
	adds r1, r5, #0
	adds r1, #0x80
	ldr r0, [r5, #0x5c]
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [r5, #0x5c]
	adds r1, r5, #0
	adds r1, #0x60
	ldrh r0, [r1]
	subs r0, #1
	movs r7, #0
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt .L080DDBD6
	adds r2, r5, #0
	adds r2, #0x79
	ldrb r1, [r2]
	adds r0, r5, #0
	adds r0, #0x78
	strb r1, [r0]
	movs r0, #0xff
	strb r0, [r2]
	ldr r0, [r5, #0x6c]
	str r0, [r5, #0x58]
	ldr r0, [r5, #0x70]
	str r0, [r5, #0x5c]
	adds r0, r5, #0
	adds r0, #0x62
	strb r7, [r0]
	adds r1, r5, #0
	adds r1, #0x84
	movs r0, #0xf8
	strb r0, [r1]
	movs r4, #0xa9
	lsls r4, r4, #2
	ldrh r0, [r5, #4]
	cmp r0, r4
	beq .L080DDBD6
	adds r0, r5, #0
	adds r0, #0x30
	adds r1, r4, #0
	bl func_0805E860
	adds r0, r5, #0
	adds r0, #0x44
	movs r1, #1
	strb r1, [r0]
	adds r0, #2
	strb r7, [r0]
	strb r1, [r6]
	strh r4, [r5, #4]
.L080DDBD6:
	ldr r0, [r5, #0x58]
	asrs r0, r0, #0x10
	adds r1, r5, #0
	adds r1, #0x54
	strh r0, [r1]
	ldr r0, [r5, #0x5c]
	asrs r0, r0, #0x10
	adds r1, #2
	strh r0, [r1]
	ldrb r0, [r6]
	cmp r0, #0
	bne .L080DDC0C
	adds r0, r5, #0
	adds r0, #0x30
	bl func_0805E8F0
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge .L080DDC10
	adds r1, r5, #0
	adds r1, #0x44
	movs r0, #1
	strb r0, [r1]
	b .L080DDC10
	.align 2, 0
.L080DDC08: .4byte 0x000002A9
.L080DDC0C:
	movs r0, #0
	strb r0, [r6]
.L080DDC10:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DDC18
func_080DDC18: @ 0x080DDC18
	push {lr}
	bl func_08039F50
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DDC24
func_080DDC24: @ 0x080DDC24
	ldrb r3, [r1]
	movs r2, #0x10
	rsbs r2, r2, #0
	ands r2, r3
	movs r3, #5
	orrs r2, r3
	strb r2, [r1]
	ldr r2, [r0, #0x50]
	str r2, [r1, #4]
	adds r2, r0, #0
	adds r2, #0x54
	ldrh r2, [r2]
	strh r2, [r1, #8]
	adds r0, #0x56
	ldrh r0, [r0]
	strh r0, [r1, #0xa]
	bx lr
	.align 2, 0

	thumb_func_start func_080DDC48
func_080DDC48: @ 0x080DDC48
	push {r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r4, #0x54
	movs r5, #0
	ldrsh r4, [r4, r5]
	str r4, [sp]
	adds r4, r0, #0
	adds r4, #0x56
	movs r5, #0
	ldrsh r4, [r4, r5]
	str r4, [sp, #4]
	ldr r4, [r0, #0x68]
	asrs r4, r4, #0x10
	str r4, [sp, #8]
	movs r4, #2
	str r4, [sp, #0xc]
	bl func_08039F90
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DDC78
func_080DDC78: @ 0x080DDC78
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x62
	movs r4, #0
	ldrsb r4, [r5, r4]
	cmp r4, #1
	beq .L080DDD1C
	cmp r4, #1
	bgt .L080DDCA2
	cmp r4, #0
	beq .L080DDCB4
	adds r4, r6, #0
	adds r4, #0x60
	movs r0, #0x47
	adds r0, r0, r6
	mov r8, r0
	b .L080DDE1E
.L080DDCA2:
	cmp r4, #2
	bne .L080DDCA8
	b .L080DDE08
.L080DDCA8:
	adds r4, r6, #0
	adds r4, #0x60
	movs r1, #0x47
	adds r1, r1, r6
	mov r8, r1
	b .L080DDE1E
.L080DDCB4:
	bl rand
	asrs r0, r0, #8
	movs r1, #1
	ands r0, r1
	adds r0, #1
	strb r0, [r5]
	adds r5, r0, #0
	cmp r5, #1
	bne .L080DDCEE
	movs r0, #4
	bl func_080AB788
	lsls r0, r0, #8
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	adds r4, r6, #0
	adds r4, #0x60
	strh r0, [r4]
	bl rand
	asrs r0, r0, #8
	ands r0, r5
	lsls r0, r0, #0xb
	adds r1, r6, #0
	adds r1, #0x64
	strh r0, [r1]
	b .L080DDD04
.L080DDCEE:
	movs r0, #2
	bl func_080AB788
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, #0xb4
	adds r0, r6, #0
	adds r0, #0x60
	strh r1, [r0]
	adds r4, r0, #0
.L080DDD04:
	movs r0, #2
	bl func_080AB788
	lsls r0, r0, #2
	adds r0, #0xc
	adds r1, r6, #0
	adds r1, #0x66
	strh r0, [r1]
	movs r3, #0x47
	adds r3, r3, r6
	mov r8, r3
	b .L080DDE1E
.L080DDD1C:
	adds r1, r6, #0
	adds r1, #0x64
	ldrh r0, [r1]
	movs r7, #0xff
	lsls r7, r7, #4
	ands r7, r0
	mov sb, r1
	cmp r7, #0
	bne .L080DDD5C
	ldr r5, .L080DDD58 @ =0x00000205
	ldrh r0, [r6, #4]
	movs r1, #0x47
	adds r1, r1, r6
	mov r8, r1
	cmp r0, r5
	beq .L080DDD90
	adds r0, r6, #0
	adds r0, #0x30
	adds r1, r5, #0
	bl func_0805E860
	adds r0, r6, #0
	adds r0, #0x44
	strb r4, [r0]
	adds r0, #2
	strb r7, [r0]
	mov r2, r8
	strb r4, [r2]
	b .L080DDD8E
	.align 2, 0
.L080DDD58: .4byte 0x00000205
.L080DDD5C:
	movs r0, #0x80
	lsls r0, r0, #4
	movs r3, #0x47
	adds r3, r3, r6
	mov r8, r3
	cmp r7, r0
	bne .L080DDD90
	movs r5, #0x81
	lsls r5, r5, #2
	ldrh r0, [r6, #4]
	cmp r0, r5
	beq .L080DDD90
	adds r0, r6, #0
	adds r0, #0x30
	adds r1, r5, #0
	bl func_0805E860
	adds r0, r6, #0
	adds r0, #0x44
	movs r1, #0
	strb r4, [r0]
	adds r0, #2
	strb r1, [r0]
	mov r0, r8
	strb r4, [r0]
.L080DDD8E:
	strh r5, [r6, #4]
.L080DDD90:
	mov r2, sb
	ldrh r1, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	movs r5, #0xff
	ands r1, r5
	adds r0, r6, #0
	bl func_0803A320
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r3, sb
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	lsls r1, r1, #1
	ands r1, r5
	adds r0, r6, #0
	bl func_0803A334
	lsls r0, r0, #0x10
	adds r1, r6, #0
	adds r1, #0x66
	ldrh r1, [r1]
	mov r2, sb
	ldrh r2, [r2]
	adds r1, r1, r2
	mov r3, sb
	strh r1, [r3]
	lsls r4, r4, #6
	ldr r2, [r6, #0x58]
	adds r2, r2, r4
	str r2, [r6, #0x58]
	asrs r0, r0, #0xa
	ldr r1, [r6, #0x5c]
	adds r1, r1, r0
	str r1, [r6, #0x5c]
	asrs r2, r2, #0x10
	adds r0, r6, #0
	adds r0, #0x54
	strh r2, [r0]
	ldr r0, [r6, #0x5c]
	asrs r0, r0, #0x10
	adds r1, r6, #0
	adds r1, #0x56
	strh r0, [r1]
	ldr r1, [r6, #0x68]
	ldr r0, .L080DDE04 @ =0x0007FFFF
	adds r4, r6, #0
	adds r4, #0x60
	cmp r1, r0
	bgt .L080DDE1E
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r1, r2
	b .L080DDE1C
	.align 2, 0
.L080DDE04: .4byte 0x0007FFFF
.L080DDE08:
	ldr r0, [r6, #0x68]
	adds r4, r6, #0
	adds r4, #0x60
	movs r3, #0x47
	adds r3, r3, r6
	mov r8, r3
	cmp r0, #0
	ble .L080DDE1E
	ldr r1, .L080DDE54 @ =0xFFFFE000
	adds r0, r0, r1
.L080DDE1C:
	str r0, [r6, #0x68]
.L080DDE1E:
	ldrh r0, [r4]
	subs r0, #1
	movs r1, #0
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge .L080DDE32
	adds r0, r6, #0
	adds r0, #0x62
	strb r1, [r0]
.L080DDE32:
	mov r2, r8
	ldrb r0, [r2]
	cmp r0, #0
	bne .L080DDE58
	adds r0, r6, #0
	adds r0, #0x30
	bl func_0805E8F0
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge .L080DDE5C
	adds r1, r6, #0
	adds r1, #0x44
	movs r0, #1
	strb r0, [r1]
	b .L080DDE5C
	.align 2, 0
.L080DDE54: .4byte 0xFFFFE000
.L080DDE58:
	mov r3, r8
	strb r1, [r3]
.L080DDE5C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start func_080DDE68
func_080DDE68: @ 0x080DDE68
	push {lr}
	bl func_08039F50
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DDE74
func_080DDE74: @ 0x080DDE74
	ldrb r3, [r1]
	movs r2, #0x10
	rsbs r2, r2, #0
	ands r2, r3
	movs r3, #4
	orrs r2, r3
	strb r2, [r1]
	ldr r2, [r0, #0x50]
	str r2, [r1, #4]
	adds r2, r0, #0
	adds r2, #0x54
	ldrh r2, [r2]
	strh r2, [r1, #8]
	adds r0, #0x56
	ldrh r0, [r0]
	strh r0, [r1, #0xa]
	bx lr
	.align 2, 0

	thumb_func_start func_080DDE98
func_080DDE98: @ 0x080DDE98
	push {r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r4, #0x54
	movs r5, #0
	ldrsh r4, [r4, r5]
	str r4, [sp]
	adds r4, r0, #0
	adds r4, #0x56
	movs r5, #0
	ldrsh r4, [r4, r5]
	str r4, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	movs r4, #2
	str r4, [sp, #0xc]
	bl func_08039F90
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_080DDEC4
func_080DDEC4: @ 0x080DDEC4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x50
	movs r2, #0x80
	lsls r2, r2, #6
	bl func_0803A180
	cmp r0, #0
	beq .L080DDF02
	ldr r0, [r4, #0x50]
	ldr r1, .L080DDF08 @ =0x00000806
	adds r5, r0, r1
	ldrh r0, [r4, #4]
	cmp r0, r5
	beq .L080DDF02
	adds r0, r4, #0
	adds r0, #0x30
	adds r1, r5, #0
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
	strh r5, [r4, #4]
.L080DDF02:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080DDF08: .4byte 0x00000806

	thumb_func_start func_080DDF0C
func_080DDF0C: @ 0x080DDF0C
	push {lr}
	bl func_08039F50
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DDF18
func_080DDF18: @ 0x080DDF18
	ldrb r3, [r1]
	movs r2, #0x10
	rsbs r2, r2, #0
	ands r2, r3
	movs r3, #3
	orrs r2, r3
	strb r2, [r1]
	ldr r2, [r0, #0x50]
	str r2, [r1, #4]
	adds r2, r0, #0
	adds r2, #0x54
	ldrh r2, [r2]
	strh r2, [r1, #8]
	adds r0, #0x56
	ldrh r0, [r0]
	strh r0, [r1, #0xa]
	bx lr
	.align 2, 0

	thumb_func_start func_080DDF3C
func_080DDF3C: @ 0x080DDF3C
	push {r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r4, #0x54
	movs r5, #0
	ldrsh r4, [r4, r5]
	str r4, [sp]
	adds r4, r0, #0
	adds r4, #0x56
	movs r5, #0
	ldrsh r4, [r4, r5]
	str r4, [sp, #4]
	movs r4, #8
	str r4, [sp, #8]
	movs r4, #2
	str r4, [sp, #0xc]
	bl func_08039F90
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_080DDF68
func_080DDF68: @ 0x080DDF68
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x50
	movs r2, #0x80
	lsls r2, r2, #7
	bl func_0803A180
	cmp r0, #0
	beq .L080DDFA6
	ldr r0, [r4, #0x50]
	ldr r1, .L080DDFAC @ =0x000003DB
	adds r5, r0, r1
	ldrh r0, [r4, #4]
	cmp r0, r5
	beq .L080DDFA6
	adds r0, r4, #0
	adds r0, #0x30
	adds r1, r5, #0
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
	strh r5, [r4, #4]
.L080DDFA6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080DDFAC: .4byte 0x000003DB

	thumb_func_start func_080DDFB0
func_080DDFB0: @ 0x080DDFB0
	push {lr}
	bl func_08039F50
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DDFBC
func_080DDFBC: @ 0x080DDFBC
	ldrb r3, [r1]
	movs r2, #0x10
	rsbs r2, r2, #0
	ands r2, r3
	movs r3, #2
	orrs r2, r3
	strb r2, [r1]
	ldr r2, [r0, #0x50]
	str r2, [r1, #4]
	adds r2, r0, #0
	adds r2, #0x54
	ldrh r2, [r2]
	strh r2, [r1, #8]
	adds r0, #0x56
	ldrh r0, [r0]
	strh r0, [r1, #0xa]
	bx lr
	.align 2, 0

	thumb_func_start func_080DDFE0
func_080DDFE0: @ 0x080DDFE0
	push {r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r4, #0x54
	movs r5, #0
	ldrsh r4, [r4, r5]
	str r4, [sp]
	adds r4, r0, #0
	adds r4, #0x56
	movs r5, #0
	ldrsh r4, [r4, r5]
	str r4, [sp, #4]
	movs r4, #8
	str r4, [sp, #8]
	movs r4, #2
	str r4, [sp, #0xc]
	bl func_08039F90
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_080DE00C
func_080DE00C: @ 0x080DE00C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x50
	movs r2, #0x80
	lsls r2, r2, #8
	bl func_0803A180
	cmp r0, #0
	beq .L080DE04A
	ldr r0, [r4, #0x50]
	adds r5, r0, #0
	adds r5, #0x10
	ldrh r0, [r4, #4]
	cmp r0, r5
	beq .L080DE04A
	adds r0, r4, #0
	adds r0, #0x30
	adds r1, r5, #0
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
	strh r5, [r4, #4]
.L080DE04A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_080DE050
func_080DE050: @ 0x080DE050
	push {lr}
	bl func_08039F50
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DE05C
func_080DE05C: @ 0x080DE05C
	ldrb r3, [r1]
	movs r2, #0x10
	rsbs r2, r2, #0
	ands r2, r3
	movs r3, #1
	orrs r2, r3
	strb r2, [r1]
	ldr r2, [r0, #0x50]
	str r2, [r1, #4]
	adds r2, r0, #0
	adds r2, #0x54
	ldrh r2, [r2]
	strh r2, [r1, #8]
	adds r0, #0x56
	ldrh r0, [r0]
	strh r0, [r1, #0xa]
	bx lr
	.align 2, 0

	thumb_func_start func_080DE080
func_080DE080: @ 0x080DE080
	push {r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r4, #0x54
	movs r5, #0
	ldrsh r4, [r4, r5]
	str r4, [sp]
	adds r4, r0, #0
	adds r4, #0x56
	movs r5, #0
	ldrsh r4, [r4, r5]
	str r4, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	movs r4, #2
	str r4, [sp, #0xc]
	bl func_08039F90
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_080DE0AC
func_080DE0AC: @ 0x080DE0AC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x50
	movs r2, #0x80
	lsls r2, r2, #8
	bl func_0803A180
	cmp r0, #0
	beq .L080DE11E
	adds r0, r4, #0
	adds r0, #0x62
	movs r6, #0
	ldrsb r6, [r0, r6]
	cmp r6, #0
	bne .L080DE0F4
	ldr r0, [r4, #0x50]
	ldr r1, .L080DE0F0 @ =0x000009B6
	adds r5, r0, r1
	ldrh r0, [r4, #4]
	cmp r0, r5
	beq .L080DE11E
	adds r0, r4, #0
	adds r0, #0x30
	adds r1, r5, #0
	bl func_0805E860
	adds r0, r4, #0
	adds r0, #0x44
	movs r1, #1
	strb r1, [r0]
	adds r0, #2
	strb r6, [r0]
	b .L080DE118
	.align 2, 0
.L080DE0F0: .4byte 0x000009B6
.L080DE0F4:
	ldr r0, [r4, #0x50]
	ldr r1, .L080DE124 @ =0x000009BA
	adds r5, r0, r1
	ldrh r0, [r4, #4]
	cmp r0, r5
	beq .L080DE11E
	adds r0, r4, #0
	adds r0, #0x30
	adds r1, r5, #0
	bl func_0805E860
	adds r0, r4, #0
	adds r0, #0x44
	movs r2, #0
	movs r1, #1
	strb r1, [r0]
	adds r0, #2
	strb r2, [r0]
.L080DE118:
	adds r0, #1
	strb r1, [r0]
	strh r5, [r4, #4]
.L080DE11E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080DE124: .4byte 0x000009BA

	thumb_func_start func_080DE128
func_080DE128: @ 0x080DE128
	push {lr}
	bl func_08039F50
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DE134
func_080DE134: @ 0x080DE134
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r2, [r0]
	ldr r2, [r2]
	mov sb, r2
	ldr r2, [r1, #8]
	mov r8, r2
	ldr r7, [r1]
	adds r5, r0, #0
	adds r5, #0xc
	ldr r1, [r0, #8]
	lsls r1, r1, #2
	adds r1, r1, r0
	adds r6, r1, #0
	adds r6, #0xc
	cmp r5, r6
	beq .L080DE176
.L080DE15A:
	ldr r1, [r5]
	cmp r1, #0
	beq .L080DE170
	ldr r0, [r1, #0x4c]
	ldr r4, [r0, #0x10]
	adds r0, r1, #0
	mov r1, sb
	mov r2, r8
	adds r3, r7, #0
	bl _call_via_r4
.L080DE170:
	adds r5, #4
	cmp r5, r6
	bne .L080DE15A
.L080DE176:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080DE184
func_080DE184: @ 0x080DE184
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r4, #0xc
	ldr r1, [r0, #8]
	lsls r1, r1, #2
	adds r1, r1, r0
	adds r5, r1, #0
	adds r5, #0xc
	cmp r4, r5
	beq .L080DE1AE
.L080DE198:
	ldr r2, [r4]
	cmp r2, #0
	beq .L080DE1A8
	ldr r0, [r2, #0x4c]
	ldr r1, [r0, #0xc]
	adds r0, r2, #0
	bl _call_via_r1
.L080DE1A8:
	adds r4, #4
	cmp r4, r5
	bne .L080DE198
.L080DE1AE:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_080DE1B4
func_080DE1B4: @ 0x080DE1B4
	push {r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L080DE1D4 @ =vtable_unk_080E76D4
	str r0, [r4, #4]
	ldr r0, [r4, #8]
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0xc
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0xc
	str r0, [sp, #0xc]
	b .L080DE1F2
	.align 2, 0
.L080DE1D4: .4byte vtable_unk_080E76D4
.L080DE1D8:
	subs r0, r2, #4
	ldr r1, [r0]
	cmp r1, #0
	beq .L080DE1EC
	ldr r0, [r1, #0x4c]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080DE1EC:
	ldr r0, [sp, #4]
	subs r0, #4
	str r0, [sp, #4]
.L080DE1F2:
	ldr r2, [sp, #4]
	ldr r0, [sp, #0xc]
	movs r1, #0
	cmp r2, r0
	bne .L080DE1FE
	movs r1, #1
.L080DE1FE:
	cmp r1, #0
	beq .L080DE1D8
	ldr r0, .L080DE21C @ =vtable_unk_080E65E0
	str r0, [r4, #4]
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq .L080DE214
	adds r0, r4, #0
	bl __builtin_delete
.L080DE214:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080DE21C: .4byte vtable_unk_080E65E0

	thumb_func_start func_080DE220
func_080DE220: @ 0x080DE220
	push {lr}
	adds r2, r0, #0
	ldr r0, .L080DE23C @ =vtable_unk_080E76F8
	str r0, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L080DE236
	adds r0, r2, #0
	bl __builtin_delete
.L080DE236:
	pop {r0}
	bx r0
	.align 2, 0
.L080DE23C: .4byte vtable_unk_080E76F8
.L080DE240:
	.byte 0x10, 0xB5, 0x88, 0xB0, 0x04, 0x1C, 0x69, 0x46, 0x00, 0x20, 0x08, 0x70, 0x20, 0x70, 0x20, 0x1D
	.byte 0xF5, 0xF7, 0x6A, 0xFC, 0x20, 0x1C, 0x08, 0xB0, 0x10, 0xBC, 0x02, 0xBC, 0x08, 0x47, 0x00, 0x00
	.byte 0x00, 0xB5, 0x02, 0x1C, 0x05, 0x48, 0x10, 0x60, 0x01, 0x20, 0x08, 0x40, 0x00, 0x28, 0x02, 0xD0
	.byte 0x10, 0x1C, 0x22, 0xF7, 0xC9, 0xF9, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0xF8, 0x76, 0x0E, 0x08

	thumb_func_start func_080DE280
func_080DE280: @ 0x080DE280
	push {lr}
	subs r0, #4
	bl func_080E0908
	pop {r0}
	bx r0

	thumb_func_start func_080DE28C
func_080DE28C: @ 0x080DE28C
	push {lr}
	subs r0, #0xc
	bl func_080E0908
	pop {r0}
	bx r0

	thumb_func_start func_080DE298
func_080DE298: @ 0x080DE298
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x30
	subs r0, #0xc
	mov r8, r0
	subs r1, #2
	ldr r0, .L080DE2C0 @ =0x00000141
	cmp r1, r0
	bls .L080DE2B4
	bl .L080E0080
.L080DE2B4:
	lsls r0, r1, #2
	ldr r1, .L080DE2C4 @ =.L080DE2C8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L080DE2C0: .4byte 0x00000141
.L080DE2C4: .4byte .L080DE2C8
.L080DE2C8: @ jump table
	.4byte .L080DF750 @ case 0
	.4byte .L080DF8C6 @ case 1
	.4byte .L080DF904 @ case 2
	.4byte .L080DF940 @ case 3
	.4byte .L080DF99C @ case 4
	.4byte .L080E0080 @ case 5
	.4byte .L080DF9EE @ case 6
	.4byte .L080DFAB2 @ case 7
	.4byte .L080DFA50 @ case 8
	.4byte .L080DFB14 @ case 9
	.4byte .L080DFB76 @ case 10
	.4byte .L080DFBB6 @ case 11
	.4byte .L080DFC10 @ case 12
	.4byte .L080DFC24 @ case 13
	.4byte .L080E0080 @ case 14
	.4byte .L080DFC5C @ case 15
	.4byte .L080DFCC2 @ case 16
	.4byte .L080E0080 @ case 17
	.4byte .L080E0080 @ case 18
	.4byte .L080E0080 @ case 19
	.4byte .L080DF51A @ case 20
	.4byte .L080DF5E8 @ case 21
	.4byte .L080DF638 @ case 22
	.4byte .L080DF65E @ case 23
	.4byte .L080DF6B0 @ case 24
	.4byte .L080DF6C2 @ case 25
	.4byte .L080DF748 @ case 26
	.4byte .L080E0080 @ case 27
	.4byte .L080E0080 @ case 28
	.4byte .L080DE7D0 @ case 29
	.4byte .L080DE8AE @ case 30
	.4byte .L080DE97C @ case 31
	.4byte .L080DE8CE @ case 32
	.4byte .L080DE924 @ case 33
	.4byte .L080DE9D4 @ case 34
	.4byte .L080DEAA4 @ case 35
	.4byte .L080DEBB8 @ case 36
	.4byte .L080DED0C @ case 37
	.4byte .L080DEDB4 @ case 38
	.4byte .L080DEE9E @ case 39
	.4byte .L080DEFCE @ case 40
	.4byte .L080DF136 @ case 41
	.4byte .L080E0080 @ case 42
	.4byte .L080E0080 @ case 43
	.4byte .L080E0080 @ case 44
	.4byte .L080E0080 @ case 45
	.4byte .L080E0080 @ case 46
	.4byte .L080E0080 @ case 47
	.4byte .L080E0080 @ case 48
	.4byte .L080DF318 @ case 49
	.4byte .L080DF3F0 @ case 50
	.4byte .L080E0080 @ case 51
	.4byte .L080DF2EC @ case 52
	.4byte .L080DFCF6 @ case 53
	.4byte .L080E0080 @ case 54
	.4byte .L080E0080 @ case 55
	.4byte .L080E0080 @ case 56
	.4byte .L080E0080 @ case 57
	.4byte .L080E0080 @ case 58
	.4byte .L080E0080 @ case 59
	.4byte .L080E0080 @ case 60
	.4byte .L080E0080 @ case 61
	.4byte .L080E0080 @ case 62
	.4byte .L080E0080 @ case 63
	.4byte .L080E0080 @ case 64
	.4byte .L080E0080 @ case 65
	.4byte .L080E0080 @ case 66
	.4byte .L080E0040 @ case 67
	.4byte .L080E0080 @ case 68
	.4byte .L080DFF6E @ case 69
	.4byte .L080DFFF2 @ case 70
	.4byte .L080E0080 @ case 71
	.4byte .L080E0080 @ case 72
	.4byte .L080E0080 @ case 73
	.4byte .L080E0080 @ case 74
	.4byte .L080E0058 @ case 75
	.4byte .L080E0080 @ case 76
	.4byte .L080E0080 @ case 77
	.4byte .L080E0080 @ case 78
	.4byte .L080E0080 @ case 79
	.4byte .L080E0080 @ case 80
	.4byte .L080E0080 @ case 81
	.4byte .L080E0080 @ case 82
	.4byte .L080E0080 @ case 83
	.4byte .L080E0080 @ case 84
	.4byte .L080E0080 @ case 85
	.4byte .L080E0080 @ case 86
	.4byte .L080E0080 @ case 87
	.4byte .L080DFF3A @ case 88
	.4byte .L080E0080 @ case 89
	.4byte .L080E0080 @ case 90
	.4byte .L080E0080 @ case 91
	.4byte .L080E0080 @ case 92
	.4byte .L080E0080 @ case 93
	.4byte .L080E0080 @ case 94
	.4byte .L080E0080 @ case 95
	.4byte .L080E0080 @ case 96
	.4byte .L080E0080 @ case 97
	.4byte .L080E0080 @ case 98
	.4byte .L080E0080 @ case 99
	.4byte .L080E0080 @ case 100
	.4byte .L080E0080 @ case 101
	.4byte .L080E0080 @ case 102
	.4byte .L080E0080 @ case 103
	.4byte .L080E0080 @ case 104
	.4byte .L080E0080 @ case 105
	.4byte .L080E0080 @ case 106
	.4byte .L080E0080 @ case 107
	.4byte .L080E0080 @ case 108
	.4byte .L080E0080 @ case 109
	.4byte .L080E0080 @ case 110
	.4byte .L080E0080 @ case 111
	.4byte .L080E0080 @ case 112
	.4byte .L080E0080 @ case 113
	.4byte .L080E0080 @ case 114
	.4byte .L080E0080 @ case 115
	.4byte .L080E0080 @ case 116
	.4byte .L080E0080 @ case 117
	.4byte .L080E0080 @ case 118
	.4byte .L080E0080 @ case 119
	.4byte .L080E0080 @ case 120
	.4byte .L080E0080 @ case 121
	.4byte .L080E0080 @ case 122
	.4byte .L080E0080 @ case 123
	.4byte .L080E0080 @ case 124
	.4byte .L080E0080 @ case 125
	.4byte .L080E0080 @ case 126
	.4byte .L080E0080 @ case 127
	.4byte .L080E0080 @ case 128
	.4byte .L080E0080 @ case 129
	.4byte .L080E0080 @ case 130
	.4byte .L080E0080 @ case 131
	.4byte .L080E0080 @ case 132
	.4byte .L080E0080 @ case 133
	.4byte .L080E0080 @ case 134
	.4byte .L080E0080 @ case 135
	.4byte .L080E0080 @ case 136
	.4byte .L080E0080 @ case 137
	.4byte .L080E0080 @ case 138
	.4byte .L080E0080 @ case 139
	.4byte .L080E0080 @ case 140
	.4byte .L080E0080 @ case 141
	.4byte .L080E0080 @ case 142
	.4byte .L080E0080 @ case 143
	.4byte .L080E0080 @ case 144
	.4byte .L080E0080 @ case 145
	.4byte .L080E0080 @ case 146
	.4byte .L080E0080 @ case 147
	.4byte .L080E0080 @ case 148
	.4byte .L080E0080 @ case 149
	.4byte .L080E0080 @ case 150
	.4byte .L080E0080 @ case 151
	.4byte .L080E0080 @ case 152
	.4byte .L080E0080 @ case 153
	.4byte .L080E0080 @ case 154
	.4byte .L080E0080 @ case 155
	.4byte .L080E0080 @ case 156
	.4byte .L080E0080 @ case 157
	.4byte .L080E0080 @ case 158
	.4byte .L080E0080 @ case 159
	.4byte .L080E0080 @ case 160
	.4byte .L080E0080 @ case 161
	.4byte .L080E0080 @ case 162
	.4byte .L080E0080 @ case 163
	.4byte .L080E0080 @ case 164
	.4byte .L080E0080 @ case 165
	.4byte .L080E0080 @ case 166
	.4byte .L080E0080 @ case 167
	.4byte .L080E0080 @ case 168
	.4byte .L080E0080 @ case 169
	.4byte .L080E0080 @ case 170
	.4byte .L080E0080 @ case 171
	.4byte .L080E0080 @ case 172
	.4byte .L080E0080 @ case 173
	.4byte .L080E0080 @ case 174
	.4byte .L080E0080 @ case 175
	.4byte .L080E0080 @ case 176
	.4byte .L080E0080 @ case 177
	.4byte .L080E0080 @ case 178
	.4byte .L080E0080 @ case 179
	.4byte .L080E0080 @ case 180
	.4byte .L080E0080 @ case 181
	.4byte .L080DFD5C @ case 182
	.4byte .L080DFD80 @ case 183
	.4byte .L080E0080 @ case 184
	.4byte .L080E0080 @ case 185
	.4byte .L080E0080 @ case 186
	.4byte .L080E0080 @ case 187
	.4byte .L080E0080 @ case 188
	.4byte .L080DFD38 @ case 189
	.4byte .L080DFD24 @ case 190
	.4byte .L080E0080 @ case 191
	.4byte .L080E0080 @ case 192
	.4byte .L080E0080 @ case 193
	.4byte .L080E0080 @ case 194
	.4byte .L080E0080 @ case 195
	.4byte .L080E0080 @ case 196
	.4byte .L080E0080 @ case 197
	.4byte .L080E0080 @ case 198
	.4byte .L080E0080 @ case 199
	.4byte .L080E0080 @ case 200
	.4byte .L080E0080 @ case 201
	.4byte .L080E0080 @ case 202
	.4byte .L080E0080 @ case 203
	.4byte .L080E0080 @ case 204
	.4byte .L080E0080 @ case 205
	.4byte .L080E0080 @ case 206
	.4byte .L080E0080 @ case 207
	.4byte .L080E0080 @ case 208
	.4byte .L080E0080 @ case 209
	.4byte .L080E0080 @ case 210
	.4byte .L080E0080 @ case 211
	.4byte .L080E0080 @ case 212
	.4byte .L080E0080 @ case 213
	.4byte .L080E0080 @ case 214
	.4byte .L080E0080 @ case 215
	.4byte .L080E0080 @ case 216
	.4byte .L080E0080 @ case 217
	.4byte .L080E0080 @ case 218
	.4byte .L080E0080 @ case 219
	.4byte .L080E0080 @ case 220
	.4byte .L080E0080 @ case 221
	.4byte .L080E0080 @ case 222
	.4byte .L080E0080 @ case 223
	.4byte .L080E0080 @ case 224
	.4byte .L080E0080 @ case 225
	.4byte .L080E0080 @ case 226
	.4byte .L080E0080 @ case 227
	.4byte .L080E0080 @ case 228
	.4byte .L080E0080 @ case 229
	.4byte .L080E0080 @ case 230
	.4byte .L080E0080 @ case 231
	.4byte .L080E0080 @ case 232
	.4byte .L080E0080 @ case 233
	.4byte .L080E0080 @ case 234
	.4byte .L080E0080 @ case 235
	.4byte .L080E0080 @ case 236
	.4byte .L080E0080 @ case 237
	.4byte .L080E0080 @ case 238
	.4byte .L080E0080 @ case 239
	.4byte .L080E0080 @ case 240
	.4byte .L080E0080 @ case 241
	.4byte .L080E0080 @ case 242
	.4byte .L080E0080 @ case 243
	.4byte .L080E0080 @ case 244
	.4byte .L080E0080 @ case 245
	.4byte .L080E0080 @ case 246
	.4byte .L080E0080 @ case 247
	.4byte .L080E0080 @ case 248
	.4byte .L080E0080 @ case 249
	.4byte .L080E0080 @ case 250
	.4byte .L080E0080 @ case 251
	.4byte .L080E0080 @ case 252
	.4byte .L080E0080 @ case 253
	.4byte .L080E0080 @ case 254
	.4byte .L080E0080 @ case 255
	.4byte .L080E0080 @ case 256
	.4byte .L080E0080 @ case 257
	.4byte .L080E0080 @ case 258
	.4byte .L080E0080 @ case 259
	.4byte .L080E0080 @ case 260
	.4byte .L080E0080 @ case 261
	.4byte .L080E0080 @ case 262
	.4byte .L080E0080 @ case 263
	.4byte .L080E0080 @ case 264
	.4byte .L080E0080 @ case 265
	.4byte .L080E0080 @ case 266
	.4byte .L080E0080 @ case 267
	.4byte .L080E0080 @ case 268
	.4byte .L080E0080 @ case 269
	.4byte .L080E0080 @ case 270
	.4byte .L080E0080 @ case 271
	.4byte .L080E0080 @ case 272
	.4byte .L080E0080 @ case 273
	.4byte .L080E0080 @ case 274
	.4byte .L080E0080 @ case 275
	.4byte .L080E0080 @ case 276
	.4byte .L080E0080 @ case 277
	.4byte .L080E0080 @ case 278
	.4byte .L080E0080 @ case 279
	.4byte .L080E0080 @ case 280
	.4byte .L080E0080 @ case 281
	.4byte .L080E0080 @ case 282
	.4byte .L080E0080 @ case 283
	.4byte .L080E0080 @ case 284
	.4byte .L080E0080 @ case 285
	.4byte .L080E0080 @ case 286
	.4byte .L080E0080 @ case 287
	.4byte .L080E0080 @ case 288
	.4byte .L080E0080 @ case 289
	.4byte .L080E0080 @ case 290
	.4byte .L080E0080 @ case 291
	.4byte .L080E0080 @ case 292
	.4byte .L080E0080 @ case 293
	.4byte .L080E0080 @ case 294
	.4byte .L080E0080 @ case 295
	.4byte .L080E0080 @ case 296
	.4byte .L080E0080 @ case 297
	.4byte .L080E0080 @ case 298
	.4byte .L080E0080 @ case 299
	.4byte .L080E0080 @ case 300
	.4byte .L080E0080 @ case 301
	.4byte .L080E0080 @ case 302
	.4byte .L080E0080 @ case 303
	.4byte .L080E0080 @ case 304
	.4byte .L080E0080 @ case 305
	.4byte .L080E0080 @ case 306
	.4byte .L080E0080 @ case 307
	.4byte .L080E0080 @ case 308
	.4byte .L080E0080 @ case 309
	.4byte .L080E0080 @ case 310
	.4byte .L080E0080 @ case 311
	.4byte .L080E0080 @ case 312
	.4byte .L080E0080 @ case 313
	.4byte .L080E0080 @ case 314
	.4byte .L080E0080 @ case 315
	.4byte .L080DFDAC @ case 316
	.4byte .L080DFE36 @ case 317
	.4byte .L080DFE8C @ case 318
	.4byte .L080DFEFE @ case 319
	.4byte .L080DFFBA @ case 320
	.4byte .L080DF85C @ case 321
.L080DE7D0:
	movs r0, #0xdb
	lsls r0, r0, #2
	add r0, r8
	ldr r5, [r0]
	adds r6, r0, #0
	cmp r5, #0
	bne .L080DE88E
	movs r0, #0xe8
	lsls r0, r0, #2
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne .L080DE83E
	movs r0, #4
	bl __builtin_new
	adds r4, r0, #0
	add r0, sp, #0x10
	bl func_0800835C
	add r0, sp, #0x14
	bl func_0800770C
	add r1, sp, #0x14
	movs r0, #1
	str r0, [sp]
	add r0, sp, #0x10
	str r0, [sp, #4]
	str r1, [sp, #8]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x1f
	movs r3, #0
	bl func_08050CC0
	adds r5, r6, #0
	adds r4, r0, #0
	ldr r0, [r6]
	cmp r4, r0
	beq .L080DE82A
	cmp r0, #0
	beq .L080DE82A
	movs r1, #3
	bl func_08050D0C
.L080DE82A:
	str r4, [r5]
	add r0, sp, #0x14
	movs r1, #2
	bl func_08007714
	add r0, sp, #0x10
	movs r1, #2
	bl func_08008364
	b .L080DE88E
.L080DE83E:
	movs r0, #4
	bl __builtin_new
	adds r4, r0, #0
	add r0, sp, #0x10
	bl func_0800835C
	add r0, sp, #0x14
	bl func_0800770C
	add r0, sp, #0x14
	str r5, [sp]
	add r1, sp, #0x10
	str r1, [sp, #4]
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x1f
	movs r3, #0
	bl func_08050CC0
	adds r5, r6, #0
	adds r4, r0, #0
	ldr r0, [r6]
	cmp r4, r0
	beq .L080DE87C
	cmp r0, #0
	beq .L080DE87C
	movs r1, #3
	bl func_08050D0C
.L080DE87C:
	str r4, [r5]
	add r0, sp, #0x14
	movs r1, #2
	bl func_08007714
	add r0, sp, #0x10
	movs r1, #2
	bl func_08008364
.L080DE88E:
	ldr r0, [r6]
	bl func_08050D34
	cmp r0, #3
	bne .L080DE89C
	bl .L080E007C
.L080DE89C:
	ldr r0, [r6]
	bl func_08050D5C
	movs r1, #0xd9
	lsls r1, r1, #2
	add r1, r8
	movs r0, #2
	bl .L080E007A
.L080DE8AE:
	movs r0, #0xdb
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	cmp r0, #0
	bne .L080DE8BE
	bl .L080E007C
.L080DE8BE:
	bl func_08050D74
	movs r1, #0xd9
	lsls r1, r1, #2
	add r1, r8
	movs r0, #3
	bl .L080E007A
.L080DE8CE:
	movs r2, #0xe0
	lsls r2, r2, #1
	add r2, r8
	ldr r1, [r2]
	lsls r0, r1, #2
	add r0, r8
	ldr r3, [r0, #0x2c]
	cmp r1, #0
	beq .L080DE8E4
	subs r0, r1, #1
	str r0, [r2]
.L080DE8E4:
	mov r2, r8
	adds r2, #0xc
	ldr r0, [r2, #0x10]
	cmp r3, r0
	bhi .L080DE8FC
	ldr r1, [r2, #0x14]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r1, [r2, #0x18]
	ldr r0, [r0]
	adds r1, r1, r0
	b .L080DE8FE
.L080DE8FC:
	ldr r1, .L080DE920 @ =gUnk_080F19A0
.L080DE8FE:
	movs r0, #0xdb
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	cmp r0, #0
	bne .L080DE90E
	bl .L080E007C
.L080DE90E:
	movs r2, #0x40
	bl func_08050DB4
	movs r1, #0xd9
	lsls r1, r1, #2
	add r1, r8
	movs r0, #4
	bl .L080E007A
	.align 2, 0
.L080DE920: .4byte gUnk_080F19A0
.L080DE924:
	movs r2, #0xe0
	lsls r2, r2, #1
	add r2, r8
	ldr r1, [r2]
	lsls r0, r1, #2
	add r0, r8
	ldr r3, [r0, #0x2c]
	cmp r1, #0
	beq .L080DE93A
	subs r0, r1, #1
	str r0, [r2]
.L080DE93A:
	mov r2, r8
	adds r2, #0xc
	ldr r0, [r2, #0x10]
	cmp r3, r0
	bhi .L080DE952
	ldr r1, [r2, #0x14]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r1, [r2, #0x18]
	ldr r0, [r0]
	adds r1, r1, r0
	b .L080DE954
.L080DE952:
	ldr r1, .L080DE978 @ =gUnk_080F19A0
.L080DE954:
	movs r0, #0xdb
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	cmp r0, #0
	bne .L080DE964
	bl .L080E007C
.L080DE964:
	movs r2, #0
	bl func_08050DB4
	movs r1, #0xd9
	lsls r1, r1, #2
	add r1, r8
	movs r0, #4
	bl .L080E007A
	.align 2, 0
.L080DE978: .4byte gUnk_080F19A0
.L080DE97C:
	movs r2, #0xe0
	lsls r2, r2, #1
	add r2, r8
	ldr r1, [r2]
	lsls r0, r1, #2
	add r0, r8
	ldr r3, [r0, #0x2c]
	cmp r1, #0
	beq .L080DE992
	subs r0, r1, #1
	str r0, [r2]
.L080DE992:
	mov r2, r8
	adds r2, #0xc
	ldr r0, [r2, #0x10]
	cmp r3, r0
	bhi .L080DE9AA
	ldr r1, [r2, #0x14]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r1, [r2, #0x18]
	ldr r0, [r0]
	adds r1, r1, r0
	b .L080DE9AC
.L080DE9AA:
	ldr r1, .L080DE9D0 @ =gUnk_080F19A0
.L080DE9AC:
	movs r0, #0xdb
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	cmp r0, #0
	bne .L080DE9BC
	bl .L080E007C
.L080DE9BC:
	movs r2, #0x80
	lsls r2, r2, #1
	bl func_08050DB4
	movs r1, #0xd9
	lsls r1, r1, #2
	add r1, r8
	movs r0, #4
	bl .L080E007A
	.align 2, 0
.L080DE9D0: .4byte gUnk_080F19A0
.L080DE9D4:
	mov r3, r8
	adds r3, #0x30
	movs r2, #0xe0
	lsls r2, r2, #1
	add r2, r8
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r7, [r0]
	cmp r1, #0
	beq .L080DE9F0
	subs r0, r1, #1
	str r0, [r2]
.L080DE9F0:
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r5, [r0]
	cmp r1, #0
	beq .L080DEA02
	subs r0, r1, #1
	str r0, [r2]
.L080DEA02:
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r3, [r0]
	cmp r1, #0
	beq .L080DEA14
	subs r0, r1, #1
	str r0, [r2]
.L080DEA14:
	mov r0, r8
	adds r0, #0xc
	ldr r1, [r0, #0x10]
	adds r4, r0, #0
	cmp r3, r1
	bhi .L080DEA2E
	ldr r1, [r4, #0x14]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r1, [r4, #0x18]
	ldr r0, [r0]
	adds r6, r1, r0
	b .L080DEA30
.L080DEA2E:
	ldr r6, .L080DEA44 @ =gUnk_080F19A0
.L080DEA30:
	ldr r0, [r4, #0x10]
	cmp r5, r0
	bhi .L080DEA48
	ldr r1, [r4, #0x14]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r1, [r4, #0x18]
	ldr r0, [r0]
	adds r2, r1, r0
	b .L080DEA4A
	.align 2, 0
.L080DEA44: .4byte gUnk_080F19A0
.L080DEA48:
	ldr r2, .L080DEA60 @ =gUnk_080F19A0
.L080DEA4A:
	ldr r0, [r4, #0x10]
	cmp r7, r0
	bhi .L080DEA64
	ldr r1, [r4, #0x14]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r1, [r4, #0x18]
	ldr r0, [r0]
	adds r3, r1, r0
	b .L080DEA66
	.align 2, 0
.L080DEA60: .4byte gUnk_080F19A0
.L080DEA64:
	ldr r3, .L080DEAA0 @ =gUnk_080F19A0
.L080DEA66:
	movs r1, #0
	movs r0, #0xdb
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	cmp r0, #0
	bne .L080DEA78
	bl .L080E007C
.L080DEA78:
	cmp r2, #0
	bne .L080DEA80
	bl .L080E007C
.L080DEA80:
	cmp r3, #0
	bne .L080DEA88
	bl .L080E007C
.L080DEA88:
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	adds r1, r6, #0
	bl func_08050E30
	movs r1, #0xd9
	lsls r1, r1, #2
	add r1, r8
	movs r0, #7
	bl .L080E007A
	.align 2, 0
.L080DEAA0: .4byte gUnk_080F19A0
.L080DEAA4:
	mov r3, r8
	adds r3, #0x30
	movs r2, #0xe0
	lsls r2, r2, #1
	add r2, r8
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r0, [r0]
	mov sb, r0
	cmp r1, #0
	beq .L080DEAC2
	subs r0, r1, #1
	str r0, [r2]
.L080DEAC2:
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r7, [r0]
	cmp r1, #0
	beq .L080DEAD4
	subs r0, r1, #1
	str r0, [r2]
.L080DEAD4:
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r6, [r0]
	cmp r1, #0
	beq .L080DEAE6
	subs r0, r1, #1
	str r0, [r2]
.L080DEAE6:
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r3, [r0]
	cmp r1, #0
	beq .L080DEAF8
	subs r0, r1, #1
	str r0, [r2]
.L080DEAF8:
	mov r0, r8
	adds r0, #0xc
	ldr r1, [r0, #0x10]
	adds r4, r0, #0
	cmp r3, r1
	bhi .L080DEB12
	ldr r1, [r4, #0x14]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r1, [r4, #0x18]
	ldr r0, [r0]
	adds r5, r1, r0
	b .L080DEB14
.L080DEB12:
	ldr r5, .L080DEB28 @ =gUnk_080F19A0
.L080DEB14:
	ldr r0, [r4, #0x10]
	cmp r6, r0
	bhi .L080DEB2C
	ldr r1, [r4, #0x14]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r1, [r4, #0x18]
	ldr r0, [r0]
	adds r2, r1, r0
	b .L080DEB2E
	.align 2, 0
.L080DEB28: .4byte gUnk_080F19A0
.L080DEB2C:
	ldr r2, .L080DEB44 @ =gUnk_080F19A0
.L080DEB2E:
	ldr r0, [r4, #0x10]
	cmp r7, r0
	bhi .L080DEB48
	ldr r1, [r4, #0x14]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r1, [r4, #0x18]
	ldr r0, [r0]
	adds r3, r1, r0
	b .L080DEB4A
	.align 2, 0
.L080DEB44: .4byte gUnk_080F19A0
.L080DEB48:
	ldr r3, .L080DEB60 @ =gUnk_080F19A0
.L080DEB4A:
	ldr r0, [r4, #0x10]
	cmp sb, r0
	bhi .L080DEB64
	ldr r1, [r4, #0x14]
	mov r6, sb
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r1, [r4, #0x18]
	ldr r0, [r0]
	adds r1, r1, r0
	b .L080DEB66
	.align 2, 0
.L080DEB60: .4byte gUnk_080F19A0
.L080DEB64:
	ldr r1, .L080DEB9C @ =gUnk_080F19A0
.L080DEB66:
	movs r4, #0
	movs r0, #0xdb
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	cmp r0, #0
	bne .L080DEB78
	bl .L080E007C
.L080DEB78:
	cmp r2, #0
	bne .L080DEB80
	bl .L080E007C
.L080DEB80:
	cmp r3, #0
	bne .L080DEB88
	bl .L080E007C
.L080DEB88:
	cmp r1, #0
	bne .L080DEBA0
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	adds r1, r5, #0
	bl func_08050E30
	b .L080DEBAC
	.align 2, 0
.L080DEB9C: .4byte gUnk_080F19A0
.L080DEBA0:
	str r1, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	adds r1, r5, #0
	bl func_08050E30
.L080DEBAC:
	movs r1, #0xd9
	lsls r1, r1, #2
	add r1, r8
	movs r0, #7
	bl .L080E007A
.L080DEBB8:
	mov r3, r8
	adds r3, #0x30
	movs r2, #0xe0
	lsls r2, r2, #1
	add r2, r8
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r0, [r0]
	mov sl, r0
	cmp r1, #0
	beq .L080DEBD6
	subs r0, r1, #1
	str r0, [r2]
.L080DEBD6:
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r0, [r0]
	mov sb, r0
	cmp r1, #0
	beq .L080DEBEA
	subs r0, r1, #1
	str r0, [r2]
.L080DEBEA:
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r7, [r0]
	cmp r1, #0
	beq .L080DEBFC
	subs r0, r1, #1
	str r0, [r2]
.L080DEBFC:
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r5, [r0]
	cmp r1, #0
	beq .L080DEC0E
	subs r0, r1, #1
	str r0, [r2]
.L080DEC0E:
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r3, [r0]
	cmp r1, #0
	beq .L080DEC20
	subs r0, r1, #1
	str r0, [r2]
.L080DEC20:
	mov r0, r8
	adds r0, #0xc
	ldr r1, [r0, #0x10]
	adds r4, r0, #0
	cmp r3, r1
	bhi .L080DEC3A
	ldr r1, [r4, #0x14]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r1, [r4, #0x18]
	ldr r0, [r0]
	adds r6, r1, r0
	b .L080DEC3C
.L080DEC3A:
	ldr r6, .L080DEC50 @ =gUnk_080F19A0
.L080DEC3C:
	ldr r0, [r4, #0x10]
	cmp r5, r0
	bhi .L080DEC54
	ldr r1, [r4, #0x14]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r1, [r4, #0x18]
	ldr r0, [r0]
	adds r2, r1, r0
	b .L080DEC56
	.align 2, 0
.L080DEC50: .4byte gUnk_080F19A0
.L080DEC54:
	ldr r2, .L080DEC6C @ =gUnk_080F19A0
.L080DEC56:
	ldr r0, [r4, #0x10]
	cmp r7, r0
	bhi .L080DEC70
	ldr r1, [r4, #0x14]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r1, [r4, #0x18]
	ldr r0, [r0]
	adds r3, r1, r0
	b .L080DEC72
	.align 2, 0
.L080DEC6C: .4byte gUnk_080F19A0
.L080DEC70:
	ldr r3, .L080DEC88 @ =gUnk_080F19A0
.L080DEC72:
	ldr r0, [r4, #0x10]
	cmp sb, r0
	bhi .L080DEC8C
	ldr r1, [r4, #0x14]
	mov r7, sb
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r1, [r4, #0x18]
	ldr r0, [r0]
	adds r5, r1, r0
	b .L080DEC8E
	.align 2, 0
.L080DEC88: .4byte gUnk_080F19A0
.L080DEC8C:
	ldr r5, .L080DECA4 @ =gUnk_080F19A0
.L080DEC8E:
	ldr r0, [r4, #0x10]
	cmp sl, r0
	bhi .L080DECA8
	ldr r1, [r4, #0x14]
	mov r7, sl
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r1, [r4, #0x18]
	ldr r0, [r0]
	adds r1, r1, r0
	b .L080DECAA
	.align 2, 0
.L080DECA4: .4byte gUnk_080F19A0
.L080DECA8:
	ldr r1, .L080DECD8 @ =gUnk_080F19A0
.L080DECAA:
	movs r0, #0xdb
	lsls r0, r0, #2
	add r0, r8
	ldr r4, [r0]
	cmp r4, #0
	bne .L080DECBA
	bl .L080E007C
.L080DECBA:
	cmp r2, #0
	bne .L080DECC2
	bl .L080E007C
.L080DECC2:
	cmp r3, #0
	bne .L080DECCA
	bl .L080E007C
.L080DECCA:
	cmp r5, #0
	bne .L080DECDC
	str r5, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	b .L080DECE6
	.align 2, 0
.L080DECD8: .4byte gUnk_080F19A0
.L080DECDC:
	cmp r1, #0
	bne .L080DECF0
	str r5, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
.L080DECE6:
	adds r0, r4, #0
	adds r1, r6, #0
	bl func_08050E30
	b .L080DED00
.L080DECF0:
	str r5, [sp]
	str r1, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	bl func_08050E30
.L080DED00:
	movs r1, #0xd9
	lsls r1, r1, #2
	add r1, r8
	movs r0, #7
	bl .L080E007A
.L080DED0C:
	mov r3, r8
	adds r3, #0x30
	movs r2, #0xe0
	lsls r2, r2, #1
	add r2, r8
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r5, [r0]
	cmp r1, #0
	beq .L080DED28
	subs r0, r1, #1
	str r0, [r2]
.L080DED28:
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r3, [r0]
	cmp r1, #0
	beq .L080DED3A
	subs r0, r1, #1
	str r0, [r2]
.L080DED3A:
	mov r0, r8
	adds r0, #0xc
	ldr r1, [r0, #0x10]
	adds r4, r0, #0
	cmp r3, r1
	bhi .L080DED54
	ldr r1, [r4, #0x14]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r1, [r4, #0x18]
	ldr r0, [r0]
	adds r3, r1, r0
	b .L080DED56
.L080DED54:
	ldr r3, .L080DED6C @ =gUnk_080F19A0
.L080DED56:
	ldr r0, [r4, #0x10]
	cmp r5, r0
	bhi .L080DED70
	ldr r1, [r4, #0x14]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r1, [r4, #0x18]
	ldr r0, [r0]
	adds r2, r1, r0
	b .L080DED72
	.align 2, 0
.L080DED6C: .4byte gUnk_080F19A0
.L080DED70:
	ldr r2, .L080DEDB0 @ =gUnk_080F19A0
.L080DED72:
	movs r1, #0
	movs r0, #0xdb
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	cmp r0, #0
	bne .L080DED84
	bl .L080E007C
.L080DED84:
	cmp r3, #0
	bne .L080DED8C
	bl .L080E007C
.L080DED8C:
	cmp r2, #0
	bne .L080DED94
	bl .L080E007C
.L080DED94:
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	adds r1, r3, #0
	movs r3, #0
	bl func_08050E0C
	movs r1, #0xd9
	lsls r1, r1, #2
	add r1, r8
	movs r0, #7
	bl .L080E007A
	.align 2, 0
.L080DEDB0: .4byte gUnk_080F19A0
.L080DEDB4:
	mov r3, r8
	adds r3, #0x30
	movs r2, #0xe0
	lsls r2, r2, #1
	add r2, r8
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r7, [r0]
	cmp r1, #0
	beq .L080DEDD0
	subs r0, r1, #1
	str r0, [r2]
.L080DEDD0:
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r6, [r0]
	cmp r1, #0
	beq .L080DEDE2
	subs r0, r1, #1
	str r0, [r2]
.L080DEDE2:
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r3, [r0]
	cmp r1, #0
	beq .L080DEDF4
	subs r0, r1, #1
	str r0, [r2]
.L080DEDF4:
	mov r0, r8
	adds r0, #0xc
	ldr r1, [r0, #0x10]
	adds r4, r0, #0
	cmp r3, r1
	bhi .L080DEE0E
	ldr r1, [r4, #0x14]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r1, [r4, #0x18]
	ldr r0, [r0]
	adds r5, r1, r0
	b .L080DEE10
.L080DEE0E:
	ldr r5, .L080DEE24 @ =gUnk_080F19A0
.L080DEE10:
	ldr r0, [r4, #0x10]
	cmp r6, r0
	bhi .L080DEE28
	ldr r1, [r4, #0x14]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r1, [r4, #0x18]
	ldr r0, [r0]
	adds r2, r1, r0
	b .L080DEE2A
	.align 2, 0
.L080DEE24: .4byte gUnk_080F19A0
.L080DEE28:
	ldr r2, .L080DEE40 @ =gUnk_080F19A0
.L080DEE2A:
	ldr r0, [r4, #0x10]
	cmp r7, r0
	bhi .L080DEE44
	ldr r1, [r4, #0x14]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r1, [r4, #0x18]
	ldr r0, [r0]
	adds r3, r1, r0
	b .L080DEE46
	.align 2, 0
.L080DEE40: .4byte gUnk_080F19A0
.L080DEE44:
	ldr r3, .L080DEE80 @ =gUnk_080F19A0
.L080DEE46:
	movs r1, #0
	movs r0, #0xdb
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	cmp r0, #0
	bne .L080DEE58
	bl .L080E007C
.L080DEE58:
	cmp r5, #0
	bne .L080DEE60
	bl .L080E007C
.L080DEE60:
	cmp r2, #0
	bne .L080DEE68
	bl .L080E007C
.L080DEE68:
	cmp r3, #0
	bne .L080DEE84
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	str r3, [sp, #0xc]
	adds r1, r5, #0
	movs r3, #0
	bl func_08050E0C
	b .L080DEE92
	.align 2, 0
.L080DEE80: .4byte gUnk_080F19A0
.L080DEE84:
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	adds r1, r5, #0
	bl func_08050E0C
.L080DEE92:
	movs r1, #0xd9
	lsls r1, r1, #2
	add r1, r8
	movs r0, #7
	bl .L080E007A
.L080DEE9E:
	mov r3, r8
	adds r3, #0x30
	movs r2, #0xe0
	lsls r2, r2, #1
	add r2, r8
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r0, [r0]
	mov sb, r0
	cmp r1, #0
	beq .L080DEEBC
	subs r0, r1, #1
	str r0, [r2]
.L080DEEBC:
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r7, [r0]
	cmp r1, #0
	beq .L080DEECE
	subs r0, r1, #1
	str r0, [r2]
.L080DEECE:
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r6, [r0]
	cmp r1, #0
	beq .L080DEEE0
	subs r0, r1, #1
	str r0, [r2]
.L080DEEE0:
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r3, [r0]
	cmp r1, #0
	beq .L080DEEF2
	subs r0, r1, #1
	str r0, [r2]
.L080DEEF2:
	mov r0, r8
	adds r0, #0xc
	ldr r1, [r0, #0x10]
	adds r4, r0, #0
	cmp r3, r1
	bhi .L080DEF0C
	ldr r1, [r4, #0x14]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r1, [r4, #0x18]
	ldr r0, [r0]
	adds r5, r1, r0
	b .L080DEF0E
.L080DEF0C:
	ldr r5, .L080DEF24 @ =gUnk_080F19A0
.L080DEF0E:
	ldr r0, [r4, #0x10]
	cmp r6, r0
	bhi .L080DEF28
	ldr r1, [r4, #0x14]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r1, [r4, #0x18]
	ldr r0, [r0]
	adds r2, r1, r0
	b .L080DEF2A
	.align 2, 0
.L080DEF24: .4byte gUnk_080F19A0
.L080DEF28:
	ldr r2, .L080DEF40 @ =gUnk_080F19A0
.L080DEF2A:
	ldr r0, [r4, #0x10]
	cmp r7, r0
	bhi .L080DEF44
	ldr r1, [r4, #0x14]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r1, [r4, #0x18]
	ldr r0, [r0]
	adds r3, r1, r0
	b .L080DEF46
	.align 2, 0
.L080DEF40: .4byte gUnk_080F19A0
.L080DEF44:
	ldr r3, .L080DEF5C @ =gUnk_080F19A0
.L080DEF46:
	ldr r0, [r4, #0x10]
	cmp sb, r0
	bhi .L080DEF60
	ldr r1, [r4, #0x14]
	mov r6, sb
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r1, [r4, #0x18]
	ldr r0, [r0]
	adds r1, r1, r0
	b .L080DEF62
	.align 2, 0
.L080DEF5C: .4byte gUnk_080F19A0
.L080DEF60:
	ldr r1, .L080DEF9C @ =gUnk_080F19A0
.L080DEF62:
	movs r4, #0
	movs r0, #0xdb
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	cmp r0, #0
	bne .L080DEF74
	bl .L080E007C
.L080DEF74:
	cmp r5, #0
	bne .L080DEF7C
	bl .L080E007C
.L080DEF7C:
	cmp r2, #0
	bne .L080DEF84
	bl .L080E007C
.L080DEF84:
	cmp r3, #0
	bne .L080DEFA0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	str r3, [sp, #0xc]
	adds r1, r5, #0
	movs r3, #0
	bl func_08050E0C
	b .L080DEFC2
	.align 2, 0
.L080DEF9C: .4byte gUnk_080F19A0
.L080DEFA0:
	cmp r1, #0
	bne .L080DEFB4
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	adds r1, r5, #0
	bl func_08050E0C
	b .L080DEFC2
.L080DEFB4:
	str r1, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	adds r1, r5, #0
	bl func_08050E0C
.L080DEFC2:
	movs r1, #0xd9
	lsls r1, r1, #2
	add r1, r8
	movs r0, #7
	bl .L080E007A
.L080DEFCE:
	mov r3, r8
	adds r3, #0x30
	movs r2, #0xe0
	lsls r2, r2, #1
	add r2, r8
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r0, [r0]
	mov sl, r0
	cmp r1, #0
	beq .L080DEFEC
	subs r0, r1, #1
	str r0, [r2]
.L080DEFEC:
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r0, [r0]
	mov sb, r0
	cmp r1, #0
	beq .L080DF000
	subs r0, r1, #1
	str r0, [r2]
.L080DF000:
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r7, [r0]
	cmp r1, #0
	beq .L080DF012
	subs r0, r1, #1
	str r0, [r2]
.L080DF012:
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r5, [r0]
	cmp r1, #0
	beq .L080DF024
	subs r0, r1, #1
	str r0, [r2]
.L080DF024:
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r3, [r0]
	cmp r1, #0
	beq .L080DF036
	subs r0, r1, #1
	str r0, [r2]
.L080DF036:
	mov r0, r8
	adds r0, #0xc
	ldr r1, [r0, #0x10]
	adds r4, r0, #0
	cmp r3, r1
	bhi .L080DF050
	ldr r1, [r4, #0x14]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r1, [r4, #0x18]
	ldr r0, [r0]
	adds r6, r1, r0
	b .L080DF052
.L080DF050:
	ldr r6, .L080DF068 @ =gUnk_080F19A0
.L080DF052:
	ldr r0, [r4, #0x10]
	cmp r5, r0
	bhi .L080DF06C
	ldr r1, [r4, #0x14]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r1, [r4, #0x18]
	ldr r0, [r0]
	adds r2, r1, r0
	b .L080DF06E
	.align 2, 0
.L080DF068: .4byte gUnk_080F19A0
.L080DF06C:
	ldr r2, .L080DF084 @ =gUnk_080F19A0
.L080DF06E:
	ldr r0, [r4, #0x10]
	cmp r7, r0
	bhi .L080DF088
	ldr r1, [r4, #0x14]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r1, [r4, #0x18]
	ldr r0, [r0]
	adds r3, r1, r0
	b .L080DF08A
	.align 2, 0
.L080DF084: .4byte gUnk_080F19A0
.L080DF088:
	ldr r3, .L080DF0A0 @ =gUnk_080F19A0
.L080DF08A:
	ldr r0, [r4, #0x10]
	cmp sb, r0
	bhi .L080DF0A4
	ldr r1, [r4, #0x14]
	mov r7, sb
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r1, [r4, #0x18]
	ldr r0, [r0]
	adds r5, r1, r0
	b .L080DF0A6
	.align 2, 0
.L080DF0A0: .4byte gUnk_080F19A0
.L080DF0A4:
	ldr r5, .L080DF0BC @ =gUnk_080F19A0
.L080DF0A6:
	ldr r0, [r4, #0x10]
	cmp sl, r0
	bhi .L080DF0C0
	ldr r1, [r4, #0x14]
	mov r7, sl
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r1, [r4, #0x18]
	ldr r0, [r0]
	adds r1, r1, r0
	b .L080DF0C2
	.align 2, 0
.L080DF0BC: .4byte gUnk_080F19A0
.L080DF0C0:
	ldr r1, .L080DF0FC @ =gUnk_080F19A0
.L080DF0C2:
	movs r4, #0
	movs r0, #0xdb
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	cmp r0, #0
	bne .L080DF0D4
	bl .L080E007C
.L080DF0D4:
	cmp r6, #0
	bne .L080DF0DC
	bl .L080E007C
.L080DF0DC:
	cmp r2, #0
	bne .L080DF0E4
	bl .L080E007C
.L080DF0E4:
	cmp r3, #0
	bne .L080DF100
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	str r3, [sp, #0xc]
	adds r1, r6, #0
	movs r3, #0
	bl func_08050E0C
	b .L080DF12A
	.align 2, 0
.L080DF0FC: .4byte gUnk_080F19A0
.L080DF100:
	cmp r5, #0
	bne .L080DF108
	str r4, [sp]
	b .L080DF10E
.L080DF108:
	cmp r1, #0
	bne .L080DF11C
	str r5, [sp]
.L080DF10E:
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	adds r1, r6, #0
	bl func_08050E0C
	b .L080DF12A
.L080DF11C:
	str r5, [sp]
	str r1, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	adds r1, r6, #0
	bl func_08050E0C
.L080DF12A:
	movs r1, #0xd9
	lsls r1, r1, #2
	add r1, r8
	movs r0, #7
	bl .L080E007A
.L080DF136:
	mov r3, r8
	adds r3, #0x30
	movs r2, #0xe0
	lsls r2, r2, #1
	add r2, r8
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r0, [r0]
	mov ip, r0
	cmp r1, #0
	beq .L080DF154
	subs r0, r1, #1
	str r0, [r2]
.L080DF154:
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r0, [r0]
	mov sl, r0
	cmp r1, #0
	beq .L080DF168
	subs r0, r1, #1
	str r0, [r2]
.L080DF168:
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r0, [r0]
	mov sb, r0
	cmp r1, #0
	beq .L080DF17C
	subs r0, r1, #1
	str r0, [r2]
.L080DF17C:
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r6, [r0]
	cmp r1, #0
	beq .L080DF18E
	subs r0, r1, #1
	str r0, [r2]
.L080DF18E:
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r5, [r0]
	cmp r1, #0
	beq .L080DF1A0
	subs r0, r1, #1
	str r0, [r2]
.L080DF1A0:
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r3, [r0]
	cmp r1, #0
	beq .L080DF1B2
	subs r0, r1, #1
	str r0, [r2]
.L080DF1B2:
	mov r0, r8
	adds r0, #0xc
	ldr r1, [r0, #0x10]
	adds r4, r0, #0
	cmp r3, r1
	bhi .L080DF1CC
	ldr r1, [r4, #0x14]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r1, [r4, #0x18]
	ldr r0, [r0]
	adds r7, r1, r0
	b .L080DF1CE
.L080DF1CC:
	ldr r7, .L080DF1E4 @ =gUnk_080F19A0
.L080DF1CE:
	ldr r0, [r4, #0x10]
	cmp r5, r0
	bhi .L080DF1E8
	ldr r1, [r4, #0x14]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r1, [r4, #0x18]
	ldr r0, [r0]
	adds r2, r1, r0
	b .L080DF1EA
	.align 2, 0
.L080DF1E4: .4byte gUnk_080F19A0
.L080DF1E8:
	ldr r2, .L080DF200 @ =gUnk_080F19A0
.L080DF1EA:
	ldr r0, [r4, #0x10]
	cmp r6, r0
	bhi .L080DF204
	ldr r1, [r4, #0x14]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r1, [r4, #0x18]
	ldr r0, [r0]
	adds r3, r1, r0
	b .L080DF206
	.align 2, 0
.L080DF200: .4byte gUnk_080F19A0
.L080DF204:
	ldr r3, .L080DF21C @ =gUnk_080F19A0
.L080DF206:
	ldr r0, [r4, #0x10]
	cmp sb, r0
	bhi .L080DF220
	ldr r1, [r4, #0x14]
	mov r5, sb
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r1, [r4, #0x18]
	ldr r0, [r0]
	adds r6, r1, r0
	b .L080DF222
	.align 2, 0
.L080DF21C: .4byte gUnk_080F19A0
.L080DF220:
	ldr r6, .L080DF238 @ =gUnk_080F19A0
.L080DF222:
	ldr r0, [r4, #0x10]
	cmp sl, r0
	bhi .L080DF23C
	ldr r1, [r4, #0x14]
	mov r5, sl
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r1, [r4, #0x18]
	ldr r0, [r0]
	adds r5, r1, r0
	b .L080DF23E
	.align 2, 0
.L080DF238: .4byte gUnk_080F19A0
.L080DF23C:
	ldr r5, .L080DF258 @ =gUnk_080F19A0
.L080DF23E:
	ldr r0, [r4, #0x10]
	cmp ip, r0
	bhi .L080DF25C
	ldr r0, [r4, #0x14]
	mov sb, r0
	mov r1, ip
	lsls r0, r1, #2
	add r0, sb
	ldr r1, [r4, #0x18]
	ldr r0, [r0]
	adds r1, r1, r0
	b .L080DF25E
	.align 2, 0
.L080DF258: .4byte gUnk_080F19A0
.L080DF25C:
	ldr r1, .L080DF298 @ =gUnk_080F19A0
.L080DF25E:
	movs r0, #0xdb
	lsls r0, r0, #2
	add r0, r8
	ldr r4, [r0]
	cmp r4, #0
	bne .L080DF26E
	bl .L080E007C
.L080DF26E:
	cmp r7, #0
	bne .L080DF276
	bl .L080E007C
.L080DF276:
	cmp r2, #0
	bne .L080DF27E
	bl .L080E007C
.L080DF27E:
	cmp r3, #0
	bne .L080DF29C
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	str r3, [sp, #0xc]
	adds r0, r4, #0
	adds r1, r7, #0
	movs r3, #0
	bl func_08050E0C
	b .L080DF2E0
	.align 2, 0
.L080DF298: .4byte gUnk_080F19A0
.L080DF29C:
	cmp r6, #0
	bne .L080DF2AA
	str r6, [sp]
	str r6, [sp, #4]
	str r6, [sp, #8]
	str r6, [sp, #0xc]
	b .L080DF2C4
.L080DF2AA:
	cmp r5, #0
	bne .L080DF2B8
	str r6, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	str r5, [sp, #0xc]
	b .L080DF2C4
.L080DF2B8:
	cmp r1, #0
	bne .L080DF2CE
	str r6, [sp]
	str r5, [sp, #4]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
.L080DF2C4:
	adds r0, r4, #0
	adds r1, r7, #0
	bl func_08050E0C
	b .L080DF2E0
.L080DF2CE:
	str r6, [sp]
	str r5, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	adds r0, r4, #0
	adds r1, r7, #0
	bl func_08050E0C
.L080DF2E0:
	movs r1, #0xd9
	lsls r1, r1, #2
	add r1, r8
	movs r0, #7
	bl .L080E007A
.L080DF2EC:
	movs r2, #0xe0
	lsls r2, r2, #1
	add r2, r8
	ldr r0, [r2]
	lsls r0, r0, #2
	add r0, r8
	ldr r1, [r0, #0x2c]
	movs r0, #0xe6
	lsls r0, r0, #2
	add r0, r8
	strh r1, [r0]
	ldr r0, [r2]
	cmp r0, #0
	beq .L080DF30C
	subs r0, #1
	str r0, [r2]
.L080DF30C:
	movs r1, #0xd9
	lsls r1, r1, #2
	add r1, r8
	movs r0, #8
	bl .L080E007A
.L080DF318:
	mov r3, r8
	adds r3, #0x30
	movs r2, #0xe0
	lsls r2, r2, #1
	add r2, r8
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r4, [r0]
	cmp r1, #0
	beq .L080DF334
	subs r0, r1, #1
	str r0, [r2]
.L080DF334:
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r3, [r0]
	cmp r1, #0
	beq .L080DF346
	subs r0, r1, #1
	str r0, [r2]
.L080DF346:
	cmp r3, #4
	bls .L080DF34E
	bl .L080E007C
.L080DF34E:
	lsls r0, r3, #2
	ldr r1, .L080DF358 @ =.L080DF35C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L080DF358: .4byte .L080DF35C
.L080DF35C: @ jump table
	.4byte .L080DF370 @ case 0
	.4byte .L080DF376 @ case 1
	.4byte .L080DF37C @ case 2
	.4byte .L080DF380 @ case 3
	.4byte .L080DF384 @ case 4
.L080DF370:
	movs r5, #2
	movs r3, #0
	b .L080DF388
.L080DF376:
	movs r5, #1
	movs r3, #0
	b .L080DF388
.L080DF37C:
	movs r5, #2
	b .L080DF386
.L080DF380:
	movs r5, #1
	b .L080DF386
.L080DF384:
	movs r5, #0
.L080DF386:
	movs r3, #1
.L080DF388:
	cmp r4, #1
	beq .L080DF3A8
	cmp r4, #1
	bgt .L080DF398
	cmp r4, #0
	beq .L080DF3A0
	bl .L080E007C
.L080DF398:
	cmp r4, #2
	beq .L080DF3B0
	bl .L080E007C
.L080DF3A0:
	ldr r1, .L080DF3A4 @ =0x00001112
	b .L080DF3B2
	.align 2, 0
.L080DF3A4: .4byte 0x00001112
.L080DF3A8:
	ldr r1, .L080DF3AC @ =0x00000889
	b .L080DF3B2
	.align 2, 0
.L080DF3AC: .4byte 0x00000889
.L080DF3B0:
	ldr r1, .L080DF3E8 @ =0x00000444
.L080DF3B2:
	movs r0, #0xdc
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	adds r2, r5, #0
	bl func_08009378
	movs r1, #0xd9
	lsls r1, r1, #2
	add r1, r8
	movs r0, #5
	str r0, [r1]
	movs r1, #0xe8
	lsls r1, r1, #2
	add r1, r8
	movs r0, #0
	strb r0, [r1]
	movs r1, #0
	cmp r5, #2
	bne .L080DF3DC
	movs r1, #1
.L080DF3DC:
	ldr r0, .L080DF3EC @ =0x000003A1
	add r0, r8
	strb r1, [r0]
	bl .L080E007C
	.align 2, 0
.L080DF3E8: .4byte 0x00000444
.L080DF3EC: .4byte 0x000003A1
.L080DF3F0:
	mov r3, r8
	adds r3, #0x30
	movs r2, #0xe0
	lsls r2, r2, #1
	add r2, r8
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r4, [r0]
	cmp r1, #0
	beq .L080DF40C
	subs r0, r1, #1
	str r0, [r2]
.L080DF40C:
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r3, [r0]
	cmp r1, #0
	beq .L080DF41E
	subs r0, r1, #1
	str r0, [r2]
.L080DF41E:
	cmp r3, #4
	bls .L080DF426
	bl .L080E007C
.L080DF426:
	lsls r0, r3, #2
	ldr r1, .L080DF430 @ =.L080DF434
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L080DF430: .4byte .L080DF434
.L080DF434: @ jump table
	.4byte .L080DF448 @ case 0
	.4byte .L080DF44E @ case 1
	.4byte .L080DF454 @ case 2
	.4byte .L080DF458 @ case 3
	.4byte .L080DF45C @ case 4
.L080DF448:
	movs r6, #2
	movs r3, #0
	b .L080DF460
.L080DF44E:
	movs r6, #1
	movs r3, #0
	b .L080DF460
.L080DF454:
	movs r6, #2
	b .L080DF45E
.L080DF458:
	movs r6, #1
	b .L080DF45E
.L080DF45C:
	movs r6, #0
.L080DF45E:
	movs r3, #1
.L080DF460:
	cmp r4, #1
	beq .L080DF480
	cmp r4, #1
	bgt .L080DF470
	cmp r4, #0
	beq .L080DF478
	bl .L080E007C
.L080DF470:
	cmp r4, #2
	beq .L080DF488
	bl .L080E007C
.L080DF478:
	ldr r1, .L080DF47C @ =0x00001112
	b .L080DF48A
	.align 2, 0
.L080DF47C: .4byte 0x00001112
.L080DF480:
	ldr r1, .L080DF484 @ =0x00000889
	b .L080DF48A
	.align 2, 0
.L080DF484: .4byte 0x00000889
.L080DF488:
	ldr r1, .L080DF4F4 @ =0x00000444
.L080DF48A:
	movs r0, #0xdc
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	adds r2, r6, #0
	bl func_0800934C
	movs r1, #0xd9
	lsls r1, r1, #2
	add r1, r8
	movs r0, #6
	str r0, [r1]
	movs r1, #0xe8
	lsls r1, r1, #2
	add r1, r8
	movs r0, #0
	strb r0, [r1]
	movs r1, #0
	cmp r6, #2
	bne .L080DF4B4
	movs r1, #1
.L080DF4B4:
	ldr r0, .L080DF4F8 @ =0x000003A1
	add r0, r8
	strb r1, [r0]
	mov r5, r8
	adds r5, #4
	adds r0, r5, #0
	bl func_08008918
	adds r4, r0, #0
	adds r0, r5, #0
	bl func_08008918
	ldrh r0, [r0]
	movs r2, #0xe0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4]
	cmp r6, #1
	bne .L080DF4FC
	adds r0, r5, #0
	bl func_08008918
	adds r4, r0, #0
	adds r4, #0x50
	adds r0, r5, #0
	bl func_08008918
	adds r0, #0x50
	ldrh r0, [r0]
	movs r1, #0x80
	b .L080DF512
	.align 2, 0
.L080DF4F4: .4byte 0x00000444
.L080DF4F8: .4byte 0x000003A1
.L080DF4FC:
	adds r0, r5, #0
	bl func_08008918
	adds r4, r0, #0
	adds r4, #0x50
	adds r0, r5, #0
	bl func_08008918
	adds r0, #0x50
	ldrh r0, [r0]
	movs r1, #0xc0
.L080DF512:
	orrs r0, r1
	strh r0, [r4]
	bl .L080E007C
.L080DF51A:
	mov r3, r8
	adds r3, #0x30
	movs r2, #0xe0
	lsls r2, r2, #1
	add r2, r8
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r0, [r0]
	str r0, [sp, #0x2c]
	cmp r1, #0
	beq .L080DF538
	subs r0, r1, #1
	str r0, [r2]
.L080DF538:
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r4, [r0]
	cmp r1, #0
	beq .L080DF54A
	subs r0, r1, #1
	str r0, [r2]
.L080DF54A:
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r3, [r0]
	cmp r1, #0
	beq .L080DF55C
	subs r0, r1, #1
	str r0, [r2]
.L080DF55C:
	movs r0, #0xda
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	ldr r5, [r0]
	mov sl, r5
	movs r6, #0xb0
	add sl, r6
	add r6, sp, #0x10
	ldr r7, .L080DF5E0 @ =0x000003FF
	mov sb, r7
	mov r1, sb
	ands r3, r1
	ldrh r2, [r6]
	ldr r5, .L080DF5E4 @ =0xFFFFFC00
	adds r1, r5, #0
	ands r1, r2
	orrs r1, r3
	strh r1, [r6]
	lsls r4, r4, #0x10
	lsrs r2, r4, #0x10
	movs r7, #0x3f
	mov ip, r7
	mov r1, ip
	ands r2, r1
	lsls r2, r2, #2
	ldrb r7, [r6, #1]
	mov r8, r7
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
	ldr r4, [sp, #0x2c]
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
	mov r4, sl
	ldr r2, [r4]
	adds r1, r6, #0
	bl _call_via_r2
	bl .L080E0080
	.align 2, 0
.L080DF5E0: .4byte 0x000003FF
.L080DF5E4: .4byte 0xFFFFFC00
.L080DF5E8:
	mov r6, r8
	adds r6, #0x30
	movs r5, #0xe0
	lsls r5, r5, #1
	add r5, r8
	ldr r1, [r5]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r6, r0
	ldr r3, [r0]
	cmp r1, #0
	beq .L080DF604
	subs r0, r1, #1
	str r0, [r5]
.L080DF604:
	ldr r1, [r5]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r6, r0
	ldr r2, [r0]
	cmp r1, #0
	beq .L080DF616
	subs r0, r1, #1
	str r0, [r5]
.L080DF616:
	ldr r4, [r5]
	lsls r0, r4, #2
	subs r0, #4
	adds r0, r6, r0
	ldr r6, [r0]
	cmp r4, #0
	beq .L080DF628
	subs r0, r4, #1
	str r0, [r5]
.L080DF628:
	movs r0, #0xda
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r4, [r1, #0x24]
	bl sub_080DFE84
.L080DF638:
	movs r0, #0xda
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r1, [r1, #0x28]
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080DF652
	bl .L080E007C
.L080DF652:
	movs r1, #0xd9
	lsls r1, r1, #2
	add r1, r8
	movs r0, #0xa
	bl .L080E007A
.L080DF65E:
	mov r3, r8
	adds r3, #0x30
	movs r2, #0xe0
	lsls r2, r2, #1
	add r2, r8
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r4, [r0]
	cmp r1, #0
	beq .L080DF67A
	subs r0, r1, #1
	str r0, [r2]
.L080DF67A:
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r3, [r0]
	cmp r1, #0
	beq .L080DF68C
	subs r0, r1, #1
	str r0, [r2]
.L080DF68C:
	lsls r0, r4, #0x10
	lsrs r1, r0, #0x10
	movs r0, #0xdd
	lsls r0, r0, #2
	add r0, r8
	cmp r3, #1
	beq .L080DF738
	cmp r3, #1
	bgt .L080DF6A6
	cmp r3, #0
	beq .L080DF730
	bl .L080E0080
.L080DF6A6:
	cmp r3, #2
	beq .L080DF6AE
	bl .L080E0080
.L080DF6AE:
	b .L080DF740
.L080DF6B0:
	movs r0, #0xdd
	lsls r0, r0, #2
	add r0, r8
	bl func_08008BE0
	bl .L080E0080
.L080DF6BE:
	ldr r0, [r4]
	b .L080DF716
.L080DF6C2:
	mov r3, r8
	adds r3, #0x30
	movs r2, #0xe0
	lsls r2, r2, #1
	add r2, r8
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r7, [r0]
	cmp r1, #0
	beq .L080DF6DE
	subs r0, r1, #1
	str r0, [r2]
.L080DF6DE:
	ldr r1, [r2]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r6, [r0]
	cmp r1, #0
	beq .L080DF6F0
	subs r0, r1, #1
	str r0, [r2]
.L080DF6F0:
	movs r0, #0xe2
	lsls r0, r0, #2
	add r0, r8
	ldr r4, [r0]
	ldr r5, [r0, #4]
	lsls r7, r7, #0x10
	cmp r4, r5
	beq .L080DF712
.L080DF700:
	ldr r0, [r4]
	bl func_08008CD0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080DF6BE
	adds r4, #4
	cmp r4, r5
	bne .L080DF700
.L080DF712:
	subs r0, r5, #4
	ldr r0, [r0]
.L080DF716:
	lsrs r1, r7, #0x10
	cmp r6, #1
	beq .L080DF738
	cmp r6, #1
	bgt .L080DF728
	cmp r6, #0
	beq .L080DF730
	bl .L080E0080
.L080DF728:
	cmp r6, #2
	beq .L080DF740
	bl .L080E0080
.L080DF730:
	bl func_08008B6C
	bl .L080E0080
.L080DF738:
	bl func_08008B88
	bl .L080E0080
.L080DF740:
	bl func_08008BB0
	bl .L080E0080
.L080DF748:
	bl func_08008DE8
	bl .L080E0080
.L080DF750:
	mov r5, r8
	adds r5, #0x30
	movs r3, #0xe0
	lsls r3, r3, #1
	add r3, r8
	ldr r1, [r3]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r5, r0
	ldr r0, [r0]
	str r0, [sp, #0x28]
	cmp r1, #0
	beq .L080DF76E
	subs r0, r1, #1
	str r0, [r3]
.L080DF76E:
	ldr r1, [r3]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r5, r0
	ldr r0, [r0]
	mov sl, r0
	cmp r1, #0
	beq .L080DF782
	subs r0, r1, #1
	str r0, [r3]
.L080DF782:
	ldr r1, [r3]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r5, r0
	ldr r4, [r0]
	cmp r1, #0
	beq .L080DF794
	subs r0, r1, #1
	str r0, [r3]
.L080DF794:
	ldr r2, [r3]
	lsls r0, r2, #2
	subs r0, #4
	adds r0, r5, r0
	ldr r6, [r0]
	cmp r2, #0
	beq .L080DF7A6
	subs r0, r2, #1
	str r0, [r3]
.L080DF7A6:
	movs r5, #0xda
	lsls r5, r5, #2
	add r5, r8
	ldr r0, [r5]
	ldr r1, [r0]
	ldr r2, [r1, #0x40]
	adds r1, r6, #0
	bl _call_via_r2
	adds r7, r0, #0
	cmp r7, #0
	bne .L080DF7C2
	bl .L080E0080
.L080DF7C2:
	ldr r0, [r5]
	ldr r1, [r0]
	ldr r1, [r1, #0x14]
	bl _call_via_r1
	add r1, sp, #0x18
	ldr r5, .L080DF854 @ =0x000003FF
	mov r8, r5
	mov r6, r8
	ands r0, r6
	ldrh r3, [r1]
	ldr r5, .L080DF858 @ =0xFFFFFC00
	adds r2, r5, #0
	ands r2, r3
	orrs r2, r0
	strh r2, [r1]
	lsls r4, r4, #0x10
	lsrs r2, r4, #0x10
	movs r0, #0x3f
	mov sb, r0
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
	mov r4, sl
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
	mov r0, r8
	ands r2, r0
	ldrh r0, [r1, #4]
	ands r5, r0
	orrs r5, r2
	strh r5, [r1, #4]
	add r4, sp, #0x10
	adds r0, r4, #0
	movs r2, #6
	bl memcpy
	add r1, sp, #0x28
	ldrb r1, [r1]
	strb r1, [r4, #6]
	adds r0, r7, #0
	add r1, sp, #0x10
	bl SetLocation__12AActorEntityRC13ActorLocation
	ldr r0, [r7, #0x14]
	ldr r1, [r0, #0x20]
	adds r0, r7, #0
	bl _call_via_r1
	bl .L080E0080
	.align 2, 0
.L080DF854: .4byte 0x000003FF
.L080DF858: .4byte 0xFFFFFC00
.L080DF85C:
	mov r3, r8
	adds r3, #0x30
	movs r1, #0xe0
	lsls r1, r1, #1
	add r1, r8
	ldr r2, [r1]
	lsls r0, r2, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r6, [r0]
	cmp r2, #0
	beq .L080DF878
	subs r0, r2, #1
	str r0, [r1]
.L080DF878:
	ldr r2, [r1]
	lsls r0, r2, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r5, [r0]
	cmp r2, #0
	beq .L080DF88A
	subs r0, r2, #1
	str r0, [r1]
.L080DF88A:
	ldr r2, [r1]
	lsls r0, r2, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r3, [r0]
	cmp r2, #0
	beq .L080DF89C
	subs r0, r2, #1
	str r0, [r1]
.L080DF89C:
	movs r0, #0xda
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r1, #0x40]
	adds r1, r3, #0
	bl _call_via_r2
	adds r4, r0, #0
	cmp r4, #0
	bne .L080DF8B6
	b .L080E0080
.L080DF8B6:
	adds r1, r5, #0
	bl func_080323E0
	adds r0, r4, #0
	adds r1, r6, #0
	bl func_080323F0
	b .L080E0080
.L080DF8C6:
	mov r0, r8
	adds r0, #0x30
	movs r2, #0xe0
	lsls r2, r2, #1
	add r2, r8
	ldr r3, [r2]
	lsls r1, r3, #2
	subs r1, #4
	adds r1, r0, r1
	ldr r6, [r1]
	adds r5, r0, #0
	adds r4, r2, #0
	cmp r3, #0
	beq .L080DF8E6
	subs r0, r3, #1
	str r0, [r4]
.L080DF8E6:
	movs r0, #0xda
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r1, #0x40]
	adds r1, r6, #0
	bl _call_via_r2
	movs r1, #0
	cmp r0, #0
	beq .L080DF900
	ldr r1, [r0, #8]
.L080DF900:
	asrs r2, r1, #0x10
	b .L080DF9DA
.L080DF904:
	mov r0, r8
	adds r0, #0x30
	movs r2, #0xe0
	lsls r2, r2, #1
	add r2, r8
	ldr r3, [r2]
	lsls r1, r3, #2
	subs r1, #4
	adds r1, r0, r1
	ldr r6, [r1]
	adds r5, r0, #0
	adds r4, r2, #0
	cmp r3, #0
	beq .L080DF924
	subs r0, r3, #1
	str r0, [r4]
.L080DF924:
	movs r0, #0xda
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r1, #0x40]
	adds r1, r6, #0
	bl _call_via_r2
	movs r1, #0
	cmp r0, #0
	beq .L080DF900
	ldr r1, [r0, #0xc]
	b .L080DF900
.L080DF940:
	mov r3, r8
	adds r3, #0x30
	movs r1, #0xe0
	lsls r1, r1, #1
	add r1, r8
	ldr r2, [r1]
	lsls r0, r2, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r4, [r0]
	cmp r2, #0
	beq .L080DF95C
	subs r0, r2, #1
	str r0, [r1]
.L080DF95C:
	ldr r2, [r1]
	lsls r0, r2, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r3, [r0]
	cmp r2, #0
	beq .L080DF96E
	subs r0, r2, #1
	str r0, [r1]
.L080DF96E:
	movs r0, #0xda
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r1, #0x40]
	adds r1, r3, #0
	bl _call_via_r2
	adds r1, r0, #0
	cmp r1, #0
	bne .L080DF988
	b .L080E0080
.L080DF988:
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, r4
	bne .L080DF992
	b .L080E0080
.L080DF992:
	adds r0, r1, #0
	adds r1, r4, #0
	bl SetAnimFacing__12AActorEntityUi
	b .L080E0080
.L080DF99C:
	mov r0, r8
	adds r0, #0x30
	movs r2, #0xe0
	lsls r2, r2, #1
	add r2, r8
	ldr r3, [r2]
	lsls r1, r3, #2
	subs r1, #4
	adds r1, r0, r1
	ldr r6, [r1]
	adds r5, r0, #0
	adds r4, r2, #0
	cmp r3, #0
	beq .L080DF9BC
	subs r0, r3, #1
	str r0, [r4]
.L080DF9BC:
	movs r0, #0xda
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r1, #0x40]
	adds r1, r6, #0
	bl _call_via_r2
	cmp r0, #0
	beq .L080DF9D8
	adds r0, #0x20
	ldrb r2, [r0]
	b .L080DF9DA
.L080DF9D8:
	movs r2, #0
.L080DF9DA:
	ldr r1, [r4]
	cmp r1, #0x63
	bls .L080DF9E2
	b .L080E0080
.L080DF9E2:
	lsls r0, r1, #2
	adds r0, r5, r0
	str r2, [r0]
	adds r0, r1, #1
	str r0, [r4]
	b .L080E0080
.L080DF9EE:
	mov r4, r8
	adds r4, #0x30
	movs r3, #0xe0
	lsls r3, r3, #1
	add r3, r8
	ldr r1, [r3]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r4, r0
	ldr r6, [r0]
	cmp r1, #0
	beq .L080DFA0A
	subs r0, r1, #1
	str r0, [r3]
.L080DFA0A:
	ldr r2, [r3]
	lsls r0, r2, #2
	subs r0, #4
	adds r0, r4, r0
	ldr r5, [r0]
	cmp r2, #0
	beq .L080DFA1C
	subs r0, r2, #1
	str r0, [r3]
.L080DFA1C:
	ldr r2, [r3]
	lsls r0, r2, #2
	subs r0, #4
	adds r0, r4, r0
	ldr r4, [r0]
	cmp r2, #0
	beq .L080DFA2E
	subs r0, r2, #1
	str r0, [r3]
.L080DFA2E:
	movs r0, #0xda
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r1, #0x40]
	adds r1, r4, #0
	bl _call_via_r2
	cmp r0, #0
	bne .L080DFA46
	b .L080E0080
.L080DFA46:
	lsls r2, r6, #0x10
	adds r1, r5, #0
	bl func_08032308
	b .L080E0080
.L080DFA50:
	mov r4, r8
	adds r4, #0x30
	movs r3, #0xe0
	lsls r3, r3, #1
	add r3, r8
	ldr r1, [r3]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r4, r0
	ldr r6, [r0]
	cmp r1, #0
	beq .L080DFA6C
	subs r0, r1, #1
	str r0, [r3]
.L080DFA6C:
	ldr r2, [r3]
	lsls r0, r2, #2
	subs r0, #4
	adds r0, r4, r0
	ldr r5, [r0]
	cmp r2, #0
	beq .L080DFA7E
	subs r0, r2, #1
	str r0, [r3]
.L080DFA7E:
	ldr r2, [r3]
	lsls r0, r2, #2
	subs r0, #4
	adds r0, r4, r0
	ldr r4, [r0]
	cmp r2, #0
	beq .L080DFA90
	subs r0, r2, #1
	str r0, [r3]
.L080DFA90:
	movs r0, #0xda
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r1, #0x40]
	adds r1, r4, #0
	bl _call_via_r2
	cmp r0, #0
	bne .L080DFAA8
	b .L080E0080
.L080DFAA8:
	lsls r2, r6, #0x10
	adds r1, r5, #0
	bl func_0803233C
	b .L080E0080
.L080DFAB2:
	mov r4, r8
	adds r4, #0x30
	movs r3, #0xe0
	lsls r3, r3, #1
	add r3, r8
	ldr r1, [r3]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r4, r0
	ldr r6, [r0]
	cmp r1, #0
	beq .L080DFACE
	subs r0, r1, #1
	str r0, [r3]
.L080DFACE:
	ldr r2, [r3]
	lsls r0, r2, #2
	subs r0, #4
	adds r0, r4, r0
	ldr r5, [r0]
	cmp r2, #0
	beq .L080DFAE0
	subs r0, r2, #1
	str r0, [r3]
.L080DFAE0:
	ldr r2, [r3]
	lsls r0, r2, #2
	subs r0, #4
	adds r0, r4, r0
	ldr r4, [r0]
	cmp r2, #0
	beq .L080DFAF2
	subs r0, r2, #1
	str r0, [r3]
.L080DFAF2:
	movs r0, #0xda
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r1, #0x40]
	adds r1, r4, #0
	bl _call_via_r2
	cmp r0, #0
	bne .L080DFB0A
	b .L080E0080
.L080DFB0A:
	adds r1, r5, #0
	adds r2, r6, #0
	bl func_08032308
	b .L080E0080
.L080DFB14:
	mov r4, r8
	adds r4, #0x30
	movs r3, #0xe0
	lsls r3, r3, #1
	add r3, r8
	ldr r1, [r3]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r4, r0
	ldr r6, [r0]
	cmp r1, #0
	beq .L080DFB30
	subs r0, r1, #1
	str r0, [r3]
.L080DFB30:
	ldr r2, [r3]
	lsls r0, r2, #2
	subs r0, #4
	adds r0, r4, r0
	ldr r5, [r0]
	cmp r2, #0
	beq .L080DFB42
	subs r0, r2, #1
	str r0, [r3]
.L080DFB42:
	ldr r2, [r3]
	lsls r0, r2, #2
	subs r0, #4
	adds r0, r4, r0
	ldr r4, [r0]
	cmp r2, #0
	beq .L080DFB54
	subs r0, r2, #1
	str r0, [r3]
.L080DFB54:
	movs r0, #0xda
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r1, #0x40]
	adds r1, r4, #0
	bl _call_via_r2
	cmp r0, #0
	bne .L080DFB6C
	b .L080E0080
.L080DFB6C:
	adds r1, r5, #0
	adds r2, r6, #0
	bl func_0803233C
	b .L080E0080
.L080DFB76:
	movs r1, #0xe0
	lsls r1, r1, #1
	add r1, r8
	ldr r2, [r1]
	lsls r0, r2, #2
	add r0, r8
	ldr r3, [r0, #0x2c]
	cmp r2, #0
	beq .L080DFB8C
	subs r0, r2, #1
	str r0, [r1]
.L080DFB8C:
	movs r0, #0xda
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r1, #0x40]
	adds r1, r3, #0
	bl _call_via_r2
	movs r1, #0xe7
	lsls r1, r1, #2
	add r1, r8
	str r0, [r1]
	cmp r0, #0
	bne .L080DFBAC
	b .L080E007C
.L080DFBAC:
	movs r1, #0xd9
	lsls r1, r1, #2
	add r1, r8
	movs r0, #9
	b .L080E007A
.L080DFBB6:
	mov r3, r8
	adds r3, #0x30
	movs r1, #0xe0
	lsls r1, r1, #1
	add r1, r8
	ldr r2, [r1]
	lsls r0, r2, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r4, [r0]
	cmp r2, #0
	beq .L080DFBD2
	subs r0, r2, #1
	str r0, [r1]
.L080DFBD2:
	ldr r2, [r1]
	lsls r0, r2, #2
	subs r0, #4
	adds r0, r3, r0
	ldr r3, [r0]
	cmp r2, #0
	beq .L080DFBE4
	subs r0, r2, #1
	str r0, [r1]
.L080DFBE4:
	movs r0, #0xda
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r1, #0x40]
	adds r1, r3, #0
	bl _call_via_r2
	adds r1, r0, #0
	cmp r1, #0
	bne .L080DFBFE
	b .L080E0080
.L080DFBFE:
	ldrh r0, [r1, #0x22]
	cmp r0, r4
	bne .L080DFC06
	b .L080E0080
.L080DFC06:
	adds r0, r1, #0
	adds r1, r4, #0
	bl SetAnim__12AActorEntityUi
	b .L080E0080
.L080DFC10:
	movs r1, #0xe0
	lsls r1, r1, #1
	add r1, r8
	ldr r0, [r1]
	cmp r0, #0
	bne .L080DFC1E
	b .L080E0080
.L080DFC1E:
	subs r0, #1
	str r0, [r1]
	b .L080E0080
.L080DFC24:
	movs r1, #0xe0
	lsls r1, r1, #1
	add r1, r8
	ldr r2, [r1]
	lsls r0, r2, #2
	add r0, r8
	ldr r3, [r0, #0x2c]
	cmp r2, #0
	beq .L080DFC3A
	subs r0, r2, #1
	str r0, [r1]
.L080DFC3A:
	movs r0, #0xda
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r1, #0x40]
	adds r1, r3, #0
	bl _call_via_r2
	cmp r0, #0
	bne .L080DFC52
	b .L080E0080
.L080DFC52:
	movs r1, #0x8d
	lsls r1, r1, #2
	bl SetMap__7AEntityUi
	b .L080E0080
.L080DFC5C:
	mov r4, r8
	adds r4, #0x30
	movs r3, #0xe0
	lsls r3, r3, #1
	add r3, r8
	ldr r1, [r3]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r4, r0
	ldr r5, [r0]
	cmp r1, #0
	beq .L080DFC78
	subs r0, r1, #1
	str r0, [r3]
.L080DFC78:
	ldr r2, [r3]
	lsls r0, r2, #2
	subs r0, #4
	adds r0, r4, r0
	ldr r6, [r0]
	cmp r2, #0
	beq .L080DFC8A
	subs r0, r2, #1
	str r0, [r3]
.L080DFC8A:
	ldr r2, [r3]
	lsls r0, r2, #2
	subs r0, #4
	adds r0, r4, r0
	ldr r4, [r0]
	cmp r2, #0
	beq .L080DFC9C
	subs r0, r2, #1
	str r0, [r3]
.L080DFC9C:
	movs r0, #0xda
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r1, #0x40]
	adds r1, r4, #0
	bl _call_via_r2
	cmp r0, #0
	bne .L080DFCB4
	b .L080E0080
.L080DFCB4:
	rsbs r2, r5, #0
	orrs r2, r5
	lsrs r2, r2, #0x1f
	adds r1, r6, #0
	bl func_08032384
	b .L080E0080
.L080DFCC2:
	movs r1, #0xe0
	lsls r1, r1, #1
	add r1, r8
	ldr r2, [r1]
	lsls r0, r2, #2
	add r0, r8
	ldr r3, [r0, #0x2c]
	cmp r2, #0
	beq .L080DFCD8
	subs r0, r2, #1
	str r0, [r1]
.L080DFCD8:
	movs r0, #0xda
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r1, #0x40]
	adds r1, r3, #0
	bl _call_via_r2
	cmp r0, #0
	bne .L080DFCF0
	b .L080E0080
.L080DFCF0:
	bl func_080323C8
	b .L080E0080
.L080DFCF6:
	movs r3, #0xe0
	lsls r3, r3, #1
	add r3, r8
	ldr r2, [r3]
	lsls r0, r2, #2
	add r0, r8
	ldr r1, [r0, #0x2c]
	cmp r2, #0
	beq .L080DFD0C
	subs r0, r2, #1
	str r0, [r3]
.L080DFD0C:
	mov r0, r8
	adds r0, #0xc
	ldr r2, .L080DFD20 @ =gUnk_080F89D4
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl Load__13AScriptEnginePCv
	b .L080E0080
	.align 2, 0
.L080DFD20: .4byte gUnk_080F89D4
.L080DFD24:
	movs r0, #0xda
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	ldr r1, [r0]
	adds r1, #0x80
	ldr r1, [r1]
	bl _call_via_r1
	b .L080E0080
.L080DFD38:
	movs r1, #0xe0
	lsls r1, r1, #1
	add r1, r8
	ldr r2, [r1]
	lsls r0, r2, #2
	add r0, r8
	ldr r3, [r0, #0x2c]
	cmp r2, #0
	beq .L080DFD4E
	subs r0, r2, #1
	str r0, [r1]
.L080DFD4E:
	movs r0, #0xda
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	ldr r1, [r0]
	adds r1, #0x9c
	b .L080DFDA2
.L080DFD5C:
	movs r1, #0xe0
	lsls r1, r1, #1
	add r1, r8
	ldr r2, [r1]
	lsls r0, r2, #2
	add r0, r8
	ldr r3, [r0, #0x2c]
	cmp r2, #0
	beq .L080DFD72
	subs r0, r2, #1
	str r0, [r1]
.L080DFD72:
	movs r0, #0xda
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	ldr r1, [r0]
	adds r1, #0xa0
	b .L080DFDA2
.L080DFD80:
	movs r1, #0xe0
	lsls r1, r1, #1
	add r1, r8
	ldr r2, [r1]
	lsls r0, r2, #2
	add r0, r8
	ldr r3, [r0, #0x2c]
	cmp r2, #0
	beq .L080DFD96
	subs r0, r2, #1
	str r0, [r1]
.L080DFD96:
	movs r0, #0xda
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	ldr r1, [r0]
	adds r1, #0xac
.L080DFDA2:
	ldr r2, [r1]
	adds r1, r3, #0
	bl _call_via_r2
	b .L080E0080
.L080DFDAC:
	mov r6, r8
	adds r6, #0x30
	movs r5, #0xe0
	lsls r5, r5, #1
	add r5, r8
	ldr r1, [r5]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r6, r0
	ldr r3, [r0]
	cmp r1, #0
	beq .L080DFDC8
	subs r0, r1, #1
	str r0, [r5]
.L080DFDC8:
	ldr r1, [r5]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r6, r0
	ldr r2, [r0]
	cmp r1, #0
	beq .L080DFDDA
	subs r0, r1, #1
	str r0, [r5]
.L080DFDDA:
	ldr r4, [r5]
	lsls r0, r4, #2
	subs r0, #4
	adds r0, r6, r0
	ldr r1, [r0]
	cmp r4, #0
	beq .L080DFDEC
	subs r0, r4, #1
	str r0, [r5]
.L080DFDEC:
	ldr r4, [r5]
	lsls r0, r4, #2
	subs r0, #4
	adds r0, r6, r0
	ldr r0, [r0]
	mov sb, r0
	cmp r4, #0
	beq .L080DFE00
	subs r0, r4, #1
	str r0, [r5]
.L080DFE00:
	ldr r4, [r5]
	lsls r0, r4, #2
	subs r0, #4
	adds r0, r6, r0
	ldr r7, [r0]
	cmp r4, #0
	beq .L080DFE12
	subs r0, r4, #1
	str r0, [r5]
.L080DFE12:
	movs r0, #0xda
	lsls r0, r0, #2
	add r0, r8
	ldr r5, [r0]
	ldr r4, [r5]
	adds r4, #0xb4
	add r6, sp, #0x20
	adds r0, r6, #0
	bl __9FieldPlotUiUiUi
	ldr r4, [r4]
	adds r0, r5, #0
	adds r1, r7, #0
	mov r2, sb
	adds r3, r6, #0
	bl _call_via_r4
	b .L080E0080
.L080DFE36:
	mov r6, r8
	adds r6, #0x30
	movs r5, #0xe0
	lsls r5, r5, #1
	add r5, r8
	ldr r1, [r5]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r6, r0
	ldr r3, [r0]
	cmp r1, #0
	beq .L080DFE52
	subs r0, r1, #1
	str r0, [r5]
.L080DFE52:
	ldr r1, [r5]
	lsls r0, r1, #2
	subs r0, #4
	adds r0, r6, r0
	ldr r2, [r0]
	cmp r1, #0
	beq .L080DFE64
	subs r0, r1, #1
	str r0, [r5]
.L080DFE64:
	ldr r4, [r5]
	lsls r0, r4, #2
	subs r0, #4
	adds r0, r6, r0
	ldr r6, [r0]
	cmp r4, #0
	beq .L080DFE76
	subs r0, r4, #1
	str r0, [r5]
.L080DFE76:
	movs r0, #0xda
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	ldr r1, [r0]
	adds r1, #0xb8
	ldr r4, [r1]

	thumb_func_start sub_080DFE84
sub_080DFE84: @ 0x080DFE84
	adds r1, r6, #0
	bl _call_via_r4
	b .L080E0080
.L080DFE8C:
	mov r5, r8
	adds r5, #0x30
	movs r4, #0xe0
	lsls r4, r4, #1
	add r4, r8
	ldr r2, [r4]
	lsls r0, r2, #2
	subs r0, #4
	adds r0, r5, r0
	ldr r1, [r0]
	cmp r2, #0
	beq .L080DFEA8
	subs r0, r2, #1
	str r0, [r4]
.L080DFEA8:
	ldr r2, [r4]
	lsls r0, r2, #2
	subs r0, #4
	adds r0, r5, r0
	ldr r7, [r0]
	cmp r2, #0
	beq .L080DFEBA
	subs r0, r2, #1
	str r0, [r4]
.L080DFEBA:
	ldr r3, [r4]
	lsls r0, r3, #2
	subs r0, #4
	adds r0, r5, r0
	ldr r6, [r0]
	cmp r3, #0
	beq .L080DFECC
	subs r0, r3, #1
	str r0, [r4]
.L080DFECC:
	movs r5, #0xda
	lsls r5, r5, #2
	add r5, r8
	ldr r0, [r5]
	ldr r2, [r0]
	adds r1, #0x62
	ldr r2, [r2, #0x40]
	bl _call_via_r2
	adds r4, r0, #0
	cmp r4, #0
	bne .L080DFEE6
	b .L080E0080
.L080DFEE6:
	ldr r0, [r5]
	ldr r1, [r0]
	ldr r1, [r1, #0x14]
	bl _call_via_r1
	adds r1, r0, #0
	adds r0, r4, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl SetLocation__7AEntityUiii
	b .L080E0080
.L080DFEFE:
	movs r3, #0xe0
	lsls r3, r3, #1
	add r3, r8
	ldr r2, [r3]
	lsls r0, r2, #2
	add r0, r8
	ldr r1, [r0, #0x2c]
	cmp r2, #0
	beq .L080DFF14
	subs r0, r2, #1
	str r0, [r3]
.L080DFF14:
	movs r0, #0xda
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	ldr r2, [r0]
	adds r1, #0x62
	ldr r2, [r2, #0x40]
	bl _call_via_r2
	cmp r0, #0
	bne .L080DFF2C
	b .L080E0080
.L080DFF2C:
	movs r1, #0x8d
	lsls r1, r1, #2
	movs r2, #0
	movs r3, #0
	bl SetLocation__7AEntityUiii
	b .L080E0080
.L080DFF3A:
	movs r1, #0xe0
	lsls r1, r1, #1
	add r1, r8
	ldr r2, [r1]
	lsls r0, r2, #2
	add r0, r8
	ldr r4, [r0, #0x2c]
	cmp r2, #0
	beq .L080DFF50
	subs r0, r2, #1
	str r0, [r1]
.L080DFF50:
	movs r0, #0xda
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r1, #0x40]
	movs r1, #0x5e
	bl _call_via_r2
	ldr r1, [r0, #0x14]
	ldr r2, [r1, #0x40]
	adds r1, r4, #0
	bl _call_via_r2
	b .L080E0072
.L080DFF6E:
	movs r1, #0xe0
	lsls r1, r1, #1
	add r1, r8
	ldr r2, [r1]
	lsls r0, r2, #2
	add r0, r8
	ldr r6, [r0, #0x2c]
	cmp r2, #0
	beq .L080DFF84
	subs r0, r2, #1
	str r0, [r1]
.L080DFF84:
	movs r0, #0xda
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r1, #0x40]
	movs r1, #0x5e
	bl _call_via_r2
	adds r4, r0, #0
	ldr r5, [r4, #0x14]
	add r0, sp, #0x10
	adds r1, r6, #0
	bl __4FoodUi
	add r0, sp, #0x10
	bl GetIconId__C4Food
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, [r5, #0x44]
	adds r0, r4, #0
	movs r2, #0
	bl _call_via_r3
	b .L080E0072
.L080DFFBA:
	movs r1, #0xe0
	lsls r1, r1, #1
	add r1, r8
	ldr r2, [r1]
	lsls r0, r2, #2
	add r0, r8
	ldr r4, [r0, #0x2c]
	cmp r2, #0
	beq .L080DFFD0
	subs r0, r2, #1
	str r0, [r1]
.L080DFFD0:
	movs r0, #0xda
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r1, #0x40]
	movs r1, #0x5e
	bl _call_via_r2
	ldr r2, [r0, #0x14]
	lsls r1, r4, #0x10
	lsrs r1, r1, #0x10
	ldr r3, [r2, #0x44]
	movs r2, #1
	bl _call_via_r3
	b .L080E0072
.L080DFFF2:
	movs r1, #0xe0
	lsls r1, r1, #1
	add r1, r8
	ldr r2, [r1]
	lsls r0, r2, #2
	add r0, r8
	ldr r7, [r0, #0x2c]
	cmp r2, #0
	beq .L080E0008
	subs r0, r2, #1
	str r0, [r1]
.L080E0008:
	movs r0, #0xda
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r1, #0x40]
	movs r1, #0x5e
	bl _call_via_r2
	adds r5, r0, #0
	ldr r6, [r5, #0x14]
	add r4, sp, #0x24
	adds r0, r4, #0
	adds r1, r7, #0
	bl __7ArticleUi
	adds r0, r4, #0
	bl GetIconId__C7Article
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, [r6, #0x44]
	adds r0, r5, #0
	movs r2, #0
	bl _call_via_r3
	b .L080E0072
.L080E0040:
	movs r0, #0xda
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r1, #0x40]
	movs r1, #0x5e
	bl _call_via_r2
	ldr r1, [r0, #0x14]
	ldr r1, [r1, #0x4c]
	b .L080E006E
.L080E0058:
	movs r0, #0xda
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r1, #0x40]
	movs r1, #0x5e
	bl _call_via_r2
	ldr r1, [r0, #0x14]
	ldr r1, [r1, #0x48]
.L080E006E:
	bl _call_via_r1
.L080E0072:
	movs r1, #0xd9
	lsls r1, r1, #2
	add r1, r8
	movs r0, #0xb
.L080E007A:
	str r0, [r1]
.L080E007C:
	movs r0, #1
	b .L080E0082
.L080E0080:
	movs r0, #0
.L080E0082:
	add sp, #0x30
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080E0094
func_080E0094: @ 0x080E0094
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xac
	str r0, [sp, #0x7c]
	adds r7, r1, #0
	adds r6, r7, #4
	adds r0, r6, #0
	bl func_08008724
	adds r0, r6, #0
	bl func_08008918
	add r2, sp, #0xc
	movs r3, #0x82
	lsls r3, r3, #5
	adds r1, r3, #0
	strh r1, [r2]
	strh r1, [r0]
	adds r0, r6, #0
	bl func_08008918
	add r1, sp, #0xc
	movs r2, #0x3f
	strh r2, [r1]
	adds r0, #0x50
	strh r2, [r0]
	movs r4, #0xe2
	lsls r4, r4, #2
	adds r5, r7, r4
	movs r0, #0xde
	lsls r0, r0, #2
	adds r1, r7, r0
	str r1, [sp, #0x38]
	mov r2, sp
	adds r2, #0x38
	str r2, [sp, #0x80]
	ldr r4, [r5, #4]
	ldr r0, [r5, #0xc]
	cmp r4, r0
	beq .L080E011C
	cmp r4, #0
	beq .L080E00F0
	str r1, [r4]
.L080E00F0:
	ldr r0, [r5, #4]
	adds r0, #4
	str r0, [r5, #4]
	mov sl, r6
	add r3, sp, #0x44
	mov r8, r3
	mov r4, sp
	adds r4, #0x50
	str r4, [sp, #0x9c]
	mov r5, sp
	adds r5, #0x5c
	str r5, [sp, #0xa0]
	adds r0, r7, #0
	adds r0, #0xc
	str r0, [sp, #0x98]
	mov r1, sp
	adds r1, #0x10
	str r1, [sp, #0x94]
	mov r2, sp
	adds r2, #0x68
	str r2, [sp, #0xa4]
	b .L080E01BC
.L080E011C:
	mov r8, r4
	movs r0, #1
	str r0, [sp, #0x40]
	ldr r0, [r5]
	subs r0, r4, r0
	asrs r4, r0, #2
	str r4, [sp, #0x3c]
	add r1, sp, #0x40
	add r0, sp, #0x3c
	cmp r4, #1
	bhs .L080E0134
	adds r0, r1, #0
.L080E0134:
	ldr r0, [r0]
	adds r0, r4, r0
	cmp r0, #0
	beq .L080E0152
	lsls r4, r0, #2
	adds r0, r4, #0
	bl malloc
	mov sb, r4
	cmp r0, #0
	bne .L080E0156
	mov r0, sb
	bl func_080D3BC0
	b .L080E0156
.L080E0152:
	movs r0, #0
	mov sb, r0
.L080E0156:
	adds r6, r0, #0
	ldr r1, [r5]
	cmp r8, r1
	beq .L080E016C
	mov r3, r8
	subs r4, r3, r1
	adds r2, r4, #0
	bl memmove
	adds r0, r0, r4
	b .L080E016E
.L080E016C:
	adds r0, r6, #0
.L080E016E:
	adds r4, r0, #0
	ldr r1, [sp, #0x40]
	adds r0, r7, #4
	mov sl, r0
	ldr r2, [r5]
	add r3, sp, #0x44
	mov r8, r3
	mov r0, sp
	adds r0, #0x50
	str r0, [sp, #0x9c]
	mov r3, sp
	adds r3, #0x5c
	str r3, [sp, #0xa0]
	adds r0, r7, #0
	adds r0, #0xc
	str r0, [sp, #0x98]
	subs r3, #0x4c
	str r3, [sp, #0x94]
	mov r0, sp
	adds r0, #0x68
	str r0, [sp, #0xa4]
	cmp r1, #0
	beq .L080E01A8
.L080E019C:
	ldr r3, [sp, #0x80]
	ldr r0, [r3]
	stm r4!, {r0}
	subs r1, #1
	cmp r1, #0
	bne .L080E019C
.L080E01A8:
	cmp r2, #0
	beq .L080E01B2
	adds r0, r2, #0
	bl free
.L080E01B2:
	mov r1, sb
	adds r0, r1, r6
	str r6, [r5]
	str r4, [r5, #4]
	str r0, [r5, #0xc]
.L080E01BC:
	movs r2, #0xe2
	lsls r2, r2, #2
	adds r5, r7, r2
	movs r3, #0xdf
	lsls r3, r3, #2
	adds r1, r7, r3
	str r1, [sp, #0x44]
	mov r4, r8
	str r4, [sp, #0x84]
	ldr r4, [r5, #4]
	ldr r0, [r5, #0xc]
	cmp r4, r0
	beq .L080E01E4
	cmp r4, #0
	beq .L080E01DC
	str r1, [r4]
.L080E01DC:
	ldr r0, [r5, #4]
	adds r0, #4
	str r0, [r5, #4]
	b .L080E0262
.L080E01E4:
	mov r8, r4
	movs r0, #1
	str r0, [sp, #0x4c]
	ldr r0, [r5]
	subs r0, r4, r0
	asrs r4, r0, #2
	str r4, [sp, #0x48]
	add r1, sp, #0x4c
	add r0, sp, #0x48
	cmp r4, #1
	bhs .L080E01FC
	adds r0, r1, #0
.L080E01FC:
	ldr r0, [r0]
	adds r0, r4, r0
	cmp r0, #0
	beq .L080E021A
	lsls r4, r0, #2
	adds r0, r4, #0
	bl malloc
	mov sb, r4
	cmp r0, #0
	bne .L080E021E
	mov r0, sb
	bl func_080D3BC0
	b .L080E021E
.L080E021A:
	movs r0, #0
	mov sb, r0
.L080E021E:
	adds r6, r0, #0
	ldr r1, [r5]
	cmp r8, r1
	beq .L080E0236
	mov r0, r8
	subs r4, r0, r1
	adds r0, r6, #0
	adds r2, r4, #0
	bl memmove
	adds r0, r0, r4
	b .L080E0238
.L080E0236:
	adds r0, r6, #0
.L080E0238:
	adds r4, r0, #0
	ldr r1, [sp, #0x4c]
	ldr r2, [r5]
	cmp r1, #0
	beq .L080E024E
.L080E0242:
	ldr r3, [sp, #0x84]
	ldr r0, [r3]
	stm r4!, {r0}
	subs r1, #1
	cmp r1, #0
	bne .L080E0242
.L080E024E:
	cmp r2, #0
	beq .L080E0258
	adds r0, r2, #0
	bl free
.L080E0258:
	mov r1, sb
	adds r0, r1, r6
	str r6, [r5]
	str r4, [r5, #4]
	str r0, [r5, #0xc]
.L080E0262:
	movs r2, #0xe2
	lsls r2, r2, #2
	adds r5, r7, r2
	movs r3, #0xe0
	lsls r3, r3, #2
	adds r1, r7, r3
	str r1, [sp, #0x50]
	ldr r4, [sp, #0x9c]
	str r4, [sp, #0x88]
	ldr r4, [r5, #4]
	ldr r0, [r5, #0xc]
	cmp r4, r0
	beq .L080E028A
	cmp r4, #0
	beq .L080E0282
	str r1, [r4]
.L080E0282:
	ldr r0, [r5, #4]
	adds r0, #4
	str r0, [r5, #4]
	b .L080E0308
.L080E028A:
	mov r8, r4
	movs r0, #1
	str r0, [sp, #0x58]
	ldr r0, [r5]
	subs r0, r4, r0
	asrs r4, r0, #2
	str r4, [sp, #0x54]
	add r1, sp, #0x58
	add r0, sp, #0x54
	cmp r4, #1
	bhs .L080E02A2
	adds r0, r1, #0
.L080E02A2:
	ldr r0, [r0]
	adds r0, r4, r0
	cmp r0, #0
	beq .L080E02C0
	lsls r4, r0, #2
	adds r0, r4, #0
	bl malloc
	mov sb, r4
	cmp r0, #0
	bne .L080E02C4
	mov r0, sb
	bl func_080D3BC0
	b .L080E02C4
.L080E02C0:
	movs r0, #0
	mov sb, r0
.L080E02C4:
	adds r6, r0, #0
	ldr r1, [r5]
	cmp r8, r1
	beq .L080E02DC
	mov r0, r8
	subs r4, r0, r1
	adds r0, r6, #0
	adds r2, r4, #0
	bl memmove
	adds r0, r0, r4
	b .L080E02DE
.L080E02DC:
	adds r0, r6, #0
.L080E02DE:
	adds r4, r0, #0
	ldr r1, [sp, #0x58]
	ldr r2, [r5]
	cmp r1, #0
	beq .L080E02F4
.L080E02E8:
	ldr r3, [sp, #0x88]
	ldr r0, [r3]
	stm r4!, {r0}
	subs r1, #1
	cmp r1, #0
	bne .L080E02E8
.L080E02F4:
	cmp r2, #0
	beq .L080E02FE
	adds r0, r2, #0
	bl free
.L080E02FE:
	mov r1, sb
	adds r0, r1, r6
	str r6, [r5]
	str r4, [r5, #4]
	str r0, [r5, #0xc]
.L080E0308:
	movs r2, #0xe2
	lsls r2, r2, #2
	adds r5, r7, r2
	movs r3, #0xe1
	lsls r3, r3, #2
	adds r1, r7, r3
	str r1, [sp, #0x5c]
	ldr r4, [sp, #0xa0]
	str r4, [sp, #0x8c]
	ldr r4, [r5, #4]
	ldr r0, [r5, #0xc]
	cmp r4, r0
	beq .L080E0330
	cmp r4, #0
	beq .L080E0328
	str r1, [r4]
.L080E0328:
	ldr r0, [r5, #4]
	adds r0, #4
	str r0, [r5, #4]
	b .L080E03AE
.L080E0330:
	mov r8, r4
	movs r0, #1
	str r0, [sp, #0x64]
	ldr r0, [r5]
	subs r0, r4, r0
	asrs r4, r0, #2
	str r4, [sp, #0x60]
	add r1, sp, #0x64
	add r0, sp, #0x60
	cmp r4, #1
	bhs .L080E0348
	adds r0, r1, #0
.L080E0348:
	ldr r0, [r0]
	adds r0, r4, r0
	cmp r0, #0
	beq .L080E0366
	lsls r4, r0, #2
	adds r0, r4, #0
	bl malloc
	mov sb, r4
	cmp r0, #0
	bne .L080E036A
	mov r0, sb
	bl func_080D3BC0
	b .L080E036A
.L080E0366:
	movs r0, #0
	mov sb, r0
.L080E036A:
	adds r6, r0, #0
	ldr r1, [r5]
	cmp r8, r1
	beq .L080E0382
	mov r0, r8
	subs r4, r0, r1
	adds r0, r6, #0
	adds r2, r4, #0
	bl memmove
	adds r0, r0, r4
	b .L080E0384
.L080E0382:
	adds r0, r6, #0
.L080E0384:
	adds r4, r0, #0
	ldr r1, [sp, #0x64]
	ldr r2, [r5]
	cmp r1, #0
	beq .L080E039A
.L080E038E:
	ldr r3, [sp, #0x8c]
	ldr r0, [r3]
	stm r4!, {r0}
	subs r1, #1
	cmp r1, #0
	bne .L080E038E
.L080E039A:
	cmp r2, #0
	beq .L080E03A4
	adds r0, r2, #0
	bl free
.L080E03A4:
	mov r1, sb
	adds r0, r1, r6
	str r6, [r5]
	str r4, [r5, #4]
	str r0, [r5, #0xc]
.L080E03AE:
	ldr r2, .L080E0534 @ =gUnk_080F89D4
	ldr r1, .L080E0538 @ =gUnk_080F19AE
	movs r3, #0xd8
	lsls r3, r3, #2
	adds r0, r7, r3
	ldr r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, [sp, #0x98]
	bl Load__13AScriptEnginePCv
	movs r4, #0xd9
	lsls r4, r4, #2
	adds r0, r7, r4
	movs r4, #0
	str r4, [r0]
	movs r0, #0xda
	lsls r0, r0, #2
	adds r5, r7, r0
	ldr r0, [sp, #0x94]
	bl func_080AD724
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x94]
	str r1, [sp, #0x68]
	ldr r2, [sp, #0xa4]
	str r0, [r2, #4]
	str r4, [r1]
	adds r4, r0, #0
	ldr r1, [r5]
	cmp r4, r1
	beq .L080E0406
	cmp r1, #0
	beq .L080E0406
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E0406:
	str r4, [r5]
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq .L080E041A
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E041A:
	movs r0, #4
	bl __builtin_new
	adds r4, r0, #0
	mov r0, sl
	bl func_08008918
	adds r1, r0, #0
	adds r0, r4, #0
	bl func_08009300
	movs r3, #0xdc
	lsls r3, r3, #2
	adds r5, r7, r3
	adds r4, r0, #0
	ldr r0, [r5]
	cmp r4, r0
	beq .L080E0448
	cmp r0, #0
	beq .L080E0448
	movs r1, #3
	bl func_08009324
.L080E0448:
	str r4, [r5]
.L080E044A:
	mov r0, sl
	bl func_080088B8
	movs r4, #0xd9
	lsls r4, r4, #2
	adds r6, r7, r4
	ldr r0, [r6]
	cmp r0, #1
	beq .L080E04B2
	mov r0, sl
	bl func_080088DC
	ldrh r0, [r0, #8]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq .L080E04B2
	movs r0, #0xdc
	lsls r0, r0, #2
	adds r5, r7, r0
	ldr r0, [r5]
	bl func_080094A4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	rsbs r1, r0, #0
	orrs r1, r0
	cmp r1, #0
	blt .L080E04B2
	movs r1, #0xdb
	lsls r1, r1, #2
	adds r4, r7, r1
	ldr r0, [r4]
	cmp r0, #0
	beq .L080E04A2
	bl func_08050D34
	cmp r0, #1
	beq .L080E04B2
	ldr r0, [r4]
	bl func_08050D34
	cmp r0, #2
	beq .L080E04B2
.L080E04A2:
	ldr r0, [r5]
	ldr r1, .L080E053C @ =0x00000889
	movs r2, #1
	movs r3, #1
	bl func_08009378
	movs r0, #1
	str r0, [r6]
.L080E04B2:
	movs r2, #0xdb
	lsls r2, r2, #2
	adds r4, r7, r2
	ldr r0, [r4]
	cmp r0, #0
	beq .L080E0518
	mov r0, sl
	bl func_080088DC
	ldrh r2, [r0, #8]
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, .L080E0540 @ =0xFFFFFF00
	ands r1, r2
	orrs r1, r0
	ldr r4, [r4]
	mov sb, r4
	add r5, sp, #0x14
	adds r0, r5, #0
	bl func_080091E8
	mov r0, sl
	bl func_08008920
	mov r8, r0
	mov r0, sl
	bl func_08008918
	adds r6, r0, #0
	mov r0, sl
	bl func_08008940
	adds r4, r0, #0
	mov r0, sl
	bl func_0800894C
	movs r3, #0xe0
	lsls r3, r3, #2
	adds r1, r7, r3
	str r4, [sp]
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r0, sb
	adds r1, r5, #0
	mov r2, r8
	adds r3, r6, #0
	bl func_08050D3C
.L080E0518:
	movs r6, #0
	movs r4, #0xd9
	lsls r4, r4, #2
	adds r0, r7, r4
	ldr r0, [r0]
	cmp r0, #0xb
	bls .L080E0528
	b .L080E075E
.L080E0528:
	lsls r0, r0, #2
	ldr r1, .L080E0544 @ =.L080E0548
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L080E0534: .4byte gUnk_080F89D4
.L080E0538: .4byte gUnk_080F19AE
.L080E053C: .4byte 0x00000889
.L080E0540: .4byte 0xFFFFFF00
.L080E0544: .4byte .L080E0548
.L080E0548: @ jump table
	.4byte .L080E0578 @ case 0
	.4byte .L080E05A2 @ case 1
	.4byte .L080E05D0 @ case 2
	.4byte .L080E05EC @ case 3
	.4byte .L080E0616 @ case 4
	.4byte .L080E065C @ case 5
	.4byte .L080E06BC @ case 6
	.4byte .L080E0632 @ case 7
	.4byte .L080E06DE @ case 8
	.4byte .L080E06FA @ case 9
	.4byte .L080E0712 @ case 10
	.4byte .L080E0734 @ case 11
.L080E0578:
	movs r6, #1
	movs r5, #0xd6
	lsls r5, r5, #2
	adds r0, r7, r5
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	ldr r0, [sp, #0x98]
	bl _call_via_r1
	adds r2, r0, #0
	cmp r2, #0
	beq .L080E0592
	b .L080E075E
.L080E0592:
	movs r1, #0xd7
	lsls r1, r1, #2
	adds r0, r7, r1
	ldr r1, [r0]
	str r2, [r0]
	ldr r2, [sp, #0x7c]
	str r1, [r2]
	b .L080E08F4
.L080E05A2:
	movs r6, #1
	movs r3, #0xdc
	lsls r3, r3, #2
	adds r0, r7, r3
	ldr r0, [r0]
	bl func_080094A4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r2, r1, #0x1f
	cmp r2, #0
	beq .L080E05C0
	b .L080E075E
.L080E05C0:
	movs r4, #0xd7
	lsls r4, r4, #2
	adds r0, r7, r4
	ldr r1, [r0]
	str r2, [r0]
	ldr r5, [sp, #0x7c]
	str r1, [r5]
	b .L080E08F4
.L080E05D0:
	movs r6, #1
	movs r1, #0xdb
	lsls r1, r1, #2
	adds r0, r7, r1
	ldr r0, [r0]
	bl func_08050D34
	cmp r0, #3
	beq .L080E05E4
	b .L080E075E
.L080E05E4:
	movs r2, #0xd9
	lsls r2, r2, #2
	adds r1, r7, r2
	b .L080E072E
.L080E05EC:
	movs r6, #1
	movs r3, #0xdb
	lsls r3, r3, #2
	adds r4, r7, r3
	ldr r0, [r4]
	bl func_08050D34
	cmp r0, #0
	beq .L080E0600
	b .L080E075E
.L080E0600:
	movs r5, #0
	ldr r0, [r4]
	cmp r5, r0
	beq .L080E0612
	cmp r0, #0
	beq .L080E0612
	movs r1, #3
	bl func_08050D0C
.L080E0612:
	str r5, [r4]
	b .L080E0728
.L080E0616:
	movs r6, #1
	movs r5, #0xdb
	lsls r5, r5, #2
	adds r0, r7, r5
	ldr r0, [r0]
	bl func_08050D34
	cmp r0, #3
	beq .L080E062A
	b .L080E075E
.L080E062A:
	movs r0, #0xd9
	lsls r0, r0, #2
	adds r1, r7, r0
	b .L080E072E
.L080E0632:
	movs r6, #1
	movs r1, #0xdb
	lsls r1, r1, #2
	adds r4, r7, r1
	ldr r0, [r4]
	bl func_08050D34
	cmp r0, #6
	bne .L080E0646
	b .L080E075E
.L080E0646:
	ldr r0, [r4]
	bl func_08050DF0
	adds r1, r0, #0
	adds r0, r7, #0
	bl func_080E09E4
	movs r2, #0xd9
	lsls r2, r2, #2
	adds r1, r7, r2
	b .L080E072E
.L080E065C:
	movs r3, #0xdc
	lsls r3, r3, #2
	adds r0, r7, r3
	ldr r0, [r0]
	bl func_080094A4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r4, r1, #0x1f
	cmp r4, #0
	bne .L080E075E
	movs r5, #0xe8
	lsls r5, r5, #2
	adds r1, r7, r5
	movs r0, #1
	strb r0, [r1]
	mov r0, sl
	bl func_08008918
	ldrh r2, [r0]
	ldr r1, .L080E06B4 @ =0x0000F0FF
	ands r1, r2
	strh r1, [r0]
	mov r0, sl
	bl func_08008918
	adds r0, #0x50
	ldrh r2, [r0]
	ldr r1, .L080E06B8 @ =0x0000FF3F
	ands r1, r2
	strh r1, [r0]
	mov r0, sl
	bl func_08008918
	adds r0, #0x4c
	strh r4, [r0]
	movs r1, #0xd9
	lsls r1, r1, #2
	adds r0, r7, r1
	str r4, [r0]
	b .L080E075E
	.align 2, 0
.L080E06B4: .4byte 0x0000F0FF
.L080E06B8: .4byte 0x0000FF3F
.L080E06BC:
	movs r2, #0xdc
	lsls r2, r2, #2
	adds r0, r7, r2
	ldr r0, [r0]
	bl func_080094A4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	cmp r1, #0
	bne .L080E075E
	movs r3, #0xd9
	lsls r3, r3, #2
	adds r0, r7, r3
	b .L080E075C
.L080E06DE:
	movs r4, #0xe6
	lsls r4, r4, #2
	adds r1, r7, r4
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne .L080E075E
	movs r5, #0xd9
	lsls r5, r5, #2
	adds r0, r7, r5
	b .L080E075C
.L080E06FA:
	movs r0, #0xe7
	lsls r0, r0, #2
	adds r4, r7, r0
	ldr r0, [r4]
	bl func_08032370
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080E075E
	movs r1, #0
	str r1, [r4]
	b .L080E0756
.L080E0712:
	movs r3, #0xda
	lsls r3, r3, #2
	adds r0, r7, r3
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r1, [r1, #0x28]
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080E075E
.L080E0728:
	movs r4, #0xd9
	lsls r4, r4, #2
	adds r1, r7, r4
.L080E072E:
	movs r0, #0
	str r0, [r1]
	b .L080E075E
.L080E0734:
	movs r5, #0xda
	lsls r5, r5, #2
	adds r0, r7, r5
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r1, #0x40]
	movs r1, #0x5e
	bl _call_via_r2
	ldr r1, [r0, #0x14]
	ldr r1, [r1, #0x3c]
	bl _call_via_r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne .L080E075E
.L080E0756:
	movs r2, #0xd9
	lsls r2, r2, #2
	adds r0, r7, r2
.L080E075C:
	str r1, [r0]
.L080E075E:
	cmp r6, #0
	bne .L080E077C
	mov r0, sl
	bl func_080088DC
	add r1, sp, #0x70
	str r0, [sp, #0x70]
	movs r3, #0xda
	lsls r3, r3, #2
	adds r0, r7, r3
	ldr r0, [r0]
	ldr r2, [r0]
	ldr r2, [r2, #0xc]
	bl _call_via_r2
.L080E077C:
	movs r4, #0xe8
	lsls r4, r4, #2
	adds r0, r7, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne .L080E078A
	b .L080E08A8
.L080E078A:
	mov r0, sl
	bl func_08008910
	adds r2, r0, #0
	ldr r5, .L080E07D4 @ =0x000003A1
	adds r0, r7, r5
	ldrb r0, [r0]
	ldr r1, .L080E07D8 @ =0x0000FFFF
	cmp r0, #0
	beq .L080E07A0
	movs r1, #0
.L080E07A0:
	adds r6, r2, #0
	add r0, sp, #0xc
	movs r2, #0xa0
	lsls r2, r2, #0x13
	movs r3, #2
	bl func_08008F60
	mov r0, sp
	adds r0, #0xc
	str r0, [sp, #0x90]
	ldr r1, [r6, #4]
	ldr r0, [r6, #0xc]
	cmp r1, r0
	beq .L080E07DC
	cmp r1, #0
	beq .L080E07CC
	adds r0, r1, #0
	add r1, sp, #0xc
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldr r1, [r1]
	str r1, [r0]
.L080E07CC:
	ldr r0, [r6, #4]
	adds r0, #0x10
	str r0, [r6, #4]
	b .L080E08E0
	.align 2, 0
.L080E07D4: .4byte 0x000003A1
.L080E07D8: .4byte 0x0000FFFF
.L080E07DC:
	mov r8, r1
	movs r0, #1
	str r0, [sp, #0x78]
	ldr r0, [r6]
	subs r0, r1, r0
	asrs r4, r0, #4
	str r4, [sp, #0x74]
	add r1, sp, #0x78
	add r0, sp, #0x74
	cmp r4, #1
	bhs .L080E07F4
	adds r0, r1, #0
.L080E07F4:
	ldr r0, [r0]
	adds r0, r4, r0
	cmp r0, #0
	beq .L080E0812
	lsls r4, r0, #4
	adds r0, r4, #0
	bl malloc
	mov sb, r4
	cmp r0, #0
	bne .L080E0816
	mov r0, sb
	bl func_080D3BC0
	b .L080E0816
.L080E0812:
	movs r0, #0
	mov sb, r0
.L080E0816:
	adds r5, r0, #0
	str r5, [sp, #0xa8]
	ldr r2, [r6]
	mov ip, r5
	cmp r2, r8
	beq .L080E083E
.L080E0822:
	mov r5, ip
	cmp r5, #0
	beq .L080E0834
	mov r0, ip
	adds r1, r2, #0
	ldm r1!, {r3, r4, r5}
	stm r0!, {r3, r4, r5}
	ldr r1, [r1]
	str r1, [r0]
.L080E0834:
	adds r2, #0x10
	movs r0, #0x10
	add ip, r0
	cmp r2, r8
	bne .L080E0822
.L080E083E:
	mov r5, ip
	ldr r0, [sp, #0x78]
	cmp r0, #1
	bne .L080E085A
	cmp r5, #0
	beq .L080E0856
	adds r0, r5, #0
	ldr r1, [sp, #0x90]
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldr r1, [r1]
	str r1, [r0]
.L080E0856:
	adds r5, #0x10
	b .L080E0882
.L080E085A:
	mov r8, r0
	adds r2, r5, #0
	cmp r0, #0
	beq .L080E0880
.L080E0862:
	cmp r2, #0
	beq .L080E0872
	adds r0, r2, #0
	ldr r1, [sp, #0x90]
	ldm r1!, {r3, r4, r5}
	stm r0!, {r3, r4, r5}
	ldr r1, [r1]
	str r1, [r0]
.L080E0872:
	movs r5, #1
	rsbs r5, r5, #0
	add r8, r5
	adds r2, #0x10
	mov r0, r8
	cmp r0, #0
	bne .L080E0862
.L080E0880:
	adds r5, r2, #0
.L080E0882:
	ldr r2, [r6, #4]
	ldr r0, [r6]
	adds r1, r0, #0
	cmp r0, r2
	beq .L080E0892
.L080E088C:
	adds r1, #0x10
	cmp r1, r2
	bne .L080E088C
.L080E0892:
	cmp r0, #0
	beq .L080E089A
	bl free
.L080E089A:
	ldr r0, [sp, #0xa8]
	add r0, sb
	ldr r1, [sp, #0xa8]
	str r1, [r6]
	str r5, [r6, #4]
	str r0, [r6, #0xc]
	b .L080E08E0
.L080E08A8:
	mov r0, sl
	bl func_08008910
	adds r6, r0, #0
	mov r0, sl
	bl func_08008918
	adds r5, r0, #0
	mov r0, sl
	bl func_08008920
	adds r4, r0, #0
	mov r0, sl
	bl func_08008940
	str r6, [sp, #0xc]
	str r5, [sp, #0x10]
	str r4, [sp, #0x14]
	str r0, [sp, #0x18]
	movs r2, #0xda
	lsls r2, r2, #2
	adds r0, r7, r2
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r1, #0x10]
	add r1, sp, #0xc
	bl _call_via_r2
.L080E08E0:
	movs r3, #0xdc
	lsls r3, r3, #2
	adds r0, r7, r3
	ldr r0, [r0]
	bl func_080093AC
	mov r0, sl
	bl func_080087C8
	b .L080E044A
.L080E08F4:
	ldr r0, [sp, #0x7c]
	add sp, #0xac
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080E0908
func_080E0908: @ 0x080E0908
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L080E09A4 @ =vtable_unk_080E7708
	str r0, [r4, #8]
	movs r0, #0xd6
	lsls r0, r0, #2
	adds r1, r4, r0
	ldr r0, .L080E09A8 @ =vtable_unk_080E7714
	str r0, [r1]
	ldr r0, .L080E09AC @ =vtable_unk_080E7728
	str r0, [r4]
	movs r1, #0xe2
	lsls r1, r1, #2
	adds r0, r4, r1
	ldr r0, [r0]
	cmp r0, #0
	beq .L080E0930
	bl free
.L080E0930:
	movs r1, #0xdc
	lsls r1, r1, #2
	adds r0, r4, r1
	ldr r0, [r0]
	cmp r0, #0
	beq .L080E0942
	movs r1, #3
	bl func_08009324
.L080E0942:
	movs r1, #0xdb
	lsls r1, r1, #2
	adds r0, r4, r1
	ldr r0, [r0]
	cmp r0, #0
	beq .L080E0954
	movs r1, #3
	bl func_08050D0C
.L080E0954:
	movs r1, #0xda
	lsls r1, r1, #2
	adds r0, r4, r1
	ldr r1, [r0]
	cmp r1, #0
	beq .L080E096C
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E096C:
	movs r1, #0xd7
	lsls r1, r1, #2
	adds r0, r4, r1
	ldr r1, [r0]
	cmp r1, #0
	beq .L080E0984
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E0984:
	adds r0, r4, #0
	adds r0, #0xc
	movs r1, #0
	bl _._13AScriptEngine
	adds r0, r4, #4
	movs r1, #0
	bl func_080086BC
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_080007EC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080E09A4: .4byte vtable_unk_080E7708
.L080E09A8: .4byte vtable_unk_080E7714
.L080E09AC: .4byte vtable_unk_080E7728

	thumb_func_start func_080E09B0
func_080E09B0: @ 0x080E09B0
	push {lr}
	bl func_080007EC
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080E09BC
func_080E09BC: @ 0x080E09BC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq .L080E09D4
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E09D4:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0800080C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080E09E4
func_080E09E4: @ 0x080E09E4
	push {r4, lr}
	adds r4, r1, #0
	adds r1, r0, #0
	adds r1, #0x30
	movs r2, #0xe0
	lsls r2, r2, #1
	adds r3, r0, r2
	ldr r2, [r3]
	cmp r2, #0x63
	bhi .L080E0A02
	lsls r0, r2, #2
	adds r0, r1, r0
	str r4, [r0]
	adds r0, r2, #1
	str r0, [r3]
.L080E0A02:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_080E0A08
func_080E0A08: @ 0x080E0A08
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r4, [r2, #0xc]
	ldr r3, [r2, #0x10]
	ldrb r0, [r2, #0x15]
	cmp r0, #0
	beq .L080E0A68
	ldrb r0, [r2, #0x14]
	lsls r0, r0, #5
	adds r5, r3, r0
	ldrb r0, [r2, #0x16]
	movs r1, #1
	eors r0, r1
	strb r0, [r2, #0x16]
	lsls r0, r0, #2
	ldr r2, .L080E0A64 @ =0x0F0F0F0F
	lsls r2, r0
	mvns r1, r2
.L080E0A2C:
	ldm r4!, {r0}
	ands r0, r2
	stm r3!, {r0}
	ldm r4!, {r0}
	ands r0, r1
	stm r3!, {r0}
	ldm r4!, {r0}
	ands r0, r2
	stm r3!, {r0}
	ldm r4!, {r0}
	ands r0, r1
	stm r3!, {r0}
	ldm r4!, {r0}
	ands r0, r2
	stm r3!, {r0}
	ldm r4!, {r0}
	ands r0, r1
	stm r3!, {r0}
	ldm r4!, {r0}
	ands r0, r2
	stm r3!, {r0}
	ldm r4!, {r0}
	ands r0, r1
	stm r3!, {r0}
	cmp r3, r5
	bne .L080E0A2C
	movs r0, #1
	b .L080E0A76
	.align 2, 0
.L080E0A64: .4byte 0x0F0F0F0F
.L080E0A68:
	ldrb r2, [r2, #0x14]
	lsls r2, r2, #3
	adds r0, r4, #0
	adds r1, r3, #0
	bl CpuFastSet
	movs r0, #0
.L080E0A76:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start func_080E0A7C
func_080E0A7C: @ 0x080E0A7C
	push {lr}
	bl func_080098AC
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080E0A88
func_080E0A88: @ 0x080E0A88
	push {lr}
	bl func_080098AC
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080E0A94
func_080E0A94: @ 0x080E0A94
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r1, .L080E0C2C @ =gUnk_0871E7A8
	bl func_0805E6CC
	adds r4, r7, #0
	adds r4, #0x30
	adds r0, r4, #0
	bl func_08007128
	adds r0, r4, #0
	bl func_0800736C
	str r0, [r4, #4]
	adds r0, r7, #0
	adds r0, #0x38
	movs r4, #0
	str r4, [r7, #0x38]
	str r4, [r0, #4]
	ldr r6, .L080E0C30 @ =vtable_unk_080E77D0
	str r6, [r0, #8]
	str r4, [r0, #0xc]
	str r4, [r0, #0x10]
	str r4, [r0, #0x14]
	movs r0, #0x34
	bl __builtin_new
	adds r5, r0, #0
	bl func_08007874
	adds r0, r5, #0
	movs r1, #2
	bl func_08007B54
	str r0, [r5, #4]
	adds r0, r5, #0
	adds r0, #8
	str r4, [r5, #8]
	str r4, [r0, #4]
	str r6, [r0, #8]
	str r4, [r0, #0xc]
	str r4, [r0, #0x10]
	str r4, [r0, #0x14]
	adds r0, #0x18
	adds r1, r7, #0
	movs r2, #7
	movs r3, #0x80
	lsls r3, r3, #1
	bl func_0805E824
	str r5, [r7, #0x50]
	adds r1, r7, #0
	adds r1, #0x54
	movs r0, #6
	movs r3, #0
	movs r2, #1
	rsbs r2, r2, #0
.L080E0B0C:
	stm r1!, {r3}
	subs r0, #1
	cmp r0, r2
	bne .L080E0B0C
	movs r0, #0x70
	adds r0, r0, r7
	mov r8, r0
	movs r2, #0xdd
	lsls r2, r2, #2
	adds r4, r7, r2
	movs r5, #2
	movs r0, #0
	mov sb, r0
	movs r6, #1
	rsbs r6, r6, #0
.L080E0B2A:
	adds r0, r4, #0
	bl func_08007874
	mov r2, sb
	str r2, [r4, #4]
	adds r4, #8
	subs r5, #1
	cmp r5, r6
	bne .L080E0B2A
	movs r0, #0xc7
	lsls r0, r0, #2
	add r0, r8
	movs r2, #5
	movs r1, #0
	ldr r4, .L080E0C30 @ =vtable_unk_080E77D0
	movs r3, #1
	rsbs r3, r3, #0
.L080E0B4C:
	str r1, [r0]
	str r1, [r0, #4]
	str r4, [r0, #8]
	str r1, [r0, #0xc]
	str r1, [r0, #0x10]
	str r1, [r0, #0x14]
	adds r0, #0x18
	subs r2, #1
	cmp r2, r3
	bne .L080E0B4C
	movs r6, #0
	movs r5, #0xc2
	lsls r5, r5, #2
	add r5, r8
.L080E0B68:
	lsls r4, r6, #3
	add r4, r8
	movs r0, #0xc1
	lsls r0, r0, #2
	adds r4, r4, r0
	ldr r1, [r5]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #3
	bl func_08007B54
	str r0, [r5]
	adds r5, #8
	adds r6, #1
	cmp r6, #2
	bls .L080E0B68
	movs r2, #0
	mov r8, r2
	movs r6, #0
	movs r0, #0x54
	adds r0, r0, r7
	mov sb, r0
.L080E0B98:
	movs r0, #0x34
	bl __builtin_new
	adds r4, r0, #0
	ldr r1, .L080E0C34 @ =gUnk_080F19CC
	mov r2, r8
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r5, [r0]
	adds r0, r4, #0
	bl func_08007874
	adds r0, r4, #0
	movs r1, #2
	bl func_08007B54
	str r0, [r4, #4]
	adds r1, r4, #0
	adds r1, #8
	str r6, [r4, #8]
	str r6, [r1, #4]
	ldr r0, .L080E0C30 @ =vtable_unk_080E77D0
	str r0, [r1, #8]
	str r6, [r1, #0xc]
	str r6, [r1, #0x10]
	str r6, [r1, #0x14]
	adds r0, r4, #0
	adds r0, #0x20
	adds r1, r7, #0
	adds r2, r5, #0
	movs r3, #0x80
	lsls r3, r3, #1
	bl func_0805E824
	mov r0, sb
	ldr r5, [r0]
	cmp r4, r5
	beq .L080E0C08
	cmp r5, #0
	beq .L080E0C08
	adds r0, r5, #0
	adds r0, #8
	movs r1, #2
	bl func_080098AC
	ldr r1, [r5, #4]
	adds r0, r5, #0
	bl func_08007C28
	adds r0, r5, #0
	movs r1, #2
	bl func_080079E8
	adds r0, r5, #0
	bl __builtin_delete
.L080E0C08:
	mov r2, sb
	adds r2, #4
	mov sb, r2
	subs r2, #4
	stm r2!, {r4}
	movs r0, #1
	add r8, r0
	mov r2, r8
	cmp r2, #6
	bls .L080E0B98
	adds r0, r7, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L080E0C2C: .4byte gUnk_0871E7A8
.L080E0C30: .4byte vtable_unk_080E77D0
.L080E0C34: .4byte gUnk_080F19CC

	thumb_func_start func_080E0C38
func_080E0C38: @ 0x080E0C38
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	str r1, [sp]
	movs r0, #0x70
	adds r0, r0, r6
	mov r8, r0
	movs r1, #0xe3
	lsls r1, r1, #2
	adds r0, r6, r1
	cmp r0, #0
	beq .L080E0C78
	adds r1, #0x90
	adds r4, r6, r1
	cmp r0, r4
	beq .L080E0C78
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r5, r6, r0
.L080E0C66:
	subs r4, #0x18
	ldr r0, [r4, #8]
	ldr r2, [r0, #0xc]
	adds r0, r4, #0
	movs r1, #0
	bl _call_via_r2
	cmp r5, r4
	bne .L080E0C66
.L080E0C78:
	movs r5, #0xc1
	lsls r5, r5, #2
	add r5, r8
	adds r7, r6, #0
	adds r7, #0x54
	movs r1, #0x38
	adds r1, r1, r6
	mov sl, r1
	movs r0, #0x30
	adds r0, r0, r6
	mov sb, r0
	cmp r5, #0
	beq .L080E0CB2
	movs r4, #0xc7
	lsls r4, r4, #2
	add r4, r8
	cmp r5, r4
	beq .L080E0CB2
.L080E0C9C:
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	cmp r5, r4
	bne .L080E0C9C
.L080E0CB2:
	cmp r7, #0
	beq .L080E0CE8
	adds r5, r6, #0
	adds r5, #0x70
.L080E0CBA:
	cmp r7, r5
	beq .L080E0CE8
	subs r5, #4
	ldr r4, [r5]
	cmp r4, #0
	beq .L080E0CBA
	adds r0, r4, #0
	adds r0, #8
	movs r1, #2
	bl func_080098AC
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	adds r0, r4, #0
	bl __builtin_delete
	b .L080E0CBA
.L080E0CE8:
	ldr r4, [r6, #0x50]
	cmp r4, #0
	beq .L080E0D0E
	adds r0, r4, #0
	adds r0, #8
	movs r1, #2
	bl func_080098AC
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	adds r0, r4, #0
	bl __builtin_delete
.L080E0D0E:
	mov r0, sl
	movs r1, #2
	bl func_080098AC
	mov r0, sb
	ldr r1, [r0, #4]
	bl func_080073E0
	mov r0, sb
	movs r1, #2
	bl func_08007184
	ldr r0, .L080E0D4C @ =vtable_unk_080E5A28
	str r0, [r6]
	movs r0, #1
	ldr r1, [sp]
	ands r0, r1
	cmp r0, #0
	beq .L080E0D3A
	adds r0, r6, #0
	bl __builtin_delete
.L080E0D3A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080E0D4C: .4byte vtable_unk_080E5A28

	thumb_func_start func_080E0D50
func_080E0D50: @ 0x080E0D50
	push {lr}
	ldr r3, [r0, #0xc]
	ldr r1, [r0, #0x10]
	ldr r2, [r0, #0x14]
	adds r0, r3, #0
	bl func_08008E64
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start func_080E0D64
func_080E0D64: @ 0x080E0D64
	push {lr}
	bl func_080098AC
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080E0D70
func_080E0D70: @ 0x080E0D70
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	movs r1, #0xd0
	lsls r1, r1, #2
	adds r0, r6, r1
	movs r1, #2
	bl func_080098AC
	movs r0, #0xce
	lsls r0, r0, #2
	adds r4, r6, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	movs r1, #0xc7
	lsls r1, r1, #2
	adds r0, r6, r1
	movs r1, #2
	bl func_080098AC
	movs r0, #0xc5
	lsls r0, r0, #2
	adds r4, r6, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	movs r1, #0xbf
	lsls r1, r1, #2
	adds r0, r6, r1
	movs r1, #2
	bl func_080098AC
	movs r0, #0xbd
	lsls r0, r0, #2
	adds r4, r6, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	movs r1, #0xb6
	lsls r1, r1, #2
	adds r0, r6, r1
	movs r1, #2
	bl func_080098AC
	movs r0, #0xb4
	lsls r0, r0, #2
	adds r4, r6, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	movs r1, #0xad
	lsls r1, r1, #2
	adds r0, r6, r1
	movs r1, #2
	bl func_080098AC
	movs r0, #0xaa
	lsls r0, r0, #2
	adds r4, r6, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	movs r1, #0xc8
	lsls r1, r1, #1
	adds r0, r6, r1
	movs r1, #2
	bl func_080098AC
	movs r0, #0xc2
	lsls r0, r0, #1
	adds r4, r6, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	adds r0, r6, #0
	adds r0, #0x68
	movs r1, #2
	bl func_080098AC
	adds r4, r6, #0
	adds r4, #0x60
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	ldr r0, .L080E0E7C @ =vtable_unk_080E5A28
	str r0, [r6, #0x30]
	str r0, [r6]
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq .L080E0E74
	adds r0, r6, #0
	bl __builtin_delete
.L080E0E74:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080E0E7C: .4byte vtable_unk_080E5A28

	thumb_func_start func_080E0E80
func_080E0E80: @ 0x080E0E80
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r2, #0
	subs r3, r1, r6
.L080E0E88:
	cmp r3, #0
	ble .L080E0EAC
	asrs r2, r3, #1
	adds r5, r6, r2
	ldrb r1, [r5]
	movs r4, #0
	ldr r0, [r7]
	cmp r1, r0
	bhs .L080E0E9C
	movs r4, #1
.L080E0E9C:
	cmp r4, #0
	beq .L080E0EA8
	adds r6, r5, #1
	subs r0, r3, r2
	subs r3, r0, #1
	b .L080E0E88
.L080E0EA8:
	adds r3, r2, #0
	b .L080E0E88
.L080E0EAC:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	.section ".text.code_080E0EF0"

	thumb_func_start func_080E0EF0
func_080E0EF0: @ 0x080E0EF0
	push {lr}
	bl _._13AScriptEngine
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080E0EFC
func_080E0EFC: @ 0x080E0EFC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #1
	ldr r2, .L080E0F44 @ =0x19999999
	movs r1, #0xa
	cmp r5, #0xa
	blo .L080E0F1C
	adds r4, #1
.L080E0F0C:
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r1, r0, #1
	cmp r5, r1
	blo .L080E0F1C
	adds r4, #1
	cmp r1, r2
	bls .L080E0F0C
.L080E0F1C:
	movs r0, #0
	strb r0, [r4]
.L080E0F20:
	subs r4, #1
	adds r0, r5, #0
	movs r1, #0xa
	bl __udivsi3
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #1
	subs r1, r5, r1
	adds r1, #0x30
	strb r1, [r4]
	adds r5, r0, #0
	cmp r5, #0
	bne .L080E0F20
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080E0F44: .4byte 0x19999999

	thumb_func_start func_080E0F48
func_080E0F48: @ 0x080E0F48
	push {r4, r5, lr}
	ldr r5, [r0, #0xc]
	movs r0, #0
	ldr r1, [r5]
	cmp r1, #0
	bne .L080E0F56
	movs r0, #1
.L080E0F56:
	cmp r0, #0
	bne .L080E0F86
	adds r4, r5, #4
	lsls r1, r1, #4
	adds r1, r4, r1
	adds r0, r4, #0
	bl func_08009094
	ldr r0, [r5]
	lsls r0, r0, #4
	adds r0, #4
	adds r0, r5, r0
	adds r2, r0, #0
	adds r1, r4, #0
	ldr r3, [r5]
	cmp r1, r2
	beq .L080E0F7E
.L080E0F78:
	adds r1, #0x10
	cmp r1, r2
	bne .L080E0F78
.L080E0F7E:
	subs r0, r0, r4
	asrs r0, r0, #4
	subs r0, r3, r0
	str r0, [r5]
.L080E0F86:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080E0F90
func_080E0F90: @ 0x080E0F90
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, [r0, #0xc]
	mov r8, r0
	movs r1, #0
.L080E0F9E:
	movs r7, #0
	lsls r0, r1, #2
	adds r1, #1
	mov sb, r1
	mov r1, r8
	adds r6, r0, r1
	adds r6, #8
.L080E0FAC:
	ldr r0, [r6]
	lsls r1, r7, #4
	adds r5, r0, r1
	ldrb r0, [r5, #0xc]
	cmp r0, #0
	beq .L080E0FE2
	adds r2, r5, #4
	ldr r1, [r2, #4]
	rsbs r0, r1, #0
	orrs r0, r1
	cmp r0, #0
	bge .L080E0FDE
	ldr r4, [r5]
	adds r4, #4
	adds r0, r2, #0
	bl func_08007D4C
	adds r1, r0, #0
	lsls r1, r1, #5
	ldr r0, .L080E1014 @ =0x06010000
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0x40
	bl CpuFastSet
.L080E0FDE:
	movs r0, #0
	strb r0, [r5, #0xc]
.L080E0FE2:
	adds r7, #1
	cmp r7, #6
	ble .L080E0FAC
	mov r1, sb
	cmp r1, #2
	ble .L080E0F9E
	mov r1, r8
	ldrb r0, [r1, #0x19]
	cmp r0, #0
	beq .L080E0FFA
	movs r0, #0
	strb r0, [r1, #0x19]
.L080E0FFA:
	mov r1, r8
	ldrb r0, [r1, #0x1a]
	cmp r0, #0
	beq .L080E1006
	movs r0, #0
	strb r0, [r1, #0x1a]
.L080E1006:
	movs r0, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L080E1014: .4byte 0x06010000

	thumb_func_start func_080E1018
func_080E1018: @ 0x080E1018
	push {lr}
	bl func_080098AC
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080E1024
func_080E1024: @ 0x080E1024
	push {lr}
	bl func_080098AC
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080E1030
func_080E1030: @ 0x080E1030
	push {lr}
	bl func_080098AC
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080E103C
func_080E103C: @ 0x080E103C
	push {lr}
	adds r2, r0, #0
	ldr r0, .L080E1058 @ =vtable_unk_080E78F0
	str r0, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L080E1052
	adds r0, r2, #0
	bl __builtin_delete
.L080E1052:
	pop {r0}
	bx r0
	.align 2, 0
.L080E1058: .4byte vtable_unk_080E78F0

	thumb_func_start func_080E105C
func_080E105C: @ 0x080E105C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	mov sl, r1
	adds r0, #8
	cmp r0, #0
	beq .L080E10B8
	mov r7, r8
	adds r7, #0x14
	cmp r0, r7
	beq .L080E10B8
.L080E1078:
	subs r7, #4
	ldr r0, [r7]
	movs r1, #8
	add r1, r8
	mov sb, r1
	cmp r0, #0
	beq .L080E10B4
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x70
	cmp r6, r5
	beq .L080E10AE
.L080E1090:
	subs r5, #0x10
	adds r4, r5, #4
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	ldr r0, [r5]
	bl __builtin_delete
	cmp r6, r5
	bne .L080E1090
.L080E10AE:
	adds r0, r6, #0
	bl __builtin_delete
.L080E10B4:
	cmp sb, r7
	bne .L080E1078
.L080E10B8:
	ldr r0, .L080E10DC @ =vtable_unk_080E7908
	mov r1, r8
	str r0, [r1]
	movs r0, #1
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq .L080E10CE
	mov r0, r8
	bl __builtin_delete
.L080E10CE:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080E10DC: .4byte vtable_unk_080E7908

	thumb_func_start func_080E10E0
func_080E10E0: @ 0x080E10E0
	push {lr}
	bl func_080098AC
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080E10EC
func_080E10EC: @ 0x080E10EC
	movs r0, #1
	bx lr
.L080E10F0:
	.byte 0x00, 0x20, 0x70, 0x47, 0x00, 0x20, 0x70, 0x47

	thumb_func_start func_080E10F8
func_080E10F8: @ 0x080E10F8
	push {lr}
	adds r2, r0, #0
	ldr r0, .L080E1114 @ =vtable_unk_080E78F0
	str r0, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L080E110E
	adds r0, r2, #0
	bl __builtin_delete
.L080E110E:
	pop {r0}
	bx r0
	.align 2, 0
.L080E1114: .4byte vtable_unk_080E78F0
.L080E1118:
	.byte 0x00, 0x20, 0x70, 0x47, 0x70, 0x47, 0x00, 0x00
	.byte 0x70, 0x47, 0x00, 0x00, 0x70, 0x47, 0x00, 0x00

	thumb_func_start func_080E1128
func_080E1128: @ 0x080E1128
	push {lr}
	adds r2, r0, #0
	ldr r0, .L080E1144 @ =vtable_unk_080E7908
	str r0, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L080E113E
	adds r0, r2, #0
	bl __builtin_delete
.L080E113E:
	pop {r0}
	bx r0
	.align 2, 0
.L080E1144: .4byte vtable_unk_080E7908

	thumb_func_start func_080E1148
func_080E1148: @ 0x080E1148
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r5, #0
	adds r4, #0xb0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	ldr r0, .L080E1188 @ =vtable_unk_080E5A28
	str r0, [r5, #0x10]
	adds r0, r5, #0
	adds r1, r6, #0
	bl func_080086BC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080E1188: .4byte vtable_unk_080E5A28

	thumb_func_start func_080E118C
func_080E118C: @ 0x080E118C
	push {r4, r5, r6, lr}
	sub sp, #0x24
	adds r6, r0, #0
	cmp r2, #0xff
	bne .L080E11D4
	add r4, sp, #0x20
	ldrh r1, [r1, #4]
	adds r0, r4, #0
	bl __7ArticleUi
	adds r0, r4, #0
	bl GetName__C7Article
	adds r5, r0, #0
	bl strlen
	adds r4, r0, #0
	cmp r4, #0x1f
	bls .L080E11B4
	movs r4, #0x1f
.L080E11B4:
	mov r0, sp
	adds r1, r5, #0
	adds r2, r4, #0
	bl memcpy
	mov r0, sp
	adds r1, r0, r4
	movs r0, #0
	strb r0, [r1]
	movs r0, #1
	strb r0, [r6]
	adds r0, r6, #4
	mov r1, sp
	bl strcpy
	b .L080E11E2
.L080E11D4:
	mov r1, sp
	movs r0, #0
	strb r0, [r1]
	strb r0, [r6]
	adds r0, r6, #4
	bl strcpy
.L080E11E2:
	adds r0, r6, #0
	add sp, #0x24
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start func_080E11EC
func_080E11EC: @ 0x080E11EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	mov sl, r1
	ldr r0, .L080E148C @ =0x000023A0
	adds r1, r6, r0
	ldr r0, .L080E1490 @ =vtable_unk_080E76F8
	str r0, [r1]
	movs r1, #0xa8
	lsls r1, r1, #3
	adds r5, r6, r1
	movs r2, #0xa9
	lsls r2, r2, #3
	adds r0, r6, r2
	cmp r0, #0
	beq .L080E1232
	adds r1, #0x18
	adds r4, r6, r1
	cmp r0, r4
	beq .L080E1232
	adds r7, r0, #0
.L080E121C:
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	cmp r7, r4
	bne .L080E121C
.L080E1232:
	ldr r1, [r5, #4]
	adds r0, r5, #0
	bl func_08007C28
	adds r0, r5, #0
	movs r1, #2
	bl func_080079E8
	movs r2, #0xa0
	lsls r2, r2, #3
	adds r0, r6, r2
	movs r1, #0xe0
	adds r1, r1, r6
	mov r8, r1
	adds r7, r6, #0
	adds r7, #0xb0
	movs r2, #0x80
	adds r2, r2, r6
	mov sb, r2
	cmp r0, #0
	beq .L080E1296
	movs r1, #0xa8
	lsls r1, r1, #3
	adds r5, r6, r1
	cmp r0, r5
	beq .L080E1296
.L080E1266:
	subs r5, #0x10
	adds r4, r5, #0
	adds r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	ldr r1, [r5, #4]
	adds r0, r5, #0
	bl func_08007C28
	adds r0, r5, #0
	movs r1, #2
	bl func_080079E8
	movs r2, #0xa0
	lsls r2, r2, #3
	adds r0, r6, r2
	cmp r0, r5
	bne .L080E1266
.L080E1296:
	movs r0, #0x9f
	lsls r0, r0, #3
	adds r4, r6, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	movs r1, #0x9e
	lsls r1, r1, #3
	adds r4, r6, r1
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	movs r2, #0x9d
	lsls r2, r2, #3
	adds r4, r6, r2
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	movs r0, #0x9c
	lsls r0, r0, #3
	adds r4, r6, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	movs r1, #0x9b
	lsls r1, r1, #3
	adds r4, r6, r1
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	movs r2, #0x9a
	lsls r2, r2, #3
	adds r4, r6, r2
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	movs r0, #0x99
	lsls r0, r0, #3
	adds r4, r6, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	movs r1, #0x98
	lsls r1, r1, #3
	adds r4, r6, r1
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	movs r2, #0x97
	lsls r2, r2, #3
	adds r4, r6, r2
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	movs r0, #0x96
	lsls r0, r0, #3
	adds r4, r6, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	movs r1, #0x95
	lsls r1, r1, #3
	adds r4, r6, r1
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	movs r2, #0x94
	lsls r2, r2, #3
	adds r4, r6, r2
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	movs r0, #0x93
	lsls r0, r0, #3
	adds r4, r6, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	movs r1, #0x92
	lsls r1, r1, #3
	adds r4, r6, r1
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	movs r2, #0x91
	lsls r2, r2, #3
	adds r4, r6, r2
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	movs r0, #0x90
	lsls r0, r0, #3
	adds r4, r6, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	movs r1, #0x8f
	lsls r1, r1, #3
	adds r4, r6, r1
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	movs r2, #0x8e
	lsls r2, r2, #3
	adds r4, r6, r2
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	movs r0, #0x8d
	lsls r0, r0, #3
	adds r4, r6, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	movs r2, #0xe8
	lsls r2, r2, #1
	adds r1, r6, r2
	ldr r0, .L080E1494 @ =vtable_unk_080E5A28
	str r0, [r1]
	subs r2, #0x30
	adds r1, r6, r2
	str r0, [r1]
	subs r2, #0x30
	adds r1, r6, r2
	str r0, [r1]
	subs r2, #0x30
	adds r1, r6, r2
	str r0, [r1]
	subs r2, #0x30
	adds r1, r6, r2
	str r0, [r1]
	mov r1, r8
	str r0, [r1]
	str r0, [r7]
	mov r2, sb
	str r0, [r2]
	str r0, [r6, #0x50]
	str r0, [r6, #0x20]
	ldr r0, [r6, #0x10]
	cmp r0, #0
	beq .L080E1474
	movs r1, #3
	bl func_08050D0C
.L080E1474:
	adds r0, r6, #0
	mov r1, sl
	bl func_080086BC
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080E148C: .4byte 0x000023A0
.L080E1490: .4byte vtable_unk_080E76F8
.L080E1494: .4byte vtable_unk_080E5A28

	thumb_func_start func_080E1498
func_080E1498: @ 0x080E1498
	push {lr}
	adds r2, r0, #0
	ldr r0, .L080E14B4 @ =vtable_unk_080E76F8
	str r0, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L080E14AE
	adds r0, r2, #0
	bl __builtin_delete
.L080E14AE:
	pop {r0}
	bx r0
	.align 2, 0
.L080E14B4: .4byte vtable_unk_080E76F8

	thumb_func_start func_080E14B8
func_080E14B8: @ 0x080E14B8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r7, r0, #0
	adds r3, r1, #0
	adds r0, r2, #0
	subs r0, #0xfa
	cmp r0, #5
	bhi .L080E1578
	lsls r0, r0, #2
	ldr r1, .L080E14D4 @ =.L080E14D8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L080E14D4: .4byte .L080E14D8
.L080E14D8: @ jump table
	.4byte .L080E14F0 @ case 0
	.4byte .L080E1588 @ case 1
	.4byte .L080E1528 @ case 2
	.4byte .L080E152C @ case 3
	.4byte .L080E1530 @ case 4
	.4byte .L080E1534 @ case 5
.L080E14F0:
	ldr r0, [r3, #0x14]
	mov r1, sp
	movs r2, #0
	bl func_0804EC84
	add r5, sp, #8
	mov r0, sp
	bl strlen
	adds r4, r0, #0
	cmp r4, #0x1f
	bls .L080E150A
	movs r4, #0x1f
.L080E150A:
	adds r0, r5, #0
	mov r1, sp
	adds r2, r4, #0
	bl memcpy
	adds r1, r5, r4
	movs r0, #0
	strb r0, [r1]
	movs r0, #1
	strb r0, [r7]
	adds r0, r7, #4
	adds r1, r5, #0
	bl strcpy
	b .L080E15B6
.L080E1528:
	ldr r1, [r3, #4]
	b .L080E1536
.L080E152C:
	ldr r1, [r3, #8]
	b .L080E1536
.L080E1530:
	ldr r1, [r3, #0xc]
	b .L080E1536
.L080E1534:
	ldr r1, [r3, #0x10]
.L080E1536:
	cmp r1, #0x80
	beq .L080E1588
	add r6, sp, #8
	movs r0, #0xd
	adds r5, r1, #0
	muls r5, r0, r5
	ldr r0, .L080E1574 @ =gUnk_080FA796
	adds r5, r5, r0
	adds r0, r5, #0
	bl strlen
	adds r4, r0, #0
	cmp r4, #0x1f
	bls .L080E1554
	movs r4, #0x1f
.L080E1554:
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl memcpy
	adds r1, r6, r4
	movs r0, #0
	strb r0, [r1]
	movs r0, #1
	strb r0, [r7]
	adds r0, r7, #4
	adds r1, r6, #0
	bl strcpy
	b .L080E15B6
	.align 2, 0
.L080E1574: .4byte gUnk_080FA796
.L080E1578:
	add r1, sp, #8
	movs r0, #0
	strb r0, [r1]
	strb r0, [r7]
	adds r0, r7, #4
	bl strcpy
	b .L080E15B6
.L080E1588:
	ldr r5, [r3, #0x18]
	adds r0, r5, #0
	bl strlen
	adds r4, r0, #0
	cmp r4, #0x1f
	bls .L080E1598
	movs r4, #0x1f
.L080E1598:
	mov r0, sp
	adds r1, r5, #0
	adds r2, r4, #0
	bl memcpy
	mov r0, sp
	adds r1, r0, r4
	movs r0, #0
	strb r0, [r1]
	movs r0, #1
	strb r0, [r7]
	adds r0, r7, #4
	mov r1, sp
	bl strcpy
.L080E15B6:
	adds r0, r7, #0
	add sp, #0x28
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start func_080E15C0
func_080E15C0: @ 0x080E15C0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	mov r8, r1
	movs r0, #0xa7
	lsls r0, r0, #5
	adds r1, r7, r0
	ldr r0, .L080E181C @ =vtable_unk_080E76F8
	str r0, [r1]
	movs r1, #0xcb
	lsls r1, r1, #3
	adds r0, r7, r1
	cmp r0, #0
	beq .L080E162C
	movs r2, #0xd7
	lsls r2, r2, #3
	adds r5, r7, r2
	cmp r0, r5
	beq .L080E162C
.L080E15E8:
	subs r5, #0x18
	adds r0, r5, #0
	adds r0, #8
	cmp r0, #0
	beq .L080E1612
	adds r4, r5, #0
	adds r4, #0x18
	cmp r0, r4
	beq .L080E1612
	adds r6, r0, #0
.L080E15FC:
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	cmp r6, r4
	bne .L080E15FC
.L080E1612:
	ldr r1, [r5, #4]
	adds r0, r5, #0
	bl func_08007C28
	adds r0, r5, #0
	movs r1, #2
	bl func_080079E8
	movs r1, #0xcb
	lsls r1, r1, #3
	adds r0, r7, r1
	cmp r0, r5
	bne .L080E15E8
.L080E162C:
	movs r2, #0xca
	lsls r2, r2, #3
	adds r4, r7, r2
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	movs r0, #0xc9
	lsls r0, r0, #3
	adds r4, r7, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	movs r1, #0xc8
	lsls r1, r1, #3
	adds r4, r7, r1
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	movs r2, #0xc7
	lsls r2, r2, #3
	adds r4, r7, r2
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	movs r0, #0xc6
	lsls r0, r0, #3
	adds r4, r7, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	movs r1, #0xc5
	lsls r1, r1, #3
	adds r4, r7, r1
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	movs r2, #0xc4
	lsls r2, r2, #3
	adds r4, r7, r2
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	movs r0, #0xc3
	lsls r0, r0, #3
	adds r4, r7, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	movs r1, #0xc2
	lsls r1, r1, #3
	adds r4, r7, r1
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	movs r2, #0xc1
	lsls r2, r2, #3
	adds r4, r7, r2
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	movs r0, #0xc0
	lsls r0, r0, #3
	adds r4, r7, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	movs r1, #0xbf
	lsls r1, r1, #3
	adds r4, r7, r1
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	movs r2, #0xbe
	lsls r2, r2, #3
	adds r4, r7, r2
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	movs r0, #0xbd
	lsls r0, r0, #3
	adds r4, r7, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	movs r1, #0xbc
	lsls r1, r1, #3
	adds r4, r7, r1
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	movs r2, #0xbb
	lsls r2, r2, #3
	adds r4, r7, r2
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	movs r0, #0xba
	lsls r0, r0, #3
	adds r4, r7, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	movs r1, #0xb9
	lsls r1, r1, #3
	adds r4, r7, r1
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	movs r2, #0xb8
	lsls r2, r2, #3
	adds r4, r7, r2
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	movs r0, #0xd0
	lsls r0, r0, #1
	adds r1, r7, r0
	ldr r0, .L080E1820 @ =vtable_unk_080E5A28
	str r0, [r1]
	movs r2, #0xb8
	lsls r2, r2, #1
	adds r1, r7, r2
	str r0, [r1]
	subs r2, #0x30
	adds r1, r7, r2
	str r0, [r1]
	subs r2, #0x30
	adds r1, r7, r2
	str r0, [r1]
	adds r1, r7, #0
	adds r1, #0xe0
	str r0, [r1]
	subs r1, #0x30
	str r0, [r1]
	subs r1, #0x30
	str r0, [r1]
	str r0, [r7, #0x50]
	str r0, [r7, #0x20]
	ldr r0, [r7, #0x10]
	cmp r0, #0
	beq .L080E180A
	movs r1, #3
	bl func_08050D0C
.L080E180A:
	adds r0, r7, #0
	mov r1, r8
	bl func_080086BC
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080E181C: .4byte vtable_unk_080E76F8
.L080E1820: .4byte vtable_unk_080E5A28

	thumb_func_start func_080E1824
func_080E1824: @ 0x080E1824
	push {lr}
	adds r2, r0, #0
	ldr r0, .L080E1840 @ =vtable_unk_080E76F8
	str r0, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L080E183A
	adds r0, r2, #0
	bl __builtin_delete
.L080E183A:
	pop {r0}
	bx r0
	.align 2, 0
.L080E1840: .4byte vtable_unk_080E76F8

	thumb_func_start func_080E1844
func_080E1844: @ 0x080E1844
	push {r4, r5, r6, lr}
	sub sp, #0x20
	adds r6, r0, #0
	cmp r2, #0xff
	bne .L080E188C
	ldr r0, [r1, #4]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, .L080E1888 @ =gUnk_080FB000
	adds r5, r1, r0
	adds r0, r5, #0
	bl strlen
	adds r4, r0, #0
	cmp r4, #0x1f
	bls .L080E1868
	movs r4, #0x1f
.L080E1868:
	mov r0, sp
	adds r1, r5, #0
	adds r2, r4, #0
	bl memcpy
	mov r0, sp
	adds r1, r0, r4
	movs r0, #0
	strb r0, [r1]
	movs r0, #1
	strb r0, [r6]
	adds r0, r6, #4
	mov r1, sp
	bl strcpy
	b .L080E189A
	.align 2, 0
.L080E1888: .4byte gUnk_080FB000
.L080E188C:
	mov r1, sp
	movs r0, #0
	strb r0, [r1]
	strb r0, [r6]
	adds r0, r6, #4
	bl strcpy
.L080E189A:
	adds r0, r6, #0
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start func_080E18A4
func_080E18A4: @ 0x080E18A4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, .L080E1958 @ =0x00000AEC
	adds r1, r5, r0
	ldr r0, .L080E195C @ =vtable_unk_080E76F8
	str r0, [r1]
	movs r0, #0xa2
	lsls r0, r0, #1
	adds r4, r5, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	movs r0, #0x9e
	lsls r0, r0, #1
	adds r4, r5, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	movs r0, #0x9a
	lsls r0, r0, #1
	adds r4, r5, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	movs r0, #0x96
	lsls r0, r0, #1
	adds r4, r5, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	movs r0, #0x92
	lsls r0, r0, #1
	adds r4, r5, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	movs r0, #0x8e
	lsls r0, r0, #1
	adds r4, r5, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	ldr r0, .L080E1960 @ =vtable_unk_080E5A28
	str r0, [r5, #0x50]
	str r0, [r5, #0x20]
	ldr r0, [r5, #0x10]
	cmp r0, #0
	beq .L080E1948
	movs r1, #3
	bl func_08050D0C
.L080E1948:
	adds r0, r5, #0
	adds r1, r6, #0
	bl func_080086BC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080E1958: .4byte 0x00000AEC
.L080E195C: .4byte vtable_unk_080E76F8
.L080E1960: .4byte vtable_unk_080E5A28

	thumb_func_start func_080E1964
func_080E1964: @ 0x080E1964
	push {lr}
	adds r2, r0, #0
	ldr r0, .L080E1980 @ =vtable_unk_080E76F8
	str r0, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L080E197A
	adds r0, r2, #0
	bl __builtin_delete
.L080E197A:
	pop {r0}
	bx r0
	.align 2, 0
.L080E1980: .4byte vtable_unk_080E76F8

	thumb_func_start func_080E1984
func_080E1984: @ 0x080E1984
	push {lr}
	adds r2, r0, #0
	ldr r0, .L080E19A0 @ =vtable_unk_080E5A28
	str r0, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L080E199A
	adds r0, r2, #0
	bl __builtin_delete
.L080E199A:
	pop {r0}
	bx r0
	.align 2, 0
.L080E19A0: .4byte vtable_unk_080E5A28

	thumb_func_start func_080E19A4
func_080E19A4: @ 0x080E19A4
	push {r4, r5, r6, lr}
	sub sp, #0x20
	adds r5, r0, #0
	cmp r2, #0xff
	bne .L080E19DE
	ldr r6, [r1, #4]
	adds r0, r6, #0
	bl strlen
	adds r4, r0, #0
	cmp r4, #0x1f
	bls .L080E19BE
	movs r4, #0x1f
.L080E19BE:
	mov r0, sp
	adds r1, r6, #0
	adds r2, r4, #0
	bl memcpy
	mov r0, sp
	adds r1, r0, r4
	movs r0, #0
	strb r0, [r1]
	movs r0, #1
	strb r0, [r5]
	adds r0, r5, #4
	mov r1, sp
	bl strcpy
	b .L080E19EC
.L080E19DE:
	mov r1, sp
	movs r0, #0
	strb r0, [r1]
	strb r0, [r5]
	adds r0, r5, #4
	bl strcpy
.L080E19EC:
	adds r0, r5, #0
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080E19F8
func_080E19F8: @ 0x080E19F8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L080E1A20 @ =0x00006428
	adds r1, r4, r0
	ldr r0, .L080E1A24 @ =vtable_unk_080E76F8
	str r0, [r1]
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq .L080E1A12
	movs r1, #3
	bl func_08050D0C
.L080E1A12:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_080086BC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080E1A20: .4byte 0x00006428
.L080E1A24: .4byte vtable_unk_080E76F8

	thumb_func_start func_080E1A28
func_080E1A28: @ 0x080E1A28
	push {lr}
	adds r2, r0, #0
	ldr r0, .L080E1A44 @ =vtable_unk_080E76F8
	str r0, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L080E1A3E
	adds r0, r2, #0
	bl __builtin_delete
.L080E1A3E:
	pop {r0}
	bx r0
	.align 2, 0
.L080E1A44: .4byte vtable_unk_080E76F8

	thumb_func_start func_080E1A48
func_080E1A48: @ 0x080E1A48
	push {lr}
	bl func_08076EA8
	movs r0, #1
	pop {r1}
	bx r1

	thumb_func_start func_080E1A54
func_080E1A54: @ 0x080E1A54
	push {lr}
	ldr r2, .L080E1A68 @ =0x000009C4
	adds r3, r0, r2
	ldr r2, .L080E1A6C @ =vtable_unk_080E5A28
	str r2, [r3]
	bl func_08076E0C
	pop {r0}
	bx r0
	.align 2, 0
.L080E1A68: .4byte 0x000009C4
.L080E1A6C: .4byte vtable_unk_080E5A28

	thumb_func_start func_080E1A70
func_080E1A70: @ 0x080E1A70
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	adds r7, r0, #0
	bl func_08076EA8
	movs r0, #0
	mov r8, r0
	ldr r1, .L080E1C08 @ =0x00001268
	adds r0, r7, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, #0x30
	movs r3, #0xb2
	lsls r3, r3, #3
	adds r1, r7, r3
	movs r2, #0
	ldrsh r1, [r1, r2]
	cmp r0, r1
	bge .L080E1AB4
	adds r2, r1, #0
	ldr r3, .L080E1C08 @ =0x00001268
	adds r1, r7, r3
.L080E1AA4:
	adds r1, #0x10
	movs r0, #1
	add r8, r0
	movs r3, #0
	ldrsh r0, [r1, r3]
	adds r0, #0x30
	cmp r0, r2
	blt .L080E1AA4
.L080E1AB4:
	ldr r1, .L080E1C0C @ =0x00001264
	adds r0, r7, r1
	ldr r0, [r0]
	ldr r2, .L080E1C10 @ =0x0000163C
	adds r2, r7, r2
	str r2, [sp, #0x20]
	cmp r8, r0
	bhs .L080E1B40
	adds r3, r1, #0
	adds r3, r3, r7
	mov sl, r3
	movs r0, #0xb2
	lsls r0, r0, #3
	adds r0, r0, r7
	mov sb, r0
	mov r1, r8
	lsls r0, r1, #4
	ldr r2, .L080E1C08 @ =0x00001268
	adds r0, r0, r2
	adds r5, r0, r7
.L080E1ADC:
	movs r3, #0
	ldrsh r1, [r5, r3]
	mov r2, sb
	movs r3, #0
	ldrsh r0, [r2, r3]
	adds r0, #0xa0
	cmp r1, r0
	bgt .L080E1B32
	ldr r0, [r7]
	bl func_08008920
	adds r4, r0, #0
	movs r0, #0
	ldrsh r2, [r5, r0]
	mov r1, sb
	movs r3, #0
	ldrsh r0, [r1, r3]
	subs r2, r2, r0
	ldr r1, [r5, #4]
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	add r6, sp, #0x10
	adds r0, r6, #0
	movs r3, #0x10
	bl func_0804EA94
	ldrb r2, [r4]
	cmp r2, #0x7f
	bhi .L080E1B32
	lsls r1, r2, #3
	adds r1, #4
	adds r1, r4, r1
	ldr r0, [sp, #0x10]
	str r0, [r1]
	ldrh r0, [r6, #4]
	strh r0, [r1, #4]
	adds r0, r2, #1
	strb r0, [r4]
.L080E1B32:
	adds r5, #0x10
	movs r0, #1
	add r8, r0
	mov r1, sl
	ldr r0, [r1]
	cmp r8, r0
	blo .L080E1ADC
.L080E1B40:
	movs r2, #0
	mov r8, r2
	ldr r3, [sp, #0x20]
	movs r1, #0
	ldrsh r0, [r3, r1]
	adds r0, #0x30
	movs r2, #0xb2
	lsls r2, r2, #3
	adds r1, r7, r2
	movs r3, #0
	ldrsh r1, [r1, r3]
	cmp r0, r1
	bge .L080E1B70
	adds r2, r1, #0
	ldr r0, .L080E1C10 @ =0x0000163C
	adds r1, r7, r0
.L080E1B60:
	adds r1, #0x10
	movs r3, #1
	add r8, r3
	movs r3, #0
	ldrsh r0, [r1, r3]
	adds r0, #0x30
	cmp r0, r2
	blt .L080E1B60
.L080E1B70:
	ldr r1, .L080E1C14 @ =0x00001638
	adds r0, r7, r1
	ldr r0, [r0]
	cmp r8, r0
	bhs .L080E1BF4
	adds r2, r1, #0
	adds r2, r2, r7
	mov sl, r2
	movs r3, #0xb2
	lsls r3, r3, #3
	adds r3, r3, r7
	mov sb, r3
	mov r1, r8
	lsls r0, r1, #4
	ldr r2, .L080E1C10 @ =0x0000163C
	adds r0, r0, r2
	adds r6, r0, r7
.L080E1B92:
	movs r3, #0
	ldrsh r1, [r6, r3]
	mov r2, sb
	movs r3, #0
	ldrsh r0, [r2, r3]
	adds r0, #0xa0
	cmp r1, r0
	bgt .L080E1BE6
	ldr r0, [r7]
	bl func_08008920
	adds r4, r0, #0
	movs r0, #0
	ldrsh r2, [r6, r0]
	mov r1, sb
	movs r3, #0
	ldrsh r0, [r1, r3]
	subs r2, r2, r0
	ldr r1, [r6, #4]
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	add r5, sp, #0x18
	adds r0, r5, #0
	movs r3, #5
	bl func_0804EA94
	ldrb r2, [r4]
	cmp r2, #0x7f
	bhi .L080E1BE6
	lsls r1, r2, #3
	adds r1, #4
	adds r1, r4, r1
	ldr r0, [sp, #0x18]
	str r0, [r1]
	ldrh r0, [r5, #4]
	strh r0, [r1, #4]
	adds r0, r2, #1
	strb r0, [r4]
.L080E1BE6:
	adds r6, #0x10
	movs r0, #1
	add r8, r0
	mov r1, sl
	ldr r0, [r1]
	cmp r8, r0
	blo .L080E1B92
.L080E1BF4:
	movs r0, #1
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L080E1C08: .4byte 0x00001268
.L080E1C0C: .4byte 0x00001264
.L080E1C10: .4byte 0x0000163C
.L080E1C14: .4byte 0x00001638

	thumb_func_start func_080E1C18
func_080E1C18: @ 0x080E1C18
	push {r4, lr}
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, .L080E1C60 @ =0x00001638
	adds r1, r2, r0
	ldr r0, [r1]
	lsls r0, r0, #4
	adds r0, #4
	adds r1, r1, r0
	ldr r4, .L080E1C64 @ =0x0000163C
	adds r0, r2, r4
	cmp r0, r1
	beq .L080E1C38
.L080E1C32:
	adds r0, #0x10
	cmp r0, r1
	bne .L080E1C32
.L080E1C38:
	ldr r0, .L080E1C68 @ =0x00001264
	adds r1, r2, r0
	ldr r0, [r1]
	lsls r0, r0, #4
	adds r0, #4
	adds r1, r1, r0
	ldr r4, .L080E1C6C @ =0x00001268
	adds r0, r2, r4
	cmp r0, r1
	beq .L080E1C52
.L080E1C4C:
	adds r0, #0x10
	cmp r0, r1
	bne .L080E1C4C
.L080E1C52:
	adds r0, r2, #0
	adds r1, r3, #0
	bl func_08076E0C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080E1C60: .4byte 0x00001638
.L080E1C64: .4byte 0x0000163C
.L080E1C68: .4byte 0x00001264
.L080E1C6C: .4byte 0x00001268

	thumb_func_start func_080E1C70
func_080E1C70: @ 0x080E1C70
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r7, r0, #0
	bl func_08076EA8
	movs r0, #0
	mov r8, r0
	ldr r1, .L080E1D4C @ =0x00002168
	adds r0, r7, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, #0x30
	movs r3, #0xb2
	lsls r3, r3, #3
	adds r1, r7, r3
	movs r2, #0
	ldrsh r1, [r1, r2]
	cmp r0, r1
	bge .L080E1CB4
	adds r2, r1, #0
	ldr r3, .L080E1D4C @ =0x00002168
	adds r1, r7, r3
.L080E1CA4:
	adds r1, #0x10
	movs r0, #1
	add r8, r0
	movs r3, #0
	ldrsh r0, [r1, r3]
	adds r0, #0x30
	cmp r0, r2
	blt .L080E1CA4
.L080E1CB4:
	ldr r1, .L080E1D50 @ =0x00002164
	adds r0, r7, r1
	ldr r0, [r0]
	cmp r8, r0
	bhs .L080E1D38
	adds r2, r1, #0
	adds r2, r2, r7
	mov sl, r2
	movs r3, #0xb2
	lsls r3, r3, #3
	adds r3, r3, r7
	mov sb, r3
	mov r1, r8
	lsls r0, r1, #4
	ldr r2, .L080E1D4C @ =0x00002168
	adds r0, r0, r2
	adds r5, r0, r7
.L080E1CD6:
	movs r3, #0
	ldrsh r1, [r5, r3]
	mov r2, sb
	movs r3, #0
	ldrsh r0, [r2, r3]
	adds r0, #0xa0
	cmp r1, r0
	bgt .L080E1D2A
	ldr r0, [r7]
	bl func_08008920
	adds r4, r0, #0
	movs r0, #0
	ldrsh r2, [r5, r0]
	mov r1, sb
	movs r3, #0
	ldrsh r0, [r1, r3]
	subs r2, r2, r0
	ldr r1, [r5, #4]
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	add r6, sp, #0x10
	adds r0, r6, #0
	movs r3, #5
	bl func_0804EA94
	ldrb r2, [r4]
	cmp r2, #0x7f
	bhi .L080E1D2A
	lsls r1, r2, #3
	adds r1, #4
	adds r1, r4, r1
	ldr r0, [sp, #0x10]
	str r0, [r1]
	ldrh r0, [r6, #4]
	strh r0, [r1, #4]
	adds r0, r2, #1
	strb r0, [r4]
.L080E1D2A:
	adds r5, #0x10
	movs r0, #1
	add r8, r0
	mov r1, sl
	ldr r0, [r1]
	cmp r8, r0
	blo .L080E1CD6
.L080E1D38:
	movs r0, #1
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L080E1D4C: .4byte 0x00002168
.L080E1D50: .4byte 0x00002164

	thumb_func_start func_080E1D54
func_080E1D54: @ 0x080E1D54
	push {r4, lr}
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, .L080E1D84 @ =0x00002164
	adds r1, r2, r0
	ldr r0, [r1]
	lsls r0, r0, #4
	adds r0, #4
	adds r1, r1, r0
	ldr r4, .L080E1D88 @ =0x00002168
	adds r0, r2, r4
	cmp r0, r1
	beq .L080E1D74
.L080E1D6E:
	adds r0, #0x10
	cmp r0, r1
	bne .L080E1D6E
.L080E1D74:
	adds r0, r2, #0
	adds r1, r3, #0
	bl func_08076E0C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080E1D84: .4byte 0x00002164
.L080E1D88: .4byte 0x00002168

	thumb_func_start func_080E1D8C
func_080E1D8C: @ 0x080E1D8C
	push {lr}
	bl func_08076E0C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080E1D98
func_080E1D98: @ 0x080E1D98
	push {lr}
	bl func_08076E0C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080E1DA4
func_080E1DA4: @ 0x080E1DA4
	push {lr}
	bl func_08076E0C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080E1DB0
func_080E1DB0: @ 0x080E1DB0
	push {lr}
	bl func_08076E0C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080E1DBC
func_080E1DBC: @ 0x080E1DBC
	push {lr}
	bl func_08076EA8
	movs r0, #1
	pop {r1}
	bx r1

	thumb_func_start func_080E1DC8
func_080E1DC8: @ 0x080E1DC8
	push {lr}
	bl func_08076E0C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080E1DD4
func_080E1DD4: @ 0x080E1DD4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #0x92
	lsls r0, r0, #1
	adds r1, r4, r0
	ldr r0, [r1]
	lsls r0, r0, #3
	adds r0, #4
	adds r1, r1, r0
	movs r2, #0x94
	lsls r2, r2, #1
	adds r0, r4, r2
	ldr r2, .L080E1E20 @ =vtable_unk_080E5A28
	cmp r0, r1
	beq .L080E1DFA
.L080E1DF4:
	adds r0, #8
	cmp r0, r1
	bne .L080E1DF4
.L080E1DFA:
	str r2, [r4, #0xc]
	ldr r1, [r4, #8]
	cmp r1, #0
	beq .L080E1E12
	ldr r2, .L080E1E24 @ =0x000005B4
	adds r0, r1, r2
	ldr r0, [r0]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E1E12:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_080086BC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080E1E20: .4byte vtable_unk_080E5A28
.L080E1E24: .4byte 0x000005B4

	thumb_func_start func_080E1E28
func_080E1E28: @ 0x080E1E28
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	mov sb, r1
	ldr r1, .L080E1F80 @ =0x00004120
	adds r0, r5, r1
	cmp r0, #0
	beq .L080E1E5E
	adds r1, #0x50
	adds r4, r5, r1
	cmp r0, r4
	beq .L080E1E5E
	ldr r0, .L080E1F80 @ =0x00004120
	adds r6, r5, r0
.L080E1E48:
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	cmp r6, r4
	bne .L080E1E48
.L080E1E5E:
	ldr r1, .L080E1F84 @ =0x000040D0
	adds r0, r5, r1
	ldr r1, .L080E1F88 @ =0x00003FA8
	adds r7, r5, r1
	ldr r1, .L080E1F8C @ =0x00003EA4
	adds r1, r1, r5
	mov r8, r1
	cmp r0, #0
	beq .L080E1E92
	ldr r1, .L080E1F80 @ =0x00004120
	adds r4, r5, r1
	cmp r0, r4
	beq .L080E1E92
	ldr r0, .L080E1F84 @ =0x000040D0
	adds r6, r5, r0
.L080E1E7C:
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	cmp r6, r4
	bne .L080E1E7C
.L080E1E92:
	ldr r1, .L080E1F90 @ =0x000040C8
	adds r4, r5, r1
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	ldr r0, .L080E1F94 @ =0x000040C0
	adds r4, r5, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	ldr r1, .L080E1F98 @ =0x000040B8
	adds r4, r5, r1
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	ldr r0, .L080E1F9C @ =0x000040B0
	adds r4, r5, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	ldr r1, .L080E1FA0 @ =0x00003FA4
	adds r2, r5, r1
	ldr r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, #4
	adds r2, r2, r0
	adds r0, r7, #0
	cmp r0, r2
	beq .L080E1EFE
.L080E1EF8:
	adds r0, #0xc
	cmp r0, r2
	bne .L080E1EF8
.L080E1EFE:
	ldr r0, .L080E1FA4 @ =0x00003EA0
	adds r1, r5, r0
	ldr r0, [r1]
	lsls r0, r0, #4
	adds r0, #4
	adds r1, r1, r0
	mov r0, r8
	cmp r0, r1
	beq .L080E1F16
.L080E1F10:
	adds r0, #0x10
	cmp r0, r1
	bne .L080E1F10
.L080E1F16:
	movs r1, #0x9a
	lsls r1, r1, #1
	adds r0, r5, r1
	movs r1, #2
	bl func_08050D0C
	ldr r0, .L080E1FA8 @ =vtable_unk_080E5A28
	str r0, [r5, #0x54]
	str r0, [r5, #0x24]
	ldr r0, [r5, #0x1c]
	cmp r0, #0
	beq .L080E1F5A
	adds r4, r0, #0
	adds r0, #0x28
	movs r1, #2
	bl func_08075DEC
	adds r0, r4, #0
	adds r0, #0x18
	ldr r2, [r0, #4]
	ldr r1, [r4, #0x18]
	cmp r1, r2
	beq .L080E1F4A
.L080E1F44:
	adds r1, #0x40
	cmp r1, r2
	bne .L080E1F44
.L080E1F4A:
	ldr r0, [r0]
	cmp r0, #0
	beq .L080E1F54
	bl free
.L080E1F54:
	adds r0, r4, #0
	bl __builtin_delete
.L080E1F5A:
	ldr r1, [r5, #8]
	cmp r1, #0
	beq .L080E1F6C
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E1F6C:
	adds r0, r5, #0
	mov r1, sb
	bl func_080086BC
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080E1F80: .4byte 0x00004120
.L080E1F84: .4byte 0x000040D0
.L080E1F88: .4byte 0x00003FA8
.L080E1F8C: .4byte 0x00003EA4
.L080E1F90: .4byte 0x000040C8
.L080E1F94: .4byte 0x000040C0
.L080E1F98: .4byte 0x000040B8
.L080E1F9C: .4byte 0x000040B0
.L080E1FA0: .4byte 0x00003FA4
.L080E1FA4: .4byte 0x00003EA0
.L080E1FA8: .4byte vtable_unk_080E5A28

	thumb_func_start func_080E1FAC
func_080E1FAC: @ 0x080E1FAC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r5, #0
	adds r4, #0x30
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	ldr r0, [r5, #0xc]
	cmp r0, #0
	beq .L080E2008
	movs r1, #3
	bl func_08050D0C
.L080E2008:
	adds r0, r5, #0
	adds r1, r6, #0
	bl func_080086BC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080E2018
func_080E2018: @ 0x080E2018
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	adds r0, #0xe0
	cmp r0, #0
	beq .L080E203E
	movs r1, #0xd0
	lsls r1, r1, #1
	adds r4, r5, r1
	cmp r0, r4
	beq .L080E203E
	adds r6, r0, #0
.L080E2030:
	subs r4, #0x30
	adds r0, r4, #0
	movs r1, #0
	bl func_080E20C0
	cmp r6, r4
	bne .L080E2030
.L080E203E:
	adds r0, r5, #0
	adds r0, #0xd0
	ldr r2, [r0, #4]
	ldr r1, [r0]
	adds r4, r5, #0
	adds r4, #0xa0
	adds r6, r5, #0
	adds r6, #0x18
	cmp r1, r2
	beq .L080E2058
.L080E2052:
	adds r1, #0x1c
	cmp r1, r2
	bne .L080E2052
.L080E2058:
	ldr r0, [r0]
	cmp r0, #0
	beq .L080E2062
	bl free
.L080E2062:
	ldr r0, .L080E2090 @ =vtable_unk_080E5A28
	str r0, [r4]
	str r0, [r5, #0x20]
	adds r0, r6, #0
	movs r1, #2
	bl func_080756D0
	ldr r1, [r5, #0xc]
	cmp r1, #0
	beq .L080E2082
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E2082:
	adds r0, r5, #0
	adds r1, r7, #0
	bl func_080086BC
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080E2090: .4byte vtable_unk_080E5A28

	thumb_func_start func_080E2094
func_080E2094: @ 0x080E2094
	sub sp, #0xc
	adds r2, r0, #0
	movs r0, #0
	str r0, [r2]
	str r0, [r2, #4]
	adds r1, r2, #0
	adds r1, #8
	str r0, [r1, #4]
	adds r1, #8
	str r0, [r2, #0x10]
	str r0, [r1, #4]
	adds r1, #8
	str r0, [r1, #4]
	adds r1, #8
	str r0, [r2, #0x20]
	str r0, [r1, #4]
	adds r1, #8
	str r0, [r1, #4]
	adds r0, r2, #0
	add sp, #0xc
	bx lr
	.align 2, 0

	thumb_func_start func_080E20C0
func_080E20C0: @ 0x080E20C0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq .L080E20D0
	bl free
.L080E20D0:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq .L080E20DA
	bl free
.L080E20DA:
	ldr r0, [r4]
	cmp r0, #0
	beq .L080E20E4
	bl free
.L080E20E4:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq .L080E20F2
	adds r0, r4, #0
	bl __builtin_delete
.L080E20F2:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_080E20F8
func_080E20F8: @ 0x080E20F8
	push {lr}
	bl func_08070C88
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080E2104
func_080E2104: @ 0x080E2104
	push {lr}
	bl func_08070C88
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080E2110
func_080E2110: @ 0x080E2110
	push {lr}
	bl func_08070C88
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080E211C
func_080E211C: @ 0x080E211C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #0x92
	lsls r0, r0, #1
	adds r1, r4, r0
	ldr r0, [r1]
	lsls r0, r0, #3
	adds r0, #4
	adds r1, r1, r0
	movs r2, #0x94
	lsls r2, r2, #1
	adds r0, r4, r2
	ldr r2, .L080E2168 @ =vtable_unk_080E5A28
	cmp r0, r1
	beq .L080E2142
.L080E213C:
	adds r0, #8
	cmp r0, r1
	bne .L080E213C
.L080E2142:
	str r2, [r4, #0xc]
	ldr r1, [r4, #8]
	cmp r1, #0
	beq .L080E215A
	ldr r2, .L080E216C @ =0x000005B4
	adds r0, r1, r2
	ldr r0, [r0]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E215A:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_080086BC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080E2168: .4byte vtable_unk_080E5A28
.L080E216C: .4byte 0x000005B4

	thumb_func_start func_080E2170
func_080E2170: @ 0x080E2170
	push {lr}
	adds r2, r0, #0
	ldr r3, [r2, #0xc]
	ldr r0, [r3, #8]
	str r0, [r2, #0xc]
	ldr r0, [r3, #8]
	cmp r0, #0
	beq .L080E2182
	str r2, [r0, #4]
.L080E2182:
	ldr r0, [r2, #4]
	str r0, [r3, #4]
	ldr r0, [r1]
	cmp r2, r0
	bne .L080E2190
	str r3, [r1]
	b .L080E219E
.L080E2190:
	ldr r1, [r2, #4]
	ldr r0, [r1, #8]
	cmp r2, r0
	bne .L080E219C
	str r3, [r1, #8]
	b .L080E219E
.L080E219C:
	str r3, [r1, #0xc]
.L080E219E:
	str r2, [r3, #8]
	str r3, [r2, #4]
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080E21A8
func_080E21A8: @ 0x080E21A8
	push {lr}
	adds r2, r0, #0
	ldr r3, [r2, #8]
	ldr r0, [r3, #0xc]
	str r0, [r2, #8]
	ldr r0, [r3, #0xc]
	cmp r0, #0
	beq .L080E21BA
	str r2, [r0, #4]
.L080E21BA:
	ldr r0, [r2, #4]
	str r0, [r3, #4]
	ldr r0, [r1]
	cmp r2, r0
	bne .L080E21C8
	str r3, [r1]
	b .L080E21D6
.L080E21C8:
	ldr r1, [r2, #4]
	ldr r0, [r1, #0xc]
	cmp r2, r0
	bne .L080E21D4
	str r3, [r1, #0xc]
	b .L080E21D6
.L080E21D4:
	str r3, [r1, #8]
.L080E21D6:
	str r2, [r3, #0xc]
	str r3, [r2, #4]
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080E21E0
func_080E21E0: @ 0x080E21E0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #0
	strb r0, [r4]
	ldr r0, [r5]
	cmp r4, r0
	beq .L080E2286
	ldr r2, [r4, #4]
	ldrb r0, [r2]
	cmp r0, #0
	bne .L080E2286
	movs r6, #1
	movs r7, #0
.L080E21FC:
	ldr r1, [r2, #4]
	ldr r0, [r1, #8]
	cmp r2, r0
	bne .L080E2238
	ldr r0, [r1, #0xc]
	cmp r0, #0
	beq .L080E2210
	ldrb r1, [r0]
	cmp r1, #0
	beq .L080E2242
.L080E2210:
	ldr r1, [r4, #4]
	ldr r0, [r1, #0xc]
	cmp r4, r0
	bne .L080E2222
	adds r4, r1, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_080E2170
.L080E2222:
	ldr r0, [r4, #4]
	strb r6, [r0]
	ldr r0, [r4, #4]
	ldr r0, [r0, #4]
	strb r7, [r0]
	ldr r0, [r4, #4]
	ldr r0, [r0, #4]
	adds r1, r5, #0
	bl func_080E21A8
	b .L080E2278
.L080E2238:
	cmp r0, #0
	beq .L080E2252
	ldrb r1, [r0]
	cmp r1, #0
	bne .L080E2252
.L080E2242:
	strb r6, [r2]
	strb r6, [r0]
	ldr r0, [r4, #4]
	ldr r0, [r0, #4]
	strb r1, [r0]
	ldr r0, [r4, #4]
	ldr r4, [r0, #4]
	b .L080E2278
.L080E2252:
	ldr r1, [r4, #4]
	ldr r0, [r1, #8]
	cmp r4, r0
	bne .L080E2264
	adds r4, r1, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_080E21A8
.L080E2264:
	ldr r0, [r4, #4]
	strb r6, [r0]
	ldr r0, [r4, #4]
	ldr r0, [r0, #4]
	strb r7, [r0]
	ldr r0, [r4, #4]
	ldr r0, [r0, #4]
	adds r1, r5, #0
	bl func_080E2170
.L080E2278:
	ldr r0, [r5]
	cmp r4, r0
	beq .L080E2286
	ldr r2, [r4, #4]
	ldrb r0, [r2]
	cmp r0, #0
	beq .L080E21FC
.L080E2286:
	ldr r1, [r5]
	movs r0, #1
	strb r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080E2294
func_080E2294: @ 0x080E2294
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r4, [sp, #0x14]
	adds r5, r3, #0
	ldr r0, [r6, #4]
	cmp r5, r0
	beq .L080E22BE
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne .L080E22FE
	cmp r2, #0
	bne .L080E22BE
	movs r2, #0
	ldr r1, [r4]
	ldr r0, [r5, #0x10]
	cmp r1, r0
	bhs .L080E22BA
	movs r2, #1
.L080E22BA:
	cmp r2, #0
	beq .L080E22FE
.L080E22BE:
	movs r0, #0x18
	bl malloc
	adds r2, r0, #0
	cmp r2, #0
	bne .L080E22D2
	movs r0, #0x18
	bl func_080D3BC0
	adds r2, r0, #0
.L080E22D2:
	adds r1, r2, #0
	adds r1, #0x10
	cmp r1, #0
	beq .L080E22E2
	ldr r0, [r4]
	str r0, [r2, #0x10]
	ldr r0, [r4, #4]
	str r0, [r1, #4]
.L080E22E2:
	adds r4, r2, #0
	str r4, [r5, #8]
	ldr r1, [r6, #4]
	cmp r5, r1
	bne .L080E22F4
	str r4, [r5, #4]
	ldr r0, [r6, #4]
	str r4, [r0, #0xc]
	b .L080E2330
.L080E22F4:
	ldr r0, [r1, #8]
	cmp r5, r0
	bne .L080E2330
	str r4, [r1, #8]
	b .L080E2330
.L080E22FE:
	movs r0, #0x18
	bl malloc
	adds r2, r0, #0
	cmp r2, #0
	bne .L080E2312
	movs r0, #0x18
	bl func_080D3BC0
	adds r2, r0, #0
.L080E2312:
	adds r1, r2, #0
	adds r1, #0x10
	cmp r1, #0
	beq .L080E2322
	ldr r0, [r4]
	str r0, [r2, #0x10]
	ldr r0, [r4, #4]
	str r0, [r1, #4]
.L080E2322:
	adds r4, r2, #0
	str r4, [r5, #0xc]
	ldr r1, [r6, #4]
	ldr r0, [r1, #0xc]
	cmp r5, r0
	bne .L080E2330
	str r4, [r1, #0xc]
.L080E2330:
	str r5, [r4, #4]
	movs r0, #0
	str r0, [r4, #8]
	str r0, [r4, #0xc]
	ldr r1, [r6, #4]
	adds r1, #4
	adds r0, r4, #0
	bl func_080E21E0
	ldr r0, [r6, #8]
	adds r0, #1
	str r0, [r6, #8]
	str r4, [r7]
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080E2354
func_080E2354: @ 0x080E2354
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2]
	cmp r0, #0
	bne .L080E236A
	ldr r0, [r2, #4]
	ldr r0, [r0, #4]
	cmp r0, r2
	bne .L080E236A
	ldr r2, [r2, #0xc]
	b .L080E238A
.L080E236A:
	ldr r0, [r2, #8]
	cmp r0, #0
	beq .L080E2380
	adds r1, r0, #0
	b .L080E2376
.L080E2374:
	ldr r1, [r1, #0xc]
.L080E2376:
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bne .L080E2374
	b .L080E2388
.L080E237E:
	adds r2, r1, #0
.L080E2380:
	ldr r1, [r2, #4]
	ldr r0, [r1, #8]
	cmp r2, r0
	beq .L080E237E
.L080E2388:
	adds r2, r1, #0
.L080E238A:
	adds r0, r2, #0
	pop {r1}
	bx r1

	thumb_func_start func_080E2390
func_080E2390: @ 0x080E2390
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	adds r6, r0, #0
	mov r8, r1
	adds r7, r2, #0
	ldr r4, [r1, #4]
	ldr r5, [r4, #4]
	movs r0, #1
	cmp r5, #0
	beq .L080E23C6
	ldr r2, [r7]
.L080E23AA:
	adds r4, r5, #0
	movs r1, #0
	ldr r0, [r4, #0x10]
	cmp r2, r0
	bhs .L080E23B6
	movs r1, #1
.L080E23B6:
	adds r0, r1, #0
	cmp r0, #0
	beq .L080E23C0
	ldr r5, [r4, #8]
	b .L080E23C2
.L080E23C0:
	ldr r5, [r4, #0xc]
.L080E23C2:
	cmp r5, #0
	bne .L080E23AA
.L080E23C6:
	str r4, [sp, #8]
	cmp r0, #0
	beq .L080E2400
	mov r1, r8
	ldr r0, [r1, #4]
	ldr r0, [r0, #8]
	str r0, [sp, #0xc]
	movs r1, #0
	cmp r4, r0
	bne .L080E23DC
	movs r1, #1
.L080E23DC:
	cmp r1, #0
	beq .L080E23F8
	str r7, [sp]
	movs r0, #0
	str r0, [sp, #4]
	add r0, sp, #0x10
	mov r1, r8
	adds r2, r5, #0
	adds r3, r4, #0
	bl func_080E2294
	movs r1, #1
	ldr r0, [sp, #0x10]
	b .L080E242A
.L080E23F8:
	adds r0, r4, #0
	bl func_080E2354
	str r0, [sp, #8]
.L080E2400:
	ldr r2, [sp, #8]
	movs r3, #0
	ldr r1, [r2, #0x10]
	ldr r0, [r7]
	cmp r1, r0
	bhs .L080E240E
	movs r3, #1
.L080E240E:
	adds r0, r3, #0
	cmp r0, #0
	beq .L080E2430
	str r7, [sp]
	movs r0, #0
	str r0, [sp, #4]
	add r0, sp, #0xc
	mov r1, r8
	adds r2, r5, #0
	adds r3, r4, #0
	bl func_080E2294
	movs r1, #1
	ldr r0, [sp, #0xc]
.L080E242A:
	str r0, [r6]
	strb r1, [r6, #4]
	b .L080E2434
.L080E2430:
	str r2, [r6]
	strb r0, [r6, #4]
.L080E2434:
	adds r0, r6, #0
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080E2444
func_080E2444: @ 0x080E2444
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x18
	adds r7, r0, #0
	adds r6, r1, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r1, [r6, #4]
	ldr r2, [r2]
	ldr r0, [r1, #8]
	cmp r2, r0
	bne .L080E24D4
	ldr r0, [r6, #8]
	cmp r0, #0
	bne .L080E2474
	add r0, sp, #8
	adds r1, r6, #0
	adds r2, r4, #0
	bl func_080E2390
	ldr r0, [sp, #8]
	b .L080E25E8
.L080E2474:
	movs r0, #0
	ldr r1, [r2, #0x10]
	adds r3, r2, #0
	ldr r2, [r4]
	cmp r2, r1
	bhs .L080E2482
	movs r0, #1
.L080E2482:
	mov sb, r0
	cmp r0, #0
	bne .L080E2548
	movs r0, #0
	cmp r1, r2
	bhs .L080E2490
	movs r0, #1
.L080E2490:
	cmp r0, #0
	bne .L080E2498
	str r3, [r7]
	b .L080E25EA
.L080E2498:
	str r3, [sp, #8]
	adds r0, r3, #0
	bl func_080E2B28
	adds r2, r0, #0
	str r2, [sp, #8]
	ldr r0, [r6, #4]
	cmp r2, r0
	bne .L080E24B0
	mov r0, r8
	ldr r3, [r0]
	b .L080E25AE
.L080E24B0:
	movs r3, #0
	ldr r1, [r4]
	ldr r0, [r2, #0x10]
	adds r5, r2, #0
	cmp r1, r0
	bhs .L080E24BE
	movs r3, #1
.L080E24BE:
	cmp r3, #0
	bne .L080E24C4
	b .L080E25DC
.L080E24C4:
	mov r1, r8
	ldr r3, [r1]
	ldr r0, [r3, #0xc]
	cmp r0, #0
	beq .L080E25AE
	str r4, [sp]
	mov r0, sb
	b .L080E25C2
.L080E24D4:
	cmp r2, r1
	bne .L080E24FE
	ldr r3, [r2, #0xc]
	movs r5, #0
	ldr r1, [r3, #0x10]
	ldr r0, [r4]
	cmp r1, r0
	bhs .L080E24E6
	movs r5, #1
.L080E24E6:
	cmp r5, #0
	beq .L080E24F0
	str r4, [sp]
	str r2, [sp, #4]
	b .L080E25B2
.L080E24F0:
	add r0, sp, #8
	adds r1, r6, #0
	adds r2, r4, #0
	bl func_080E2390
	ldr r0, [sp, #8]
	b .L080E25E8
.L080E24FE:
	str r2, [sp, #8]
	adds r0, r2, #0
	bl func_080E2354
	adds r2, r0, #0
	str r2, [sp, #8]
	mov r1, r8
	ldr r3, [r1]
	movs r5, #0
	ldr r1, [r4]
	ldr r0, [r3, #0x10]
	cmp r1, r0
	bhs .L080E251A
	movs r5, #1
.L080E251A:
	mov sb, r5
	cmp r5, #0
	beq .L080E255A
	movs r0, #0
	mov ip, r0
	ldr r0, [r2, #0x10]
	adds r5, r2, #0
	cmp r0, r1
	bhs .L080E2530
	movs r1, #1
	mov ip, r1
.L080E2530:
	mov r0, ip
	cmp r0, #0
	beq .L080E255A
	ldr r0, [r5, #0xc]
	cmp r0, #0
	bne .L080E2548
	str r4, [sp]
	str r5, [sp, #4]
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0
	b .L080E25CA
.L080E2548:
	str r4, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r3, #0
	bl func_080E2294
	b .L080E25EA
.L080E255A:
	mov r1, r8
	ldr r0, [r1]
	str r0, [sp, #0xc]
	bl func_080E2B28
	mov ip, r0
	str r0, [sp, #0xc]
	movs r0, #1
	mov r1, sb
	eors r1, r0
	mov r0, sb
	cmp r0, #0
	bne .L080E25D2
	mov r1, r8
	ldr r0, [r1]
	movs r5, #0
	ldr r1, [r0, #0x10]
	adds r3, r0, #0
	ldr r2, [r4]
	cmp r1, r2
	bhs .L080E2586
	movs r5, #1
.L080E2586:
	adds r1, r5, #0
	cmp r1, #0
	beq .L080E25D2
	ldr r0, [r6, #4]
	mov r5, ip
	cmp r5, r0
	beq .L080E25A8
	movs r0, #0
	mov ip, r0
	ldr r0, [r5, #0x10]
	cmp r2, r0
	bhs .L080E25A2
	movs r0, #1
	mov ip, r0
.L080E25A2:
	mov r0, ip
	cmp r0, #0
	beq .L080E25D2
.L080E25A8:
	ldr r0, [r3, #0xc]
	cmp r0, #0
	bne .L080E25BE
.L080E25AE:
	str r4, [sp]
	str r3, [sp, #4]
.L080E25B2:
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0
	bl func_080E2294
	b .L080E25EA
.L080E25BE:
	str r4, [sp]
	movs r0, #0
.L080E25C2:
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
.L080E25CA:
	adds r3, r5, #0
	bl func_080E2294
	b .L080E25EA
.L080E25D2:
	cmp sb, r1
	bne .L080E25DC
	mov r1, r8
	ldr r0, [r1]
	b .L080E25E8
.L080E25DC:
	add r0, sp, #0x10
	adds r1, r6, #0
	adds r2, r4, #0
	bl func_080E2390
	ldr r0, [sp, #0x10]
.L080E25E8:
	str r0, [r7]
.L080E25EA:
	adds r0, r7, #0
	add sp, #0x18
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080E25FC
func_080E25FC: @ 0x080E25FC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	mov r8, r1
	adds r7, r5, #0
	ldr r1, [r7, #8]
	cmp r1, #0
	beq .L080E2624
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bne .L080E2618
	adds r6, r1, #0
	b .L080E2626
.L080E2618:
	adds r7, r0, #0
	b .L080E261E
.L080E261C:
	ldr r7, [r7, #8]
.L080E261E:
	ldr r0, [r7, #8]
	cmp r0, #0
	bne .L080E261C
.L080E2624:
	ldr r6, [r7, #0xc]
.L080E2626:
	cmp r7, r5
	beq .L080E267A
	ldr r0, [r5, #8]
	str r7, [r0, #4]
	ldr r0, [r5, #8]
	str r0, [r7, #8]
	ldr r0, [r5, #0xc]
	cmp r7, r0
	beq .L080E264E
	ldr r4, [r7, #4]
	cmp r6, #0
	beq .L080E2640
	str r4, [r6, #4]
.L080E2640:
	ldr r0, [r7, #4]
	str r6, [r0, #8]
	ldr r0, [r5, #0xc]
	str r0, [r7, #0xc]
	ldr r0, [r5, #0xc]
	str r7, [r0, #4]
	b .L080E2650
.L080E264E:
	adds r4, r7, #0
.L080E2650:
	mov r1, r8
	ldr r0, [r1]
	cmp r0, r5
	bne .L080E265C
	str r7, [r1]
	b .L080E266A
.L080E265C:
	ldr r1, [r5, #4]
	ldr r0, [r1, #8]
	cmp r0, r5
	bne .L080E2668
	str r7, [r1, #8]
	b .L080E266A
.L080E2668:
	str r7, [r1, #0xc]
.L080E266A:
	ldr r0, [r5, #4]
	str r0, [r7, #4]
	ldrb r1, [r7]
	ldrb r0, [r5]
	strb r0, [r7]
	strb r1, [r5]
	adds r7, r5, #0
	b .L080E26E4
.L080E267A:
	ldr r4, [r7, #4]
	cmp r6, #0
	beq .L080E2682
	str r4, [r6, #4]
.L080E2682:
	mov r1, r8
	ldr r0, [r1]
	cmp r0, r7
	bne .L080E268E
	str r6, [r1]
	b .L080E269C
.L080E268E:
	ldr r1, [r7, #4]
	ldr r0, [r1, #8]
	cmp r0, r7
	bne .L080E269A
	str r6, [r1, #8]
	b .L080E269C
.L080E269A:
	str r6, [r1, #0xc]
.L080E269C:
	ldr r0, [r2]
	cmp r0, r5
	bne .L080E26C0
	ldr r0, [r5, #0xc]
	cmp r0, #0
	bne .L080E26AE
	ldr r0, [r5, #4]
	str r0, [r2]
	b .L080E26C0
.L080E26AE:
	adds r1, r6, #0
	ldr r0, [r6, #8]
	cmp r0, #0
	beq .L080E26BE
.L080E26B6:
	ldr r1, [r1, #8]
	ldr r0, [r1, #8]
	cmp r0, #0
	bne .L080E26B6
.L080E26BE:
	str r1, [r2]
.L080E26C0:
	ldr r0, [r3]
	cmp r0, r5
	bne .L080E26E4
	ldr r0, [r5, #8]
	cmp r0, #0
	bne .L080E26D2
	ldr r0, [r5, #4]
	str r0, [r3]
	b .L080E26E4
.L080E26D2:
	adds r1, r6, #0
	ldr r0, [r6, #0xc]
	cmp r0, #0
	beq .L080E26E2
.L080E26DA:
	ldr r1, [r1, #0xc]
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bne .L080E26DA
.L080E26E2:
	str r1, [r3]
.L080E26E4:
	ldrb r0, [r7]
	cmp r0, #0
	bne .L080E26EC
	b .L080E27F0
.L080E26EC:
	b .L080E27D6
.L080E26EE:
	ldr r0, [r4, #8]
	cmp r6, r0
	bne .L080E2760
	ldr r2, [r4, #0xc]
	ldrb r1, [r2]
	cmp r1, #0
	bne .L080E270C
	movs r0, #1
	strb r0, [r2]
	strb r1, [r4]
	adds r0, r4, #0
	mov r1, r8
	bl func_080E2170
	ldr r2, [r4, #0xc]
.L080E270C:
	ldr r3, [r2, #8]
	cmp r3, #0
	beq .L080E271A
	ldrb r0, [r3]
	ldr r1, [r2, #0xc]
	cmp r0, #1
	bne .L080E2726
.L080E271A:
	ldr r1, [r2, #0xc]
	cmp r1, #0
	beq .L080E2792
	ldrb r0, [r1]
	cmp r0, #1
	beq .L080E2792
.L080E2726:
	cmp r1, #0
	beq .L080E2730
	ldrb r0, [r1]
	cmp r0, #1
	bne .L080E2746
.L080E2730:
	cmp r3, #0
	beq .L080E2738
	movs r0, #1
	strb r0, [r3]
.L080E2738:
	movs r0, #0
	strb r0, [r2]
	adds r0, r2, #0
	mov r1, r8
	bl func_080E21A8
	ldr r2, [r4, #0xc]
.L080E2746:
	ldrb r0, [r4]
	strb r0, [r2]
	movs r1, #1
	strb r1, [r4]
	ldr r0, [r2, #0xc]
	cmp r0, #0
	beq .L080E2756
	strb r1, [r0]
.L080E2756:
	adds r0, r4, #0
	mov r1, r8
	bl func_080E2170
	b .L080E27E8
.L080E2760:
	adds r2, r0, #0
	ldrb r1, [r2]
	cmp r1, #0
	bne .L080E2778
	movs r0, #1
	strb r0, [r2]
	strb r1, [r4]
	adds r0, r4, #0
	mov r1, r8
	bl func_080E21A8
	ldr r2, [r4, #8]
.L080E2778:
	ldr r3, [r2, #0xc]
	cmp r3, #0
	beq .L080E2786
	ldrb r0, [r3]
	ldr r1, [r2, #8]
	cmp r0, #1
	bne .L080E279C
.L080E2786:
	ldr r1, [r2, #8]
	cmp r1, #0
	beq .L080E2792
	ldrb r0, [r1]
	cmp r0, #1
	bne .L080E279C
.L080E2792:
	movs r0, #0
	strb r0, [r2]
	adds r6, r4, #0
	ldr r4, [r6, #4]
	b .L080E27D6
.L080E279C:
	cmp r1, #0
	beq .L080E27A6
	ldrb r0, [r1]
	cmp r0, #1
	bne .L080E27BC
.L080E27A6:
	cmp r3, #0
	beq .L080E27AE
	movs r0, #1
	strb r0, [r3]
.L080E27AE:
	movs r0, #0
	strb r0, [r2]
	adds r0, r2, #0
	mov r1, r8
	bl func_080E2170
	ldr r2, [r4, #8]
.L080E27BC:
	ldrb r0, [r4]
	strb r0, [r2]
	movs r1, #1
	strb r1, [r4]
	ldr r0, [r2, #8]
	cmp r0, #0
	beq .L080E27CC
	strb r1, [r0]
.L080E27CC:
	adds r0, r4, #0
	mov r1, r8
	bl func_080E21A8
	b .L080E27E8
.L080E27D6:
	mov r1, r8
	ldr r0, [r1]
	cmp r6, r0
	beq .L080E27E8
	cmp r6, #0
	beq .L080E26EE
	ldrb r0, [r6]
	cmp r0, #1
	beq .L080E26EE
.L080E27E8:
	cmp r6, #0
	beq .L080E27F0
	movs r0, #1
	strb r0, [r6]
.L080E27F0:
	adds r0, r7, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start func_080E27FC
func_080E27FC: @ 0x080E27FC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r4, [sp, #0x14]
	adds r5, r3, #0
	ldr r0, [r6, #4]
	cmp r5, r0
	beq .L080E2826
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne .L080E2866
	cmp r2, #0
	bne .L080E2826
	movs r2, #0
	ldr r1, [r4]
	ldr r0, [r5, #0x10]
	cmp r1, r0
	bhs .L080E2822
	movs r2, #1
.L080E2822:
	cmp r2, #0
	beq .L080E2866
.L080E2826:
	movs r0, #0x18
	bl malloc
	adds r2, r0, #0
	cmp r2, #0
	bne .L080E283A
	movs r0, #0x18
	bl func_080D3BC0
	adds r2, r0, #0
.L080E283A:
	adds r1, r2, #0
	adds r1, #0x10
	cmp r1, #0
	beq .L080E284A
	ldr r0, [r4]
	str r0, [r2, #0x10]
	ldr r0, [r4, #4]
	str r0, [r1, #4]
.L080E284A:
	adds r4, r2, #0
	str r4, [r5, #8]
	ldr r1, [r6, #4]
	cmp r5, r1
	bne .L080E285C
	str r4, [r5, #4]
	ldr r0, [r6, #4]
	str r4, [r0, #0xc]
	b .L080E2898
.L080E285C:
	ldr r0, [r1, #8]
	cmp r5, r0
	bne .L080E2898
	str r4, [r1, #8]
	b .L080E2898
.L080E2866:
	movs r0, #0x18
	bl malloc
	adds r2, r0, #0
	cmp r2, #0
	bne .L080E287A
	movs r0, #0x18
	bl func_080D3BC0
	adds r2, r0, #0
.L080E287A:
	adds r1, r2, #0
	adds r1, #0x10
	cmp r1, #0
	beq .L080E288A
	ldr r0, [r4]
	str r0, [r2, #0x10]
	ldr r0, [r4, #4]
	str r0, [r1, #4]
.L080E288A:
	adds r4, r2, #0
	str r4, [r5, #0xc]
	ldr r1, [r6, #4]
	ldr r0, [r1, #0xc]
	cmp r5, r0
	bne .L080E2898
	str r4, [r1, #0xc]
.L080E2898:
	str r5, [r4, #4]
	movs r0, #0
	str r0, [r4, #8]
	str r0, [r4, #0xc]
	ldr r1, [r6, #4]
	adds r1, #4
	adds r0, r4, #0
	bl func_080E21E0
	ldr r0, [r6, #8]
	adds r0, #1
	str r0, [r6, #8]
	str r4, [r7]
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080E28BC
func_080E28BC: @ 0x080E28BC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	adds r6, r0, #0
	mov r8, r1
	adds r7, r2, #0
	ldr r4, [r1, #4]
	ldr r5, [r4, #4]
	movs r0, #1
	cmp r5, #0
	beq .L080E28F2
	ldr r2, [r7]
.L080E28D6:
	adds r4, r5, #0
	movs r1, #0
	ldr r0, [r4, #0x10]
	cmp r2, r0
	bhs .L080E28E2
	movs r1, #1
.L080E28E2:
	adds r0, r1, #0
	cmp r0, #0
	beq .L080E28EC
	ldr r5, [r4, #8]
	b .L080E28EE
.L080E28EC:
	ldr r5, [r4, #0xc]
.L080E28EE:
	cmp r5, #0
	bne .L080E28D6
.L080E28F2:
	str r4, [sp, #8]
	cmp r0, #0
	beq .L080E292C
	mov r1, r8
	ldr r0, [r1, #4]
	ldr r0, [r0, #8]
	str r0, [sp, #0xc]
	movs r1, #0
	cmp r4, r0
	bne .L080E2908
	movs r1, #1
.L080E2908:
	cmp r1, #0
	beq .L080E2924
	str r7, [sp]
	movs r0, #0
	str r0, [sp, #4]
	add r0, sp, #0x10
	mov r1, r8
	adds r2, r5, #0
	adds r3, r4, #0
	bl func_080E27FC
	movs r1, #1
	ldr r0, [sp, #0x10]
	b .L080E2956
.L080E2924:
	adds r0, r4, #0
	bl func_080E2354
	str r0, [sp, #8]
.L080E292C:
	ldr r2, [sp, #8]
	movs r3, #0
	ldr r1, [r2, #0x10]
	ldr r0, [r7]
	cmp r1, r0
	bhs .L080E293A
	movs r3, #1
.L080E293A:
	adds r0, r3, #0
	cmp r0, #0
	beq .L080E295C
	str r7, [sp]
	movs r0, #0
	str r0, [sp, #4]
	add r0, sp, #0xc
	mov r1, r8
	adds r2, r5, #0
	adds r3, r4, #0
	bl func_080E27FC
	movs r1, #1
	ldr r0, [sp, #0xc]
.L080E2956:
	str r0, [r6]
	strb r1, [r6, #4]
	b .L080E2960
.L080E295C:
	str r2, [r6]
	strb r0, [r6, #4]
.L080E2960:
	adds r0, r6, #0
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080E2970
func_080E2970: @ 0x080E2970
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x18
	adds r7, r0, #0
	adds r6, r1, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r1, [r6, #4]
	ldr r2, [r2]
	ldr r0, [r1, #8]
	cmp r2, r0
	bne .L080E2A00
	ldr r0, [r6, #8]
	cmp r0, #0
	bne .L080E29A0
	add r0, sp, #8
	adds r1, r6, #0
	adds r2, r4, #0
	bl func_080E28BC
	ldr r0, [sp, #8]
	b .L080E2B14
.L080E29A0:
	movs r0, #0
	ldr r1, [r2, #0x10]
	adds r3, r2, #0
	ldr r2, [r4]
	cmp r2, r1
	bhs .L080E29AE
	movs r0, #1
.L080E29AE:
	mov sb, r0
	cmp r0, #0
	bne .L080E2A74
	movs r0, #0
	cmp r1, r2
	bhs .L080E29BC
	movs r0, #1
.L080E29BC:
	cmp r0, #0
	bne .L080E29C4
	str r3, [r7]
	b .L080E2B16
.L080E29C4:
	str r3, [sp, #8]
	adds r0, r3, #0
	bl func_080E2B28
	adds r2, r0, #0
	str r2, [sp, #8]
	ldr r0, [r6, #4]
	cmp r2, r0
	bne .L080E29DC
	mov r0, r8
	ldr r3, [r0]
	b .L080E2ADA
.L080E29DC:
	movs r3, #0
	ldr r1, [r4]
	ldr r0, [r2, #0x10]
	adds r5, r2, #0
	cmp r1, r0
	bhs .L080E29EA
	movs r3, #1
.L080E29EA:
	cmp r3, #0
	bne .L080E29F0
	b .L080E2B08
.L080E29F0:
	mov r1, r8
	ldr r3, [r1]
	ldr r0, [r3, #0xc]
	cmp r0, #0
	beq .L080E2ADA
	str r4, [sp]
	mov r0, sb
	b .L080E2AEE
.L080E2A00:
	cmp r2, r1
	bne .L080E2A2A
	ldr r3, [r2, #0xc]
	movs r5, #0
	ldr r1, [r3, #0x10]
	ldr r0, [r4]
	cmp r1, r0
	bhs .L080E2A12
	movs r5, #1
.L080E2A12:
	cmp r5, #0
	beq .L080E2A1C
	str r4, [sp]
	str r2, [sp, #4]
	b .L080E2ADE
.L080E2A1C:
	add r0, sp, #8
	adds r1, r6, #0
	adds r2, r4, #0
	bl func_080E28BC
	ldr r0, [sp, #8]
	b .L080E2B14
.L080E2A2A:
	str r2, [sp, #8]
	adds r0, r2, #0
	bl func_080E2354
	adds r2, r0, #0
	str r2, [sp, #8]
	mov r1, r8
	ldr r3, [r1]
	movs r5, #0
	ldr r1, [r4]
	ldr r0, [r3, #0x10]
	cmp r1, r0
	bhs .L080E2A46
	movs r5, #1
.L080E2A46:
	mov sb, r5
	cmp r5, #0
	beq .L080E2A86
	movs r0, #0
	mov ip, r0
	ldr r0, [r2, #0x10]
	adds r5, r2, #0
	cmp r0, r1
	bhs .L080E2A5C
	movs r1, #1
	mov ip, r1
.L080E2A5C:
	mov r0, ip
	cmp r0, #0
	beq .L080E2A86
	ldr r0, [r5, #0xc]
	cmp r0, #0
	bne .L080E2A74
	str r4, [sp]
	str r5, [sp, #4]
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0
	b .L080E2AF6
.L080E2A74:
	str r4, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r3, #0
	bl func_080E27FC
	b .L080E2B16
.L080E2A86:
	mov r1, r8
	ldr r0, [r1]
	str r0, [sp, #0xc]
	bl func_080E2B28
	mov ip, r0
	str r0, [sp, #0xc]
	movs r0, #1
	mov r1, sb
	eors r1, r0
	mov r0, sb
	cmp r0, #0
	bne .L080E2AFE
	mov r1, r8
	ldr r0, [r1]
	movs r5, #0
	ldr r1, [r0, #0x10]
	adds r3, r0, #0
	ldr r2, [r4]
	cmp r1, r2
	bhs .L080E2AB2
	movs r5, #1
.L080E2AB2:
	adds r1, r5, #0
	cmp r1, #0
	beq .L080E2AFE
	ldr r0, [r6, #4]
	mov r5, ip
	cmp r5, r0
	beq .L080E2AD4
	movs r0, #0
	mov ip, r0
	ldr r0, [r5, #0x10]
	cmp r2, r0
	bhs .L080E2ACE
	movs r0, #1
	mov ip, r0
.L080E2ACE:
	mov r0, ip
	cmp r0, #0
	beq .L080E2AFE
.L080E2AD4:
	ldr r0, [r3, #0xc]
	cmp r0, #0
	bne .L080E2AEA
.L080E2ADA:
	str r4, [sp]
	str r3, [sp, #4]
.L080E2ADE:
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0
	bl func_080E27FC
	b .L080E2B16
.L080E2AEA:
	str r4, [sp]
	movs r0, #0
.L080E2AEE:
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
.L080E2AF6:
	adds r3, r5, #0
	bl func_080E27FC
	b .L080E2B16
.L080E2AFE:
	cmp sb, r1
	bne .L080E2B08
	mov r1, r8
	ldr r0, [r1]
	b .L080E2B14
.L080E2B08:
	add r0, sp, #0x10
	adds r1, r6, #0
	adds r2, r4, #0
	bl func_080E28BC
	ldr r0, [sp, #0x10]
.L080E2B14:
	str r0, [r7]
.L080E2B16:
	adds r0, r7, #0
	add sp, #0x18
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080E2B28
func_080E2B28: @ 0x080E2B28
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	beq .L080E2B46
	adds r1, r0, #0
	ldr r0, [r1, #8]
	cmp r0, #0
	beq .L080E2B56
.L080E2B3A:
	ldr r1, [r1, #8]
	ldr r0, [r1, #8]
	cmp r0, #0
	bne .L080E2B3A
	b .L080E2B56
.L080E2B44:
	adds r1, r2, #0
.L080E2B46:
	ldr r2, [r1, #4]
	ldr r0, [r2, #0xc]
	cmp r1, r0
	beq .L080E2B44
	ldr r0, [r1, #0xc]
	cmp r0, r2
	beq .L080E2B56
	adds r1, r2, #0
.L080E2B56:
	adds r0, r1, #0
	pop {r1}
	bx r1

	thumb_func_start func_080E2B5C
func_080E2B5C: @ 0x080E2B5C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	cmp r4, #0
	beq .L080E2B80
.L080E2B66:
	ldr r1, [r4, #0xc]
	adds r0, r6, #0
	bl func_080E2B5C
	ldr r5, [r4, #8]
	cmp r4, #0
	beq .L080E2B7A
	adds r0, r4, #0
	bl free
.L080E2B7A:
	adds r4, r5, #0
	cmp r4, #0
	bne .L080E2B66
.L080E2B80:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080E2B88
func_080E2B88: @ 0x080E2B88
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	cmp r4, #0
	beq .L080E2BAC
.L080E2B92:
	ldr r1, [r4, #0xc]
	adds r0, r6, #0
	bl func_080E2B88
	ldr r5, [r4, #8]
	cmp r4, #0
	beq .L080E2BA6
	adds r0, r4, #0
	bl free
.L080E2BA6:
	adds r4, r5, #0
	cmp r4, #0
	bne .L080E2B92
.L080E2BAC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080E2BB4
func_080E2BB4: @ 0x080E2BB4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	mov sl, r0
	str r1, [sp, #0x10]
	str r3, [sp, #0x14]
	ldr r0, [r2, #8]
	str r0, [sp, #0x18]
	ldr r1, [r2, #0x10]
	str r1, [sp, #0x1c]
	ldr r3, [r2]
	movs r0, #0
	cmp r3, #0
	beq .L080E2BD8
	ldrh r0, [r2, #4]
.L080E2BD8:
	lsls r0, r0, #3
	adds r0, r3, r0
	str r0, [sp, #0x20]
	cmp r3, r0
	bne .L080E2BE4
	b .L080E2DA2
.L080E2BE4:
	ldm r3!, {r0, r1}
	str r0, [sp]
	str r1, [sp, #4]
	ldr r2, [sp]
	lsls r0, r2, #7
	asrs r6, r0, #0x17
	ldr r0, [sp, #0x14]
	adds r6, r6, r0
	str r3, [sp, #0x24]
	cmp r6, #0xef
	ble .L080E2BFC
	b .L080E2D98
.L080E2BFC:
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r8, r0
	ldr r1, [sp, #0x48]
	add r8, r1
	mov r0, r8
	cmp r0, #0x9f
	ble .L080E2C12
	b .L080E2D98
.L080E2C12:
	lsls r1, r2, #0x10
	lsrs r1, r1, #0x1e
	lsls r1, r1, #2
	lsrs r0, r2, #0x1e
	adds r1, r1, r0
	ldr r2, .L080E2C84 @ =gUnk_080FC066
	lsrs r0, r1, #1
	adds r0, r0, r2
	ldrb r2, [r0]
	movs r0, #1
	ands r1, r0
	lsls r1, r1, #2
	asrs r2, r1
	movs r3, #3
	adds r1, r2, #0
	ands r1, r3
	movs r4, #8
	adds r0, r4, #0
	lsls r0, r1
	adds r0, r6, r0
	cmp r0, #0
	bgt .L080E2C40
	b .L080E2D98
.L080E2C40:
	lsrs r1, r2, #2
	ands r1, r3
	adds r0, r4, #0
	lsls r0, r1
	add r0, r8
	cmp r0, #0
	bgt .L080E2C50
	b .L080E2D98
.L080E2C50:
	ldr r0, [sp, #4]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x11
	ldr r1, [sp, #0x18]
	adds r0, r1, r0
	str r0, [sp, #8]
	mov r1, sl
	adds r1, #4
	add r7, sp, #8
	ldr r4, [r1, #4]
	ldr r2, [r4, #4]
	mov ip, r1
	cmp r2, #0
	beq .L080E2C8E
	adds r5, r0, #0
.L080E2C6E:
	movs r3, #0
	ldr r0, [r2, #0x10]
	cmp r0, r5
	bhs .L080E2C78
	movs r3, #1
.L080E2C78:
	cmp r3, #0
	bne .L080E2C88
	adds r4, r2, #0
	ldr r2, [r4, #8]
	b .L080E2C8A
	.align 2, 0
.L080E2C84: .4byte gUnk_080FC066
.L080E2C88:
	ldr r2, [r2, #0xc]
.L080E2C8A:
	cmp r2, #0
	bne .L080E2C6E
.L080E2C8E:
	ldr r3, [r1, #4]
	cmp r4, r3
	beq .L080E2CA4
	movs r2, #0
	ldr r1, [r7]
	ldr r0, [r4, #0x10]
	cmp r1, r0
	bhs .L080E2CA0
	movs r2, #1
.L080E2CA0:
	cmp r2, #0
	beq .L080E2CA6
.L080E2CA4:
	adds r4, r3, #0
.L080E2CA6:
	mov r0, ip
	ldr r1, [r0, #4]
	eors r1, r4
	rsbs r0, r1, #0
	orrs r0, r1
	cmp r0, #0
	bge .L080E2CBE
	ldr r1, [r4, #0x14]
	mov r0, sl
	bl func_08007D4C
	b .L080E2CC2
.L080E2CBE:
	movs r0, #1
	rsbs r0, r0, #0
.L080E2CC2:
	mov sb, r0
	cmp r0, #0
	blt .L080E2D98
	ldr r0, [sp, #4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x1c
	lsls r0, r0, #5
	ldr r1, [sp, #0x1c]
	adds r0, r1, r0
	str r0, [sp, #0xc]
	mov r1, sl
	adds r1, #0x18
	add r7, sp, #0xc
	ldr r4, [r1, #4]
	ldr r2, [r4, #4]
	mov ip, r1
	cmp r2, #0
	beq .L080E2D02
	adds r5, r0, #0
.L080E2CE8:
	movs r3, #0
	ldr r0, [r2, #0x10]
	cmp r0, r5
	bhs .L080E2CF2
	movs r3, #1
.L080E2CF2:
	cmp r3, #0
	bne .L080E2CFC
	adds r4, r2, #0
	ldr r2, [r4, #8]
	b .L080E2CFE
.L080E2CFC:
	ldr r2, [r2, #0xc]
.L080E2CFE:
	cmp r2, #0
	bne .L080E2CE8
.L080E2D02:
	ldr r3, [r1, #4]
	cmp r4, r3
	beq .L080E2D18
	movs r2, #0
	ldr r1, [r7]
	ldr r0, [r4, #0x10]
	cmp r1, r0
	bhs .L080E2D14
	movs r2, #1
.L080E2D14:
	cmp r2, #0
	beq .L080E2D1A
.L080E2D18:
	adds r4, r3, #0
.L080E2D1A:
	mov r0, ip
	ldr r1, [r0, #4]
	eors r1, r4
	rsbs r0, r1, #0
	orrs r0, r1
	cmp r0, #0
	bge .L080E2D36
	ldr r1, [r4, #0x14]
	mov r0, sl
	adds r0, #0x14
	bl func_080074C0
	adds r4, r0, #0
	b .L080E2D3A
.L080E2D36:
	movs r4, #1
	rsbs r4, r4, #0
.L080E2D3A:
	cmp r4, #0
	blt .L080E2D98
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	ldr r1, .L080E2DB4 @ =0xFFFFFF00
	ldr r3, [sp]
	ands r3, r1
	orrs r3, r0
	ldr r0, .L080E2DB8 @ =0x000001FF
	ands r6, r0
	lsls r1, r6, #0x10
	ldr r0, .L080E2DBC @ =0xFE00FFFF
	ands r3, r0
	orrs r3, r1
	str r3, [sp]
	mov r1, sb
	lsls r0, r1, #0x16
	lsrs r0, r0, #0x16
	ldr r1, .L080E2DC0 @ =0xFFFFFC00
	mov r5, sp
	ldr r2, [sp, #4]
	ands r2, r1
	orrs r2, r0
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #0xc
	ldr r1, .L080E2DC4 @ =0xFFFF0FFF
	ands r2, r1
	orrs r2, r0
	str r2, [sp, #4]
	ldr r0, [sp, #0x10]
	ldrb r2, [r0]
	cmp r2, #0x7f
	bhi .L080E2D98
	lsls r0, r2, #3
	adds r0, #4
	ldr r1, [sp, #0x10]
	adds r0, r1, r0
	str r3, [r0]
	ldrh r1, [r5, #4]
	strh r1, [r0, #4]
	adds r0, r2, #1
	ldr r1, [sp, #0x10]
	strb r0, [r1]
.L080E2D98:
	ldr r3, [sp, #0x24]
	ldr r0, [sp, #0x20]
	cmp r3, r0
	beq .L080E2DA2
	b .L080E2BE4
.L080E2DA2:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080E2DB4: .4byte 0xFFFFFF00
.L080E2DB8: .4byte 0x000001FF
.L080E2DBC: .4byte 0xFE00FFFF
.L080E2DC0: .4byte 0xFFFFFC00
.L080E2DC4: .4byte 0xFFFF0FFF

	thumb_func_start func_080E2DC8
func_080E2DC8: @ 0x080E2DC8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	bl func_08007874
	adds r4, r6, #4
	movs r5, #0
	str r5, [r4, #4]
	movs r0, #0x18
	bl malloc
	cmp r0, #0
	bne .L080E2DE8
	movs r0, #0x18
	bl func_080D3BC0
.L080E2DE8:
	str r0, [r4, #4]
	str r5, [r4, #8]
	str r5, [r4, #0xc]
	strb r5, [r0]
	str r5, [r0, #4]
	ldr r0, [r4, #4]
	str r0, [r0, #8]
	ldr r0, [r4, #4]
	str r0, [r0, #0xc]
	adds r0, r6, #0
	adds r0, #0x14
	bl func_08007128
	adds r4, r6, #0
	adds r4, #0x18
	str r5, [r4, #4]
	movs r0, #0x18
	bl malloc
	cmp r0, #0
	bne .L080E2E18
	movs r0, #0x18
	bl func_080D3BC0
.L080E2E18:
	str r0, [r4, #4]
	str r5, [r4, #8]
	str r5, [r4, #0xc]
	strb r5, [r0]
	str r5, [r0, #4]
	ldr r0, [r4, #4]
	str r0, [r0, #8]
	ldr r0, [r4, #4]
	str r0, [r0, #0xc]
	adds r0, r6, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
.L080E2E34:
	.byte 0x30, 0xB5, 0x04, 0x1C, 0x0D, 0x1C, 0x0A, 0x48, 0xE0, 0x60, 0xA1, 0x68
	.byte 0x00, 0x29, 0x07, 0xD0, 0x08, 0x4A, 0x88, 0x18, 0x00, 0x68, 0x82, 0x68, 0x08, 0x1C, 0x03, 0x21
	.byte 0xF0, 0xF7, 0x60, 0xFD, 0x20, 0x1C, 0x29, 0x1C, 0x25, 0xF7, 0x30, 0xFC, 0x30, 0xBC, 0x01, 0xBC
	.byte 0x00, 0x47, 0x00, 0x00, 0x28, 0x5A, 0x0E, 0x08, 0xB4, 0x05, 0x00, 0x00, 0x00, 0xB5, 0x25, 0xF7
	.byte 0x25, 0xFC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00

	thumb_func_start func_080E2E78
func_080E2E78: @ 0x080E2E78
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	cmp r4, #0
	beq .L080E2E9C
.L080E2E82:
	ldr r1, [r4, #0xc]
	adds r0, r6, #0
	bl func_080E2E78
	ldr r5, [r4, #8]
	cmp r4, #0
	beq .L080E2E96
	adds r0, r4, #0
	bl free
.L080E2E96:
	adds r4, r5, #0
	cmp r4, #0
	bne .L080E2E82
.L080E2E9C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080E2EA4
func_080E2EA4: @ 0x080E2EA4
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r4, [sp, #0x14]
	adds r5, r3, #0
	ldr r0, [r6, #4]
	cmp r5, r0
	beq .L080E2EDE
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne .L080E2F1E
	cmp r2, #0
	bne .L080E2EDE
	adds r2, r5, #0
	adds r2, #0x10
	movs r3, #0
	ldrb r1, [r4]
	ldrb r0, [r5, #0x10]
	cmp r1, r0
	blo .L080E2ED8
	cmp r0, r1
	blo .L080E2EDA
	ldrb r0, [r4, #1]
	ldrb r2, [r2, #1]
	cmp r0, r2
	bhs .L080E2EDA
.L080E2ED8:
	movs r3, #1
.L080E2EDA:
	cmp r3, #0
	beq .L080E2F1E
.L080E2EDE:
	movs r0, #0x18
	bl malloc
	adds r1, r0, #0
	cmp r1, #0
	bne .L080E2EF2
	movs r0, #0x18
	bl func_080D3BC0
	adds r1, r0, #0
.L080E2EF2:
	adds r2, r1, #0
	adds r2, #0x10
	cmp r2, #0
	beq .L080E2F02
	ldr r0, [r4]
	str r0, [r1, #0x10]
	ldrb r0, [r4, #4]
	strb r0, [r2, #4]
.L080E2F02:
	adds r4, r1, #0
	str r4, [r5, #8]
	ldr r1, [r6, #4]
	cmp r5, r1
	bne .L080E2F14
	str r4, [r5, #4]
	ldr r0, [r6, #4]
	str r4, [r0, #0xc]
	b .L080E2F50
.L080E2F14:
	ldr r0, [r1, #8]
	cmp r5, r0
	bne .L080E2F50
	str r4, [r1, #8]
	b .L080E2F50
.L080E2F1E:
	movs r0, #0x18
	bl malloc
	adds r1, r0, #0
	cmp r1, #0
	bne .L080E2F32
	movs r0, #0x18
	bl func_080D3BC0
	adds r1, r0, #0
.L080E2F32:
	adds r2, r1, #0
	adds r2, #0x10
	cmp r2, #0
	beq .L080E2F42
	ldr r0, [r4]
	str r0, [r1, #0x10]
	ldrb r0, [r4, #4]
	strb r0, [r2, #4]
.L080E2F42:
	adds r4, r1, #0
	str r4, [r5, #0xc]
	ldr r1, [r6, #4]
	ldr r0, [r1, #0xc]
	cmp r5, r0
	bne .L080E2F50
	str r4, [r1, #0xc]
.L080E2F50:
	str r5, [r4, #4]
	movs r0, #0
	str r0, [r4, #8]
	str r0, [r4, #0xc]
	ldr r1, [r6, #4]
	adds r1, #4
	adds r0, r4, #0
	bl func_080E21E0
	ldr r0, [r6, #8]
	adds r0, #1
	str r0, [r6, #8]
	str r4, [r7]
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080E2F74
func_080E2F74: @ 0x080E2F74
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x14
	adds r7, r0, #0
	mov r8, r1
	adds r6, r2, #0
	ldr r5, [r1, #4]
	ldr r4, [r5, #4]
	movs r0, #1
	cmp r4, #0
	beq .L080E2FBC
	ldrb r2, [r6]
.L080E2F90:
	adds r5, r4, #0
	adds r1, r5, #0
	adds r1, #0x10
	movs r3, #0
	ldrb r0, [r5, #0x10]
	cmp r2, r0
	blo .L080E2FAA
	cmp r0, r2
	blo .L080E2FAC
	ldrb r0, [r6, #1]
	ldrb r1, [r1, #1]
	cmp r0, r1
	bhs .L080E2FAC
.L080E2FAA:
	movs r3, #1
.L080E2FAC:
	adds r0, r3, #0
	cmp r0, #0
	beq .L080E2FB6
	ldr r4, [r4, #8]
	b .L080E2FB8
.L080E2FB6:
	ldr r4, [r4, #0xc]
.L080E2FB8:
	cmp r4, #0
	bne .L080E2F90
.L080E2FBC:
	str r5, [sp, #8]
	cmp r0, #0
	beq .L080E2FF6
	mov r1, r8
	ldr r0, [r1, #4]
	ldr r0, [r0, #8]
	str r0, [sp, #0xc]
	movs r1, #0
	cmp r5, r0
	bne .L080E2FD2
	movs r1, #1
.L080E2FD2:
	cmp r1, #0
	beq .L080E2FEE
	str r6, [sp]
	movs r0, #0
	str r0, [sp, #4]
	add r0, sp, #0x10
	mov r1, r8
	adds r2, r4, #0
	adds r3, r5, #0
	bl func_080E2EA4
	movs r1, #1
	ldr r0, [sp, #0x10]
	b .L080E3036
.L080E2FEE:
	adds r0, r5, #0
	bl func_080E2354
	str r0, [sp, #8]
.L080E2FF6:
	ldr r0, [sp, #8]
	adds r3, r0, #0
	adds r3, #0x10
	movs r1, #0
	mov sb, r1
	ldrb r2, [r0, #0x10]
	ldrb r1, [r6]
	mov ip, r0
	cmp r2, r1
	blo .L080E3016
	cmp r1, r2
	blo .L080E301A
	ldrb r0, [r3, #1]
	ldrb r1, [r6, #1]
	cmp r0, r1
	bhs .L080E301A
.L080E3016:
	movs r0, #1
	mov sb, r0
.L080E301A:
	mov r0, sb
	cmp r0, #0
	beq .L080E303C
	str r6, [sp]
	movs r0, #0
	str r0, [sp, #4]
	add r0, sp, #0xc
	mov r1, r8
	adds r2, r4, #0
	adds r3, r5, #0
	bl func_080E2EA4
	movs r1, #1
	ldr r0, [sp, #0xc]
.L080E3036:
	str r0, [r7]
	strb r1, [r7, #4]
	b .L080E3042
.L080E303C:
	mov r1, ip
	str r1, [r7]
	strb r0, [r7, #4]
.L080E3042:
	adds r0, r7, #0
	add sp, #0x14
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080E3054
func_080E3054: @ 0x080E3054
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r7, r0, #0
	adds r6, r1, #0
	mov sl, r2
	adds r4, r3, #0
	ldr r1, [r6, #4]
	ldr r2, [r2]
	ldr r0, [r1, #8]
	cmp r2, r0
	bne .L080E314C
	ldr r0, [r6, #8]
	cmp r0, #0
	bne .L080E3086
	add r0, sp, #8
	adds r1, r6, #0
	adds r2, r4, #0
	bl func_080E2F74
	ldr r0, [sp, #8]
	b .L080E32D2
.L080E3086:
	movs r0, #0x10
	adds r0, r0, r2
	mov ip, r0
	movs r1, #0
	mov sb, r1
	ldrb r0, [r4]
	adds r3, r0, #0
	ldrb r1, [r2, #0x10]
	adds r5, r2, #0
	mov r8, r0
	cmp r3, r1
	blo .L080E30AC
	cmp r1, r3
	blo .L080E30B0
	ldrb r0, [r4, #1]
	mov r2, ip
	ldrb r2, [r2, #1]
	cmp r0, r2
	bhs .L080E30B0
.L080E30AC:
	movs r0, #1
	mov sb, r0
.L080E30B0:
	mov r1, sb
	cmp r1, #0
	beq .L080E30C4
	str r4, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	b .L080E32A2
.L080E30C4:
	adds r3, r5, #0
	adds r3, #0x10
	movs r1, #0
	ldrb r2, [r5, #0x10]
	mov r0, r8
	cmp r2, r0
	blo .L080E30DE
	cmp r0, r2
	blo .L080E30E0
	ldrb r0, [r3, #1]
	ldrb r2, [r4, #1]
	cmp r0, r2
	bhs .L080E30E0
.L080E30DE:
	movs r1, #1
.L080E30E0:
	cmp r1, #0
	bne .L080E30E8
	str r5, [r7]
	b .L080E32D4
.L080E30E8:
	str r5, [sp, #8]
	adds r0, r5, #0
	bl func_080E2B28
	adds r2, r0, #0
	str r2, [sp, #8]
	ldr r0, [r6, #4]
	cmp r2, r0
	bne .L080E3104
	mov r0, sl
	ldr r3, [r0]
	str r4, [sp]
	str r3, [sp, #4]
	b .L080E317E
.L080E3104:
	adds r3, r2, #0
	adds r3, #0x10
	movs r1, #0
	mov r8, r1
	ldrb r1, [r4]
	ldrb r0, [r2, #0x10]
	adds r5, r2, #0
	cmp r1, r0
	blo .L080E3122
	cmp r0, r1
	blo .L080E3126
	ldrb r0, [r4, #1]
	ldrb r3, [r3, #1]
	cmp r0, r3
	bhs .L080E3126
.L080E3122:
	movs r2, #1
	mov r8, r2
.L080E3126:
	mov r0, r8
	cmp r0, #0
	bne .L080E312E
	b .L080E32C6
.L080E312E:
	mov r1, sl
	ldr r3, [r1]
	ldr r0, [r3, #0xc]
	cmp r0, #0
	bne .L080E313E
	str r4, [sp]
	str r3, [sp, #4]
	b .L080E317E
.L080E313E:
	str r4, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	b .L080E32A2
.L080E314C:
	cmp r2, r1
	bne .L080E3198
	ldr r0, [r2, #0xc]
	adds r2, r0, #0
	adds r2, #0x10
	movs r3, #0
	ldrb r0, [r0, #0x10]
	ldrb r1, [r4]
	cmp r0, r1
	blo .L080E316C
	cmp r1, r0
	blo .L080E316E
	ldrb r0, [r2, #1]
	ldrb r2, [r4, #1]
	cmp r0, r2
	bhs .L080E316E
.L080E316C:
	movs r3, #1
.L080E316E:
	cmp r3, #0
	beq .L080E318A
	ldr r0, [r6, #4]
	ldr r3, [r0, #0xc]
	str r4, [sp]
	mov r1, sl
	ldr r0, [r1]
	str r0, [sp, #4]
.L080E317E:
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0
	bl func_080E2EA4
	b .L080E32D4
.L080E318A:
	add r0, sp, #8
	adds r1, r6, #0
	adds r2, r4, #0
	bl func_080E2F74
	ldr r0, [sp, #8]
	b .L080E32D2
.L080E3198:
	str r2, [sp, #8]
	adds r0, r2, #0
	bl func_080E2354
	str r0, [sp, #8]
	mov r2, sl
	ldr r0, [r2]
	adds r2, r0, #0
	adds r2, #0x10
	movs r3, #0
	ldrb r1, [r4]
	ldrb r0, [r0, #0x10]
	cmp r1, r0
	blo .L080E31C0
	cmp r0, r1
	blo .L080E31C2
	ldrb r0, [r4, #1]
	ldrb r2, [r2, #1]
	cmp r0, r2
	bhs .L080E31C2
.L080E31C0:
	movs r3, #1
.L080E31C2:
	mov sb, r3
	cmp r3, #0
	beq .L080E31FE
	ldr r0, [sp, #8]
	adds r3, r0, #0
	adds r3, #0x10
	movs r1, #0
	mov r8, r1
	ldrb r2, [r0, #0x10]
	ldrb r1, [r4]
	adds r5, r0, #0
	cmp r2, r1
	blo .L080E31E8
	cmp r1, r2
	blo .L080E31EC
	ldrb r0, [r3, #1]
	ldrb r2, [r4, #1]
	cmp r0, r2
	bhs .L080E31EC
.L080E31E8:
	movs r0, #1
	mov r8, r0
.L080E31EC:
	mov r1, r8
	cmp r1, #0
	beq .L080E31FE
	ldr r0, [r5, #0xc]
	cmp r0, #0
	beq .L080E3298
	mov r2, sl
	ldr r3, [r2]
	b .L080E32AA
.L080E31FE:
	mov r1, sl
	ldr r0, [r1]
	str r0, [sp, #0xc]
	bl func_080E2B28
	str r0, [sp, #0xc]
	movs r0, #1
	mov r1, sb
	eors r1, r0
	mov r2, sb
	cmp r2, #0
	bne .L080E32BC
	mov r1, sl
	ldr r0, [r1]
	movs r2, #0x10
	adds r2, r2, r0
	mov ip, r2
	movs r2, #0
	mov r1, sp
	strb r2, [r1, #0x18]
	ldrb r1, [r4]
	ldrb r3, [r0, #0x10]
	adds r2, r1, #0
	adds r5, r0, #0
	mov r8, r1
	cmp r3, r2
	blo .L080E3242
	cmp r2, r3
	blo .L080E3248
	mov r1, ip
	ldrb r0, [r1, #1]
	ldrb r2, [r4, #1]
	cmp r0, r2
	bhs .L080E3248
.L080E3242:
	movs r1, #1
	mov r0, sp
	strb r1, [r0, #0x18]
.L080E3248:
	mov r2, sp
	ldrb r2, [r2, #0x18]
	adds r1, r2, #0
	mov r0, sb
	cmp r0, #0
	bne .L080E32BC
	cmp r1, #0
	beq .L080E32BC
	ldr r0, [r6, #4]
	ldr r3, [sp, #0xc]
	cmp r3, r0
	beq .L080E3292
	movs r2, #0x10
	adds r2, r2, r3
	mov ip, r2
	movs r2, #0
	mov r0, sp
	strb r2, [r0, #0x1c]
	mov r0, r8
	ldrb r2, [r3, #0x10]
	cmp r0, r2
	blo .L080E3284
	cmp r2, r0
	blo .L080E328A
	ldrb r0, [r4, #1]
	mov r8, r0
	mov r2, ip
	ldrb r2, [r2, #1]
	cmp r8, r2
	bhs .L080E328A
.L080E3284:
	movs r2, #1
	mov r0, sp
	strb r2, [r0, #0x1c]
.L080E328A:
	mov r0, sp
	ldrb r0, [r0, #0x1c]
	cmp r0, #0
	beq .L080E32BC
.L080E3292:
	ldr r0, [r5, #0xc]
	cmp r0, #0
	bne .L080E32AA
.L080E3298:
	str r4, [sp]
	str r5, [sp, #4]
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0
.L080E32A2:
	adds r3, r5, #0
	bl func_080E2EA4
	b .L080E32D4
.L080E32AA:
	str r4, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r3, #0
	bl func_080E2EA4
	b .L080E32D4
.L080E32BC:
	cmp sb, r1
	bne .L080E32C6
	mov r1, sl
	ldr r0, [r1]
	b .L080E32D2
.L080E32C6:
	add r0, sp, #0x10
	adds r1, r6, #0
	adds r2, r4, #0
	bl func_080E2F74
	ldr r0, [sp, #0x10]
.L080E32D2:
	str r0, [r7]
.L080E32D4:
	adds r0, r7, #0
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L080E32E8:
	.byte 0xF0, 0xB5, 0x47, 0x46, 0x80, 0xB4, 0x05, 0x1C
	.byte 0x88, 0x46, 0xEE, 0x20, 0x40, 0x00, 0x2C, 0x18, 0xA0, 0x68, 0x00, 0x28, 0x0C, 0xD0, 0x60, 0x68
	.byte 0x41, 0x68, 0x20, 0x1C, 0xFF, 0xF7, 0xB8, 0xFD, 0x60, 0x68, 0x80, 0x60, 0x60, 0x68, 0x00, 0x21
	.byte 0x41, 0x60, 0x60, 0x68, 0xC0, 0x60, 0xA1, 0x60, 0x60, 0x68, 0x00, 0x28, 0x01, 0xD0, 0xEC, 0xF7
	.byte 0x9F, 0xFF, 0xE6, 0x21, 0x49, 0x00, 0x68, 0x18, 0x42, 0x68, 0x01, 0x68, 0x2C, 0x1C, 0x20, 0x34
	.byte 0x2E, 0x1C, 0x1C, 0x36, 0x2F, 0x1C, 0x18, 0x37, 0x91, 0x42, 0x02, 0xD0, 0x1C, 0x31, 0x91, 0x42
	.byte 0xFC, 0xD1, 0x00, 0x68, 0x00, 0x28, 0x01, 0xD0, 0xEC, 0xF7, 0x8A, 0xFF, 0xCE, 0x20, 0x40, 0x00
	.byte 0x29, 0x18, 0x10, 0x48, 0x08, 0x60, 0xA8, 0x62, 0x20, 0x1C, 0x02, 0x21, 0x92, 0xF7, 0xB8, 0xF9
	.byte 0x30, 0x1C, 0x02, 0x21, 0x59, 0xF7, 0x1C, 0xFA, 0x38, 0x1C, 0x02, 0x21, 0x6D, 0xF7, 0xCE, 0xFC
	.byte 0xE9, 0x68, 0x00, 0x29, 0x05, 0xD0, 0x08, 0x68, 0x82, 0x68, 0x08, 0x1C, 0x03, 0x21, 0xF0, 0xF7
	.byte 0xC9, 0xFA, 0x28, 0x1C, 0x41, 0x46, 0x25, 0xF7, 0x99, 0xF9, 0x08, 0xBC, 0x98, 0x46, 0xF0, 0xBC
	.byte 0x01, 0xBC, 0x00, 0x47, 0x28, 0x5A, 0x0E, 0x08

	thumb_func_start func_080E3398
func_080E3398: @ 0x080E3398
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r2, #0
	subs r1, r1, r6
	asrs r3, r1, #2
.L080E33A2:
	cmp r3, #0
	ble .L080E33C8
	asrs r2, r3, #1
	lsls r0, r2, #2
	adds r4, r6, r0
	movs r5, #0
	ldr r1, [r4]
	ldr r0, [r7]
	cmp r1, r0
	bhs .L080E33B8
	movs r5, #1
.L080E33B8:
	cmp r5, #0
	beq .L080E33C4
	adds r6, r4, #4
	subs r0, r3, r2
	subs r3, r0, #1
	b .L080E33A2
.L080E33C4:
	adds r3, r2, #0
	b .L080E33A2
.L080E33C8:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
.L080E33D0:
	.byte 0x70, 0xB5, 0x05, 0x1C, 0x0E, 0x1C, 0xA6, 0x21, 0x09, 0x01, 0x68, 0x18, 0x00, 0x68, 0x00, 0x28
	.byte 0x01, 0xD0, 0xEC, 0xF7, 0x3D, 0xFF, 0x26, 0x4A, 0xAC, 0x18, 0x61, 0x68, 0x20, 0x1C, 0x23, 0xF7
	.byte 0xF7, 0xFF, 0x20, 0x1C, 0x02, 0x21, 0x23, 0xF7, 0xC5, 0xFE, 0x83, 0x20, 0x00, 0x01, 0x2C, 0x18
	.byte 0x61, 0x68, 0x20, 0x1C, 0x24, 0xF7, 0x10, 0xFC, 0x20, 0x1C, 0x02, 0x21, 0x24, 0xF7, 0xEC, 0xFA
	.byte 0x1C, 0x49, 0x6C, 0x18, 0x61, 0x68, 0x20, 0x1C, 0x23, 0xF7, 0xE2, 0xFF, 0x20, 0x1C, 0x02, 0x21
	.byte 0x23, 0xF7, 0xB0, 0xFE, 0x82, 0x22, 0x12, 0x01, 0xAC, 0x18, 0x61, 0x68, 0x20, 0x1C, 0x24, 0xF7
	.byte 0xFB, 0xFB, 0x20, 0x1C, 0x02, 0x21, 0x24, 0xF7, 0xD7, 0xFA, 0x13, 0x48, 0x2C, 0x18, 0x61, 0x68
	.byte 0x20, 0x1C, 0x23, 0xF7, 0xCD, 0xFF, 0x20, 0x1C, 0x02, 0x21, 0x23, 0xF7, 0x9B, 0xFE, 0x81, 0x21
	.byte 0x09, 0x01, 0x6C, 0x18, 0x61, 0x68, 0x20, 0x1C, 0x24, 0xF7, 0xE6, 0xFB, 0x20, 0x1C, 0x02, 0x21
	.byte 0x24, 0xF7, 0xC2, 0xFA, 0x09, 0x4A, 0xA8, 0x18, 0x09, 0x49, 0x01, 0x60, 0x30, 0x3A, 0xA8, 0x18
	.byte 0x01, 0x60, 0x28, 0x1C, 0x31, 0x1C, 0x25, 0xF7, 0x21, 0xF9, 0x70, 0xBC, 0x01, 0xBC, 0x00, 0x47
	.byte 0x38, 0x08, 0x00, 0x00, 0x28, 0x08, 0x00, 0x00, 0x18, 0x08, 0x00, 0x00, 0x44, 0x07, 0x00, 0x00
	.byte 0x28, 0x5A, 0x0E, 0x08

	thumb_func_start func_080E3494
func_080E3494: @ 0x080E3494
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, [r4, #4]
	movs r5, #0
	str r5, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0xc
	bl __builtin_new
	add r1, sp, #4
	ldr r2, [r4, #8]
	ldrb r3, [r4, #0xc]
	bl func_08092570
	str r0, [sp]
	mov r1, sp
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r5, [r1]
	str r0, [r6]
	ldr r1, [sp]
	cmp r1, #0
	beq .L080E34D2
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E34D2:
	adds r0, r6, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start func_080E34DC
func_080E34DC: @ 0x080E34DC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq .L080E34F4
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E34F4:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0800080C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080E3504
func_080E3504: @ 0x080E3504
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	adds r0, #0x94
	ldr r0, [r0]
	cmp r0, #0
	beq .L080E3518
	movs r1, #3
	bl func_080CE3DC
.L080E3518:
	adds r0, r6, #0
	adds r0, #0x90
	ldr r5, [r0]
	cmp r5, #0
	beq .L080E3552
	adds r4, r5, #0
	adds r4, #0x74
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	ldr r0, .L080E35D8 @ =vtable_unk_080E5A28
	str r0, [r5, #4]
	adds r0, r5, #0
	bl __builtin_delete
.L080E3552:
	adds r0, r6, #0
	adds r0, #0x8c
	ldr r5, [r0]
	cmp r5, #0
	beq .L080E358C
	ldr r0, .L080E35D8 @ =vtable_unk_080E5A28
	str r0, [r5, #0x24]
	adds r4, r5, #0
	adds r4, #0x1c
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	adds r0, r5, #0
	bl __builtin_delete
.L080E358C:
	adds r0, r6, #0
	adds r0, #0x80
	movs r1, #2
	bl func_08050D0C
	ldr r1, [r6, #0x7c]
	cmp r1, #0
	beq .L080E35AE
	movs r2, #0x84
	lsls r2, r2, #2
	adds r0, r1, r2
	ldr r0, [r0]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E35AE:
	ldr r1, [r6, #0x78]
	cmp r1, #0
	beq .L080E35C6
	movs r2, #0x84
	lsls r2, r2, #2
	adds r0, r1, r2
	ldr r0, [r0]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E35C6:
	ldr r0, .L080E35D8 @ =vtable_unk_080E5A28
	str r0, [r6, #0x10]
	adds r0, r6, #0
	adds r1, r7, #0
	bl func_080086BC
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080E35D8: .4byte vtable_unk_080E5A28

	thumb_func_start func_080E35DC
func_080E35DC: @ 0x080E35DC
	push {lr}
	subs r0, #8
	bl func_08093308
	pop {r0}
	bx r0

	thumb_func_start func_080E35E8
func_080E35E8: @ 0x080E35E8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xe4
	lsls r0, r0, #1
	adds r4, r4, r0
	ldr r1, .L080E360C @ =gUnk_081004E0
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl func_08050DC8
	adds r0, r4, #0
	movs r1, #0x39
	bl func_08050E50
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080E360C: .4byte gUnk_081004E0

	thumb_func_start func_080E3610
func_080E3610: @ 0x080E3610
	push {lr}
	subs r0, #8
	bl func_080088CC
	movs r1, #2
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r0, r0, #0x1f
	pop {r1}
	bx r1

	thumb_func_start func_080E3628
func_080E3628: @ 0x080E3628
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xe4
	lsls r0, r0, #1
	adds r4, r4, r0
	ldr r1, .L080E364C @ =gUnk_08100524
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl func_08050DC8
	adds r0, r4, #0
	movs r1, #0x38
	bl func_08050E50
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080E364C: .4byte gUnk_08100524

	thumb_func_start func_080E3650
func_080E3650: @ 0x080E3650
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xe4
	lsls r0, r0, #1
	adds r4, r4, r0
	ldr r1, .L080E3674 @ =gUnk_08100540
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl func_08050DC8
	adds r0, r4, #0
	movs r1, #0x38
	bl func_08050E50
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080E3674: .4byte gUnk_08100540

	thumb_func_start func_080E3678
func_080E3678: @ 0x080E3678
	push {r4, lr}
	adds r2, r0, #0
	movs r1, #0xf6
	lsls r1, r1, #2
	adds r0, r2, r1
	movs r1, #0
	str r1, [r0]
	movs r3, #0xf7
	lsls r3, r3, #2
	adds r0, r2, r3
	str r1, [r0]
	movs r0, #0xe4
	lsls r0, r0, #1
	adds r4, r2, r0
	ldr r1, .L080E36B0 @ =gUnk_08100558
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl func_08050DC8
	adds r0, r4, #0
	movs r1, #0x3a
	bl func_08050E50
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080E36B0: .4byte gUnk_08100558

	thumb_func_start func_080E36B4
func_080E36B4: @ 0x080E36B4
	push {r4, r5, r6, lr}
	sub sp, #0xc
	movs r6, #0
	movs r1, #0xf7
	lsls r1, r1, #2
	adds r4, r0, r1
	ldr r1, [r4]
	cmp r1, #0
	beq .L080E36CC
	cmp r1, #1
	beq .L080E3700
	b .L080E3726
.L080E36CC:
	movs r1, #0xe4
	lsls r1, r1, #1
	adds r5, r0, r1
	adds r0, r5, #0
	bl func_08050D34
	cmp r0, #3
	bne .L080E3726
	movs r0, #1
	str r0, [r4]
	ldr r1, .L080E36F4 @ =gUnk_08100588
	ldr r2, .L080E36F8 @ =gUnk_0810058C
	ldr r3, .L080E36FC @ =gUnk_08100590
	str r6, [sp]
	str r6, [sp, #4]
	str r6, [sp, #8]
	adds r0, r5, #0
	bl func_08050E30
	b .L080E3726
	.align 2, 0
.L080E36F4: .4byte gUnk_08100588
.L080E36F8: .4byte gUnk_0810058C
.L080E36FC: .4byte gUnk_08100590
.L080E3700:
	movs r1, #0xe4
	lsls r1, r1, #1
	adds r4, r0, r1
	adds r0, r4, #0
	bl func_08050D34
	cmp r0, #3
	bne .L080E3726
	adds r0, r4, #0
	bl func_08050DF0
	cmp r0, #1
	beq .L080E3720
	cmp r0, #2
	beq .L080E3724
	b .L080E3726
.L080E3720:
	movs r6, #2
	b .L080E3726
.L080E3724:
	movs r6, #3
.L080E3726:
	adds r0, r6, #0
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start func_080E3730
func_080E3730: @ 0x080E3730
	bx lr
	.align 2, 0

	thumb_func_start func_080E3734
func_080E3734: @ 0x080E3734
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xe4
	lsls r0, r0, #1
	adds r4, r4, r0
	ldr r1, .L080E3758 @ =gUnk_08100594
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl func_08050DC8
	adds r0, r4, #0
	movs r1, #0x38
	bl func_08050E50
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080E3758: .4byte gUnk_08100594

	thumb_func_start func_080E375C
func_080E375C: @ 0x080E375C
	push {lr}
	subs r0, #8
	bl func_080088CC
	movs r1, #2
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r0, r0, #0x1f
	pop {r1}
	bx r1

	thumb_func_start func_080E3774
func_080E3774: @ 0x080E3774
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xe4
	lsls r0, r0, #1
	adds r4, r4, r0
	ldr r1, .L080E3794 @ =gUnk_081005D8
	adds r0, r4, #0
	bl func_08050D8C
	adds r0, r4, #0
	movs r1, #0x38
	bl func_08050E50
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080E3794: .4byte gUnk_081005D8
.L080E3798:
	.byte 0x70, 0x47, 0x00, 0x00

	thumb_func_start func_080E379C
func_080E379C: @ 0x080E379C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0xf6
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #0
	str r1, [r0]
	movs r2, #0xf7
	lsls r2, r2, #2
	adds r0, r5, r2
	str r1, [r0]
	movs r0, #0xe4
	lsls r0, r0, #1
	adds r4, r5, r0
	ldr r1, .L080E37D8 @ =gUnk_081005EC
	adds r0, r4, #0
	bl func_08050D8C
	adds r0, r4, #0
	movs r1, #0x3a
	bl func_08050E50
	movs r2, #0xea
	lsls r2, r2, #1
	adds r1, r5, r2
	movs r0, #4
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080E37D8: .4byte gUnk_081005EC

	thumb_func_start func_080E37DC
func_080E37DC: @ 0x080E37DC
	push {r4, lr}
	sub sp, #0x10
	adds r1, r0, #0
	movs r4, #0
	movs r0, #0xf7
	lsls r0, r0, #2
	adds r2, r1, r0
	ldr r0, [r2]
	cmp r0, #0
	beq .L080E37F6
	cmp r0, #1
	beq .L080E3828
	b .L080E384E
.L080E37F6:
	movs r3, #0xea
	lsls r3, r3, #1
	adds r0, r1, r3
	ldr r0, [r0]
	cmp r0, #3
	bne .L080E384E
	movs r0, #1
	str r0, [r2]
	movs r2, #0xe4
	lsls r2, r2, #1
	adds r0, r1, r2
	ldr r1, .L080E3820 @ =gUnk_0810058C
	ldr r2, .L080E3824 @ =gUnk_08100590
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	movs r3, #0
	bl func_08050E0C
	b .L080E384E
	.align 2, 0
.L080E3820: .4byte gUnk_0810058C
.L080E3824: .4byte gUnk_08100590
.L080E3828:
	movs r3, #0xea
	lsls r3, r3, #1
	adds r0, r1, r3
	ldr r0, [r0]
	cmp r0, #3
	bne .L080E384E
	movs r2, #0xe4
	lsls r2, r2, #1
	adds r0, r1, r2
	bl func_08050DF0
	cmp r0, #1
	beq .L080E3848
	cmp r0, #2
	beq .L080E384C
	b .L080E384E
.L080E3848:
	movs r4, #2
	b .L080E384E
.L080E384C:
	movs r4, #3
.L080E384E:
	adds r0, r4, #0
	add sp, #0x10
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start func_080E3858
func_080E3858: @ 0x080E3858
	bx lr
	.align 2, 0

	thumb_func_start func_080E385C
func_080E385C: @ 0x080E385C
	push {lr}
	subs r0, #8
	bl func_080088C4
	pop {r1}
	bx r1

	thumb_func_start func_080E3868
func_080E3868: @ 0x080E3868
	push {lr}
	subs r0, #8
	bl func_080088CC
	pop {r1}
	bx r1

	thumb_func_start func_080E3874
func_080E3874: @ 0x080E3874
	push {lr}
	adds r2, r0, #0
	movs r1, #0xdc
	lsls r1, r1, #1
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq .L080E3896
	adds r1, #3
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq .L080E3892
	movs r0, #0
	b .L080E38AA
.L080E3892:
	movs r0, #1
	b .L080E38AA
.L080E3896:
	ldr r0, [r2]
	ldr r1, [r0, #0x4c]
	adds r0, r2, #0
	bl _call_via_r1
	movs r1, #0
	cmp r0, #0
	bne .L080E38A8
	movs r1, #1
.L080E38A8:
	adds r0, r1, #0
.L080E38AA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080E38B0
func_080E38B0: @ 0x080E38B0
	push {lr}
	adds r1, r0, #0
	movs r2, #0xdc
	lsls r2, r2, #1
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq .L080E38C8
	adds r2, #2
	adds r0, r1, r2
	ldrb r0, [r0]
	b .L080E38DC
.L080E38C8:
	ldr r0, [r1, #0x14]
	ldr r2, [r0, #4]
	cmp r2, #0
	beq .L080E38DA
	ldr r0, [r1, #0x18]
	cmp r2, r0
	beq .L080E38DA
	movs r0, #1
	b .L080E38DC
.L080E38DA:
	movs r0, #0
.L080E38DC:
	pop {r1}
	bx r1

	thumb_func_start func_080E38E0
func_080E38E0: @ 0x080E38E0
	push {lr}
	adds r2, r0, #0
	movs r1, #0xdc
	lsls r1, r1, #1
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq .L080E38F8
	adds r1, #1
	adds r0, r2, r1
	ldrb r0, [r0]
	b .L080E390C
.L080E38F8:
	ldr r0, [r2]
	ldr r1, [r0, #0x4c]
	adds r0, r2, #0
	bl _call_via_r1
	cmp r0, #0
	beq .L080E390A
	movs r0, #0
	b .L080E390C
.L080E390A:
	movs r0, #1
.L080E390C:
	pop {r1}
	bx r1

	thumb_func_start func_080E3910
func_080E3910: @ 0x080E3910
	movs r0, #1
	bx lr

	thumb_func_start func_080E3914
func_080E3914: @ 0x080E3914
	push {lr}
	bl func_080D0340
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080E3920
func_080E3920: @ 0x080E3920
	push {lr}
	bl func_080D02F0
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080E392C
func_080E392C: @ 0x080E392C
	push {lr}
	bl func_080D035C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080E3938
func_080E3938: @ 0x080E3938
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0xdc
	lsls r1, r1, #1
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq .L080E397A
	ldr r0, [r4]
	subs r1, #0xb4
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsrs r0, r0, #8
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne .L080E3986
	ldr r0, [r4]
	movs r1, #0x82
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsrs r0, r0, #8
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	bne .L080E398A
.L080E397A:
	bl func_080D06D0
	cmp r0, #0
	beq .L080E3986
	cmp r0, #0xb
	bne .L080E398A
.L080E3986:
	movs r0, #0
	b .L080E398C
.L080E398A:
	movs r0, #1
.L080E398C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080E3994
func_080E3994: @ 0x080E3994
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0xdc
	lsls r1, r1, #1
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq .L080E39D6
	ldr r0, [r4]
	subs r1, #0xb0
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsrs r0, r0, #8
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne .L080E39DE
	ldr r0, [r4]
	movs r1, #0x84
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsrs r0, r0, #8
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	bne .L080E39DE
.L080E39D6:
	bl func_080D06D0
	cmp r0, #0xb
	beq .L080E39E2
.L080E39DE:
	movs r0, #0
	b .L080E39E4
.L080E39E2:
	movs r0, #1
.L080E39E4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080E39EC
func_080E39EC: @ 0x080E39EC
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0xdc
	lsls r1, r1, #1
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq .L080E3A32
	ldr r0, [r4]
	subs r1, #0xb0
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsrs r0, r0, #8
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne .L080E3A2E
	ldr r0, [r4]
	movs r1, #0x84
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsrs r0, r0, #8
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq .L080E3A32
.L080E3A2E:
	movs r0, #1
	b .L080E3A3E
.L080E3A32:
	bl func_080D06B4
	adds r1, r0, #0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
.L080E3A3E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start func_080E3A44
func_080E3A44: @ 0x080E3A44
	push {lr}
	bl func_080D06A8
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080E3A50
func_080E3A50: @ 0x080E3A50
	push {lr}
	bl func_080D0678
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080E3A5C
func_080E3A5C: @ 0x080E3A5C
	push {lr}
	adds r0, r1, #0
	lsls r1, r2, #0x18
	lsrs r1, r1, #0x18
	bl func_080D0644
	pop {r0}
	bx r0

	thumb_func_start func_080E3A6C
func_080E3A6C: @ 0x080E3A6C
	push {lr}
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	ldr r3, [sp, #4]
	bl func_080D0558
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080E3A80
func_080E3A80: @ 0x080E3A80
	push {lr}
	movs r0, #0
	bl func_080D0454
	pop {r0}
	bx r0

	thumb_func_start func_080E3A8C
func_080E3A8C: @ 0x080E3A8C
	push {lr}
	adds r0, r1, #0
	adds r1, r2, #0
	bl func_080D0444
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080E3A9C
func_080E3A9C: @ 0x080E3A9C
	push {r4, lr}
	adds r3, r0, #0
	cmp r1, #4
	bhi .L080E3B58
	lsls r0, r1, #2
	ldr r1, .L080E3AB0 @ =.L080E3AB4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L080E3AB0: .4byte .L080E3AB4
.L080E3AB4: @ jump table
	.4byte .L080E3AC8 @ case 0
	.4byte .L080E3AD4 @ case 1
	.4byte .L080E3AE8 @ case 2
	.4byte .L080E3B10 @ case 3
	.4byte .L080E3B38 @ case 4
.L080E3AC8:
	movs r0, #0xdc
	lsls r0, r0, #1
	adds r1, r3, r0
	movs r0, #0
	strb r0, [r1]
	b .L080E3B58
.L080E3AD4:
	movs r1, #0xdc
	lsls r1, r1, #1
	adds r0, r3, r1
	movs r2, #0
	movs r1, #1
	strb r1, [r0]
	ldr r4, .L080E3AE4 @ =0x000001B9
	b .L080E3B54
	.align 2, 0
.L080E3AE4: .4byte 0x000001B9
.L080E3AE8:
	movs r1, #0xdc
	lsls r1, r1, #1
	adds r0, r3, r1
	movs r2, #0
	movs r1, #1
	strb r1, [r0]
	ldr r4, .L080E3B08 @ =0x000001B9
	adds r0, r3, r4
	strb r1, [r0]
	adds r4, #1
	adds r0, r3, r4
	strb r1, [r0]
	ldr r1, .L080E3B0C @ =0x000001BB
	adds r0, r3, r1
	b .L080E3B56
	.align 2, 0
.L080E3B08: .4byte 0x000001B9
.L080E3B0C: .4byte 0x000001BB
.L080E3B10:
	movs r2, #0xdc
	lsls r2, r2, #1
	adds r0, r3, r2
	movs r2, #0
	movs r1, #1
	strb r1, [r0]
	ldr r4, .L080E3B30 @ =0x000001B9
	adds r0, r3, r4
	strb r1, [r0]
	adds r4, #1
	adds r0, r3, r4
	strb r2, [r0]
	ldr r2, .L080E3B34 @ =0x000001BB
	adds r0, r3, r2
	strb r1, [r0]
	b .L080E3B58
	.align 2, 0
.L080E3B30: .4byte 0x000001B9
.L080E3B34: .4byte 0x000001BB
.L080E3B38:
	movs r4, #0xdc
	lsls r4, r4, #1
	adds r0, r3, r4
	movs r2, #0
	movs r1, #1
	strb r1, [r0]
	adds r4, #1
	adds r0, r3, r4
	strb r1, [r0]
	movs r1, #0xdd
	lsls r1, r1, #1
	adds r0, r3, r1
	strb r2, [r0]
	adds r4, #2
.L080E3B54:
	adds r0, r3, r4
.L080E3B56:
	strb r2, [r0]
.L080E3B58:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080E3B60
func_080E3B60: @ 0x080E3B60
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L080E3B7C @ =vtable_unk_080E7F0C
	str r0, [r4]
	bl func_080D02EC
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_08094268
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080E3B7C: .4byte vtable_unk_080E7F0C

	thumb_func_start func_080E3B80
func_080E3B80: @ 0x080E3B80
	push {r4, r5, r6, lr}
	sub sp, #0x28
	adds r6, r0, #0
	cmp r2, #0xf1
	beq .L080E3BB0
	cmp r2, #0xf1
	bgt .L080E3B94
	cmp r2, #0xf0
	beq .L080E3B9A
	b .L080E3C22
.L080E3B94:
	cmp r2, #0xff
	beq .L080E3BC8
	b .L080E3C22
.L080E3B9A:
	ldrb r0, [r1, #6]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, .L080E3BAC @ =gUnk_08100AD2
	adds r5, r1, r0
	adds r0, r5, #0
	b .L080E3BF6
	.align 2, 0
.L080E3BAC: .4byte gUnk_08100AD2
.L080E3BB0:
	ldrb r0, [r1, #7]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, .L080E3BC4 @ =gUnk_08100BD7
	adds r5, r1, r0
	adds r0, r5, #0
	b .L080E3BF6
	.align 2, 0
.L080E3BC4: .4byte gUnk_08100BD7
.L080E3BC8:
	ldrh r0, [r1, #4]
	cmp r0, #0xab
	bhi .L080E3BE2
	add r4, sp, #0x20
	adds r1, r0, #0
	subs r1, #1
	adds r0, r4, #0
	bl __4FoodUi
	adds r0, r4, #0
	bl GetName__C4Food
	b .L080E3BF4
.L080E3BE2:
	add r4, sp, #0x24
	ldrh r1, [r1, #4]
	subs r1, #0xac
	adds r0, r4, #0
	bl __7ArticleUi
	adds r0, r4, #0
	bl GetName__C7Article
.L080E3BF4:
	adds r5, r0, #0
.L080E3BF6:
	bl strlen
	adds r4, r0, #0
	cmp r4, #0x1f
	bls .L080E3C02
	movs r4, #0x1f
.L080E3C02:
	mov r0, sp
	adds r1, r5, #0
	adds r2, r4, #0
	bl memcpy
	mov r0, sp
	adds r1, r0, r4
	movs r0, #0
	strb r0, [r1]
	movs r0, #1
	strb r0, [r6]
	adds r0, r6, #4
	mov r1, sp
	bl strcpy
	b .L080E3C30
.L080E3C22:
	mov r1, sp
	movs r0, #0
	strb r0, [r1]
	strb r0, [r6]
	adds r0, r6, #4
	bl strcpy
.L080E3C30:
	adds r0, r6, #0
	add sp, #0x28
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080E3C3C
func_080E3C3C: @ 0x080E3C3C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, .L080E3D88 @ =0x000033D8
	adds r1, r5, r0
	ldr r0, .L080E3D8C @ =vtable_unk_080E76F8
	str r0, [r1]
	movs r1, #0xca
	lsls r1, r1, #2
	adds r4, r5, r1
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	movs r2, #0xc8
	lsls r2, r2, #2
	adds r4, r5, r2
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	movs r0, #0xc6
	lsls r0, r0, #2
	adds r4, r5, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	movs r1, #0xc4
	lsls r1, r1, #2
	adds r4, r5, r1
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	movs r2, #0xc2
	lsls r2, r2, #2
	adds r4, r5, r2
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	movs r0, #0xc0
	lsls r0, r0, #2
	adds r4, r5, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	movs r1, #0xbe
	lsls r1, r1, #2
	adds r4, r5, r1
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	movs r2, #0xbc
	lsls r2, r2, #2
	adds r4, r5, r2
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	movs r0, #0xba
	lsls r0, r0, #2
	adds r4, r5, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	movs r1, #0xb8
	lsls r1, r1, #2
	adds r4, r5, r1
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	movs r2, #0x94
	lsls r2, r2, #1
	adds r0, r5, r2
	ldr r4, .L080E3D90 @ =vtable_unk_080E5A28
	str r4, [r0]
	adds r0, r5, #0
	adds r0, #0xf8
	str r4, [r0]
	subs r0, #0x30
	str r4, [r0]
	subs r0, #0x30
	str r4, [r0]
	subs r0, #0x18
	movs r1, #2
	bl func_08050D0C
	ldr r1, [r5, #0x7c]
	cmp r1, #0
	beq .L080E3D5E
	movs r2, #0x84
	lsls r2, r2, #2
	adds r0, r1, r2
	ldr r0, [r0]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E3D5E:
	ldr r1, [r5, #0x78]
	cmp r1, #0
	beq .L080E3D76
	movs r2, #0x84
	lsls r2, r2, #2
	adds r0, r1, r2
	ldr r0, [r0]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E3D76:
	str r4, [r5, #0x10]
	adds r0, r5, #0
	adds r1, r6, #0
	bl func_080086BC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080E3D88: .4byte 0x000033D8
.L080E3D8C: .4byte vtable_unk_080E76F8
.L080E3D90: .4byte vtable_unk_080E5A28

	thumb_func_start func_080E3D94
func_080E3D94: @ 0x080E3D94
	push {lr}
	adds r2, r0, #0
	ldr r0, .L080E3DB0 @ =vtable_unk_080E76F8
	str r0, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L080E3DAA
	adds r0, r2, #0
	bl __builtin_delete
.L080E3DAA:
	pop {r0}
	bx r0
	.align 2, 0
.L080E3DB0: .4byte vtable_unk_080E76F8

	thumb_func_start func_080E3DB4
func_080E3DB4: @ 0x080E3DB4
	push {r4, r5, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	adds r3, r0, #0
	subs r0, r5, r3
	asrs r2, r0, #3
	cmp r2, #0
	ble .L080E3DEC
	ldrh r1, [r4]
.L080E3DC6:
	ldrh r0, [r3]
	cmp r0, r1
	beq .L080E3E1C
	adds r3, #2
	ldrh r0, [r3]
	cmp r0, r1
	beq .L080E3E1C
	adds r3, #2
	ldrh r0, [r3]
	cmp r0, r1
	beq .L080E3E1C
	adds r3, #2
	ldrh r0, [r3]
	cmp r0, r1
	beq .L080E3E1C
	adds r3, #2
	subs r2, #1
	cmp r2, #0
	bgt .L080E3DC6
.L080E3DEC:
	subs r0, r5, r3
	asrs r0, r0, #1
	cmp r0, #1
	beq .L080E3E14
	cmp r0, #1
	ble .L080E3E20
	cmp r0, #2
	beq .L080E3E0A
	cmp r0, #3
	bne .L080E3E20
	ldrh r0, [r3]
	ldrh r1, [r4]
	cmp r0, r1
	beq .L080E3E1C
	adds r3, #2
.L080E3E0A:
	ldrh r0, [r3]
	ldrh r1, [r4]
	cmp r0, r1
	beq .L080E3E1C
	adds r3, #2
.L080E3E14:
	ldrh r0, [r3]
	ldrh r4, [r4]
	cmp r0, r4
	bne .L080E3E20
.L080E3E1C:
	adds r0, r3, #0
	b .L080E3E22
.L080E3E20:
	adds r0, r5, #0
.L080E3E22:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start func_080E3E28
func_080E3E28: @ 0x080E3E28
	push {r4, r5, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	adds r3, r0, #0
	subs r0, r5, r3
	asrs r2, r0, #3
	cmp r2, #0
	ble .L080E3E60
	ldrh r1, [r4]
.L080E3E3A:
	ldrh r0, [r3]
	cmp r0, r1
	beq .L080E3E90
	adds r3, #2
	ldrh r0, [r3]
	cmp r0, r1
	beq .L080E3E90
	adds r3, #2
	ldrh r0, [r3]
	cmp r0, r1
	beq .L080E3E90
	adds r3, #2
	ldrh r0, [r3]
	cmp r0, r1
	beq .L080E3E90
	adds r3, #2
	subs r2, #1
	cmp r2, #0
	bgt .L080E3E3A
.L080E3E60:
	subs r0, r5, r3
	asrs r0, r0, #1
	cmp r0, #1
	beq .L080E3E88
	cmp r0, #1
	ble .L080E3E94
	cmp r0, #2
	beq .L080E3E7E
	cmp r0, #3
	bne .L080E3E94
	ldrh r0, [r3]
	ldrh r1, [r4]
	cmp r0, r1
	beq .L080E3E90
	adds r3, #2
.L080E3E7E:
	ldrh r0, [r3]
	ldrh r1, [r4]
	cmp r0, r1
	beq .L080E3E90
	adds r3, #2
.L080E3E88:
	ldrh r0, [r3]
	ldrh r4, [r4]
	cmp r0, r4
	bne .L080E3E94
.L080E3E90:
	adds r0, r3, #0
	b .L080E3E96
.L080E3E94:
	adds r0, r5, #0
.L080E3E96:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start func_080E3E9C
func_080E3E9C: @ 0x080E3E9C
	push {r4, r5, r6, r7, lr}
	adds r7, r1, #0
	adds r6, r2, #0
	adds r4, r0, #0
	subs r0, r7, r4
	asrs r5, r0, #5
	cmp r5, #0
	ble .L080E3EF2
.L080E3EAC:
	adds r0, r4, #0
	adds r1, r6, #0
	bl func_0809E8E4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080E3F34
	adds r4, #8
	adds r0, r4, #0
	adds r1, r6, #0
	bl func_0809E8E4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080E3F34
	adds r4, #8
	adds r0, r4, #0
	adds r1, r6, #0
	bl func_0809E8E4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080E3F34
	adds r4, #8
	adds r0, r4, #0
	adds r1, r6, #0
	bl func_0809E8E4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080E3F34
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bgt .L080E3EAC
.L080E3EF2:
	subs r0, r7, r4
	asrs r0, r0, #3
	cmp r0, #1
	beq .L080E3F26
	cmp r0, #1
	ble .L080E3F38
	cmp r0, #2
	beq .L080E3F16
	cmp r0, #3
	bne .L080E3F38
	adds r0, r4, #0
	adds r1, r6, #0
	bl func_0809E8E4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080E3F34
	adds r4, #8
.L080E3F16:
	adds r0, r4, #0
	adds r1, r6, #0
	bl func_0809E8E4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080E3F34
	adds r4, #8
.L080E3F26:
	adds r0, r4, #0
	adds r1, r6, #0
	bl func_0809E8E4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080E3F38
.L080E3F34:
	adds r0, r4, #0
	b .L080E3F3A
.L080E3F38:
	adds r0, r7, #0
.L080E3F3A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start func_080E3F40
func_080E3F40: @ 0x080E3F40
	push {r4, r5, r6, r7, lr}
	sub sp, #0x40
	adds r6, r0, #0
	adds r3, r1, #0
	cmp r2, #0xf1
	beq .L080E4014
	cmp r2, #0xf1
	bgt .L080E3F56
	cmp r2, #0xf0
	beq .L080E3F5E
	b .L080E4086
.L080E3F56:
	cmp r2, #0xf2
	bne .L080E3F5C
	b .L080E4056
.L080E3F5C:
	b .L080E4086
.L080E3F5E:
	movs r5, #5
	ldrsb r5, [r3, r5]
	cmp r5, #1
	beq .L080E3FAC
	cmp r5, #1
	bgt .L080E3F70
	cmp r5, #0
	beq .L080E3F7A
	b .L080E4086
.L080E3F70:
	cmp r5, #2
	beq .L080E3FD8
	cmp r5, #3
	beq .L080E3FE0
	b .L080E4086
.L080E3F7A:
	ldr r7, .L080E3FA8 @ =gUnk_08104938
	adds r0, r7, #0
	bl strlen
	adds r4, r0, #0
	cmp r4, #0x1f
	bls .L080E3F8A
	movs r4, #0x1f
.L080E3F8A:
	mov r0, sp
	adds r1, r7, #0
	adds r2, r4, #0
	bl memcpy
	mov r1, sp
	adds r0, r1, r4
	strb r5, [r0]
	movs r0, #1
	strb r0, [r6]
	adds r0, r6, #4
	bl strcpy
	b .L080E4094
	.align 2, 0
.L080E3FA8: .4byte gUnk_08104938
.L080E3FAC:
	ldr r7, .L080E3FD4 @ =gUnk_08104940
	adds r0, r7, #0
	bl strlen
	adds r4, r0, #0
	cmp r4, #0x1f
	bls .L080E3FBC
	movs r4, #0x1f
.L080E3FBC:
	mov r0, sp
	adds r1, r7, #0
	adds r2, r4, #0
	bl memcpy
	mov r1, sp
	adds r0, r1, r4
	movs r1, #0
	strb r1, [r0]
	strb r5, [r6]
	b .L080E4006
	.align 2, 0
.L080E3FD4: .4byte gUnk_08104940
.L080E3FD8:
	ldr r5, .L080E3FDC @ =gUnk_08104948
	b .L080E3FE2
	.align 2, 0
.L080E3FDC: .4byte gUnk_08104948
.L080E3FE0:
	ldr r5, .L080E4010 @ =gUnk_08104950
.L080E3FE2:
	adds r0, r5, #0
	bl strlen
	adds r4, r0, #0
	cmp r4, #0x1f
	bls .L080E3FF0
	movs r4, #0x1f
.L080E3FF0:
	mov r0, sp
	adds r1, r5, #0
	adds r2, r4, #0
	bl memcpy
	mov r0, sp
	adds r1, r0, r4
	movs r0, #0
	strb r0, [r1]
	movs r0, #1
	strb r0, [r6]
.L080E4006:
	adds r0, r6, #4
	mov r1, sp
	bl strcpy
	b .L080E4094
	.align 2, 0
.L080E4010: .4byte gUnk_08104950
.L080E4014:
	movs r0, #4
	ldrsb r0, [r3, r0]
	cmp r0, #9
	bgt .L080E4034
	mov r1, sp
	movs r0, #0x81
	strb r0, [r1]
	movs r0, #0x40
	strb r0, [r1, #1]
	movs r0, #4
	ldrsb r0, [r3, r0]
	adds r1, #2
	movs r2, #0
	bl func_0804EC84
	b .L080E4040
.L080E4034:
	movs r0, #4
	ldrsb r0, [r3, r0]
	mov r1, sp
	movs r2, #0
	bl func_0804EC84
.L080E4040:
	add r5, sp, #0x20
	mov r0, sp
	bl strlen
	adds r4, r0, #0
	cmp r4, #0x1f
	bls .L080E4050
	movs r4, #0x1f
.L080E4050:
	adds r0, r5, #0
	mov r1, sp
	b .L080E406C
.L080E4056:
	add r5, sp, #8
	ldr r7, [r3, #8]
	adds r0, r7, #0
	bl strlen
	adds r4, r0, #0
	cmp r4, #0x1f
	bls .L080E4068
	movs r4, #0x1f
.L080E4068:
	adds r0, r5, #0
	adds r1, r7, #0
.L080E406C:
	adds r2, r4, #0
	bl memcpy
	adds r1, r5, r4
	movs r0, #0
	strb r0, [r1]
	movs r0, #1
	strb r0, [r6]
	adds r0, r6, #4
	adds r1, r5, #0
	bl strcpy
	b .L080E4094
.L080E4086:
	mov r1, sp
	movs r0, #0
	strb r0, [r1]
	strb r0, [r6]
	adds r0, r6, #4
	bl strcpy
.L080E4094:
	adds r0, r6, #0
	add sp, #0x40
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080E40A0
func_080E40A0: @ 0x080E40A0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #0x87
	lsls r0, r0, #2
	adds r1, r5, r0
	ldr r0, .L080E4188 @ =vtable_unk_080E76F8
	str r0, [r1]
	movs r0, #0xd6
	lsls r0, r0, #1
	adds r4, r5, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	movs r0, #0xd2
	lsls r0, r0, #1
	adds r4, r5, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	movs r0, #0xce
	lsls r0, r0, #1
	adds r4, r5, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	movs r0, #0xca
	lsls r0, r0, #1
	adds r4, r5, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	movs r0, #0xc6
	lsls r0, r0, #1
	adds r4, r5, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	movs r0, #0xc2
	lsls r0, r0, #1
	adds r4, r5, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	movs r0, #0xbe
	lsls r0, r0, #1
	adds r4, r5, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	movs r0, #0xba
	lsls r0, r0, #1
	adds r4, r5, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	adds r1, r5, #0
	adds r1, #0x80
	ldr r0, .L080E418C @ =vtable_unk_080E5A28
	str r0, [r1]
	str r0, [r5, #0x50]
	str r0, [r5, #0x20]
	ldr r0, [r5, #0x10]
	cmp r0, #0
	beq .L080E4178
	movs r1, #3
	bl func_08050D0C
.L080E4178:
	adds r0, r5, #0
	adds r1, r6, #0
	bl func_080086BC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080E4188: .4byte vtable_unk_080E76F8
.L080E418C: .4byte vtable_unk_080E5A28

	thumb_func_start func_080E4190
func_080E4190: @ 0x080E4190
	push {lr}
	adds r2, r0, #0
	ldr r0, .L080E41AC @ =vtable_unk_080E76F8
	str r0, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L080E41A6
	adds r0, r2, #0
	bl __builtin_delete
.L080E41A6:
	pop {r0}
	bx r0
	.align 2, 0
.L080E41AC: .4byte vtable_unk_080E76F8

	thumb_func_start func_080E41B0
func_080E41B0: @ 0x080E41B0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq .L080E41C8
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E41C8:
	ldr r1, [r4, #4]
	cmp r1, #0
	beq .L080E41DA
	ldr r0, [r1, #4]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E41DA:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_080007EC
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_080E41E8
func_080E41E8: @ 0x080E41E8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq .L080E4200
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E4200:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_080007EC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080E4210
func_080E4210: @ 0x080E4210
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq .L080E4228
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E4228:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_080007EC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080E4238
func_080E4238: @ 0x080E4238
	push {lr}
	bl func_080098AC
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080E4244
func_080E4244: @ 0x080E4244
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r4, [sp, #0x14]
	adds r5, r3, #0
	ldr r0, [r6, #4]
	cmp r5, r0
	beq .L080E426E
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne .L080E42AE
	cmp r2, #0
	bne .L080E426E
	movs r2, #0
	ldr r1, [r4]
	ldr r0, [r5, #0x10]
	cmp r1, r0
	bge .L080E426A
	movs r2, #1
.L080E426A:
	cmp r2, #0
	beq .L080E42AE
.L080E426E:
	movs r0, #0x18
	bl malloc
	adds r2, r0, #0
	cmp r2, #0
	bne .L080E4282
	movs r0, #0x18
	bl func_080D3BC0
	adds r2, r0, #0
.L080E4282:
	adds r1, r2, #0
	adds r1, #0x10
	cmp r1, #0
	beq .L080E4292
	ldr r0, [r4]
	str r0, [r2, #0x10]
	ldr r0, [r4, #4]
	str r0, [r1, #4]
.L080E4292:
	adds r4, r2, #0
	str r4, [r5, #8]
	ldr r1, [r6, #4]
	cmp r5, r1
	bne .L080E42A4
	str r4, [r5, #4]
	ldr r0, [r6, #4]
	str r4, [r0, #0xc]
	b .L080E42E0
.L080E42A4:
	ldr r0, [r1, #8]
	cmp r5, r0
	bne .L080E42E0
	str r4, [r1, #8]
	b .L080E42E0
.L080E42AE:
	movs r0, #0x18
	bl malloc
	adds r2, r0, #0
	cmp r2, #0
	bne .L080E42C2
	movs r0, #0x18
	bl func_080D3BC0
	adds r2, r0, #0
.L080E42C2:
	adds r1, r2, #0
	adds r1, #0x10
	cmp r1, #0
	beq .L080E42D2
	ldr r0, [r4]
	str r0, [r2, #0x10]
	ldr r0, [r4, #4]
	str r0, [r1, #4]
.L080E42D2:
	adds r4, r2, #0
	str r4, [r5, #0xc]
	ldr r1, [r6, #4]
	ldr r0, [r1, #0xc]
	cmp r5, r0
	bne .L080E42E0
	str r4, [r1, #0xc]
.L080E42E0:
	str r5, [r4, #4]
	movs r0, #0
	str r0, [r4, #8]
	str r0, [r4, #0xc]
	ldr r1, [r6, #4]
	adds r1, #4
	adds r0, r4, #0
	bl func_080E21E0
	ldr r0, [r6, #8]
	adds r0, #1
	str r0, [r6, #8]
	str r4, [r7]
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080E4304
func_080E4304: @ 0x080E4304
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	adds r6, r0, #0
	mov r8, r1
	adds r7, r2, #0
	ldr r4, [r1, #4]
	ldr r5, [r4, #4]
	movs r0, #1
	cmp r5, #0
	beq .L080E433A
	ldr r2, [r7]
.L080E431E:
	adds r4, r5, #0
	movs r1, #0
	ldr r0, [r4, #0x10]
	cmp r2, r0
	bge .L080E432A
	movs r1, #1
.L080E432A:
	adds r0, r1, #0
	cmp r0, #0
	beq .L080E4334
	ldr r5, [r4, #8]
	b .L080E4336
.L080E4334:
	ldr r5, [r4, #0xc]
.L080E4336:
	cmp r5, #0
	bne .L080E431E
.L080E433A:
	str r4, [sp, #8]
	cmp r0, #0
	beq .L080E4374
	mov r1, r8
	ldr r0, [r1, #4]
	ldr r0, [r0, #8]
	str r0, [sp, #0xc]
	movs r1, #0
	cmp r4, r0
	bne .L080E4350
	movs r1, #1
.L080E4350:
	cmp r1, #0
	beq .L080E436C
	str r7, [sp]
	movs r0, #0
	str r0, [sp, #4]
	add r0, sp, #0x10
	mov r1, r8
	adds r2, r5, #0
	adds r3, r4, #0
	bl func_080E4244
	movs r1, #1
	ldr r0, [sp, #0x10]
	b .L080E439E
.L080E436C:
	adds r0, r4, #0
	bl func_080E2354
	str r0, [sp, #8]
.L080E4374:
	ldr r2, [sp, #8]
	movs r3, #0
	ldr r1, [r2, #0x10]
	ldr r0, [r7]
	cmp r1, r0
	bge .L080E4382
	movs r3, #1
.L080E4382:
	adds r0, r3, #0
	cmp r0, #0
	beq .L080E43A4
	str r7, [sp]
	movs r0, #0
	str r0, [sp, #4]
	add r0, sp, #0xc
	mov r1, r8
	adds r2, r5, #0
	adds r3, r4, #0
	bl func_080E4244
	movs r1, #1
	ldr r0, [sp, #0xc]
.L080E439E:
	str r0, [r6]
	strb r1, [r6, #4]
	b .L080E43A8
.L080E43A4:
	str r2, [r6]
	strb r0, [r6, #4]
.L080E43A8:
	adds r0, r6, #0
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080E43B8
func_080E43B8: @ 0x080E43B8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r5, #0
	adds r4, #0xa4
	ldr r0, [r4, #8]
	cmp r0, #0
	beq .L080E43E2
	ldr r0, [r4, #4]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	bl func_080DC57C
	ldr r0, [r4, #4]
	str r0, [r0, #8]
	ldr r0, [r4, #4]
	movs r1, #0
	str r1, [r0, #4]
	ldr r0, [r4, #4]
	str r0, [r0, #0xc]
	str r1, [r4, #8]
.L080E43E2:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq .L080E43EC
	bl free
.L080E43EC:
	adds r0, r5, #0
	adds r1, r6, #0
	bl func_080A4B6C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080E43FC
func_080E43FC: @ 0x080E43FC
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	adds r4, r6, #0
	adds r4, #8
	movs r5, #0
	str r5, [r4, #4]
	movs r0, #0x18
	bl malloc
	cmp r0, #0
	bne .L080E441A
	movs r0, #0x18
	bl func_080D3BC0
.L080E441A:
	str r0, [r4, #4]
	str r5, [r4, #8]
	str r5, [r4, #0xc]
	strb r5, [r0]
	str r5, [r0, #4]
	ldr r0, [r4, #4]
	str r0, [r0, #8]
	ldr r0, [r4, #4]
	str r0, [r0, #0xc]
	adds r0, r6, #0
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080E4438
func_080E4438: @ 0x080E4438
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	mov ip, r1
	ldrb r0, [r1]
	mov r1, r8
	strb r0, [r1]
	mov r5, ip
	ldrb r0, [r5, #1]
	strb r0, [r1, #1]
	mov r3, r8
	adds r3, #4
	movs r4, #1
	mov r2, ip
	adds r2, #4
	movs r6, #1
	rsbs r6, r6, #0
	mov sb, r6
.L080E4460:
	adds r1, r3, #0
	adds r0, r2, #0
	ldm r0!, {r5, r6, r7}
	stm r1!, {r5, r6, r7}
	ldm r0!, {r5, r6, r7}
	stm r1!, {r5, r6, r7}
	ldm r0!, {r5, r7}
	stm r1!, {r5, r7}
	adds r3, #0x20
	adds r2, #0x20
	subs r4, #1
	cmp r4, sb
	bne .L080E4460
	mov r4, r8
	adds r4, #0x44
	movs r6, #1
	mov r5, ip
	adds r5, #0x44
.L080E4484:
	cmp r5, r4
	beq .L080E449A
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	ldr r1, [r5, #4]
	adds r0, r4, #0
	bl func_08007CD8
	str r0, [r4, #4]
.L080E449A:
	adds r4, #8
	adds r5, #8
	subs r6, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r6, r0
	bne .L080E4484
	mov r0, r8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080E44B8
func_080E44B8: @ 0x080E44B8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r5, #4
	movs r1, #2
	bl func_080AC85C
	ldr r0, .L080E44E0 @ =vtable_unk_080E61A0
	str r0, [r5]
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq .L080E44D8
	adds r0, r5, #0
	bl __builtin_delete
.L080E44D8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080E44E0: .4byte vtable_unk_080E61A0

	thumb_func_start func_080E44E4
func_080E44E4: @ 0x080E44E4
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0x8c
	bl __builtin_new
	movs r1, #1
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	add r2, sp, #0xc
	strb r1, [r2]
	adds r1, r4, #0
	movs r2, #5
	movs r3, #0x1b
	bl func_080324BC
	add sp, #0x10
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start func_080E4510
func_080E4510: @ 0x080E4510
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L080E4540 @ =__vt_7AEntity
	str r0, [r4, #0x14]
	ldr r1, [r4, #0x10]
	cmp r1, #0
	beq .L080E452C
	ldr r0, [r1, #4]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E452C:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq .L080E453A
	adds r0, r4, #0
	bl __builtin_delete
.L080E453A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080E4540: .4byte __vt_7AEntity

	thumb_func_start func_080E4544
func_080E4544: @ 0x080E4544
	push {lr}
	adds r2, r0, #0
	ldr r0, .L080E4560 @ =vtable_unk_080E61A0
	str r0, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L080E455A
	adds r0, r2, #0
	bl __builtin_delete
.L080E455A:
	pop {r0}
	bx r0
	.align 2, 0
.L080E4560: .4byte vtable_unk_080E61A0

	thumb_func_start func_080E4564
func_080E4564: @ 0x080E4564
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	ldr r1, .L080E4818 @ =0x00000888
	adds r0, r5, r1
	movs r1, #2
	bl func_080E4860
	ldr r1, .L080E481C @ =0x0000082C
	adds r0, r5, r1
	movs r1, #2
	bl func_080098AC
	movs r1, #0x82
	lsls r1, r1, #4
	adds r0, r5, r1
	movs r1, #2
	bl func_080098AC
	movs r1, #0xfd
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	ldr r1, .L080E4820 @ =0x000007E4
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	movs r1, #0xf8
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	ldr r1, .L080E4824 @ =0x000007BC
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	movs r1, #0xe1
	lsls r1, r1, #3
	adds r0, r5, r1
	cmp r0, #0
	beq .L080E45DA
	adds r1, #0x14
	adds r4, r5, r1
	cmp r0, r4
	beq .L080E45DA
	movs r0, #0xe1
	lsls r0, r0, #3
	adds r6, r5, r0
.L080E45CE:
	subs r4, #4
	ldr r0, [r4]
	bl __builtin_delete
	cmp r6, r4
	bne .L080E45CE
.L080E45DA:
	ldr r1, .L080E4828 @ =0x000006F4
	adds r0, r5, r1
	cmp r0, #0
	beq .L080E45FA
	adds r1, #0x14
	adds r4, r5, r1
	cmp r0, r4
	beq .L080E45FA
	ldr r0, .L080E4828 @ =0x000006F4
	adds r6, r5, r0
.L080E45EE:
	subs r4, #4
	ldr r0, [r4]
	bl __builtin_delete
	cmp r6, r4
	bne .L080E45EE
.L080E45FA:
	movs r1, #0xdc
	lsls r1, r1, #3
	adds r0, r5, r1
	cmp r0, #0
	beq .L080E461E
	adds r1, #0x14
	adds r4, r5, r1
	cmp r0, r4
	beq .L080E461E
	movs r0, #0xdc
	lsls r0, r0, #3
	adds r6, r5, r0
.L080E4612:
	subs r4, #4
	ldr r0, [r4]
	bl __builtin_delete
	cmp r6, r4
	bne .L080E4612
.L080E461E:
	ldr r1, .L080E482C @ =0x0000062C
	adds r0, r5, r1
	cmp r0, #0
	beq .L080E463E
	adds r1, #0x14
	adds r4, r5, r1
	cmp r0, r4
	beq .L080E463E
	ldr r0, .L080E482C @ =0x0000062C
	adds r6, r5, r0
.L080E4632:
	subs r4, #4
	ldr r0, [r4]
	bl __builtin_delete
	cmp r6, r4
	bne .L080E4632
.L080E463E:
	movs r1, #0xc3
	lsls r1, r1, #3
	adds r0, r5, r1
	cmp r0, #0
	beq .L080E4662
	adds r1, #0x14
	adds r4, r5, r1
	cmp r0, r4
	beq .L080E4662
	movs r0, #0xc3
	lsls r0, r0, #3
	adds r6, r5, r0
.L080E4656:
	subs r4, #4
	ldr r0, [r4]
	bl __builtin_delete
	cmp r6, r4
	bne .L080E4656
.L080E4662:
	ldr r1, .L080E4830 @ =0x00000564
	adds r0, r5, r1
	cmp r0, #0
	beq .L080E4682
	adds r1, #0x14
	adds r4, r5, r1
	cmp r0, r4
	beq .L080E4682
	ldr r0, .L080E4830 @ =0x00000564
	adds r6, r5, r0
.L080E4676:
	subs r4, #4
	ldr r0, [r4]
	bl __builtin_delete
	cmp r6, r4
	bne .L080E4676
.L080E4682:
	movs r1, #0xaa
	lsls r1, r1, #3
	adds r0, r5, r1
	cmp r0, #0
	beq .L080E46A6
	adds r1, #0x14
	adds r4, r5, r1
	cmp r0, r4
	beq .L080E46A6
	movs r0, #0xaa
	lsls r0, r0, #3
	adds r6, r5, r0
.L080E469A:
	subs r4, #4
	ldr r0, [r4]
	bl __builtin_delete
	cmp r6, r4
	bne .L080E469A
.L080E46A6:
	ldr r1, .L080E4834 @ =0x0000052C
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	movs r1, #0xa5
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	ldr r1, .L080E4838 @ =0x00000504
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	movs r1, #0xa0
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	ldr r1, .L080E483C @ =0x000004DC
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	movs r1, #0x9b
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	ldr r1, .L080E4840 @ =0x000004B4
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	movs r1, #0x96
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	ldr r1, .L080E4844 @ =0x0000048C
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	movs r1, #0x91
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	ldr r1, .L080E4848 @ =0x00000464
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	movs r1, #0x8c
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	ldr r1, .L080E484C @ =0x0000043C
	adds r0, r5, r1
	ldr r1, [r0]
	cmp r1, #0
	beq .L080E4740
	ldr r0, [r1, #8]
	ldr r2, [r0, #0xc]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E4740:
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r1, [r0]
	cmp r1, #0
	beq .L080E4758
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E4758:
	ldr r1, .L080E4850 @ =0x00000434
	adds r0, r5, r1
	ldr r1, [r0]
	cmp r1, #0
	beq .L080E476E
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E476E:
	movs r1, #0x86
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r1, [r0]
	cmp r1, #0
	beq .L080E4786
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E4786:
	ldr r1, .L080E4854 @ =0x0000042C
	adds r0, r5, r1
	ldr r1, [r0]
	cmp r1, #0
	beq .L080E479C
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E479C:
	movs r1, #0x85
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r1, [r0]
	cmp r1, #0
	beq .L080E47B4
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E47B4:
	ldr r1, .L080E4858 @ =0x00000424
	adds r0, r5, r1
	ldr r1, [r0]
	cmp r1, #0
	beq .L080E47CA
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E47CA:
	movs r1, #0x84
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r1, [r0]
	cmp r1, #0
	beq .L080E47E2
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E47E2:
	ldr r1, .L080E485C @ =0x0000041C
	adds r0, r5, r1
	ldr r1, [r0]
	cmp r1, #0
	beq .L080E47F8
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E47F8:
	movs r1, #0x83
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r0, [r0]
	cmp r0, #0
	beq .L080E480A
	movs r1, #3
	bl func_08050D0C
.L080E480A:
	adds r0, r5, #0
	adds r1, r7, #0
	bl func_080086BC
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080E4818: .4byte 0x00000888
.L080E481C: .4byte 0x0000082C
.L080E4820: .4byte 0x000007E4
.L080E4824: .4byte 0x000007BC
.L080E4828: .4byte 0x000006F4
.L080E482C: .4byte 0x0000062C
.L080E4830: .4byte 0x00000564
.L080E4834: .4byte 0x0000052C
.L080E4838: .4byte 0x00000504
.L080E483C: .4byte 0x000004DC
.L080E4840: .4byte 0x000004B4
.L080E4844: .4byte 0x0000048C
.L080E4848: .4byte 0x00000464
.L080E484C: .4byte 0x0000043C
.L080E4850: .4byte 0x00000434
.L080E4854: .4byte 0x0000042C
.L080E4858: .4byte 0x00000424
.L080E485C: .4byte 0x0000041C

	thumb_func_start func_080E4860
func_080E4860: @ 0x080E4860
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r6, #0
	adds r4, #0x50
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	ldr r1, [r6, #4]
	adds r0, r6, #0
	bl func_08007C28
	adds r0, r6, #0
	movs r1, #2
	bl func_080079E8
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq .L080E493A
	adds r0, r6, #0
	bl __builtin_delete
.L080E493A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start func_080E4940
func_080E4940: @ 0x080E4940
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	ldr r1, .L080E4C70 @ =0x00000AEC
	adds r0, r5, r1
	cmp r0, #0
	beq .L080E4966
	adds r1, #0x28
	adds r4, r5, r1
	cmp r0, r4
	beq .L080E4966
	ldr r0, .L080E4C70 @ =0x00000AEC
	adds r6, r5, r0
.L080E495A:
	subs r4, #4
	ldr r0, [r4]
	bl __builtin_delete
	cmp r6, r4
	bne .L080E495A
.L080E4966:
	ldr r1, .L080E4C74 @ =0x00000AC8
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	ldr r1, .L080E4C78 @ =0x00000AA4
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	movs r1, #0xa8
	lsls r1, r1, #4
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	ldr r1, .L080E4C7C @ =0x00000A7C
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	ldr r1, .L080E4C80 @ =0x00000A34
	adds r0, r5, r1
	cmp r0, #0
	beq .L080E49B0
	adds r1, #8
	adds r4, r5, r1
	cmp r0, r4
	beq .L080E49B0
	ldr r0, .L080E4C80 @ =0x00000A34
	adds r6, r5, r0
.L080E49A4:
	subs r4, #4
	ldr r0, [r4]
	bl __builtin_delete
	cmp r6, r4
	bne .L080E49A4
.L080E49B0:
	movs r1, #0xa3
	lsls r1, r1, #4
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	ldr r1, .L080E4C84 @ =0x000009E8
	adds r0, r5, r1
	cmp r0, #0
	beq .L080E49DC
	adds r1, #8
	adds r4, r5, r1
	cmp r0, r4
	beq .L080E49DC
	ldr r0, .L080E4C84 @ =0x000009E8
	adds r6, r5, r0
.L080E49D0:
	subs r4, #4
	ldr r0, [r4]
	bl __builtin_delete
	cmp r6, r4
	bne .L080E49D0
.L080E49DC:
	ldr r1, .L080E4C88 @ =0x000009E4
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	movs r1, #0x9c
	lsls r1, r1, #4
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	ldr r1, .L080E4C8C @ =0x000009BC
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	ldr r1, .L080E4C90 @ =0x00000998
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	ldr r1, .L080E4C94 @ =0x00000994
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	movs r1, #0x97
	lsls r1, r1, #4
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	ldr r1, .L080E4C98 @ =0x0000096C
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	ldr r1, .L080E4C9C @ =0x00000924
	adds r0, r5, r1
	cmp r0, #0
	beq .L080E4A46
	adds r1, #8
	adds r4, r5, r1
	cmp r0, r4
	beq .L080E4A46
	ldr r0, .L080E4C9C @ =0x00000924
	adds r6, r5, r0
.L080E4A3A:
	subs r4, #4
	ldr r0, [r4]
	bl __builtin_delete
	cmp r6, r4
	bne .L080E4A3A
.L080E4A46:
	ldr r1, .L080E4CA0 @ =0x0000091C
	adds r0, r5, r1
	cmp r0, #0
	beq .L080E4A66
	adds r1, #8
	adds r4, r5, r1
	cmp r0, r4
	beq .L080E4A66
	ldr r0, .L080E4CA0 @ =0x0000091C
	adds r6, r5, r0
.L080E4A5A:
	subs r4, #4
	ldr r0, [r4]
	bl __builtin_delete
	cmp r6, r4
	bne .L080E4A5A
.L080E4A66:
	ldr r1, .L080E4CA4 @ =0x000008F8
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	ldr r1, .L080E4CA8 @ =0x000008F4
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	movs r1, #0x8d
	lsls r1, r1, #4
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	ldr r1, .L080E4CAC @ =0x000008CC
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	ldr r1, .L080E4CB0 @ =0x00000884
	adds r0, r5, r1
	cmp r0, #0
	beq .L080E4AB0
	adds r1, #8
	adds r4, r5, r1
	cmp r0, r4
	beq .L080E4AB0
	ldr r0, .L080E4CB0 @ =0x00000884
	adds r6, r5, r0
.L080E4AA4:
	subs r4, #4
	ldr r0, [r4]
	bl __builtin_delete
	cmp r6, r4
	bne .L080E4AA4
.L080E4AB0:
	ldr r1, .L080E4CB4 @ =0x0000087C
	adds r0, r5, r1
	cmp r0, #0
	beq .L080E4AD0
	adds r1, #8
	adds r4, r5, r1
	cmp r0, r4
	beq .L080E4AD0
	ldr r0, .L080E4CB4 @ =0x0000087C
	adds r6, r5, r0
.L080E4AC4:
	subs r4, #4
	ldr r0, [r4]
	bl __builtin_delete
	cmp r6, r4
	bne .L080E4AC4
.L080E4AD0:
	movs r1, #0xf9
	lsls r1, r1, #3
	adds r0, r5, r1
	cmp r0, #0
	beq .L080E4AF4
	adds r1, #0x14
	adds r4, r5, r1
	cmp r0, r4
	beq .L080E4AF4
	movs r0, #0xf9
	lsls r0, r0, #3
	adds r6, r5, r0
.L080E4AE8:
	subs r4, #4
	ldr r0, [r4]
	bl __builtin_delete
	cmp r6, r4
	bne .L080E4AE8
.L080E4AF4:
	ldr r1, .L080E4CB8 @ =0x000007B4
	adds r0, r5, r1
	cmp r0, #0
	beq .L080E4B14
	adds r1, #0x14
	adds r4, r5, r1
	cmp r0, r4
	beq .L080E4B14
	ldr r0, .L080E4CB8 @ =0x000007B4
	adds r6, r5, r0
.L080E4B08:
	subs r4, #4
	ldr r0, [r4]
	bl __builtin_delete
	cmp r6, r4
	bne .L080E4B08
.L080E4B14:
	ldr r1, .L080E4CBC @ =0x000007AC
	adds r0, r5, r1
	cmp r0, #0
	beq .L080E4B34
	adds r1, #8
	adds r4, r5, r1
	cmp r0, r4
	beq .L080E4B34
	ldr r0, .L080E4CBC @ =0x000007AC
	adds r6, r5, r0
.L080E4B28:
	subs r4, #4
	ldr r0, [r4]
	bl __builtin_delete
	cmp r6, r4
	bne .L080E4B28
.L080E4B34:
	ldr r1, .L080E4CC0 @ =0x000007A4
	adds r0, r5, r1
	cmp r0, #0
	beq .L080E4B54
	adds r1, #8
	adds r4, r5, r1
	cmp r0, r4
	beq .L080E4B54
	ldr r0, .L080E4CC0 @ =0x000007A4
	adds r6, r5, r0
.L080E4B48:
	subs r4, #4
	ldr r0, [r4]
	bl __builtin_delete
	cmp r6, r4
	bne .L080E4B48
.L080E4B54:
	movs r1, #0xf4
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r1, [r0]
	cmp r1, #0
	beq .L080E4B6C
	ldr r0, [r1, #8]
	ldr r2, [r0, #0xc]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E4B6C:
	ldr r1, .L080E4CC4 @ =0x0000079C
	adds r0, r5, r1
	ldr r1, [r0]
	cmp r1, #0
	beq .L080E4B82
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E4B82:
	movs r1, #0xf3
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r1, [r0]
	cmp r1, #0
	beq .L080E4B9A
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E4B9A:
	ldr r1, .L080E4CC8 @ =0x00000794
	adds r0, r5, r1
	ldr r1, [r0]
	cmp r1, #0
	beq .L080E4BB0
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E4BB0:
	movs r1, #0xf2
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r1, [r0]
	cmp r1, #0
	beq .L080E4BC8
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E4BC8:
	ldr r1, .L080E4CCC @ =0x0000078C
	adds r0, r5, r1
	ldr r1, [r0]
	cmp r1, #0
	beq .L080E4BDE
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E4BDE:
	movs r1, #0xf1
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r1, [r0]
	cmp r1, #0
	beq .L080E4BF6
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E4BF6:
	ldr r1, .L080E4CD0 @ =0x00000784
	adds r0, r5, r1
	ldr r1, [r0]
	cmp r1, #0
	beq .L080E4C0C
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E4C0C:
	movs r1, #0xf0
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r1, [r0]
	cmp r1, #0
	beq .L080E4C24
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E4C24:
	ldr r0, .L080E4CD4 @ =0x0000077C
	adds r4, r5, r0
	ldr r1, [r4]
	cmp r1, #0
	beq .L080E4C3A
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E4C3A:
	ldr r1, .L080E4CD8 @ =0x0000073C
	adds r0, r5, r1
	cmp r0, #0
	beq .L080E4C5E
	cmp r0, r4
	beq .L080E4C5E
	adds r6, r0, #0
.L080E4C48:
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	cmp r6, r4
	bne .L080E4C48
.L080E4C5E:
	ldr r1, .L080E4CDC @ =0x0000072C
	adds r0, r5, r1
	cmp r0, #0
	beq .L080E4CFC
	adds r1, #0x10
	adds r4, r5, r1
	cmp r0, r4
	b .L080E4CE0
	.align 2, 0
.L080E4C70: .4byte 0x00000AEC
.L080E4C74: .4byte 0x00000AC8
.L080E4C78: .4byte 0x00000AA4
.L080E4C7C: .4byte 0x00000A7C
.L080E4C80: .4byte 0x00000A34
.L080E4C84: .4byte 0x000009E8
.L080E4C88: .4byte 0x000009E4
.L080E4C8C: .4byte 0x000009BC
.L080E4C90: .4byte 0x00000998
.L080E4C94: .4byte 0x00000994
.L080E4C98: .4byte 0x0000096C
.L080E4C9C: .4byte 0x00000924
.L080E4CA0: .4byte 0x0000091C
.L080E4CA4: .4byte 0x000008F8
.L080E4CA8: .4byte 0x000008F4
.L080E4CAC: .4byte 0x000008CC
.L080E4CB0: .4byte 0x00000884
.L080E4CB4: .4byte 0x0000087C
.L080E4CB8: .4byte 0x000007B4
.L080E4CBC: .4byte 0x000007AC
.L080E4CC0: .4byte 0x000007A4
.L080E4CC4: .4byte 0x0000079C
.L080E4CC8: .4byte 0x00000794
.L080E4CCC: .4byte 0x0000078C
.L080E4CD0: .4byte 0x00000784
.L080E4CD4: .4byte 0x0000077C
.L080E4CD8: .4byte 0x0000073C
.L080E4CDC: .4byte 0x0000072C
.L080E4CE0:
	beq .L080E4CFC
	ldr r0, .L080E4D44 @ =0x0000072C
	adds r6, r5, r0
.L080E4CE6:
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	cmp r6, r4
	bne .L080E4CE6
.L080E4CFC:
	ldr r1, .L080E4D48 @ =0x00000724
	adds r4, r5, r1
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	ldr r0, .L080E4D4C @ =0x0000071C
	adds r4, r5, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	movs r1, #0xe3
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r0, [r0]
	cmp r0, #0
	beq .L080E4D36
	movs r1, #3
	bl func_08050D0C
.L080E4D36:
	adds r0, r5, #0
	adds r1, r7, #0
	bl func_080086BC
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080E4D44: .4byte 0x0000072C
.L080E4D48: .4byte 0x00000724
.L080E4D4C: .4byte 0x0000071C

	thumb_func_start func_080E4D50
func_080E4D50: @ 0x080E4D50
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r1, #0xb6
	lsls r1, r1, #3
	adds r0, r4, r1
	movs r1, #2
	bl func_080E4F34
	ldr r1, .L080E4F00 @ =0x00000594
	adds r0, r4, r1
	movs r1, #2
	bl func_080098AC
	movs r1, #0xb1
	lsls r1, r1, #3
	adds r0, r4, r1
	movs r1, #2
	bl func_080098AC
	ldr r1, .L080E4F04 @ =0x00000554
	adds r0, r4, r1
	ldr r0, [r0]
	bl __builtin_delete
	movs r1, #0xaa
	lsls r1, r1, #3
	adds r0, r4, r1
	ldr r0, [r0]
	bl __builtin_delete
	ldr r1, .L080E4F08 @ =0x0000052C
	adds r0, r4, r1
	ldr r0, [r0]
	bl __builtin_delete
	movs r1, #0xa5
	lsls r1, r1, #3
	adds r0, r4, r1
	ldr r0, [r0]
	bl __builtin_delete
	ldr r1, .L080E4F0C @ =0x00000504
	adds r0, r4, r1
	ldr r0, [r0]
	bl __builtin_delete
	movs r1, #0xa0
	lsls r1, r1, #3
	adds r0, r4, r1
	ldr r0, [r0]
	bl __builtin_delete
	ldr r1, .L080E4F10 @ =0x000004DC
	adds r0, r4, r1
	ldr r0, [r0]
	bl __builtin_delete
	movs r1, #0x9b
	lsls r1, r1, #3
	adds r0, r4, r1
	ldr r0, [r0]
	bl __builtin_delete
	ldr r1, .L080E4F14 @ =0x000004B4
	adds r0, r4, r1
	ldr r0, [r0]
	bl __builtin_delete
	movs r1, #0x96
	lsls r1, r1, #3
	adds r0, r4, r1
	ldr r0, [r0]
	bl __builtin_delete
	ldr r1, .L080E4F18 @ =0x0000048C
	adds r0, r4, r1
	ldr r0, [r0]
	bl __builtin_delete
	movs r1, #0x91
	lsls r1, r1, #3
	adds r0, r4, r1
	ldr r0, [r0]
	bl __builtin_delete
	ldr r1, .L080E4F1C @ =0x00000464
	adds r0, r4, r1
	ldr r0, [r0]
	bl __builtin_delete
	movs r1, #0x8c
	lsls r1, r1, #3
	adds r0, r4, r1
	ldr r0, [r0]
	bl __builtin_delete
	ldr r1, .L080E4F20 @ =0x0000043C
	adds r0, r4, r1
	ldr r1, [r0]
	cmp r1, #0
	beq .L080E4E28
	ldr r0, [r1, #8]
	ldr r2, [r0, #0xc]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E4E28:
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r4, r1
	ldr r1, [r0]
	cmp r1, #0
	beq .L080E4E40
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E4E40:
	ldr r1, .L080E4F24 @ =0x00000434
	adds r0, r4, r1
	ldr r1, [r0]
	cmp r1, #0
	beq .L080E4E56
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E4E56:
	movs r1, #0x86
	lsls r1, r1, #3
	adds r0, r4, r1
	ldr r1, [r0]
	cmp r1, #0
	beq .L080E4E6E
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E4E6E:
	ldr r1, .L080E4F28 @ =0x0000042C
	adds r0, r4, r1
	ldr r1, [r0]
	cmp r1, #0
	beq .L080E4E84
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E4E84:
	movs r1, #0x85
	lsls r1, r1, #3
	adds r0, r4, r1
	ldr r1, [r0]
	cmp r1, #0
	beq .L080E4E9C
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E4E9C:
	ldr r1, .L080E4F2C @ =0x00000424
	adds r0, r4, r1
	ldr r1, [r0]
	cmp r1, #0
	beq .L080E4EB2
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E4EB2:
	movs r1, #0x84
	lsls r1, r1, #3
	adds r0, r4, r1
	ldr r1, [r0]
	cmp r1, #0
	beq .L080E4ECA
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E4ECA:
	ldr r1, .L080E4F30 @ =0x0000041C
	adds r0, r4, r1
	ldr r1, [r0]
	cmp r1, #0
	beq .L080E4EE0
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E4EE0:
	movs r1, #0x83
	lsls r1, r1, #3
	adds r0, r4, r1
	ldr r0, [r0]
	cmp r0, #0
	beq .L080E4EF2
	movs r1, #3
	bl func_08050D0C
.L080E4EF2:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_080086BC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080E4F00: .4byte 0x00000594
.L080E4F04: .4byte 0x00000554
.L080E4F08: .4byte 0x0000052C
.L080E4F0C: .4byte 0x00000504
.L080E4F10: .4byte 0x000004DC
.L080E4F14: .4byte 0x000004B4
.L080E4F18: .4byte 0x0000048C
.L080E4F1C: .4byte 0x00000464
.L080E4F20: .4byte 0x0000043C
.L080E4F24: .4byte 0x00000434
.L080E4F28: .4byte 0x0000042C
.L080E4F2C: .4byte 0x00000424
.L080E4F30: .4byte 0x0000041C

	thumb_func_start func_080E4F34
func_080E4F34: @ 0x080E4F34
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r6, #0
	adds r4, #0x40
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	ldr r1, [r6, #4]
	adds r0, r6, #0
	bl func_08007C28
	adds r0, r6, #0
	movs r1, #2
	bl func_080079E8
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq .L080E4FEA
	adds r0, r6, #0
	bl __builtin_delete
.L080E4FEA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start func_080E4FF0
func_080E4FF0: @ 0x080E4FF0
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	ldr r1, .L080E5250 @ =0x0000083C
	adds r0, r5, r1
	movs r1, #2
	bl func_080E5324
	movs r1, #0x83
	lsls r1, r1, #4
	adds r0, r5, r1
	movs r1, #2
	bl func_080098AC
	ldr r1, .L080E5254 @ =0x00000824
	adds r0, r5, r1
	movs r1, #2
	bl func_080098AC
	ldr r1, .L080E5258 @ =0x000007EC
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	movs r1, #0xfd
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	ldr r1, .L080E525C @ =0x000007C4
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	movs r1, #0xf8
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	ldr r1, .L080E5260 @ =0x0000079C
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	movs r1, #0xf3
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	ldr r1, .L080E5264 @ =0x00000754
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	movs r1, #0xea
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	ldr r1, .L080E5268 @ =0x0000072C
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	movs r1, #0xe5
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	ldr r1, .L080E526C @ =0x000006A4
	adds r0, r5, r1
	cmp r0, #0
	beq .L080E50A4
	adds r1, #0x64
	adds r4, r5, r1
	cmp r0, r4
	beq .L080E50A4
	ldr r0, .L080E526C @ =0x000006A4
	adds r6, r5, r0
.L080E5098:
	subs r4, #4
	ldr r0, [r4]
	bl __builtin_delete
	cmp r6, r4
	bne .L080E5098
.L080E50A4:
	movs r1, #0xd4
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	ldr r1, .L080E5270 @ =0x0000061C
	adds r0, r5, r1
	cmp r0, #0
	beq .L080E50D0
	adds r1, #0x64
	adds r4, r5, r1
	cmp r0, r4
	beq .L080E50D0
	ldr r0, .L080E5270 @ =0x0000061C
	adds r6, r5, r0
.L080E50C4:
	subs r4, #4
	ldr r0, [r4]
	bl __builtin_delete
	cmp r6, r4
	bne .L080E50C4
.L080E50D0:
	movs r1, #0xc3
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	ldr r1, .L080E5274 @ =0x000005F4
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	movs r1, #0xbe
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	ldr r1, .L080E5278 @ =0x000005CC
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	movs r1, #0xb9
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	ldr r1, .L080E527C @ =0x000005A4
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	movs r1, #0xb4
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	ldr r1, .L080E5280 @ =0x0000057C
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	movs r1, #0xaf
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	ldr r1, .L080E5284 @ =0x00000554
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	movs r1, #0xaa
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r0, [r0]
	bl __builtin_delete
	ldr r1, .L080E5288 @ =0x00000544
	adds r0, r5, r1
	ldr r1, [r0]
	cmp r1, #0
	beq .L080E5160
	ldr r0, [r1, #8]
	ldr r2, [r0, #0xc]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E5160:
	movs r1, #0xa8
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r1, [r0]
	cmp r1, #0
	beq .L080E5178
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E5178:
	ldr r1, .L080E528C @ =0x0000053C
	adds r0, r5, r1
	ldr r1, [r0]
	cmp r1, #0
	beq .L080E518E
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E518E:
	movs r1, #0xa7
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r1, [r0]
	cmp r1, #0
	beq .L080E51A6
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E51A6:
	ldr r1, .L080E5290 @ =0x00000534
	adds r0, r5, r1
	ldr r1, [r0]
	cmp r1, #0
	beq .L080E51BC
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E51BC:
	movs r1, #0xa6
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r1, [r0]
	cmp r1, #0
	beq .L080E51D4
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E51D4:
	ldr r1, .L080E5294 @ =0x0000052C
	adds r0, r5, r1
	ldr r1, [r0]
	cmp r1, #0
	beq .L080E51EA
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E51EA:
	movs r1, #0xa5
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r1, [r0]
	cmp r1, #0
	beq .L080E5202
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E5202:
	ldr r1, .L080E5298 @ =0x00000524
	adds r0, r5, r1
	ldr r1, [r0]
	cmp r1, #0
	beq .L080E5218
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E5218:
	movs r1, #0xa4
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r1, [r0]
	cmp r1, #0
	beq .L080E5230
	ldr r0, [r1]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E5230:
	ldr r1, .L080E529C @ =0x0000051C
	adds r0, r5, r1
	ldr r0, [r0]
	cmp r0, #0
	beq .L080E5240
	movs r1, #3
	bl func_08050D0C
.L080E5240:
	adds r0, r5, #0
	adds r1, r7, #0
	bl func_080086BC
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080E5250: .4byte 0x0000083C
.L080E5254: .4byte 0x00000824
.L080E5258: .4byte 0x000007EC
.L080E525C: .4byte 0x000007C4
.L080E5260: .4byte 0x0000079C
.L080E5264: .4byte 0x00000754
.L080E5268: .4byte 0x0000072C
.L080E526C: .4byte 0x000006A4
.L080E5270: .4byte 0x0000061C
.L080E5274: .4byte 0x000005F4
.L080E5278: .4byte 0x000005CC
.L080E527C: .4byte 0x000005A4
.L080E5280: .4byte 0x0000057C
.L080E5284: .4byte 0x00000554
.L080E5288: .4byte 0x00000544
.L080E528C: .4byte 0x0000053C
.L080E5290: .4byte 0x00000534
.L080E5294: .4byte 0x0000052C
.L080E5298: .4byte 0x00000524
.L080E529C: .4byte 0x0000051C

	thumb_func_start func_080E52A0
func_080E52A0: @ 0x080E52A0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl func_08007874
	movs r5, #0
	str r5, [r6, #4]
	adds r4, r6, #0
	adds r4, #8
	adds r0, r4, #0
	bl func_08007874
	str r5, [r4, #4]
	adds r4, #8
	adds r0, r4, #0
	bl func_08007874
	str r5, [r4, #4]
	adds r4, #8
	adds r0, r4, #0
	bl func_08007874
	str r5, [r4, #4]
	adds r4, #8
	adds r0, r4, #0
	bl func_08007874
	str r5, [r4, #4]
	adds r4, #8
	adds r0, r4, #0
	bl func_08007874
	str r5, [r4, #4]
	adds r4, #8
	adds r0, r4, #0
	bl func_08007874
	str r5, [r4, #4]
	adds r4, #8
	adds r0, r4, #0
	bl func_08007874
	str r5, [r4, #4]
	adds r4, #8
	adds r0, r4, #0
	bl func_08007874
	str r5, [r4, #4]
	adds r4, #8
	adds r0, r4, #0
	bl func_08007874
	str r5, [r4, #4]
	adds r4, #8
	adds r0, r4, #0
	bl func_08007874
	str r5, [r4, #4]
	adds r4, #8
	adds r0, r4, #0
	bl func_08007874
	str r5, [r4, #4]
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start func_080E5324
func_080E5324: @ 0x080E5324
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r6, #0
	adds r4, #0x58
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	ldr r1, [r6, #4]
	adds r0, r6, #0
	bl func_08007C28
	adds r0, r6, #0
	movs r1, #2
	bl func_080079E8
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq .L080E5410
	adds r0, r6, #0
	bl __builtin_delete
.L080E5410:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080E5418
func_080E5418: @ 0x080E5418
	push {lr}
	ldr r0, .L080E5428 @ =gUnk_03000414
	ldr r0, [r0]
	ldr r0, [r0]
	bl func_080CA6F4
	pop {r0}
	bx r0
	.align 2, 0
.L080E5428: .4byte gUnk_03000414

	thumb_func_start func_080E542C
func_080E542C: @ 0x080E542C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, .L080E5468 @ =vtable_unk_080E857C
	str r0, [r5, #0x14]
	ldr r0, [r1]
	str r0, [r5]
	movs r4, #4
	movs r0, #4
	bl func_08000528
	ands r4, r0
	strh r4, [r5, #4]
	ldr r0, .L080E546C @ =gUnk_03000414
	ldr r1, [r0]
	str r5, [r0]
	str r1, [r5, #8]
	ldr r0, .L080E5470 @ =vtable_unk_080E8588
	str r0, [r5, #0xc]
	ldr r1, .L080E5474 @ =func_080E5418
	movs r0, #2
	bl func_080D100C
	str r0, [r5, #0x10]
	movs r0, #4
	bl func_0800050C
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L080E5468: .4byte vtable_unk_080E857C
.L080E546C: .4byte gUnk_03000414
.L080E5470: .4byte vtable_unk_080E8588
.L080E5474: .4byte func_080E5418

	thumb_func_start func_080E5478
func_080E5478: @ 0x080E5478
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L080E54B8 @ =vtable_unk_080E857C
	str r0, [r4, #0x14]
	movs r0, #4
	bl func_08000528
	ldr r1, [r4, #0x10]
	movs r0, #2
	bl func_080D100C
	ldr r0, .L080E54BC @ =vtable_unk_080E8594
	str r0, [r4, #0xc]
	ldr r1, .L080E54C0 @ =gUnk_03000414
	ldr r0, [r4, #8]
	str r0, [r1]
	ldrh r0, [r4, #4]
	cmp r0, #0
	beq .L080E54A4
	bl func_080004F4
.L080E54A4:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq .L080E54B2
	adds r0, r4, #0
	bl __builtin_delete
.L080E54B2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080E54B8: .4byte vtable_unk_080E857C
.L080E54BC: .4byte vtable_unk_080E8594
.L080E54C0: .4byte gUnk_03000414

	thumb_func_start func_080E54C4
func_080E54C4: @ 0x080E54C4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	cmp r4, #0
	beq .L080E54E8
.L080E54CE:
	ldr r1, [r4, #0xc]
	adds r0, r6, #0
	bl func_080E54C4
	ldr r5, [r4, #8]
	cmp r4, #0
	beq .L080E54E2
	adds r0, r4, #0
	bl free
.L080E54E2:
	adds r4, r5, #0
	cmp r4, #0
	bne .L080E54CE
.L080E54E8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080E54F0
func_080E54F0: @ 0x080E54F0
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r4, [sp, #0x14]
	adds r5, r3, #0
	ldr r0, [r6, #4]
	cmp r5, r0
	beq .L080E551A
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne .L080E555A
	cmp r2, #0
	bne .L080E551A
	movs r2, #0
	ldr r1, [r4]
	ldr r0, [r5, #0x10]
	cmp r1, r0
	bhs .L080E5516
	movs r2, #1
.L080E5516:
	cmp r2, #0
	beq .L080E555A
.L080E551A:
	movs r0, #0x18
	bl malloc
	adds r2, r0, #0
	cmp r2, #0
	bne .L080E552E
	movs r0, #0x18
	bl func_080D3BC0
	adds r2, r0, #0
.L080E552E:
	adds r1, r2, #0
	adds r1, #0x10
	cmp r1, #0
	beq .L080E553E
	ldr r0, [r4]
	str r0, [r2, #0x10]
	ldr r0, [r4, #4]
	str r0, [r1, #4]
.L080E553E:
	adds r4, r2, #0
	str r4, [r5, #8]
	ldr r1, [r6, #4]
	cmp r5, r1
	bne .L080E5550
	str r4, [r5, #4]
	ldr r0, [r6, #4]
	str r4, [r0, #0xc]
	b .L080E558C
.L080E5550:
	ldr r0, [r1, #8]
	cmp r5, r0
	bne .L080E558C
	str r4, [r1, #8]
	b .L080E558C
.L080E555A:
	movs r0, #0x18
	bl malloc
	adds r2, r0, #0
	cmp r2, #0
	bne .L080E556E
	movs r0, #0x18
	bl func_080D3BC0
	adds r2, r0, #0
.L080E556E:
	adds r1, r2, #0
	adds r1, #0x10
	cmp r1, #0
	beq .L080E557E
	ldr r0, [r4]
	str r0, [r2, #0x10]
	ldr r0, [r4, #4]
	str r0, [r1, #4]
.L080E557E:
	adds r4, r2, #0
	str r4, [r5, #0xc]
	ldr r1, [r6, #4]
	ldr r0, [r1, #0xc]
	cmp r5, r0
	bne .L080E558C
	str r4, [r1, #0xc]
.L080E558C:
	str r5, [r4, #4]
	movs r0, #0
	str r0, [r4, #8]
	str r0, [r4, #0xc]
	ldr r1, [r6, #4]
	adds r1, #4
	adds r0, r4, #0
	bl func_080E21E0
	ldr r0, [r6, #8]
	adds r0, #1
	str r0, [r6, #8]
	str r4, [r7]
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080E55B0
func_080E55B0: @ 0x080E55B0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	adds r6, r0, #0
	mov r8, r1
	adds r7, r2, #0
	ldr r4, [r1, #4]
	ldr r5, [r4, #4]
	movs r0, #1
	cmp r5, #0
	beq .L080E55E6
	ldr r2, [r7]
.L080E55CA:
	adds r4, r5, #0
	movs r1, #0
	ldr r0, [r4, #0x10]
	cmp r2, r0
	bhs .L080E55D6
	movs r1, #1
.L080E55D6:
	adds r0, r1, #0
	cmp r0, #0
	beq .L080E55E0
	ldr r5, [r4, #8]
	b .L080E55E2
.L080E55E0:
	ldr r5, [r4, #0xc]
.L080E55E2:
	cmp r5, #0
	bne .L080E55CA
.L080E55E6:
	str r4, [sp, #8]
	cmp r0, #0
	beq .L080E5620
	mov r1, r8
	ldr r0, [r1, #4]
	ldr r0, [r0, #8]
	str r0, [sp, #0xc]
	movs r1, #0
	cmp r4, r0
	bne .L080E55FC
	movs r1, #1
.L080E55FC:
	cmp r1, #0
	beq .L080E5618
	str r7, [sp]
	movs r0, #0
	str r0, [sp, #4]
	add r0, sp, #0x10
	mov r1, r8
	adds r2, r5, #0
	adds r3, r4, #0
	bl func_080E54F0
	movs r1, #1
	ldr r0, [sp, #0x10]
	b .L080E564A
.L080E5618:
	adds r0, r4, #0
	bl func_080E2354
	str r0, [sp, #8]
.L080E5620:
	ldr r2, [sp, #8]
	movs r3, #0
	ldr r1, [r2, #0x10]
	ldr r0, [r7]
	cmp r1, r0
	bhs .L080E562E
	movs r3, #1
.L080E562E:
	adds r0, r3, #0
	cmp r0, #0
	beq .L080E5650
	str r7, [sp]
	movs r0, #0
	str r0, [sp, #4]
	add r0, sp, #0xc
	mov r1, r8
	adds r2, r5, #0
	adds r3, r4, #0
	bl func_080E54F0
	movs r1, #1
	ldr r0, [sp, #0xc]
.L080E564A:
	str r0, [r6]
	strb r1, [r6, #4]
	b .L080E5654
.L080E5650:
	str r2, [r6]
	strb r0, [r6, #4]
.L080E5654:
	adds r0, r6, #0
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080E5664
func_080E5664: @ 0x080E5664
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x18
	adds r7, r0, #0
	adds r6, r1, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r1, [r6, #4]
	ldr r2, [r2]
	ldr r0, [r1, #8]
	cmp r2, r0
	bne .L080E56F4
	ldr r0, [r6, #8]
	cmp r0, #0
	bne .L080E5694
	add r0, sp, #8
	adds r1, r6, #0
	adds r2, r4, #0
	bl func_080E55B0
	ldr r0, [sp, #8]
	b .L080E5808
.L080E5694:
	movs r0, #0
	ldr r1, [r2, #0x10]
	adds r3, r2, #0
	ldr r2, [r4]
	cmp r2, r1
	bhs .L080E56A2
	movs r0, #1
.L080E56A2:
	mov sb, r0
	cmp r0, #0
	bne .L080E5768
	movs r0, #0
	cmp r1, r2
	bhs .L080E56B0
	movs r0, #1
.L080E56B0:
	cmp r0, #0
	bne .L080E56B8
	str r3, [r7]
	b .L080E580A
.L080E56B8:
	str r3, [sp, #8]
	adds r0, r3, #0
	bl func_080E2B28
	adds r2, r0, #0
	str r2, [sp, #8]
	ldr r0, [r6, #4]
	cmp r2, r0
	bne .L080E56D0
	mov r0, r8
	ldr r3, [r0]
	b .L080E57CE
.L080E56D0:
	movs r3, #0
	ldr r1, [r4]
	ldr r0, [r2, #0x10]
	adds r5, r2, #0
	cmp r1, r0
	bhs .L080E56DE
	movs r3, #1
.L080E56DE:
	cmp r3, #0
	bne .L080E56E4
	b .L080E57FC
.L080E56E4:
	mov r1, r8
	ldr r3, [r1]
	ldr r0, [r3, #0xc]
	cmp r0, #0
	beq .L080E57CE
	str r4, [sp]
	mov r0, sb
	b .L080E57E2
.L080E56F4:
	cmp r2, r1
	bne .L080E571E
	ldr r3, [r2, #0xc]
	movs r5, #0
	ldr r1, [r3, #0x10]
	ldr r0, [r4]
	cmp r1, r0
	bhs .L080E5706
	movs r5, #1
.L080E5706:
	cmp r5, #0
	beq .L080E5710
	str r4, [sp]
	str r2, [sp, #4]
	b .L080E57D2
.L080E5710:
	add r0, sp, #8
	adds r1, r6, #0
	adds r2, r4, #0
	bl func_080E55B0
	ldr r0, [sp, #8]
	b .L080E5808
.L080E571E:
	str r2, [sp, #8]
	adds r0, r2, #0
	bl func_080E2354
	adds r2, r0, #0
	str r2, [sp, #8]
	mov r1, r8
	ldr r3, [r1]
	movs r5, #0
	ldr r1, [r4]
	ldr r0, [r3, #0x10]
	cmp r1, r0
	bhs .L080E573A
	movs r5, #1
.L080E573A:
	mov sb, r5
	cmp r5, #0
	beq .L080E577A
	movs r0, #0
	mov ip, r0
	ldr r0, [r2, #0x10]
	adds r5, r2, #0
	cmp r0, r1
	bhs .L080E5750
	movs r1, #1
	mov ip, r1
.L080E5750:
	mov r0, ip
	cmp r0, #0
	beq .L080E577A
	ldr r0, [r5, #0xc]
	cmp r0, #0
	bne .L080E5768
	str r4, [sp]
	str r5, [sp, #4]
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0
	b .L080E57EA
.L080E5768:
	str r4, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r3, #0
	bl func_080E54F0
	b .L080E580A
.L080E577A:
	mov r1, r8
	ldr r0, [r1]
	str r0, [sp, #0xc]
	bl func_080E2B28
	mov ip, r0
	str r0, [sp, #0xc]
	movs r0, #1
	mov r1, sb
	eors r1, r0
	mov r0, sb
	cmp r0, #0
	bne .L080E57F2
	mov r1, r8
	ldr r0, [r1]
	movs r5, #0
	ldr r1, [r0, #0x10]
	adds r3, r0, #0
	ldr r2, [r4]
	cmp r1, r2
	bhs .L080E57A6
	movs r5, #1
.L080E57A6:
	adds r1, r5, #0
	cmp r1, #0
	beq .L080E57F2
	ldr r0, [r6, #4]
	mov r5, ip
	cmp r5, r0
	beq .L080E57C8
	movs r0, #0
	mov ip, r0
	ldr r0, [r5, #0x10]
	cmp r2, r0
	bhs .L080E57C2
	movs r0, #1
	mov ip, r0
.L080E57C2:
	mov r0, ip
	cmp r0, #0
	beq .L080E57F2
.L080E57C8:
	ldr r0, [r3, #0xc]
	cmp r0, #0
	bne .L080E57DE
.L080E57CE:
	str r4, [sp]
	str r3, [sp, #4]
.L080E57D2:
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0
	bl func_080E54F0
	b .L080E580A
.L080E57DE:
	str r4, [sp]
	movs r0, #0
.L080E57E2:
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
.L080E57EA:
	adds r3, r5, #0
	bl func_080E54F0
	b .L080E580A
.L080E57F2:
	cmp sb, r1
	bne .L080E57FC
	mov r1, r8
	ldr r0, [r1]
	b .L080E5808
.L080E57FC:
	add r0, sp, #0x10
	adds r1, r6, #0
	adds r2, r4, #0
	bl func_080E55B0
	ldr r0, [sp, #0x10]
.L080E5808:
	str r0, [r7]
.L080E580A:
	adds r0, r7, #0
	add sp, #0x18
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_080E581C
func_080E581C: @ 0x080E581C
	push {lr}
	adds r3, r0, #0
	ldr r0, .L080E583C @ =vtable_unk_080E8594
	str r0, [r3, #4]
	ldr r2, .L080E5840 @ =gUnk_03000414
	ldr r0, [r3]
	str r0, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L080E5838
	adds r0, r3, #0
	bl __builtin_delete
.L080E5838:
	pop {r0}
	bx r0
	.align 2, 0
.L080E583C: .4byte vtable_unk_080E8594
.L080E5840: .4byte gUnk_03000414

	thumb_func_start func_080E5844
func_080E5844: @ 0x080E5844
	push {lr}
	adds r3, r0, #0
	ldr r0, .L080E5864 @ =vtable_unk_080E8594
	str r0, [r3, #4]
	ldr r2, .L080E5868 @ =gUnk_03000414
	ldr r0, [r3]
	str r0, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L080E5860
	adds r0, r3, #0
	bl __builtin_delete
.L080E5860:
	pop {r0}
	bx r0
	.align 2, 0
.L080E5864: .4byte vtable_unk_080E8594
.L080E5868: .4byte gUnk_03000414

	thumb_func_start func_080E586C
func_080E586C: @ 0x080E586C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #4]
	ldr r4, [r0]
	cmp r4, r0
	beq .L080E588A
.L080E5878:
	adds r0, r4, #0
	ldr r4, [r4]
	cmp r0, #0
	beq .L080E5884
	bl free
.L080E5884:
	ldr r0, [r5, #4]
	cmp r4, r0
	bne .L080E5878
.L080E588A:
	ldr r0, [r5, #4]
	str r0, [r0]
	str r0, [r0, #4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_080E5898
func_080E5898: @ 0x080E5898
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	mov r8, r1
	movs r0, #0x84
	lsls r0, r0, #2
	adds r1, r5, r0
	ldr r0, .L080E5968 @ =vtable_unk_080E85AC
	str r0, [r1]
	movs r1, #0xbb
	lsls r1, r1, #2
	adds r0, r5, r1
	cmp r0, #0
	beq .L080E58DA
	adds r1, #0x40
	adds r4, r5, r1
	cmp r0, r4
	beq .L080E58DA
	movs r0, #0xbb
	lsls r0, r0, #2
	adds r6, r5, r0
.L080E58C4:
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	cmp r6, r4
	bne .L080E58C4
.L080E58DA:
	movs r1, #0xab
	lsls r1, r1, #2
	adds r0, r5, r1
	subs r1, #0x94
	adds r7, r5, r1
	cmp r0, #0
	beq .L080E590C
	adds r1, #0xd4
	adds r4, r5, r1
	cmp r0, r4
	beq .L080E590C
	movs r0, #0xab
	lsls r0, r0, #2
	adds r6, r5, r0
.L080E58F6:
	subs r4, #8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	cmp r6, r4
	bne .L080E58F6
.L080E590C:
	movs r1, #0xa9
	lsls r1, r1, #2
	adds r4, r5, r1
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_080073E0
	adds r0, r4, #0
	movs r1, #2
	bl func_08007184
	movs r0, #0xa7
	lsls r0, r0, #2
	adds r4, r5, r0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl func_08007C28
	adds r0, r4, #0
	movs r1, #2
	bl func_080079E8
	movs r1, #0x85
	lsls r1, r1, #2
	adds r2, r5, r1
	ldr r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, #4
	adds r2, r2, r0
	adds r0, r7, #0
	cmp r0, r2
	beq .L080E5956
.L080E5950:
	adds r0, #0xc
	cmp r0, r2
	bne .L080E5950
.L080E5956:
	adds r0, r5, #0
	mov r1, r8
	bl func_080CADF0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080E5968: .4byte vtable_unk_080E85AC

	thumb_func_start func_080E596C
func_080E596C: @ 0x080E596C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, #0x80
	movs r1, #2
	bl func_08050D0C
	ldr r1, [r4, #0x7c]
	cmp r1, #0
	beq .L080E5992
	movs r2, #0x84
	lsls r2, r2, #2
	adds r0, r1, r2
	ldr r0, [r0]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E5992:
	ldr r1, [r4, #0x78]
	cmp r1, #0
	beq .L080E59AA
	movs r2, #0x84
	lsls r2, r2, #2
	adds r0, r1, r2
	ldr r0, [r0]
	ldr r2, [r0, #8]
	adds r0, r1, #0
	movs r1, #3
	bl _call_via_r2
.L080E59AA:
	ldr r0, .L080E59BC @ =vtable_unk_080E5A28
	str r0, [r4, #0x10]
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_080086BC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080E59BC: .4byte vtable_unk_080E5A28

	thumb_func_start func_080E59C0
func_080E59C0: @ 0x080E59C0
	push {lr}
	bl func_080A4B6C
	pop {r0}
	bx r0
.align 2, 0
