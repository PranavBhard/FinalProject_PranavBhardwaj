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
	.file	"main.c"
	.text
	.align	2
	.global	initGameHelp
	.type	initGameHelp, %function
initGameHelp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #0
	mov	r0, #32
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r3, #1
	mov	r4, #74
	mov	lr, #3
	mov	r9, ip
	mov	r10, r0
	ldr	r6, .L10
	ldr	r8, .L10+4
	str	r4, [r6]
	ldr	r7, .L10+8
	str	ip, [r6, #32]
	str	ip, [r6, #44]
	str	lr, [r6, #36]
	str	r0, [r6, #24]
	str	r0, [r6, #28]
	str	r3, [r6, #16]
	str	r3, [r6, #20]
	str	r3, [r6, #4]
	ldr	fp, .L10+12
	ldr	r4, .L10+16
	ldr	r5, .L10+20
.L4:
	str	r10, [fp, #24]
	str	r10, [fp, #28]
	mov	lr, pc
	bx	r4
	mov	ip, r0, asr #31
	mov	ip, ip, lsr #23
	add	r0, r0, ip
	mov	r0, r0, asl #23
	rsb	r0, ip, r0, lsr #23
	str	r0, [fp, #8]
	mov	lr, pc
	bx	r4
	mov	r3, #0
	mov	ip, r0, asr #31
	mov	ip, ip, lsr #23
	add	r0, r0, ip
	mov	r0, r0, asl #23
	rsb	r0, ip, r0, lsr #23
	and	ip, r9, #1
	str	r3, [fp, #32]
	str	ip, [fp, #44]
	str	r0, [fp, #12]
	mov	lr, pc
	bx	r4
	add	ip, r0, r0, lsr #31
	and	ip, ip, #1
	sub	r0, ip, r0, lsr #31
	ldr	r0, [r5, r0, asl #2]
	str	r0, [r8]
	mov	lr, pc
	bx	r4
	mov	ip, r0, asr #31
	mov	ip, ip, lsr #30
	add	r0, r0, ip
	and	r0, r0, #3
	ldr	r3, .L10+4
	rsb	r0, ip, r0
	ldr	ip, [fp, #44]
	add	r0, r5, r0, asl #2
	cmp	ip, #0
	ldr	r0, [r0, #8]
	ldr	ip, [r3]
	str	r0, [r7]
	moveq	r0, ip
	ldreq	r3, .L10+8
	add	r9, r9, #1
	streq	ip, [r3]
	cmp	r9, #7
	str	r0, [fp, #20]
	str	ip, [fp, #16]
	add	fp, fp, #48
	bne	.L4
	mov	r3, #32
	ldr	r9, .L10+24
	str	r3, [r9, #24]
	str	r3, [r9, #28]
	mov	lr, pc
	bx	r4
	mov	r3, r0, asr #31
	mov	r3, r3, lsr #23
	add	r2, r0, r3
	mov	r2, r2, asl #23
	rsb	r3, r3, r2, lsr #23
	str	r3, [r9, #8]
	mov	lr, pc
	bx	r4
	mov	r1, #8
	mov	r3, r0, asr #31
	mov	r2, r3, lsr #23
	add	r3, r0, r2
	mov	r3, r3, asl #23
	rsb	r3, r2, r3, lsr #23
	str	r1, [r9, #44]
	str	r3, [r9, #12]
	ldr	r8, .L10+28
	ldr	r7, .L10+32
	ldr	r5, .L10+36
	b	.L5
.L6:
	mov	lr, pc
	bx	r4
	mov	r3, r0, asr #31
	mov	r3, r3, lsr #23
	add	r0, r0, r3
	mov	r0, r0, asl #23
	rsb	r3, r3, r0, lsr #23
	str	r3, [r9, #8]
	mov	lr, pc
	bx	r4
	mov	r2, r0, asr #31
	mov	r2, r2, lsr #23
	add	r0, r0, r2
	mov	r0, r0, asl #23
	rsb	r3, r2, r0, lsr #23
	str	r3, [r9, #12]
.L5:
	ldr	r2, [r6, #24]
	ldr	r1, [r9, #8]
	add	r2, r2, r2, lsr #31
	mov	r2, r2, asr #1
	add	r0, r1, r2
	add	r2, r2, r3
	sub	r10, r3, #113
	sub	lr, r3, #32
	add	r3, r2, r0, asl #9
	add	r3, r3, r3, lsr #31
	bic	r3, r3, #1
	ldrh	r3, [r8, r3]
	cmp	r3, r7
	sub	ip, r1, #32
	sub	r1, r1, #113
	beq	.L6
	cmp	r1, r5
	bls	.L6
	cmp	ip, #448
	movls	ip, #0
	movhi	ip, #1
	cmp	r10, r5
	movhi	r10, ip
	orrls	r10, ip, #1
	cmp	lr, #448
	movls	lr, r10
	orrhi	lr, r10, #1
	cmp	lr, #0
	bne	.L6
	ldr	r3, .L10+40
	ldr	r2, .L10+44
	str	lr, [r3]
	str	lr, [r2]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	player
	.word	fbrdel
	.word	fbcdel
	.word	fireballs
	.word	rand
	.word	.LANCHOR0
	.word	key
	.word	collMapBitmap
	.word	771
	.word	286
	.word	cheat
	.word	gotKey
	.size	initGameHelp, .-initGameHelp
	.align	2
	.global	initGame
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r1, #4864
	ldr	r2, .L16
	ldr	r0, .L16+4
	stmfd	sp!, {r4, lr}
	strh	r0, [r3, #8]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	ldr	r0, .L16+8
	ldr	r3, .L16+12
	ldr	r4, .L16+16
	mov	lr, pc
	bx	r3
	mov	r0, #3
	ldr	r1, .L16+20
	mov	r2, #100663296
	mov	r3, #2944
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L16+24
	ldr	r2, .L16+28
	mov	r3, #8192
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L16+32
	ldr	r2, .L16+36
	mov	r3, #256
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L16+40
	ldr	r2, .L16+44
	mov	r3, #2048
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L16+48
	ldr	r2, .L16+52
	mov	r3, #32768
	mov	lr, pc
	bx	r4
	ldr	r1, .L16+56
	ldr	r2, .L16+60
	mov	r3, #256
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #0
	mov	r1, #512
	ldr	r2, .L16+64
.L13:
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L13
	bl	initGameHelp
	mov	r1, #0
	mov	r2, #96
	ldr	r3, .L16+68
	ldmfd	sp!, {r4, lr}
	stmia	r3, {r1, r2}
	bx	lr
.L17:
	.align	2
.L16:
	.word	6276
	.word	-9344
	.word	backgroundPal
	.word	loadPalette
	.word	DMANow
	.word	backgroundTiles
	.word	backgroundMap
	.word	100718592
	.word	bg2Tiles
	.word	100679680
	.word	bg2Map
	.word	100712448
	.word	characterTiles
	.word	100728832
	.word	characterPal
	.word	83886592
	.word	shadowOAM
	.word	.LANCHOR1
	.size	initGame, .-initGame
	.align	2
	.global	start
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	r0, #0
	ldr	r3, .L25
	ldr	r4, .L25+4
	mov	lr, pc
	bx	r3
	mov	r0, #10
	mov	r1, #100
	ldr	r2, .L25+8
	mov	r3, #4
	mov	lr, pc
	bx	r4
	mov	r0, #30
	mov	r1, #15
	ldr	r2, .L25+12
	mov	r3, #4
	mov	lr, pc
	bx	r4
	mov	r0, #50
	mov	r1, #15
	ldr	r2, .L25+16
	mov	r3, #4
	mov	lr, pc
	bx	r4
	mov	r0, #70
	mov	r1, #15
	ldr	r2, .L25+20
	mov	r3, #4
	mov	lr, pc
	bx	r4
	mov	r0, #90
	mov	r1, #15
	ldr	r2, .L25+24
	mov	r3, #4
	mov	lr, pc
	bx	r4
	mov	r0, #110
	mov	r1, #15
	ldr	r2, .L25+28
	mov	r3, #4
	mov	lr, pc
	bx	r4
	mov	r0, #140
	ldr	r2, .L25+32
	mov	r3, #4
	mov	r1, #50
	mov	lr, pc
	bx	r4
	ldr	r3, .L25+36
	ldr	r2, .L25+40
	ldr	r0, [r3]
	ldr	r2, [r2]
	add	r0, r0, #1
	tst	r2, #8
	str	r0, [r3]
	beq	.L18
	ldr	r3, .L25+44
	ldr	r3, [r3]
	tst	r3, #8
	beq	.L24
.L18:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L24:
	mov	r3, #1
	ldr	ip, .L25+48
	ldr	r1, .L25+52
	ldr	r2, .L25+56
	str	r3, [ip, #16]
	str	r3, [r1]
	mov	lr, pc
	bx	r2
	ldr	r0, .L25+60
	ldr	r1, .L25+64
	ldr	r2, .L25+68
	ldr	r3, .L25+72
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	b	initGame
.L26:
	.align	2
.L25:
	.word	fillScreen4
	.word	drawString4
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	randomSeed
	.word	oldButtons
	.word	buttons
	.word	soundA
	.word	state
	.word	srand
	.word	GameSong
	.word	289622
	.word	11025
	.word	playSoundA
	.size	start, .-start
	.align	2
	.global	hideSprites
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	mov	r1, #512
	ldr	r2, .L30
.L28:
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L28
	bx	lr
.L31:
	.align	2
.L30:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.align	2
	.global	animate
	.type	animate, %function
animate:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L69
	ldr	r3, [r3]
	cmp	r3, #0
	movne	r2, #16
	mov	ip, #4
	ldrne	r3, .L69+4
	stmfd	sp!, {r4, r5, lr}
	strne	r2, [r3, #44]
	ldr	r3, .L69+8
	ldr	r2, [r3, #36]
	cmp	r2, #4
	ldr	r0, [r3, #32]
	strne	r2, [r3, #40]
	ldr	r2, .L69+12
	smull	r1, r2, r0, r2
	mov	r1, r0, asr #31
	rsb	r2, r1, r2, asr #3
	add	r2, r2, r2, asl #2
	subs	r2, r0, r2, asl #2
	str	ip, [r3, #36]
	ldr	r1, .L69+8
	bne	.L35
	ldr	r0, [r1, #44]
	cmp	r0, #0
	str	r2, [r1, #32]
	moveq	r2, #1
	str	r2, [r1, #44]
.L35:
	mov	r2, #67108864
	ldr	r2, [r2, #304]
	tst	r2, #64
	moveq	r2, #2
	streq	r2, [r3, #36]
	mov	r2, #67108864
	ldr	r2, [r2, #304]
	tst	r2, #128
	moveq	r2, #0
	streq	r2, [r3, #36]
	mov	r2, #67108864
	ldr	r1, [r2, #304]
	tst	r1, #32
	bne	.L39
	mov	r1, #1
	ldr	r2, [r2, #304]
	tst	r2, #16
	str	r1, [r3, #36]
	bne	.L41
.L42:
	mov	r2, #3
	str	r2, [r3, #36]
.L41:
	ldr	r2, [r3, #32]
	add	r2, r2, #1
	str	r2, [r3, #32]
.L43:
	ldr	r3, .L69+16
	mov	lr, #3
	mov	ip, #1
	mov	r5, #2
	mov	r4, #0
	add	r0, r3, #336
	b	.L48
.L44:
	beq	.L47
	ldr	r2, [r3, #20]
	cmp	r2, #0
	strgt	ip, [r3, #36]
	ble	.L47
.L46:
	add	r3, r3, #48
	cmp	r3, r0
	beq	.L68
.L48:
	ldr	r1, [r3, #16]
	ldr	r2, [r3, #36]
	cmp	r1, #0
	str	r2, [r3, #40]
	bge	.L44
	ldr	r2, [r3, #20]
	cmp	r2, #0
	strgt	r4, [r3, #36]
	bgt	.L46
	strne	r5, [r3, #36]
	bne	.L46
.L47:
	str	lr, [r3, #36]
	add	r3, r3, #48
	cmp	r3, r0
	bne	.L48
.L68:
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L39:
	ldr	r2, [r2, #304]
	mvn	r2, r2
	ands	r2, r2, #16
	bne	.L42
	ldr	r1, [r3, #36]
	cmp	r1, #4
	ldr	r1, .L69+8
	streq	r2, [r1, #44]
	beq	.L43
	b	.L41
.L70:
	.align	2
.L69:
	.word	gotKey
	.word	key
	.word	player
	.word	1717986919
	.word	fireballs
	.size	animate, .-animate
	.align	2
	.global	updateOAM
	.type	updateOAM, %function
updateOAM:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	ldr	r5, .L75
	ldr	r4, .L75+4
	ldr	r2, [r5, #4]
	ldr	lr, [r4, #4]
	mov	r2, r2, asl #23
	mov	lr, lr, asl #23
	mvn	r2, r2, lsr #6
	mvn	lr, lr, lsr #6
	ldr	r3, .L75+8
	mvn	r2, r2, lsr #17
	mvn	lr, lr, lsr #17
	mov	r0, r3
	add	r1, r4, #40
	ldmia	r1, {r1, ip}
	ldr	r6, [r5, #44]
	ldrb	r7, [r4]	@ zero_extendqisi2
	add	ip, r1, ip, asl #5
	ldrb	r5, [r5]	@ zero_extendqisi2
	mov	ip, ip, asl #2
	mov	r4, r6, asl #5
	ldr	r1, .L75+12
	strh	r7, [r3]	@ movhi
	strh	ip, [r3, #4]	@ movhi
	strh	r5, [r3, #8]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	strh	r4, [r3, #12]	@ movhi
	strh	lr, [r3, #2]	@ movhi
	add	lr, r1, #336
.L72:
	ldr	r2, [r1, #4]
	mov	r2, r2, asl #23
	mvn	r2, r2, lsr #6
	mvn	r2, r2, lsr #17
	add	r3, r1, #40
	ldmia	r3, {r3, ip}
	add	r3, r3, #4
	add	r3, r3, ip, asl #5
	add	r1, r1, #48
	ldrb	ip, [r1, #-48]	@ zero_extendqisi2
	mov	r3, r3, asl #2
	cmp	r1, lr
	strh	r2, [r0, #18]	@ movhi
	strh	r3, [r0, #20]	@ movhi
	strh	ip, [r0, #16]	@ movhi
	add	r0, r0, #8
	bne	.L72
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	bx	lr
.L76:
	.align	2
.L75:
	.word	key
	.word	player
	.word	shadowOAM
	.word	fireballs
	.size	updateOAM, .-updateOAM
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r4, #67108864
	ldr	r3, .L84
	mov	lr, pc
	bx	r3
	ldr	r3, .L84+4
	ldr	r0, .L84+8
	strh	r3, [r4]	@ movhi
	ldr	r6, .L84+12
	mov	lr, pc
	bx	r6
	ldr	r0, .L84+16
	ldr	r3, .L84+20
	mov	lr, pc
	bx	r3
	mov	r3, #3
	mov	r0, #130
	mov	r1, #50
	ldr	r2, .L84+24
	ldr	ip, .L84+28
	mov	lr, pc
	bx	ip
	ldr	r3, .L84+32
	ldr	r3, [r3]
	tst	r3, #1
	beq	.L77
	ldr	r3, .L84+36
	ldr	r3, [r3]
	ands	r5, r3, #1
	bne	.L77
	ldr	r3, .L84+40
	mov	lr, pc
	bx	r3
	mov	ip, #1
	mov	r2, #4864
	ldr	r1, .L84+44
	ldr	r3, .L84+48
	ldr	r0, .L84+52
	str	ip, [r0]
	strh	r1, [r4, #8]	@ movhi
	strh	r2, [r4]	@ movhi
	strh	r3, [r4, #10]	@ movhi
	ldr	r0, .L84+56
	ldr	r4, .L84+60
	mov	lr, pc
	bx	r6
	mov	r0, #3
	ldr	r1, .L84+64
	mov	r2, #100663296
	mov	r3, #2944
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L84+68
	ldr	r2, .L84+72
	mov	r3, #8192
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L84+76
	ldr	r2, .L84+80
	mov	r3, #256
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L84+84
	ldr	r2, .L84+88
	mov	r3, #2048
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L84+92
	ldr	r2, .L84+96
	mov	r3, #32768
	mov	lr, pc
	bx	r4
	ldr	r1, .L84+100
	ldr	r2, .L84+104
	mov	r3, #256
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r2, #512
	ldr	r1, .L84+108
.L81:
	strh	r2, [r1, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L81
.L77:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L85:
	.align	2
.L84:
	.word	pauseSound
	.word	1028
	.word	mainpalPal
	.word	loadPalette
	.word	PauseBitmap
	.word	drawBackgroundImage4
	.word	.LC7
	.word	drawString3
	.word	oldButtons
	.word	buttons
	.word	unpauseSound
	.word	-9344
	.word	6276
	.word	state
	.word	backgroundPal
	.word	DMANow
	.word	backgroundTiles
	.word	backgroundMap
	.word	100718592
	.word	bg2Tiles
	.word	100679680
	.word	bg2Map
	.word	100712448
	.word	characterTiles
	.word	100728832
	.word	characterPal
	.word	83886592
	.word	shadowOAM
	.size	pause, .-pause
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L162
	ldr	r7, .L162+4
	ldr	ip, [r3, #8]
	ldr	r2, [r7, #4]
	ldr	r1, [r7]
	ldr	r0, [r3, #12]
	rsb	ip, r2, ip
	rsb	r0, r1, r0
	cmp	r0, #239
	cmpls	ip, #159
	ldr	r6, .L162
	str	r0, [r6, #4]
	str	ip, [r6]
	movls	r0, #8
	mov	ip, r6
	movhi	r0, #16
	ldr	r5, .L162+8
	ldrhi	ip, .L162
	ldmia	r5, {r3, lr}
	str	r0, [ip, #44]
	ldr	r0, [r5, #24]
	sub	sp, sp, #12
	add	r4, r3, r2
	add	lr, lr, r1
	str	r0, [sp]
	mov	r0, r0, lsr #31
	str	r4, [r5, #8]
	str	lr, [r5, #12]
	mov	r6, #0
	ldr	r4, .L162+12
	str	r0, [sp, #4]
	b	.L100
.L154:
	mov	ip, #480
	rsb	lr, lr, #0
	cmp	r0, #480
	str	lr, [r4, #16]
	str	ip, [r4, #8]
	blt	.L94
.L155:
	mov	r0, #480
	rsb	r10, r10, #0
	str	r10, [r4, #20]
	str	r0, [r4, #12]
.L95:
	ldr	r0, [r5, #28]
	add	r0, r0, r0, lsr #31
	add	r3, r3, r0, asr #1
	cmp	r2, r3
	blt	.L96
	ldmia	sp, {r2, r3}
	add	r3, r3, r2
	mov	r3, r3, asr #1
.L97:
	add	r6, r6, #1
	cmp	r6, #7
	add	r4, r4, #48
	beq	.L99
.L156:
	ldmia	r7, {r1, r2}
	ldr	r3, [r5]
.L100:
	ldr	r9, [r4, #8]
	ldr	r8, [r4, #12]
	ldr	lr, [r4, #16]
	ldr	r10, [r4, #20]
	add	ip, lr, r9
	add	r0, r10, r8
	rsb	r2, r2, ip
	rsb	r1, r1, r0
	cmp	r1, #239
	cmpls	r2, #159
	movhi	fp, #16
	str	r2, [r4]
	stmib	r4, {r1, ip}
	str	r0, [r4, #12]
	mov	r9, ip
	mov	r8, r0
	strhi	fp, [r4, #44]
	bhi	.L91
	cmp	lr, r10
	moveq	fp, #0
	movne	fp, #1
	str	fp, [r4, #44]
.L91:
	cmp	ip, #480
	bge	.L154
	cmp	r9, #0
	movle	ip, #0
	rsble	lr, lr, #0
	strle	lr, [r4, #16]
	strle	ip, [r4, #8]
	cmp	r0, #480
	bge	.L155
.L94:
	cmp	r8, #0
	movle	ip, #0
	ldrle	r0, [r4, #20]
	rsble	r0, r0, #0
	strle	r0, [r4, #20]
	strle	ip, [r4, #12]
	b	.L95
.L96:
	ldr	r0, [r4, #28]
	add	r2, r2, r0
	cmp	r3, r2
	ldmia	sp, {r2, r3}
	add	r3, r3, r2
	bge	.L153
	ldr	r2, .L162+8
	ldr	r2, [r2, #4]
	mov	r3, r3, asr #1
	add	r2, r3, r2
	cmp	r1, r2
	bge	.L97
	ldr	r0, [r4, #24]
	add	r1, r1, r0
	cmp	r2, r1
	bge	.L97
	ldr	r0, .L162+16
	ldr	r1, .L162+20
	ldr	r2, .L162+24
	ldr	r3, .L162+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L162+8
	ldr	r0, .L162+32
	ldr	r3, [r3, #24]
	mov	r2, #0
	ldr	ip, [r0]
	mov	r0, r3, lsr #31
	mov	lr, r0
	mov	r1, #2
	str	r2, [ip, #20]
	ldr	ip, .L162+36
	str	r3, [sp]
	str	r0, [sp, #4]
	str	r1, [ip]
	ldr	r0, .L162+40
	add	r3, lr, r3
	ldr	r1, .L162+44
	ldr	lr, .L162+48
	str	r2, [lr, #16]
	strh	r2, [r0, #2]	@ movhi
	str	r2, [r1, #12]
.L153:
	add	r6, r6, #1
	cmp	r6, #7
	mov	r3, r3, asr #1
	add	r4, r4, #48
	bne	.L156
.L99:
	mov	r2, #67108864
	ldr	r2, [r2, #304]
	tst	r2, #64
	bne	.L101
	add	r1, r5, #8
	ldmia	r1, {r1, r2}
	add	r0, r1, r3
	add	r2, r3, r2
	add	r2, r2, r0, asl #9
	add	r2, r2, r2, lsr #31
	ldr	r0, .L162+52
	bic	r2, r2, #1
	ldrh	r0, [r0, r2]
	ldr	r2, .L162+56
	cmp	r0, r2
	ldr	r4, .L162+8
	beq	.L102
	ldr	r2, [r4]
	cmp	r2, #80
	subgt	r2, r2, #1
	strgt	r2, [r4]
	bgt	.L101
	cmp	r1, r2
	ldrne	r1, [r7, #4]
	subeq	r2, r2, #1
	subne	r1, r1, #1
	streq	r2, [r4]
	strne	r1, [r7, #4]
	cmp	r2, #0
	movle	r2, #0
	strle	r2, [r5]
.L101:
	mov	r2, #67108864
	ldr	r2, [r2, #304]
	tst	r2, #128
	bne	.L106
	add	r0, r5, #8
	ldmia	r0, {r0, r1}
	ldr	r2, [sp]
	add	r1, r3, r1
	add	r2, r0, r2
	add	r2, r1, r2, asl #9
	add	r2, r2, r2, lsr #31
	ldr	r1, .L162+52
	bic	r2, r2, #1
	ldrh	r1, [r1, r2]
	ldr	r2, .L162+56
	cmp	r1, r2
	ldr	r4, .L162+8
	beq	.L107
	ldr	r2, [r4]
	cmp	r2, #79
	addle	r2, r2, #1
	strle	r2, [r4]
	ble	.L106
	cmp	r0, #432
	ldrle	r1, [r7, #4]
	addgt	r2, r2, #1
	addle	r1, r1, #1
	strgt	r2, [r4]
	strle	r1, [r7, #4]
	cmp	r2, #127
	movgt	r2, #128
	strgt	r2, [r5]
.L106:
	mov	ip, #67108864
	ldr	r2, [ip, #304]
	tst	r2, #32
	bne	.L111
	ldr	r0, [r5, #12]
	ldr	r2, [r5, #8]
	add	r1, r0, r3
	add	r2, r3, r2
	add	r2, r1, r2, asl #9
	add	r2, r2, r2, lsr #31
	ldr	r1, .L162+52
	bic	r2, r2, #1
	ldrh	r1, [r1, r2]
	ldr	r2, .L162+56
	cmp	r1, r2
	ldr	r4, .L162+8
	beq	.L112
	ldr	r2, [r4, #4]
	cmp	r2, #120
	subgt	r2, r2, #1
	strgt	r2, [r4, #4]
	bgt	.L111
	cmp	r0, r2
	beq	.L157
	ldr	r2, [r7]
	sub	r2, r2, #1
	str	r2, [r7]
.L111:
	mov	r2, #67108864
	ldr	r2, [r2, #304]
	tst	r2, #16
	bne	.L116
	add	r1, r5, #8
	ldmia	r1, {r1, ip}
	add	r2, ip, r3
	add	r3, r3, r1
	add	r3, r2, r3, asl #9
	add	r3, r3, r3, lsr #31
	ldr	r2, .L162+52
	bic	r3, r3, #1
	ldrh	r2, [r2, r3]
	ldr	r3, .L162+56
	cmp	r2, r3
	ldr	r4, .L162+8
	beq	.L117
	ldr	r0, [r4, #4]
	cmp	r0, #119
	bgt	.L118
.L126:
	ldr	r3, [r5, #24]
	add	r0, r0, #1
	add	r3, r3, r3, lsr #31
	str	r0, [r5, #4]
	mov	r3, r3, asr #1
.L116:
	ldr	r1, .L162
	ldr	r2, [r5]
	ldr	r1, [r1]
	add	r2, r3, r2
	cmp	r2, r1
	ldr	r0, .L162+8
	ldr	ip, .L162
	ble	.L121
	ldr	lr, [ip, #24]
	add	r1, r1, lr
	cmp	r2, r1
	blt	.L158
.L121:
	ldr	r3, [r5, #28]
	ldr	r2, [r5, #8]
	add	r3, r3, r3, lsr #31
	add	r3, r2, r3, asr #1
	sub	r3, r3, #193
	cmp	r3, #62
	ldr	r2, .L162+8
	bhi	.L122
	ldr	r3, [r2, #12]
	ldr	r2, [r2, #24]
	add	r3, r3, r2
	sub	r3, r3, #488
	sub	r3, r3, #1
	cmp	r3, #22
	bls	.L159
.L122:
	ldr	r4, .L162+60
	ldr	r3, [r4]
	tst	r3, #1
	beq	.L123
	ldr	r2, .L162+64
	ldr	r2, [r2]
	tst	r2, #1
	beq	.L124
.L123:
	tst	r3, #2
	beq	.L125
	ldr	r3, .L162+64
	ldr	r3, [r3]
	ands	r4, r3, #2
	beq	.L160
.L125:
	mov	ip, #67108864
	ldmia	r7, {r2, r3}
	add	r0, r2, r2, lsr #31
	add	r1, r3, r3, lsr #31
	mov	r2, r2, asl #16
	mov	r0, r0, asl #15
	mov	r3, r3, asl #16
	mov	r1, r1, asl #15
	mov	r2, r2, lsr #16
	mov	r0, r0, lsr #16
	mov	r3, r3, lsr #16
	mov	r1, r1, lsr #16
	strh	r2, [ip, #16]	@ movhi
	strh	r3, [ip, #18]	@ movhi
	strh	r0, [ip, #20]	@ movhi
	strh	r1, [ip, #22]	@ movhi
	bl	animate
	bl	updateOAM
	mov	r0, #3
	ldr	r1, .L162+68
	mov	r2, #117440512
	ldr	ip, .L162+72
	mov	r3, #512
	mov	lr, pc
	bx	ip
	ldr	r3, .L162+76
	mov	lr, pc
	bx	r3
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L124:
	bl	pause
	mov	r1, #4
	ldr	r2, .L162+36
	ldr	r3, [r4]
	str	r1, [r2]
	b	.L123
.L158:
	ldr	r2, [r0, #4]
	ldr	r1, [ip, #4]
	add	r3, r3, r2
	cmp	r3, r1
	ble	.L121
	ldr	r2, [ip, #28]
	add	r1, r1, r2
	cmp	r3, r1
	bge	.L121
	mov	lr, #16
	mov	r6, #1
	ldr	r4, .L162+80
	ldr	r2, .L162+24
	ldr	r3, .L162+28
	ldr	r0, .L162+84
	ldr	r1, .L162+88
	str	r6, [r4]
	str	lr, [ip, #44]
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L162+48
	str	r2, [r3, #16]
	b	.L121
.L160:
	mov	r5, #1
	mov	ip, #16
	ldr	lr, .L162+80
	str	r5, [lr]
	ldr	lr, .L162
	ldr	r3, .L162+28
	ldr	r0, .L162+84
	ldr	r1, .L162+88
	ldr	r2, .L162+24
	str	ip, [lr, #44]
	mov	lr, pc
	bx	r3
	ldr	r3, .L162+48
	str	r4, [r3, #16]
	b	.L125
.L118:
	cmp	ip, #392
	blt	.L119
	ldr	r3, [r4, #24]
	cmp	ip, #480
	addge	r3, r3, r3, lsr #31
	addlt	r0, r0, #1
	addlt	r3, r3, r3, lsr #31
	strlt	r0, [r4, #4]
	mov	r3, r3, asr #1
	b	.L116
.L159:
	ldr	r3, .L162+80
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L122
	mov	lr, #3
	ldr	ip, .L162+36
	ldr	r0, .L162+92
	ldr	r1, .L162+96
	ldr	r2, .L162+24
	ldr	r3, .L162+28
	str	lr, [ip]
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldr	r2, .L162+32
	ldr	r0, .L162+48
	ldr	ip, [r2]
	ldr	r1, .L162+40
	ldr	r2, .L162+44
	str	r3, [ip, #20]
	str	r3, [r0, #16]
	strh	r3, [r1, #2]	@ movhi
	str	r3, [r2, #12]
	b	.L122
.L157:
	cmp	r0, #0
	bgt	.L161
	ldr	r2, [ip, #304]
	tst	r2, #16
	bne	.L116
	cmp	r0, #119
	ble	.L126
.L119:
	ldr	r2, [r7]
	ldr	r3, [r5, #24]
	add	r2, r2, #1
	add	r3, r3, r3, lsr #31
	str	r2, [r7]
	mov	r3, r3, asr #1
	b	.L116
.L102:
	ldr	r0, .L162+100
	ldr	r1, .L162+104
	ldr	r2, .L162+24
	ldr	r3, .L162+28
	mov	lr, pc
	bx	r3
	ldr	r1, [r4, #24]
	mov	r3, #0
	mov	r6, r1
	mov	ip, #2
	ldr	r2, .L162+32
	str	r1, [sp]
	ldr	r4, [r2]
	ldr	lr, .L162+48
	ldr	r0, .L162+36
	ldr	r2, .L162+40
	ldr	r1, .L162+44
	str	r3, [r4, #20]
	str	r3, [lr, #16]
	str	r3, [r1, #12]
	str	ip, [r0]
	strh	r3, [r2, #2]	@ movhi
	add	r3, r6, r6, lsr #31
	mov	r3, r3, asr #1
	b	.L101
.L107:
	ldr	r0, .L162+100
	ldr	r1, .L162+104
	ldr	r2, .L162+24
	ldr	r3, .L162+28
	mov	lr, pc
	bx	r3
	mov	r2, #0
	mov	lr, #2
	ldr	r1, .L162+32
	ldr	r3, [r4, #24]
	ldr	r6, [r1]
	ldr	r4, .L162+48
	ldr	ip, .L162+36
	ldr	r1, .L162+40
	ldr	r0, .L162+44
	add	r3, r3, r3, lsr #31
	str	r2, [r6, #20]
	str	r2, [r4, #16]
	str	lr, [ip]
	str	r2, [r0, #12]
	mov	r3, r3, asr #1
	strh	r2, [r1, #2]	@ movhi
	b	.L106
.L112:
	ldr	r0, .L162+100
	ldr	r1, .L162+104
	ldr	r2, .L162+24
	ldr	r3, .L162+28
	mov	lr, pc
	bx	r3
	mov	r2, #0
	mov	lr, #2
	ldr	r1, .L162+32
	ldr	r3, [r4, #24]
	ldr	r6, [r1]
	ldr	r4, .L162+48
	ldr	ip, .L162+36
	ldr	r1, .L162+40
	ldr	r0, .L162+44
	add	r3, r3, r3, lsr #31
	str	r2, [r6, #20]
	str	r2, [r4, #16]
	str	lr, [ip]
	str	r2, [r0, #12]
	mov	r3, r3, asr #1
	strh	r2, [r1, #2]	@ movhi
	b	.L111
.L117:
	ldr	r0, .L162+100
	ldr	r1, .L162+104
	ldr	r2, .L162+24
	ldr	r3, .L162+28
	mov	lr, pc
	bx	r3
	mov	r2, #0
	mov	lr, #2
	ldr	r1, .L162+32
	ldr	r3, [r4, #24]
	ldr	r6, [r1]
	ldr	r4, .L162+48
	ldr	ip, .L162+36
	ldr	r1, .L162+40
	ldr	r0, .L162+44
	add	r3, r3, r3, lsr #31
	str	r2, [r6, #20]
	str	r2, [r4, #16]
	str	lr, [ip]
	str	r2, [r0, #12]
	mov	r3, r3, asr #1
	strh	r2, [r1, #2]	@ movhi
	b	.L116
.L161:
	sub	r0, r0, #1
	str	r0, [r4, #4]
	b	.L111
.L163:
	.align	2
.L162:
	.word	key
	.word	.LANCHOR1
	.word	player
	.word	fireballs
	.word	fireballSound
	.word	20250
	.word	11025
	.word	playSoundB
	.word	dma
	.word	state
	.word	67109120
	.word	soundA
	.word	soundB
	.word	collMapBitmap
	.word	771
	.word	oldButtons
	.word	buttons
	.word	shadowOAM
	.word	DMANow
	.word	waitForVblank
	.word	gotKey
	.word	ping
	.word	8646
	.word	dada
	.word	22324
	.word	falling
	.word	56908
	.size	game, .-game
	.align	2
	.global	win
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	ldr	r2, .L171
	stmfd	sp!, {r4, lr}
	ldr	r0, .L171+4
	strh	r2, [r3]	@ movhi
	ldr	r3, .L171+8
	mov	lr, pc
	bx	r3
	ldr	r0, .L171+12
	ldr	r3, .L171+16
	mov	lr, pc
	bx	r3
	mov	r3, #3
	mov	r0, #130
	mov	r1, #50
	ldr	r2, .L171+20
	ldr	ip, .L171+24
	mov	lr, pc
	bx	ip
	ldr	r3, .L171+28
	ldr	r3, [r3]
	tst	r3, #8
	beq	.L164
	ldr	r3, .L171+32
	ldr	r3, [r3]
	ands	r4, r3, #8
	beq	.L170
.L164:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L170:
	ldr	r3, .L171+36
	mov	lr, pc
	bx	r3
	ldr	ip, .L171+40
	ldr	r2, .L171+44
	ldr	r3, .L171+48
	ldr	r0, .L171+52
	ldr	r1, .L171+56
	str	r4, [ip]
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L171+60
	ldmfd	sp!, {r4, lr}
	str	r2, [r3, #16]
	bx	lr
.L172:
	.align	2
.L171:
	.word	1028
	.word	mainpalPal
	.word	loadPalette
	.word	YouWinBitmap
	.word	drawBackgroundImage4
	.word	.LC8
	.word	drawString4
	.word	oldButtons
	.word	buttons
	.word	stopSound
	.word	state
	.word	11025
	.word	playSoundA
	.word	StartSong
	.word	208211
	.word	soundA
	.size	win, .-win
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	ldr	r2, .L180
	stmfd	sp!, {r4, lr}
	ldr	r0, .L180+4
	strh	r2, [r3]	@ movhi
	ldr	r3, .L180+8
	mov	lr, pc
	bx	r3
	ldr	r0, .L180+12
	ldr	r3, .L180+16
	mov	lr, pc
	bx	r3
	mov	r3, #3
	mov	r0, #130
	mov	r1, #50
	ldr	r2, .L180+20
	ldr	ip, .L180+24
	mov	lr, pc
	bx	ip
	ldr	r3, .L180+28
	ldr	r3, [r3]
	tst	r3, #8
	beq	.L173
	ldr	r3, .L180+32
	ldr	r3, [r3]
	ands	r4, r3, #8
	beq	.L179
.L173:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L179:
	ldr	r3, .L180+36
	mov	lr, pc
	bx	r3
	ldr	ip, .L180+40
	ldr	r2, .L180+44
	ldr	r3, .L180+48
	ldr	r0, .L180+52
	ldr	r1, .L180+56
	str	r4, [ip]
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L180+60
	ldmfd	sp!, {r4, lr}
	str	r2, [r3, #16]
	bx	lr
.L181:
	.align	2
.L180:
	.word	1028
	.word	mainpalPal
	.word	loadPalette
	.word	YouLoseBitmap
	.word	drawBackgroundImage4
	.word	.LC8
	.word	drawString4
	.word	oldButtons
	.word	buttons
	.word	stopSound
	.word	state
	.word	11025
	.word	playSoundA
	.word	StartSong
	.word	208211
	.word	soundA
	.size	lose, .-lose
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r5, #67108864
	mov	r6, #0
	stmfd	sp!, {r3, r7, fp, lr}
	ldr	r3, .L192
	ldr	r2, [r5, #304]
	ldr	r4, .L192+4
	ldr	r8, .L192+8
	strh	r3, [r5]	@ movhi
	ldr	r3, .L192+12
	str	r2, [r4]
	str	r6, [r8]
	mov	lr, pc
	bx	r3
	ldr	r3, .L192+16
	mov	lr, pc
	bx	r3
	mov	r7, #31
	mov	r3, #83886080
	mov	lr, #31744
	mov	ip, #992
	mvn	r2, #32768
	ldr	r1, .L192+20
	ldr	r0, .L192+24
	str	r6, [r1]
	strh	r6, [r3]	@ movhi
	strh	r7, [r3, #2]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	strh	lr, [r3, #4]	@ movhi
	strh	ip, [r3, #6]	@ movhi
	ldr	r2, .L192+28
	ldr	r3, .L192+32
	ldr	r1, .L192+36
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L192+40
	ldr	r9, .L192+44
	str	r2, [r3, #16]
	ldr	fp, .L192+48
	ldr	r10, .L192+52
	ldr	r7, .L192+56
	ldr	r6, .L192+60
.L190:
	ldr	r3, [r4]
	str	r3, [r9]
	ldr	r3, [r8]
	ldr	r2, [r5, #304]
	str	r2, [r4]
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L183
.L185:
	.word	.L184
	.word	.L186
	.word	.L187
	.word	.L188
	.word	.L189
.L189:
	ldr	r3, .L192+64
	mov	lr, pc
	bx	r3
.L183:
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r6
	b	.L190
.L188:
	ldr	r3, .L192+68
	mov	lr, pc
	bx	r3
	b	.L183
.L187:
	ldr	r3, .L192+72
	mov	lr, pc
	bx	r3
	b	.L183
.L184:
	mov	lr, pc
	bx	fp
	b	.L183
.L186:
	mov	lr, pc
	bx	r10
	b	.L183
.L193:
	.align	2
.L192:
	.word	1028
	.word	buttons
	.word	state
	.word	setupInterrupts
	.word	setupSounds
	.word	randomSeed
	.word	StartSong
	.word	11025
	.word	playSoundA
	.word	208211
	.word	soundA
	.word	oldButtons
	.word	start
	.word	game
	.word	waitForVblank
	.word	flipPage
	.word	pause
	.word	win
	.word	lose
	.size	main, .-main
	.comm	fpsbuffer,30,4
	.comm	scanLineCounter,2,2
	.comm	cheat,4,4
	.global	rdels
	.global	cdels
	.comm	gotKey,4,4
	.comm	randomSeed,4,4
	.comm	key,48,4
	.comm	fireballs,336,4
	.comm	player,48,4
	.global	collMapSize
	.comm	shadowOAM,1024,4
	.comm	fbrdel,4,4
	.comm	fbcdel,4,4
	.global	vOff
	.global	hOff
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.comm	state,4,4
	.comm	vbCountB,4,4
	.comm	vbCountA,4,4
	.comm	soundB,28,4
	.comm	soundA,28,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	rdels, %object
	.size	rdels, 8
rdels:
	.word	-1
	.word	1
	.type	cdels, %object
	.size	cdels, 16
cdels:
	.word	-2
	.word	-1
	.word	1
	.word	2
	.type	collMapSize, %object
	.size	collMapSize, 4
collMapSize:
	.word	512
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"ESCAPE!\000"
.LC1:
	.ascii	"You are trapped on a platfrom in\000"
	.space	3
.LC2:
	.ascii	"the air. Avoid the flying fireballs,\000"
	.space	3
.LC3:
	.ascii	"stay on the platfrom, and find the\000"
	.space	1
.LC4:
	.ascii	"key. The exit door will activate once\000"
	.space	2
.LC5:
	.ascii	"you collect the key.\000"
	.space	3
.LC6:
	.ascii	"Press START to begin\000"
	.space	3
.LC7:
	.ascii	"Hit A to continue\000"
	.space	2
.LC8:
	.ascii	"Hit Start to play again\000"
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.ident	"GCC: (devkitARM release 43) 4.9.2"
