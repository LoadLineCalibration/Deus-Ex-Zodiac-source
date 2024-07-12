//=============================================================================
// JPlasmaRing.
//=============================================================================
class JPlasmaRing extends Effects;

var float size;
var() Sound AmbientSound;

simulated function Tick(float deltaTime)
{
	DrawScale = 0.5 * size * (Default.LifeSpan - LifeSpan) / Default.LifeSpan;
	ScaleGlow = 0.5 * (LifeSpan / Default.LifeSpan);
} 

simulated function PostBeginPlay() 
{
       SpawnEffects();
}
       
simulated function SpawnEffects()
{
     local int i;
     local Rotator rot;
     local ScorchMark mark;   
  
  mark = Spawn(class'ScorchMark');
  if (mark !=None)
       mark.DrawScale = 1.0;
}

defaultproperties
{
     size=1.200000
     LifeSpan=0.550000
     DrawType=DT_Mesh
     Style=STY_Translucent
     Skin=Texture'Zodiac.Misc.JPlasma4'
     Mesh=LodMesh'DeusExItems.FlatFX'
     bUnlit=True
     LightRadius=1
}
