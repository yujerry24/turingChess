if teamNumber = 10 then
    if pieceArray (ypos, xpos) = 30 or pieceArray (ypos, xpos) = 21 or pieceArray (ypos, xpos) = 22 or pieceArray (ypos, xpos) = 23 or pieceArray (ypos, xpos) = 24 or pieceArray (ypos, xpos) = 25 then
	if pieceArray (ypos + 2, xpos + 1) = 13 then
	    returnArray (ypos, xpos) := 13
	    returnArray (ypos + 2, xpos + 1) := 30
	    pieceFound := true
	elsif pieceArray (ypos + 2, xpos - 1) = 13 then
	    returnArray (ypos, xpos) := 13
	    returnArray (ypos + 2, xpos - 1) := 30
	    pieceFound := true
	elsif pieceArray (ypos - 2, xpos - 1) = 13 then
	    returnArray (ypos, xpos) := 13
	    returnArray (ypos - 2, xpos - 1) := 30
	    pieceFound := true
	elsif pieceArray (ypos - 2, xpos + 1) = 13 then
	    returnArray (ypos, xpos) := 13
	    returnArray (ypos - 2, xpos + 1) := 30
	    pieceFound := true
	elsif pieceArray (ypos + 1, xpos - 2) = 13 then
	    returnArray (ypos, xpos) := 13
	    returnArray (ypos + 1, xpos - 2) := 30
	    pieceFound := true
	elsif pieceArray (ypos - 1, xpos - 2) = 13 then
	    returnArray (ypos, xpos) := 13
	    returnArray (ypos - 1, xpos - 2) := 30
	    pieceFound := true
	elsif pieceArray (ypos + 1, xpos + 2) = 13 then
	    returnArray (ypos, xpos) := 13
	    returnArray (ypos + 1, xpos + 2) := 30
	    pieceFound := true
	elsif pieceArray (ypos - 1, xpos + 2) = 13 then
	    returnArray (ypos, xpos) := 13
	    returnArray (ypos - 1, xpos + 2) := 30
	    pieceFound := true
	end if
    end if
end if
if teamNumber = 20 then
    if pieceArray (ypos, xpos) = 30 or pieceArray (ypos, xpos) = 11 or pieceArray (ypos, xpos) = 12 or pieceArray (ypos, xpos) = 13 or pieceArray (ypos, xpos) = 14 or pieceArray (ypos, xpos) = 15 then

	if pieceArray (ypos + 2, xpos + 1) = 23 then
	    returnArray (ypos, xpos) := 23
	    returnArray (ypos + 2, xpos + 1) := 30
	    pieceFound := true
	elsif pieceArray (ypos + 2, xpos - 1) = 23 then
	    returnArray (ypos, xpos) := 23
	    returnArray (ypos + 2, xpos - 1) := 30
	    pieceFound := true
	elsif pieceArray (ypos - 2, xpos - 1) =23 then
	    returnArray (ypos, xpos) :=23
	    returnArray (ypos - 2, xpos - 1) := 30
	    pieceFound := true
	elsif pieceArray (ypos - 2, xpos + 1) = 23 then
	    returnArray (ypos, xpos) :=23
	    returnArray (ypos - 2, xpos + 1) := 30
	    pieceFound := true
	elsif pieceArray (ypos + 1, xpos - 2) = 23 then
	    returnArray (ypos, xpos) := 23
	    returnArray (ypos + 1, xpos - 2) := 30
	    pieceFound := true
	elsif pieceArray (ypos - 1, xpos - 2) = 23 then
	    returnArray (ypos, xpos) := 23
	    returnArray (ypos - 1, xpos - 2) := 30
	    pieceFound := true
	elsif pieceArray (ypos + 1, xpos + 2) = 23 then
	    returnArray (ypos, xpos) := 23
	    returnArray (ypos + 1, xpos + 2) := 30
	    pieceFound := true
	elsif pieceArray (ypos - 1, xpos + 2) = 23 then
	    returnArray (ypos, xpos) := 23
	    returnArray (ypos - 1, xpos + 2) := 30
	    pieceFound := true
	end if

    end if
end if
result returnArray
