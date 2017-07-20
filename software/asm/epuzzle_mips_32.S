	.file	1 "epuzzle.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.globl	dy
	.data
	.align	2
	.type	dy, @object
	.size	dy, 16
dy:
	.word	-1
	.word	0
	.word	1
	.word	0
	.globl	dx
	.align	2
	.type	dx, @object
	.size	dx, 16
dx:
	.word	0
	.word	1
	.word	0
	.word	-1

	.comm	fields,23040,4
	.globl	field_length
	.section	.bss,"aw",@nobits
	.align	2
	.type	field_length, @object
	.size	field_length, 4
field_length:
	.space	4
	.globl	log_cmd
	.align	2
	.type	log_cmd, @object
	.size	log_cmd, 1024
log_cmd:
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
	.globl	queue
	.section	.bss
	.align	2
	.type	queue, @object
	.size	queue, 1024
queue:
	.space	1024
	.globl	head
	.align	2
	.type	head, @object
	.size	head, 4
head:
	.space	4
	.globl	tail
	.data
	.align	2
	.type	tail, @object
	.size	tail, 4
tail:
	.word	1
	.globl	current
	.section	.bss
	.align	2
	.type	current, @object
	.size	current, 4
current:
	.space	4
	.globl	finished
	.align	2
	.type	finished, @object
	.size	finished, 4
finished:
	.space	4
	.globl	init_state
	.data
	.align	2
	.type	init_state, @object
	.size	init_state, 24
init_state:
	.word	2
	.word	4
	.word	5
	.word	3
	.word	1
	.word	0

	.comm	blank_x,4,4

	.comm	blank_y,4,4
	.globl	ret_val
	.section	.bss
	.align	2
	.type	ret_val, @object
	.size	ret_val, 4
ret_val:
	.space	4

	.comm	arg0,4,4

	.comm	arg1,4,4

	.comm	arg2,4,4

	.comm	arg3,4,4

	.comm	arg4,4,4

	.comm	ptr,4,4
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,80,$31		# vars= 64, regs= 1/0, args= 0, gp= 8
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-80
	sw	$fp,76($sp)
	move	$fp,$sp
	.cprestore	0
	nop
$L2 = .
	sw	$0,44($fp)
	b	$L44
	nop

$L7:
	sw	$0,12($fp)
	b	$L5
	nop

$L6:
	lw	$2,%got(arg0)($28)
	lw	$2,0($2)
	lw	$3,%got(arg1)($28)
	lw	$3,0($3)
	lw	$4,%got(fields)($28)
	sll	$5,$3,2
	lw	$3,8($fp)
	addu	$3,$5,$3
	sll	$5,$3,1
	lw	$3,12($fp)
	addu	$3,$5,$3
	sll	$3,$3,2
	addu	$3,$4,$3
	lw	$3,0($3)
	lw	$4,%got(fields)($28)
	sll	$5,$2,2
	lw	$2,8($fp)
	addu	$2,$5,$2
	sll	$5,$2,1
	lw	$2,12($fp)
	addu	$2,$5,$2
	sll	$2,$2,2
	addu	$2,$4,$2
	sw	$3,0($2)
	lw	$2,12($fp)
	addiu	$2,$2,1
	sw	$2,12($fp)
$L5:
	lw	$2,12($fp)
	slt	$2,$2,2
	bne	$2,$0,$L6
	nop

	lw	$2,8($fp)
	addiu	$2,$2,1
	sw	$2,8($fp)
$L4:
	lw	$2,8($fp)
	slt	$2,$2,3
	bne	$2,$0,$L7
	nop

	lw	$2,%got(arg0)($28)
	lw	$2,0($2)
	lw	$3,%got(arg2)($28)
	lw	$3,0($3)
	lw	$4,%got(fields)($28)
	sll	$2,$2,5
	addu	$2,$4,$2
	sw	$3,24($2)
	lw	$2,%got(arg0)($28)
	lw	$2,0($2)
	lw	$3,%got(arg1)($28)
	lw	$3,0($3)
	lw	$4,%got(fields)($28)
	sll	$2,$2,5
	addu	$2,$4,$2
	sw	$3,28($2)
	nop
