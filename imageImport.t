/*
Turing Chess image import code
*/

% Chess board sprite
var chessSprite, chessImg : int
chessImg := Pic.FileNew ("images/emptyBoard.jpg")
chessImg := Pic.Scale (chessImg, 400, 400)
chessSprite := Sprite.New (chessImg)
Sprite.SetPosition (chessSprite, 0, 0, false)
Sprite.Show (chessSprite)

% PAWNS

% Black pawn sprite
var blackPawnIMG, blackPawnSPR : int
blackPawnIMG := Pic.FileNew ("images/blackPawn.bmp")
blackPawnIMG := Pic.Scale (blackPawnIMG, 50, 50)
blackPawnSPR := Sprite.New (blackPawnIMG)
% White pawn sprite
var whitePawnIMG, whitePawnSPR : int
whitePawnIMG := Pic.FileNew ("images/whitePawn.bmp")
whitePawnIMG := Pic.Scale (whitePawnIMG, 50, 50)
whitePawnSPR := Sprite.New (whitePawnIMG)

% ROOKS

% Black rook sprite
var blackRookIMG, blackRookSPR : int
blackRookIMG := Pic.FileNew ("images/blackRook.bmp")
blackRookIMG := Pic.Scale (blackRookIMG, 50, 50)
blackRookSPR := Sprite.New (blackRookIMG)
% White rook sprite
var whiteRookIMG, whiteRookSPR : int
whiteRookIMG := Pic.FileNew ("images/whiteRook.bmp")
whiteRookIMG := Pic.Scale (whiteRookIMG, 50, 50)
whiteRookSPR := Sprite.New (whiteRookIMG)

% KNIGHTS

% Black knight sprite
var blackKnightIMG, blackKnightSPR : int
blackKnightIMG := Pic.FileNew ("images/blackKnight.bmp")
blackKnightIMG := Pic.Scale (blackKnightIMG, 50, 50)
blackKnightSPR := Sprite.New (blackKnightIMG)
% White knight sprite
var whiteKnightIMG, whiteKnightSPR : int
whiteKnightIMG := Pic.FileNew ("images/whiteKnight.bmp")
whiteKnightIMG := Pic.Scale (whiteKnightIMG, 50, 50)
whiteKnightSPR := Sprite.New (whiteKnightIMG)

% BISHOPS

% Black bishop sprite
var blackBishopIMG, blackBishopSPR : int
blackBishopIMG := Pic.FileNew ("images/blackBishop.bmp")
blackBishopIMG := Pic.Scale (blackBishopIMG, 50, 50)
blackBishopSPR := Sprite.New (blackBishopIMG)
% White bishop sprite
var whiteBishopIMG, whiteBishopSPR : int
whiteBishopIMG := Pic.FileNew ("images/whiteBishop.bmp")
whiteBishopIMG := Pic.Scale (whiteBishopIMG, 50, 50)
whiteBishopSPR := Sprite.New (whiteBishopIMG)

% KINGS

% Black king sprite
var blackKingIMG, blackKingSPR : int
blackKingIMG := Pic.FileNew ("images/blackKing.bmp")
blackKingIMG := Pic.Scale (blackKingIMG, 50, 50)
blackKingSPR := Sprite.New (blackKingIMG)
% White king sprite
var whiteKingIMG, whiteKingSPR : int
whiteKingIMG := Pic.FileNew ("images/whiteKing.bmp")
whiteKingIMG := Pic.Scale (whiteKingIMG, 50, 50)
whiteKingSPR := Sprite.New (whiteKingIMG)

% QUEENS

% Black queen sprite
var blackQueenIMG, blackQueenSPR : int
blackQueenIMG := Pic.FileNew ("images/blackQueen.bmp")
blackQueenIMG := Pic.Scale (blackQueenIMG, 50, 50)
blackQueenSPR := Sprite.New (blackQueenIMG)
% White queen sprite
var whiteQueenIMG, whiteQueenSPR : int
whiteQueenIMG := Pic.FileNew ("images/whiteQueen.bmp")
whiteQueenIMG := Pic.Scale (whiteQueenIMG, 50, 50)
whiteQueenSPR := Sprite.New (whiteQueenIMG)



