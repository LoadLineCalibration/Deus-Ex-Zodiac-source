//=============================================================================
// SetGoalTrigger.
//=============================================================================
class SetGoalTrigger expands Trigger;

// Creates a goal when touched or triggered
// Set bCollideActors to False to make it triggered

var() name goalName;
var() string goalText;

function Trigger(Actor Other, Pawn Instigator)
{
	local DeusExGoal newGoal;
      local DeusExGoal prevGoal;
	local DeusExPlayer player;

	Super.Trigger(Other, Instigator);

	player = DeusExPlayer(GetPlayerPawn());

	if (player != None)
	{
		// Make sure goal doesn't already exist
		prevGoal = player.FindGoal(goalName);

		if (prevGoal == None)
            {
                newGoal = Player.AddGoal(goalName, True);
                newGoal.SetText(goalText);
            }

	}
}

function Touch(Actor Other)
{
	local DeusExGoal newGoal;
      local DeusExGoal prevGoal;
	local DeusExPlayer player;

	Super.Touch(Other);

	if (IsRelevant(Other))
	{
		player = DeusExPlayer(GetPlayerPawn());

		if (player != None)
		{
 		    // Make sure goal doesn't already exist
		    prevGoal = player.FindGoal(goalName);

		    if (prevGoal == None)
                {
                    newGoal = Player.AddGoal(goalName, True);
                    newGoal.SetText(goalText);
                }

		}
	}
}

defaultproperties
{
     bTriggerOnceOnly=True
}
