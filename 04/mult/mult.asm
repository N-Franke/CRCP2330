// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

@i //counter
M=0

@R1 //given input
D=M

(LOOP)
@i
D=M //D=i

@R1
D= R1-i
@END 
D;JGT //if R1>i goto END

@R0  //given new input
D=D+M //D= R1 + R0

@i
M=M+1 //increase counter
@LOOP
0;JMP //goto loop

(END)
@END
0;JMP
