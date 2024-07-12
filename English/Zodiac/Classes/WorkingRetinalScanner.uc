//=============================================================================
// WorkingRetinalScanner.
//=============================================================================
class WorkingRetinalScanner extends DeusExDecoration;

var() name flagName;
var() name successEvent;
var() name failEvent;
var() String successMsg;
var() String failMsg;

function Frob(Actor Frobber, Inventory frobWith)
{
      local Actor A;
	local DeusExPlayer player;

	player = DeusExPlayer(GetPlayerPawn());
	if (player == None)
            return;

	if (player.flagbase.GetBool(flagName))
      {
		// If flag is True, do this stuff...

		foreach AllActors(class 'Actor', A, successEvent)
			A.Trigger(Self, Pawn(Frobber));

		if (successMsg != "")
	            Pawn(Frobber).ClientMessage(successMsg);
      }
	else
      {
		// If flag is False, do this stuff...

		foreach AllActors(class 'Actor', A, failEvent)
			A.Trigger(Self, Pawn(Frobber));

            if (failMsg != "")
	            Pawn(Frobber).ClientMessage(failMsg);
      }

}

defaultproperties
{
     successMsg="Clearance granted"
     failMsg="Authorization failed"
     bInvincible=True
     ItemName="Retinal Scanner"
     bPushable=False
     Physics=PHYS_None
     Mesh=LodMesh'DeusExDeco.RetinalScanner'
     SoundRadius=8
     SoundVolume=255
     SoundPitch=96
     AmbientSound=Sound'DeusExSounds.Generic.SecurityL'
     CollisionRadius=10.000000
     CollisionHeight=11.430000
     Mass=30.000000
     Buoyancy=40.000000
}
