//=============================================================================
// MyComputerScreenSecurity
//=============================================================================

class MyComputerScreenSecurity expands ComputerScreenSecurity;

// ----------------------------------------------------------------------
// CreateCameraViewWindows()
// ----------------------------------------------------------------------

function CreateCameraViewWindows()
{
	winCameras[0] = MyComputerSecurityCameraWindow(winClient.NewChild(Class'MyComputerSecurityCameraWindow'));
	winCameras[0].SetPos(1, 175);
	winCameras[0].SetViewIndex(0);

	winCameras[1] = MyComputerSecurityCameraWindow(winClient.NewChild(Class'MyComputerSecurityCameraWindow'));
	winCameras[1].SetPos(208, 175);
	winCameras[1].SetViewIndex(1);

	winCameras[2] = MyComputerSecurityCameraWindow(winClient.NewChild(Class'MyComputerSecurityCameraWindow'));
	winCameras[2].SetPos(415, 175);
	winCameras[2].SetViewIndex(2);
}

// ----------------------------------------------------------------------
// InitCameras()
//
// 	Initialize the cameras
// ----------------------------------------------------------------------

function InitCameras()
{
	local int cameraIndex;
	local name tag;
	local SecurityCamera camera;
	local AutoTurret turret;
	local DeusExMover door;

	for (cameraIndex=0; cameraIndex<ArrayCount(winCameras); cameraIndex++)
	{
		winCameras[cameraIndex].compOwner = Computers(compOwner);
		winCameras[cameraIndex].camera = None;

		tag = MyComputerSecurity(compOwner).Views[cameraIndex].cameraTag;
		if (tag != '')
		{
			foreach player.AllActors(class'SecurityCamera', camera, tag)
			{
				// force the camera to wake up
				camera.bStasis = False;
				winCameras[cameraIndex].camera = camera;
			}
		}

		winCameras[cameraIndex].turret = None;
		tag = MyComputerSecurity(compOwner).Views[cameraIndex].turretTag;
		if (tag != '')
			foreach player.AllActors(class'AutoTurret', turret, tag)
				winCameras[cameraIndex].turret = turret;

		winCameras[cameraIndex].door = None;
		tag = MyComputerSecurity(compOwner).Views[cameraIndex].doorTag;
		if (tag != '')
			foreach player.AllActors(class'DeusExMover', door, tag)
				winCameras[cameraIndex].door = door;

		winCameras[cameraIndex].UpdateCameraStatus();
		winCameras[cameraIndex].UpdateTurretStatus();
		winCameras[cameraIndex].UpdateDoorStatus();
		winCameras[cameraIndex].winCamera.Show();
	}

	// Select the first security camera
	SelectFirstCamera();
}

defaultproperties
{
}
