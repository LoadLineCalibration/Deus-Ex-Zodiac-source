//=============================================================================
// BiomatterSample.
//=============================================================================
class BiomatterSample extends DeusExPickup;

#exec TEXTURE IMPORT NAME=BeltIconBiosample FILE=Textures\BeltIconBiosample.pcx GROUP=Icons FLAGS=2 MIPS=Off
#exec TEXTURE IMPORT NAME=LargeIconBiosample FILE=Textures\LargeIconBiosample.pcx GROUP=Icons FLAGS=2 MIPS=Off

defaultproperties
{
     maxCopies=1
     ItemName="Sample of bio-storage matter"
     PlayerViewOffset=(X=30.000000,Z=-12.000000)
     PlayerViewMesh=LodMesh'DeusExItems.VialAmbrosia'
     PickupViewMesh=LodMesh'DeusExItems.VialAmbrosia'
     ThirdPersonMesh=LodMesh'DeusExItems.VialAmbrosia'
     LandSound=Sound'DeusExSounds.Generic.GlassHit1'
     Icon=Texture'Zodiac.Icons.BeltIconBiosample'
     largeIcon=Texture'Zodiac.Icons.LargeIconBiosample'
     largeIconWidth=18
     largeIconHeight=44
     Description="A sample of biological matter.  Its unique properties make it ideal for use in data storage devices and allow for densities unheard of with current technology.  Its origin is unknown, however some suspect it was part of a recovered EBE craft."
     beltDescription="BIOMATTER"
     Mesh=LodMesh'DeusExItems.VialAmbrosia'
     MultiSkins(1)=FireTexture'Effects.Electricity.Nano_SFX_A'
     CollisionRadius=2.200000
     CollisionHeight=4.890000
     Mass=2.000000
     Buoyancy=3.000000
}
