// NOTE: This is part of the Carone elevator mod, but has been renamed for
// inclusion in the main ZODIAC package to avoid confusion.
//=============================================================================
// CEDoorButton. A button that opens the Doors of a CaroneElevator
// Put the Tag of the CaroneElevator in Event!!
//=============================================================================
class Z_CEDoorButton extends Button1;


function Frob(Actor Frobber, Inventory frobWith)
{
	local Z_CaroneElevator CE;
	local Pawn P;
	
	P = Pawn(Frobber);

	Super.Frob(Frobber, frobWith);

	foreach AllActors(class 'Z_CaroneElevator', CE, Event)
			{
			CE.CEGetMoverInfo();
			CE.CECheckSlave();
			if ((!CE.bIsMoving) && (CE.bCESlaveClosed) && (CE.bCEDoorsClosed))
				{
					CE.bCESlaveClosed=false;
					CE.bCEDoorsClosed=false;
					CE.CETrigger();
					CE.CESlaveTrigger();
				}
			else if ((!CE.bIsMoving) && (CE.bCESlaveOpen) && (CE.bCEDoorsOpen))
				{
					CE.bCESlaveOpen=false;
					CE.bCEDoorsOpen=false;
					CE.CETrigger();
					CE.CESlaveTrigger();
				}

			}
}

defaultproperties
{
}
