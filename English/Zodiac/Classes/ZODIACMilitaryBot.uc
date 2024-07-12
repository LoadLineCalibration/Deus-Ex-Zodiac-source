//=============================================================================
// ZODIACMilitaryBot.
//=============================================================================
class ZODIACMilitaryBot extends Robot;

function PlayDisabled()
{
	local int rnd;

	rnd = Rand(3);
	if (rnd == 0)
		TweenAnimPivot('Disabled1', 0.2);
	else if (rnd == 1)
		TweenAnimPivot('Disabled2', 0.2);
	else
		TweenAnimPivot('Still', 0.2);
}

defaultproperties
{
     SearchingSound=Sound'DeusExSounds.Robot.MilitaryBotSearching'
     SpeechTargetAcquired=Sound'DeusExSounds.Robot.MilitaryBotTargetAcquired'
     SpeechTargetLost=Sound'DeusExSounds.Robot.MilitaryBotTargetLost'
     SpeechOutOfAmmo=Sound'DeusExSounds.Robot.MilitaryBotOutOfAmmo'
     SpeechCriticalDamage=Sound'DeusExSounds.Robot.MilitaryBotCriticalDamage'
     SpeechScanning=Sound'DeusExSounds.Robot.MilitaryBotScanning'
     EMPHitPoints=200
     explosionSound=Sound'DeusExSounds.Robot.MilitaryBotExplode'
     WalkingSpeed=1.000000
     bEmitDistress=True
     InitialInventory(0)=(Inventory=Class'DeusEx.WeaponRobotMachinegun')
     InitialInventory(1)=(Inventory=Class'DeusEx.Ammo762mm',Count=24)
     InitialInventory(2)=(Inventory=Class'DeusEx.WeaponRobotRocket')
     InitialInventory(3)=(Inventory=Class'DeusEx.AmmoRocketRobot',Count=10)
     WalkSound=Sound'DeusExSounds.Robot.MilitaryBotWalk'
     GroundSpeed=44.000000
     WaterSpeed=50.000000
     AirSpeed=144.000000
     AccelRate=500.000000
     Health=660
     UnderWaterTime=20.000000
     AttitudeToPlayer=ATTITUDE_Ignore
     DrawType=DT_Mesh
     Skin=Texture'Zodiac.Skins.ZODIACMilitaryBot'
     Mesh=LodMesh'DeusExCharacters.MilitaryBot'
     CollisionRadius=80.000000
     CollisionHeight=79.000000
     Mass=2000.000000
     Buoyancy=100.000000
     RotationRate=(Yaw=10000)
     BindName="MilitaryBot"
     FamiliarName="ZODIAC Bot"
     UnfamiliarName="ZODIAC Bot"
}
