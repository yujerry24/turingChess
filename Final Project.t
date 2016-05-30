%Chess Program
import GUI
setscreen ("graphics:max;max,nobuttonbar")

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

%Input tracking + validation variables
var tempInput : string

%Movement variables
var movement : string
var whiteToMove : boolean := true

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
    %Loading text while the dozens of files are importing
    Font.Draw ("LOADING...", maxx div 2 - 120, maxy - 100, font1, black)
    %If mouse was clicked within the green box, show image
    if x > maxx div 2 - 120 and x < maxx div 2 + 120 and y > maxy - 250 and y < maxy - 150 then
	Sprite.Hide (backgroundSPR)
	loop
	    drawBoard (pieceArray)

	    %exit when checkWinner(pieceArray) %Add checkWinner function later
	    put "Enter your move (or \"help\" for help): " ..
	    get tempInput : *
	    if Str.Lower (tempInput) = "exit" then
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
	    loop

		movement := Str.Upper (tempInput)
		if Str.Lower (tempInput) = "help" then
		    include "help.t"
		    drawBoard (pieceArray)
		    put "Enter your move (or \"help\" for help): " ..
		else
		    if movement = "EXIT" or movement = "exit" then
			exit
		    end if
		    if isValidNotation (movement) then
			comparisonArray := pieceArray
			pieceArray := doMove (movement, whiteToMove, pieceArray)
			exit when not compareArray (comparisonArray, pieceArray)
		    end if
		    drawBoard (pieceArray)
		    put "Invalid move. Enter your move (or \"help\" for help): " ..
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


