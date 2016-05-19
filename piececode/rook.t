%Find the rook(s)
for x : 1 .. 8 %Look horizontally
    if pieceArray(ypos,x) = teamNumber + 2 then
	if pieceFound then
	    resolveRequired := true
	end if
	pieceFound := true
	pieceFoundPos(1) := ypos
	pieceFoundPos(2) := x
	exit
    end if
end for

for y : 1 .. 8 %Look vertically
    if pieceArray(y, xpos) = teamNumber + 2 then
	if pieceFound then
	    resolveRequired := true
	end if
	pieceFound := true
	pieceFoundPos(1) := y
	pieceFoundPos(2) := xpos
	exit
    end if
end for

%Exit if the piece wasn't found
if not pieceFound then
    result pieceArray
end if

%Resolve ambiguous user input
if resolveRequired then
    put "Stalemate resolution required"
end if

%Check to see if anything is between both pieces
if pieceFoundPos(1) = ypos then
    %Code goes here
elsif pieceFoundPos(2) = xpos then
    %Code goes here
else
    put "This should never happen. If this happens then someone messed up."
    assert 2 + 2 = 5
end if

%Move the rook
returnArray(ypos, xpos) := teamNumber + 2
returnArray(pieceFoundPos(1), pieceFoundPos(2)) := 30

result returnArray
