// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

  @R0
  D=M
  @R1
  D=D-M
  @R0_LESS_THAN_R1
  D;JLE
  @R1_LESS_THAN_R0
  D;JGT

  (COMPUTE)
    @i
    M=0 // set i = 0
    @R2
    M=0 // set R2 = 0

    (LOOP)
      @i
      D=M // set D = i 

      @times
      D=D-M // load R0, set D = D - R0
      @END
      D;JEQ

      @n
      D=M // set D = R1
      @R2 
      M=M+D // set R2 = R2 + D

      @i
      M=M+1 // set i = i + 1

      @LOOP
      0;JMP

  (R1_LESS_THAN_R0) // set times = R1, n = R0
    @R1
    D=M
    @times
    M=D
    @R0
    D=M
    @n
    M=D
    @COMPUTE
    0;JMP

  (R0_LESS_THAN_R1) // set times = R0, n = R1
    @R0
    D=M
    @times 
    M=D
    @R1
    D=M
    @n
    M=D  
    @COMPUTE
    0;JMP

  (END)
    @END
    0;JMP

