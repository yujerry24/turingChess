var t1 : int := ypos + 1
var t2 : int := ypos - 1
var t3 : int := xpos + 1
var t4 : int := xpos - 1
if teamNumber = 10 then
    if pieceArray (ypos, xpos) = 21 or pieceArray (ypos, xpos) = 22 or pieceArray (ypos, xpos) = 23 or pieceArray (ypos, xpos) = 24 or pieceArray (ypos, xpos) = 25 then
	if t1 <= 8 and t1 >= 81 and t4 <= 8 and t4 >= 1 then
	    if pieceArray (ypos + 1, xpos - 1) = 11 then
		returnArray (ypos + 1, xpos - 1) := 30
		returnArray (ypos, xpos) := 11
		result returnArray
	    end if
	end if
	if t1 <= 8 and t1 >= 1 and t2 <= 8 and t3 >= 1 then
	    if pieceArray (ypos + 1, xpos + 1) = 11 then
		returnArray (ypos + 1, xpos + 1) := 30
		returnArray (ypos, xpos) := 11
		result returnArray
	    end if
	end if
    end if
end if

if teamNumber = 20 then
    if pieceArray (ypos, xpos) = 11 or pieceArray (ypos, xpos) = 12 or pieceArray (ypos, xpos) = 13 or pieceArray (ypos, xpos) = 14 or pieceArray (ypos, xpos) = 15 then
	if t2 <= 8 and t2 >= 1 and t4 <= 8 and t4 >= 1 then
	    if pieceArray (ypos - 1, xpos - 1) = 21 then
		returnArray (ypos - 1, xpos - 1) := 30
		returnArray (ypos, xpos) := 21
		result returnArray
	    end if
	end if
	if t2 <= 8 and t2 >= 1 and t3 <= 8 and t3 >= 1 then
	    if pieceArray (ypos - 1, xpos + 1) = 21 then
		returnArray (ypos - 1, xpos + 1) := 30
		returnArray (ypos, xpos) := 21
		result returnArray
	    end if
	end if
    end if
end if


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
