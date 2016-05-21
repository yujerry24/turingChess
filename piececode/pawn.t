if not pieceArray (ypos, xpos) = 30 then
    result pieceArray
end if


if not pieceArray (ypos - pawnCheck, xpos) = teamNumber + 1 then
    if pieceArray (ypos - pawnCheck, xpos) = 30 then
	if whiteMove and ypos = 5 and pieceArray (ypos - pawnCheck * 2, xpos) = teamNumber + 1 then
	    returnArray (ypos, xpos) := teamNumber + 1
	    returnArray (ypos - pawnCheck * 2, xpos) := 30
	elsif not whiteMove and ypos = 4 and pieceArray (ypos - pawnCheck * 2, xpos) = teamNumber + 1 then
	    returnArray (ypos, xpos) := teamNumber + 1
	    returnArray (ypos - pawnCheck * 2, xpos) := 30
	end if
    end if
    result returnArray
else
    returnArray (ypos, xpos) := teamNumber + 1
    returnArray (ypos - pawnCheck, xpos) := 30
    result returnArray
end if
