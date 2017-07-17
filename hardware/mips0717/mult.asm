	lw $1,0x0($0)
	lw $2,0x4($0)
	add $3,$0,$0
loop:	add $3,$3,$2
	addi $1,$1,-1
	bne $1,$0,loop
	sw $3,0x50($0)
end:	j end
