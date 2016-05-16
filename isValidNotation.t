function isValidNotation (inputString : string) : boolean
    if index ("KQRBNP", inputString (1)) = 0 then
	result false
    elsif index ("ABCDEFGH", inputString (2)) = 0 then
	result false
    elsif not strintok (inputString (3)) or strint (inputString (3)) > 8 then
	result false
    else
	result true
    end if
end isValidNotation
