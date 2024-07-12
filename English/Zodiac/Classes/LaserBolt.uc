//=============================================================================
// LaserBolt.
//=============================================================================
class LaserBolt extends DeusExProjectile;

/*
#exec MESH IMPORT MESH=LaserBolt ANIVFILE=Models\LaserBolt_a.3d DATAFILE=Models\LaserBolt_d.3d
#exec MESH ORIGIN MESH=LaserBolt X=0 Y=0 Z=0 YAW=64
#exec MESHMAP SCALE MESHMAP=LaserBolt X=0.05 Y=1.0 Z=0.05
#exec MESH SEQUENCE MESH=PlasmaBolt SEQ=All	STARTFRAME=0	NUMFRAMES=1
#exec MESH SEQUENCE MESH=PlasmaBolt SEQ=Still	STARTFRAME=0	NUMFRAMES=1

#exec TEXTURE IMPORT NAME=SolidGreen FILE=Textures\SolidGreen.pcx GROUP=Misc
#exec TEXTURE IMPORT NAME=SolidWhite FILE=Textures\SolidWhite.pcx GROUP=Misc

#exec MESHMAP SETTEXTURE MESHMAP=LaserBolt NUM=1 TEXTURE=SolidGreen
#exec MESHMAP SETTEXTURE MESHMAP=LaserBolt NUM=2 TEXTURE=SolidWhite
*/


//
// update our flight path based on our ranges and tracking info
// We need to override this in order to prevent gravity from affecting the
// projectile.  Laser bolts shouldn't arc down like bullets.
//
simulated function Tick(float deltaTime)
{

	if (bStuck)
		return;

	Super(Projectile).Tick(deltaTime);

	// make the rotation match the velocity direction
	if (!bTracking)
		SetRotation(Rotator(Velocity));
}

defaultproperties
{
     bBlood=True
     DamageType=EnergyWeapon
     spawnAmmoClass=Class'Zodiac.AmmoEnergyClip'
     ItemName="Laser Bolt"
     speed=2000.000000
     Damage=10.000000
     MomentumTransfer=500
     Mesh=LodMesh'DeusExItems.LaserBeam'
     bUnlit=True
     CollisionRadius=3.000000
     CollisionHeight=0.500000
     LightType=LT_Steady
     LightEffect=LE_NonIncidence
     LightBrightness=255
     LightRadius=2
}
