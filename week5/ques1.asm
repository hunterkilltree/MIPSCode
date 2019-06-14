.data
	display1: .asciiz "Input the integer number : "
	newline: .asciiz "\n"
	display2: .asciiz "Sum of all positive number already input: " 

.text

.main: 

LOOP:
	li $v0, 4 
	la $a0, display1
	syscall
	
	li $v0, 5 # get input
	syscall
	
	add $t1, $zero, $v0 # add input to $t1
	slti $t0, $t1, 0 #  $t1 < 0 ? 1 : 0
	bne $t0, $zero, EXIT
	
	add $s0, $s0, $t1 # $s0 = $s0 + $st1
	j LOOP

EXIT:
	li $v0, 4 
	la $a0, newline
	syscall
	
	li $v0, 4 
	la $a0, display2
	syscall
	
	li $v0, 1
	add $a0, $s0, $0
	syscall
#done 24/4/2019