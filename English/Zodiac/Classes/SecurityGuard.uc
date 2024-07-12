//=============================================================================
// SecurityGuard
//=============================================================================
class SecurityGuard extends HumanMilitary;

defaultproperties
{
     CarcassType=Class'Zodiac.SecurityGuardCarcass'
     WalkingSpeed=0.296000
     bHateHacking=True
     bHateIndirectInjury=True
     bHateCarcass=True
     bHateDistress=True
     bReactFutz=True
     bReactLoudNoise=True
     bReactShot=True
     bReactCarcass=True
     bReactDistress=True
     InitialInventory(0)=(Inventory=Class'DeusEx.WeaponPistol')
     InitialInventory(1)=(Inventory=Class'DeusEx.Ammo10mm',Count=3)
     InitialInventory(2)=(Inventory=Class'DeusEx.WeaponBaton')
     walkAnimMult=0.750000
     GroundSpeed=200.000000
     Mesh=LodMesh'DeusExCharacters.GM_DressShirt'
     MultiSkins(0)=Texture'DeusExCharacters.Skins.CopTex0'
     MultiSkins(1)=Texture'DeusExItems.Skins.PinkMaskTex'
     MultiSkins(2)=Texture'DeusExCharacters.Skins.CopTex0'
     MultiSkins(3)=Texture'DeusExCharacters.Skins.CopTex2'
     MultiSkins(4)=Texture'DeusExCharacters.Skins.CopTex0'
     MultiSkins(5)=Texture'DeusExCharacters.Skins.CopTex1'
     MultiSkins(6)=Texture'DeusExCharacters.Skins.FramesTex2'
     MultiSkins(7)=Texture'DeusExCharacters.Skins.LensesTex2'
     CollisionRadius=20.000000
     CollisionHeight=47.500000
     BindName="SecurityGuard"
     BarkBindName="Cop"
     FamiliarName="Security Guard"
     UnfamiliarName="Security Guard"
}
