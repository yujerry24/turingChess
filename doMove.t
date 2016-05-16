function doMove (move : string, whiteMove : boolean) : boolean
    %Check if move is valid
    if not isValidMove (move, whiteMove) then
	result false
    end if
    %Resolve any ambiguities
    %Perform move and return true if success
end doMove
