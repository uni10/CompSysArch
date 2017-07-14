	.file	1 "epuzzle.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	output
	.set	nomips16
	.set	nomicromips
	.ent	output
	.type	output, @function
output:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	output
	.size	output, .-output
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$sp,56,$31		# vars= 8, regs= 9/0, args= 0, gp= 8
	.mask	0x40ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-56
	lw	$25,%got(fields)($28)
	li	$2,2			# 0x2
	.cprestore	0
	sw	$fp,52($sp)
	sw	$23,48($sp)
	sw	$22,44($sp)
	sw	$21,40($sp)
	sw	$19,32($sp)
	sw	$18,28($sp)
	sw	$17,24($sp)
	sw	$20,36($sp)
	sw	$16,20($sp)
	lw	$fp,%got(field_length)($28)
	sw	$2,0($25)
	li	$2,4			# 0x4
	sw	$2,4($25)
	li	$2,5			# 0x5
	lw	$21,0($fp)
	sw	$2,8($25)
	li	$2,3			# 0x3
	lw	$23,%got(queue)($28)
	sw	$2,12($25)
	li	$2,1			# 0x1
	addiu	$21,$21,1
	sw	$2,16($25)
	li	$22,-2147483648			# 0xffffffff80000000
	li	$2,-1			# 0xffffffffffffffff
	lw	$17,%got(head)($28)
	lw	$19,%got(tail)($28)
	sw	$0,8($sp)
	sw	$0,20($25)
	sw	$2,24($25)
	sw	$0,28($25)
	sw	$21,0($fp)
	sw	$0,0($23)
	move	$5,$0
	addiu	$22,$22,255
	li	$14,1			# 0x1
	li	$13,3			# 0x3
	li	$18,4			# 0x4
$L3:
	lw	$2,0($17)
	lw	$3,0($19)
	slt	$2,$3,$2
	bne	$2,$0,$L4
	move	$10,$21

$L59:
	lw	$2,8($sp)
	bne	$2,$0,$L4
	nop

	lw	$3,0($17)
	lw	$2,0($19)
	beq	$3,$2,$L4
	nop

	lw	$2,0($17)
	and	$2,$2,$22
	bltz	$2,$L58
	li	$3,-256			# 0xffffffffffffff00

$L10:
	sll	$2,$2,2
	addu	$2,$23,$2
	lw	$20,0($2)
	lw	$2,0($17)
	sll	$24,$20,5
	addiu	$2,$2,1
	addu	$24,$25,$24
	lw	$12,%got(dx)($28)
	lw	$15,%got(dy)($28)
	sw	$2,0($17)
	move	$11,$0
	addiu	$16,$24,24
$L27:
	move	$6,$24
	move	$3,$0
	move	$2,$0
	move	$4,$0
$L13:
	lw	$7,0($6)
	beq	$7,$0,$L32
	nop

	move	$7,$2
$L11:
	lw	$2,4($6)
	addiu	$6,$6,8
	movz	$3,$4,$2
	movz	$7,$14,$2
	addiu	$4,$4,1
	bne	$4,$13,$L13
	move	$2,$7

	lw	$8,0($12)
	addu	$8,$7,$8
	sltu	$4,$8,2
	beq	$4,$0,$L14
	nop

	lw	$4,0($15)
	addu	$4,$3,$4
	sltu	$6,$4,3
	beq	$6,$0,$L14
	nop

	sll	$7,$10,5
	addu	$9,$25,$7
	move	$6,$9
	move	$5,$24
$L17:
	lw	$21,0($5)
	addiu	$5,$5,8
	sw	$21,0($6)
	lw	$21,-4($5)
	addiu	$6,$6,8
	bne	$16,$5,$L17
	sw	$21,-4($6)

	sll	$5,$10,2
	addu	$4,$5,$4
	sll	$4,$4,1
	addu	$3,$5,$3
	addu	$4,$4,$8
	sll	$3,$3,1
	sll	$4,$4,2
	addu	$4,$25,$4
	addu	$2,$3,$2
	sll	$2,$2,2
	lw	$3,0($4)
	addu	$5,$25,$7
	addu	$2,$25,$2
	sw	$3,0($2)
	sw	$11,24($5)
	sw	$20,28($5)
	addiu	$21,$10,1
	blez	$10,$L19
	sw	$0,0($4)

	addiu	$7,$7,24
	lw	$6,%got(fields)($28)
	addu	$7,$25,$7
	move	$8,$0
