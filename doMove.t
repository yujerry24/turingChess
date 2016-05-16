function doMove (move : string, whiteMove : boolean, pieceArray : array 1 .. 8, 1 .. 8 of int) : array 1 .. 8, 1 .. 8 of int
    %Check if move is valid
    if not isValidMove (move, whiteMove, pieceArray) then
	result pieceArray
    end if
    %Resolve any ambiguities
    %Perform move and return true if success
    result pieceArray
end doMove
