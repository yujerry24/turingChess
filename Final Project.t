%Chess Program
import GUI

%The display screen format
setscreen ("graphics:max;max,nobuttonbar")

include "GUIs.t"

%Loading text while the dozens of files are importing
Font.Draw ("LOADING...", maxx div 2, maxy - 50, font1, black)

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

process moveSound
    Music.PlayFile ("pieceMoveSound.wav")
end moveSound

loop
    drawBoard (pieceArray)
    %exit when checkWinner(pieceArray) %Add checkWinner function later
    put "Enter your move (or \"help\" for help): " ..
    get tempInput : *

    loop
	movement := Str.Upper (tempInput)
	if Str.Lower (tempInput) = "help" then
	    include "help.t"
	    drawBoard (pieceArray)
	    put "Enter your move (or \"help\" for help): " ..
	else
	    exit when isValidNotation (movement) and not compareArray (doMove (movement, whiteToMove, pieceArray), pieceArray)
	    drawBoard (pieceArray)
	    put "Invalid move. Enter your move (or \"help\" for help): " ..
	end if
	get tempInput : *
    end loop
    pieceArray := doMove (movement, whiteToMove, pieceArray)
    whiteToMove := not whiteToMove
    %Play the cool sound
    fork moveSound
end loop

