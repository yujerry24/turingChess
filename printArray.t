procedure printArray (grid : array 1 .. 8, 1 .. 8 of int)
    for i : 1 .. 8
	for h : 1 .. 8
	    put grid (i, h) ..
	    if h = 8 then
		put grid (i, h)
	    end if
	end for
    end for

end printArray
