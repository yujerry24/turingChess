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

if resolveRequired then
    pieceFoundPos := resolveConflict (pieceFoundPos, pieceFound2Pos, pieceArray)
end if

if pieceFound = true then
    returnArray (ypos, xpos) := teamNumber + 3
    returnArray (pieceFoundPos (1), pieceFoundPos (2)) := 30
end if

result returnArray
