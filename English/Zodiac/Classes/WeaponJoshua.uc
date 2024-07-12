//=============================================================================
// WeaponJoshua.
//=============================================================================
class WeaponJoshua extends DeusExWeapon;

#exec TEXTURE IMPORT NAME=BeltIconJoshua FILE=Textures\BeltIconJoshua.pcx GROUP=Icons FLAGS=2 MIPS=Off 
#exec TEXTURE IMPORT NAME=LargeIconJoshua FILE=Textures\LargeIconJoshua.pcx GROUP=Icons FLAGS=2 MIPS=Off
     
function ProcessTraceHit(Actor Other, Vector HitLocation, Vector HitNormal, Vector X, Vector Y, Vector Z)
{
	local int i;
	local PlayerPawn PlayerOwner;

	if (Other==None)
	{
		HitNormal = -X;
		HitLocation = Owner.Location + X*10000.0;
	}

	PlayerOwner = PlayerPawn(Owner);
	if ( PlayerOwner != None )
		PlayerOwner.ClientInstantFlash( -0.4, vect(450, 190, 650));

	SpawnEffect(HitLocation, Owner.Location + CalcDrawOffset() + (FireOffset.X + 20) * X + FireOffset.Y * Y + FireOffset.Z * Z);

	Spawn(class'JPlasmaRing',,, HitLocation+HitNormal*8,rotator(HitNormal));

      // Note: The original "momentum" value was 120000.0*X
	if ( (Other != self) && (Other != Owner) && (Other != None) ) 
		Other.TakeDamage(HitDamage, Pawn(Owner), HitLocation, 12000.0*X, 'EnergyWeapon');
               
}


function SpawnEffect(vector HitLocation, vector SmokeLocation)
{
	local JoshuaBeam Smoke,shock;
	local Vector DVector;
	local int NumPoints;
	local rotator SmokeRotation;

	DVector = HitLocation - SmokeLocation;
	NumPoints = VSize(DVector)/135.0;
	if ( NumPoints < 1 )
		return;
	SmokeRotation = rotator(DVector);
	SmokeRotation.roll = Rand(65535);
	
	Smoke = Spawn(class'JoshuaBeam',,,SmokeLocation,SmokeRotation);
	Smoke.MoveAmount = DVector/NumPoints;
	Smoke.NumPuffs = NumPoints - 1;	
}

defaultproperties
{
     LowAmmoWaterMark=16
     GoverningSkill=Class'DeusEx.SkillWeaponRifle'
     EnviroEffective=ENVEFF_Air
     Concealability=CONC_Visual
     ShotTime=0.300000
     reloadTime=3.000000
     HitDamage=30
     maxRange=32000
     AccurateRange=32000
     BaseAccuracy=0.000000
     bCanHaveLaser=True
     AmmoNames(0)=Class'Zodiac.AmmoEnergyClip'
     recoilStrength=0.300000
     bCanHaveModReloadTime=True
     AmmoName=Class'Zodiac.AmmoEnergyClip'
     ReloadCount=16
     PickupAmmoCount=16
     bInstantHit=True
     FireOffset=(X=18.000000,Y=5.500000,Z=13.500000)
     shakemag=50.000000
     FireSound=Sound'Zodiac.Ambient.JoshuaFire'
     CockingSound=Sound'DeusExSounds.Weapons.PlasmaRifleReload'
     SelectSound=Sound'DeusExSounds.Weapons.NanoSwordSelect'
     InventoryGroup=38
     ItemName="Energy Rifle"
     ItemArticle="an"
     PlayerViewOffset=(X=16.000000,Y=-5.000000,Z=-11.500000)
     PlayerViewMesh=LodMesh'Zodiac.Joshua_1st'
     PickupViewMesh=LodMesh'Zodiac.Joshua_pickup'
     ThirdPersonMesh=LodMesh'Zodiac.Joshua_3rd'
     LandSound=Sound'DeusExSounds.Generic.DropLargeWeapon'
     Icon=Texture'Zodiac.Icons.BeltIconJoshua'
     largeIcon=Texture'Zodiac.Icons.LargeIconJoshua'
     largeIconWidth=189
     largeIconHeight=60
     invSlotsX=4
     invSlotsY=2
     Description="This prototype JOSHUA energy rifle uses a focused Chemical Oxygen Iodine Laser (COIL) beam designed to disrupt the cellular tissue of biological targets.  While it can be quite damaging to humans, it is especially harmful to most known species of EBE (extraterrestrial biological entity), due to their thinner skin.  In fact, it is possible for a Grey EBE's skin to ignite upon contact with the beam."
     beltDescription="E-RIFLE"
     Mesh=LodMesh'Zodiac.Joshua_pickup'
     CollisionRadius=21.000000
     CollisionHeight=1.500000
     Mass=30.000000
}
