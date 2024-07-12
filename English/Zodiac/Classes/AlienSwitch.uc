//=============================================================================
// AlienSwitch
//=============================================================================
class AlienSwitch extends DeusExDecoration;

#exec TEXTURE IMPORT NAME=AlienSwitchTex1 FILE=Textures\AlienSwitchTex1.pcx GROUP=Skins
#exec TEXTURE IMPORT NAME=AlienSwitchTex2a FILE=Textures\AlienSwitchTex2a.pcx GROUP=Skins
#exec TEXTURE IMPORT NAME=AlienSwitchTex2b FILE=Textures\AlienSwitchTex2b.pcx GROUP=Skins

#exec MESH IMPORT MESH=AlienSwitch ANIVFILE=Models\AlienSwitch_a.3d DATAFILE=Models\AlienSwitch_d.3d

#exec MESH SEQUENCE MESH=AlienSwitch SEQ=All STARTFRAME=0   NUMFRAMES=1
#exec MESH SEQUENCE MESH=AlienSwitch SEQ=Still STARTFRAME=0   NUMFRAMES=1

#exec MESHMAP SCALE MESHMAP=AlienSwitch X=0.1015625 Y=0.1015625 Z=0.1015625

#exec MESHMAP SETTEXTURE MESHMAP=AlienSwitch NUM=0 TEXTURE=AlienSwitchTex2a
#exec MESHMAP SETTEXTURE MESHMAP=AlienSwitch NUM=1 TEXTURE=AlienSwitchTex1

var() float buttonLitTime;
var() sound buttonSound1;
var() sound buttonSound2;
var() bool bLit;
var() bool bWaitForEvent;
var bool isPressed;

// WOW! What a mess.  I wish you could convert strings to names!
function SetSkin(bool lit)
{
	if (lit)
	{
		Skin = Texture'AlienSwitchTex2b';
	}
	else
	{
		Skin = Texture'AlienSwitchTex2a';
	}
}

function BeginPlay()
{
	Super.BeginPlay();

	SetSkin(bLit);
}

function Trigger(Actor Other, Pawn Instigator)
{
	if (bWaitForEvent)
		Timer();
}

function Timer()
{
	PlaySound(buttonSound2, SLOT_None);
	SetSkin(bLit);
	isPressed = False;
}

function Frob(Actor Frobber, Inventory frobWith)
{
	if (!isPressed)
	{
		isPressed = True;
		PlaySound(buttonSound1, SLOT_None);
		SetSkin(!bLit);
		if (!bWaitForEvent)
			SetTimer(buttonLitTime, False);

		Super.Frob(Frobber, frobWith);
	}
}

singular function SupportActor(Actor standingActor)
{
	// do nothing
}

function Bump(actor Other)
{
	// do nothing
}

defaultproperties
{
     buttonLitTime=0.750000
     buttonSound1=Sound'Zodiac.Ambient.Alien1'
     bInvincible=True
     ItemName="Button"
     bPushable=False
     Physics=PHYS_None
     Mesh=LodMesh'Zodiac.AlienSwitch'
     CollisionRadius=4.000000
     CollisionHeight=4.000000
     bCollideWorld=False
     bBlockActors=False
     Mass=5.000000
     Buoyancy=2.000000
}
