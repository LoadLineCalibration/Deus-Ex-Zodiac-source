class ZodiacMission71 expands MissionScript;

event PostPostBeginPlay()
{
    Super.PostPostBeginPlay();

    FixForVoiceover();
}

// LLC: Changed for voiceover, so ScientistMale and ScientistFemale won't use same convos 
function FixForVoiceover()
{
    local ScientistFemale sfm;

    foreach AllActors(class'ScientistFemale', sfm)
    {
        sfm.BindName = "ScientistFemale";
        sfm.ConBindEvents();
    }
}


// Initialize stuff
function FirstFrame()
{
	Super.FirstFrame();

	if (localURL == "71_ZODIAC_LANGLEY_CIAHQ")
	{
		flags.SetBool('music_playing',True,,72);
	}
}

function Timer() {

      local BlackHelicopter chopper;
	local ElectricityEmitter ee_emd_effect;
	local int count;
      local HumanCivilian HC;
      local HumanMilitary HM;
	local DeusExCarcass carc;

        Super.Timer();

	if (localURL == "71_ZODIAC_LANGLEY_CIAHQ") {

        // If the MJ-12 doc has been transmitted, the encryption key 
        // transmitted, and the anti-aircraft defense system has been
        // disabled, all goals have been completed, so turn on Jock's
        // heli at the extraction point

        if (!flags.GetBool('m71_complete') &&
            flags.GetBool('mj12_doc_transferred') &&
            flags.GetBool('encryption_key_transferred') && 
            flags.GetBool('aa_system_disabled'))
        {
            foreach AllActors(class'BlackHelicopter', chopper)
                chopper.EnterWorld();

		flags.SetBool('m71_complete', True,, 72);
        }

        // If the EMDF generator is destroyed, get rid of the lightning generators
        // (the extra blue lights are triggered off in the map)
        if (!flags.GetBool('emdf_blown') &&
            flags.GetBool('emd_disabled'))
 	       {
                foreach AllActors(class'ElectricityEmitter', ee_emd_effect, 'emd_effect')
                    ee_emd_effect.Destroy();
		    flags.SetBool('emdf_blown', True,, 72);

            }

		// count the number of dead people after the mission is done
		if (flags.GetBool('m71_complete') &&
               !flags.GetBool('check_dead'))
		{
			count = 0;

			// count the living
			foreach AllActors(class'HumanCivilian', HC)
				count++;

			foreach AllActors(class'HumanMilitary', HM)
				count++;

			// add the unconscious ones and ones killed by somebody else to the not dead count
			// there are 25 total on the map
			foreach AllActors(class'DeusExCarcass', carc)
			{
				if ((carc.KillerBindName == "PaulDenton") && (carc.itemName == "Unconscious"))
					count++;
				else if (carc.KillerBindName != "PaulDenton")
					count++;
			}

			// if the player killed more than 3, set the flag
			if (count < 22)
				flags.SetBool('M71PlayerAggressive', True,, 76);		// don't expire until mission 76

                  flags.SetBool('check_dead',True,,72);
		}


	}



}

defaultproperties
{
}
