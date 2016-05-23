include "piececode/rook/rookValidation.t"

function doMove (move : string, whiteMove : boolean, pieceArray : array 1 .. 8, 1 .. 8 of int) : array 1 .. 8, 1 .. 8 of int
    var xpos : int := index ("ABCDEFGH", move (2))
    var ypos : int := 9 - strint (move (3))
    var destination : int := pieceArray (ypos, xpos)
    var pawnCheck : int := -1
    var teamNumber : int := 10
    var pieceFound : boolean := false
    var pieceFoundPos : array 1 .. 2 of int
    var returnArray : array 1 .. 8, 1 .. 8 of int := pieceArray
    var resolveRequired : boolean := false
    var whiteKingCastle : boolean := true
    var whiteQueenCastle : boolean := true
    var blackKingCastle : boolean := true
    var blackQueenCastle : boolean := true

    %Note: "result pieceArray" basically kills the function

    %Check if there is already a piece occupying the space
    if intstr (destination) (1) = "2" and not whiteMove then
	put "whateveer"
	result pieceArray
    elsif intstr (destination) (1) = "1" and whiteMove then
	result pieceArray
    end if

    %Toggle black/white
    if not whiteMove then
	pawnCheck := 1
	teamNumber := 20
    end if

    %Actually do the move
    if move (1) = "P" then %Pawn movement
	include "piececode/pawn.t"
    elsif move (1) = "R" then %Rook movement
	include "piececode/rook/rookMain.t"
    elsif move (1) = "K" then %King movement
	include "piececode/king.t"
    elsif move (1) = "N" then    %King movement
	include "piececode/knight.t"
    elsif move (1) = "B" then         %King movement
	include "piececode/bishop.t"
    elsif move (1) = "Q" then              %King movement
	include "piececode/queen.t"
    end if
    result pieceArray
end doMove
