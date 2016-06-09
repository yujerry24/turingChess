% King movement code
for y : -1 .. 1
    for x : -1 .. 1
	if not (x = 0 and y = 0) then
	    if ypos + y <= 8 and ypos + y >= 1 and xpos + x <= 8 and xpos + x >= 1 then
		if pieceArray(ypos + y, xpos + x) = teamNumber + 6 then
		    pieceFound := true
		    pieceFoundPos(1) := ypos + y
		    pieceFoundPos(2) := xpos + x
		end if
	    end if
	end if
    end for
end for

% Begin castle code

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


if pieceFound = true then
    returnArray (ypos, xpos) := teamNumber + 6
    returnArray (pieceFoundPos (1), pieceFoundPos (2)) := 30
end if

result returnArray
