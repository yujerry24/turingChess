%Pawn movement code

if destination = 30 then %If empty, look vertically
    if pieceArray (ypos + moveDir, xpos) = teamNumber + 1 then
	returnArray (ypos, xpos) := teamNumber + 1
	returnArray (ypos + moveDir, xpos) := 30
    elsif (teamNumber = 10 and ypos = 5) or (teamNumber = 20 and ypos = 4) then
	moveDir := moveDir * 2
	if pieceArray (ypos + moveDir, xpos) = teamNumber + 1 then
	    returnArray (ypos, xpos) := teamNumber + 1
	    returnArray (ypos + moveDir, xpos) := 30
	end if
    end if
elsif not destination div 10 = teamNumber then %If enemy piece, look diagonally
    for i : -1 .. 1 by 2 %Will not make i equal 0
	if xpos + i <= 8 and xpos + i >= 1 and pieceArray (ypos + moveDir, xpos + i) = teamNumber + 1 then
	    if pieceFound = false then
		pieceFound := true
		pieceFoundPos (1) := ypos + moveDir
		pieceFoundPos (2) := xpos + i
	    else
		resolveRequired := true
		pieceFound2Pos (1) := ypos + moveDir
		pieceFound2Pos (2) := xpos + i
	    end if
	end if
    end for
end if

if pieceFound then %For capturing and ambiguity resolution
    if resolveRequired then
	pieceFoundPos := resolveConflict (pieceFoundPos, pieceFound2Pos, pieceArray)
    end if
    returnArray (ypos, xpos) := teamNumber + 1
    returnArray (pieceFoundPos (1), pieceFoundPos (2)) := 30
end if
