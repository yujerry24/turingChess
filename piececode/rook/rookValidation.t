%Rook move validation code
function validRookMove (pieceArray : array 1 .. 8, 1 .. 8 of int, pieceFoundY : int, pieceFoundX : int, ypos : int, xpos : int) : boolean
    if not abs (pieceFoundY - ypos) = 1 and not abs (pieceFoundX - xpos) = 1 then
	if pieceFoundY = ypos then
	    for i : min (pieceFoundX, xpos) + 1 .. max (pieceFoundX, xpos) - 1
		if not pieceArray (ypos, i) = 30 then
		    result false
		end if
	    end for
	elsif pieceFoundX = xpos then
	    for i : min (pieceFoundY, ypos) + 1 .. max (pieceFoundY, ypos) - 1
		if not pieceArray (i, xpos) = 30 then
		    result false
		end if
	    end for
	end if
    end if
    result true
end validRookMove
