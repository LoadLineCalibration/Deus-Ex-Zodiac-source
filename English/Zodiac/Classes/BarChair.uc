// Bar Chair

class BarChair expands Seat;

#exec TEXTURE IMPORT NAME=BarChair FILE=Textures\BarChair.pcx GROUP=Skins

#exec MESH IMPORT MESH=BarChair ANIVFILE=Models\BarChair_a.3d DATAFILE=Models\BarChair_d.3d

#exec MESH SEQUENCE MESH=BarChair SEQ=All STARTFRAME=0   NUMFRAMES=1
#exec MESH SEQUENCE MESH=BarChair SEQ=Still STARTFRAME=0   NUMFRAMES=1

#exec MESHMAP SCALE MESHMAP=BarChair X=0.1015625 Y=0.1015625 Z=0.1015625

#exec MESHMAP SETTEXTURE MESHMAP=BarChair NUM=0 TEXTURE=BarChair

defaultproperties
{
     sitPoint(0)=(X=0.000000,Y=-3.000000,Z=0.000000)
     ItemName="Chair"
     Mesh=LodMesh'Zodiac.BarChair'
     CollisionRadius=18.000000
     CollisionHeight=30.000000
     Mass=50.000000
     Buoyancy=5.000000
}
