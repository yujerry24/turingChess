%This function is entirely for debug and should not be included in the final project

procedure printArray (grid : array 1 .. 8, 1 .. 8 of int)
    for i : 1 .. 8
	for h : 1 .. 8
	    put grid (i, h), " " ..
	end for
	put ""
    end for 
end printArray
