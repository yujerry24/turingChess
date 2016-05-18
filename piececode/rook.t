%We might have to resolve ambiguities at some point

%Find the rook(s)
for x : 1 .. 8 %Look horizontally
    if pieceArray(ypos,x) = teamNumber + 2 then
	pieceFound := true
	pieceFoundPos(1) := ypos
	pieceFoundPos(2) := x
	exit
    end if
end for

for y : 1 .. 8 %Look vertically
    if pieceArray(y, xpos) = teamNumber + 2 then
	pieceFound := true
	pieceFoundPos(1) := y
	pieceFoundPos(2) := xpos
	exit
    end if
end for



result returnArray
