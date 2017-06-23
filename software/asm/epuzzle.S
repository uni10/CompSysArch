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
	addi	x2, x2, -128
	sw	x1, 124(x2)
	sw	x8, 120(x2)
	sw	x27, 116(x2)
	sw	x26, 112(x2)
	sw	x25, 108(x2)
	sw	x24, 104(x2)
	sw	x23, 100(x2)
	sw	x22, 96(x2)
	sw	x21, 92(x2)
	sw	x20, 88(x2)
	sw	x19, 84(x2)
	sw	x18, 80(x2)
	sw	x9, 76(x2)
	add	x8, x2, x0
	lui	x5, %hi(fields)
	addi	x13, x5, %lo(fields)
	li	x14, 2
	sb	x14, 0(x13)
	li	x15, 4
	sb	x15, 1(x13)
	li	x5, 5
	sb	x5, 2(x13)
	li	x5, 3
	sb	x5, 3(x13)
	li	x16, 1
	sb	x16, 4(x13)
	sb	x0, 5(x13)
	li	x5, 255
	sb	x5, 6(x13)
	sh	x0, 8(x13)
	lui	x5, %hi(field_length)
	addi	x22, x5, %lo(field_length)
	lhu	x5, 0(x22)
	addi	x20, x5, 1
	sh	x20, 0(x22)
	lui	x5, %hi(queue)
	addi	x12, x5, %lo(queue)
	sh	x0, 0(x12)
	lui	x5, %hi(tail)
	addi	x6, x5, %lo(tail)
	lw	x31, 0(x6)
	lui	x5, %hi(head)
	addi	x5, x5, %lo(head)
	lw	x7, 0(x5)
	bgeu	x7, x31, LBB1_43
	sw	x5, 4(x8)
	sw	x6, 40(x8)
	lui	x5, %hi(TARGET_FIELD)
	addi	x5, x5, %lo(TARGET_FIELD)
	lhu	x6, 4(x5)
	sw	x6, 12(x8)
	srli	x6, x6, 8
	sw	x6, 8(x8)
	lhu	x6, 2(x5)
	sw	x6, 24(x8)
	srli	x6, x6, 8
	sw	x6, 16(x8)
	lhu	x5, 0(x5)
	sw	x5, 44(x8)
	srli	x5, x5, 8
	sw	x5, 32(x8)
	li	x5, 10
	sw	x5, 20(x8)
	sw	x22, 52(x8)
	sw	x12, 48(x8)
LBB1_2:
	andi	x5, x7, 255
	slli	x5, x5, 1
	add	x5, x12, x5
	lhu	x10, 0(x5)
	sw	x10, 60(x8)
	lw	x11, 20(x8)
	jal	x1, __mulsi3
	add	x5, x13, x10
	addi	x25, x5, 5
	addi	x26, x5, 4
	addi	x27, x5, 3
	addi	x30, x5, 2
	sw	x5, 56(x8)
	addi	x19, x5, 1
	addi	x7, x7, 1
	sw	x7, 28(x8)
	addi	x18, x0, 0
	j	LBB1_4
LBB1_3:
	lw	x22, 52(x8)
	sh	x21, 0(x22)
	addi	x20, x21, 0
	lw	x12, 48(x8)
	j	LBB1_40
LBB1_4:
	addi	x21, x20, 0
	lbu	x10, 0(x27)
	lbu	x7, 0(x30)
	bne	x0, x10, LBB1_6
	addi	x6, x16, 0
	j	LBB1_7
LBB1_6:
	xor	x5, x7, x0
	sltiu	x6, x5, 1
LBB1_7:
	lbu	x5, 0(x25)
	bne	x0, x5, LBB1_9
	addi	x6, x14, 0
LBB1_9:
	lbu	x11, 0(x26)
	bne	x0, x11, LBB1_11
	addi	x6, x14, 0
LBB1_11:
	lbu	x17, 0(x19)
	bne	x0, x7, LBB1_13
	addi	x7, x0, 0
	j	LBB1_14
LBB1_13:
	xor	x7, x17, x0
	sltiu	x7, x7, 1
LBB1_14:
	bne	x0, x10, LBB1_16
	addi	x7, x16, 0
