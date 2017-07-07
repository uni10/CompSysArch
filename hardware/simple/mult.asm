	lw $1,0($0)
	lw $2,4($0)
	add $3,$0,$0
loop:	add $3,$3,$2
	addi $1,$1,-1
	bne $1,$0,loop
	sw $3,8($0)
end:	j end
