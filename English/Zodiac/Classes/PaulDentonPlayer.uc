//=============================================================================
// PaulDentonPlayer.
//=============================================================================
class PaulDentonPlayer extends JCDentonMale;
//class PaulDentonPlayer extends MLPlayer;

// ----------------------------------------------------------------------
// TravelPostAccept()
// ----------------------------------------------------------------------

event TravelPostAccept()
{
    local DeusExLevelInfo info;

    local Skill aSkill;
    local int i;

    Super.TravelPostAccept();

/*
//	Super(JCDentonMale).TravelPostAccept();

       // --- pasted in stuff starts here

    if (!bModStarted){
        if(MLGameInfo(DXGame).bStartNewGame){
            Log("***** ML--Starting New Game");
            ResetPlayer();
            DeusExRootWindow(rootWindow).InvokeMenuScreen(Class'MLMenuScreen');
            DeusExRootWindow(rootWindow).InvokeMenuScreen(Class'MyMenuSelectDifficulty');
            bModStarted=True;
        }else if(MLGameInfo(DXGame).bStartMPGame){
            Log("***** ML--Starting MP Game");
            StartMPMod();
            bModStarted=True;
        }else if(MLGameInfo(DXGame).bStartIntro){
            Log("***** ML--Starting Intro");
            ResetPlayer();
            bStartNewGameAfterIntro=True;
            bModStarted=True;
        }else if(MLGameInfo(DXGame).bStartMap){
            Log("***** ML--Starting Map");
            ResetPlayer();
            bModStarted=True;
        }
    }

    // Cheap fix for Skill Level Problems.  I assume IS will fix this in the
    // next release and this can be removed then.

    aSkill = SkillSystem.FirstSkill;
    i=0;
    while(aSkill != None)
    {
        // Funky stuff to get rid of the Defalt Pistol Skill

        if ((aSkill.CurrentLevel<SkillLevel[i])||
            (aSkill.IsA('SkillWeaponPistol') &&
            (aSkill.CurrentLevel==1)&&
            (SkillPointsAvail==6575))){
                 aSkill.CurrentLevel=SkillLevel[i];
        }
        i++;
        aSkill = aSkill.next;
    }

    // --- pasted in stuff ends here
*/

	switch(PlayerSkin)
	{
		case 0:	MultiSkins[0] = Texture'PaulDentonTex0';
			MultiSkins[3] = Texture'PaulDentonTex0';
			break;
		case 1:	MultiSkins[0] = Texture'PaulDentonTex4';
			MultiSkins[3] = Texture'PaulDentonTex4';
			break;
		case 2:	MultiSkins[0] = Texture'PaulDentonTex5';
			MultiSkins[3] = Texture'PaulDentonTex5';
			break;
		case 3:	MultiSkins[0] = Texture'PaulDentonTex6';
			MultiSkins[3] = Texture'PaulDentonTex6';
			break;
		case 4:	MultiSkins[0] = Texture'PaulDentonTex7';
			MultiSkins[3] = Texture'PaulDentonTex7';
			break;
	}

}


//-----------------------------------------------------------
// ShowMainMenu()
//
// Overridden to allow custom text above the main menu
//-----------------------------------------------------------

exec function ShowMainMenu()
{
     local DeusExRootWindow root;
     local DeusExLevelInfo info;
     local MissionEndgame Script;

     if (bIgnoreNextShowMenu)
     {
          bIgnoreNextShowMenu = False;
          return;
     }

     info = GetLevelInfo();

     // Special case baby!
     // 
     // If the Intro map is loaded and we get here, that means the player
     // pressed Escape and we want to either A) start a new game 
     // or B) return to the dx.dx screen.  Either way we're going to 
     // abort the Intro by doing this. 
     //
     // If this is one of the Endgames (which have a mission # of 99)
     // then we also want to call the Endgame's "FinishCinematic" 
     // function

     // force the texture caches to flush
     ConsoleCommand("FLUSH");

     if ((info != None) && (info.MissionNumber == 98)) 
     {
          bIgnoreNextShowMenu = True;
          PostIntro();
     }
     else if ((info != None) && (info.MissionNumber == 99))
     {
          foreach AllActors(class'MissionEndgame', Script)
               break;

          if (Script != None)
               Script.FinishCinematic();
     }
     else
     {
          root = DeusExRootWindow(rootWindow);
          if (root != None){
             root.InvokeMenu(Class'Zodiac.ZodiacMenuMain');
          }
     }
}