$L30:
	move	$2,$9
	move	$3,$6
$L20:
	lw	$5,0($3)
	lw	$4,0($2)
	bne	$5,$4,$L21
	nop

	lw	$4,4($2)
	lw	$5,4($3)
	bne	$5,$4,$L21
	addiu	$2,$2,8

	bne	$7,$2,$L20
	addiu	$3,$3,8

$L54:
	li	$5,1			# 0x1
$L14:
	addiu	$11,$11,1
	addiu	$12,$12,4
	bne	$11,$18,$L27
	addiu	$15,$15,4

	lw	$2,0($17)
	lw	$3,0($19)
	slt	$2,$3,$2
	beq	$2,$0,$L59
	nop

$L4:
	bne	$5,$0,$L60
	nop

$L7:
	lw	$2,8($sp)
	lw	$fp,52($sp)
	lw	$23,48($sp)
	lw	$22,44($sp)
	lw	$21,40($sp)
	lw	$20,36($sp)
	lw	$19,32($sp)
	lw	$18,28($sp)
	lw	$17,24($sp)
	lw	$16,20($sp)
	move	$2,$0
	jr	$31
	addiu	$sp,$sp,56

$L21:
	addiu	$8,$8,1
	bne	$10,$8,$L30
	addiu	$6,$6,32

$L19:
	lw	$2,%got(TARGET_FIELD)($28)
	addiu	$5,$2,24
$L23:
	lw	$4,0($9)
	lw	$3,0($2)
	bne	$4,$3,$L25
	nop

	lw	$3,4($2)
	lw	$4,4($9)
	bne	$4,$3,$L25
	addiu	$2,$2,8

	bne	$5,$2,$L23
	addiu	$9,$9,8

	li	$2,1			# 0x1
	sw	$2,8($sp)
	b	$L3
	li	$5,1			# 0x1

$L32:
	b	$L11
	move	$3,$4

$L25:
	lw	$2,0($19)
	addiu	$2,$2,-1
	and	$2,$2,$22
	bltz	$2,$L61
	li	$3,-256			# 0xffffffffffffff00

$L31:
	lw	$3,0($19)
	sll	$2,$2,2
	addu	$2,$23,$2
	addiu	$3,$3,1
	sw	$10,0($2)
	sw	$3,0($19)
	b	$L54
	move	$10,$21

$L58:
	addiu	$2,$2,-1
	or	$2,$2,$3
	b	$L10
	addiu	$2,$2,1

$L61:
	addiu	$2,$2,-1
	or	$2,$2,$3
	b	$L31
	addiu	$2,$2,1

$L60:
	b	$L7
	sw	$10,0($fp)

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.globl	tail
	.data
	.align	2
	.type	tail, @object
	.size	tail, 4
tail:
	.word	1
	.globl	head
	.section	.bss,"aw",@nobits
	.align	2
	.type	head, @object
	.size	head, 4
head:
	.space	4
	.globl	queue
	.align	2
	.type	queue, @object
	.size	queue, 1024
queue:
	.space	1024
	.globl	TARGET_FIELD
	.data
	.align	2
	.type	TARGET_FIELD, @object
	.size	TARGET_FIELD, 32
TARGET_FIELD:
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	0
	.word	255
	.word	0
	.globl	field_length
	.section	.bss
	.align	2
	.type	field_length, @object
	.size	field_length, 4
field_length:
	.space	4

	.comm	fields,23040,4
	.globl	dx
	.data
	.align	2
	.type	dx, @object
	.size	dx, 16
dx:
	.word	0
	.word	1
	.word	0
	.word	-1
	.globl	dy
	.align	2
	.type	dy, @object
	.size	dy, 16
dy:
	.word	-1
	.word	0
	.word	1
	.word	0
	.ident	"GCC: (Debian 6.3.0-18) 6.3.0 20170516"
