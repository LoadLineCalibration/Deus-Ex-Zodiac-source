class CheckFlagTrigger extends Trigger;

//
// Fires a trigger if a particular flag is set
//

var() name checkFlag;
var() bool bCheckFalse;
var() bool bToggleValue;
var() int flagExpiration;

singular function Trigger(Actor Other, Pawn Instigator)
{
	local DeusExPlayer player;
	local bool bSuccess;
	local Actor A;
	local bool bFlagValue;

	player = DeusExPlayer(Instigator);
	bSuccess = True;

	// only works for DeusExPlayers
	if (player == None)
		return;

	if (checkFlag != '')
	{
		bFlagValue = player.flagBase.GetBool(checkFlag);

		if (!player.flagBase.GetBool(checkFlag))
			bSuccess = bCheckFalse;
		else
			bSuccess = !bCheckFalse;
	}

	if (Event != '' && bSuccess)
		foreach AllActors(class 'Actor', A, Event)
			A.Trigger(Self, Instigator);

      if (bSuccess) {

		// Toggle the value of the flag if necessary
		if (bToggleValue) {
			if (flagExpiration == -1)
				player.flagBase.SetBool(checkFlag, !bFlagValue);
			else
				player.flagBase.SetBool(checkFlag, !bFlagValue,, flagExpiration);
		}

		Super.Trigger(Other, Instigator);
	}

}

singular function Touch(Actor Other)
{
	local DeusExPlayer player;
	local bool bSuccess;
	local Actor A;
	local bool bFlagValue;

	player = DeusExPlayer(Other);
	bSuccess = True;

	// only works for DeusExPlayers
	if (player == None)
		return;

	if (checkFlag != '')
	{
		if (!player.flagBase.GetBool(checkFlag))
			bSuccess = bCheckFalse;
		else
			bSuccess = !bCheckFalse;
	}

	if(Event != '' && bSuccess)
		foreach AllActors(class 'Actor', A, Event)
			A.Trigger(Self, Instigator);

	if (bSuccess) {

		// Toggle the value of the flag if necessary
		if (bToggleValue) {
			if (flagExpiration == -1)
				player.flagBase.SetBool(checkFlag, !bFlagValue);
			else
				player.flagBase.SetBool(checkFlag, !bFlagValue,, flagExpiration);
		}

		Super.Touch(Other);
	}

}

defaultproperties
{
     flagExpiration=-1
     CollisionRadius=96.000000
}
