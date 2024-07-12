//=============================================================================
// WeaponC4
//=============================================================================
class WeaponC4 extends WeaponLAM;

#exec TEXTURE IMPORT NAME=BeltIconC4 FILE=Textures\BeltIconC4.pcx GROUP=Icons
#exec TEXTURE IMPORT NAME=LargeIconC4 FILE=Textures\LargeIconC4.pcx GROUP=Icons

defaultproperties
{
     LowAmmoWaterMark=1
     HitDamage=350
     AmmoName=Class'Zodiac.AmmoC4'
     ProjectileClass=Class'Zodiac.C4_Projectile'
     InventoryGroup=37
     ItemName="C Compound Plastique (C-4)"
     PlayerViewOffset=(X=28.000000,Y=-13.000000)
     PlayerViewMesh=LodMesh'Zodiac.C4'
     PickupViewMesh=LodMesh'Zodiac.C4_pickup'
     ThirdPersonMesh=LodMesh'Zodiac.C4_3rd'
     Icon=Texture'Zodiac.Icons.BeltIconC4'
     largeIcon=Texture'Zodiac.Icons.LargeIconC4'
     Description="A brick of C-4 with an attached timer fuse, which is preset for 5 seconds.  This cyclotrimethylenetrinitramine-based compound is extremely powerful, so use caution."
     beltDescription="C-4"
     Mesh=LodMesh'Zodiac.C4_pickup'
     CollisionRadius=3.400000
     CollisionHeight=4.250000
}
