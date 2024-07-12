//=============================================================================
// ZodiacGrey.
//=============================================================================
class ZodiacGrey extends Animal;

#exec OBJ LOAD FILE=Ambient

var float damageRadius;
var float damageInterval;
var float damageAmount;
var float damageTime;

function ComputeFallDirection(float totalTime, int numFrames,
                              out vector moveDir, out float stopTime)
{
	// Determine direction, and how long to slide
	if (AnimSequence == 'DeathFront')
	{
		moveDir = Vector(DesiredRotation) * Default.CollisionRadius*2.0;
		stopTime = totalTime*0.7;
	}
	else if (AnimSequence == 'DeathBack')
	{
		moveDir = -Vector(DesiredRotation) * Default.CollisionRadius*1.8;
		stopTime = totalTime*0.65;
	}
}

// ----------------------------------------------------------------------
// TakeDamageBase()
// ----------------------------------------------------------------------

function TakeDamageBase(int Damage, Pawn instigatedBy, Vector hitlocation, Vector momentum, name damageType,
                        bool bPlayAnim)
{
	local int          actualDamage;
	local Vector       offset;
	local float        origHealth;
	local EHitLocation hitPos;
	local float        shieldMult;

	// use the hitlocation to determine where the pawn is hit
	// transform the worldspace hitlocation into objectspace
	// in objectspace, remember X is front to back
	// Y is side to side, and Z is top to bottom
	offset = (hitLocation - Location) << Rotation;

	if (!CanShowPain())
		bPlayAnim = false;

	// Prevent injury if the NPC is intangible
	if (!bBlockActors && !bBlockPlayers && !bCollideActors)
		return;

	// No damage + no damage type = no reaction
	if ((Damage <= 0) && (damageType == 'None'))
		return;

	// Block certain damage types; perform special ops on others
	if (!FilterDamageType(instigatedBy, hitLocation, offset, damageType))
		return;

	// Impart momentum
	ImpartMomentum(momentum, instigatedBy);

	actualDamage = ModifyDamage(Damage, instigatedBy, hitLocation, offset, damageType);

	if (actualDamage > 0)
	{
		shieldMult = ShieldDamage(damageType);
		if (shieldMult > 0)
			actualDamage = Max(int(actualDamage*shieldMult), 1);
		else
			actualDamage = 0;
		if (shieldMult < 1.0)
			DrawShield();
	}

	origHealth = Health;

	hitPos = HandleDamage(actualDamage, hitLocation, offset, damageType);
	if (!bPlayAnim || (actualDamage <= 0))
		hitPos = HITLOC_None;

	if (bCanBleed)
		if ((damageType != 'Stunned') && (damageType != 'TearGas') && (damageType != 'HalonGas') &&
		    (damageType != 'PoisonGas') && (damageType != 'Radiation') && (damageType != 'EMP') &&
		    (damageType != 'NanoVirus') && (damageType != 'Drowned') && (damageType != 'KnockedOut') &&
		    (damageType != 'Poison') && (damageType != 'PoisonEffect'))
			bleedRate += (origHealth-Health)/(0.3*Default.Health);  // 1/3 of default health = bleed profusely

	if (CarriedDecoration != None)
		DropDecoration();

	if ((actualDamage > 0) && (damageType == 'Poison'))
		StartPoison(Damage, instigatedBy);

	if (Health <= 0)
	{
		ClearNextState();
		//PlayDeathHit(actualDamage, hitLocation, damageType);
		if ( actualDamage > mass )
			Health = -1 * actualDamage;
		SetEnemy(instigatedBy, 0, true);

		// gib us if we get blown up
		if (DamageType == 'Exploded')
			Health = -10000;
		else
			Health = -1;

		Died(instigatedBy, damageType, HitLocation);

		if ((DamageType == 'Flamed') || (DamageType == 'Burned') || (DamageType == 'EnergyWeapon'))
		{
			bBurnedToDeath = true;
			ScaleGlow *= 0.1;  // blacken the corpse
		}
		else
			bBurnedToDeath = false;

		return;
	}

	// play a hit sound
	if (DamageType != 'Stunned')
		PlayTakeHitSound(actualDamage, damageType, 1);

//	if ((DamageType == 'Flamed') && !bOnFire)
//		CatchFire();

	if ((DamageType == 'EnergyWeapon') && !bOnFire)
		CatchFire();

	ReactToInjury(instigatedBy, damageType, hitPos);
}


function bool FilterDamageType(Pawn instigatedBy, Vector hitLocation,
                               Vector offset, Name damageType)
{
	// Greys aren't affected by radiation or gas
	if (damageType == 'Radiation')
		return false;
	else if ((damageType == 'TearGas') || (damageType == 'HalonGas') || (damageType == 'PoisonGas'))
		return false;
	else
		return Super.FilterDamageType(instigatedBy, hitLocation, offset, damageType);
}

function GotoDisabledState(name damageType, EHitLocation hitPos)
{
	if (!bCollideActors && !bBlockActors && !bBlockPlayers)
		return;
	else if (damageType == 'Stunned')
		GotoNextState();
	else if (CanShowPain())
		TakeHit(hitPos);
	else
		GotoNextState();
}

