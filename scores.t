procedure scores (blackScores: int, whiteScores: int, lastBlackMove : string, lastWhiteMove : string)
    var font1 : int
    font1 := Font.New ("MS Serif:33:Bold")
    var lastBlackMoves: string :=Str.Upper(lastBlackMove(1))+Str.Lower(lastBlackMove(2))+lastBlackMove(3)
    var lastWhiteMoves: string:=Str.Upper(lastWhiteMove(1))+Str.Lower(lastWhiteMove(2))+lastWhiteMove(3)
    
    
    Font.Draw ("Black Points", maxx div 2 - 300, maxy div 2 + 150, font1, black)
    Font.Draw ("White Points", maxx div 2 - 000, maxy div 2 + 150, font1, black)
    Font.Draw (intstr (blackScores), maxx div 2 - 200, maxy div 2 + 50, font1, black)
    Font.Draw (intstr (whiteScores), maxx div 2 + 100, maxy div 2 + 50, font1, black)
    Font.Draw ("Last Black Move", maxx div 2 - 350, maxy div 2 - 50, font1, black)
    Font.Draw ("Last White Move", maxx div 2 - 000, maxy div 2 - 50, font1, black)
    Font.Draw (lastBlackMoves, maxx div 2 - 250, maxy div 2 - 150, font1, black)
    Font.Draw (lastWhiteMoves, maxx div 2 + 100, maxy div 2 - 150, font1, black)

end scores
