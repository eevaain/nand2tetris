// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

// fill entire memory map with either white or black pixels

// pseudocode underneath

// IN MAIN LOOP:
// if ISPRESSED != 0, screen is black

// IN PRESSED LOOP:
// if ISPRESSED = 0, screen is white


// REMEMBER: @n will always be equal to M
(LOOP)
    @KBD
    D=M // store keypress in register D

    /////////////////// EVENT LISTENERS /////////////////// 
    @ISNOTPRESSED
    D;JEQ // goto this if contents in register D = 0

    @ISPRESSED
    D;JNE // goto this if contents in register D != 0
    /////////////////// EVENT LISTENERS /////////////////// 

    @LOOP
    0;JMP // jump back to start of LOOP


// note: 8192 addresses including @SCREEN is bitmap of screen
(ISPRESSED)
    @SCREEN 
    M=-1 // replace D here with value for black (-1)

    @KBD
    D=M // store keypress in register D

    @LOOP
    D;JEQ // if register D has doesnt have content, then jump back to LOOP, otherwise continue

    @ISPRESSED
    0;JMP // jump back to start of ISPRESSED

(ISNOTPRESSED)
    @SCREEN
    M=0

    @KBD
    D=M

    @LOOP
    D;JNE

    @ISNOTPRESSED
    0;JMP 