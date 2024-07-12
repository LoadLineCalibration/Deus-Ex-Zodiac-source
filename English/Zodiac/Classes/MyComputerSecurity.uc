//=============================================================================
// MyComputerSecurity.
//=============================================================================
class MyComputerSecurity extends MyComputers;

struct sViewInfo
{
	var() localized string	titleString;
	var() name				cameraTag;
	var() name				turretTag;
	var() name				doorTag;
};

var() sViewInfo Views[3];

defaultproperties
{
     terminalType=Class'Zodiac.MyNetworkTerminalSecurity'
     lockoutDelay=120.000000
     UserList(0)=(userName="SECURITY",Password="SECURITY")
     ItemName="Security Computer Terminal"
     Physics=PHYS_None
     Mesh=LodMesh'DeusExDeco.ComputerSecurity'
     SoundRadius=8
     SoundVolume=255
     SoundPitch=96
     AmbientSound=Sound'DeusExSounds.Generic.SecurityL'
     CollisionRadius=11.590000
     CollisionHeight=10.100000
     bCollideWorld=False
     BindName="ComputerSecurity"
}
