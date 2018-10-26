//fill the first 32 registers after SCREEN with -1; fills the //entire first row of the screen black

@SCREEN
D=A
@arr
M=D //arr = SCREEN
@32
D=A
@row
M=D //n=32, 32 registers to fill
@counter
M=0 //counter=0

(ROW)
@counter
D=M
@row
D=D-M
@END
D;JEQ //if (n==counter) goto END

@arr
D=M
@counter
A=D+M
M=-1 //RAM[arr+counter] = -1
@counter
M=M+1
@ROW
0;JMP

(END)
@END 
0;JMP

//perfect DONT TOUCH