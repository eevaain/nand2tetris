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
// if pressed != 0 screen is white



(LOOP)
    @KBD
    M=0 // clear screen buffer at start? 

    @KBD
    D=M // store keypress in register D

    @ISPRESSED
    D;JNE // if register D has content (keypress), then jump
          // this line of code acts as an event listener

    @LOOP
    0;JMP // jump back to start of LOOP


// note: 8192 addresses incluiding @SCREEN is bitmap of screen
(ISPRESSED)
    @SCREEN 
    M=-1 // replace D here with value for black

    @KBD
    D=M // store keypress in register D

    @LOOP
    D;JEQ // if register D has doesnt have content, then jump back to LOOP

    @ISPRESSED
    0;JMP // jump back to start of ISPRESSED
