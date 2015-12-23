	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"myLib.c"
	.text
	.align	2
	.global	setPixel3
	.type	setPixel3, %function
setPixel3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L2
	rsb	r0, r0, r0, asl #4
	add	r1, r1, r0, asl #4
	ldr	r3, [r3]
	mov	r1, r1, asl #1
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L3:
	.align	2
.L2:
	.word	.LANCHOR0
	.size	setPixel3, .-setPixel3
	.align	2
	.global	drawRect3
	.type	drawRect3, %function
drawRect3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #0
	bxle	lr
	stmfd	sp!, {r4, lr}
	ldr	r4, .L12
	add	r2, r2, r0
	rsb	r2, r2, r2, asl #4
	rsb	r0, r0, r0, asl #4
	ldr	ip, [r4]
	add	lr, r1, r2, asl #4
	sub	sp, sp, #8
	add	r1, r1, r0, asl #4
	ldr	r2, [r4, #4]
	orr	r3, r3, #-2130706432
	add	lr, ip, lr, asl #1
	add	r1, ip, r1, asl #1
	add	r0, sp, #6
.L6:
	str	r0, [r2, #36]
	str	r1, [r2, #40]
	add	r1, r1, #480
	cmp	r1, lr
	str	r3, [r2, #44]
	bne	.L6
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	.LANCHOR0
	.size	drawRect3, .-drawRect3
	.align	2
	.global	drawImage3
	.type	drawImage3, %function
drawImage3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	cmp	r3, #0
	ldr	r4, [sp, #12]
	ble	.L14
	ldr	r5, .L20
	add	r3, r3, r1
	ldr	ip, [r5]
	rsb	r3, r3, r3, asl #4
	rsb	r1, r1, r1, asl #4
	add	lr, r2, r3, asl #4
	add	r2, r2, r1, asl #4
	ldr	r3, [r5, #4]
	add	lr, ip, lr, asl #1
	add	r2, ip, r2, asl #1
	mov	r1, r4, asl #1
	orr	ip, r4, #-2147483648
.L16:
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	add	r2, r2, #480
	cmp	r2, lr
	str	ip, [r3, #44]
	add	r0, r0, r1
	bne	.L16
.L14:
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	.LANCHOR0
	.size	drawImage3, .-drawImage3
	.align	2
	.global	fillScreen3
	.type	fillScreen3, %function
fillScreen3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L24
	sub	sp, sp, #8
	ldmia	r2, {r2, r3}
	ldr	r1, .L24+4
	add	r0, sp, #6
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L25:
	.align	2
.L24:
	.word	.LANCHOR0
	.word	-2130668032
	.size	fillScreen3, .-fillScreen3
	.align	2
	.global	setPixel4
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, .L29
	add	r3, r1, r1, lsr #31
	mov	r3, r3, asr #1
	rsb	r0, r0, r0, asl #4
	ldr	ip, [ip]
	add	r0, r3, r0, asl #3
	mov	r0, r0, asl #1
	ldrh	r3, [ip, r0]
	tst	r1, #1
	biceq	r3, r3, #255
	andne	r3, r3, #255
	orreq	r3, r3, r2
	orrne	r2, r3, r2, asl #8
	streqh	r3, [ip, r0]	@ movhi
	strneh	r2, [ip, r0]	@ movhi
	bx	lr
.L30:
	.align	2
.L29:
	.word	.LANCHOR0
	.size	setPixel4, .-setPixel4
	.align	2
	.global	drawRect4
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #36
	ldrb	ip, [sp, #72]	@ zero_extendqisi2
	cmp	r2, #0
	str	ip, [sp, #8]
	orr	ip, ip, ip, asl #8
	strh	ip, [sp, #30]	@ movhi
	ble	.L31
	mov	ip, r1
	mov	r4, r0
	str	r1, [sp, #12]
	add	r1, r1, #1
	add	r10, r3, r3, lsr #31
	add	r1, r1, r1, lsr #31
	mov	r1, r1, asr #1
	mov	r10, r10, asr #1
	rsb	r5, r4, r4, asl #4
	add	r7, ip, ip, lsr #31
	mov	r0, r3, lsr #31
	add	r5, r1, r5, asl #3
	rsb	r7, r1, r7, asr #1
	sub	r1, r10, #1
	add	r9, r3, r0
	add	r8, r4, r2
	add	r3, ip, r3
	orr	r2, r1, #-2130706432
	and	r9, r9, #1
	str	r2, [sp, #20]
	sub	r3, r3, #1
	orr	r2, r10, #-2130706432
	ldr	r6, .L42
	mov	r5, r5, asl #1
	mov	r7, r7, asl #1
	str	r2, [sp, #4]
	rsb	r9, r0, r9
	str	r3, [sp, #16]
	and	r10, ip, #1
	add	fp, sp, #30
	b	.L36
.L41:
	ldmia	r6, {r1, r2}
	ldr	r3, [sp, #4]
	add	r1, r1, r0
	cmp	r9, #1
	str	fp, [r2, #36]
	str	r1, [r2, #40]
	str	r3, [r2, #44]
	beq	.L40
.L34:
	add	r4, r4, #1
	cmp	r4, r8
	add	r5, r5, #240
	beq	.L31
.L36:
	cmp	r10, #0
	add	r0, r5, r7
	beq	.L41
	ldr	r1, [sp, #12]
	ldr	r2, [sp, #8]
	mov	r0, r4
	bl	setPixel4
	ldmia	r6, {r1, r2}
	cmp	r9, #1
	add	r1, r1, r5
	str	fp, [r2, #36]
	bne	.L35
	ldr	r3, [sp, #4]
	add	r4, r4, #1
	cmp	r4, r8
	str	r1, [r2, #40]
	add	r5, r5, #240
	str	r3, [r2, #44]
	bne	.L36
.L31:
	add	sp, sp, #36
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L35:
	str	r1, [r2, #40]
	add	r1, sp, #16
	ldmia	r1, {r1, r3}
	mov	r0, r4
	str	r3, [r2, #44]
	ldr	r2, [sp, #8]
	bl	setPixel4
	b	.L34
.L40:
	mov	r0, r4
	ldr	r1, [sp, #16]
	ldr	r2, [sp, #8]
	bl	setPixel4
	b	.L34
.L43:
	.align	2
.L42:
	.word	.LANCHOR0
	.size	drawRect4, .-drawRect4
	.align	2
	.global	fillScreen4
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
	ldr	r1, .L46
	add	r2, sp, #8
	orr	r0, r0, r0, asl #8
	strh	r0, [r2, #-2]!	@ movhi
	ldmia	r1, {r0, r3}
	ldr	r1, .L46+4
	str	r2, [r3, #36]
	str	r0, [r3, #40]
	str	r1, [r3, #44]
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L47:
	.align	2
.L46:
	.word	.LANCHOR0
	.word	-2130687232
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	drawBackgroundImage4
	.type	drawBackgroundImage4, %function
drawBackgroundImage4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L49
	ldr	r1, .L49+4
	ldmia	r2, {r2, r3}
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	bx	lr
.L50:
	.align	2
.L49:
	.word	.LANCHOR0
	.word	-2147464448
	.size	drawBackgroundImage4, .-drawBackgroundImage4
	.align	2
	.global	drawImage4
	.type	drawImage4, %function
drawImage4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	tst	r2, #1
	stmfd	sp!, {r4, r5, lr}
	addne	r2, r2, #1
	cmp	r3, #0
	ldr	ip, [sp, #12]
	ble	.L51
	ldr	r5, .L61
	add	r3, r3, r1
	add	r2, r2, r2, lsr #31
	ldr	r4, [r5]
	mov	r2, r2, asr #1
	rsb	r3, r3, r3, asl #4
	rsb	r1, r1, r1, asl #4
	add	ip, ip, ip, lsr #31
	add	lr, r2, r3, asl #3
	mov	ip, ip, asr #1
	add	r2, r2, r1, asl #3
	ldr	r1, [r5, #4]
	add	r3, r4, r2, asl #1
	add	lr, r4, lr, asl #1
	mov	r2, ip, asl #1
	orr	r4, ip, #-2147483648
.L54:
	str	r0, [r1, #36]
	str	r3, [r1, #40]
	add	r3, r3, #240
	cmp	r3, lr
	str	r4, [r1, #44]
	add	r0, r0, r2
	bne	.L54
.L51:
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L62:
	.align	2
.L61:
	.word	.LANCHOR0
	.size	drawImage4, .-drawImage4
	.align	2
	.global	loadPalette
	.type	loadPalette, %function
loadPalette:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #83886080
	ldr	r3, .L64
	ldr	r2, .L64+4
	ldr	r3, [r3, #4]
	str	r0, [r3, #36]
	str	r1, [r3, #40]
	str	r2, [r3, #44]
	bx	lr
.L65:
	.align	2
.L64:
	.word	.LANCHOR0
	.word	-2147483392
	.size	loadPalette, .-loadPalette
	.align	2
	.global	DMANow
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L68
	str	lr, [sp, #-4]!
	add	r0, r0, r0, asl #1
	ldr	lr, [ip, #4]
	mov	r0, r0, asl #2
	add	ip, lr, r0
	orr	r3, r3, #-2147483648
	str	r1, [lr, r0]
	str	r2, [ip, #4]
	ldr	lr, [sp], #4
	str	r3, [ip, #8]
	bx	lr
.L69:
	.align	2
.L68:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.align	2
	.global	waitForVblank
	.type	waitForVblank, %function
waitForVblank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L71:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L71
	mov	r2, #67108864
.L73:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L73
	bx	lr
	.size	waitForVblank, .-waitForVblank
	.align	2
	.global	flipPage
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	ldrh	r3, [r2]
	ldr	r1, .L79
	tst	r3, #16
	ldrne	r0, [r1, #8]
	ldreq	r0, [r1, #12]
	bicne	r3, r3, #16
	orreq	r3, r3, #16
	strh	r3, [r2]	@ movhi
	str	r0, [r1]
	bx	lr
.L80:
	.align	2
.L79:
	.word	.LANCHOR0
	.size	flipPage, .-flipPage
	.align	2
	.global	setupSounds
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r0, #128
	mov	r1, #0
	ldr	r2, .L82
	strh	r0, [r3, #132]	@ movhi
	strh	r1, [r3, #128]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	bx	lr
.L83:
	.align	2
.L82:
	.word	-1266
	.size	setupSounds, .-setupSounds
	.global	__aeabi_idiv
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
	.align	2
	.global	playSoundA
	.type	playSoundA, %function
playSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r5, r2
	mov	r7, r0
	mov	r2, #0
	ldr	r3, .L86+8
	ldr	lr, .L86+12
	ldr	r3, [r3, #4]
	ldr	r6, .L86+16
	ldr	ip, .L86+20
	ldr	r0, .L86+24
	str	r2, [lr]
	str	r2, [r3, #20]
	mov	r8, r1
	str	r7, [r3, #12]
	mov	r1, r5
	str	ip, [r3, #16]
	str	r0, [r3, #20]
	ldr	ip, .L86+28
	strh	r2, [r6, #2]	@ movhi
	mov	r0, #16777216
	mov	lr, pc
	bx	ip
	mov	r2, #1
	mov	r1, #128
	rsb	r0, r0, #0
	ldr	r4, .L86+32
	mov	r3, r0, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [r6]	@ movhi
	mov	r0, r8
	strh	r1, [r6, #2]	@ movhi
	ldr	r6, .L86+36
	stmia	r4, {r7, r8}
	str	r2, [r4, #12]
	str	r5, [r4, #8]
	mov	lr, pc
	bx	r6
	adr	r3, .L86
	ldmia	r3, {r2-r3}
	ldr	ip, .L86+40
	mov	lr, pc
	bx	ip
	mov	r8, r0
	mov	r0, r5
	mov	r9, r1
	mov	lr, pc
	bx	r6
	ldr	ip, .L86+44
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	ip
	ldr	r3, .L86+48
	mov	lr, pc
	bx	r3
	str	r0, [r4, #20]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L87:
	.align	3
.L86:
	.word	1443109011
	.word	1078844686
	.word	.LANCHOR0
	.word	vbCountA
	.word	67109120
	.word	67109024
	.word	-1237319680
	.word	__aeabi_idiv
	.word	soundA
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundA, .-playSoundA
	.align	2
	.global	playSoundB
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r5, r2
	mov	r7, r0
	mov	r2, #0
	ldr	r3, .L90+8
	ldr	lr, .L90+12
	ldr	r3, [r3, #4]
	ldr	r6, .L90+16
	ldr	ip, .L90+20
	ldr	r0, .L90+24
	str	r2, [lr]
	str	r2, [r3, #32]
	mov	r8, r1
	str	r7, [r3, #24]
	mov	r1, r5
	str	ip, [r3, #28]
	str	r0, [r3, #32]
	ldr	ip, .L90+28
	strh	r2, [r6, #6]	@ movhi
	mov	r0, #16777216
	mov	lr, pc
	bx	ip
	mov	r2, #1
	mov	r1, #128
	rsb	r0, r0, #0
	ldr	r4, .L90+32
	mov	r3, r0, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [r6, #4]	@ movhi
	mov	r0, r8
	strh	r1, [r6, #6]	@ movhi
	ldr	r6, .L90+36
	stmia	r4, {r7, r8}
	str	r2, [r4, #12]
	str	r5, [r4, #8]
	mov	lr, pc
	bx	r6
	adr	r3, .L90
	ldmia	r3, {r2-r3}
	ldr	ip, .L90+40
	mov	lr, pc
	bx	ip
	mov	r8, r0
	mov	r0, r5
	mov	r9, r1
	mov	lr, pc
	bx	r6
	ldr	ip, .L90+44
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	ip
	ldr	r3, .L90+48
	mov	lr, pc
	bx	r3
	str	r0, [r4, #20]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L91:
	.align	3
.L90:
	.word	1443109011
	.word	1078844686
	.word	.LANCHOR0
	.word	vbCountB
	.word	67109120
	.word	67109028
	.word	-1237319680
	.word	__aeabi_idiv
	.word	soundB
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundB, .-playSoundB
	.align	2
	.global	interruptHandler
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r3, .L110
	ldrh	r1, [r3, #2]
	tst	r1, #1
	strh	r2, [r3, #8]	@ movhi
	beq	.L93
	ldr	r2, .L110+4
	ldr	r3, [r2, #12]
	cmp	r3, #0
	ldrne	r1, .L110+8
	ldrne	r3, [r1]
	ldr	r5, .L110+12
	addne	r3, r3, #1
	ldreq	r3, .L110+8
	strne	r3, [r1]
	ldr	r1, [r5, #12]
	ldr	r4, .L110+16
	ldreq	r3, [r3]
	cmp	r1, #0
	ldrne	r1, [r4]
	ldr	r2, [r2, #20]
	addne	r1, r1, #1
	strne	r1, [r4]
	cmp	r2, r3
	ldr	r3, .L110+4
	bge	.L97
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L108
	ldr	r0, .L110+20
	ldr	r1, .L110+24
	ldr	r0, [r0, #4]
	str	r2, [r3, #12]
	str	r2, [r0, #20]
	strh	r2, [r1, #2]	@ movhi
.L97:
	ldr	r3, [r4]
	ldr	r2, [r5, #20]
	cmp	r2, r3
	ldr	r3, .L110+12
	bge	.L99
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L109
	ldr	r0, .L110+20
	ldr	r1, .L110+24
	ldr	r0, [r0, #4]
	str	r2, [r3, #12]
	str	r2, [r0, #32]
	strh	r2, [r1, #6]	@ movhi
.L99:
	mov	r2, #1
	ldr	r3, .L110
	strh	r2, [r3, #2]	@ movhi
.L93:
	mov	r2, #1
	ldr	r3, .L110
	strh	r2, [r3, #8]	@ movhi
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L109:
	ldmia	r3, {r0, r1, r2}
	bl	playSoundB
	b	.L99
.L108:
	ldmia	r3, {r0, r1, r2}
	bl	playSoundA
	b	.L97
.L111:
	.align	2
.L110:
	.word	67109376
	.word	soundA
	.word	vbCountA
	.word	soundB
	.word	vbCountB
	.word	.LANCHOR0
	.word	67109120
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	muteSound
	.type	muteSound, %function
muteSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #67108864
	mov	r2, #0
	str	lr, [sp, #-4]!
	ldr	r3, .L114
	ldrh	lr, [r1, #132]
	ldr	ip, .L114+4
	ldr	r0, .L114+8
	and	r3, r3, lr
	strh	r3, [r1, #132]	@ movhi
	ldr	lr, [sp], #4
	str	r2, [ip, #12]
	str	r2, [r0, #12]
	bx	lr
.L115:
	.align	2
.L114:
	.word	65407
	.word	soundA
	.word	soundB
	.size	muteSound, .-muteSound
	.align	2
	.global	unmuteSound
	.type	unmuteSound, %function
unmuteSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #67108864
	mov	r2, #1
	ldrh	r3, [r1, #132]
	ldr	ip, .L117
	ldr	r0, .L117+4
	orr	r3, r3, #128
	strh	r3, [r1, #132]	@ movhi
	str	r2, [ip, #12]
	str	r2, [r0, #12]
	bx	lr
.L118:
	.align	2
.L117:
	.word	soundA
	.word	soundB
	.size	unmuteSound, .-unmuteSound
	.align	2
	.global	pauseSound
	.type	pauseSound, %function
pauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	ldr	r3, .L121
	ldr	r2, .L121+4
	ldrh	r0, [r3, #2]
	and	r2, r2, r0
	str	lr, [sp, #-4]!
	strh	r2, [r3, #2]	@ movhi
	ldr	r2, .L121+4
	ldrh	lr, [r3, #6]
	ldr	ip, .L121+8
	ldr	r0, .L121+12
	and	r2, r2, lr
	strh	r2, [r3, #6]	@ movhi
	ldr	lr, [sp], #4
	str	r1, [ip, #12]
	str	r1, [r0, #12]
	bx	lr
.L122:
	.align	2
.L121:
	.word	67109120
	.word	65407
	.word	soundA
	.word	soundB
	.size	pauseSound, .-pauseSound
	.align	2
	.global	unpauseSound
	.type	unpauseSound, %function
unpauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #1
	ldr	r3, .L124
	ldrh	r2, [r3, #2]
	orr	r2, r2, #128
	strh	r2, [r3, #2]	@ movhi
	ldrh	r2, [r3, #6]
	ldr	ip, .L124+4
	ldr	r0, .L124+8
	orr	r2, r2, #128
	strh	r2, [r3, #6]	@ movhi
	str	r1, [ip, #12]
	str	r1, [r0, #12]
	bx	lr
.L125:
	.align	2
.L124:
	.word	67109120
	.word	soundA
	.word	soundB
	.size	unpauseSound, .-unpauseSound
	.align	2
	.global	stopSound
	.type	stopSound, %function
stopSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r1, .L127
	ldr	r2, .L127+4
	ldr	r1, [r1, #4]
	ldr	ip, .L127+8
	ldr	r0, .L127+12
	str	r3, [r1, #20]
	str	r3, [ip, #12]
	strh	r3, [r2, #2]	@ movhi
	str	r3, [r0, #12]
	str	r3, [r1, #32]
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L128:
	.align	2
.L127:
	.word	.LANCHOR0
	.word	67109120
	.word	soundA
	.word	soundB
	.size	stopSound, .-stopSound
	.align	2
	.global	setupInterrupts
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #67108864
	stmfd	sp!, {r4, lr}
	mov	r4, #1
	ldr	r3, .L131
	ldrh	r1, [r0, #4]
	ldrh	r2, [r3]
	ldr	lr, .L131+4
	ldr	ip, .L131+8
	orr	r2, r2, r4
	orr	r1, r1, #8
	strh	r1, [r0, #4]	@ movhi
	strh	r4, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	str	lr, [ip, #4092]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L132:
	.align	2
.L131:
	.word	67109376
	.word	interruptHandler
	.word	50360320
	.size	setupInterrupts, .-setupInterrupts
	.global	dma
	.global	backBuffer
	.global	frontBuffer
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.type	backBuffer, %object
	.size	backBuffer, 4
backBuffer:
	.word	100704256
	.type	frontBuffer, %object
	.size	frontBuffer, 4
frontBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 43) 4.9.2"
