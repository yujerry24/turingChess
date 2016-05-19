%Chess Program
import GUI

%The display screen format
setscreen ("graphics:max;max,nobuttonbar")

include "GUIs.t"

%Input tracking + validation variables
var tempInput : string

%Movement variables
var movement : string
var whiteToMove : boolean := true

include "imageImport.t"

include "pieceArrayInit.t"

include "isValidNotation.t"

include "compareArray.t"

include "doMove.t"

include "drawBoard.t"

Font.Draw ("Turing Chess", maxx div 2, maxy - 50, font1, black)

loop
    drawBoard (pieceArray)
    %exit when checkWinner(pieceArray) %Add checkWinner function later
    put "Enter your move (or \"help\" for help): " ..
    get tempInput : *
    if Str.Lower (tempInput) = "help" then
	include "help.t"
    else
	loop
	    movement := Str.Upper (tempInput)
	    exit when isValidNotation (movement) and not compareArray (doMove (movement, whiteToMove, pieceArray), pieceArray)
	    drawBoard (pieceArray) %No CLS because drawBoard includes CLS
	    put "Invalid move. Enter your move (or \"help\" for help): " ..
	    get tempInput : *
	end loop
	pieceArray := doMove (movement, whiteToMove, pieceArray)
	whiteToMove := not whiteToMove
    end if
end loop

