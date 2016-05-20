var windowA, windowB, buttonA, buttonB, buttonQuit, backToMainA, backToMainB : int
var font1, font2 : int
font1 := Font.New ("MS Serif:33:Bold")

Font.Draw ("Turing Chess", maxx div 2, maxy - 50, font1, black)
procedure ShowMain
    GUI.Quit
    cls
end ShowMain
procedure StartGame
    GUI.Quit
    cls

end StartGame

procedure HowToPlay
    GUI.Quit
    cls
    var windowA, backToMainA : int


    windowA := Window.Open ("title:Window A,graphics:max;max,position:center;middle")
    backToMainA := GUI.CreateButton (20, 20, 0, "Back to Main", ShowMain)
    GUI.ShowWindow (windowA)
    var inputValue : int
    inputValue := 0
    get inputValue
    if inputValue = 1 then
       
    else
	get inputValue
    end if




end HowToPlay

procedure Scores
    GUI.Quit
    cls
    var windowA, backToMainA : int
    GUI.HideWindow (Window.GetActive)

    windowA := Window.Open ("title:Window A,graphics:max;max,position:center;middle")
    backToMainA := GUI.CreateButton (20, 20, 0, "Back to Main", ShowMain)
    GUI.ShowWindow (windowA)
    Input.Pause
end Scores

procedure Quit
    GUI.Quit
    cls
    put "You have ended the program."
    delay (1000)
    %Misha's way of exiting the program
    assert 2 + 2 = 5
end Quit

% Create a Button that reads "Say Hello" at lower left corner (100,100)
var GUI1 : int := GUI.CreateButton (maxx div 2, maxy - 200, 5, "Start Game", StartGame)
var GUI2 : int := GUI.CreateButton (maxx div 2, maxy - 400, 5, "How To Play", HowToPlay)
var GUI3 : int := GUI.CreateButton (maxx div 2, maxy - 600, 5, "Scores", Scores)
var GUI4 : int := GUI.CreateButton (maxx div 2, maxy - 800, 5, "Exit", Quit)
GUI.SetSize (GUI1, 200, 100)
GUI.SetSize (GUI2, 200, 100)
GUI.SetSize (GUI3, 200, 100)
GUI.SetSize (GUI4, 200, 100)

loop
    exit when GUI.ProcessEvent
end loop
