# Assignment 	: 2
# Problem No. 	: 4
# Semester No. 	: 5
# Group No.	 	: 64
# Names of group Members : 1. Jatoth Charan Sai , 2. Tirupathi Suguna Bhaskar
#
# finding if a positive number(a) is perfect or not
# FOR looping form 1 to a-1
# if a number is a proper divisior of a then add them to sum(variable)
# finally at the end of the loop Check if sum is equal to a, if so then it's a perfect number, other wise its notperfect.
#

########### data ###########
.data

	prompt:		.asciiz "Enter the positive integer: "
	Eror:		.asciiz "Invalid Input"
	perfect:	.asciiz "Entered number is a perfect number"
	notperfect:	.asciiz "Entered number is not a perfect number"
	newline: 	.asciiz "\n"

########### text ###########
	.text 
	.globl main

# main program
# program variables
# a:	$t0
# i: 	$s0
# sum: 	$t2

main:
		addi $t1, 35617
		addu $t2, $t1, $t1
		li $v0, 4
		move $a0, $t2
		syscall

		j 		Exit 						# jump to Exit (exit program )


Exit:
		li 		$v0, 10 
		syscall	 					# End program

