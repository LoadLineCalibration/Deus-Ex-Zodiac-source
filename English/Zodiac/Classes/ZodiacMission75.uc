//=============================================
// ZodiacMission75
// Holloman Air Force Base
//=============================================
class ZodiacMission75 expands MissionScript;

event PostPostBeginPlay()
{
    Super.PostPostBeginPlay();

    FixForVoiceover();
}

// LLC: Changed for voiceover, so ScientistMale and ScientistFemale won't use same convos.
function FixForVoiceover()
{
    local ScriptedPawn sp;

    foreach AllActors(class'ScriptedPawn', sp)
    {
        if (sp.name == 'ScientistFemale0')
        {
            sp.BindName = "ScientistFemale";
            sp.ConBindEvents();
        }
    }
}


// Initialize stuff
function FirstFrame()
{
	Super.FirstFrame();
}

function Timer() {

	local ZodiacTroop reinf;
      local PhilipMead mead;
	local SecretService mead_guard;
      local Blue blue;
      local AmandaShaysFast amanda;
      local BiomatterSample sample;
      local Inventory anItem;
      local DeusExMover M;

      Super.Timer();

      if (localURL == "75_ZODIAC_NEWMEXICO_HOLLOMAN")
      {
          // After player enters the base, remove Blue from map to simulate
          // him getting in the van.
	    if (!flags.GetBool('m75_blue_already_gone') &&
               flags.GetBool('m75_blue_get_in_van'))
          {
              foreach AllActors(class'Blue', blue)
                  blue.Destroy();
              flags.SetBool('m75_blue_already_gone', True,, 76);
          }

          // If player agrees to let Amanda follow for the first part 
          // of the level, make her vulnerable to attack
  	    if (flags.GetBool('m75_amanda_following') &&
             !flags.GetBool('m75_amanda_already_vulnerable'))
	    {
	            // Make Amanda vulnerable to attack and set her health to 200%
	            foreach AllActors(class'AmandaShaysFast', amanda)
                  {
	                amanda.bInvincible = False;
                      amanda.Health = 200;
                      amanda.HealthArmLeft = 200;
                      amanda.HealthArmRight = 200;
                      amanda.HealthHead = 200;
                      amanda.HealthLegLeft = 200;
                      amanda.HealthLegRight = 200;
                      amanda.HealthTorso = 200;
                  }

			flags.SetBool('m75_amanda_already_vulnerable', True);
          }

          // If Amanda gets back to the van, remove her from the map to simulate
          // getting in the van.
          if (flags.GetBool('m75_remove_amanda') &&
             !flags.GetBool('m75_amanda_already_removed'))
          {
               // Remove Amanda
               foreach AllActors(class'AmandaShaysFast', amanda)
                   amanda.Destroy();

               flags.SetBool('m75_amanda_already_removed', True);
          }

          // If Amanda is killed, play an Infolink message
          if (flags.GetBool('AmandaShays_Dead') &&
             !flags.GetBool('m75_amanda_dead_dl_played'))
          {
              Player.StartDataLinkTransmission("dl_amanda_dead");
              flags.SetBool('m75_amanda_dead_dl_played', True);
          }

      }
      else 
      {
      if (localURL == "75_ZODIAC_NEWMEXICO_HBUNKER") 
  	    {
		
	        // Bring in reinforcements
	        if (!flags.GetBool('m75_reinf_in_world') &&
	           flags.GetBool('m75_implant_disabled'))
	        {
	            // Make bad guy reinforcements appear
	            foreach AllActors(class'ZodiacTroop', reinf, 'zodiac_reinf')
	                reinf.EnterWorld();

	            // Make President Mead vulnerable to attack
	            foreach AllActors(class'PhilipMead', mead)
	                mead.bInvincible = False;

	            // Make Mead's guard vulnerable to attack
	            foreach AllActors(class'SecretService', mead_guard, 'mead_guard')
	                mead_guard.bInvincible = False;

      	      flags.SetBool('m75_reinf_in_world', True,, 76);
	        }

              // If Mead is killed, fire off a DataLink message
              if (flags.GetBool('PhilipMead_Dead') &&
                 !flags.GetBool('m75_dead_mead_plyd'))
              {
                  Player.StartDataLinkTransmission("dl_amanda_mead_dead");
                  flags.SetBool('m75_dead_mead_plyd', True,, 76);
              }

              // If Mead makes it to the panic room, unlock the panic room door
              if (flags.GetBool('m75_mead_safe') &&
                 !flags.GetBool('m75_panic_door_unlocked'))
              {
                  foreach AllActors(class'DeusExMover', M, 'panic_room_door')
                      {
                          M.bLocked = False;
                          M.lockStrength = 0.0;
                      }
                  flags.SetBool('m75_panic_door_unlocked', True,, 76);
              }

	     }
      else 
      {
      if (localURL == "75_ZODIAC_NEWMEXICO_HLAB") 
  	    {
		
	        // Remove biosample from inventory to simulate giving it to the scientist
	        if (!flags.GetBool('m75_sample_removed') &&
	           flags.GetBool('m75_gave_sample'))
	        {
	            // Remove biosample from player's inventory...
			Player.RemoveInventoryType(class'BiomatterSample');

      	      flags.SetBool('m73_sample_removed', True,, 76);
	        }
	     }
       }


 }

}

defaultproperties
{
}
