//=============================================================================
// JoshuaBeam.
//=============================================================================
class JoshuaBeam extends Effects;


var vector MoveAmount;
var int NumPuffs;

replication
{
	// Things the server should send to the client.
	unreliable if( Role==ROLE_Authority )
		MoveAmount, NumPuffs;
}

simulated function Tick( float DeltaTime )
{
	if ( Level.NetMode  != NM_DedicatedServer )
	{
		ScaleGlow = (Lifespan/Default.Lifespan)*1.0;
		AmbientGlow = ScaleGlow * 210;
	}
}


simulated function PostBeginPlay()
{
	if ( Level.NetMode != NM_DedicatedServer )
		SetTimer(0.05, false);
}

simulated function Timer()
{
	local JoshuaBeam r;
	
	if (NumPuffs>0)
	{
		r = Spawn(class'JoshuaBeam',,,Location+MoveAmount);
		r.RemoteRole = ROLE_None;
		r.NumPuffs = NumPuffs -1;
		r.MoveAmount = MoveAmount;
	}
}

defaultproperties
{
     Physics=PHYS_Rotating
     LifeSpan=0.400000
     DrawType=DT_Mesh
     Style=STY_Translucent
     Texture=Texture'Zodiac.Misc.JPlasma1'
     Mesh=LodMesh'Zodiac.JoshuaBeam'
     DrawScale=0.030000
     bUnlit=True
     bParticles=True
     bFixedRotationDir=True
}
