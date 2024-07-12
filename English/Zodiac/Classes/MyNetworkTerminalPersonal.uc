//=============================================================================
// MyNetworkTerminalPersonal.
//=============================================================================
class MyNetworkTerminalPersonal extends NetworkTerminalPersonal;

// Uses a custom ComputerScreenLogin class to be able to use custom
// logos and text on the computer login window

defaultproperties
{
     FirstScreen=Class'Zodiac.MyComputerScreenLogin'
}
