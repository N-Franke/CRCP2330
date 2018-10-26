//fill the first column with black

@SCREEN
D=A
@addr
M=D //addr= 16384
@256
D=A
@0
M=D  //entire column

@0
D=M
@n
M=D //n=RAM[0]
@i
M=0 //i=0

//loop conditions
(COLUMN)
@i
D=M
@n
D=D-M // 0-RAM[0]
@END
D;JGT //if i>n goto END

//action
@addr
A=M
M=-1 //fill the box black
@i
M=M+1 //i=i+1
@32
D=A
@addr
M=D+M //addr=addr +32
@COLUMN
0;JMP


//end loop
(END)
@END
0;JMP

//perfect DONT TOUCH