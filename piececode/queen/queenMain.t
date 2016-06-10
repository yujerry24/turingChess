%queen
%diagonal
for bpos : 1 .. 7 %Anything plus 8 will always be out of range
    %Bottom right
    if xpos + bpos <= 8 and ypos + bpos <= 8 then
	if pieceArray (ypos + bpos, xpos + bpos) = teamNumber + 5 then
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
	if pieceArray (ypos - bpos, xpos - bpos) = teamNumber + 5 then
	    pieceFound := true
	    pieceFoundPos (1) := ypos - bpos
	    pieceFoundPos (2) := xpos - bpos
	end if
	exit when not pieceArray (ypos - bpos, xpos - bpos) = 30
    end if
end for
for bpos : 1 .. 7         %Anything plus 8 will always be out of range
    %Bottom left
    if xpos - bpos >= 1 and ypos + bpos <= 8 then
	if pieceArray (ypos + bpos, xpos - bpos) = teamNumber + 5 then
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
	if pieceArray (ypos - bpos, xpos + bpos) = teamNumber + 5 then
	    pieceFound := true
	    pieceFoundPos (1) := ypos - bpos
	    pieceFoundPos (2) := xpos + bpos
	end if
	exit when not pieceArray (ypos - bpos, xpos + bpos) = 30
    end if
end for

%Find the horizontals
for x : 1 .. 8 %Look horizontally
    if pieceArray (ypos, x) = teamNumber + 5 and validQueenMove (pieceArray, ypos, x, ypos, xpos) then
	if pieceFound then
	    resolveRequired := true
	end if
	pieceFound := true
	pieceFoundPos (1) := ypos
	pieceFoundPos (2) := x
	exit
    end if
end for

for y : 1 .. 8 %Vertical movement
    if pieceArray (y, xpos) = teamNumber + 5 and validQueenMove (pieceArray, y, xpos, ypos, xpos) then
	if pieceFound then
	    resolveRequired := true
	end if
	pieceFound := true
	pieceFoundPos (1) := y
	pieceFoundPos (2) := xpos
	exit
    end if
end for

%Move the queen
if pieceFound = true then
    returnArray (ypos, xpos) := teamNumber + 5
    returnArray (pieceFoundPos (1), pieceFoundPos (2)) := 30
end if
