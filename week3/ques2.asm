.data
		display1: .asciiz "\nSum of  all even positions: "
		display2: .asciiz "\nSum of  all odd positions: "
	
		integerArray: .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9

.text

.main:
	
	la $s1, integerArray # load address
	
	addi $t2, $zero, 40 # n = 40
	and $s0, $s0, $zero # int res1 = 0
	and $s2, $s0, $zero # int res2 = 0 
	
LOOP1 :
	add $t0, $t1, $s1
	lw  $t3, 0($t0)
	add $s0, $s0, $t3
	addi $t1, $t1, 8
	bne $t1, $t2, LOOP1

	and $t1, $t1, $zero # int i = 0 
LOOP2 :
	add $t0, $t1, $s1
	lw  $t3, 4($t0)
	add $s2, $s2, $t3
	addi $t1, $t1, 8
	bne $t1, $t2, LOOP2



	li $v0, 4
	la $a0, display1
	syscall

	li $v0, 1
	add $a0, $s0, $0
	syscall
	
	
	li $v0, 4
	la $a0, display2
	syscall

	li $v0, 1
	add $a0, $s2, $0
	syscall
	
# done 16/4/2019