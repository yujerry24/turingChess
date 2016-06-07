function resolveConflict (pieceFoundPos : array 1 .. 2 of int, pieceFound2Pos : array 1 .. 2 of int, pieceArray : array 1 .. 8, 1 .. 8 of int) : array 1 .. 2 of int
    %Variables for resolving ambiguity
    var resolveString : string
    var resolvePos : int
    var returnPos : array 1 .. 2 of int := pieceFoundPos
    %Resolve ambiguous user input
    cls
    drawBoard (pieceArray)
    put "Move could refer to multiple pieces."
    if not pieceFoundPos (2) = pieceFound2Pos (2) then
	put "Please enter the column of the piece you want to move: " ..
	loop
	    get resolveString
	    resolveString := Str.Upper (resolveString)
	    cls
	    drawBoard (pieceArray)
	    exit when index ("ABCDEFGH", resolveString) > 0 and (index ("ABCDEFGH", resolveString) = pieceFoundPos (2) or index ("ABCDEFGH", resolveString) = pieceFound2Pos (2))
	    put "Move could refer to multiple pieces."
	    put "Invalid input. Please enter the column of the piece you want to move: " ..
	end loop
	if pieceFound2Pos (2) = index ("ABCDEFGH", resolveString) then
	    returnPos := pieceFound2Pos
	end if
    else
	put "Please enter the row of the piece you want to move: " ..
	loop
	    get resolveString
	    cls
	    drawBoard (pieceArray)
	    exit when strintok (resolveString) and strint (resolveString) <= 8 and strint (resolveString) >= 1 and (strint (resolveString) = 9 - pieceFoundPos (1) or strint (resolveString) = 9 -
		pieceFound2Pos (1))
	    put "Move could refer to multiple pieces."
	    put "Invalid input. Please enter the row of the piece you want to move: " ..
	end loop
	if 9 - pieceFound2Pos (2) = strint (resolveString) then
	    returnPos := pieceFound2Pos
	end if
    end if
    result returnPos
end resolveConflict
