%We might have to resolve ambiguities at this point
%Find the rook(s)
for x : 1 .. 8
    if pieceArray(ypos,x) = teamNumber + 2 then
	pieceFound := true
	pieceFoundPos(1) := ypos
	pieceFoundPos(2) := x
	exit
    end if
end for
for y : 1 .. 8
    if pieceArray(y, xpos) = teamNumber + 2 then
	pieceFound := true
	pieceFoundPos(1) := y
	pieceFoundPos(2) := xpos
	exit
    end if
end for
result returnArray
