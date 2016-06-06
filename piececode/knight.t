%White knight move
%Checks if target position is blank or occupied by enemy piece
if pieceArray (ypos, xpos) = 30 then
    for y : -2 .. 2
	for x : -2 .. 2
	    if (abs (y) = 1 and abs (x) = 2) or (abs (y) = 2 and abs (x) = 1) then
		if (ypos + y <= 8 and ypos + y >= 1) and (xpos + x <= 8 and xpos + x >= 1) then
		    if pieceArray (ypos + y, xpos + x) = teamNumber + 3 then
			if not pieceFound then
			    pieceFound := true
			    pieceFoundPos (1) := ypos + y
			    pieceFoundPos (2) := xpos + x
			else
			    resolveRequired := true
			    pieceFound2Pos (1) := ypos + y
			    pieceFound2Pos (2) := xpos + x
			    exit %Don't bother continuing, both knights found.
			end if
		    end if
		end if
	    end if
	end for
    end for
end if

%Resolve ambiguous user input
if resolveRequired then
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
	    pieceFoundPos := pieceFound2Pos
	end if
    else
	put "Please enter the row of the piece you want to move: " ..
	loop
	    get resolveString
	    cls
	    drawBoard (pieceArray)
	    exit when strintok (resolveString) and strint (resolveString) <= 8 and strint (resolveString) >= 1 and (strint(resolveString) = 9 - pieceFoundPos(1) or strint(resolveString) = 9 - pieceFound2Pos(1))
	    put "Move could refer to multiple pieces."
	    put "Invalid input. Please enter the row of the piece you want to move: " ..
	end loop
	if 9 - pieceFound2Pos (2) = strint (resolveString) then
	    pieceFoundPos := pieceFound2Pos
	end if
    end if
end if

if pieceFound = true then
    returnArray (ypos, xpos) := teamNumber + 3
    returnArray (pieceFoundPos (1), pieceFoundPos (2)) := 30
end if

result returnArray
