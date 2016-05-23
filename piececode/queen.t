%queen
%bishop
put "test"
var TLDW : boolean := true
var TRDW : boolean := true
var BLDW : boolean := true
var BRDW : boolean := true
var v1 : int := 0
var v2 : int := 0
var v3 : int := 0
var v4 : int := 0

if teamNumber = 10 then
    if pieceArray (ypos, xpos) = 15 then
	result pieceArray
    end if
    for value1 : 1 .. 7
	v1 := value1 + xpos
	v2 := xpos - value1
	v3 := value1 + ypos
	v4 := ypos - value1
	if v3 <= 8 and v3 >= 1 and v1 <= 8 and v1 >= 1 then
	    if pieceArray (ypos + value1, xpos + value1) = 30 then

	    elsif pieceArray (ypos + value1, xpos + value1) = 15 and BRDW = true then
		returnArray (ypos + value1, xpos + value1) := 30
		returnArray (ypos, xpos) := 15
		pieceFound := true
		result returnArray
	    else
		BRDW := false

	    end if
	end if

	if v3 <= 8 and v3 >= 1 and v2 <= 8 and v2 >= 1 then
	    if pieceArray (ypos + value1, xpos - value1) = 30 then

	    elsif pieceArray (ypos + value1, xpos - value1) = 15 and BLDW = true then
		returnArray (ypos + value1, xpos - value1) := 30
		returnArray (ypos, xpos) := 15
		pieceFound := true
		result returnArray
	    else
		BLDW := false

	    end if
	end if

	if v4 <= 8 and v4 >= 1 and v1 <= 8 and v1 >= 1 then
	    if pieceArray (ypos - value1, xpos + value1) = 30 then

	    elsif pieceArray (ypos - value1, xpos + value1) = 15 and TLDW = true then
		returnArray (ypos - value1, xpos + value1) := 30
		returnArray (ypos, xpos) := 15
		pieceFound := true
		result returnArray
	    else
		TLDW := false
	    end if
	end if

	if v4 <= 8 and v4 >= 1 and v2 <= 8 and v2 >= 1 then
	    if pieceArray (ypos - value1, xpos - value1) = 30 then

	    elsif pieceArray (ypos - value1, xpos - value1) = 15 and TRDW = true then
		returnArray (ypos - value1, xpos - value1) := 30
		returnArray (ypos, xpos) := 15
		pieceFound := true
		result returnArray
	    else
		TRDW := false
	    end if
	end if

    end for
end if

%bishop black
var TLDB : boolean := true
var TRDB : boolean := true
var BLDB : boolean := true
var BRDB : boolean := true
var v5 : int := 0
var v6 : int := 0
var v7 : int := 0
var v8 : int := 0
if teamNumber = 20 then
    if pieceArray (ypos, xpos) = 25 then
	result pieceArray
    end if
    for value2 : 1 .. 7
	v5 := value2 + xpos
	v6 := xpos - value2
	v7 := value2 + ypos
	v8 := ypos - value2
	if v7 <= 8 and v7 >= 1 and v5 <= 8 and v5 >= 1 then
	    if pieceArray (ypos + value2, xpos + value2) = 30 then

	    elsif pieceArray (ypos + value2, xpos + value2) = 25 and BRDB = true then
		returnArray (ypos + value2, xpos + value2) := 30
		returnArray (ypos, xpos) := 25
		pieceFound := true
		result returnArray
	    else
		BRDB := false

	    end if
	end if
	if v7 <= 8 and v7 >= 1 and v6 <= 8 and v6 >= 1 then
	    if pieceArray (ypos + value2, xpos - value2) = 30 then

	    elsif pieceArray (ypos + value2, xpos - value2) = 25 and BLDB = true then
		returnArray (ypos + value2, xpos - value2) := 30
		returnArray (ypos, xpos) := 25
		pieceFound := true
		result returnArray
	    else
		BLDB := false

	    end if
	end if
	if v8 <= 8 and v8 >= 1 and v5 <= 8 and v5 >= 1 then
	    if pieceArray (ypos - value2, xpos + value2) = 30 then

	    elsif pieceArray (ypos - value2, xpos + value2) = 25 and TLDB = true then
		returnArray (ypos - value2, xpos + value2) := 30
		returnArray (ypos, xpos) := 25
		pieceFound := true
		result returnArray
	    else
		TLDB := false
	    end if
	end if
	if v8 <= 8 and v8 >= 1 and v6 <= 8 and v6 >= 1 then
	    if pieceArray (ypos - value2, xpos - value2) = 30 then

	    elsif pieceArray (ypos - value2, xpos - value2) = 25 and TRDW = true then
		returnArray (ypos - value2, xpos - value2) := 30
		returnArray (ypos, xpos) := 25
		pieceFound := true
		result returnArray
	    else
		TRDB := false
	    end if
	end if

    end for
end if
result pieceArray
