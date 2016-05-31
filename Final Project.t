%Chess Program
import GUI
setscreen ("graphics:max;max,nobuttonbar")
var blackScore : int := 0
var whiteScore : int := 0
var lastBlackMove : string := "N/A"
var lastWhiteMove : string := "N/A"
%Clicking Buttons
var x, y, notused1, notused2 : int
var tempArray : array 1 .. 8, 1 .. 8 of int
%Fonts
var font1 : int
font1 := Font.New ("MS Serif:33:Bold")

%The display screen format
var background : int := Pic.FileNew ("images/background.bmp")
var backgroundSPR : int
backgroundSPR := Sprite.New (background)
Sprite.SetPosition (backgroundSPR, maxx div 2, maxy div 2, true)
Sprite.Show (backgroundSPR)

Font.Draw ("Turing Chess", maxx div 2 - 120, maxy - 100, font1, black)

drawbox (maxx div 2 - 120, maxy - 250, maxx div 2 + 120, maxy - 150, black)
Font.Draw ("Play Game", maxx div 2 - 100, maxy - 220, font1, black)
drawbox (maxx div 2 - 120, maxy - 400, maxx div 2 + 120, maxy - 300, black)
Font.Draw ("How To Play", maxx div 2 - 110, maxy - 360, font1, black)
drawbox (maxx div 2 - 120, maxy - 550, maxx div 2 + 120, maxy - 450, black)
Font.Draw ("Scoreboard", maxx div 2 - 100, maxy - 525, font1, black)
drawbox (maxx div 2 - 120, maxy - 650, maxx div 2 + 120, maxy - 575, black)
Font.Draw ("Quit", maxx div 2 - 40, maxy - 622, font1, black)

%Loading text while the dozens of files are importing


%Input tracking + validation variables
var tempInput : string

%Movement variables
var movement : string
var whiteToMove : boolean := true
include "calculateBlackScore.t"
include "calculateWhiteScore.t"
include "imageImport.t"

include "pieceArrayInit.t"

include "isValidNotation.t"

include "compareArray.t"

include "drawBoard.t"

include "doMove.t"

include "clearBoard.t"
process moveSound
    Music.PlayFile ("pieceMoveSound.wav")
end moveSound

