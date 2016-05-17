function compareArray (grid1 : array 1 .. 8, 1 .. 8 of int, grid2 : array 1 .. 8, 1 .. 8 of int) : boolean
    for misha : 1 .. 8
	for jerry : 1 .. 8
	    if not (grid1 (misha, jerry) = grid2 (misha, jerry)) then
		result false
	    end if
	end for
    end for
    result true
end compareArray
