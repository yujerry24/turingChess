procedure HowToPlay
var font1 : int
    font1 := Font.New ("MS Serif:33:Bold")
    include "imageImport.t"
    Font.Draw ("How To Play", maxx div 2 - 120, maxy - 100, font1, black)
	drawbox (maxx div 2 - 120, maxy - 690, maxx div 2 + 120, maxy - 615, black)
	Font.Draw ("Back", maxx div 2 - 60, maxy - 670, font1, black)
	locate (10, 1)
	put "Pawn: Each player has 8 pawns. The pawn can move one or two space(s)"
	put "on the first move and one space forward each move after. "
	put "However, despite by having a forward movement of one space, "
	put "the pawn cannot capture forward. The pawn can capture any enemy piece "
	put "directly diagonally infront of it (to the left or right) by one space."
	put ""
	put "Rook: Each player has two rooks. The rooks can move and capture horizontally"
	put "and vertically for an unlimited amount of spaces."
	put ""
	put "Knight: Each player has two knights. The knights' move consists of two spaces in "
	put "any horizontal or vertical direction and then one space perpendicular to the "
	put "the direction of the two spaces that was previously taken. It captures in the same way."
	put ""
	put "Bishop: Each player has two bishops. The bishops' move/capture consists of any amount"
	put "of spaces in any diagonal direction. "
	put ""
	put "Queen: Each player has one queen. The queen moves/capture in any horizontal, vertical, "
	put "and diagonal direction for an umlimted of spaces"
	put ""
	put "King: Each player has one king. The king can move/capture by one space in any direction. "
	put ""
	put "Objective: The objective of the game is to checkmate the other player's King. A checkmate occurs "
	put "when the enemy player's king is in a position that threatens the king's capture in the next move."
	put "If the king cannot legally move out of the space that it will be captured in and/or cannot eliminate "
	put "the enemy piece(s) threatening capture, then it is checkmate. As a result, you should use the rest of "
	put "your pieces to protect your king and attack the opposing enemy's king."
	Pic.Draw (whitePawnIMG, maxx div 2 + 200, maxy - 200, picMerge)
	Pic.Draw (blackPawnIMG, maxx div 2 + 250, maxy - 200, picMerge)
	Pic.Draw (whiteRookIMG, maxx div 2 + 200, maxy - 270, picMerge)
	Pic.Draw (blackRookIMG, maxx div 2 + 250, maxy - 270, picMerge)
	Pic.Draw (whiteKnightIMG, maxx div 2 + 200, maxy - 330, picMerge)
	Pic.Draw (blackKnightIMG, maxx div 2 + 250, maxy - 330, picMerge)
	Pic.Draw (whiteBishopIMG, maxx div 2 + 200, maxy - 390, picMerge)
	Pic.Draw (blackBishopIMG, maxx div 2 + 250, maxy - 390, picMerge)
	Pic.Draw (whiteQueenIMG, maxx div 2 + 200, maxy - 440, picMerge)
	Pic.Draw (blackQueenIMG, maxx div 2 + 250, maxy - 440, picMerge)
	Pic.Draw (whiteKingIMG, maxx div 2 + 200, maxy - 500, picMerge)
	Pic.Draw (blackKingIMG, maxx div 2 + 250, maxy - 500, picMerge)

end HowToPlay
