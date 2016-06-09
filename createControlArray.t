function addControl (y : int, x : int, team : int, controlArray : array 1 .. 8, 1 .. 8 of int) : array 1 .. 8, 1 .. 8 of int
    var returnArray : array 1 .. 8, 1 .. 8 of int := controlArray
    if y <= 8 and y >= 1 and x <= 8 and x >= 1 then %Out of range failsafe
	%Write the correct control team number
	if (not controlArray (y, x) mod 10 = team) and controlArray (y, x) mod 10 < 3 then
	    returnArray (y, x) += team
	end if
    end if
    result returnArray
end addControl

function writeControlArray (pieceCode : int, y : int, x : int, controlArray : array 1 .. 8, 1 .. 8 of int, pieceArray : array 1 .. 8, 1 .. 8 of int) : array 1 .. 8, 1 .. 8 of int
    var returnArray : array 1 .. 8, 1 .. 8 of int := controlArray
    var team : int := pieceCode div 10
    var piece : int := pieceCode mod 10
    var pawnMoveDir : int := ((-1) ** (team)) %Makes pawnMoveDir positive or negative one, depending on the team

    returnArray (y, x) += team * 10

    if piece = 1 then %Pawn control
	if y + pawnMoveDir <= 8 and y + pawnMoveDir >= 1 then %Failsafe to make sure the pawn hasn't reached the end
	    if x - 1 >= 1 then
		returnArray := addControl (y + pawnMoveDir, x - 1, team, returnArray)
	    end if
	    if x + 1 <= 8 then
		returnArray := addControl (y + pawnMoveDir, x + 1, team, returnArray)
	    end if
	end if

    elsif piece = 2 then %Rook control

	for pos : y .. 8 %Look vertically below
	    if not pos = y then
		returnArray := addControl (pos, x, team, returnArray)
		exit when not pieceArray (pos, x) = 30
	    end if
	end for
	for decreasing pos : y .. 1 %Look vertically above
	    if not pos = y then
		returnArray := addControl (pos, x, team, returnArray)
		exit when not pieceArray (pos, x) = 30
	    end if
	end for

	for pos : x .. 8 %Look to the right
	    if not pos = x then
		returnArray := addControl (y, pos, team, returnArray)
		exit when not pieceArray (y, pos) = 30
	    end if
	end for
	for decreasing pos : x .. 1 %Look to the left
	    if not pos = x then
		returnArray := addControl (y, pos, team, returnArray)
		exit when not pieceArray (y, pos) = 30
	    end if
	end for

    elsif piece = 3 then %Knight
	for ypos : -2 .. 2
	    for xpos : -2 .. 2
		if (abs (y) = 1 and abs (x) = 2) or (abs (y) = 2 and abs (x) = 1) then
		    if (y + ypos <= 8 and y + ypos >= 1) and (x + xpos <= 8 and x + xpos >= 1) then
			returnArray := addControl (y + ypos, x + xpos, team, returnArray)
		    end if
		end if
	    end for
	end for

    elsif piece = 4 then
    
    elsif piece = 5 then %Queen
	%Ugly recursion hack that basically assumes both a bishop and a rook are in this space
	%This will never run more than one level and should not cause a stack overflow
	returnArray := writeControlArray (team * 10 + 4, y, x, returnArray, pieceArray)
	returnArray := writeControlArray (team * 10 + 2, y, x, returnArray, pieceArray) 
    elsif piece = 6 then %King
	for ypos : -1 .. 1
	    for xpos : -1 .. 1
		if y + ypos >= 1 and y + ypos <= 8 and x + xpos >= 1 and x + xpos <= 8 and (not (ypos = 0 or xpos = 0)) then
		    returnArray := addControl (y + ypos, x + xpos, team, returnArray)
		end if
	    end for
	end for
    end if

    result returnArray
end writeControlArray


% Program to figure out which pieces control which squares.
function createControlArray (pieceArray : array 1 .. 8, 1 .. 8 of int) : array 1 .. 8, 1 .. 8 of int
    var returnArray : array 1 .. 8, 1 .. 8 of int
    for i : 1 .. 8
	for v : 1 .. 8
	    returnArray (i, v) := 0
	end for
    end for
    for y : 1 .. 8
	for x : 1 .. 8
	    if not pieceArray (y, x) = 0 and pieceArray (y, x) div 10 > 0 then
		returnArray := writeControlArray (pieceArray (y, x), y, x, returnArray, pieceArray)
	    end if
	end for
    end for
    result returnArray
end createControlArray
