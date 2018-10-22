@5
D=A

@counter
M=D

(LOOP)
@7
D=A

@counter
A=M
M=D

@counter
M=M-1

@counter
D=M

@LOOP
D; JGT

(END)
@END
0;JMP