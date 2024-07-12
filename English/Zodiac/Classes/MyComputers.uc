//=============================================================================
// MyComputers.
//=============================================================================
class MyComputers extends Computers;

var() string nodeAddress;

//
// Override the GetNodeName function so that if the nodeName
// value is filled in, it will use that for the "Welcome To..." text
// instead of what the ComputerNode would normally use
//
function String GetNodeName()
{
	if (nodeName != "") 
		return nodeName;
	else
		return nodeInfo[Int(ComputerNode)].nodeName;
}

// ----------------------------------------------------------------------
// GetNodeDesc()
// ----------------------------------------------------------------------
// Override the GetNodeDesc function so that if the titleString
// value is filled in, it will use that for the login description text
// instead of what the ComputerNode would normally use
//
function String GetNodeDesc()
{
	if (titleString != "") 
		return titleString;
	else
		return nodeInfo[Int(ComputerNode)].nodeDesc;
}

// ----------------------------------------------------------------------
// GetNodeAddress()
// ----------------------------------------------------------------------

function String GetNodeAddress()
{
	if (nodeAddress != "") 
		return nodeAddress;
	else
		return nodeInfo[Int(ComputerNode)].nodeAddress;
}


// ----------------------------------------------------------------------
// GetNodeTexture()
// ----------------------------------------------------------------------
// Override the GetNodeTexture function so that if the titleTexture
// value is filled in, it will use that for the login logo instead
// of what the ComputerNode would normally use
//
function Texture GetNodeTexture()
{
	if (titleTexture != None) 
		return titleTexture;
	else
		return nodeInfo[Int(ComputerNode)].nodeTexture;	
}

defaultproperties
{
}
