// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

@R1
D=M
@counter
M=D

(LOOP)
@counter
D=M
@EXIT
D;JEQ
@R2
D=M
@R0
D=D+M
@R2
M=D
@counter
M=M-1
@LOOP
0;JMP

(EXIT)
@EXIT
0;JMP
