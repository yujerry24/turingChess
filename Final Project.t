% Chess Program


% The display screen format
setscreen ("graphics:max;max,nobuttonbar")

var font1 : int
font1 := Font.New ("MS Serif:33:Bold") 
Font.Draw("Chess 2-Player", maxx div 2, maxy-100,font1, black)

include "imageImport.t"

% Black pawn sprite array
var blackPawnArray : array 1 .. 8 of int
for i : 1 .. 8
    blackPawnArray (i) := Sprite.New (blackPawnIMG)
    Sprite.SetPosition (blackPawnArray (i), (i) * 100 - 50, 650, true)
    Sprite.Show (blackPawnArray (i))
end for

% White pawn sprite array
var whitePawnArray : array 1 .. 8 of int
for h : 1 .. 8
    whitePawnArray (h) := Sprite.New (whitePawnIMG)
    Sprite.SetPosition (whitePawnArray (h), (h) * 100 - 50, 150, true)
    Sprite.Show (whitePawnArray (h))
end for


% Black rook sprite array
var blackRookArray : array 1 .. 2 of int
for a : 1 .. 2
    blackRookArray (a) := Sprite.New (blackRookIMG)
    if a = 1 then
	Sprite.SetPosition (blackRookArray (a), 50, 750, true)
	Sprite.Show (blackRookArray (a))
    end if
    if a = 2 then
	Sprite.SetPosition (blackRookArray (a), 750, 750, true)
	Sprite.Show (blackRookArray (a))
    end if
end for


% Black knight sprite array
var blackKnightArray : array 1 .. 2 of int
for b : 1 .. 2
    blackKnightArray (b) := Sprite.New (blackKnightIMG)
    if b = 1 then
	Sprite.SetPosition (blackKnightArray (b), 150, 750, true)
	Sprite.Show (blackKnightArray (b))
    end if
    if b = 2 then
	Sprite.SetPosition (blackKnightArray (b), 650, 750, true)
	Sprite.Show (blackKnightArray (b))
    end if
end for

% Black knight sprite array
var blackBishopArray : array 1 .. 2 of int
for c : 1 .. 2
    blackBishopArray (c) := Sprite.New (blackBishopIMG)
    if c = 1 then
	Sprite.SetPosition (blackBishopArray (c), 250, 750, true)
	Sprite.Show (blackBishopArray (c))
    end if
    if c = 2 then
	Sprite.SetPosition (blackBishopArray (c), 550, 750, true)
	Sprite.Show (blackBishopArray (c))
    end if
end for

% Black king array
var blackKingArray : array 1 .. 1 of int
for d : 1 .. 1
    blackKingArray (d) := Sprite.New (blackKingIMG)
    if d = 1 then
	Sprite.SetPosition (blackKingArray (d), 450, 750, true)
	Sprite.Show (blackKingArray (d))
    end if
   
end for

% Black queen array
var blackQueenArray : array 1 .. 1 of int
for e : 1 .. 1
    blackQueenArray (e) := Sprite.New (blackQueenIMG)
    if e = 1 then
	Sprite.SetPosition (blackQueenArray (e), 350, 750, true)
	Sprite.Show (blackQueenArray (e))
    end if
   
end for


% White rook sprite array
var whiteRookArray : array 1 .. 2 of int
for f : 1 .. 2
    whiteRookArray (f) := Sprite.New (whiteRookIMG)
    if f = 1 then
	Sprite.SetPosition (whiteRookArray (f), 50, 50, true)
	Sprite.Show (whiteRookArray (f))
    end if
    if f = 2 then
	Sprite.SetPosition (whiteRookArray (f), 750, 50, true)
	Sprite.Show (whiteRookArray (f))
    end if
end for


% White knight sprite array
var whiteKnightArray : array 1 .. 2 of int
for g : 1 .. 2
    whiteKnightArray (g) := Sprite.New (whiteKnightIMG)
    if g = 1 then
	Sprite.SetPosition (whiteKnightArray (g), 150, 50, true)
	Sprite.Show (whiteKnightArray (g))
    end if
    if g = 2 then
	Sprite.SetPosition (whiteKnightArray (g), 650, 50, true)
	Sprite.Show (whiteKnightArray (g))
    end if
end for


% White bishop sprite array
var whiteBishopArray : array 1 .. 2 of int
for j : 1 .. 2
    whiteBishopArray (j) := Sprite.New (whiteBishopIMG)
    if j = 1 then
	Sprite.SetPosition (whiteBishopArray (j), 250, 50, true)
	Sprite.Show (whiteBishopArray (j))
    end if
    if j = 2 then
	Sprite.SetPosition (whiteBishopArray (j), 550, 50, true)
	Sprite.Show (whiteBishopArray (j))
    end if
end for


% White king array
var whiteKingArray : array 1 .. 1 of int
for k : 1 .. 1
    whiteKingArray (k) := Sprite.New (whiteKingIMG)
    if k = 1 then
	Sprite.SetPosition (whiteKingArray (k), 450, 50, true)
	Sprite.Show (whiteKingArray (k))
    end if
   
end for

% White queen array
var whiteQueenArray : array 1 .. 1 of int
for g : 1 .. 1
    whiteQueenArray (g) := Sprite.New (whiteQueenIMG)
    if g = 1 then
	Sprite.SetPosition (whiteQueenArray (g), 350, 50, true)
	Sprite.Show (whiteQueenArray (g))
    end if
   
end for
