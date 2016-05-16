% Chess Program


% The display screen format
setscreen ("graphics:max;max,nobuttonbar")

%Game over tracking variable
var gameOver : boolean := false

%Input tracking + validation variables
var tempInput : string
var moveDone : boolean := false

% Movement variables

var movement : string
var letterMovement : int
letterMovement := 0
var numberMovement : int
numberMovement:=0

var font1 : int
font1 := Font.New ("MS Serif:33:Bold")
Font.Draw ("Chess 2-Player", maxx div 2, maxy - 100, font1, black)

include "imageImport.t"

include "spriteArrays.t"

include "isValidNotation.t"

loop
    exit when gameOver = true
    %White moves first
    loop
	exit when moveDone = true 
	put "Enter your move (or \"help\" for help): "..
	get tempInput
	if Str.Lower(tempInput) = "help" then
	    include "help.t"
	else
	    get movement
	end if
    end loop
end loop
