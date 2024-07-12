//=============================================================================
// Class: GiveItemTrigger
// Desc: Used to trasfer custom items during conversations.  Workaround to limitation.
// Notes: After usage a global flag set in FailedFlagName will be set, use this in ConEdit to jump as desired.
// @2001 Damocles and Ed Harris.
// Base Coding:  Damocles
// Additional Coding and testing Ed Harris
// final coding and optimisations:  Damocles
//=============================================================================

class GiveItemTrigger expands Trigger;

var() Class<Inventory> itemToGive;
var() int numToGive;
var() bool bTakeFrom;
var() string takeFromBindName;
var() name FailedFlagName;

function Trigger(Actor Other, Pawn Instigator)
{
     local DeusExPlayer dxp;
     local Inventory inv, copy, inv2;
     local ConPlay con;
     local ConWindowActive cw;
     local Pickup pb, pa;
     local int b, a;
     local bool bSuccess;
     local ScriptedPawn sp, luckysp;

     // CHECK PARAMS
     if((itemToGive == None) || (numToGive <= 0)) {
          log("WTF: User defined params are tweaked!");
          return;
     }

     // GET PAWN AND CHECK HIM
     dxp = DeusExPlayer(GetPlayerPawn());
     if(dxp == None) {
          log("WTF: Receiver is not there!");
          return;
     }

     // GET THE WINDOWS WE NEED
     con = dxp.conPlay;
     cw = con.conWinThird;
     if(cw == None) {
          log("WTF: Conversation window not found!");
          return;
     }

     // GIVE THE ITEM(S) IF WE CAN
     inv = Spawn(itemToGive);
     if (inv==none)
        {
        log("WTF - unable to spawn the damn inventory!!!");
        return;
        }
     inv.gotostate('Pickup');
     if(inv.IsA('Pickup'))
          {
          Pickup(inv).NumCopies = numToGive;
          }
     if (inv.isA('DeusexWeapon'))
        {
        // sort the special case weapons
        if (DeusExWeapon(inv).bHandToHand)
            {
            if (DeusExWeapon(inv).PickUpAmmoCount>0)  // grenades, shuriken, etc
                DeusExWeapon(inv).PickUpAmmoCount=numToGive;
            }
        }
     if (inv.IsA('ammo'))
        {
        // have to increase the ammo amount cos numCopies dont work in ammo
        Ammo(inv).ammoAmount*=numToGive;
        }
     else if (inv.IsA('Weapon'))
        numToGive=1; // you can only give them one of each sunshine!

     if (CanTakeItem(inv))
        {
        if (dxp.HandleItemPickup(inv, false))
            {
            inv.SpawnCopy(dxp);
            bSuccess=true;
            }
        }
     else
        {
        bSuccess=false;
        inv.destroy();
        }

     // DISPLAY RESULTS TO PLAYER
     if(bSuccess)
          {
          cw.ShowReceivedItem(inv, numToGive);
          numToGive=default.numToGive; // reset after each use
          }
     else
          dxp.flagBase.SetBool(FailedFlagName, True);

     // TAKE FROM NPC IF DESIRED
     if (bSuccess && bTakeFrom) {
          foreach AllActors(class'ScriptedPawn', sp)
                      if (sp.BindName == takeFromBindName)
                          luckysp = sp;
          if (luckysp == None) {
               log("WTF: Unable to find giving pawn");
               return;
          }
          inv2 = luckysp.FindInventoryType(itemToGive.Class);
          if(inv2 == None) {
               log("WTF: Giving pawn doesn't have item");
               return;
          }
          luckysp.DeleteInventory(inv2);
     }

        if (inv!=none) // any un-owned stuff must be removed
            {
            if (inv.owner==none)
                inv.destroy();
            }

     if(bTriggerOnceOnly)
          destroy();
}


function bool CanTakeItem(Inventory inv)
 {
 local deusExPlayer dxp;
 local inventory inv2;
 dxp=DeusExPlayer(GetPlayerPawn());
 if (dxp==none)
    {
    log("WTF - receiving player is not a player!!!");
    return false;
    }
 // check for space, stacking, ammo, etc
 if (inv.isA('Ammo'))
    {
    inv2=dxp.FindInventoryType(itemToGive);
    if (inv2!=none)
        {
        if (DeusExAmmo(inv2).ammoAmount<DeusExAmmo(inv2).MaxAmmo)
            return true; // can give ammo to player
        else
            return false;
       }
    else  // does not have any yet, so give him some
        return true;
    }
 // check if its a pickup and stackable
 else if (inv.isA('DeusExPickup'))
    {
    if (DeusExpickup(inv).bCanHaveMultipleCopies)
        {
        inv2=dxp.FindInventoryType(itemToGive);
        if (inv2!=none)
            {
            if (DeusExpickup(inv2).NumCopies>=DeusExpickup(inv2).MaxCopies)
                return false;
            else if ((DeusExpickup(inv2).MaxCopies-DeusExpickup(inv2).numCopies)<numToGive)
                {
                // set to right number to give
                numToGive=DeusExpickup(inv2).MaxCopies-DeusExpickup(inv2).numCopies;
                return true;
                }
            else
                return true; // plenty of spare copies
            }
        else
            return dxp.HandleItemPickup(inv, True);
        }
    else
        {
        // not stackable, so search for space for another
        return dxp.HandleItemPickup(inv, True);
        }
    }
 // check if its a weapon
 else if (inv.isA('DeusExWeapon'))
    {
    return true; //dxp.HandleItemPickup(inv, True);
    }
 return false;
 }

defaultproperties
{
     bCollideActors=False
}
