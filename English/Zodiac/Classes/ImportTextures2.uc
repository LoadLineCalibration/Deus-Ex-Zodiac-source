class ImportTextures2 expands Object
	abstract;

//
// Building Interior Textures
//
#exec TEXTURE IMPORT NAME=boh_walltex1 FILE=Textures\boh_walltex1.pcx GROUP=Interior
#exec TEXTURE IMPORT NAME=boh_walltex2 FILE=Textures\boh_walltex2.pcx GROUP=Interior
#exec TEXTURE IMPORT NAME=CIA_rm_a FILE=Textures\CIA_rm_a.pcx GROUP=Interior
#exec TEXTURE IMPORT NAME=CIA_rm_b FILE=Textures\CIA_rm_b.pcx GROUP=Interior
#exec TEXTURE IMPORT NAME=CIA_rm_c FILE=Textures\CIA_rm_c.pcx GROUP=Interior
#exec TEXTURE IMPORT NAME=CIA_rm_d FILE=Textures\CIA_rm_d.pcx GROUP=Interior
#exec TEXTURE IMPORT NAME=CIA_rm_e FILE=Textures\CIA_rm_e.pcx GROUP=Interior
#exec TEXTURE IMPORT NAME=CIA_rm_f FILE=Textures\CIA_rm_f.pcx GROUP=Interior
#exec TEXTURE IMPORT NAME=CIA_rm_g FILE=Textures\CIA_rm_g.pcx GROUP=Interior
#exec TEXTURE IMPORT NAME=CIA_rm_h FILE=Textures\CIA_rm_h.pcx GROUP=Interior
#exec TEXTURE IMPORT NAME=CIA_seal FILE=Textures\CIA_seal.pcx GROUP=Interior FLAGS=2
#exec TEXTURE IMPORT NAME=CIA_lobbyA FILE=Textures\CIA_lobbyA.pcx GROUP=Interior 
#exec TEXTURE IMPORT NAME=PageBioMedHallwayWalls FILE=Textures\PageBioMedHallwayWalls.pcx GROUP=Interior
#exec TEXTURE IMPORT NAME=CubeCabinetPanel FILE=Textures\CubeCabinetPanel.pcx GROUP=Interior
#exec TEXTURE IMPORT NAME=CubeWall FILE=Textures\CubeWall.pcx GROUP=Interior
#exec TEXTURE IMPORT NAME=OfficeCarpet FILE=Textures\OfficeCarpet.pcx GROUP=Textile 
#exec TEXTURE IMPORT NAME=OfficeCarpet_B FILE=Textures\OfficeCarpet_B.pcx GROUP=Textile 
#exec TEXTURE IMPORT NAME=BeigeCarpetTex FILE=Textures\BeigeCarpetTex.pcx GROUP=Interior
#exec TEXTURE IMPORT NAME=FireExtSign FILE=Textures\FireExtSign.pcx GROUP=Interior
#exec TEXTURE IMPORT NAME=InCaseOfFire FILE=Textures\InCaseOfFire.pcx GROUP=Interior
#exec TEXTURE IMPORT NAME=Drawer_A FILE=Textures\Drawer_A.pcx GROUP=Interior

//
// Building Exterior Textures
//
#exec TEXTURE IMPORT NAME=CIA_old_hq_lower_window FILE=Textures\CIA_old_hq_lower_window.pcx GROUP=Exterior
#exec TEXTURE IMPORT NAME=CIA_old_hq_upper_windows FILE=Textures\CIA_old_hq_upper_windows.pcx GROUP=Exterior
#exec TEXTURE IMPORT NAME=NewHQ_bldgTex FILE=Textures\NewHQ_bldgTex.pcx GROUP=Exterior
#exec TEXTURE IMPORT NAME=CIA_new_hq_EntranceTex1 FILE=Textures\CIA_new_hq_EntranceTex1.pcx GROUP=Exterior
#exec TEXTURE IMPORT NAME=CIAHQ_tiled FILE=Textures\CIAHQ_tiled.pcx GROUP=Exterior
#exec TEXTURE IMPORT NAME=PageBioMedExterior FILE=Textures\PageBioMedExterior.pcx GROUP=Exterior

//
// Ladders
//
#exec TEXTURE IMPORT NAME=YellowLadder FILE=Textures\YellowLadder.pcx GROUP=Ladder

