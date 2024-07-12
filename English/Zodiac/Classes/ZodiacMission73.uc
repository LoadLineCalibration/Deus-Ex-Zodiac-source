//=============================================
// ZodiacMission73
// Page Biotech
//=============================================
class ZodiacMission73 expands MissionScript;

event PostPostBeginPlay()
{
    Super.PostPostBeginPlay();

    FixForVoiceover();
}

// LLC: Changed for voiceover, so ScientistMale and ScientistFemale won't use same convos.
function FixForVoiceover()
{
    local ScriptedPawn sp;

    foreach AllActors(class'ScriptedPawn', sp)
    {
        if (sp.name == 'ScientistFemale4' || sp.name == 'ScientistFemale1')
        {
            sp.BindName = "ScientistFemale";
            sp.ConBindEvents();
        }

        if (sp.name == 'Female1' || sp.name == 'Businesswoman1')
        {
            sp.BindName = "OfficeWorkerFemale";
            sp.ConBindEvents();
        }

        if (sp.name == 'Male1')
        {
            sp.BindName = "OfficeWorker";
            sp.ConBindEvents();
        }
    }
}


// Initialize stuff
function FirstFrame()
{
	Super.FirstFrame();

	if (!flags.GetBool('InitialJockInfoLink'))
	{
		// Start the initial DataLink transmission - during the conversation, the
		// helicopter takeoff trigger will be fired
		Player.StartDataLinkTransmission("dl_jock");
		flags.SetBool('InitialJockInfoLink', True,, 74);
	}

}

function Timer() {

      local MotokoKusanagi the_major;
      local BobPage bob;
      local SpawnPoint spawnpt;
      local DeusExMover M;

      Super.Timer();

      if (localURL == "73_ZODIAC_NEWMEXICO_PAGEBIO") 
      {
		
        // Kusanagi's first appearance
        if (!flags.GetBool('m73_kusanagi_in_world') &&
           flags.GetBool('m73_kusanagi_1'))
        {
            foreach AllActors(class'MotokoKusanagi', the_major)
                the_major.EnterWorld();

            flags.SetBool('m73_kusanagi_in_world', True,, 74);
        }

        // Move Kusanagi to neural thingy (2nd floor)
        if (!flags.GetBool('m73_kusanagi_moved') &&
           flags.GetBool('m73_kusanagi_2'))
        {
            // Find The Major
            foreach AllActors(class'MotokoKusanagi', the_major)
                break;

            // Find the SpawnPoint to move her to
            foreach AllActors(class'SpawnPoint', spawnpt, 'kusanagi_move')
                break;

            the_major.SetLocation(spawnpt.Location);
            the_major.SetRotation(spawnpt.Rotation);
            the_major.SetOrders('Sitting',, True);

            flags.SetBool('m73_kusanagi_moved', True,, 74);
        }

 	  // Unlock the Neurobiology lab (outer door) when the flag is set
        if (!flags.GetBool('m73_neuro_door_unlocked') &&
             flags.GetBool('m73_unlock_neuro_door'))
        {
  	      foreach AllActors(class'DeusExMover', M, 'neuro_door')
	      {
                M.bLocked = False;
                M.lockStrength = 0.0;
	      }
        }

        // We're done with Kusanagi - make her disappear
        if (!flags.GetBool('m73_kusanagi_nuked') &&
           flags.GetBool('m73_graham_expecting_player'))
        {
            foreach AllActors(class'MotokoKusanagi', the_major)
                the_major.LeaveWorld();

            flags.SetBool('m73_kusanagi_nuked', True,, 74);
        }

        // Bob Page hologram - appear
        if (!flags.GetBool('m73_holo_started') &&
		flags.GetBool('m73_bobpage_1'))
        {
		// Find our buddy Bob, because he has the conversation
		foreach AllActors(class'BobPage', bob)
			break;

		bob.EnterWorld();

		Player.StartConversationByName('bobpage_hologram', bob, False, False);
		
		flags.SetBool('m73_holo_started', True,, 74);
         }

         // Bob Page hologram - disappear
         if (!flags.GetBool('m73_holo_finished') && 
             flags.GetBool('m73_bobpage_2'))
         {
		// Find our buddy Bob, because he has the conversation
		foreach AllActors(class'BobPage', bob)
			break;

		bob.LeaveWorld();

            flags.SetBool('m73_holo_finished', True,, 74);
         }


      }


}

defaultproperties
{
}
