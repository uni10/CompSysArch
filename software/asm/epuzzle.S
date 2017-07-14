	.text
	.file	"epuzzle.c"
	.globl	output
	.p2align	2
	.type	output,@function
output:
	addi	x2, x2, -16
	sw	x8, 12(x2)
	add	x8, x2, x0
	add	x2, x8, x0
	lw	x8, 12(x2)
	addi	x2, x2, 16
	ret
Lfunc_end0:
	.size	output, Lfunc_end0-output

	.globl	main
	.p2align	2
	.type	main,@function
main:
	addi	x2, x2, -108
	sw	x1, 104(x2)
	sw	x8, 100(x2)
	sw	x27, 96(x2)
	sw	x26, 92(x2)
	sw	x25, 88(x2)
	sw	x24, 84(x2)
	sw	x23, 80(x2)
	sw	x22, 76(x2)
	sw	x21, 72(x2)
	sw	x20, 68(x2)
	sw	x19, 64(x2)
	sw	x18, 60(x2)
	sw	x9, 56(x2)
	add	x8, x2, x0
	sw	x0, 40(x8)
	lui	x5, %hi(fields)
	addi	x5, x5, %lo(fields)
	li	x6, 2
	sw	x6, 0(x5)
	li	x7, 4
	sw	x7, 4(x5)
	li	x10, 5
	sw	x10, 8(x5)
	li	x10, 3
	sw	x10, 12(x5)
	li	x10, 1
	sw	x10, 16(x5)
	sw	x0, 20(x5)
	li	x11, -1
	sw	x11, 24(x5)
	sw	x0, 28(x5)
	lui	x11, %hi(field_length)
	addi	x12, x11, %lo(field_length)
	lw	x11, 0(x12)
	addi	x25, x11, 1
	sw	x12, 28(x8)
	sw	x25, 0(x12)
	lui	x11, %hi(queue)
	addi	x11, x11, %lo(queue)
	sw	x11, 36(x8)
	sw	x0, 0(x11)
	lui	x11, %hi(head)
	addi	x15, x11, %lo(head)
	lw	x11, 0(x15)
	lui	x13, %hi(tail)
	addi	x14, x13, %lo(tail)
	lw	x13, 0(x14)
	blt	x13, x11, LBB1_44
	lui	x11, %hi(TARGET_FIELD)
	addi	x11, x11, %lo(TARGET_FIELD)
	lw	x12, 20(x11)
	sw	x12, 0(x8)
	lw	x12, 16(x11)
	sw	x12, 4(x8)
	lw	x12, 12(x11)
	sw	x12, 12(x8)
	lw	x12, 8(x11)
	sw	x12, 16(x8)
	lw	x12, 4(x11)
	sw	x12, 20(x8)
	lw	x11, 0(x11)
	sw	x11, 24(x8)
	li	x11, 1073741568
	sw	x11, 32(x8)
	lui	x11, %hi(dy)
	addi	x1, x11, %lo(dy)
	sw	x15, 8(x8)
	j	LBB1_43
LBB1_2:
	lw	x11, 0(x15)
	lw	x13, 0(x14)
	beq	x11, x13, LBB1_44
	lw	x11, 0(x15)
	srai	x13, x11, 31
	srli	x13, x13, 24
	add	x13, x11, x13
	lw	x12, 32(x8)
	and	x13, x13, x12
	sub	x11, x11, x13
	slli	x11, x11, 2
	lw	x12, 36(x8)
	add	x11, x12, x11
	lw	x9, 0(x11)
	lw	x11, 0(x15)
	addi	x11, x11, 1
	sw	x11, 0(x15)
	slli	x11, x9, 5
	add	x18, x5, x11
	addi	x19, x18, 20
	addi	x20, x18, 16
	addi	x21, x18, 12
	addi	x22, x18, 8
	addi	x23, x18, 4
	addi	x24, x0, 0
LBB1_4:
	addi	x26, x25, 0
	lw	x25, 0(x21)
	lw	x15, 0(x22)
	bne	x0, x25, LBB1_6
	addi	x27, x10, 0
	j	LBB1_7
LBB1_6:
	xor	x11, x15, x0
	sltiu	x27, x11, 1
LBB1_7:
	lw	x16, 0(x19)
	bne	x0, x16, LBB1_9
	addi	x27, x6, 0
LBB1_9:
	lw	x17, 0(x20)
	bne	x0, x17, LBB1_11
	addi	x27, x6, 0
LBB1_11:
	slli	x29, x24, 2
	add	x11, x1, x29
	lw	x11, 0(x11)
	lw	x28, 0(x23)
	bne	x0, x15, LBB1_13
	addi	x13, x0, 0
	j	LBB1_14
LBB1_13:
	xor	x13, x28, x0
	sltiu	x13, x13, 1
LBB1_14:
	bne	x0, x25, LBB1_16
	addi	x13, x10, 0
LBB1_16:
	bne	x0, x17, LBB1_18
	addi	x13, x0, 0
LBB1_18:
	bne	x0, x16, LBB1_20
	addi	x13, x10, 0