LBB1_16:
	bne	x0, x11, LBB1_18
	addi	x7, x0, 0
LBB1_18:
	bne	x0, x5, LBB1_20
	addi	x7, x16, 0
LBB1_20:
	lui	x5, %hi(dx)
	addi	x5, x5, %lo(dx)
	add	x5, x5, x18
	lbu	x5, 0(x5)
	add	x5, x5, x7
	andi	x29, x5, 255
	bgeu	x16, x29, LBB1_22
	addi	x20, x21, 0
	j	LBB1_40
LBB1_22:
	lui	x5, %hi(dy)
	addi	x5, x5, %lo(dy)
	add	x5, x5, x18
	lbu	x5, 0(x5)
	add	x5, x5, x6
	andi	x9, x5, 255
	li	x28, 2
	bgeu	x28, x9, LBB1_24
	addi	x20, x21, 0
	j	LBB1_40
LBB1_24:
	lw	x5, 56(x8)
	lbu	x20, 0(x5)
	li	x5, 65535
	and	x10, x21, x5
	li	x12, 10
	addi	x11, x12, 0
	jal	x1, __mulsi3
	add	x10, x13, x10
	sb	x20, 0(x10)
	sb	x17, 1(x10)
	lbu	x11, 0(x30)
	sb	x11, 2(x10)
	lbu	x11, 0(x27)
	sb	x11, 3(x10)
	lbu	x11, 0(x26)
	sb	x11, 4(x10)
	lbu	x11, 0(x25)
	sb	x11, 5(x10)
	sb	x18, 6(x10)
	lw	x11, 60(x8)
	sh	x11, 8(x10)
	addi	x20, x21, 1
	sh	x20, 0(x22)
	slli	x6, x6, 1
	add	x6, x10, x6
	add	x6, x6, x7
	slli	x7, x9, 1
	add	x7, x10, x7
	add	x7, x7, x29
	lbu	x10, 0(x7)
	sb	x10, 0(x6)
	sb	x0, 0(x7)
	and	x23, x20, x5
	addi	x7, x23, -1
	addi	x10, x7, 0
	addi	x11, x12, 0
	jal	x1, __mulsi3
	add	x9, x13, x10
	bltu	x23, x28, LBB1_33
	li	x11, 10
	addi	x10, x7, 0
	jal	x1, __mulsi3
	add	x6, x13, x10
	addi	x10, x6, 5
	sw	x10, 36(x8)
	addi	x17, x6, 4
	addi	x22, x6, 3
	addi	x28, x6, 2
	addi	x6, x6, 1
	lbu	x24, 0(x9)
	addi	x12, x0, 0
	addi	x29, x0, 0
LBB1_26:
	li	x11, 10
	addi	x10, x12, 0
	jal	x1, __mulsi3
	add	x10, x13, x10
	lbu	x10, 0(x10)
	andi	x11, x24, 255
	bne	x10, x11, LBB1_32
	li	x11, 10
	addi	x10, x12, 0
	jal	x1, __mulsi3
	add	x10, x13, x10
	lbu	x10, 1(x10)
	lbu	x11, 0(x6)
	bne	x10, x11, LBB1_32
	li	x11, 10
	addi	x10, x12, 0
	jal	x1, __mulsi3
	add	x10, x13, x10
	lbu	x10, 2(x10)
	lbu	x11, 0(x28)
	bne	x10, x11, LBB1_32
	li	x11, 10
	addi	x10, x12, 0
	jal	x1, __mulsi3
	add	x10, x13, x10
	lbu	x10, 3(x10)
	lbu	x11, 0(x22)
	bne	x10, x11, LBB1_32
	li	x11, 10
	addi	x10, x12, 0
	jal	x1, __mulsi3
	add	x10, x13, x10
	lbu	x10, 4(x10)
	lbu	x11, 0(x17)
	bne	x10, x11, LBB1_32
	li	x11, 10
	addi	x10, x12, 0
	jal	x1, __mulsi3
	add	x10, x13, x10
	lbu	x10, 5(x10)
	lw	x11, 36(x8)
	lbu	x11, 0(x11)
	beq	x10, x11, LBB1_3
LBB1_32:
	addi	x29, x29, 1
	and	x12, x29, x5
	blt	x12, x7, LBB1_26
