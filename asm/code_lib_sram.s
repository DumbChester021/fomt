	.INCLUDE "asm/macro.inc"
	.SYNTAX UNIFIED


	thumb_func_start func_080D379C
func_080D379C: @ 0x080D379C
	push {r4, r5, r6, lr}
	sub sp, #0x80
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r2, .L080D37C8 @ =0x04000204
	ldrh r0, [r2]
	ldr r1, .L080D37CC @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	ldr r3, .L080D37D0 @ =func_080D3778
	movs r0, #1
	bics r3, r0
	mov r2, sp
	ldr r0, .L080D37D4 @ =func_080D379C
	ldr r1, .L080D37D0 @ =func_080D3778
	subs r0, r0, r1
	lsls r0, r0, #0xf
	b .L080D37E4
	.align 2, 0
.L080D37C8: .4byte 0x04000204
.L080D37CC: .4byte 0x0000FFFC
.L080D37D0: .4byte func_080D3778
.L080D37D4: .4byte func_080D379C
.L080D37D8:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r0, r1, #1
	lsls r0, r0, #0x10
.L080D37E4:
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne .L080D37D8
	mov r3, sp
	adds r3, #1
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl _call_via_r3
	add sp, #0x80
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start func_080D3800
func_080D3800: @ 0x080D3800
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r3, r2, #0
	ldr r2, .L080D3838 @ =0x04000204
	ldrh r0, [r2]
	ldr r1, .L080D383C @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	subs r3, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	beq .L080D3830
	adds r1, r0, #0
.L080D3822:
	ldrb r0, [r5]
	strb r0, [r4]
	adds r5, #1
	adds r4, #1
	subs r3, #1
	cmp r3, r1
	bne .L080D3822
.L080D3830:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080D3838: .4byte 0x04000204
.L080D383C: .4byte 0x0000FFFC

    .section .text.after_sram_byte_compare, "ax", %progbits
	thumb_func_start func_080D3870
func_080D3870: @ 0x080D3870
	push {r4, r5, r6, lr}
	sub sp, #0xc0
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r2, .L080D389C @ =0x04000204
	ldrh r0, [r2]
	ldr r1, .L080D38A0 @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	ldr r3, .L080D38A4 @ =func_080D3840
	movs r0, #1
	bics r3, r0
	mov r2, sp
	ldr r0, .L080D38A8 @ =func_080D3870
	ldr r1, .L080D38A4 @ =func_080D3840
	subs r0, r0, r1
	lsls r0, r0, #0xf
	b .L080D38B8
	.align 2, 0
.L080D389C: .4byte 0x04000204
.L080D38A0: .4byte 0x0000FFFC
.L080D38A4: .4byte func_080D3840
.L080D38A8: .4byte func_080D3870
.L080D38AC:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r0, r1, #1
	lsls r0, r0, #0x10
.L080D38B8:
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne .L080D38AC
	mov r3, sp
	adds r3, #1
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl _call_via_r3
	add sp, #0xc0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
