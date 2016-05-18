if not pieceArray (ypos - pawnCheck, xpos) = teamNumber + 1 then
    result pieceArray
else
    returnArray (ypos, xpos) := teamNumber + 1
    returnArray (ypos - pawnCheck, xpos) := 30
    result returnArray
end if
