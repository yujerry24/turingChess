function doMove (move : string, whiteMove : boolean, pieceArray : array 1 .. 8, 1 .. 8 of int) : array 1 .. 8, 1 .. 8 of int
    var xpos : int := index ("ABCDEFGH", move (2))
    var ypos : int := 9 - strint (move (3))
    var destination : int := pieceArray (ypos, xpos)
    var pawnCheck : int := -1
    var teamNumber : int := 10
    var returnArray : array 1 .. 8, 1 .. 8 of int := pieceArray
    %Note: "result pieceArray" basically kills the function

    %Check if there is already a piece occupying the space
    if intstr (destination) (1) = "2" and not whiteMove then
	result pieceArray
    elsif intstr (destination) (1) = "1" then
	result pieceArray
    end if

    %Toggle black/white
    if not whiteMove then
	pawnCheck := 1
	teamNumber := 20
    end if

    %Actually do the move
    if move (1) = "P" then
	if not pieceArray (ypos - pawnCheck, xpos) = teamNumber + 1 then
	    result pieceArray
	else
	    returnArray (ypos, xpos) := teamNumber + 1
	    returnArray (ypos - pawnCheck, xpos) := 30
	    result returnArray
	end if
    elsif move (1) = "R" then
	
    end if
    result pieceArray
end doMove
