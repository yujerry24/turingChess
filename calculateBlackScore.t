function calculateBlackScore (pieceArray : array 1 .. 8, 1 .. 8 of int) : int
    var totalScore := 39
    for i : 1 .. 8
	for h : 1 .. 8
	    if pieceArray (i, h) = 11 then
		totalScore := totalScore - 1
	    end if
	    if pieceArray (i, h) = 12 then
		totalScore := totalScore - 5
	    end if
	    if pieceArray (i, h) = 13 then
		totalScore := totalScore - 3
	    end if
	    if pieceArray (i, h) = 14 then
		totalScore := totalScore - 3
	    end if
	    if pieceArray (i, h) = 15 then
		totalScore := totalScore - 9
	    end if

	end for
    end for
    result totalScore
end calculateBlackScore
