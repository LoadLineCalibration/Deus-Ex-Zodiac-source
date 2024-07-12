//=============================================================================
// MyHUDInfoLinkDisplay
//=============================================================================
class MyHUDInfoLinkDisplay expands HUDInfoLinkDisplay;

// this seems to have to be here to load the damn DefaultPortrait texture
#exec OBJ LOAD FILE=ZodiacInfoLinks

// ----------------------------------------------------------------------
// SetSpeaker()
//
// Sets the speaker's name in the window and also the portrait 
// displayed in the window
// ----------------------------------------------------------------------

function SetSpeaker(String bindName, String displayName)
{
	local String portraitStringName;
	local DeusExLevelInfo info;

	winName.SetText(displayName);

	// Default portrait name based on bind naem

	portraitStringName = "ZodiacInfoLinks." $ Left(bindName, 16);

	// Get a pointer to the portrait
	speakerPortrait = Texture(DynamicLoadObject(portraitStringName, class'Texture'));
}

defaultproperties
{
}
