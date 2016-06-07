function addControl (y : int, x : int, team : int, controlArray : array 1 .. 8, 1 .. 8 of int) : array 1 .. 8, 1 .. 8 of int
    var returnArray : array 1 .. 8, 1 .. 8 of int := controlArray
    
    %Write the correct control team number
    if (not controlArray (y, x) mod 10 = team) and controlArray (y, x) mod 10 < 3 then
	returnArray (y, x) += team
    end if
    
    result returnArray
end addControl

function writeControlArray (pieceCode : int, y : int, x : int, controlArray : array 1 .. 8, 1 .. 8 of int) : array 1 .. 8, 1 .. 8 of int
    var returnArray : array 1 .. 8, 1 .. 8 of int := controlArray
    var team : int := pieceCode div 10
    var piece : int := pieceCode mod 10
    var pawnMoveDir : int := ((-1) ** (team))

    returnArray (y, x) += team * 10

    if piece = 1 then %Pawn control
	if y + pawnMoveDir <= 8 and y + pawnMoveDir >= 1 then %Failsafe to make sure the pawn hasn't reached the end
	    if x - 1 >= 1 then
		returnArray := addControl(y + pawnMoveDir,x - 1,team,controlArray)
	    end if
	    if x + 1 <= 8 then
		returnArray := addControl(y + pawnMoveDir,x + 1,team,controlArray)
	    end if
	end if
	
    elsif piece = 2 then %Rook control
	for pos : 1 .. 8
	    returnArray := addControl(y,pos,team,controlArray)
	    returnArray := addControl(pos,x,team,controlArray)
	end for
	
    elsif piece = 3 then %Knight  
	
    end if

    result returnArray
end writeControlArray


% Program to figure out which pieces control which squares.
function createControlArray (pieceArray : array 1 .. 8, 1 .. 8 of int) : array 1 .. 8, 1 .. 8 of int
    var returnArray : array 1 .. 8, 1 .. 8 of int
    for y : 1 .. 8
	for x : 1 .. 8
	    if not pieceArray (y, x) = 0 and pieceArray (y, x) div 10 > 0 then
		returnArray := writeControlArray (pieceArray (y, x), y, x, returnArray)
	    end if
	end for
    end for
end createControlArray
