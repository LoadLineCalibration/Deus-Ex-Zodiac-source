//-----------------------------------------------------------
//
//-----------------------------------------------------------
class MyMenuSelectDifficulty expands MenuSelectDifficulty;

// ----------------------------------------------------------------------
// InvokeNewGameScreen()
// ----------------------------------------------------------------------

function InvokeNewGameScreen(float difficulty)
{
     local MyMenuScreenNewGame newGame;

     newGame = MyMenuScreenNewGame(root.InvokeMenuScreen(Class'MyMenuScreenNewGame'));

     if (newGame != None)
          newGame.SetDifficulty(difficulty);
}

defaultproperties
{
}
