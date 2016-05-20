if pieceArray (ypos, xpos) = teamNumber + 6 then
    result pieceArray
elsif pieceArray (ypos + 1, xpos) = teamNumber + 6 then
    returnArray (ypos, xpos) := teamNumber + 6
    returnArray (ypos + 1, xpos) := 30
    pieceFound := true
    result returnArray
elsif pieceArray (ypos - 1, xpos) = teamNumber + 6 then
    returnArray (ypos, xpos) := teamNumber + 6
    returnArray (ypos - 1, xpos) := 30
    pieceFound := true
    result returnArray
elsif pieceArray (ypos, xpos + 1) = teamNumber + 6 then
    returnArray (ypos, xpos) := teamNumber + 6
    returnArray (ypos, xpos + 1) := 30
    pieceFound := true
    result returnArray
elsif pieceArray (ypos + 1, xpos + 1) = teamNumber + 6 then
    returnArray (ypos, xpos) := teamNumber + 6
    returnArray (ypos + 1, xpos + 1) := 30
    pieceFound := true
    result returnArray
elsif pieceArray (ypos - 1, xpos + 1) = teamNumber + 6 then
    returnArray (ypos, xpos) := teamNumber + 6
    returnArray (ypos - 1, xpos + 1) := 30
    pieceFound := true
    result returnArray
elsif pieceArray (ypos, xpos - 1) = teamNumber + 6 then
    returnArray (ypos, xpos) := teamNumber + 6
    returnArray (ypos, xpos - 1) := 30
    pieceFound := true
    result returnArray
elsif pieceArray (ypos + 1, xpos - 1) = teamNumber + 6 then
    returnArray (ypos, xpos) := teamNumber + 6
    returnArray (ypos + 1, xpos - 1) := 30
    pieceFound := true
    result returnArray
elsif pieceArray (ypos - 1, xpos - 1) = teamNumber + 6 then
    returnArray (ypos, xpos) := teamNumber + 6
    returnArray (ypos - 1, xpos - 1) := 30
    pieceFound := true
    result returnArray
else
    result pieceArray
end if
result returnArray
