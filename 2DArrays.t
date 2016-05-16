% 2-D Arrays
var boardPieceArray : array 1 .. 8, 1 .. 8 of int
var boardControlArray : array 1 .. 8, 1 .. 8 of int
for ii : 1 .. 8
    for hh : 1 .. 8
	boardPieceArray(ii,hh):=30
    end for
    
end for
boardPieceArray (8, 1) := 12
boardPieceArray (8, 8) := 12
boardPieceArray (8, 2) := 13
boardPieceArray (8, 7) := 13
boardPieceArray (8, 3) := 14
boardPieceArray (8, 6) := 14
boardPieceArray (8, 4) := 15
boardPieceArray (8, 5) := 16
for aaa : 1 .. 8
    boardPieceArray (7, aaa) := 11
end for
boardPieceArray (1, 1) := 22
boardPieceArray (1, 8) := 22
boardPieceArray (1, 2) := 23
boardPieceArray (1, 7) := 23
boardPieceArray (1, 3) := 24
boardPieceArray (1, 6) := 24
boardPieceArray (1, 4) := 25
boardPieceArray (1, 5) := 26
for bbb : 1 .. 8
    boardPieceArray (2, bbb) := 21
end for
for i : 1 .. 8
    for h : 1 .. 8
	put boardPieceArray (i, h), "  " ..
    end for
    put ""
end for
