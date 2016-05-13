/*
Turing Chess image import code
*/

% Chess board sprite
var chessSprite, chessImg : int
chessImg := Pic.FileNew ("emptyBoard.jpg")
chessImg := Pic.Scale (chessImg, 800, 800)
chessSprite := Sprite.New (chessImg)
Sprite.SetPosition (chessSprite, 0, 0, false)
Sprite.Show (chessSprite)

% PAWNS

% Black pawn sprite
var blackPawnIMG, blackPawnSPR : int
blackPawnIMG := Pic.FileNew ("blackPawn.bmp")
blackPawnIMG := Pic.Scale (blackPawnIMG, 100, 100)
blackPawnSPR := Sprite.New (blackPawnIMG)
% White pawn sprite
var whitePawnIMG, whitePawnSPR : int
whitePawnIMG := Pic.FileNew ("whitePawn.bmp")
whitePawnIMG := Pic.Scale (whitePawnIMG, 100, 100)
whitePawnSPR := Sprite.New (whitePawnIMG)

% ROOKS

% Black rook sprite
var blackRookIMG, blackRookSPR : int
blackRookIMG := Pic.FileNew ("blackRook.bmp")
blackRookIMG := Pic.Scale (blackRookIMG, 100, 100)
blackRookSPR := Sprite.New (blackRookIMG)
% White rook sprite
var whiteRookIMG, whiteRookSPR : int
whiteRookIMG := Pic.FileNew ("whiteRook.bmp")
whiteRookIMG := Pic.Scale (whiteRookIMG, 100, 100)
whiteRookSPR := Sprite.New (whiteRookIMG)

% KNIGHTS

% Black knight sprite
var blackKnightIMG, blackKnightSPR : int
blackKnightIMG := Pic.FileNew ("blackKnight.bmp")
blackKnightIMG := Pic.Scale (blackKnightIMG, 100, 100)
blackKnightSPR := Sprite.New (blackKnightIMG)
% White knight sprite
var whiteKnightIMG, whiteKnightSPR : int
whiteKnightIMG := Pic.FileNew ("whiteKnight.bmp")
whiteKnightIMG := Pic.Scale (whiteKnightIMG, 100, 100)
whiteKnightSPR := Sprite.New (whiteKnightIMG)

% BISHOPS

% Black bishop sprite
var blackBishopIMG, blackBishopSPR : int
blackBishopIMG := Pic.FileNew ("blackBishop.bmp")
blackBishopIMG := Pic.Scale (blackBishopIMG, 100, 100)
blackBishopSPR := Sprite.New (blackBishopIMG)
% White bishop sprite
var whiteBishopIMG, whiteBishopSPR : int
whiteBishopIMG := Pic.FileNew ("whiteBishop.bmp")
whiteBishopIMG := Pic.Scale (whiteBishopIMG, 100, 100)
whiteBishopSPR := Sprite.New (whiteBishopIMG)

% KINGS

% Black king sprite
var blackKingIMG, blackKingSPR : int
blackKingIMG := Pic.FileNew ("blackKing.bmp")
blackKingIMG := Pic.Scale (blackKingIMG, 100, 100)
blackKingSPR := Sprite.New (blackKingIMG)
% White king sprite
var whiteKingIMG, whiteKingSPR : int
whiteKingIMG := Pic.FileNew ("whiteKing.bmp")
whiteKingIMG := Pic.Scale (whiteKingIMG, 100, 100)
whiteKingSPR := Sprite.New (whiteKingIMG)

% QUEENS

% Black queen sprite
var blackQueenIMG, blackQueenSPR : int
blackQueenIMG := Pic.FileNew ("blackQueen.bmp")
blackQueenIMG := Pic.Scale (blackQueenIMG, 100, 100)
blackQueenSPR := Sprite.New (blackQueenIMG)
% White queen sprite
var whiteQueenIMG, whiteQueenSPR : int
whiteQueenIMG := Pic.FileNew ("whiteQueen.bmp")
whiteQueenIMG := Pic.Scale (whiteQueenIMG, 100, 100)
whiteQueenSPR := Sprite.New (whiteQueenIMG)



