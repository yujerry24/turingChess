%top left corner
if xpos = 1 and ypos = 1 then
    if pieceArray (ypos + 1, xpos) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos + 1, xpos) := 30
	pieceFound := true
	result returnArray
    elsif pieceArray (ypos, xpos + 1) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos, xpos + 1) := 30
	pieceFound := true
	result returnArray
    elsif pieceArray (ypos + 1, xpos + 1) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos + 1, xpos + 1) := 30
	pieceFound := true
    end if
end if
%top right corner
if xpos = 8 and ypos = 1 then
    if pieceArray (ypos + 1, xpos) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos + 1, xpos) := 30
	pieceFound := true
	result returnArray
    elsif pieceArray (ypos, xpos - 1) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos, xpos - 1) := 30
	pieceFound := true
	result returnArray
    elsif pieceArray (ypos + 1, xpos - 1) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos + 1, xpos - 1) := 30
	pieceFound := true
    end if
end if
%bottom left corner
if xpos = 1 and ypos = 8 then
    if pieceArray (ypos - 1, xpos) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos - 1, xpos) := 30
	pieceFound := true
	result returnArray
    elsif pieceArray (ypos, xpos + 1) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos, xpos + 1) := 30
	pieceFound := true
	result returnArray
    elsif pieceArray (ypos - 1, xpos + 1) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos - 1, xpos + 1) := 30
	pieceFound := true
    end if
end if
%bottom right corber
if xpos = 8 and ypos = 8 then
    if pieceArray (ypos - 1, xpos - 1) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos - 1, xpos - 1) := 30
	pieceFound := true
	result returnArray
    elsif pieceArray (ypos, xpos - 1) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos, xpos - 1) := 30
	pieceFound := true
	result returnArray
    elsif pieceArray (ypos - 1, xpos) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos - 1, xpos) := 30
	pieceFound := true
    end if
end if
%left side
if xpos = 1 and ypos >= 2 and ypos <= 7 then
    if pieceArray (ypos + 1, xpos) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos + 1, xpos) := 30
	pieceFound := true
	result returnArray
    elsif pieceArray (ypos - 1, xpos) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos - 1, xpos) := 30
	pieceFound := true
	result returnArray
    elsif pieceArray (ypos, xpos + 1) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos, xpos + 1) := 30
	pieceFound := true
	result returnArray
    elsif pieceArray (ypos + 1, xpos + 1) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos + 1, xpos + 1) := 30
	pieceFound := true
    elsif pieceArray (ypos - 1, xpos + 1) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos - 1, xpos + 1) := 30
	pieceFound := true
    end if
end if
%right side
if xpos = 8 and ypos >= 2 and ypos <= 7 then
    if pieceArray (ypos + 1, xpos) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos + 1, xpos) := 30
	pieceFound := true
	result returnArray
    elsif pieceArray (ypos - 1, xpos) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos - 1, xpos) := 30
	pieceFound := true
	result returnArray
    elsif pieceArray (ypos, xpos - 1) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos, xpos - 1) := 30
	pieceFound := true
	result returnArray
    elsif pieceArray (ypos + 1, xpos - 1) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos + 1, xpos - 1) := 30
	pieceFound := true
    elsif pieceArray (ypos - 1, xpos - 1) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos - 1, xpos - 1) := 30
	pieceFound := true
    end if
end if
%top side
if xpos <= 7 and xpos >= 2 and ypos = 1 then
    if pieceArray (ypos + 1, xpos) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos + 1, xpos) := 30
	pieceFound := true
	result returnArray
    elsif pieceArray (ypos + 1, xpos - 1) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos + 1, xpos - 1) := 30
	pieceFound := true
	result returnArray
    elsif pieceArray (ypos + 1, xpos + 1) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos + 1, xpos + 1) := 30
	pieceFound := true
	result returnArray
    elsif pieceArray (ypos, xpos - 1) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos, xpos - 1) := 30
	pieceFound := true
    elsif pieceArray (ypos, xpos + 1) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos, xpos + 1) := 30
	pieceFound := true
    end if
end if
%bottom side
if xpos <= 7 and xpos >= 2 and ypos = 8 then
    if pieceArray (ypos, xpos + 1) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos, xpos + 1) := 30
	pieceFound := true
	result returnArray
    elsif pieceArray (ypos - 1, xpos) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos - 1, xpos) := 30
	pieceFound := true
	result returnArray
    elsif pieceArray (ypos - 1, xpos + 1) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos - 1, xpos + 1) := 30
	pieceFound := true
	result returnArray
    elsif pieceArray (ypos - 1, xpos - 1) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos - 1, xpos - 1) := 30
	pieceFound := true
    elsif pieceArray (ypos, xpos - 1) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos, xpos - 1) := 30
	pieceFound := true
    end if