function TweenToAttack(float tweentime)
{
	if (Region.Zone.bWaterZone)
		TweenAnimPivot('Tread', tweentime, GetSwimPivot());
	else
		TweenAnimPivot('Attack', tweentime);
}

function PlayAttack()
{
	if ((Weapon != None) && Weapon.IsA('WeaponGraySpit'))
		PlayAnimPivot('Shoot');
	else
		PlayAnimPivot('Attack');
}

function PlayPanicRunning()
{
	PlayRunning();
}

function PlayTurning()
{
	if (Region.Zone.bWaterZone)
		LoopAnimPivot('Tread',,,, GetSwimPivot());
	else
		LoopAnimPivot('Walk', 0.1);
}

function TweenToWalking(float tweentime)
{
	if (Region.Zone.bWaterZone)
		TweenAnimPivot('Tread', tweentime, GetSwimPivot());
	else
		TweenAnimPivot('Walk', tweentime);
}

function PlayWalking()
{
	if (Region.Zone.bWaterZone)
		LoopAnimPivot('Tread',,,, GetSwimPivot());
	else
		LoopAnimPivot('Walk', , 0.15);
}

function TweenToRunning(float tweentime)
{
	if (Region.Zone.bWaterZone)
		TweenAnimPivot('Tread', tweentime, GetSwimPivot());
	else
		LoopAnimPivot('Run',, tweentime);
}

function PlayRunning()
{
	if (Region.Zone.bWaterZone)
		LoopAnimPivot('Tread',,,, GetSwimPivot());
	else
		LoopAnimPivot('Run');
}
function TweenToWaiting(float tweentime)
{
	if (Region.Zone.bWaterZone)
		TweenAnimPivot('Tread', tweentime, GetSwimPivot());
	else
		TweenAnimPivot('BreatheLight', tweentime);
}
function PlayWaiting()
{
	if (Region.Zone.bWaterZone)
		LoopAnimPivot('Tread',,,, GetSwimPivot());
	else
		LoopAnimPivot('BreatheLight', , 0.3);
}

function PlayTakingHit(EHitLocation hitPos)
{
	local vector pivot;
	local name   animName;

	animName = '';
	if (!Region.Zone.bWaterZone)
	{
		switch (hitPos)
		{
			case HITLOC_HeadFront:
			case HITLOC_TorsoFront:
			case HITLOC_LeftArmFront:
			case HITLOC_RightArmFront:
			case HITLOC_LeftLegFront:
			case HITLOC_RightLegFront:
				animName = 'HitFront';
				break;

			case HITLOC_HeadBack:
			case HITLOC_TorsoBack:
			case HITLOC_LeftArmBack:
			case HITLOC_RightArmBack:
			case HITLOC_LeftLegBack:
			case HITLOC_RightLegBack:
				animName = 'HitBack';
				break;
		}
		pivot = vect(0,0,0);
	}

	if (animName != '')
		PlayAnimPivot(animName, , 0.1, pivot);
}

// sound functions
function PlayIdleSound()
{
	if (FRand() < 0.5)
		PlaySound(sound'GrayIdle', SLOT_None);
	else
		PlaySound(sound'GrayIdle2', SLOT_None);
}

function PlayScanningSound()
{
	if (FRand() < 0.3)
	{
		if (FRand() < 0.5)
			PlaySound(sound'GrayIdle', SLOT_None);
		else
			PlaySound(sound'GrayIdle2', SLOT_None);
	}
}

function PlayTargetAcquiredSound()
{
	PlaySound(sound'GrayAlert', SLOT_None);
}

function PlayCriticalDamageSound()
{
	PlaySound(sound'GrayFlee', SLOT_None);
}

defaultproperties
{
     DamageRadius=256.000000
     damageInterval=1.000000
     DamageAmount=10.000000
     bPlayDying=True
     MinHealth=10.000000
     CarcassType=Class'Zodiac.ZodiacGreyCarcass'
     WalkingSpeed=0.280000
     bCanBleed=True
     CloseCombatMult=0.500000
     ShadowScale=0.750000
     InitialInventory(0)=(Inventory=Class'DeusEx.WeaponGraySwipe')
     InitialInventory(1)=(Inventory=Class'DeusEx.WeaponGraySpit')
     InitialInventory(2)=(Inventory=Class'DeusEx.AmmoGraySpit',Count=9999)
     WalkSound=Sound'DeusExSounds.Animal.GrayFootstep'
     GroundSpeed=350.000000
     WaterSpeed=50.000000
     AirSpeed=144.000000
     AccelRate=500.000000
     BaseEyeHeight=25.000000
     Health=30
     ReducedDamageType=Radiation
     ReducedDamagePct=1.000000
     UnderWaterTime=20.000000
     AttitudeToPlayer=ATTITUDE_Ignore
     HitSound1=Sound'DeusExSounds.Animal.GrayPainSmall'
     HitSound2=Sound'DeusExSounds.Animal.GrayPainLarge'
     Die=Sound'DeusExSounds.Animal.GrayDeath'
     Alliance=Gray
     DrawType=DT_Mesh
     Mesh=LodMesh'DeusExCharacters.Gray'
     CollisionRadius=28.540001
     CollisionHeight=36.000000
     Mass=120.000000
     Buoyancy=97.000000
     BindName="Grey"
     FamiliarName="Grey"
     UnfamiliarName="Grey"
}
