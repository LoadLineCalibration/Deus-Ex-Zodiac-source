//
//
//

class ZRainMaker extends effects;

var() int MaxDrops;
var() float RainDensity;

var int Dropcount;
var float dropDistance;
var float timer;
var float droptime;

function Tick(float deltaTime)
 {
 local float distance;
 local int direction;
 local ZRainDrop drop;
 local vector loc;
 local rotator r;
 // spawn a drop if needs be
 if (DropCount>=MaxDrops)
    return;

 timer+=deltaTime;
 if (timer<droptime)
    return;

 // spawn that drop in a random location
 direction=Rand(65535);
 distance=FRand()*CollisionRadius;
 r=RotRand();
 r.Pitch=0;
 r.Roll=0;
 loc=Location+(Normal(Vector(r))*distance);
 drop=Spawn(class'ZRainDrop',,,loc);
 if (drop==none)
    return;
 timer=0.0;
 drop.DrawScale=0.05+(FRand()*0.2);
 drop.Scaleglow=0.1+(FRand()*0.3);
 drop.master=self;
 drop.Mass*=(1.0+(drop.drawScale*3));
 drop.Velocity=vect(0,0,-32);
 dropCount++;
 drop.textureNum=Rand(3);
 //drop.skin=tex[i];
 droptime=1.05-RainDensity;
 }

function PostBeginPlay()
 {
 local vector start,end,hl,hn;
 local Actor A;
 local bool bFoundFloor;
 super.PostBeginPlay();
 start=Location;
 end=Location+Vect(0,0,-2048);
 do
   {
   A=Trace(hl,hn,end,start);
   if (A==Level)
      {
      bFoundFloor=true;
      dropdistance=VSize(Location-hl);
      }
   else
       {
       start=hl;
       if (A==none || start==end)
          bFoundFloor=true;
       }
   } until (bFoundFloor);

 }

function LoseADrop()
 {
 DropCount--;
 }

defaultproperties
{
     MaxDrops=256
     RainDensity=0.990000
     bHidden=True
     DrawType=DT_Sprite
     Texture=Texture'Engine.S_Inventory'
     CollisionRadius=88.000000
     CollisionHeight=2.000000
     bCollideActors=True
}
