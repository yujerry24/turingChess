%createcontrolarray to scan the shit and see if 2 or 3 is in the way

% Program to figure out which pieces control which squares.
function isMate (pieceArray : array 1 .. 8, 1 .. 8 of int, kingPos : array 1 .. 2, 1 .. 2 of int, checkTeam : int) : boolean
    var controlArray : array 1 .. 8, 1 .. 8 of int := createControlArray (pieceArray, "default")
    var team : int
    var piece : int
    var pawnMoveDir : int
    var blockPossible : boolean := false

    %This prevents from the king exerting its own control, as in check this is pretty much null

    %Check to see if the king can move
    for ypos : -1 .. 1
	for xpos : -1 .. 1
	    if not (xpos = 0 and ypos = 0) then
		if ypos + kingPos (checkTeam, 1) <= 8 and ypos + kingPos (checkTeam, 1) >= 1 and xpos + kingPos (checkTeam, 2) <= 8 and xpos + kingPos (checkTeam, 2) >= 1 then
		    if (controlArray (kingPos (checkTeam, 1) + ypos, kingPos (checkTeam, 2) + xpos) mod 10 = 0) or (controlArray (kingPos (checkTeam, 1) + ypos, kingPos (checkTeam, 2) + xpos) mod 10
			    = checkTeam) then
			if pieceArray (kingPos (checkTeam, 1) + ypos, kingPos (checkTeam, 2) + xpos) = 30 then
			    result false
			end if
		    end if
		end if
	    end if
	end for
    end for

    for y : 1 .. 8
	for x : 1 .. 8
	    if not pieceArray (y, x) = 0 and pieceArray (y, x) div 10 > 0 then
		team := pieceArray (y, x) div 10
		piece := pieceArray (y, x) mod 10
		pawnMoveDir := ((-1) ** (team))
		if not team = checkTeam then %Only enemy pieces keep the king in check
		    if (controlArray (y, x) mod 10 = team) or (controlArray (y, x) mod 10 = 3) then
			%Check if the piece is still capturable without the king
			if team = 1 then
			    if (createControlArray (pieceArray, "noKingBlack") (y, x) mod 10 = 2) or (createControlArray (pieceArray, "noKingBlack") (y, x) mod 10 = 3) then
				blockPossible := true
			    end if
			elsif team = 2 then
			    if (createControlArray (pieceArray, "noKingWhite") (y, x) mod 10 = 1) or (createControlArray (pieceArray, "noKingWhite") (y, x) mod 10 = 3) then
				blockPossible := true
			    end if
			end if
		    end if
		    if piece = 1 then %Pawn control
			if y + pawnMoveDir <= 8 and y + pawnMoveDir >= 1 then %Failsafe to make sure the pawn hasn't reached the end
			    if x - 1 >= 1 then
				if y + pawnMoveDir = kingPos (checkTeam, 1) and x - 1 = kingPos (checkTeam, 2) then
				    if blockPossible = false then
					result true
				    end if
				end if
			    end if
			    if x + 1 <= 8 then
				if y + pawnMoveDir = kingPos (checkTeam, 1) and x + 1 = kingPos (checkTeam, 2) then
				    if blockPossible = false then
					result true
				    end if
				end if
			    end if
			end if

		    elsif piece = 2 then %Rook control
			for pos : y .. 8 %Look vertically below
			    if not pos = y then
				if pos = kingPos (checkTeam, 1) and y = kingPos (checkTeam, 2) then

				    if blockPossible = false then
					result true
				    end if
				    exit when (controlArray (pos, x) mod 10 = team) or (controlArray (pos, x) mod 10 = 3)
				    exit when not pieceArray (pos, x) = 30
				end if
			    end if
			end for
			for decreasing pos : y .. 1     %Look vertically above
			    if not pos = y then
				if pos = kingPos (checkTeam, 1) and y = kingPos (checkTeam, 2) then
				    if blockPossible = false then
					result true
				    end if
				    exit when (controlArray (pos, x) mod 10 = team) or (controlArray (pos, x) mod 10 = 3)
				    exit when not pieceArray (pos, x) = 30
				end if
			    end if
			end for

			for pos : x .. 8         %Look to the right
			    if not pos = x then
				if y = kingPos (checkTeam, 1) and pos = kingPos (checkTeam, 2) then
				    if blockPossible = false then
					result true
				    end if
				    exit when (controlArray (y, pos) mod 10 = team) or (controlArray (y, pos) mod 10 = 3)
				    exit when not pieceArray (y, pos) = 30
				end if
			    end if
			end for
			for decreasing pos : x .. 1             %Look to the left
			    if not pos = x then
				if y = kingPos (checkTeam, 1) and pos = kingPos (checkTeam, 2) then
				    if blockPossible = false then
					result true
				    end if
				    exit when (controlArray (y, pos) mod 10 = team) or (controlArray (y, pos) mod 10 = 3)
				    exit when not pieceArray (y, pos) = 30
				end if
			    end if
			end for

		    elsif piece = 3 then                 %Knight
			for ypos : -2 .. 2
			    for xpos : -2 .. 2
				if (abs (xpos) = 2 and abs (ypos) = 1) or (abs (xpos) = 1 and abs (ypos) = 2) then
				    if (ypos + y <= 8 and ypos + y >= 1) and (xpos + x <= 8 and xpos + x >= 1) then
					if ypos + y = kingPos (checkTeam, 1) and xpos + x = kingPos (checkTeam, 2) then
					    result true
					end if
				    end if
				end if
			    end for
			end for

		    elsif piece = 4 then                 %Bishop
			for xpos : 1 .. 7                 %Anything plus 8 will always be out of range
			    %Bottom right
			    if x + xpos <= 8 and y + xpos <= 8 then
				if y + xpos = kingPos (checkTeam, 1) and x + xpos = kingPos (checkTeam, 2) then
				    for i : 1 .. 7
					if controlArray (y + i, x + i) mod 10 = checkTeam or controlArray (y + i, x + i) mod 10 = 3 then
					    blockPossible := true
					end if
					if blockPossible = false then
					    result true
					end if
					exit when (controlArray (y + xpos, x + xpos) mod 10 = team) or (controlArray (y + xpos, x + xpos) mod 10 = 3)
					exit when not pieceArray (y + xpos, x + xpos) = 30
				    end for
				end if
			    end if
			end for
			for xpos : 1 .. 7                 %Anything plus 8 will always be out of range
			    %Top left
			    if x - xpos >= 1 and y - xpos >= 1 then
				if y - xpos = kingPos (checkTeam, 1) and x - xpos = kingPos (checkTeam, 2) then
				    for i : 1 .. 7
					if not (y - i = kingPos (checkTeam, 1)) and not (x - i = kingPos (checkTeam, 2)) then
					    if controlArray (y - i, x - i) mod 10 = checkTeam or controlArray (y - i, x - i) mod 10 = 3 then
						blockPossible := true
					    end if

					    if blockPossible = false then
						result true
					    end if
					    exit when (controlArray (y - xpos, x - xpos) mod 10 = checkTeam) or (controlArray (y - xpos, x - xpos) mod 10 = 3)
					    exit when not pieceArray (y - xpos, x - xpos) = 30
					end if
				    end for
				end if
			    end if
			end for
			for xpos : 1 .. 7                 %Anything plus 8 will always be out of range
			    %Bottom left
			    if x - xpos >= 1 and y + xpos <= 8 then
				if y + xpos = kingPos (checkTeam, 1) and x - xpos = kingPos (checkTeam, 2) then
				    for i : 1 .. 7
					if controlArray (y + i, x - i) mod 10 = checkTeam or controlArray (y + i, x - i) mod 10 = 3 then
					    blockPossible := true
					end if
					if blockPossible = false then
					    result true
					end if
					exit when (controlArray (y + xpos, x - xpos) mod 10 = team) or (controlArray (y + xpos, x - xpos) mod 10 = 3)
					exit when not pieceArray (y + xpos, x - xpos) = 30
				    end for
				end if
			    end if
			end for
			for xpos : 1 .. 7                 %Anything plus 8 will always be out of range
			    %Top right
			    if y - xpos >= 1 and x + xpos <= 8 then
				if y - xpos = kingPos (checkTeam, 1) and x + xpos = kingPos (checkTeam, 2) then
				    for i : 1 .. 7

					if controlArray (y - i, x + i) mod 10 = checkTeam or controlArray (y - i, x + i) mod 10 = 3 then
					    blockPossible := true
					end if
					if blockPossible = false then
					    result true
					end if
					exit when (controlArray (y - xpos, x + xpos) mod 10 = team) or (controlArray (y - xpos, x + xpos) mod 10 = 3)
					exit when not pieceArray (y - xpos, x + xpos) = 30

				    end for
				end if
			    end if
			end for


		    elsif piece = 5 then                 %Queen
			for xpos : 1 .. 7                 %Anything plus 8 will always be out of range
			    %Bottom right
			    if x + xpos <= 8 and y + xpos <= 8 then
				if y + xpos = kingPos (checkTeam, 1) and x + xpos = kingPos (checkTeam, 2) then
				    if blockPossible = false then
					result true
				    end if
				    exit when (controlArray (y + xpos, x + xpos) mod 10 = team) or (controlArray (y + xpos, x + xpos) mod 10 = 3)
				    exit when not pieceArray (y + xpos, x + xpos) = 30
				end if
			    end if
			end for
			for xpos : 1 .. 7                     %Anything plus 8 will always be out of range
			    %Top left
			    if x - xpos >= 1 and y - xpos >= 1 then
				if y - xpos = kingPos (checkTeam, 1) and x - xpos = kingPos (checkTeam, 2) then
				    if blockPossible = false then
					result true
				    end if
				    exit when (controlArray (y - xpos, x - xpos) mod 10 = team) or (controlArray (y - xpos, x - xpos) mod 10 = 3)
				    exit when not pieceArray (y - xpos, x - xpos) = 30
				end if
			    end if
			end for
			for xpos : 1 .. 7                         %Anything plus 8 will always be out of range
			    %Bottom left
			    if x - xpos >= 1 and y + xpos <= 8 then
				if y + xpos = kingPos (checkTeam, 1) and x - xpos = kingPos (checkTeam, 2) then
				    if blockPossible = false then
					result true
				    end if
				    exit when (controlArray (y + xpos, x - xpos) mod 10 = team) or (controlArray (y + xpos, x - xpos) mod 10 = 3)
				    exit when not pieceArray (y + xpos, x - xpos) = 30
				end if
			    end if
			end for
			for xpos : 1 .. 7                             %Anything plus 8 will always be out of range
			    %Top right
			    if y - xpos >= 1 and x + xpos <= 8 then
				if y - xpos = kingPos (checkTeam, 1) and x + xpos = kingPos (checkTeam, 2) then
				    if blockPossible = false then
					result true
				    end if
				    exit when (controlArray (y - xpos, x + xpos) mod 10 = team) or (controlArray (y - xpos, x + xpos) mod 10 = 3)
				    exit when not pieceArray (y - xpos, x + xpos) = 30
				end if
			    end if
			end for
			for pos : y .. 8                                 %Look vertically below
			    if not pos = y then
				if pos = kingPos (checkTeam, 1) and y = kingPos (checkTeam, 2) then
				    if blockPossible = false then
					result true
				    end if
				    exit when (controlArray (pos, x) mod 10 = team) or (controlArray (pos, x) mod 10 = 3)
				    exit when not pieceArray (pos, x) = 30
				end if
			    end if
			end for
			for decreasing pos : y .. 1                                     %Look vertically above
			    if not pos = y then
				if pos = kingPos (checkTeam, 1) and y = kingPos (checkTeam, 2) then
				    if blockPossible = false then
					result true
				    end if
				    exit when (controlArray (pos, x) mod 10 = team) or (controlArray (pos, x) mod 10 = 3)
				    exit when not pieceArray (pos, x) = 30
				end if
			    end if
			end for

			for pos : x .. 8                                         %Look to the right
			    if not pos = x then
				if y = kingPos (checkTeam, 1) and pos = kingPos (checkTeam, 2) then
				    if blockPossible = false then
					result true
				    end if
				    exit when (controlArray (y, pos) mod 10 = team) or (controlArray (y, pos) mod 10 = 3)
				    exit when not pieceArray (y, pos) = 30
				end if
			    end if
			end for
			for decreasing pos : x .. 1                                             %Look to the left
			    if not pos = x then
				if y = kingPos (checkTeam, 1) and pos = kingPos (checkTeam, 2) then
				    if blockPossible = false then
					result true
				    end if
				    exit when (controlArray (y, pos) mod 10 = team) or (controlArray (y, pos) mod 10 = 3)
				    exit when not pieceArray (y, pos) = 30
				end if
			    end if
			end for

		    elsif piece = 6 then                                                 %King
			for ypos : -1 .. 1
			    for xpos : -1 .. 1
				if not (xpos = 0 and ypos = 0) then
				    if ypos + y <= 8 and ypos + y >= 1 and xpos + x <= 8 and xpos + x >= 1 then
					controlArray := addControl (y + ypos, x + xpos, team, controlArray)
				    end if
				end if
			    end for
			end for
		    end if
		end if
	    end if
	end for
    end for
    result false
end isMate