$L8 = .
	lw	$2,%got(field_length)($28)
	lw	$6,0($2)
	lw	$2,%got(blank_y)($28)
	lw	$5,0($2)
	lw	$2,%got(blank_x)($28)
	lw	$2,0($2)
	lw	$3,%got(field_length)($28)
	lw	$8,0($3)
	lw	$3,%got(arg2)($28)
	lw	$3,0($3)
	lw	$4,%got(dy)($28)
	sll	$3,$3,2
	addu	$3,$4,$3
	lw	$4,0($3)
	lw	$3,%got(blank_y)($28)
	lw	$3,0($3)
	addu	$7,$4,$3
	lw	$3,%got(arg2)($28)
	lw	$3,0($3)
	lw	$4,%got(dx)($28)
	sll	$3,$3,2
	addu	$3,$4,$3
	lw	$4,0($3)
	lw	$3,%got(blank_x)($28)
	lw	$3,0($3)
	addu	$3,$4,$3
	lw	$4,%got(fields)($28)
	sll	$8,$8,2
	addu	$7,$8,$7
	sll	$7,$7,1
	addu	$3,$7,$3
	sll	$3,$3,2
	addu	$3,$4,$3
	lw	$3,0($3)
	lw	$4,%got(fields)($28)
	sll	$6,$6,2
	addu	$5,$6,$5
	sll	$5,$5,1
	addu	$2,$5,$2
	sll	$2,$2,2
	addu	$2,$4,$2
	sw	$3,0($2)
	lw	$2,%got(field_length)($28)
	lw	$5,0($2)
	lw	$2,%got(arg2)($28)
	lw	$2,0($2)
	lw	$3,%got(dy)($28)
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,%got(blank_y)($28)
	lw	$2,0($2)
	addu	$4,$3,$2
	lw	$2,%got(arg2)($28)
	lw	$2,0($2)
	lw	$3,%got(dx)($28)
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,%got(blank_x)($28)
	lw	$2,0($2)
	addu	$2,$3,$2
	lw	$3,%got(fields)($28)
	sll	$5,$5,2
	addu	$4,$5,$4
	sll	$4,$4,1
	addu	$2,$4,$2
	sll	$2,$2,2
	addu	$2,$3,$2
	sw	$0,0($2)
	lw	$2,%got(field_length)($28)
	lw	$2,0($2)
	addiu	$3,$2,1
	lw	$2,%got(field_length)($28)
	sw	$3,0($2)
	lw	$2,%got(ret_val)($28)
	li	$3,1			# 0x1
	sw	$3,0($2)
	b	$L18
	nop

$L14:
	sw	$0,20($fp)
	b	$L11
	nop

$L13:
	lw	$2,%got(arg1)($28)
	lw	$2,0($2)
	lw	$3,%got(fields)($28)
	sll	$4,$2,2
	lw	$2,16($fp)
	addu	$2,$4,$2
	sll	$4,$2,1
	lw	$2,20($fp)
	addu	$2,$4,$2
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$2,0($2)
	bne	$2,$0,$L12
	nop

	lw	$2,%got(blank_x)($28)
	lw	$3,20($fp)
	sw	$3,0($2)
	lw	$2,%got(blank_y)($28)
	lw	$3,16($fp)
	sw	$3,0($2)
$L12:
	lw	$2,20($fp)
	addiu	$2,$2,1
	sw	$2,20($fp)
$L11:
	lw	$2,20($fp)
	slt	$2,$2,2
	bne	$2,$0,$L13
	nop

	lw	$2,16($fp)
	addiu	$2,$2,1
	sw	$2,16($fp)
$L10:
	lw	$2,16($fp)
	slt	$2,$2,3
	bne	$2,$0,$L14
	nop

	lw	$2,%got(arg2)($28)
	lw	$2,0($2)
	lw	$3,%got(dx)($28)
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,%got(blank_x)($28)
	lw	$2,0($2)
	addu	$2,$3,$2
	addiu	$2,$2,0
	sltu	$2,$2,2
	bne	$2,$0,$L75
	nop

	lw	$2,%got(ret_val)($28)
	sw	$0,0($2)
	b	$L18
	nop