// ----------------------------------------------------------------------
// Override ShowIntro() to play a custom intro map
// ----------------------------------------------------------------------
function ShowIntro(optional bool bStartNewGame)
{
	if (DeusExRootWindow(rootWindow) != None)
		DeusExRootWindow(rootWindow).ClearWindowStack();

	bStartNewGameAfterIntro = bStartNewGame;

	// Make sure all augmentations are OFF before going into the intro
	AugmentationSystem.DeactivateAll();

	// Reset the player
	Level.Game.SendPlayer(Self, "69_Zodiac_Intro");

}


// ----------------------------------------------------------------------
// This is overridden to point to MyGameHUD (to allow custom InfoLinks)
// ----------------------------------------------------------------------
function Possess() 
{ 
	local DeusExRootWindow root; 

	Super.Possess(); 

	root = DeusExRootWindow(rootWindow); 

	root.hud.Destroy(); 
	root.hud = DeusexHUD(root.NewChild(Class'MyGameHUD'));

	root.hud.UpdateSettings(Self); 
	root.hud.SetWindowAlignments(HALIGN_Full,VALIGN_Full, 0, 0); 
} 


// ----------------------------------------------------------------------
// StartDataLinkTransmission()
//
// Locates and starts the DataLink passed in
// This has been overridden in order to call the custom MyDataLinkPlay
// so that InfoLink's without recorded dialogue can be slowed down.
// ----------------------------------------------------------------------

function Bool StartDataLinkTransmission(
	String datalinkName, 
	Optional DataLinkTrigger datalinkTrigger)
{
	local Conversation activeDataLink;
	local bool bDataLinkPlaySpawned;

	// Don't allow DataLinks to start if we're in PlayersOnly mode
	if ( Level.bPlayersOnly )
		return False;

	activeDataLink = GetActiveDataLink(datalinkName);

	if ( activeDataLink != None )
	{
		// Search to see if there's an active DataLinkPlay object 
		// before creating one

		if ( dataLinkPlay == None )
		{
			datalinkPlay = Spawn(class'MyDataLinkPlay');
			bDataLinkPlaySpawned = True;
		}

		// Call SetConversation(), which returns 
		if (datalinkPlay.SetConversation(activeDataLink))
		{
			datalinkPlay.SetTrigger(datalinkTrigger);

			if (datalinkPlay.StartConversation(Self))
			{
				return True;
			}
			else
			{
				// Datalink must already be playing, or in queue
				if (bDataLinkPlaySpawned)
				{
					datalinkPlay.Destroy();
					datalinkPlay = None;
				}
				
				return False;
			}
		}
		else
		{
			// Datalink must already be playing, or in queue
			if (bDataLinkPlaySpawned)
			{
				datalinkPlay.Destroy();
				datalinkPlay = None;
			}
			return False;
		}
	}
	else
	{
		return False;
	}
}


// ----------------------------------------------------------------------
// ShowCredits()
// This is stuff for setting up custom end credits
// ----------------------------------------------------------------------

function ShowCredits(optional bool bLoadIntro)
{
	local DeusExRootWindow root;
	local MyCreditsWindow winCredits;

	root = DeusExRootWindow(rootWindow);

	if (root != None)
	{
		// Show the credits screen and force the game not to pause
		// if we're showing the credits after the endgame
		winCredits = MyCreditsWindow(root.InvokeMenuScreen(Class'MyCreditsWindow', bLoadIntro));
		winCredits.SetLoadIntro(bLoadIntro);
	}
}



// ----------------------------------------------------------------------
// ----------------------------------------------------------------------

defaultproperties
{
     TruePlayerName="Paul Denton"
     SkillPointsTotal=7000
     SkillPointsAvail=7000
     strStartMap="70_Zodiac_HongKong_TongBase"
     bStartNewGameAfterIntro=True
     CarcassType=Class'Zodiac.PaulDentonPlayerCarcass'
     MultiSkins(0)=Texture'DeusExCharacters.Skins.PaulDentonTex0'
     MultiSkins(1)=Texture'DeusExCharacters.Skins.PaulDentonTex2'
     MultiSkins(2)=Texture'DeusExCharacters.Skins.PantsTex8'
     MultiSkins(3)=Texture'DeusExCharacters.Skins.PaulDentonTex0'
     MultiSkins(4)=Texture'DeusExCharacters.Skins.PaulDentonTex1'
     MultiSkins(5)=Texture'DeusExCharacters.Skins.PaulDentonTex2'
     //BindName="PaulDenton"
     BindName="JCDenton"
     FamiliarName="Paul Denton"
     UnfamiliarName="Paul Denton"
}
