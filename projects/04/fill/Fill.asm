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

// Put your code here.

@24576 // SCREEN + 256 * 32; 256 rows physical, each row is 32 consecutive 16-bit words 
D=A
@end_row
M=D

(LOOP)
    @SCREEN
    D=A
    @current_row
    M=D

    @color
    M=0

    @KBD
    D=M
    @PRESSED
    D;JNE
    @UPDATE_SCREEN
    0;JMP

(PRESSED)
    @color
    M=-1

(UPDATE_SCREEN)
    @current_row
    D=M
    @end_row
    D=M-D

    @LOOP
    D;JEQ

    @color
    D=M
    @current_row
    A=M
    M=D
    @current_row
    M=M+1

    @UPDATE_SCREEN
    0;JMP
