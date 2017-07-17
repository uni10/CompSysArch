	addi $1,$0,40
	add $2,$0,$0
loop:	addi $1,$1,-4
	lw $3,0($1)
	add $2,$2,$3
	bne $1,$0,loop
	sw $3,0x50($0)
end:	j end