//
// Lens Flares
//
#exec TEXTURE IMPORT NAME=TackCorona_A FILE=Textures\TackCorona_A.pcx GROUP=Corona

//
// SkyBox Textures
//
#exec TEXTURE IMPORT NAME=SolidDarkBlueSky FILE=Textures\SolidDarkBlueSky.pcx GROUP=Sky

//
// DataVault Images
//

// CIA headquarters satellite photo
#exec TEXTURE IMPORT NAME=Image_CIA_HQ_1 FILE=Textures\Image_CIA_HQ_1.pcx GROUP=UserInterface MIPS=Off
#exec TEXTURE IMPORT NAME=Image_CIA_HQ_2 FILE=Textures\Image_CIA_HQ_2.pcx GROUP=UserInterface MIPS=Off
#exec TEXTURE IMPORT NAME=Image_CIA_HQ_3 FILE=Textures\Image_CIA_HQ_3.pcx GROUP=UserInterface MIPS=Off
#exec TEXTURE IMPORT NAME=Image_CIA_HQ_4 FILE=Textures\Image_CIA_HQ_4.pcx GROUP=UserInterface MIPS=Off

// Security cam footage of thug in Buenos Aires
#exec TEXTURE IMPORT NAME=Image_thug_photo_1 FILE=Textures\Image_thug_photo_1.pcx GROUP=UserInterface MIPS=Off
#exec TEXTURE IMPORT NAME=Image_thug_photo_2 FILE=Textures\Image_thug_photo_2.pcx GROUP=UserInterface MIPS=Off
#exec TEXTURE IMPORT NAME=Image_thug_photo_3 FILE=Textures\Image_thug_photo_3.pcx GROUP=UserInterface MIPS=Off
#exec TEXTURE IMPORT NAME=Image_thug_photo_4 FILE=Textures\Image_thug_photo_4.pcx GROUP=UserInterface MIPS=Off

// Page Biotech floor plan
#exec TEXTURE IMPORT NAME=Image_pb_1 FILE=Textures\Image_pb_1.pcx GROUP=UserInterface MIPS=Off
#exec TEXTURE IMPORT NAME=Image_pb_2 FILE=Textures\Image_pb_2.pcx GROUP=UserInterface MIPS=Off
#exec TEXTURE IMPORT NAME=Image_pb_3 FILE=Textures\Image_pb_3.pcx GROUP=UserInterface MIPS=Off
#exec TEXTURE IMPORT NAME=Image_pb_4 FILE=Textures\Image_pb_4.pcx GROUP=UserInterface MIPS=Off

// Z-1 File Folder (photos)
#exec TEXTURE IMPORT NAME=Image_z1_1 FILE=Textures\Image_z1_1.pcx GROUP=UserInterface MIPS=Off
#exec TEXTURE IMPORT NAME=Image_z1_2 FILE=Textures\Image_z1_2.pcx GROUP=UserInterface MIPS=Off
#exec TEXTURE IMPORT NAME=Image_z1_3 FILE=Textures\Image_z1_3.pcx GROUP=UserInterface MIPS=Off
#exec TEXTURE IMPORT NAME=Image_z1_4 FILE=Textures\Image_z1_4.pcx GROUP=UserInterface MIPS=Off

// Holloman Air Force Base satellite photo
#exec TEXTURE IMPORT NAME=Image_hafb_1 FILE=Textures\Image_hafb_1.pcx GROUP=UserInterface MIPS=Off
#exec TEXTURE IMPORT NAME=Image_hafb_2 FILE=Textures\Image_hafb_2.pcx GROUP=UserInterface MIPS=Off
#exec TEXTURE IMPORT NAME=Image_hafb_3 FILE=Textures\Image_hafb_3.pcx GROUP=UserInterface MIPS=Off
#exec TEXTURE IMPORT NAME=Image_hafb_4 FILE=Textures\Image_hafb_4.pcx GROUP=UserInterface MIPS=Off

// Code book for command bunker
#exec TEXTURE IMPORT NAME=Image_codebook_1 FILE=Textures\Image_codebook_1.pcx GROUP=UserInterface MIPS=Off
#exec TEXTURE IMPORT NAME=Image_codebook_2 FILE=Textures\Image_codebook_2.pcx GROUP=UserInterface MIPS=Off
#exec TEXTURE IMPORT NAME=Image_codebook_3 FILE=Textures\Image_codebook_3.pcx GROUP=UserInterface MIPS=Off
#exec TEXTURE IMPORT NAME=Image_codebook_4 FILE=Textures\Image_codebook_4.pcx GROUP=UserInterface MIPS=Off

