//=============================================
// ZodiacMission72
// Buenos Aires
//=============================================
class ZodiacMission72 expands MissionScript;

event PostPostBeginPlay()
{
    Super.PostPostBeginPlay();

    FixForVoiceover();
}

// LLC: Changed for voiceover, so ScientistMale and ScientistFemale won't use same convos 
function FixForVoiceover()
{
    local ScriptedPawn sp;

    foreach AllActors(class'ScriptedPawn', sp)
    {
        if (sp.name == 'BumFemale0')
        {
            sp.BindName = "ShantyFemale";
            sp.ConBindEvents();
        }
    }
}

// Initialize stuff
function FirstFrame()
{
	Super.FirstFrame();

	if (!flags.GetBool('InitialAmandaInfoLink'))
	{
		// Start the initial DataLink transmission - during the conversation, the
		// helicopter takeoff trigger will be fired
		Player.StartDataLinkTransmission("dl_amanda_briefing");
		flags.SetBool('InitialAmandaInfoLink', True,, 73);
	}

	flags.SetBool('jock_landed', False,, 73);
}


// ----------------------------------------------------------------------
// Timer()
//
// Main state machine for the mission
// ----------------------------------------------------------------------

function Timer()
{
      local int count;
      local SecurityBot2 secbot;
      local ThugMale3 thug;
      local DeusExGoal newGoal;
      local BlackHelicopter chopper;

	Super.Timer();

	// if the security bots are destroyed, set a flag
	if (!flags.GetBool('bots_dead'))
	{
		count = 0;
		foreach AllActors(class'SecurityBot2', secbot)
			count++;

		if (count == 0)
		{
			flags.SetBool('bots_dead', True,, 73);
			Player.GoalCompleted('destroy_bots');

			// Give out a new goal to go back and talk with John Clark
                  // (only if player has already met Clark)
			// Args to AddGoal() are: 1) Goal name, 2) Primary goal?
			if (flags.GetBool('met_clark')) 
			{
			    newGoal = Player.AddGoal('back_to_john', True);
			    newGoal.SetText("Get more information from John Clark.");
			}
		}
	}

	// if the thug has been killed, set a flag
	if (!flags.GetBool('thug_dead'))
	{
		count = 0;
		foreach AllActors(class'ThugMale3', thug)
			count++;

		if (count == 0)
		{
			flags.SetBool('thug_dead', True,, 73);
			//Player.GoalCompleted('kill_thug');
		}
	}

	// as soon as the final encryption key is transmitted, have Jock land for extraction
       if (flags.GetBool('key2_transmitted') &&
	    !flags.GetBool('jock_landed')) 
       {
           foreach AllActors(class'BlackHelicopter', chopper)
               chopper.EnterWorld();

	     flags.SetBool('jock_landed', True,, 73);
       }

      // if the 'disable_bots' flag is set, disable the bots
	if (flags.GetBool('disable_bots')) 
      {
            foreach AllActors(class'SecurityBot2', secbot)
			secbot.TakeDamage(500, None, secbot.Location, vect(0,0,0), 'emp');

            flags.SetBool('disable_bots', False,, 73);

		flags.SetBool('bots_dead', True,, 73);
		Player.GoalCompleted('destroy_bots');

		// Give out a new goal to go back and talk with John Clark
            // (only if player has already met Clark)
		// Args to AddGoal() are: 1) Goal name, 2) Primary goal?
		if (flags.GetBool('met_clark')) 
		{
		    newGoal = Player.AddGoal('back_to_john', True);
		    newGoal.SetText("Get more information from John Clark.");
		}
      }

}

defaultproperties
{
}
