//=============================================================================
// MyComputerScreenLogin
//=============================================================================

class MyComputerScreenLogin expands ComputerScreenLogin;

// This function is overridden to call MyComputers so that custom
// logos and text can appear on the computer login window

// ----------------------------------------------------------------------
// SetCompOwner()
// ----------------------------------------------------------------------

function SetCompOwner(ElectronicDevices newCompOwner)
{

	Super.SetCompOwner(newCompOwner);

	// Update the title, texture and description
	winTitle.SetTitle(Sprintf(Title, MyComputers(compOwner).GetNodeName()));
	winLoginInfo.SetText(MyComputers(compOwner).GetNodeDesc());

	SetFocusWindow(editUserName);

	SetLogo(MyComputers(compOwner).GetNodeTexture());
}

defaultproperties
{
}