LBB1_20:
	lui	x30, %hi(dx)
	addi	x30, x30, %lo(dx)
	add	x29, x30, x29
	lw	x29, 0(x29)
	add	x29, x13, x29
	bltu	x10, x29, LBB1_39
	add	x11, x27, x11
	li	x30, 2
	bltu	x30, x11, LBB1_39
	slli	x30, x26, 5
	add	x30, x5, x30
	lw	x12, 0(x18)
	sw	x12, 0(x30)
	sw	x28, 4(x30)
	sw	x15, 8(x30)
	sw	x25, 12(x30)
	sw	x17, 16(x30)
	sw	x16, 20(x30)
	sw	x24, 24(x30)
	sw	x9, 28(x30)
	addi	x25, x26, 1
	lw	x12, 28(x8)
	sw	x25, 0(x12)
	slli	x12, x27, 3
	add	x12, x30, x12
	slli	x13, x13, 2
	add	x12, x12, x13
	slli	x11, x11, 3
	add	x11, x30, x11
	slli	x13, x29, 2
	add	x11, x11, x13
	lw	x13, 0(x11)
	sw	x13, 0(x12)
	sw	x0, 0(x11)
	addi	x15, x30, 20
	addi	x16, x30, 16
	addi	x17, x30, 12
	addi	x28, x30, 8
	addi	x13, x30, 4
	lw	x29, 0(x30)
	li	x27, 1
	blt	x26, x27, LBB1_31
	addi	x11, x5, 12
	addi	x30, x0, 0
LBB1_24:
	lw	x12, -12(x11)
	bne	x12, x29, LBB1_30
	lw	x12, 0(x13)
	lw	x31, -8(x11)
	bne	x31, x12, LBB1_30
	lw	x12, 0(x28)
	lw	x31, -4(x11)
	bne	x31, x12, LBB1_30
	lw	x12, 0(x17)
	lw	x31, 0(x11)
	bne	x31, x12, LBB1_30
	lw	x12, 0(x16)
	lw	x31, 4(x11)
	bne	x31, x12, LBB1_30
	lw	x12, 0(x15)
	lw	x31, 8(x11)
	beq	x31, x12, LBB1_38
LBB1_30:
	addi	x11, x11, 32
	addi	x30, x30, 1
	blt	x30, x26, LBB1_24
LBB1_31:
	lw	x11, 24(x8)
	bne	x29, x11, LBB1_37
	lw	x11, 0(x13)
	lw	x12, 20(x8)
	bne	x11, x12, LBB1_37
	lw	x11, 0(x28)
	lw	x12, 16(x8)
	bne	x11, x12, LBB1_37
	lw	x11, 0(x17)
	lw	x12, 12(x8)
	bne	x11, x12, LBB1_37
	lw	x11, 0(x16)
	lw	x12, 4(x8)
	bne	x11, x12, LBB1_37
	lw	x11, 0(x15)
	lw	x12, 0(x8)
	beq	x11, x12, LBB1_42
LBB1_37:
	lw	x11, 0(x14)
	addi	x11, x11, -1
	srai	x12, x11, 31
	srli	x12, x12, 24
	add	x12, x11, x12
	lw	x13, 32(x8)
	and	x12, x12, x13
	sub	x11, x11, x12
	slli	x11, x11, 2
	lw	x12, 36(x8)
	add	x11, x12, x11
	sw	x26, 0(x11)
	lw	x11, 0(x14)
	addi	x11, x11, 1
	sw	x11, 0(x14)
	j	LBB1_40
LBB1_38:
	lw	x11, 28(x8)
	sw	x26, 0(x11)
LBB1_39:
	addi	x25, x26, 0
LBB1_40:
	addi	x24, x24, 1
	blt	x24, x7, LBB1_4
LBB1_41:
	lw	x15, 8(x8)
	lw	x11, 0(x15)
	lw	x12, 0(x14)
	bge	x12, x11, LBB1_43
	j	LBB1_44
LBB1_42:
	sw	x27, 40(x8)
	j	LBB1_41
LBB1_43:
	lw	x11, 40(x8)
	beq	x11, x0, LBB1_2
LBB1_44:
	lw	x6, 40(x8)
	beq	x6, x0, LBB1_47
	addi	x6, x25, -1
	beq	x6, x0, LBB1_47
LBB1_46:
	slli	x6, x6, 5
	add	x6, x5, x6
	lw	x6, 28(x6)
	bne	x6, x0, LBB1_46
LBB1_47:
	addi	x10, x0, 0
	add	x2, x8, x0
	lw	x9, 56(x2)
	lw	x18, 60(x2)
	lw	x19, 64(x2)
	lw	x20, 68(x2)
	lw	x21, 72(x2)
	lw	x22, 76(x2)
	lw	x23, 80(x2)
	lw	x24, 84(x2)
	lw	x25, 88(x2)
	lw	x26, 92(x2)
	lw	x27, 96(x2)
	lw	x8, 100(x2)
	lw	x1, 104(x2)
	addi	x2, x2, 108
	ret
Lfunc_end1:
	.size	main, Lfunc_end1-main

	.type	dy,@object
	.data
	.globl	dy
	.p2align	2
dy:
	.long	4294967295
	.long	0
	.long	1
	.long	0
	.size	dy, 16

	.type	dx,@object
	.globl	dx
	.p2align	2
dx:
	.long	0
	.long	1
	.long	0
	.long	4294967295
	.size	dx, 16

	.type	field_length,@object
	.section	.bss,"aw",@nobits
	.globl	field_length
	.p2align	2
field_length:
	.long	0
	.size	field_length, 4

	.type	TARGET_FIELD,@object
	.data
	.globl	TARGET_FIELD
	.p2align	2
TARGET_FIELD:
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	0
	.long	255
	.long	0
	.size	TARGET_FIELD, 32

	.type	queue,@object
	.section	.bss,"aw",@nobits
	.globl	queue
	.p2align	2
queue:
	.space	1024
	.size	queue, 1024

	.type	head,@object
	.globl	head
	.p2align	2
head:
	.long	0
	.size	head, 4

	.type	tail,@object
	.data
	.globl	tail
	.p2align	2
tail:
	.long	1
	.size	tail, 4

	.type	fields,@object
	.comm	fields,23040,4

