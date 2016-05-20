%Rook move validation code
function validRookMove (pieceArray : array 1 .. 8, 1 .. 8 of int, pieceFoundY : int, pieceFoundX : int, ypos : int, xpos : int) : boolean
    if pieceFoundY = ypos then
	for i : min (pieceFoundX, xpos), max (pieceFoundX, xpos)
	    if not pieceArray (ypos, i) = 30 then
		result false
	    end if
	end for
    elsif pieceFoundX = xpos then
	for i : min (pieceFoundY, ypos), max (pieceFoundY, ypos)
	    if not pieceArray (i, xpos) = 30 then
		result false
	    end if
	end for
    end if
    result true
end validRookMove
