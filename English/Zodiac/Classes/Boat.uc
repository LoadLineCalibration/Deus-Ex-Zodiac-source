//=============================================================================
// Boat.
//=============================================================================
class Boat extends Vehicles;

#exec TEXTURE IMPORT NAME=BoatTex1 FILE=Textures\BoatTex1.pcx FLAGS=2

defaultproperties
{
     bFloating=True
     ItemName="Boat"
     Texture=Texture'DeusExItems.Skins.ReflectionMapTex1'
     Mesh=LodMesh'DeusExDeco.NYPoliceBoat'
     MultiSkins(0)=Texture'Zodiac.BoatTex1'
     MultiSkins(1)=Texture'Zodiac.BoatTex1'
     MultiSkins(2)=Texture'DeusExItems.Skins.PinkMaskTex'
     MultiSkins(3)=Texture'DeusExItems.Skins.PinkMaskTex'
     MultiSkins(4)=Texture'Zodiac.BoatTex1'
     SoundRadius=64
     SoundVolume=192
     AmbientSound=Sound'Ambient.Ambient.BoatLargeIdle'
     CollisionRadius=150.000000
     CollisionHeight=122.000000
     Mass=4000.000000
     Buoyancy=5000.000000
}
