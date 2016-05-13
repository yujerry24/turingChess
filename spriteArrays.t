/*
Turing Chess sprite array init code
*/

% Black pawn sprite array
var blackPawnArray : array 1 .. 8 of int
for i : 1 .. 8
    blackPawnArray (i) := Sprite.New (blackPawnIMG)
    Sprite.SetPosition (blackPawnArray (i), (i) * 50 - 25, 325, true)
    Sprite.Show (blackPawnArray (i))
end for

% White pawn sprite array
var whitePawnArray : array 1 .. 8 of int
for h : 1 .. 8
    whitePawnArray (h) := Sprite.New (whitePawnIMG)
    Sprite.SetPosition (whitePawnArray (h), (h) * 50 - 25, 75, true)
    Sprite.Show (whitePawnArray (h))
end for


% Black rook sprite array
var blackRookArray : array 1 .. 2 of int
for a : 1 .. 2
    blackRookArray (a) := Sprite.New (blackRookIMG)
    if a = 1 then
	Sprite.SetPosition (blackRookArray (a), 25, 375, true)
	Sprite.Show (blackRookArray (a))
    end if
    if a = 2 then
	Sprite.SetPosition (blackRookArray (a), 375, 375, true)
	Sprite.Show (blackRookArray (a))
    end if
end for


% Black knight sprite array
var blackKnightArray : array 1 .. 2 of int
for b : 1 .. 2
    blackKnightArray (b) := Sprite.New (blackKnightIMG)
    if b = 1 then
	Sprite.SetPosition (blackKnightArray (b), 75, 375, true)
	Sprite.Show (blackKnightArray (b))
    end if
    if b = 2 then
	Sprite.SetPosition (blackKnightArray (b), 325, 375, true)
	Sprite.Show (blackKnightArray (b))
    end if
end for

% Black knight sprite array
var blackBishopArray : array 1 .. 2 of int
for c : 1 .. 2
    blackBishopArray (c) := Sprite.New (blackBishopIMG)
    if c = 1 then
	Sprite.SetPosition (blackBishopArray (c), 125, 375, true)
	Sprite.Show (blackBishopArray (c))
    end if
    if c = 2 then
	Sprite.SetPosition (blackBishopArray (c), 275, 375, true)
	Sprite.Show (blackBishopArray (c))
    end if
end for

% Black king array
var blackKingArray : array 1 .. 1 of int
for d : 1 .. 1
    blackKingArray (d) := Sprite.New (blackKingIMG)
    if d = 1 then
	Sprite.SetPosition (blackKingArray (d), 225, 375, true)
	Sprite.Show (blackKingArray (d))
    end if

end for

% Black queen array
var blackQueenArray : array 1 .. 1 of int
for e : 1 .. 1
    blackQueenArray (e) := Sprite.New (blackQueenIMG)
    if e = 1 then
	Sprite.SetPosition (blackQueenArray (e), 175, 375, true)
	Sprite.Show (blackQueenArray (e))
    end if

end for


% White rook sprite array
var whiteRookArray : array 1 .. 2 of int
for f : 1 .. 2
    whiteRookArray (f) := Sprite.New (whiteRookIMG)
    if f = 1 then
	Sprite.SetPosition (whiteRookArray (f), 25, 25, true)
	Sprite.Show (whiteRookArray (f))
    end if
    if f = 2 then
	Sprite.SetPosition (whiteRookArray (f), 375, 25, true)
	Sprite.Show (whiteRookArray (f))
    end if
end for


% White knight sprite array
var whiteKnightArray : array 1 .. 2 of int
for g : 1 .. 2
    whiteKnightArray (g) := Sprite.New (whiteKnightIMG)
    if g = 1 then
	Sprite.SetPosition (whiteKnightArray (g), 75, 25, true)
	Sprite.Show (whiteKnightArray (g))
    end if
    if g = 2 then
	Sprite.SetPosition (whiteKnightArray (g), 325, 25, true)
	Sprite.Show (whiteKnightArray (g))
    end if
end for


% White bishop sprite array
var whiteBishopArray : array 1 .. 2 of int
for j : 1 .. 2
    whiteBishopArray (j) := Sprite.New (whiteBishopIMG)
    if j = 1 then
	Sprite.SetPosition (whiteBishopArray (j), 125, 25, true)
	Sprite.Show (whiteBishopArray (j))
    end if
    if j = 2 then
	Sprite.SetPosition (whiteBishopArray (j), 275, 25, true)
	Sprite.Show (whiteBishopArray (j))
    end if
end for


% White king array
var whiteKingArray : array 1 .. 1 of int
for k : 1 .. 1
    whiteKingArray (k) := Sprite.New (whiteKingIMG)
    if k = 1 then
	Sprite.SetPosition (whiteKingArray (k), 225, 25, true)
	Sprite.Show (whiteKingArray (k))
    end if
end for

% White queen array
var whiteQueenArray : array 1 .. 1 of int
for g : 1 .. 1
    whiteQueenArray (g) := Sprite.New (whiteQueenIMG)
    if g = 1 then
	Sprite.SetPosition (whiteQueenArray (g), 175, 25, true)
	Sprite.Show (whiteQueenArray (g))
    end if
end for
