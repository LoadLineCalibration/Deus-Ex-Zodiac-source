//=============================================
// ZodiacMission76
// Egypt
//=============================================
class ZodiacMission76 expands MissionScript;

var int senDoorSwitchCnt;
var int senSwitch[4];

// Initialize stuff
function FirstFrame()
{
	Super.FirstFrame();

	senDoorSwitchCnt = 0;
      senSwitch[1] = 0;
      senSwitch[2] = 0;
      senSwitch[3] = 0;

	flags.SetBool('m76_z1_already_attackable', False);
}


function Timer() 
{
	local int count;
	local DeusExMover M;
	local Dispatcher D;
      local OrdersTrigger O;
	local ZodiacGrey2 grey;
      local Z1 Z;
	local HenryBerkner HB;

	Super.Timer();

	if (localURL == "76_ZODIAC_EGYPT_ENTRANCE")
	{
		if (flags.GetBool('m76_berkner_go_away') &&
                !flags.GetBool('m76_berkner_already_gone'))
		{
			// Remove Berkner from map
			foreach AllActors(class'HenryBerkner', HB)
				HB.Destroy();

			flags.SetBool('m76_berkner_already_gone', True);
		}

	}
	else
      if (localURL == "76_ZODIAC_EGYPT_EBASE")
      {
            if (!flags.GetBool('m76_sen_door_open'))
            {
                  // See if any of the "Sen door" flags have been set
                  if (flags.GetBool('m76_switch1'))
                  {
				CheckSwitches(1);
				flags.SetBool('m76_switch1', False);
                  }
			else
                  if (flags.GetBool('m76_switch2'))
                  {
				CheckSwitches(2);
				flags.SetBool('m76_switch2', False);
                  }
                  else
                  if (flags.GetBool('m76_switch3'))
                  {
				CheckSwitches(3);
				flags.SetBool('m76_switch3', False);
                  }

            }

		if (flags.GetBool('m76_z1_attack') &&
               !flags.GetBool('m76_z1_already_attackable'))
		{
	            // Make Z-1 vulnerable to attack
	            foreach AllActors(class'Z1', Z)
	                Z.bInvincible = False;

			flags.SetBool('m76_z1_already_attackable', True);
		}

      }
      else
	if (localURL == "76_ZODIAC_EGYPT_REACTOR")
	{
		// Check for blown up power source (reactor)
            // and for the consoles being disabled (player chose "join Z-1" ending)
		if (!flags.GetBool('m76_reactor_blown') && 
                !flags.GetBool('m76_reactor_consoles_disabled'))
		{
			count = 0;
			foreach AllActors(class'DeusExMover', M, 'containment_pod')
				if (!M.bDestroyed)
					count++;

			if (count == 0)
			{
				// Trigger two minute countdown
				foreach AllActors(class'Dispatcher', D, 'countdown_dispatcher')
					D.Trigger(None, Player);

				//Player.StartDataLinkTransmission("dl_2min_countdown");
				flags.SetBool('m76_reactor_blown', True);
			}
			else
                  {
				// One console has been destroyed, so bring in the first wave of Greys
                        if ((count == 2) && (!flags.GetBool('m76_reinf_wave1')))
                        {
					// Open the door
					foreach AllActors(class'DeusExMover', M, 'first_wave_door')
						M.Trigger(None, None);

					// Order them to move out
					foreach AllActors(class'OrdersTrigger', O, 'first_wave')
						O.Trigger(None, None);

					flags.SetBool('m76_reinf_wave1', True);
                        }
				else

				{
					if ((count == 1) && (!flags.GetBool('m76_reinf_wave2')))
					{
					   // Open the door
					   foreach AllActors(class'DeusExMover', M, 'second_wave_door')
					   	   M.Trigger(None, None);

					   // Order them to move out
					   foreach AllActors(class'OrdersTrigger', O, 'second_wave')
						   O.Trigger(None, None);

					   flags.SetBool('m76_reinf_wave2', True);
					}
	
				}
			}
		}

		if (flags.GetBool('m76_kill_player'))
		{
			Player.Health = 0;
			Player.HealthTorso = 0;
			Player.TakeDamage(1, Player, Player.Location, vect(0,0,0), 'Shot');
		}

		// randomly play explosions and shake the view
		// if the reactor has been blown - make it more intense if
		// we're past the one minute mark
		if (flags.GetBool('m76_stage_two_explosion'))
		{
			ReactorExplosionEffects(True);
		}
		else
		{
			if (flags.GetBool('m76_reactor_blown'))
				ReactorExplosionEffects(False);
		}

	}


}


