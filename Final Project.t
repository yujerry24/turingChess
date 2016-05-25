%Chess Program
import GUI
%Queen move validation code
function validQueenMove (pieceArray : array 1 .. 8, 1 .. 8 of int, pieceFoundY : int, pieceFoundX : int, ypos : int, xpos : int) : boolean
    if not abs (pieceFoundY - ypos) = 1 and not abs (pieceFoundX - xpos) = 1 then
        if pieceFoundY = ypos then
            for i : min (pieceFoundX, xpos) + 1 .. max (pieceFoundX, xpos) - 1
                if not pieceArray (ypos, i) = 30 then
                    result false
                end if
            end for
        elsif pieceFoundX = xpos then
            for i : min (pieceFoundY, ypos) + 1 .. max (pieceFoundY, ypos) - 1
                if not pieceArray (i, xpos) = 30 then
                    result false
                end if
            end for
        end if
    end if
    result true
end validQueenMove

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

