// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

// my pseudocode below (writing this before assembly implementation):

// (LOOP)
// if multiplier = 0 goto stop
// sum = sum + number
// multiplier = multiplier - 1
// goto LOOP
// 
// (STOP)
// R2 = sum


// REMEMBER: @n will always be equal to M
@R0
D=M
@number
M=D // variable number at some random address is equal to value stored in address R0 (RAM)

@R1
D=M
@multiplier
M=D // same as above, but for R1

@sum // sum starts at 0 
M=0 

(LOOP)
    @multiplier
    D=M
    @STOP 
    D;JEQ // if multiplier = 0 then goto STOP (its convention to write @STOP ontop of this condition)

    @sum
    D=M
    @number
    D=D+M
    @sum
    M=D // sum = sum + number

    @multiplier
    M=M-1 // multiplier = multiplier - 1
    @LOOP
    0;JMP // unconditional jump, goto (LOOP)

(STOP)
    @sum
    D=M
    @R2
    M=D // sum is stored in RAM[2]

(END)
    @END
    0;JMP // infinite loop between @END and 0;JMP 
