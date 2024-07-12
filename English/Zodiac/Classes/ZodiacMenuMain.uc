class ZodiacMenuMain expands MenuMain;

// Main menu is overridden to display custom "Welcome to" text at the top, and
// to disable the Training and Multiplayer buttons, which are not applicable

function ShowVersionInfo()
{
     Super.ShowVersionInfo();

     winButtons[4].SetSensitivity(False);		// Disable "Training" menu choice
     winButtons[8].SetSensitivity(False);		// Disable "Multiplayer" menu choice
}

defaultproperties
{
     buttonDefaults(0)=(Action=MA_MenuScreen,Invoke=Class'Zodiac.MyMenuSelectDifficulty')
     buttonDefaults(6)=(Invoke=Class'Zodiac.MyCreditsWindow')
     Title="Welcome to ZODIAC"
}