$L75:
	nop
	lw	$2,%got(arg2)($28)
	lw	$2,0($2)
	lw	$3,%got(dy)($28)
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,%got(blank_y)($28)
	lw	$2,0($2)
	addu	$2,$3,$2
	addiu	$2,$2,0
	sltu	$2,$2,3
	bne	$2,$0,$L76
	nop

	lw	$2,%got(ret_val)($28)
	sw	$0,0($2)
	b	$L18
	nop

$L76:
	nop
	lw	$2,%got(field_length)($28)
	lw	$3,0($2)
	lw	$2,%got(arg0)($28)
	sw	$3,0($2)
	nop
$L3 = .
	sw	$0,8($fp)
	b	$L4
	nop

$L28:
	sw	$0,28($fp)
	b	$L24
	nop

$L27:
	lw	$2,%got(arg0)($28)
	lw	$2,0($2)
	lw	$3,%got(fields)($28)
	sll	$4,$2,2
	lw	$2,24($fp)
	addu	$2,$4,$2
	sll	$4,$2,1
	lw	$2,28($fp)
	addu	$2,$4,$2
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,%got(field_length)($28)
	lw	$2,0($2)
	addiu	$2,$2,-1
	lw	$4,%got(fields)($28)
	sll	$5,$2,2
	lw	$2,24($fp)
	addu	$2,$5,$2
	sll	$5,$2,1
	lw	$2,28($fp)
	addu	$2,$5,$2
	sll	$2,$2,2
	addu	$2,$4,$2
	lw	$2,0($2)
	beq	$3,$2,$L25
	nop

	lw	$2,%got(ret_val)($28)
	sw	$0,0($2)
	b	$L26
	nop

$L25:
	lw	$2,28($fp)
	addiu	$2,$2,1
	sw	$2,28($fp)
$L24:
	lw	$2,28($fp)
	slt	$2,$2,2
	bne	$2,$0,$L27
	nop

	lw	$2,24($fp)
	addiu	$2,$2,1
	sw	$2,24($fp)
$L23:
	lw	$2,24($fp)
	slt	$2,$2,3
	bne	$2,$0,$L28
	nop

	lw	$2,%got(ret_val)($28)
	li	$3,1			# 0x1
	sw	$3,0($2)
	b	$L26
	nop

$L81:
	nop
$L29 = .
	sw	$0,32($fp)
	b	$L30
	nop

$L35:
	sw	$0,36($fp)
	b	$L31
	nop

$L34:
	lw	$3,%got(TARGET_FIELD)($28)
	lw	$2,32($fp)
	sll	$4,$2,1
	lw	$2,36($fp)
	addu	$2,$4,$2
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,%got(field_length)($28)
	lw	$2,0($2)
	addiu	$2,$2,-1
	lw	$4,%got(fields)($28)
	sll	$5,$2,2
	lw	$2,32($fp)
	addu	$2,$5,$2
	sll	$5,$2,1
	lw	$2,36($fp)
	addu	$2,$5,$2
	sll	$2,$2,2
	addu	$2,$4,$2
	lw	$2,0($2)
	beq	$3,$2,$L32
	nop

	lw	$2,%got(ret_val)($28)
	sw	$0,0($2)
	b	$L33
	nop

$L32:
	lw	$2,36($fp)
	addiu	$2,$2,1
	sw	$2,36($fp)
$L31:
	lw	$2,36($fp)
	slt	$2,$2,2
	bne	$2,$0,$L34
	nop

	lw	$2,32($fp)
	addiu	$2,$2,1
	sw	$2,32($fp)
$L30:
	lw	$2,32($fp)
	slt	$2,$2,3
	bne	$2,$0,$L35
	nop

	lw	$2,%got(ret_val)($28)
	li	$3,1			# 0x1
	sw	$3,0($2)
	b	$L33
	nop

$L74:
$L36 = .
	sw	$0,40($fp)
	b	$L37
	nop

$L40:
	lw	$2,%got(arg0)($28)
	lw	$3,40($fp)
	sw	$3,0($2)
	nop
$L22 = .
	sw	$0,24($fp)
	b	$L23
	nop

