//=============================================================================
// ZodiacEndgame.
//=============================================================================
class ZodiacEndgame extends MissionScript;


var byte savedSoundVolume;
var float endgameDelays[2];
var float endgameTimer;
var string endgameQuote[4];
var HUDMissionStartTextDisplay quoteDisplay;
var bool bQuotePrinted;


// ----------------------------------------------------------------------
// InitStateMachine()
// ----------------------------------------------------------------------

function InitStateMachine()
{
	Super.InitStateMachine();

	// Set the PlayerTraveling flag (always want it set for 
	// the intro and endgames)
	flags.SetBool('PlayerTraveling', True, True, 0);
}



// ----------------------------------------------------------------------
// FirstFrame()
// 
// Stuff to check at first frame
// ----------------------------------------------------------------------

function FirstFrame()
{
	Super.FirstFrame();

    endgameTimer = 0.0;
}


// ----------------------------------------------------------------------
// Timer()
//
// Main state machine for the mission
// ----------------------------------------------------------------------

function Timer()
{
	local BobPage bob;
	local Z1 Z;

	Super.Timer();

	//
	// "Good" ending
	//

      if (localURL == "77_ZODIAC_ENDGAME1")
	{

		if (flags.GetBool('m77_start_convo'))
		{
			// Find our buddy Bob, because he has the conversation!
			foreach AllActors(class'BobPage', bob)
				break;

			if (bob != None)
			{
				// Start the conversation
				//player.StartConversationByName('end_game1', bob, False, True);
                player.StartConversationByName('end_game1', bob, False, True);
			}

			flags.SetBool('m77_start_convo', False);
		}

		// Show end quotation, pause, then roll end credits
		if (flags.GetBool('m77_time_to_show_quote1'))
		{
                  /*
			if (!flags.GetBool('m77_sound_lowered'))
			{
				// turn down the sound to quiet those loud footsteps
				savedSoundVolume = SoundVolume;
				SoundVolume = 8;
				Player.SetInstantSoundVolume(SoundVolume);
				flags.SetBool('m77_sound_lowered', True);
			}
                  */

			if (!bQuotePrinted)
				PrintEndgameQuote(0);

			endgameTimer += checkTime;

			if (endgameTimer > endgameDelays[0])
				FinishCinematic();
		}
	}

	//
	// "Evil" ending
	//

	else
      if (localURL == "77_ZODIAC_ENDGAME2")
	{
		if (flags.GetBool('m77_start_convo2'))
		{
			// Find our Z-1, because she has the conversation!
			foreach AllActors(class'Z1', Z)
				break;

			if (Z != None)
			{
				// Start the conversation
				player.StartConversationByName('end_game2', Z, False, True);
			}

			flags.SetBool('m77_start_convo2', False);
		}

		// Show end quotation, pause, then roll end credits
		if (flags.GetBool('m77_time_to_show_quote2'))
		{
			if (!bQuotePrinted)
				PrintEndgameQuote(1);

			endgameTimer += checkTime;

			if (endgameTimer > endgameDelays[0])
				FinishCinematic();
		}
	}


}

// ----------------------------------------------------------------------
// FinishCinematic()
// ----------------------------------------------------------------------

function FinishCinematic()
{
	local CameraPoint cPoint;

	local PaulDentonPlayer PDPlayer;

	if (quoteDisplay != None)
	{
		quoteDisplay.Destroy();
		quoteDisplay = None;
	}

	// Loop through all the CameraPoints and set the "nextPoint"
	// to None will will effectively cause them to halt.
	// This prevents the screen from fading while the credits are rolling.

	foreach player.AllActors(class'CameraPoint', cPoint)
		cPoint.nextPoint = None;

	SetTimer(0, False);

	PDPlayer = PaulDentonPlayer(GetPlayerPawn());

	//
	// The Ending Credits
	//
	PDPlayer.ShowCredits(True);
}

// ----------------------------------------------------------------------
// PrintEndgameQuote()
// ----------------------------------------------------------------------

function PrintEndgameQuote(int num)
{
	local int i;
	local DeusExRootWindow root;

	bQuotePrinted = True;

	root = DeusExRootWindow(Player.rootWindow);
	if (root != None)
	{
		quoteDisplay = HUDMissionStartTextDisplay(root.NewChild(Class'HUDMissionStartTextDisplay', True));
		if (quoteDisplay != None)
		{
			quoteDisplay.displayTime = endgameDelays[num];
			quoteDisplay.SetWindowAlignments(HALIGN_Center, VALIGN_Center);

			for (i=0; i<2; i++)
				quoteDisplay.AddMessage(endgameQuote[2*num+i]);

			quoteDisplay.StartMessage();
		}
	}
}


// ----------------------------------------------------------------------
// ----------------------------------------------------------------------

defaultproperties
{
     endgameDelays(0)=10.000000
     endgameDelays(1)=8.000000
     endgameQuote(0)="AND YE SHALL KNOW THE TRUTH, AND THE TRUTH SHALL MAKE YOU FREE."
     endgameQuote(1)="    -- JOHN 8:32"
     endgameQuote(2)="EVERYONE WISHES TO HAVE TRUTH ON HIS SIDE, BUT NOT EVERYONE WISHES TO BE ON THE SIDE OF TRUTH."
     endgameQuote(3)="    -- RICHARD WHATELY"
}
