%Chess Program
import GUI

%The display screen format
setscreen ("graphics:max;max,nobuttonbar")

include "GUIs.t"

%Game over tracking variable
var gameOver : boolean := false

%Input tracking + validation variables
var tempInput : string
var moveDone : boolean := false

%Movement variables
var movement : string
var letterMovement : int
letterMovement := 0
var numberMovement : int
numberMovement := 0
var whiteToMove : boolean := true


Font.Draw ("Chess 2-Player", maxx div 2, maxy - 100, font1, black)

include "imageImport.t"

include "spriteArrays.t"

include "pieceArrayInit.t"

include "isValidNotation.t"

include "isValidMove.t"

include "compareArray.t"

include "doMove.t"

Font.Draw ("Turing Chess", maxx div 2, maxy - 50, font1, black)

loop
    exit when gameOver = true
    put "Enter your move (or \"help\" for help): " ..
    get tempInput : *
    if Str.Lower (tempInput) = "help" then
	include "help.t"
    else
	loop
	    movement := Str.Upper (tempInput)
	    exit when isValidNotation (movement) and not compareArray (doMove (movement, whiteToMove, pieceArray), pieceArray)
	    cls
	    put "Invalid move. Enter your move (or \"help\" for help): " ..
	    get tempInput : *
	end loop
	pieceArray := doMove (movement, whiteToMove, pieceArray)
	%include "drawBoard.t"
	whiteToMove := not whiteToMove
    end if
end loop

