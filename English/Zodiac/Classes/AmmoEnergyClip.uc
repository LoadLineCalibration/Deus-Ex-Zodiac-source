//=============================================================================
// AmmoEnergyClip.
//=============================================================================
class AmmoEnergyClip extends DeusExAmmo;

#exec TEXTURE IMPORT NAME=BeltIconAmmoEClip FILE=Textures\BeltIconAmmoEClip.pcx GROUP=Icons FLAGS=2 MIPS=Off

defaultproperties
{
     bShowInfo=True
     AmmoAmount=14
     MaxAmmo=140
     ItemName="Energy clip"
     ItemArticle="an"
     PickupViewMesh=LodMesh'Zodiac.eclip'
     Icon=Texture'Zodiac.Icons.BeltIconAmmoEClip'
     largeIcon=Texture'Zodiac.Icons.BeltIconAmmoEClip'
     largeIconWidth=32
     largeIconHeight=32
     Description="An energy weapon clip powered by a multi-layered Membrane Electrode Assembly (MEA) hyrdrogen fuel cell.  It utilizes an elastomeric gasket edge seal system for maximum safety."
     beltDescription="ECLIP"
     Mesh=LodMesh'Zodiac.eclip'
     CollisionRadius=4.500000
     CollisionHeight=1.000000
     bCollideActors=True
}