$L26:
	lw	$2,%got(ret_val)($28)
	lw	$3,0($2)
	li	$2,1			# 0x1
	beq	$3,$2,$L77
	nop

	lw	$2,40($fp)
	addiu	$2,$2,1
	sw	$2,40($fp)
$L37:
	lw	$2,%got(field_length)($28)
	lw	$2,0($2)
	addiu	$3,$2,-1
	lw	$2,40($fp)
	slt	$2,$2,$3
	bne	$2,$0,$L40
	nop

	lw	$2,%got(ret_val)($28)
	sw	$0,0($2)
	b	$L39
	nop

$L80:
	nop
$L41 = .
	lw	$2,%got(head)($28)
	lw	$3,0($2)
	li	$2,-2147483648			# 0xffffffff80000000
	ori	$2,$2,0xff
	and	$2,$3,$2
	bgez	$2,$L42
	nop

	addiu	$2,$2,-1
	li	$3,-256			# 0xffffffffffffff00
	or	$2,$2,$3
	addiu	$2,$2,1
$L42:
	lw	$3,%got(queue)($28)
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,%got(ret_val)($28)
	sw	$3,0($2)
	lw	$2,%got(head)($28)
	lw	$2,0($2)
	addiu	$3,$2,1
	lw	$2,%got(head)($28)
	sw	$3,0($2)
	nop
$L43 = .
	lw	$2,%got(ret_val)($28)
	lw	$3,0($2)
	lw	$2,%got(current)($28)
	sw	$3,0($2)
	sw	$0,52($fp)
	b	$L53
	nop

$L47:
	sw	$0,48($fp)
	b	$L45
	nop

$L46:
	lw	$3,%got(init_state)($28)
	lw	$2,44($fp)
	sll	$4,$2,1
	lw	$2,48($fp)
	addu	$2,$4,$2
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$4,%got(fields)($28)
	lw	$2,44($fp)
	sll	$5,$2,1
	lw	$2,48($fp)
	addu	$2,$5,$2
	sll	$2,$2,2
	addu	$2,$4,$2
	sw	$3,0($2)
	lw	$2,48($fp)
	addiu	$2,$2,1
	sw	$2,48($fp)
$L45:
	lw	$2,48($fp)
	slt	$2,$2,2
	bne	$2,$0,$L46
	nop

	lw	$2,44($fp)
	addiu	$2,$2,1
	sw	$2,44($fp)
$L44:
	lw	$2,44($fp)
	slt	$2,$2,3
	bne	$2,$0,$L47
	nop

	lw	$2,%got(fields)($28)
	li	$3,-1			# 0xffffffffffffffff
	sw	$3,24($2)
	lw	$2,%got(fields)($28)
	sw	$0,28($2)
	lw	$2,%got(field_length)($28)
	lw	$2,0($2)
	addiu	$3,$2,1
	lw	$2,%got(field_length)($28)
	sw	$3,0($2)
	lw	$2,%got(queue)($28)
	sw	$0,0($2)
$L48:
	lw	$2,%got(head)($28)
	lw	$3,0($2)
	lw	$2,%got(tail)($28)
	lw	$2,0($2)
	slt	$2,$2,$3
	bne	$2,$0,$L78
	nop

	lw	$2,%got(finished)($28)
	lw	$2,0($2)
	bne	$2,$0,$L79
	nop

	lw	$2,%got(head)($28)
	lw	$3,0($2)
	lw	$2,%got(tail)($28)
	lw	$2,0($2)
	bne	$3,$2,$L80
	nop

	b	$L50
	nop

$L58:
	lw	$2,%got(current)($28)
	lw	$3,0($2)
	lw	$2,%got(arg1)($28)
	sw	$3,0($2)
	lw	$2,%got(arg2)($28)
	lw	$3,52($fp)
	sw	$3,0($2)
	nop
$L9 = .
	lw	$2,%got(blank_x)($28)
	sw	$0,0($2)
	lw	$2,%got(blank_y)($28)
	sw	$0,0($2)
	sw	$0,16($fp)
	b	$L10
	nop

$L18:
	lw	$2,%got(ret_val)($28)
	lw	$3,0($2)
	li	$2,1			# 0x1
	bne	$3,$2,$L54
	nop

	b	$L74
	nop

