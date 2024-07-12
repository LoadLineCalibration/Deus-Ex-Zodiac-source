//=============================================================================
// TackPC
//=============================================================================
class TackPC extends MyComputers;

defaultproperties
{
     terminalType=Class'Zodiac.MyNetworkTerminalPersonal'
     lockoutDelay=60.000000
     UserList(0)=(userName="USER",Password="USER")
     ItemName="Personal Computer Terminal"
     Mesh=LodMesh'Zodiac.TackPC'
     CollisionRadius=27.000000
     CollisionHeight=11.000000
     BindName="ComputerPersonal"
}
