class ZodiacMission70 expands MissionScript;

// ----------------------------------------------------------------------
// FirstFrame()
// 
// Stuff to check at first frame
// ----------------------------------------------------------------------

function FirstFrame()
{
	Super.FirstFrame();
}


function InitStateMachine() {

    super.InitStateMachine();
    FirstFrame();

}

defaultproperties
{
}
