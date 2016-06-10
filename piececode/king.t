% King movement code
for y : -1 .. 1
    for x : -1 .. 1
	if not (x = 0 and y = 0) then
	    if ypos + y <= 8 and ypos + y >= 1 and xpos + x <= 8 and xpos + x >= 1 then
		if pieceArray (ypos + y, xpos + x) = teamNumber + 6 then
		    pieceFound := true
		    pieceFoundPos (1) := ypos + y
		    pieceFoundPos (2) := xpos + x
		end if
	    end if
	end if
    end for
end for

% Begin castle code

if pieceFound = true then %Don't need to castle
    returnArray (ypos, xpos) := teamNumber + 6
    returnArray (pieceFoundPos (1), pieceFoundPos (2)) := 30
elsif (teamNumber = 10 and ypos = 8) or (teamNumber = 20 and ypos = 1) then %Castling code
    if xpos = 7 and pieceArray(ypos, 5) = teamNumber + 6 and pieceArray(ypos, 8) = teamNumber + 2 then %Kingside
	for i : 6 .. 7 %Because I don't want the if statement to get too long
	    if not pieceArray(ypos, i) = 30 then
		pieceFound := true %Repurpose pieceFound to check for pieces in the way of castling (Saves me from declaring more variables)
	    end if
	end for
	if pieceFound = false then %Do the actual castling
	    returnArray(ypos, 6) := teamNumber + 2
	    returnArray(ypos, 7) := teamNumber + 6
	    returnArray(ypos, 5) := 30
	    returnArray(ypos, 8) := 30
	    pieceFoundPos(1) := ypos
	    pieceFoundPos(2) := 7
	end if
    elsif xpos = 3 and pieceArray(ypos, 5) = teamNumber +6 and pieceArray(ypos, 1) = teamNumber + 2 then %Queenside
	for i : 2 .. 4 %Because I don't want the if statement to get too long
	    if not pieceArray(ypos, i) = 30 then
		pieceFound := true %Repurpose pieceFound to check for pieces in the way of castling (Saves me from declaring more variables)
	    end if
	end for 
	if pieceFound = false then %Do the actual castling
	    returnArray(ypos, 4) := teamNumber + 2
	    returnArray(ypos, 3) := teamNumber + 6
	    returnArray(ypos, 5) := 30
	    returnArray(ypos, 8) := 30
	    pieceFoundPos(1) := ypos
	    pieceFoundPos(2) := 3
	end if
    end if   
end if

if whiteMove = true then
    whiteKingPos := pieceFoundPos       
else
    blackKingPos := pieceFoundPos
end if
