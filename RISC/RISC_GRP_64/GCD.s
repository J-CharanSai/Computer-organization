add $z0, $z0
lw  $s0, 0($z0)
lw  $s1, 1($z0)
bz  $s0, 12
bz  $s1, 13
comp   $t0, $s0
comp   $t1, $s1
add    $t1, $s1
add    $t1, $s1
add    $t1, $t0
bltz   $t1, 2
add    $s1, $t0
b   4
comp   $t2, $s1 
add    $s0, $t2
b   4
sw   $s0, 2($z0)
b  18
sw   $s1, 2($z0)
add $z0, $z0