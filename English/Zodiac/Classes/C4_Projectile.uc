//=============================================================================
// C4_Projectile
//=============================================================================
class C4_Projectile extends ThrownProjectile;

var int fuseSeconds;
var int prevFuseSeconds;
var Texture LEDTextures[5];

function BeginPlay() {

	fuseSeconds = fuseLength;
	prevFuseSeconds = 999;
}


function Tick(float deltaTime) {

	fuseSeconds = fuseLength;
	if (prevFuseSeconds != fuseSeconds) {
		// We're on a new "second", so change the
		// displayed L.E.D. digit and beep

		prevFuseSeconds = fuseSeconds;
		
		if (fuseLength > 4.5)
			MultiSkins[0] = LEDTextures[4];
		else
			MultiSkins[0] = LEDTextures[fuseSeconds];

		PlaySound(sound'Beep4',,,, 1280);
	}

	fuseLength = fuseLength - deltaTime;

	// If the fuse has run down, blow up the C4
	if (fuseLength <= 0.0) 
		Explode(Location, Vector(Rotation));

}

defaultproperties
{
     LEDTextures(0)=Texture'Zodiac.Weapons.LED_1'
     LEDTextures(1)=Texture'Zodiac.Weapons.LED_2'
     LEDTextures(2)=Texture'Zodiac.Weapons.LED_3'
     LEDTextures(3)=Texture'Zodiac.Weapons.LED_4'
     LEDTextures(4)=Texture'Zodiac.Weapons.LED_5'
     proxRadius=1.000000
     blastRadius=50.000000
     spawnWeaponClass=Class'Zodiac.WeaponC4'
     ItemName="C Compound Plastique (C-4)"
     speed=1800.000000
     MaxSpeed=1800.000000
     Damage=1000.000000
     MomentumTransfer=50000
     ImpactSound=Sound'DeusExSounds.Weapons.LAMExplode'
     ExplosionDecal=Class'DeusEx.ScorchMark'
     LifeSpan=0.000000
     Mesh=LodMesh'Zodiac.C4_3rd'
     CollisionRadius=4.250000
     CollisionHeight=3.400000
     Mass=5.000000
     Buoyancy=2.000000
}