end if
%general case
if ypos <= 7 and ypos >= 1 and xpos <= 7 and xpos >= 1 then

    if pieceArray (ypos, xpos) = teamNumber + 6 then
	result pieceArray
    end if
    if (ypos + 1) <= 8 and (ypos + 1) >= 1 then
	if pieceArray (ypos + 1, xpos) = teamNumber + 6 then
	    returnArray (ypos, xpos) := teamNumber + 6
	    returnArray (ypos + 1, xpos) := 30
	    pieceFound := true
	    result returnArray
	end if
    end if
    if (ypos - 1) <= 8 and (ypos - 1) >= 1 then
	if pieceArray (ypos - 1, xpos) = teamNumber + 6 then
	    returnArray (ypos, xpos) := teamNumber + 6
	    returnArray (ypos - 1, xpos) := 30
	    pieceFound := true
	    result returnArray
	end if
    end if
    if (xpos + 1) <= 8 and (xpos + 1) >= 1 then
	if pieceArray (ypos, xpos + 1) = teamNumber + 6 then
	    returnArray (ypos, xpos) := teamNumber + 6
	    returnArray (ypos, xpos + 1) := 30
	    pieceFound := true
	    result returnArray
	end if
    end if
    if (ypos + 1) <= 8 and (ypos + 1) >= 1 and (xpos + 1) <= 8 and (xpos + 1) >= 1 then
	if pieceArray (ypos + 1, xpos + 1) = teamNumber + 6 then
	    returnArray (ypos, xpos) := teamNumber + 6
	    returnArray (ypos + 1, xpos + 1) := 30
	    pieceFound := true
	    result returnArray
	end if
    end if
    if (ypos - 1) <= 8 and (ypos - 1) >= 1 and (xpos + 1) <= 8 and (xpos + 1) >= 1 then
	if pieceArray (ypos - 1, xpos + 1) = teamNumber + 6 then
	    returnArray (ypos, xpos) := teamNumber + 6
	    returnArray (ypos - 1, xpos + 1) := 30
	    pieceFound := true
	    result returnArray
	end if
    end if
    if (xpos - 1) <= 8 and (xpos - 1) >= 1 then
	if pieceArray (ypos, xpos - 1) = teamNumber + 6 then
	    returnArray (ypos, xpos) := teamNumber + 6
	    returnArray (ypos, xpos - 1) := 30
	    pieceFound := true
	    result returnArray
	end if
    end if
    if (ypos + 1) <= 8 and (ypos + 1) >= 1 and (xpos - 1) <= 8 and (xpos - 1) >= 1 then
	if pieceArray (ypos + 1, xpos - 1) = teamNumber + 6 then
	    returnArray (ypos, xpos) := teamNumber + 6
	    returnArray (ypos + 1, xpos - 1) := 30
	    pieceFound := true
	    result returnArray
	end if
    end if
    if (xpos - 1) <= 8 and (xpos - 1) >= 1 and (ypos - 1) <= 8 and (ypos - 1) >= 1 then
	if pieceArray (ypos - 1, xpos - 1) = teamNumber + 6 then
	    returnArray (ypos, xpos) := teamNumber + 6
	    returnArray (ypos - 1, xpos - 1) := 30
	    pieceFound := true
	end if
    end if

end if
if pieceFound = true and returnArray (ypos, xpos) = 26 then
    blackKingCastle := false
    blackQueenCastle := false
end if
if pieceFound = true and returnArray (ypos, xpos) = 16 then
    whiteKingCastle := false
    whiteQueenCastle := false
end if
if ypos = 8 and xpos = 7 and whiteKingCastle = true and pieceArray (8, 6) = 30 and pieceArray (8, 7) = 30 then
    returnArray (8, 5) := 30
    returnArray (8, 8) := 30
    returnArray (8, 7) := 16
    returnArray (8, 6) := 12
    whiteKingCastle := false
    whiteQueenCastle := false
    pieceFound := true
end if
if ypos = 8 and xpos = 3 and whiteQueenCastle = true and pieceArray (8, 1) = 12 and pieceArray (8, 2) = 30 and pieceArray (8, 3) = 30 and pieceArray (8, 4) = 30 then
    returnArray (8, 1) := 30
    returnArray (8, 2) := 30
    returnArray (8, 3) := 16
    returnArray (8, 4) := 12
    returnArray (8, 5) := 30
    whiteKingCastle := false
    whiteQueenCastle := false
    pieceFound := true
end if
if ypos = 1 and xpos = 7 and blackKingCastle = true and pieceArray (1, 6) = 30 and pieceArray (1, 7) = 30 then
    returnArray (1, 5) := 30
    returnArray (1, 8) := 30
    returnArray (1, 7) := 26
    returnArray (1, 6) := 22
    blackKingCastle := false
    blackQueenCastle := false
    pieceFound := true
end if
if ypos = 1 and xpos = 3 and blackQueenCastle = true and pieceArray (1, 1) = 22 and pieceArray (1, 2) = 30 and pieceArray (1, 3) = 30 and pieceArray (1, 4) = 30 then
    returnArray (1, 1) := 30
    returnArray (1, 2) := 30
    returnArray (1, 3) := 26
    returnArray (1, 4) := 22
    returnArray (1,5) :=30
    
    blackKingCastle := false
    blackQueenCastle := false
    pieceFound := true
end if
result returnArray
