var ver1 : int := 0
var ver2 : int := 0
var ver3 : int := 0
var ver4 : int := 0
var ver5 : int := 0
var ver6 : int := 0
var ver7 : int := 0
var ver8 : int := 0
% 8 Different possible move places relative to the knight position
ver1 := ypos + 2
ver2 := ypos - 2
ver3 := ypos + 1
ver4 := ypos - 1
ver5 := xpos + 2
ver6 := xpos - 2
ver7 := xpos + 1
ver8 := xpos - 1

%White knight move 
if teamNumber = 10 then
    %Checks if target position is blank or occupied by enemy piece
    if pieceArray (ypos, xpos) = 30 or pieceArray (ypos, xpos) = 21 or pieceArray (ypos, xpos) = 22 or pieceArray (ypos, xpos) = 23 or pieceArray (ypos, xpos) = 24 or pieceArray (ypos, xpos) = 25 then
	% Check if position 1 is available
	if ver1 <= 8 and ver1 >= 1 and ver7 <= 8 and ver7 >= 1 then
	    if pieceArray (ypos + 2, xpos + 1) = 13 then
		returnArray (ypos, xpos) := 13
		returnArray (ypos + 2, xpos + 1) := 30
		pieceFound := true
	    end if
	end if
	% Check if position 2 is available
	if ver1 <= 8 and ver1 >= 1 and ver8 <= 8 and ver8 >= 1 then
	    if pieceArray (ypos + 2, xpos - 1) = 13 then
		returnArray (ypos, xpos) := 13
		returnArray (ypos + 2, xpos - 1) := 30
		pieceFound := true
	    end if
	end if
	% Check if position 3 is available
	if ver2 <= 8 and ver2 >= 1 and ver8 <= 8 and ver8 >= 1 then
	    if pieceArray (ypos - 2, xpos - 1) = 13 then
		returnArray (ypos, xpos) := 13
		returnArray (ypos - 2, xpos - 1) := 30
		pieceFound := true
	    end if
	end if
	% Check if position 4 is available
	if ver2 <= 8 and ver2 >= 1 and ver7 <= 8 and ver7 >= 1 then
	    if pieceArray (ypos - 2, xpos + 1) = 13 then
		returnArray (ypos, xpos) := 13
		returnArray (ypos - 2, xpos + 1) := 30
		pieceFound := true
	    end if
	end if
	% Check if position 5 is available
	if ver3 <= 8 and ver3 >= 1 and ver6 <= 8 and ver6 >= 1 then
	    if pieceArray (ypos + 1, xpos - 2) = 13 then
		returnArray (ypos, xpos) := 13
		returnArray (ypos + 1, xpos - 2) := 30
		pieceFound := true
	    end if
	end if
	% Check if position 6 is available
	if ver4 <= 8 and ver4 >= 1 and ver6 <= 8 and ver6 >= 1 then
	    if pieceArray (ypos - 1, xpos - 2) = 13 then
		returnArray (ypos, xpos) := 13
		returnArray (ypos - 1, xpos - 2) := 30
		pieceFound := true
	    end if
	end if
	% Check if position 7 is available
	if ver3 <= 8 and ver3 >= 1 and ver5 <= 8 and ver5 >= 1 then
	    if pieceArray (ypos + 1, xpos + 2) = 13 then
		returnArray (ypos, xpos) := 13
		returnArray (ypos + 1, xpos + 2) := 30
		pieceFound := true
	    end if
	end if
	% Check if position 8 is available
	if ver4 <= 8 and ver4 >= 1 and ver5 <= 8 and ver5 >= 1 then
	    if pieceArray (ypos - 1, xpos + 2) = 13 then
		returnArray (ypos, xpos) := 13
		returnArray (ypos - 1, xpos + 2) := 30
		pieceFound := true
	    end if
	end if
    end if
end if
if teamNumber = 20 then
    if pieceArray (ypos, xpos) = 30 or pieceArray (ypos, xpos) = 11 or pieceArray (ypos, xpos) = 12 or pieceArray (ypos, xpos) = 13 or pieceArray (ypos, xpos) = 14 or pieceArray (ypos, xpos) = 15 then
	if ver1 <= 8 and ver1 >= 1 and ver7 <= 8 and ver7 >= 1 then
	    if pieceArray (ypos + 2, xpos + 1) = 23 then
		returnArray (ypos, xpos) := 23
		returnArray (ypos + 2, xpos + 1) := 30
		pieceFound := true
	    end if
	end if
	if ver1 <= 8 and ver1 >= 1 and ver8 <= 8 and ver8 >= 1 then
	    if pieceArray (ypos + 2, xpos - 1) = 23 then
		returnArray (ypos, xpos) := 23
		returnArray (ypos + 2, xpos - 1) := 30
		pieceFound := true
	    end if
	end if
	if ver2 <= 8 and ver2 >= 1 and ver8 <= 8 and ver8 >= 1 then
	    if pieceArray (ypos - 2, xpos - 1) = 23 then
		returnArray (ypos, xpos) := 23
		returnArray (ypos - 2, xpos - 1) := 30
		pieceFound := true
	    end if
	end if
	if ver2 <= 8 and ver2 >= 1 and ver7 <= 8 and ver7 >= 1 then
	    if pieceArray (ypos - 2, xpos + 1) = 23 then
		returnArray (ypos, xpos) := 23
		returnArray (ypos - 2, xpos + 1) := 30
		pieceFound := true
	    end if
	end if
	if ver3 <= 8 and ver3 >= 1 and ver6 <= 8 and ver6 >= 1 then
	    if pieceArray (ypos + 1, xpos - 2) = 23 then
		returnArray (ypos, xpos) := 23
		returnArray (ypos + 1, xpos - 2) := 30
		pieceFound := true
	    end if
	end if
	if ver4 <= 8 and ver4 >= 1 and ver6 <= 8 and ver6 >= 1 then
	    if pieceArray (ypos - 1, xpos - 2) = 23 then
		returnArray (ypos, xpos) := 23
		returnArray (ypos - 1, xpos - 2) := 30
		pieceFound := true
	    end if
	end if
	if ver3 <= 8 and ver3 >= 1 and ver5 <= 8 and ver5 >= 1 then
	    if pieceArray (ypos + 1, xpos + 2) = 23 then
		returnArray (ypos, xpos) := 23
		returnArray (ypos + 1, xpos + 2) := 30
		pieceFound := true
	    end if
	end if
	if ver4 <= 8 and ver4 >= 1 and ver5 <= 8 and ver5 >= 1 then
	    if pieceArray (ypos - 1, xpos + 2) = 23 then
		returnArray (ypos, xpos) := 23
		returnArray (ypos - 1, xpos + 2) := 30
		pieceFound := true
	    end if
	end if

    end if
end if
result returnArray
