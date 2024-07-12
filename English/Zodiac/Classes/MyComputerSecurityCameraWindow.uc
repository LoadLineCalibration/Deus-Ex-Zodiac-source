//=============================================================================
// MyComputerSecurityCameraWindow
//=============================================================================

class MyComputerSecurityCameraWindow extends ComputerSecurityCameraWindow;


// ----------------------------------------------------------------------
// UpdateCameraStatus()
// ----------------------------------------------------------------------

function UpdateCameraStatus()
{
	if (camera == None)
	{
		winCamera.EnableViewport(False);
		winCamera.Lower();
		btnCamera.SetStatic();
		SetTitle(NoSignalLabel);
		winCameraStatus.Hide();
		HideCameraLabels();
	}
	else
	{
		winCamera.SetViewportActor(camera);
		winCamera.EnableViewport(True);
		winCamera.SetDefaultTexture(None);
		winCamera.Lower();
		SetTitle(CameraLabel @ "|&" $ String(viewIndex + 1) @ ":" @ MyComputerSecurity(compOwner).Views[viewIndex].titleString);
		winCameraStatus.Show();
		SetCameraStatus(camera.bActive);
	}
}

defaultproperties
{
}
