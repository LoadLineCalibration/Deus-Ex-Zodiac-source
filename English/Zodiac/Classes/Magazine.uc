class Magazine expands InformationDevices;

#exec MESH IMPORT MESH=Magazine ANIVFILE=Models\magazine_a.3d DATAFILE=Models\magazine_d.3d ZEROTEX=1

#exec MESH SEQUENCE MESH=Magazine SEQ=All STARTFRAME=0   NUMFRAMES=1
#exec MESH SEQUENCE MESH=Magazine SEQ=Still STARTFRAME=0   NUMFRAMES=1

#exec MESHMAP SCALE MESHMAP=Magazine X=0.00390625 Y=0.00390625 Z=0.00390625

#exec TEXTURE IMPORT NAME=StuffMag FILE=Textures\StuffMag.pcx GROUP=Skins
#exec MESHMAP SETTEXTURE MESHMAP=Magazine NUM=0 TEXTURE=StuffMag

defaultproperties
{
     bCanBeBase=True
     ItemName="Magazine"
     Mesh=LodMesh'Zodiac.Magazine'
     CollisionRadius=13.800000
     CollisionHeight=0.500000
     Mass=3.000000
     Buoyancy=8.000000
}
