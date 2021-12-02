add $z0, $z0
lw  $a0, 0($z0)
comp $s0, $a0
add $s0, $a0
addi $s0, 2
comp $t1, $s0 
add $t1, $a0
bltz $t1, 21
lw $t0, 0($s0)
compi $s1, 1
add $s1, $s0
comp $t2, $s1 
bltz $t2, 6
b  24
lw $t3, 0($s1)
comp $t3, $t3
add $t3, $t0
bltz $t3, 1
b  24
lw $t4, 0($s1) 
addi $s1, 1
sw $t4, 0($s1)
addi $s1, -2
b 11
addi  $s1, 1
sw $t0, 0($s1)
addi $s1, -1
addi $s0, 1
b  5
add $z0, $z0