//=============================================================================
// ZapSodaCan - a can of Diet Zap! cola.  Heals 3 points instead of the measly
// 2 points that Nuke! heals.
//=============================================================================
class ZapSodaCan extends Sodacan;

//
// Import the Zap! soda can icons
//
#exec TEXTURE IMPORT NAME=BeltIconZapSodaCan FILE=Textures\BeltIconZapSodaCan.pcx GROUP=Icons
#exec TEXTURE IMPORT NAME=LargeIconZapSodaCan FILE=Textures\LargeIconZapSodaCan.pcx GROUP=Icons

state Activated
{
	function Activate()
	{
		// can't turn it off
	}

	function BeginState()
	{
		local DeusExPlayer player;
		
		Super(Sodacan).BeginState();

		player = DeusExPlayer(Owner);
		if (player != None)
			player.HealPlayer(3, False);

		PlaySound(sound'MaleBurp');
		UseOnce();
	}
Begin:
}

defaultproperties
{
     ItemName="Zap! Soda"
     Icon=Texture'Zodiac.Icons.BeltIconZapSodaCan'
     largeIcon=Texture'Zodiac.Icons.LargeIconZapSodaCan'
     Description="A can of Zap! soda.  The label reads: '50% more effective than Nuke!'"
     beltDescription="ZAP SODA"
     MultiSkins(0)=Texture'DeusExItems.Skins.SodacanTex2'
}