// Scrap of paper (writing: RED, BLUE, YELLOW)
#exec TEXTURE IMPORT NAME=Image_scrap_1 FILE=Textures\Image_scrap_1.pcx GROUP=UserInterface MIPS=Off
#exec TEXTURE IMPORT NAME=Image_scrap_2 FILE=Textures\Image_scrap_2.pcx GROUP=UserInterface MIPS=Off
#exec TEXTURE IMPORT NAME=Image_scrap_3 FILE=Textures\Image_scrap_3.pcx GROUP=UserInterface MIPS=Off
#exec TEXTURE IMPORT NAME=Image_scrap_4 FILE=Textures\Image_scrap_4.pcx GROUP=UserInterface MIPS=Off

// Henry's photos of reactor consoles
#exec TEXTURE IMPORT NAME=Image_consoles_1 FILE=Textures\Image_consoles_1.pcx GROUP=UserInterface MIPS=Off
#exec TEXTURE IMPORT NAME=Image_consoles_2 FILE=Textures\Image_consoles_2.pcx GROUP=UserInterface MIPS=Off
#exec TEXTURE IMPORT NAME=Image_consoles_3 FILE=Textures\Image_consoles_3.pcx GROUP=UserInterface MIPS=Off
#exec TEXTURE IMPORT NAME=Image_consoles_4 FILE=Textures\Image_consoles_4.pcx GROUP=UserInterface MIPS=Off

// User Interface
#exec TEXTURE IMPORT NAME=ComputerLogonLogoCIA FILE=Textures\ComputerLogonLogoCIA.pcx GROUP=UserInterface FLAGS=2 MIPS=Off
#exec TEXTURE IMPORT NAME=ComputerLogonLogoHAFB FILE=Textures\ComputerLogonLogoHAFB.pcx GROUP=UserInterface FLAGS=2 MIPS=Off
#exec TEXTURE IMPORT NAME=ComputerLogonLogoPageBiotech FILE=Textures\ComputerLogonLogoPageBiotech.pcx GROUP=UserInterface FLAGS=2 MIPS=Off
#exec TEXTURE IMPORT NAME=ComputerLogonLogoSN FILE=Textures\ComputerLogonLogoSN.pcx GROUP=UserInterface FLAGS=2 MIPS=Off
#exec TEXTURE IMPORT NAME=ComputerLogonLogoZodiac FILE=Textures\ComputerLogonLogoZodiac.pcx GROUP=UserInterface FLAGS=2 MIPS=Off
#exec TEXTURE IMPORT NAME=MenuNewGamePaulDenton_1 FILE=Textures\MenuNewGamePaulDenton_1.pcx GROUP=UserInterface FLAGS=2 MIPS=Off
#exec TEXTURE IMPORT NAME=MenuNewGamePaulDenton_2 FILE=Textures\MenuNewGamePaulDenton_2.pcx GROUP=UserInterface FLAGS=2 MIPS=Off
#exec TEXTURE IMPORT NAME=MenuNewGamePaulDenton_3 FILE=Textures\MenuNewGamePaulDenton_3.pcx GROUP=UserInterface FLAGS=2 MIPS=Off
#exec TEXTURE IMPORT NAME=MenuNewGamePaulDenton_4 FILE=Textures\MenuNewGamePaulDenton_4.pcx GROUP=UserInterface FLAGS=2 MIPS=Off
#exec TEXTURE IMPORT NAME=MenuNewGamePaulDenton_5 FILE=Textures\MenuNewGamePaulDenton_5.pcx GROUP=UserInterface FLAGS=2 MIPS=Off
#exec TEXTURE IMPORT NAME=ZodiacCreditsBanner_1 FILE=Textures\ZodiacCreditsBanner_1.pcx GROUP=UserInterface FLAGS=2 MIPS=Off
#exec TEXTURE IMPORT NAME=ZodiacCreditsBanner_2 FILE=Textures\ZodiacCreditsBanner_2.pcx GROUP=UserInterface FLAGS=2 MIPS=Off

defaultproperties
{
}
