%Validation for rooks and queens
include "piececode/rook/rookValidation.t"
include "piececode/queen/queenValidation.t"

function doMove (move : string, whiteMove : boolean, pieceArray : array 1 .. 8, 1 .. 8 of int) : array 1 .. 8, 1 .. 8 of int
    var xpos : int := index ("ABCDEFGH", move (2)) %X position of the piece
    var ypos : int := 9 - strint (move (3)) %Invert the y-axis
    var destination : int := pieceArray (ypos, xpos) %Piececode of the destination
    var moveDir : int %Direction the pawns are moving
    var teamNumber : int := 10 %ID of the team, defaults to white, changed further down
    var pieceFound : boolean := false %Tracks whether a piece was found to move to the target
    var pieceFoundPos : array 1 .. 2 of int %Pos of piece found
    var pieceFound2Pos : array 1 .. 2 of int %Pos of second piece found (for ambiguity resolution)
    var returnArray : array 1 .. 8, 1 .. 8 of int := pieceArray %Array to return at the end of the program
    var resolveRequired : boolean := false  %Whether ambiguity resolution is required
    var controlArray : array 1 .. 8, 1 .. 8 of int %Array for control. Needed to prevent the king from moving into check

    %Note: "result pieceArray" basically kills the function

    %Check if there is already a piece occupying the space
    if intstr (destination) (1) = "2" and not whiteMove then
	result pieceArray
    elsif intstr (destination) (1) = "1" and whiteMove then
	result pieceArray
    end if

    %Toggle black/white
    if not whiteMove then
	teamNumber := 20
    end if

    moveDir := (-1) ** ((teamNumber div 10) + 1) %Mainly for pawn movement

    %Actually do the move
    %Movement code is all in the "piececode" folder
    if move (1) = "P" then %Pawn movement
	include "piececode/pawn.t"
    elsif move (1) = "R" then %Rook movement
	include "piececode/rook/rookMain.t"
    elsif move (1) = "K" then %King movement
	include "piececode/king.t"
    elsif move (1) = "N" then %Knight movement
	include "piececode/knight.t"
    elsif move (1) = "B" then %Bishop movement
	include "piececode/bishop.t"
    elsif move (1) = "Q" then %Queen movement
	include "piececode/queen/queenMain.t"
    end if
    
    %From this point onwards, returnArray is basically pieceArray but after the move has been done
    
    %Initialize the control array
    controlArray := createControlArray(returnArray, "default")

    %Prevent players from putting their own king in check
    if teamNumber = 10 and ((controlArray(kingPos(1,1),kingPos(1,2)) mod 10 = 3) or (controlArray (kingPos (1, 1), kingPos (1, 2)) mod 10 = 2)) then 
	result pieceArray
    elsif teamNumber = 20 and ((controlArray(kingPos(2,1),kingPos(2,2)) mod 10 = 3) or (controlArray (kingPos (2, 1), kingPos (2, 2)) mod 10 = 1)) then
	result pieceArray
    end if

    %Check to see if the opponent's king has been put in check and flag accordingly
    if teamNumber = 20 and (controlArray (kingPos (1, 1), kingPos (1, 2)) mod 10 = 3 or controlArray (kingPos (1, 1), kingPos (1, 2)) mod 10 = 2) then
	check := true
    elsif teamNumber = 10 and (controlArray (kingPos (2, 1), kingPos (2, 2)) mod 10 = 3 or controlArray (kingPos (2, 1), kingPos (2, 2)) mod 10 = 1) then
	check := true
    else
	check := false
    end if

    %Check whether this check is actually a checkmate
    if check = true then
	if teamNumber = 10 then
	    checkmate := isMate(returnArray, kingPos, 2)
	else
	    checkmate := isMate(returnArray, kingPos, 1)
	end if
    end if
    
    %Return the new piece array
    result returnArray
end doMove
