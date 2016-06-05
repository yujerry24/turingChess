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
process errorSound
    Music.PlayFile ("ChessErrorSound.wav")
end errorSound

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
		    fork errorSound
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
	Font.Draw ("Back", maxx div 2 - 60, maxy - 670, font1, black)
	locate (10, 1)
	put "Pawn: Each player has 8 pawns. The pawn can move one or two space(s)"
	put "on the first move and one space forward each move after. "
	put "However, despite by having a forward movement of one space, "
	put "the pawn cannot capture forward. The pawn can capture any enemy piece "
	put "directly diagonally infront of it (to the left or right) by one space."
	put ""
	put "Rook: Each player has two rooks. The rooks can move and capture horizontally"
	put "and vertically for an unlimited amount of spaces."
	put ""
	put "Knight: Each player has two knights. The knights' move consists of two spaces in "
	put "any horizontal or vertical direction and then one space perpendicular to the "
	put "the direction of the two spaces that was previously taken. It captures in the same way."
	put ""
	put "Bishop: Each player has two bishops. The bishops' move/capture consists of any amount"
	put "of spaces in any diagonal direction. "
	put ""
	put "Queen: Each player has one queen. The queen moves/capture in any horizontal, vertical, "
	put "and diagonal direction for an umlimted of spaces"
	put ""
	put "King: Each player has one king. The king can move/capture by one space in any direction. "
	put ""
	put "Objective: The objective of the game is to checkmate the other player's King. A checkmate occurs "
	put "when the enemy player's king is in a position that threatens the king's capture in the next move."
	put "If the king cannot legally move out of the space that it will be captured in and/or cannot eliminate "
	put "the enemy piece(s) threatening capture, then it is checkmate. As a result, you should use the rest of "
	put "your pieces to protect your king and attack the opposing enemy's king."
	Pic.Draw(whitePawnIMG, maxx div 2 + 200,maxy-200,picMerge)
	Pic.Draw(blackPawnIMG, maxx div 2 + 250,maxy-200,picMerge)
	Pic.Draw(whiteRookIMG, maxx div 2 + 200,maxy-270,picMerge)
	Pic.Draw(blackRookIMG, maxx div 2 + 250,maxy-270,picMerge)
	Pic.Draw(whiteKnightIMG, maxx div 2 + 200,maxy-330,picMerge)
	Pic.Draw(blackKnightIMG, maxx div 2 + 250,maxy-330,picMerge)
	Pic.Draw(whiteBishopIMG, maxx div 2 + 200,maxy-390,picMerge)
	Pic.Draw(blackBishopIMG, maxx div 2 + 250,maxy-390,picMerge)
	Pic.Draw(whiteQueenIMG, maxx div 2 + 200,maxy-440,picMerge)
	Pic.Draw(blackQueenIMG, maxx div 2 + 250,maxy-440,picMerge)
	Pic.Draw(whiteKingIMG, maxx div 2 + 200,maxy-500,picMerge)
	Pic.Draw(blackKingIMG, maxx div 2 + 250,maxy-500,picMerge)
	
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
	Font.Draw ("Back", maxx div 2 - 60, maxy - 670, font1, black)
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


