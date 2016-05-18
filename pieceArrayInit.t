var pieceArray : array 1 .. 8, 1 .. 8 of int
var boardControlArray : array 1 .. 8, 1 .. 8 of int
for ii : 1 .. 8
    for hh : 1 .. 8
	pieceArray (ii, hh) := 30
    end for

end for
pieceArray (8, 1) := 12
pieceArray (8, 8) := 12
pieceArray (8, 2) := 13
pieceArray (8, 7) := 13
pieceArray (8, 3) := 14
pieceArray (8, 6) := 14
pieceArray (8, 4) := 15
pieceArray (8, 5) := 16
for aaa : 1 .. 8
    pieceArray (7, aaa) := 11
end for
pieceArray (1, 1) := 22
pieceArray (1, 8) := 22
pieceArray (1, 2) := 23
pieceArray (1, 7) := 23
pieceArray (1, 3) := 24
pieceArray (1, 6) := 24
pieceArray (1, 4) := 25
pieceArray (1, 5) := 26
for bbb : 1 .. 8
    pieceArray (2, bbb) := 21
end for

