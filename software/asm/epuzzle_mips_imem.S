main:
  move  $sp,$0
  move  $28,$0
  lw  $12,%got(fields)($28)
  li  $2,2      # 0x2
  lw  $fp,%got(field_length)($28)
  sw  $2,0($12)
  li  $2,4      # 0x4
  sw  $2,4($12)
  li  $2,5      # 0x5
  lw  $21,0($fp)
  sw  $2,8($12)
  li  $2,3      # 0x3
  lw  $23,%got(queue)($28)
  sw  $2,12($12)
  li  $2,1      # 0x1
  addiu $21,$21,1
  sw  $2,16($12)
  li  $22,-2147483648     # 0xffffffff80000000
  li  $2,-1     # 0xffffffffffffffff
  lw  $17,%got(head)($28)
  lw  $19,%got(tail)($28)
  sw  $0,8($sp)
  sw  $0,20($12)
  sw  $2,24($12)
  sw  $0,28($12)
  sw  $21,0($fp)
  sw  $0,0($23)
  move  $5,$0
  addiu $22,$22,255
  li  $15,1     # 0x1
  li  $14,3     # 0x3
  li  $18,4     # 0x4
$L15:
  lw  $2,0($17)
  lw  $3,0($19)
  slt $2,$3,$2
  bne $2,$0,$L16
  move  $10,$21

$L86:
  lw  $2,8($sp)
  bne $2,$0,$L16
  nop

  lw  $3,0($17)
  lw  $2,0($19)
  beq $3,$2,$L16
  nop

  lw  $2,0($17)
  and $2,$2,$22
  bltz  $2,$L85
  li  $3,-256     # 0xffffffffffffff00

$L22:
  sll $2,$2,2
  addu  $2,$23,$2
  lw  $20,0($2)
  lw  $2,0($17)
  sll $25,$20,5
  addiu $2,$2,1
  addu  $25,$12,$25
  lw  $13,%got(dx)($28)
  lw  $24,%got(dy)($28)
  sw  $2,0($17)
  move  $11,$0
  addiu $16,$25,24
$L39:
  move  $6,$25
  move  $3,$0
  move  $2,$0
  move  $4,$0
$L25:
  lw  $7,0($6)
  beq $7,$0,$L54
  nop

  move  $7,$2
$L23:
  lw  $2,4($6)
  addiu $6,$6,8
  movz  $3,$4,$2
  movz  $7,$15,$2
  addiu $4,$4,1
  bne $4,$14,$L25
  move  $2,$7

  lw  $8,0($13)
  addu  $8,$7,$8
  sltu  $4,$8,2
  beq $4,$0,$L26
  nop

  lw  $4,0($24)
  addu  $4,$3,$4
  sltu  $6,$4,3
  beq $6,$0,$L26
  nop

  sll $7,$10,5
  addu  $9,$12,$7
  move  $6,$9
  move  $5,$25
$L29:
  lw  $21,0($5)
  addiu $5,$5,8
  sw  $21,0($6)
  lw  $21,-4($5)
  addiu $6,$6,8
  bne $16,$5,$L29
  sw  $21,-4($6)

  sll $5,$10,2
  addu  $4,$5,$4
  sll $4,$4,1
  addu  $3,$5,$3
  addu  $4,$4,$8
  sll $3,$3,1
  sll $4,$4,2
  addu  $4,$12,$4
  addu  $2,$3,$2
  sll $2,$2,2
  lw  $3,0($4)
  addu  $5,$12,$7
  addu  $2,$12,$2
  sw  $3,0($2)
  sw  $11,24($5)
  sw  $20,28($5)
  addiu $21,$10,1
  blez  $10,$L31
  sw  $0,0($4)

  addiu $7,$7,24
  lw  $6,%got(fields)($28)
  addu  $7,$12,$7
  move  $8,$0
$L52:
  move  $2,$9
  move  $3,$6
$L32:
  lw  $5,0($3)
  lw  $4,0($2)
  bne $5,$4,$L33
  nop

  lw  $4,4($2)
  lw  $5,4($3)
  bne $5,$4,$L33
  addiu $2,$2,8

  bne $7,$2,$L32
  addiu $3,$3,8

$L82:
  li  $5,1      # 0x1
$L26:
  addiu $11,$11,1
  addiu $13,$13,4
  bne $11,$18,$L39
  addiu $24,$24,4

  lw  $2,0($17)
  lw  $3,0($19)
  slt $2,$3,$2
  beq $2,$0,$L86
  nop

$L16:
  bne $5,$0,$L87
  nop

$L19:
  lw  $2,8($sp)
  beq $2,$0,$L60
  nop

  lw  $2,0($fp)
  addiu $2,$2,-1
  beq $2,$0,$L89
  lw  $fp,52($sp)

  lw  $4,%got(log_cmd)($28)
  move  $3,$0
$L44:
  sll $2,$2,5
  addu  $2,$12,$2
  lw  $5,24($2)
  lw  $2,28($2)
  sw  $5,0($4)
  addiu $3,$3,1
  bne $2,$0,$L44
  addiu $4,$4,4

  addiu $2,$2,1
$L90:
  bne $3,$2,$L90
  addiu $2,$2,1

$L60:
$L89:
  j  end

$L33:
  addiu $8,$8,1
  bne $10,$8,$L52
  addiu $6,$6,32

$L31:
  lw  $2,%got(TARGET_FIELD)($28)
  addiu $5,$2,24
$L35:
  lw  $4,0($9)
  lw  $3,0($2)
  bne $4,$3,$L37
  nop

  lw  $3,4($2)
  lw  $4,4($9)
  bne $4,$3,$L37
  addiu $2,$2,8

  bne $2,$5,$L35
  addiu $9,$9,8

  li  $2,1      # 0x1
  sw  $2,8($sp)
  b $L15
  li  $5,1      # 0x1

$L54:
  b $L23
  move  $3,$4

$L37:
  lw  $2,0($19)
  addiu $2,$2,-1
  and $2,$2,$22
  bltz  $2,$L88
  li  $3,-256     # 0xffffffffffffff00

$L53:
  lw  $3,0($19)
  sll $2,$2,2
  addu  $2,$23,$2
  addiu $3,$3,1
  sw  $10,0($2)
  sw  $3,0($19)
  b $L82
  move  $10,$21

$L85:
  addiu $2,$2,-1
  or  $2,$2,$3
  b $L22
  addiu $2,$2,1

$L88:
  addiu $2,$2,-1
  or  $2,$2,$3
  b $L53
  addiu $2,$2,1

$L87:
  b $L19
  sw  $10,0($fp)

end:
  j end
