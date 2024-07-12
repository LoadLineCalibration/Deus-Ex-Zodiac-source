class OfficeChairB expands Seat;

enum ESkinColor
{
	SC_GrayCloth,
	SC_BlueCloth,
	SC_RedCloth
};

var() ESkinColor SkinColor;

var float rollTimer;
var float pushTimer;
var vector pushVel;
var bool bJustPushed;

function StartRolling(vector vel)
{
	// Transfer momentum
	SetPhysics(PHYS_Rolling);
	pushVel = vel;
	pushVel.Z = 0;
	Velocity = pushVel;
	rollTimer = 2;
	bJustPushed = True;
	pushTimer = 0.5;
	AmbientSound = Sound'UtilityCart';
}

//
// give us velocity in the direction of the push
//
function Bump(actor Other)
{
	if (bJustPushed)
		return;

	if ((Other != None) && (Physics != PHYS_Falling))
		if (abs(Location.Z-Other.Location.Z) < (CollisionHeight+Other.CollisionHeight-1))  // no bump if landing on cart
			StartRolling(0.05*Other.Velocity*Other.Mass/Mass);
}

//
// simulate less friction (wheels)
//
function Tick(float deltaTime)
{
	Super.Tick(deltaTime);

	if ((Physics == PHYS_Rolling) && (rollTimer > 0))
	{
		rollTimer -= deltaTime;
		Velocity = pushVel;

		if (pushTimer > 0)
			pushTimer -= deltaTime;
		else
			bJustPushed = False;
	}


	// make the sound pitch depend on the velocity
	if (VSize(Velocity) > 1)
	{
		SoundPitch = Clamp(2*VSize(Velocity), 32, 64);
	}
	else
	{
		// turn off the sound when it stops
		AmbientSound = None;
		SoundPitch = Default.SoundPitch;
	}
}

#exec MESH IMPORT MESH=OfficeChairB ANIVFILE=Models\OfficeChairB_a.3d DATAFILE=Models\OfficeChairB_d.3d ZEROTEX=1

#exec MESH SEQUENCE MESH=OfficeChairB SEQ=All STARTFRAME=0   NUMFRAMES=1
#exec MESH SEQUENCE MESH=OfficeChairB SEQ=Still STARTFRAME=0   NUMFRAMES=1

#exec MESHMAP SCALE MESHMAP=OfficeChairB X=0.00390625 Y=0.00390625 Z=0.00390625

#exec TEXTURE IMPORT NAME=OfficeChairBTex1 FILE=Textures\OfficeChairBTex1.pcx GROUP=Skins
#exec TEXTURE IMPORT NAME=OfficeChairBTex2 FILE=Textures\OfficeChairBTex2.pcx GROUP=Skins
#exec TEXTURE IMPORT NAME=OfficeChairBTex3 FILE=Textures\OfficeChairBTex3.pcx GROUP=Skins
#exec MESHMAP SETTEXTURE MESHMAP=OfficeChairB NUM=0 TEXTURE=OfficeChairBTex1

function BeginPlay()
{
	Super.BeginPlay();

	switch (SkinColor)
	{
		case SC_GrayCloth:	Skin = Texture'OfficeChairBTex1'; break;
		case SC_BlueCloth:	Skin = Texture'OfficeChairBTex2'; break;
		case SC_RedCloth:	      Skin = Texture'OfficeChairBTex3'; break;
	}
}

defaultproperties
{
     sitPoint(0)=(X=0.000000,Y=-4.000000,Z=-4.000000)
     ItemName="Office Chair"
     Mesh=LodMesh'Zodiac.OfficeChairB'
     CollisionRadius=18.000000
     CollisionHeight=30.000000
     Mass=50.000000
     Buoyancy=5.000000
}
