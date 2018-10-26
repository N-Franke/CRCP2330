//Keyboard functionality
//variable definition

//@KBD
//D=A
//@END
//D; JNE

@KBD
M=0

(LOOP1)
//if n=0, go to COND1
@KBD
D=M
@COND1
D; JEQ

//if n!=0, go to COND2
//@KBD
//D=M
@COND2
D; JNE

(COND1)
//if n=0, screen is white
@SCREEN
M=0
@LOOP1
0; JMP

(COND2)
//if n!=0, screen is black
@SCREEN
M=-1
@LOOP1
0; JMP
 


