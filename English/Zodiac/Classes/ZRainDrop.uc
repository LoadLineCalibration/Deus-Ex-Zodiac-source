//
//
//

class ZRainDrop extends effects;

//#exec OBJ LOAD FILE=..\Textures\RainMOD.utx PACKAGE=RainMOD

var ZRainMaker master;
var texture t;
var float life;
var int textureNum;
var texture tex[21];
var DeusExPlayer player;

function tick(float deltaTime)
 {
 super.Tick(deltatime);
 life+=deltaTime;
 if (life>20.0 || (VSize(Velocity)<1.0 && life>0.8) )
    {
    master.LoseADrop();
    Destroy();
    }
 // update texture
 UpdateTexture();
 }

simulated function HitWall (vector HitNormal, actor HitWall)
{
   if (life<0.8)
      return;
   master.LoseADrop();
   Destroy();
}

function UpdateTexture()
 {
 local int f;
 if (player==none)
     player=DeusExPlayer(GetPlayerPawn());
 // choose a texture based on textureNum and player viewrotation.pitch
 f=player.viewRotation.Pitch;
 if (f>12000 && f<18200)
    texture=tex[0];
 else if (f>6000 && f<12000)
    texture=tex[1];
 else if (f>0 && f<6000)
    texture=tex[2];
 else if (f<65535 && f>60074)
    texture=tex[3];
 else if (f<60074 && f>54613)
    texture=tex[4];
 else if (f>49100 && f<54613)
    texture=tex[5];
 }

defaultproperties
{
     Physics=PHYS_Falling
     DrawType=DT_Sprite
     Style=STY_Translucent
     Texture=None
     DrawScale=0.800000
     ScaleGlow=0.500000
     CollisionRadius=1.000000
     CollisionHeight=1.000000
     bCollideWorld=True
     Mass=600.000000
}
