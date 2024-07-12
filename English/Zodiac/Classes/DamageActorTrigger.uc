//=============================================================================
// DamageActorTrigger.
//=============================================================================
class DamageActorTrigger expands Trigger;

var() name damageTag;
var() float damageAmount;
var() name damageType;
var() Sound Sound;
var Actor ActorToDamage;

// if we are triggered, cause damage to named Actor
function Trigger(Actor Other, Pawn Instigator)
{
	if (damageTag != '') {
		foreach AllActors(class'Actor', ActorToDamage, damageTag)
		{
			ActorToDamage.TakeDamage(damageAmount, None, ActorToDamage.Location, vect(0,0,0), damageType);
		}
	}

	if (Sound != None) {
		PlaySound( Sound );
	}

	Super.Trigger(Other, Instigator);
}

defaultproperties
{
     DamageAmount=500.000000
     DamageType=exploded
     CollisionRadius=0.000000
     CollisionHeight=0.000000
}
