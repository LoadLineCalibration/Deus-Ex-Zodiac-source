// ----------------------------------------------------------------------
// TransferItemTrigger
//
// Transfers a custom item to the player.  The Touch function is not 
// implemented, so this needs to be triggered by name - either from
// another trigger or from ConEdit
// ----------------------------------------------------------------------

class TransferItemTrigger extends Trigger;

var() Class<Inventory> transferItem;

singular function Trigger(Actor Other, Pawn Instigator)
{
	local Inventory invItemTo;
	local DeusExPlayer player;

     local ConPlay con;
     local ConWindowActive cw;

	if (transferItem != None)
	{
		player = DeusExPlayer(GetPlayerPawn());

		if (player != None)
		{
			// Spawn the item
			invItemTo = Spawn(transferItem);

			// If this was a DataVaultImage, then the image needs to be 
			// properly added to the datavault
			if (invItemTo.IsA('DataVaultImage'))
			{
				invItemTo.GiveTo(player);
				player.AddImage(DataVaultImage(invItemTo));

                     //...THEN THIS (TO GET THE "RECEIVED" WINDOW AND THEN SHOW IT)
                     con = player.conPlay;
                     cw = con.conWinThird;
                     cw.ShowReceivedItem(invItemTo, 1);

			}
			else	
			{	
				// Give item to the player	
				invItemTo.GiveTo(player);
				player.UpdateBeltText(invItemTo);

                     //...THEN THIS (TO GET THE "RECEIVED" WINDOW AND THEN SHOW IT)
                     con = player.conPlay;
                     cw = con.conWinThird;
                     cw.ShowReceivedItem(invItemTo, 1);
			}

		}
	}



}

defaultproperties
{
     bTriggerOnceOnly=True
     CollisionRadius=0.000000
}
