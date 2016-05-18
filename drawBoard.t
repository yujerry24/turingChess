procedure drawBoard (grid : array 1 .. 8, 1 .. 8 of int)
    cls
    var alphastring : string := "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    var font1 : int := Font.New("mono:40")
    Pic.Draw (chessImg, 0, 0, picMerge)
    for i : 1 .. 8
	Font.Draw(intstr(i), 408, (i-1) * 50 + 8, font1, black)
	Font.Draw(alphastring(i), (i-1) * 50 + 8, 408, font1, black)
    end for
    for x : 1 .. 8
	for y : 1 .. 8
	    if grid (y, x) = 11 then %White pawns
		Pic.Draw (whitePawnIMG, (x - 1) * 50, (8 - y) * 50, picMerge)
	    elsif grid (y, x) = 21 then %Black pawns
		Pic.Draw (blackPawnIMG, (x - 1) * 50, (8 - y) * 50, picMerge)
	    elsif grid (y, x) = 12 then %White rooks
		Pic.Draw (whiteRookIMG, (x - 1) * 50, (8 - y) * 50, picMerge)
	    elsif grid (y, x) = 22 then %Black rooks
		Pic.Draw (blackRookIMG, (x - 1) * 50, (8 - y) * 50, picMerge)
	    elsif grid (y, x) = 13 then %White knights
		Pic.Draw (whiteKnightIMG, (x - 1) * 50, (8 - y) * 50, picMerge)
	    elsif grid (y, x) = 23 then %Black knights
		Pic.Draw (blackKnightIMG, (x - 1) * 50, (8 - y) * 50, picMerge)
	    elsif grid (y, x) = 14 then %White bishops
		Pic.Draw (whiteBishopIMG, (x - 1) * 50, (8 - y) * 50, picMerge)
	    elsif grid (y, x) = 24 then %Black bishops
		Pic.Draw (blackBishopIMG, (x - 1) * 50, (8 - y) * 50, picMerge)
	    elsif grid (y, x) = 15 then %White queen
		Pic.Draw (whiteQueenIMG, (x - 1) * 50, (8 - y) * 50, picMerge)
	    elsif grid (y, x) = 25 then %Black queen
		Pic.Draw (blackQueenIMG, (x - 1) * 50, (8 - y) * 50, picMerge)
	    elsif grid (y, x) = 16 then %White king
		Pic.Draw (whiteKingIMG, (x - 1) * 50, (8 - y) * 50, picMerge)
	    elsif grid (y, x) = 26 then %Black king
		Pic.Draw (blackKingIMG, (x - 1) * 50, (8 - y) * 50, picMerge)
	    end if
	end for
    end for
end drawBoard
