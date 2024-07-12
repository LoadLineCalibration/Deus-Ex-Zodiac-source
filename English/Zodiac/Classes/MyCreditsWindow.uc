//=============================================================================
// MyCreditsWindow
//=============================================================================
class MyCreditsWindow extends CreditsWindow;

var string textPackage;
var Texture EndCreditsLogo[6];

// ----------------------------------------------------------------------
// ProcessText()
// ----------------------------------------------------------------------

function ProcessText()
{
	local DeusExTextParser parser;

	PrintPicture(CreditsBannerTextures, 2, 1, 505, 128);
	PrintLn();

	// First check to see if we have a name
	if (textName != '')
	{
		// Create the text parser
		parser = new(None) Class'DeusExTextParser';

		// Attempt to find the text object
		if (parser.OpenText(textName,textPackage))
		{
			while(parser.ProcessText())
				ProcessTextTag(parser);

			parser.CloseText();
		}

		CriticalDelete(parser);
	}

	ProcessFinished();
}


// ----------------------------------------------------------------------
// ProcessFinished()
// Overridden to display the TACKWARE logo instead of the Ion Storm 
// developer's photo
// ----------------------------------------------------------------------

function ProcessFinished()
{
	PrintLn();
	PrintPicture(EndCreditsLogo, 1, 1, 256, 64);
}

defaultproperties
{
     TextPackage="Zodiac"
     EndCreditsLogo(0)=Texture'Zodiac.Misc.TackwareLogo'
     CreditsBannerTextures(0)=Texture'Zodiac.UserInterface.ZodiacCreditsBanner_1'
     CreditsBannerTextures(1)=Texture'Zodiac.UserInterface.ZodiacCreditsBanner_2'
     ScrollMusicString="Zodiac_Credits.Zodiac_Credits"
     textName=ZodiacCredits
}