$L77:
	nop
$L39:
	lw	$2,%got(ret_val)($28)
	lw	$3,0($2)
	li	$2,1			# 0x1
	bne	$3,$2,$L81
	nop

	lw	$2,%got(field_length)($28)
	lw	$2,0($2)
	addiu	$3,$2,-1
	lw	$2,%got(field_length)($28)
	sw	$3,0($2)
	b	$L54
	nop

$L33:
	lw	$2,%got(ret_val)($28)
	lw	$3,0($2)
	li	$2,1			# 0x1
	bne	$3,$2,$L56
	nop

	lw	$2,%got(finished)($28)
	li	$3,1			# 0x1
	sw	$3,0($2)
	b	$L50
	nop

$L56:
	lw	$2,%got(tail)($28)
	lw	$2,0($2)
	addiu	$3,$2,-1
	li	$2,-2147483648			# 0xffffffff80000000
	ori	$2,$2,0xff
	and	$2,$3,$2
	bgez	$2,$L57
	nop

	addiu	$2,$2,-1
	li	$3,-256			# 0xffffffffffffff00
	or	$2,$2,$3
	addiu	$2,$2,1
$L57:
	move	$5,$2
	lw	$2,%got(field_length)($28)
	lw	$2,0($2)
	addiu	$3,$2,-1
	lw	$4,%got(queue)($28)
	sll	$2,$5,2
	addu	$2,$4,$2
	sw	$3,0($2)
	lw	$2,%got(tail)($28)
	lw	$2,0($2)
	addiu	$3,$2,1
	lw	$2,%got(tail)($28)
	sw	$3,0($2)
$L54:
	lw	$2,52($fp)
	addiu	$2,$2,1
	sw	$2,52($fp)
$L53:
	lw	$2,52($fp)
	slt	$2,$2,4
	bne	$2,$0,$L58
	nop

	b	$L48
	nop

$L78:
	nop
	b	$L50
	nop

$L79:
	nop
$L50:
	lw	$2,%got(finished)($28)
	lw	$2,0($2)
	beq	$2,$0,$L59
	nop

	sw	$0,56($fp)
	lw	$2,%got(field_length)($28)
	lw	$2,0($2)
	addiu	$2,$2,-1
	sw	$2,60($fp)
	b	$L60
	nop

$L61:
	lw	$3,56($fp)
	addiu	$2,$3,1
	sw	$2,56($fp)
	lw	$4,%got(fields)($28)
	lw	$2,60($fp)
	sll	$2,$2,5
	addu	$2,$4,$2
	lw	$4,24($2)
	lw	$5,%got(log_cmd)($28)
	sll	$2,$3,2
	addu	$2,$5,$2
	sw	$4,0($2)
	lw	$3,%got(fields)($28)
	lw	$2,60($fp)
	sll	$2,$2,5
	addu	$2,$3,$2
	lw	$2,28($2)
	sw	$2,60($fp)
$L60:
	lw	$2,60($fp)
	bne	$2,$0,$L61
	nop

	sw	$0,64($fp)
	b	$L62
	nop

$L70:
	lw	$3,%got(log_cmd)($28)
	lw	$2,64($fp)
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$2,0($2)
	li	$3,1			# 0x1
	beq	$2,$3,$L82
	nop

	slt	$3,$2,2
	beq	$3,$0,$L65
	nop

	beq	$2,$0,$L83
	nop

	b	$L69
	nop

$L65:
	li	$3,2			# 0x2
	beq	$2,$3,$L84
	nop

	li	$3,3			# 0x3
	beq	$2,$3,$L85
	nop

	b	$L69
	nop

$L82:
	nop
	b	$L69
	nop

$L83:
	nop
	b	$L69
	nop

$L84:
	nop
	b	$L69
	nop

$L85:
	nop
$L69:
	lw	$2,64($fp)
	addiu	$2,$2,1
	sw	$2,64($fp)
$L62:
	lw	$3,64($fp)
	lw	$2,56($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L70
	nop

$L59:
	move	$2,$0
	move	$sp,$fp
	lw	$fp,76($sp)
	addiu	$sp,$sp,80
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Debian 6.3.0-18) 6.3.0 20170516"
