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
