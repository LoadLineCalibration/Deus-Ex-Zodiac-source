//=============================================================================
// MyGameHUD.
//=============================================================================
class MyGameHUD expands DeusExHUD;

// ----------------------------------------------------------------------
// CreateInfoLinkWindow()
//
// Creates the InfoLink window used to display messages.  If a 
// InfoLink window already exists, then return None.  If the Log window
// is visible, it hides it.
// ----------------------------------------------------------------------

function HUDInfoLinkDisplay CreateInfoLinkWindow()
{
	if ( infolink != None )
		return None;

	infolink = HUDInfoLinkDisplay(NewChild(Class'MyHUDInfoLinkDisplay'));

	// Hide Log window
	if ( msgLog != None )
		msgLog.Hide();

	infolink.AskParentForReconfigure();

	return infolink;
}

defaultproperties
{
}
