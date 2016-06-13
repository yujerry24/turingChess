/*
Turing Chess image import code
*/

% Chess board image
var chessImg : int
chessImg := Pic.FileNew ("images/emptyBoard.jpg")
chessImg := Pic.Scale (chessImg, 400,400)

%Danger zone!

% PAWNS

% Black pawn image
var blackPawnIMG : int
blackPawnIMG := Pic.FileNew ("images/blackPawn.bmp")
blackPawnIMG := Pic.Scale (blackPawnIMG, 50, 50)
% White pawn image
var whitePawnIMG : int
whitePawnIMG := Pic.FileNew ("images/whitePawn.bmp")
whitePawnIMG := Pic.Scale (whitePawnIMG, 50, 50)

% ROOKS

% Black rook image
var blackRookIMG : int
blackRookIMG := Pic.FileNew ("images/blackRook.bmp")
blackRookIMG := Pic.Scale (blackRookIMG, 50, 50)
% White rook image
var whiteRookIMG : int
whiteRookIMG := Pic.FileNew ("images/whiteRook.bmp")
whiteRookIMG := Pic.Scale (whiteRookIMG, 50, 50)

% KNIGHTS

% Black knight image
var blackKnightIMG : int
blackKnightIMG := Pic.FileNew ("images/blackKnight.bmp")
blackKnightIMG := Pic.Scale (blackKnightIMG, 50, 50)

% White knight image
var whiteKnightIMG : int
whiteKnightIMG := Pic.FileNew ("images/whiteKnight.bmp")
whiteKnightIMG := Pic.Scale (whiteKnightIMG, 50, 50)

% BISHOPS

% Black bishop image
var blackBishopIMG : int
blackBishopIMG := Pic.FileNew ("images/blackBishop.bmp")
blackBishopIMG := Pic.Scale (blackBishopIMG, 50, 50)

% White bishop image
var whiteBishopIMG : int
whiteBishopIMG := Pic.FileNew ("images/whiteBishop.bmp")
whiteBishopIMG := Pic.Scale (whiteBishopIMG, 50, 50)

% KINGS

% Black king image
var blackKingIMG : int
blackKingIMG := Pic.FileNew ("images/blackKing.bmp")
blackKingIMG := Pic.Scale (blackKingIMG, 50, 50)

% White king image
var whiteKingIMG : int
whiteKingIMG := Pic.FileNew ("images/whiteKing.bmp")
whiteKingIMG := Pic.Scale (whiteKingIMG, 50, 50)

% QUEENS

% Black queen image
var blackQueenIMG : int
blackQueenIMG := Pic.FileNew ("images/blackQueen.bmp")
blackQueenIMG := Pic.Scale (blackQueenIMG, 50, 50)

% White queen image
var whiteQueenIMG : int
whiteQueenIMG := Pic.FileNew ("images/whiteQueen.bmp")
whiteQueenIMG := Pic.Scale (whiteQueenIMG, 50, 50)



