% Chess Program

%An array bin for use by any function
var tempArray : array 1 .. 8, 1 .. 8 of int

% Graphics Screen
setscreen ("graphics:max;max,nobuttonbar")

% Include files for reference later (The order is important because of dependencies)
include "menu.t"

include "HowToPlay.t"

include "scores.t"

include "calculateBlackScore.t"

include "calculateWhiteScore.t"

include "imageImport.t"

include "printArray.t"

include "pieceArrayInit.t"

include "isValidNotation.t"

include "compareArray.t"

include "createControlArray.t"

include "drawBoard.t"

include "resolveConflict.t"

include "isMate.t"

%King pos array (Dependency of doMove and must therefore be declared here)
var kingPos : array 1 .. 2, 1 .. 2 of int
%White king
kingPos (1, 1) := (8)
kingPos (1, 2) := (5)
%Black king
kingPos (2, 1) := (1)
kingPos (2, 2) := (5)

%Variable to check whether a piece can block a check
var blockPossible : boolean := false

%Variables for check and checkmate (dependency of doMove)
var check, checkmate : boolean

include "doMove.t"

include "clearBoard.t"

var name1 : string := "Garry Kasparov"
var name2 : string := "Bobby Fischer"
var name3 : string := "Petrosian"
var name4 : string := "Antoaly Karpov"
var winnersName : string := " "


% Clicking Buttons
% Notused variables must be written to but are not used
var x, y, notused1, notused2 : int

% Fonts and other variables for points and names
var font1 : int
font1 := Font.New ("MS Serif:33:Bold")
var blackScore : int := 0
var whiteScore : int := 0
var lastBlackMove : string := "N/A"
var lastWhiteMove : string := "N/A"

% The display screen format for background
var background : int := Pic.FileNew ("images/background.bmp")
var backgroundSPR : int
backgroundSPR := Sprite.New (background)
Sprite.SetPosition (backgroundSPR, maxx div 2, maxy div 2, true)
Sprite.Show (backgroundSPR)


% Call menu procedure
menu

%Input tracking + validation variables
var tempInput : string

%Movement variables
var movement : string
var whiteToMove : boolean := true

% Music files for correct and incorrect move
process moveSound
    Music.PlayFile ("pieceMoveSound.wav")
end moveSound
process errorSound
    Music.PlayFile ("ChessErrorSound.wav")
end errorSound


