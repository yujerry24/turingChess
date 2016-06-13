procedure scores (blackScores: int, whiteScores : int)
    var font1 : int
    font1 := Font.New ("MS Serif:33:Bold")
   
    var lastBlackMove : string := "N/A"
    var lastWhiteMove : string := "N/A"
    Font.Draw ("Black Points", maxx div 2 - 300, maxy div 2 + 150, font1, black)
    Font.Draw ("White Points", maxx div 2 - 000, maxy div 2 + 150, font1, black)
    Font.Draw (intstr (blackScores), maxx div 2 - 200, maxy div 2 + 50, font1, black)
    Font.Draw (intstr (whiteScores), maxx div 2 + 100, maxy div 2 + 50, font1, black)
    Font.Draw ("Last Black Move", maxx div 2 - 350, maxy div 2 - 50, font1, black)
    Font.Draw ("Last White Move", maxx div 2 - 000, maxy div 2 - 50, font1, black)
    Font.Draw (lastBlackMove, maxx div 2 - 250, maxy div 2 - 150, font1, black)
    Font.Draw (lastWhiteMove, maxx div 2 + 100, maxy div 2 - 150, font1, black)

end scores