loop
    buttonwait ("down", x, y, notused1, notused2)
    %If mouse was clicked within the green box, show image
    if x > maxx div 2 - 120 and x < maxx div 2 + 120 and y > maxy - 250 and y < maxy - 150 then
	Sprite.Hide (backgroundSPR)

	loop
	    drawBoard (pieceArray)
	    Font.Draw ("Black Points", maxx div 2 - 500, maxy div 2 + 350, font1, black)
	    Font.Draw ("White Points", maxx div 2 - 200, maxy div 2 + 350, font1, black)
	    Font.Draw (intstr (blackScore), maxx div 2 - 400, maxy div 2 + 250, font1, black)
	    Font.Draw (intstr (whiteScore), maxx div 2 - 100, maxy div 2 + 250, font1, black)
	    Font.Draw ("Last Black Move", maxx div 2 - 550, maxy div 2 + 150, font1, black)
	    Font.Draw ("Last White Move", maxx div 2 - 200, maxy div 2 + 150, font1, black)
	    Font.Draw (lastBlackMove, maxx div 2 - 450, maxy div 2 + 50, font1, black)
	    Font.Draw (lastWhiteMove, maxx div 2 - 100, maxy div 2 + 50, font1, black)
	    %exit when checkWinner(pieceArray) %Add checkWinner function later
	    put "Enter your move (or \"help\" for help): " ..
	    get tempInput : *
	    if Str.Lower (tempInput) = "exit" then
		lastWhiteMove := "N/A"
		lastBlackMove := "N/A"
		whiteToMove := true
		tempArray := resetBoard (pieceArray)
		cls
		drawBoard (tempArray)
		pieceArray := tempArray
		blackScore := calculateBlackScore (pieceArray)

		whiteScore := calculateWhiteScore (pieceArray)
		cls
		Sprite.Show (backgroundSPR)

		Font.Draw ("Turing Chess", maxx div 2 - 120, maxy - 100, font1, black)

		drawbox (maxx div 2 - 120, maxy - 250, maxx div 2 + 120, maxy - 150, black)
		Font.Draw ("Play Game", maxx div 2 - 100, maxy - 220, font1, black)
		drawbox (maxx div 2 - 120, maxy - 400, maxx div 2 + 120, maxy - 300, black)
		Font.Draw ("How To Play", maxx div 2 - 110, maxy - 360, font1, black)
		drawbox (maxx div 2 - 120, maxy - 550, maxx div 2 + 120, maxy - 450, black)
		Font.Draw ("Scoreboard", maxx div 2 - 100, maxy - 525, font1, black)
		drawbox (maxx div 2 - 120, maxy - 650, maxx div 2 + 120, maxy - 575, black)
		Font.Draw ("Quit", maxx div 2 - 40, maxy - 622, font1, black)
		exit
	    end if
	    loop

		movement := Str.Upper (tempInput)
		if Str.Lower (tempInput) = "help" then
		    include "help.t"
		    drawBoard (pieceArray)
		    Font.Draw ("Black Points", maxx div 2 - 500, maxy div 2 + 350, font1, black)
		    Font.Draw ("White Points", maxx div 2 - 200, maxy div 2 + 350, font1, black)
		    Font.Draw (intstr (blackScore), maxx div 2 - 400, maxy div 2 + 250, font1, black)
		    Font.Draw (intstr (whiteScore), maxx div 2 - 100, maxy div 2 + 250, font1, black)
		    Font.Draw ("Last Black Move", maxx div 2 - 550, maxy div 2 + 150, font1, black)
		    Font.Draw ("Last White Move", maxx div 2 - 200, maxy div 2 + 150, font1, black)
		    Font.Draw (lastBlackMove, maxx div 2 - 450, maxy div 2 + 50, font1, black)
		    Font.Draw (lastWhiteMove, maxx div 2 - 100, maxy div 2 + 50, font1, black)
		    put "Enter your move (or \"help\" for help): " ..
		else
		    if movement = "EXIT" or movement = "exit" then
			exit
		    end if
		    if isValidNotation (movement) then
			
			comparisonArray := pieceArray
			pieceArray := doMove (movement, whiteToMove, pieceArray)
			if not compareArray (comparisonArray, pieceArray) and whiteToMove = true then
			    lastWhiteMove := tempInput
			end if
			if not compareArray (comparisonArray, pieceArray) and whiteToMove = false then
			    lastBlackMove := tempInput
			end if
			exit when not compareArray (comparisonArray, pieceArray)
		    end if
		    drawBoard (pieceArray)
		    put "Invalid move. Enter your move (or \"help\" for help): " ..
		    Font.Draw ("Black Points", maxx div 2 - 500, maxy div 2 + 350, font1, black)
		    Font.Draw ("White Points", maxx div 2 - 200, maxy div 2 + 350, font1, black)
		    Font.Draw (intstr (blackScore), maxx div 2 - 400, maxy div 2 + 250, font1, black)
		    Font.Draw (intstr (whiteScore), maxx div 2 - 100, maxy div 2 + 250, font1, black)
		    Font.Draw ("Last Black Move", maxx div 2 - 550, maxy div 2 + 150, font1, black)
		    Font.Draw ("Last White Move", maxx div 2 - 200, maxy div 2 + 150, font1, black)
		    Font.Draw (lastBlackMove, maxx div 2 - 450, maxy div 2 + 50, font1, black)
		    Font.Draw (lastWhiteMove, maxx div 2 - 100, maxy div 2 + 50, font1, black)
		end if


		get tempInput : *

	    end loop
	    if Str.Lower (movement) = "exit" then
		whiteToMove := true
		tempArray := resetBoard (pieceArray)
		cls
		drawBoard (tempArray)
		pieceArray := tempArray
		cls
		Sprite.Show (backgroundSPR)

		Font.Draw ("Turing Chess", maxx div 2 - 120, maxy - 100, font1, black)

		drawbox (maxx div 2 - 120, maxy - 250, maxx div 2 + 120, maxy - 150, black)
		Font.Draw ("Play Game", maxx div 2 - 100, maxy - 220, font1, black)
		drawbox (maxx div 2 - 120, maxy - 400, maxx div 2 + 120, maxy - 300, black)
		Font.Draw ("How To Play", maxx div 2 - 110, maxy - 360, font1, black)
		drawbox (maxx div 2 - 120, maxy - 550, maxx div 2 + 120, maxy - 450, black)
		Font.Draw ("Scoreboard", maxx div 2 - 100, maxy - 525, font1, black)
		drawbox (maxx div 2 - 120, maxy - 650, maxx div 2 + 120, maxy - 575, black)
		Font.Draw ("Quit", maxx div 2 - 40, maxy - 622, font1, black)
		exit
	    end if
	    pieceArray := doMove (movement, whiteToMove, pieceArray)
	    whiteToMove := not whiteToMove
	    %Play the cool sound
	    fork moveSound
	    blackScore := calculateBlackScore (pieceArray)

	    whiteScore := calculateWhiteScore (pieceArray)


	end loop
    end if
    if x > maxx div 2 - 120 and x < maxx div 2 + 120 and y > maxy - 400 and y < maxy - 300 then
	Sprite.Hide (backgroundSPR)
	cls
	Font.Draw ("How To Play", maxx div 2 - 120, maxy - 100, font1, black)
	drawbox (maxx div 2 - 120, maxy - 690, maxx div 2 + 120, maxy - 615, black)
	loop
	    buttonwait ("down", x, y, notused1, notused2)
	    if x > maxx div 2 - 120 and x < maxx div 2 + 120 and y > maxy - 690 and y < maxy - 615 then
		cls
		Sprite.Show (backgroundSPR)
		Font.Draw ("Turing Chess", maxx div 2 - 120, maxy - 100, font1, black)
		drawbox (maxx div 2 - 120, maxy - 250, maxx div 2 + 120, maxy - 150, black)
		Font.Draw ("Play Game", maxx div 2 - 100, maxy - 220, font1, black)
		drawbox (maxx div 2 - 120, maxy - 400, maxx div 2 + 120, maxy - 300, black)
		Font.Draw ("How To Play", maxx div 2 - 110, maxy - 360, font1, black)
		drawbox (maxx div 2 - 120, maxy - 550, maxx div 2 + 120, maxy - 450, black)
		Font.Draw ("Scoreboard", maxx div 2 - 100, maxy - 525, font1, black)
		drawbox (maxx div 2 - 120, maxy - 650, maxx div 2 + 120, maxy - 575, black)
		Font.Draw ("Quit", maxx div 2 - 40, maxy - 622, font1, black)
		x := maxx + 121
		y := maxy + 121
		exit
	    end if
	end loop
    end if
    if x > maxx div 2 - 120 and x < maxx div 2 + 120 and y > maxy - 550 and y < maxy - 450 then
	Sprite.Hide (backgroundSPR)
	cls
	Font.Draw ("Scoreboard", maxx div 2 - 120, maxy - 100, font1, black)
	drawbox (maxx div 2 - 120, maxy - 690, maxx div 2 + 120, maxy - 615, black)
	loop
	    buttonwait ("down", x, y, notused1, notused2)
	    if x > maxx div 2 - 120 and x < maxx div 2 + 120 and y > maxy - 690 and y < maxy - 615 then
		cls
		Sprite.Show (backgroundSPR)
		Font.Draw ("Turing Chess", maxx div 2 - 120, maxy - 100, font1, black)
		drawbox (maxx div 2 - 120, maxy - 250, maxx div 2 + 120, maxy - 150, black)
		Font.Draw ("Play Game", maxx div 2 - 100, maxy - 220, font1, black)
		drawbox (maxx div 2 - 120, maxy - 400, maxx div 2 + 120, maxy - 300, black)
		Font.Draw ("How To Play", maxx div 2 - 110, maxy - 360, font1, black)
		drawbox (maxx div 2 - 120, maxy - 550, maxx div 2 + 120, maxy - 450, black)
		Font.Draw ("Scoreboard", maxx div 2 - 100, maxy - 525, font1, black)
		drawbox (maxx div 2 - 120, maxy - 650, maxx div 2 + 120, maxy - 575, black)
		Font.Draw ("Quit", maxx div 2 - 40, maxy - 622, font1, black)
		x := maxx + 121
		y := maxy + 121
		exit
	    end if
	end loop

    end if
    if x > maxx div 2 - 120 and x < maxx div 2 + 120 and y > maxy - 650 and y < maxy - 575 then
	Sprite.Hide (backgroundSPR)
	cls
	Font.Draw ("Thanks for Playing!", maxx div 2, maxy div 2, font1, black)

	delay (2000)
	Window.Close (defWinId)

    end if
end loop


