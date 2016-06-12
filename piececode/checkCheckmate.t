function checkCheckmate (grid : array 1 .. 8, 1 .. 8 of int, controlArray : array 1 .. 8, 1 .. 8 of int) : boolean
    var teamNumber : int := 0
    var oppositeTeam : int := 100
    var returnValue : boolean := true
   
    for i : 1 .. 8
	for h : 1 .. 8
	    teamNumber := grid (i, h) div 10
	    if teamNumber = 1 then
		oppositeTeam := 2
		teamNumber := 1
	    end if
	    if teamNumber = 2 then
		oppositeTeam := 1
		teamNumber := 2
	    end if
	    
	    if grid (i, h) = oppositeTeam * 10 + 6 then
		put "Test 1"
		delay(1000)
		for a : -1 .. 1
		    for b : -1 .. 1
			if (i + a <= 8 and i + a >= 1 and h + b <= 8 and h + b >= 1) then
			put "test 2"
			    if controlArray (i, h) mod 10 = oppositeTeam or controlArray (i, h) mod 10 = 3 then
			    put "test 3"
				
				
				if controlArray (i + a, h + b) = 30 + teamNumber then
				put "lol 1"
				    returnValue := false
				end if
				if controlArray (i + a, h + b) = 30 then
				    returnValue := false
				    put "lol 2"
				end if
				if controlArray (i + a, h + b) = oppositeTeam * 10 then
				    returnValue := false
				    put "lol 3"
				end if
				if controlArray (i + a, h + b) = oppositeTeam * 10 + teamNumber then
				    returnValue := false
				    put "lol 4"
				end if
			    else
				returnValue := false
			    end if
			end if
		    end for
		end for
	    end if
	end for
    end for
    result returnValue
end checkCheckmate
