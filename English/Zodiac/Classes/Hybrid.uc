//=============================================================================
// Hybrid - a hybrid of an alien "grey" and human DNA
//=============================================================================
class Hybrid extends DeusExDecoration;

#exec MESH IMPORT MESH=Hybrid ANIVFILE=Models\Hybrid_a.3d DATAFILE=Models\Hybrid_d.3d

#exec MESH SEQUENCE MESH=Hybrid SEQ=All STARTFRAME=0   NUMFRAMES=1
#exec MESH SEQUENCE MESH=Hybrid SEQ=Still STARTFRAME=0   NUMFRAMES=1

#exec MESHMAP SCALE MESHMAP=Hybrid X=0.00390625 Y=0.00390625 Z=0.00390625

#exec MESHMAP SETTEXTURE MESHMAP=Hybrid NUM=0 TEXTURE=DeusExCharacters.Skins.GrayTex1

defaultproperties
{
     bHighlight=False
     ItemName="Hybrid"
     Physics=PHYS_None
     Mesh=LodMesh'Zodiac.Hybrid'
     CollisionRadius=0.000000
     CollisionHeight=0.000000
}
