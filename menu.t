procedure menu
var font1 : int
font1 := Font.New ("MS Serif:33:Bold")
var blackScore : int := 0
var whiteScore : int := 0
var lastBlackMove : string := "N/A"
var lastWhiteMove : string := "N/A"
Font.Draw ("Turing Chess", maxx div 2 - 120, maxy - 100, font1, black)

drawbox (maxx div 2 - 120, maxy - 250, maxx div 2 + 120, maxy - 150, black)
Font.Draw ("Play Game", maxx div 2 - 100, maxy - 220, font1, black)
drawbox (maxx div 2 - 120, maxy - 400, maxx div 2 + 120, maxy - 300, black)
Font.Draw ("How To Play", maxx div 2 - 110, maxy - 360, font1, black)
drawbox (maxx div 2 - 120, maxy - 550, maxx div 2 + 120, maxy - 450, black)
Font.Draw ("Scoreboard", maxx div 2 - 100, maxy - 525, font1, black)
drawbox (maxx div 2 - 120, maxy - 650, maxx div 2 + 120, maxy - 575, black)
Font.Draw ("Quit", maxx div 2 - 40, maxy - 622, font1, black)
end menu
