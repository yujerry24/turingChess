for bpos : 1 .. 7 %Anything plus 8 will always be out of range
    %Bottom right
    if xpos + bpos <= 8 and ypos + bpos <= 8 then
	if pieceArray (ypos + bpos, xpos + bpos) = teamNumber + 4 then
	    pieceFound := true
	    pieceFoundPos (1) := ypos + bpos
	    pieceFoundPos (2) := xpos + bpos
	end if
	exit when not pieceArray (ypos + bpos, xpos + bpos) = 30
    end if
end for
for bpos : 1 .. 7         %Anything plus 8 will always be out of range
    %Top left
    if xpos - bpos >= 1 and ypos - bpos >= 1 then
	if pieceArray (ypos - bpos, xpos - bpos) = teamNumber + 4 then
	    pieceFound := true
	    pieceFoundPos (1) := ypos - bpos
	    pieceFoundPos (2) := xpos - bpos
	end if
	exit when not pieceArray (ypos - bpos, xpos - bpos) = 30
    end if
end for
for bpos : 1 .. 7 %Anything plus 8 will always be out of range
    %Bottom left
    if xpos - bpos >= 1 and ypos + bpos <= 8 then
	if pieceArray (ypos + bpos, xpos - bpos) = teamNumber + 4 then
	    pieceFound := true
	    pieceFoundPos (1) := ypos + bpos
	    pieceFoundPos (2) := xpos - bpos
	end if
	exit when not pieceArray (ypos + bpos, xpos - bpos) = 30
    end if
end for
for bpos : 1 .. 7         %Anything plus 8 will always be out of range
    %Top right
    if ypos - bpos >= 1 and xpos + bpos <= 8 then
	if pieceArray (ypos - bpos, xpos + bpos) = teamNumber + 4 then
	    pieceFound := true
	    pieceFoundPos (1) := ypos - bpos
	    pieceFoundPos (2) := xpos + bpos
	end if
	exit when not pieceArray (ypos - bpos, xpos + bpos) = 30
    end if
end for

if pieceFound = true then
    returnArray (ypos, xpos) := teamNumber + 4
    returnArray (pieceFoundPos (1), pieceFoundPos (2)) := 30
end if
