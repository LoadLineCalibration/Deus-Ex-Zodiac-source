class ZodiacMission74 expands MissionScript;

// Initialize stuff
function FirstFrame()
{
	Super.FirstFrame();
}

function Timer() {

    local JCDouble jc;

    Super.Timer();

        // JC hologram - appear
        if (!flags.GetBool('m74_holo_started') &&
		flags.GetBool('m74_jc_1'))
        {
		// Find JC, because he has the conversation
		foreach AllActors(class'JCDouble', jc)
			break;

		jc.EnterWorld();

		Player.StartConversationByName('jc_holo', jc, False, False);
		
		flags.SetBool('m74_holo_started', True,, 75);
         }

         // JC hologram - disappear
         if (!flags.GetBool('m74_holo_finished') && 
             flags.GetBool('m74_jc_2'))
         {
		// Find JC
		foreach AllActors(class'JCDouble', jc)
			break;

		jc.LeaveWorld();

            flags.SetBool('m74_holo_finished', True,, 75);
         }



}

defaultproperties
{
}