% Main loop for navigation between screens/windows
loop

    buttonwait ("down", x, y, notused1, notused2)

    % If mouse clicked on Play Game
    if x > maxx div 2 - 120 and x < maxx div 2 + 120 and y > maxy - 250 and y < maxy - 150 then

	Sprite.Hide (backgroundSPR)

	loop
	    %Reset check and checkmate variables
	    check := false
	    checkmate := false

	    drawBoard (pieceArray)
	    scores (blackScore, whiteScore, lastBlackMove, lastWhiteMove)

	    %exit when checkWinner(pieceArray) %Add checkWinner function later
	    put "Enter your move, \"exit\" to exit (or \"help\" for help): " ..
	    get tempInput : *

	    if Str.Lower (tempInput) = "exit" then
		lastWhiteMove := "N/A"
		lastBlackMove := "N/A"
		whiteToMove := true
		tempArray := resetBoard (pieceArray)
		drawBoard (tempArray)
		pieceArray := tempArray
		blackScore := calculateBlackScore (pieceArray)
		whiteScore := calculateWhiteScore (pieceArray)
		cls
		Sprite.Show (backgroundSPR)

		menu

		exit

	    elsif Str.Lower (tempInput) = "resign" then
		if whiteToMove = true then
		    cls
		    Font.Draw ("Black Wins by Resignation!", maxx div 2, maxy div 2, font1, black)
		    delay (2000)
		    cls
		    locate (maxrow div 2, maxcol div 2)
		    put "What is the winner's name?"
		    locate (maxrow div 2 + 1, maxcol div 2)
		    get winnersName : *
		    name4 := name3
		    name3 := name2
		    name2 := name1
		    name1 := winnersName
		    cls
		    delay (2000)
		end if
		if whiteToMove = false then
		    cls
		    Font.Draw ("White Wins by Resignation!", maxx div 2, maxy div 2, font1, black)
		    delay (2000)
		    cls
		    locate (maxrow div 2, maxcol div 2)
		    put "What is the winner's name?"
		    locate (maxrow div 2 + 1, maxcol div 2)
		    get winnersName : *
		    name4 := name3
		    name3 := name2
		    name2 := name1
		    name1 := winnersName
		    cls
		    delay (2000)
		end if
		lastWhiteMove := "N/A"
		lastBlackMove := "N/A"
		whiteToMove := true
		tempArray := resetBoard (pieceArray)
		drawBoard (tempArray)
		pieceArray := tempArray
		blackScore := calculateBlackScore (pieceArray)
		whiteScore := calculateWhiteScore (pieceArray)
		cls
		Sprite.Show (backgroundSPR)

		menu

		exit

	    end if
	    loop


		movement := Str.Upper (tempInput)

		if Str.Lower (tempInput) = "help" then
		    include "help.t"
		    drawBoard (pieceArray)
		    scores (blackScore, whiteScore, lastBlackMove, lastWhiteMove)
		    put "Enter your move, \"exit\" to exit (or \"help\" for help): " ..
		else
		    if movement = "EXIT" or movement = "exit" then
			exit
		    end if
		    if Str.Lower (movement) = "resign" then
			if whiteToMove = true then
			    cls
			    Font.Draw ("Black Wins by Resignation!", maxx div 2, maxy div 2, font1, black)
			    delay (2000)
			    cls
			    locate (maxrow div 2, maxcol div 2)
			    put "What is the winner's name?"
			    locate (maxrow div 2 + 1, maxcol div 2)
			    get winnersName : *
			    name4 := name3
			    name3 := name2
			    name2 := name1
			    name1 := winnersName
			    cls
			    delay (2000)
			    exit
			end if
			if whiteToMove = false then
			    cls
			    Font.Draw ("White Wins by Resignation!", maxx div 2, maxy div 2, font1, black)
			    delay (2000)
			    cls
			    locate (maxrow div 2, maxcol div 2)
			    put "What is the winner's name?"
			    locate (maxrow div 2 + 1, maxcol div 2)
			    get winnersName : *
			    name4 := name3
			    name3 := name2
			    name2 := name1
			    name1 := winnersName
			    cls
			    delay (2000)
			    exit
			end if
		    end if
		    if isValidNotation (movement) then

			comparisonArray := pieceArray
			pieceArray := doMove (movement, whiteToMove, pieceArray)
			if not compareArray (comparisonArray, pieceArray) and whiteToMove = true then
			    lastWhiteMove := tempInput

			elsif not compareArray (comparisonArray, pieceArray) and whiteToMove = false then
			    lastBlackMove := tempInput

			end if

			exit when not compareArray (comparisonArray, pieceArray)
		    end if
		    drawBoard (pieceArray)
		    put "Invalid move. Enter your move, \"exit\" to exit (or \"help\" for help): " ..
		    fork errorSound
		    scores (blackScore, whiteScore, lastBlackMove, lastWhiteMove)
		end if

		get tempInput : *
	    end loop

	    if checkmate = true then
		cls
		if whiteToMove = true then
		    Font.Draw ("White Wins By Checkmate!", maxx div 2, maxy div 2, font1, black)
		    delay (2000)
		    cls
		    locate (maxrow div 2, maxcol div 2)
		    put "What is the winner's name?"
		    locate (maxrow div 2 + 1, maxcol div 2)
		    get winnersName : *
		    name4 := name3
		    name3 := name2
		    name2 := name1
		    name1 := winnersName

		    delay (2000)
		    cls
		elsif whiteToMove = false then
		    Font.Draw ("Black Wins By Checkmate!", maxx div 2, maxy div 2, font1, black)
		    delay (2000)
		    cls
		    locate (maxrow div 2, maxcol div 2)
		    put "What is the winner's name?"
		    locate (maxrow div 2 + 1, maxcol div 2)
		    get winnersName : *
		    name4 := name3
		    name3 := name2
		    name2 := name1
		    name1 := winnersName

		    delay (2000)
		    cls
		end if
		drawBoard (pieceArray)
		Font.Draw ("Press Any Key To Exit", maxx div 2, maxy div 2, font1, black)
		Input.Pause
		movement := "exit" %So that we don't have to put the exit code multiple times
	    end if

	    if Str.Lower (movement) = "exit" or Str.Lower (movement) = "resign" then

		if whiteToMove = true and Str.Lower (movement) = "resign" then
		    cls
		    Font.Draw ("Black Wins by Resignation!", maxx div 2, maxy div 2, font1, black)
		    delay (2000)
		    cls
		    locate (maxrow div 2, maxcol div 2)
		    put "What is the winner's name?"

		    locate (maxrow div 2 + 1, maxcol div 2)
		    get winnersName : *
		    name4 := name3
		    name3 := name2
		    name2 := name1
		    name1 := winnersName
		    cls
		    delay (2000)

		end if
		if whiteToMove = false and Str.Lower (movement) = "resign" then
		    cls
		    Font.Draw ("White Wins by Resignation!", maxx div 2, maxy div 2, font1, black)
		    delay (2000)
		    cls
		    locate (maxrow div 2, maxcol div 2)
		    put "What is the winner's name?"
		    locate (maxrow div 2 + 1, maxcol div 2)
		    get winnersName : *
		    name4 := name3
		    name3 := name2
		    name2 := name1
		    name1 := winnersName
		    cls
		    delay (2000)

		end if
		whiteToMove := true
		tempArray := resetBoard (pieceArray)
		cls
		drawBoard (tempArray)
		pieceArray := tempArray
		cls
		Sprite.Show (backgroundSPR)

		menu
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
	HowToPlay

	loop
	    buttonwait ("down", x, y, notused1, notused2)
	    if x > maxx div 2 - 120 and x < maxx div 2 + 120 and y > maxy - 690 and y < maxy - 615 then
		cls
		Sprite.Show (backgroundSPR)
		menu
		x := maxx + 121
		y := maxy + 121
		exit
	    end if
	end loop
    end if

    if x > maxx div 2 - 120 and x < maxx div 2 + 120 and y > maxy - 550 and y < maxy - 450 then
	Sprite.Hide (backgroundSPR)
	cls
	Font.Draw ("Scoreboard/Recent Winners", maxx div 2 - 180, maxy - 100, font1, black)
	Font.Draw (name1, maxx div 2 - 120, maxy - 200, font1, black)
	Font.Draw (name2, maxx div 2 - 120, maxy - 350, font1, black)
	Font.Draw (name3, maxx div 2 - 120, maxy - 500, font1, black)
	Font.Draw (name4, maxx div 2 - 120, maxy - 650, font1, black)
	drawbox (maxx div 2 - 120, maxy - 790, maxx div 2 + 120, maxy - 705, black)
	Font.Draw ("Back", maxx div 2 - 60, maxy - 750, font1, black)
	loop
	    buttonwait ("down", x, y, notused1, notused2)
	    if x > maxx div 2 - 120 and x < maxx div 2 + 120 and y > maxy - 790 and y < maxy - 705 then
		cls
		Sprite.Show (backgroundSPR)
		menu
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


