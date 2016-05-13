% Chess Program


% The display screen format
setscreen ("graphics:max;max,nobuttonbar")

var font1 : int
font1 := Font.New ("MS Serif:33:Bold")
Font.Draw ("Chess 2-Player", maxx div 2, maxy - 100, font1, black)

include "imageImport.t"

include "spriteArrays.t"
