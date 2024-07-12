//=============================================================================
// CESequenceTrigger. Base: SequenceTrigger. Modified By Carone.
// Also Triggers the other two 'SequenceMovers'
//=============================================================================
class Z_CESequenceTrigger expands Trigger;

// Triggers the CaroneElevator , MultiMover and ElevatorMover to go to a certain keyframe
// Defaults to being triggered (zero radius)
// Set a radius and bCollideActors to make it touchable

var() int SeqNum;
var bool CESDisabled;

function CESetSeq()
{
	local Mover M;

	if (Event != '')
		foreach AllActors(class'Mover', M, Event)
		{
			if (Z_CaroneElevator(M) !=None)
					Z_CaroneElevator(M).SetSeq(SeqNum);
			if (MultiMover(M) != None)
				MultiMover(M).SetSeq(SeqNum);
			else if (ElevatorMover(M) != None)
				ElevatorMover(M).SetSeq(SeqNum);
		}
}
function Trigger(Actor Other, Pawn Instigator)
{

	if (!CESDisabled)
		CESetSeq();	

	Super.Trigger(Other, Instigator);
}

function Touch(Actor Other)
{
	CESetSeq();
	Super.Touch(Other);
}

defaultproperties
{
     CollisionRadius=0.000000
     bCollideActors=False
}
