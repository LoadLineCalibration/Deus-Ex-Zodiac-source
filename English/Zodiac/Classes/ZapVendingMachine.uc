//=============================================================================
// ZapVendingMachine.
//=============================================================================
class ZapVendingMachine extends ElectronicDevices;

#exec OBJ LOAD FILE=Ambient

#exec TEXTURE IMPORT NAME=DietZapVend FILE=Textures\DietZapVend.pcx GROUP=Skins

var localized String msgDispensed;
var localized String msgNoCredits;
var int numUses;
var localized String msgEmpty;

function Frob(actor Frobber, Inventory frobWith)
{
	local DeusExPlayer player;
	local Vector loc;
	local Pickup product;

	Super.Frob(Frobber, frobWith);
	
	player = DeusExPlayer(Frobber);

	if (player != None)
	{
		if (numUses <= 0)
		{
			player.ClientMessage(msgEmpty);
			return;
		}

		if (player.Credits >= 3)
		{
			PlaySound(sound'VendingCoin', SLOT_None);
			loc = Vector(Rotation) * CollisionRadius * 0.8;
			loc.Z -= CollisionHeight * 0.7; 
			loc += Location;

			product = Spawn(class'ZapSodacan', None,, loc);

			if (product != None)
			{
				PlaySound(sound'VendingCan', SLOT_None);

				product.Velocity = Vector(Rotation) * 100;
				product.bFixedRotationDir = True;
				product.RotationRate.Pitch = (32768 - Rand(65536)) * 4.0;
				product.RotationRate.Yaw = (32768 - Rand(65536)) * 4.0;
			}

			player.Credits -= 3;
			player.ClientMessage(msgDispensed);
			numUses--;
		}
		else
			player.ClientMessage(msgNoCredits);
	}
}

defaultproperties
{
     msgDispensed="3 credits deducted from your account"
     msgNoCredits="Costs 3 credits..."
     numUses=7
     msgEmpty="It's empty"
     bCanBeBase=True
     ItemName="Zap! Vending Machine"
     Mesh=LodMesh'DeusExDeco.VendingMachine'
     MultiSkins(0)=Texture'Zodiac.Skins.DietZapVend'
     SoundRadius=8
     SoundVolume=96
     AmbientSound=Sound'Ambient.Ambient.HumLow3'
     CollisionRadius=34.000000
     CollisionHeight=50.000000
     Mass=150.000000
     Buoyancy=100.000000
}
