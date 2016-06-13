include "piececode/rook/rookValidation.t"

include "piececode/queen/queenValidation.t"

function doMove (move : string, whiteMove : boolean, pieceArray : array 1 .. 8, 1 .. 8 of int) : array 1 .. 8, 1 .. 8 of int
    var xpos : int := index ("ABCDEFGH", move (2))
    var ypos : int := 9 - strint (move (3)) %Invert the y-axis
    var destination : int := pieceArray (ypos, xpos)
    var moveDir : int
    var teamNumber : int := 10
    var pieceFound : boolean := false
    var pieceFoundPos : array 1 .. 2 of int
    var pieceFound2Pos : array 1 .. 2 of int
    var returnArray : array 1 .. 8, 1 .. 8 of int := pieceArray
    var resolveRequired : boolean := false

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

    %Prevent players from putting their own king in check
    if teamNumber = 10 and ((createControlArray(returnArray)(kingPos(1,1),kingPos(1,2)) mod 10 = 3) or (createControlArray (returnArray) (kingPos (1, 1), kingPos (1, 2)) mod 10 = 2)) then 
	result pieceArray
    elsif teamNumber = 20 and ((createControlArray(returnArray)(kingPos(2,1),kingPos(2,2)) mod 10 = 3) or (createControlArray (returnArray) (kingPos (2, 1), kingPos (2, 2)) mod 10 = 1)) then
	result pieceArray
    end if

    %Check to see if the opponent's king has been put in check
    if teamNumber = 20 and (createControlArray (returnArray) (kingPos (1, 1), kingPos (1, 2)) mod 10 = 3 or createControlArray (returnArray) (kingPos (1, 1), kingPos (1, 2)) mod 10 = 2) then
	check := true
    elsif teamNumber = 10 and (createControlArray (returnArray) (kingPos (2, 1), kingPos (2, 2)) mod 10 = 3 or createControlArray (returnArray) (kingPos (2, 1), kingPos (2, 2)) mod 10 = 1) then
	check := true
    else
	check := false
    end if

    if check = true then
	if teamNumber = 10 then
	    checkmate := isMate(returnArray, kingPos, 2)
	else
	    checkmate := isMate(returnArray, kingPos, 1)
	end if
    end if
    
    put checkmate
    Input.Pause

    result returnArray
end doMove