// Called by Timer when checking the "three switches to open round Sen door" flags
function CheckSwitches(int flagNum)
{
	local DeusExMover M;
	local SequenceTrigger S;

	senDoorSwitchCnt++;

      // Save order that switch was hit
      senSwitch[senDoorSwitchCnt] = flagNum;

      // If all three switches have been hit, time to check for correct combination
      // (the correct combo is 3-1-2)
	if (SenDoorSwitchCnt == 3)
      {
            if ((senSwitch[1] == 3) &&
                (senSwitch[2] == 1) &&
                (senSwitch[3] == 2))
            {
                  // Player got the correct combo, open round door and set flag that we're done
			foreach AllActors(class'DeusExMover', M, 'round_sen_door')
				M.Trigger(None, None);

			flags.SetBool('m76_sen_door_open', True);
            }
            else
            {
                  // Wrong combo, reset counter and all three brush positions
                  senDoorSwitchCnt = 0;

			foreach AllActors(class'SequenceTrigger', S, 'move_sen_switch1_up')
				S.Trigger(None, Player);
			foreach AllActors(class'SequenceTrigger', S, 'move_sen_switch2_up')
				S.Trigger(None, Player);
			foreach AllActors(class'SequenceTrigger', S, 'move_sen_switch3_up')
				S.Trigger(None, Player);
            }            
      }

}


function ReactorExplosionEffects(bool bFragments)
{
	local float shakeTime, shakeRoll, shakeVert;
	local float size, explosionFreq;
	local int i;
	local Vector bobble, loc, endloc, HitLocation, HitNormal;
	local Actor HitActor;
	local HangingDecoration deco;
	local Cart cart;
	local MetalFragment frag;

	if (bFragments)
		explosionFreq = 0.33;
	else
		explosionFreq = 0.1;

	if (FRand() < explosionFreq)
	{
		// pick a random explosion size and modify everything accordingly
		size = FRand();
		shakeTime = 0.5 + size;
		shakeRoll = 512.0 + 1024.0 * size;
		shakeVert = 8.0 + 16.0 * size;

		// play a sound
		if (size < 0.2)
			Player.PlaySound(Sound'SmallExplosion1', SLOT_None, 2.0,, 16384);
		else if (size < 0.4)
			Player.PlaySound(Sound'MediumExplosion1', SLOT_None, 2.0,, 16384);
		else if (size < 0.6)
			Player.PlaySound(Sound'MediumExplosion2', SLOT_None, 2.0,, 16384);
		else if (size < 0.8)
			Player.PlaySound(Sound'LargeExplosion1', SLOT_None, 2.0,, 16384);
		else
			Player.PlaySound(Sound'LargeExplosion2', SLOT_None, 2.0,, 16384);

		// shake the view
		Player.ShakeView(shakeTime, shakeRoll, shakeVert);

		// bobble the player around
		bobble = vect(300.0,300.0,200.0) + 500.0 * size * VRand();
		Player.Velocity += bobble;

		// have random metal fragments fall from the ceiling
		if (bFragments)
		{
			for (i=0; i<Int(size*20.0); i++)
			{
				loc = Player.Location + 256.0 * VRand();
				loc.Z = Player.Location.Z;
				endloc = loc;
				endloc.Z += 1024.0;
				HitActor = Trace(HitLocation, HitNormal, endloc, loc, False);
				if (HitActor == None)
					HitLocation = endloc;
				frag = Spawn(class'MetalFragment',,, HitLocation);
				if (frag != None)
				{
					frag.CalcVelocity(vect(20000,0,0),256);
					frag.DrawScale = 0.5 + 2.0 * FRand();
					if (FRand() < 0.25)
						frag.bSmoking = True;
				}

				// spawn some explosion effects
				if (size < 0.5)
					//Spawn(class'ExplosionMedium',,, HitLocation+8*HitNormal);
					Spawn(class'ExplosionMedium',,, HitLocation);
				else
					//Spawn(class'ExplosionLarge',,, HitLocation+8*HitNormal);
					Spawn(class'ExplosionLarge',,, HitLocation);
			}
		}
	}

	// make sure the player's zone has an alarm ambient sound
	if (Player.HeadRegion.Zone != None)
	{
		Player.HeadRegion.Zone.AmbientSound = sound'Klaxon4';
		Player.HeadRegion.Zone.SoundRadius = 255;
		Player.HeadRegion.Zone.SoundVolume = 180;
	}
}

defaultproperties
{
}
