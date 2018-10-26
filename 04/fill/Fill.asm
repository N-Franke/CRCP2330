// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

@8192
D=A
@counter
M=D  //counter=8192, fill the screen
@KBD
M=0  //KBD=0

(LOOP1)
@n
M=0

(LOOP2)
@KBD
D=M
//if n=0, go to COND1
@COND1
D; JEQ
//if n!=0, go to COND2
@COND2
D; JNE 

(COND1)
//if n=0, screen is white
@n
D=M
@SCREEN
A=A+D
M=0
@n
M=M+1
@counter
D=D-M
@LOOP1  //if counter is 0, go back to main loop
D;JEQ
@LOOP2  //otherwise go to second loop
0;JMP

(COND2)
//if n!=0, screen is black
@n
D=M
@SCREEN
A=A+D
M=-1
@n
M=M+1
@counter
D=D-M
@LOOP1  //if counter is 0, go back to main loop
D;JEQ
@LOOP2 //otherwise keep drawing screen black
0;JMP



