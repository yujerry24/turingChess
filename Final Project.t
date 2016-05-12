setscreen ("graphics:max;max,nobuttonbar")

var chessSprite, chessImg : int
chessImg:=Pic.FileNew("emptyBoard.jpg")
chessImg:=Pic.Scale(chessImg,800,800)
chessSprite:=Sprite.New(chessImg)
Sprite.SetPosition(chessSprite,0, 0, false)
Sprite.Show(chessSprite)

var blackPawnIMG,blackPawnSPR : int
blackPawnIMG:=Pic.FileNew("blackPawn.bmp")
blackPawnIMG:=Pic.Scale(blackPawnIMG,100,100)
blackPawnSPR:=Sprite.New(blackPawnIMG)

var blackPawnArray : array 1 .. 8 of int
for i : 1 .. 8
    blackPawnArray(i) := Sprite.New(blackPawnIMG)
    Sprite.SetPosition(blackPawnArray(i),(i) * 100 - 50, 650, true)
    Sprite.Show(blackPawnArray(i))
end for

