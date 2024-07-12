// Patio Chair

class PatioChair expands Seat;

#exec TEXTURE IMPORT NAME=PatioChair FILE=Textures\PatioChair.pcx GROUP=Skins

#exec MESH IMPORT MESH=PatioChair ANIVFILE=Models\PatioChair_a.3d DATAFILE=Models\PatioChair_d.3d

#exec MESH SEQUENCE MESH=PatioChair SEQ=All STARTFRAME=0   NUMFRAMES=1
#exec MESH SEQUENCE MESH=PatioChair SEQ=Still STARTFRAME=0   NUMFRAMES=1

#exec MESHMAP SCALE MESHMAP=PatioChair X=0.1015625 Y=0.1015625 Z=0.1015625

#exec MESHMAP SETTEXTURE MESHMAP=PatioChair NUM=0 TEXTURE=PatioChair

defaultproperties
{
     sitPoint(0)=(X=0.000000,Y=-3.000000,Z=0.000000)
     ItemName="Chair"
     Mesh=LodMesh'Zodiac.PatioChair'
     CollisionRadius=18.000000
     CollisionHeight=30.000000
     Mass=30.000000
     Buoyancy=5.000000
}