LBB1_33:
	lw	x6, 44(x8)
	andi	x6, x6, 255
	lbu	x10, 0(x9)
	bne	x10, x6, LBB1_39
	li	x11, 10
	addi	x10, x7, 0
	jal	x1, __mulsi3
	add	x6, x13, x10
	lbu	x6, 1(x6)
	lw	x10, 32(x8)
	bne	x6, x10, LBB1_39
	li	x11, 10
	addi	x10, x7, 0
	jal	x1, __mulsi3
	add	x6, x13, x10
	lbu	x6, 2(x6)
	lw	x10, 24(x8)
	andi	x10, x10, 255
	bne	x6, x10, LBB1_39
	li	x11, 10
	addi	x10, x7, 0
	jal	x1, __mulsi3
	add	x6, x13, x10
	lbu	x6, 3(x6)
	lw	x10, 16(x8)
	bne	x6, x10, LBB1_39
	li	x11, 10
	addi	x10, x7, 0
	jal	x1, __mulsi3
	add	x6, x13, x10
	lbu	x6, 4(x6)
	lw	x10, 12(x8)
	andi	x10, x10, 255
	bne	x6, x10, LBB1_39
	li	x11, 10
	addi	x10, x7, 0
	jal	x1, __mulsi3
	add	x6, x13, x10
	lbu	x6, 5(x6)
	lw	x7, 8(x8)
	beq	x6, x7, LBB1_44
LBB1_39:
	add	x5, x23, x5
	addi	x6, x31, 255
	andi	x6, x6, 255
	slli	x6, x6, 1
	lw	x12, 48(x8)
	add	x6, x12, x6
	sh	x5, 0(x6)
	addi	x31, x31, 1
	lw	x5, 40(x8)
	sw	x31, 0(x5)
	lw	x22, 52(x8)
LBB1_40:
	addi	x18, x18, 1
	bltu	x18, x15, LBB1_4
	lw	x7, 28(x8)
	bltu	x7, x31, LBB1_2
	lw	x5, 4(x8)
	sw	x7, 0(x5)
LBB1_43:
	addi	x10, x0, 0
	add	x2, x8, x0
	lw	x9, 76(x2)
	lw	x18, 80(x2)
	lw	x19, 84(x2)
	lw	x20, 88(x2)
	lw	x21, 92(x2)
	lw	x22, 96(x2)
	lw	x23, 100(x2)
	lw	x24, 104(x2)
	lw	x25, 108(x2)
	lw	x26, 112(x2)
	lw	x27, 116(x2)
	lw	x8, 120(x2)
	lw	x1, 124(x2)
	addi	x2, x2, 128
	ret
LBB1_44:
	lw	x6, 4(x8)
	lw	x7, 28(x8)
	sw	x7, 0(x6)
	add	x7, x23, x5
	and	x6, x7, x5
	beq	x6, x0, LBB1_43
	li	x6, 10
LBB1_46:
	and	x10, x7, x5
	addi	x11, x6, 0
	jal	x1, __mulsi3
	add	x7, x13, x10
	lhu	x7, 8(x7)
	bne	x7, x0, LBB1_46
	j	LBB1_43
Lfunc_end1:
	.size	main, Lfunc_end1-main

	.type	dy,@object
	.data
	.globl	dy
dy:
	.asciz	"\377\000\001"
	.size	dy, 4

	.type	dx,@object
	.globl	dx
dx:
	.ascii	"\000\001\000\377"
	.size	dx, 4

	.type	field_length,@object
	.section	.bss,"aw",@nobits
	.globl	field_length
	.p2align	1
field_length:
	.short	0
	.size	field_length, 2

	.type	TARGET_FIELD,@object
	.data
	.globl	TARGET_FIELD
	.p2align	1
TARGET_FIELD:
	.ascii	"\001\002"
	.ascii	"\003\004"
	.asciz	"\005"
	.byte	255
	.space	1
	.short	0
	.size	TARGET_FIELD, 10

	.type	queue,@object
	.section	.bss,"aw",@nobits
	.globl	queue
	.p2align	1
queue:
	.space	512
	.size	queue, 512

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
	.comm	fields,7200,2

