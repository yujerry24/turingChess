function writeControlArray(piece : int, y : int , x : int, controlArray : array 1 .. 8, 1 .. 8 of int) : array 1 .. 8, 1 .. 8 of int
    var pawnMoveDir
    if piece mod 10 = 1 then %Pawn control
	
    elsif
    
    end if
end writeControlArray


% Program to figure out which pieces control which squares.
function createControlArray (pieceArray : array 1 .. 8, 1 .. 8 of int) : array 1 .. 8, 1 .. 8 of int
    var returnArray : array 1 .. 8, 1 .. 8 of int
    for y : 1 .. 8
	for x : 1 .. 8
	    if not pieceArray (y, x) = 0 and pieceArray (y, x) div 10 > 0 then
		returnArray := writeControlArray(pieceArray(y,x), y, x, returnArray)
	    end if
	end for
    end for
end createControlArray
