function calculateWhiteScore (pieceArray : array 1 .. 8, 1 .. 8 of int) : int
    var totalScore := 39
    for i : 1 .. 8
	for h : 1 .. 8
	    if pieceArray (i, h) = 21 then
		totalScore := totalScore - 1
	    end if
	    if pieceArray (i, h) = 22 then
		totalScore := totalScore - 5
	    end if
	    if pieceArray (i, h) = 23 then
		totalScore := totalScore - 3
	    end if
	    if pieceArray (i, h) = 24 then
		totalScore := totalScore - 3
	    end if
	    if pieceArray (i, h) = 25 then
		totalScore := totalScore - 9
	    end if

	end for
    end for
    result totalScore
end calculateWhiteScore
