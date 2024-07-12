class CafChair expands Seat;

enum ESkinColor
{
	SC_BlueCloth,
	SC_GreenCloth,
	SC_RedCloth
};

var() ESkinColor SkinColor;

#exec TEXTURE IMPORT NAME=ClenGrayMetal_B2 FILE=Textures\ClenGrayMetal_B2.pcx GROUP=Skins

#exec MESH IMPORT MESH=CafChair ANIVFILE=Models\CafChair_a.3d DATAFILE=Models\CafChair_d.3d

#exec MESH SEQUENCE MESH=CafChair SEQ=All STARTFRAME=0   NUMFRAMES=1
#exec MESH SEQUENCE MESH=CafChair SEQ=Still STARTFRAME=0   NUMFRAMES=1

#exec MESHMAP SCALE MESHMAP=CafChair X=0.00390625 Y=0.00390625 Z=0.00390625

#exec MESHMAP SETTEXTURE MESHMAP=CafChair NUM=0 TEXTURE=DeusExDeco.WHChairPinkBackTex1
#exec MESHMAP SETTEXTURE MESHMAP=CafChair NUM=1 TEXTURE=ClenGrayMetal_B2


function BeginPlay()
{
	Super.BeginPlay();

	switch (SkinColor)
	{
		case SC_BlueCloth:	Skin = Texture'DeusExDeco.WHChairPinkBackTex1'; break;
		case SC_GreenCloth:	Skin = Texture'DeusExDeco.WHChairPinkBackTex2'; break;
		case SC_RedCloth:	      Skin = Texture'DeusExDeco.WHChairPinkBackTex3'; break;
	}
}

defaultproperties
{
     sitPoint(0)=(X=0.000000,Y=-4.000000,Z=2.000000)
     ItemName="Chair"
     Mesh=LodMesh'Zodiac.CafChair'
     CollisionRadius=20.000000
     CollisionHeight=30.000000
     Mass=50.000000
     Buoyancy=5.000000
}
