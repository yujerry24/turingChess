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
if xpos <=7 and xpos >=2 and ypos=1 then
    if pieceArray (ypos + 1, xpos) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos + 1, xpos) := 30
	pieceFound := true
	result returnArray
    elsif pieceArray (ypos +1, xpos-1) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos +1, xpos-1) := 30
	pieceFound := true
	result returnArray
    elsif pieceArray (ypos+1, xpos + 1) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos+1, xpos + 1) := 30
	pieceFound := true
	result returnArray
    elsif pieceArray (ypos , xpos - 1) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos , xpos - 1) := 30
	pieceFound := true
    elsif pieceArray (ypos , xpos + 1) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos , xpos + 1) := 30
	pieceFound := true
    end if
end if
%bottom side
if xpos <=7 and xpos >= 2 and ypos= 8 then
    if pieceArray (ypos , xpos+ 1) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos , xpos+ 1) := 30
	pieceFound := true
	result returnArray
    elsif pieceArray (ypos - 1, xpos) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos - 1, xpos) := 30
	pieceFound := true
	result returnArray
    elsif pieceArray (ypos-1, xpos + 1) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos-1, xpos + 1) := 30
	pieceFound := true
	result returnArray
    elsif pieceArray (ypos - 1, xpos - 1) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos - 1, xpos - 1) := 30
	pieceFound := true
    elsif pieceArray (ypos , xpos - 1) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos , xpos - 1) := 30
	pieceFound := true
    end if
end if
%general case
if ypos <= 7 and ypos >= 1 and xpos <= 7 and xpos >= 1 then

    if pieceArray (ypos, xpos) = teamNumber + 6 then
	result pieceArray
    elsif pieceArray (ypos + 1, xpos) = teamNumber + 6 then
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
	result returnArray
    elsif pieceArray (ypos - 1, xpos + 1) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos - 1, xpos + 1) := 30
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
	result returnArray
    elsif pieceArray (ypos - 1, xpos - 1) = teamNumber + 6 then
	returnArray (ypos, xpos) := teamNumber + 6
	returnArray (ypos - 1, xpos - 1) := 30
	pieceFound := true
	result returnArray
    else
	result pieceArray
    end if
end if
result returnArray
