//=============================================================================
// MyDeusExGameInfo.
//=============================================================================
class MyDeusExGameInfo expands GameInfo
	config;
	
// ----------------------------------------------------------------------
// Login()
// ----------------------------------------------------------------------

event playerpawn Login
(
	string Portal,
	string Options,
	out string Error,
	class<playerpawn> SpawnClass
)
{
	local DeusExPlayer player;
	local NavigationPoint StartSpot;
	local byte InTeam;
	local DumpLocation dump;

	player = DeusExPlayer(Super.Login(Portal, Options, Error, SpawnClass));

	// If we're traveling across a map on the same mission, 
	// nuke the player's crap and 

	if ((player != None) && (!HasOption(Options, "Loadgame")))
	{
		player.ResetPlayerToDefaults();

		dump = player.CreateDumpLocationObject();

		if ((dump != None) && (dump.HasLocationBeenSaved()))
		{
			dump.LoadLocation();

			player.Pause();
			player.SetLocation(dump.currentDumpLocation.Location);
			player.SetRotation(dump.currentDumpLocation.ViewRotation);
			player.ViewRotation = dump.currentDumpLocation.ViewRotation;
			player.ClientSetRotation(dump.currentDumpLocation.ViewRotation);

			CriticalDelete(dump);
		}
		else
		{
			InTeam    = GetIntOption( Options, "Team", 255 ); // default to "no team"
			StartSpot = FindPlayerStart( None, InTeam, Portal );

			player.SetLocation(StartSpot.Location);
			player.SetRotation(StartSpot.Rotation);
			player.ViewRotation = StartSpot.Rotation;
			player.ClientSetRotation(player.Rotation);
		}
	}
	return player;
}

// ----------------------------------------------------------------------
// DiscardInventory()
// ----------------------------------------------------------------------

function DiscardInventory( Pawn Other )
{
	// do nothing
}

// ----------------------------------------------------------------------
// ScoreKill()
// ----------------------------------------------------------------------

function ScoreKill(pawn Killer, pawn Other)
{
	// do nothing	
}

// ----------------------------------------------------------------------
// ----------------------------------------------------------------------

defaultproperties
{
}
