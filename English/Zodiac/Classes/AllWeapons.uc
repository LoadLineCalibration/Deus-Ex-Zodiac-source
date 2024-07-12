class AllWeapons expands Object
	abstract;

//
// C4
//

#exec TEXTURE IMPORT NAME=LED_1 FILE=Textures\LED_1.pcx GROUP=Weapons
#exec TEXTURE IMPORT NAME=LED_2 FILE=Textures\LED_2.pcx GROUP=Weapons
#exec TEXTURE IMPORT NAME=LED_3 FILE=Textures\LED_3.pcx GROUP=Weapons
#exec TEXTURE IMPORT NAME=LED_4 FILE=Textures\LED_4.pcx GROUP=Weapons
#exec TEXTURE IMPORT NAME=LED_5 FILE=Textures\LED_5.pcx GROUP=Weapons
#exec TEXTURE IMPORT NAME=LED_off FILE=Textures\LED_off.pcx GROUP=Weapons
#exec TEXTURE IMPORT NAME=C4_brick FILE=Textures\C4_brick.pcx GROUP=Weapons
#exec TEXTURE IMPORT NAME=C4_wires FILE=Textures\C4_wires.pcx GROUP=Weapons

#exec MESH IMPORT MESH=C4 ANIVFILE=MODELS\C4_a.3d DATAFILE=MODELS\C4_d.3d
#exec MESH ORIGIN MESH=C4 X=0 Y=0 Z=0 YAW=-64

#exec MESH SEQUENCE MESH=C4 SEQ=All STARTFRAME=0 NUMFRAMES=74
#exec MESH SEQUENCE MESH=C4 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=C4 SEQ=Select STARTFRAME=1 NUMFRAMES=12	RATE=10 	GROUP=Select
#exec MESH SEQUENCE MESH=C4 SEQ=Attack		STARTFRAME=13	NUMFRAMES=10	RATE=10
#exec MESH SEQUENCE MESH=C4 SEQ=Attack2		STARTFRAME=13	NUMFRAMES=10	RATE=10
#exec MESH SEQUENCE MESH=C4 SEQ=Attack3		STARTFRAME=13	NUMFRAMES=10	RATE=10
#exec MESH SEQUENCE MESH=C4 SEQ=Down		STARTFRAME=23	NUMFRAMES=9		RATE=10
#exec MESH SEQUENCE MESH=C4 SEQ=PlaceBegin	STARTFRAME=32	NUMFRAMES=6		RATE=14
#exec MESH SEQUENCE MESH=C4 SEQ=PlaceEnd		STARTFRAME=38	NUMFRAMES=6		RATE=14
#exec MESH SEQUENCE MESH=C4 SEQ=Place		STARTFRAME=44	NUMFRAMES=6		RATE=7
#exec MESH SEQUENCE MESH=C4 SEQ=Idle1		STARTFRAME=50	NUMFRAMES=8		RATE=2
#exec MESH SEQUENCE MESH=C4 SEQ=Idle2		STARTFRAME=58	NUMFRAMES=8		RATE=2
#exec MESH SEQUENCE MESH=C4 SEQ=Idle3		STARTFRAME=66	NUMFRAMES=8		RATE=3

#exec MESH NOTIFY MESH=C4 SEQ=Attack		TIME=0.7	FUNCTION=HandToHandAttack
#exec MESH NOTIFY MESH=C4 SEQ=Attack2		TIME=0.7	FUNCTION=HandToHandAttack
#exec MESH NOTIFY MESH=C4 SEQ=Attack3		TIME=0.7	FUNCTION=HandToHandAttack
#exec MESH NOTIFY MESH=C4 SEQ=Place			TIME=0.4	FUNCTION=PlaceGrenade

#exec MESHMAP NEW MESHMAP=C4 MESH=C4
#exec MESHMAP SCALE MESHMAP=C4 X=0.00390625 Y=0.00390625 Z=0.00390625

#exec MESHMAP SETTEXTURE MESHMAP=C4 NUM=0 TEXTURE=LED_5
#exec MESHMAP SETTEXTURE MESHMAP=C4 NUM=1 TEXTURE=C4_brick
#exec MESHMAP SETTEXTURE MESHMAP=C4 NUM=2 TEXTURE=LED_off
#exec MESHMAP SETTEXTURE MESHMAP=C4 NUM=3 TEXTURE=DeusExItems.WeaponHandsTex
#exec MESHMAP SETTEXTURE MESHMAP=C4 NUM=4 TEXTURE=DeusExItems.WeaponHandsTex
#exec MESHMAP SETTEXTURE MESHMAP=C4 NUM=5 TEXTURE=DeusExItems.GasGrenadeTex1
#exec MESHMAP SETTEXTURE MESHMAP=C4 NUM=6 TEXTURE=C4_brick
#exec MESHMAP SETTEXTURE MESHMAP=C4 NUM=7 TEXTURE=C4_wires


// 3rd person mesh
#exec MESH IMPORT MESH=C4_3rd ANIVFILE=MODELS\C4_3rd_a.3d DATAFILE=MODELS\C4_3rd_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=C4_3rd X=0 Y=0 Z=0 YAW=64
#exec MESH SEQUENCE MESH=C4_3rd SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=C4_3rd SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=C4_3rd SEQ=Open STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP NEW MESHMAP=C4_3rd MESH=C4_3rd
#exec MESHMAP SCALE MESHMAP=C4_3rd X=0.00390625 Y=0.00390625 Z=0.00390625
#exec MESHMAP SETTEXTURE MESHMAP=C4_3rd NUM=0 TEXTURE=LED_5
#exec MESHMAP SETTEXTURE MESHMAP=C4_3rd NUM=1 TEXTURE=C4_brick
#exec MESHMAP SETTEXTURE MESHMAP=C4_3rd NUM=2 TEXTURE=DeusExItems.GasGrenadeTex1
#exec MESHMAP SETTEXTURE MESHMAP=C4_3rd NUM=3 TEXTURE=C4_brick
#exec MESHMAP SETTEXTURE MESHMAP=C4_3rd NUM=4 TEXTURE=C4_wires


// pickup mesh
#exec MESH IMPORT MESH=C4_pickup ANIVFILE=MODELS\C4_3rd_a.3d DATAFILE=MODELS\C4_3rd_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=C4_pickup X=0 Y=0 Z=0 YAW=-64
#exec MESH SEQUENCE MESH=C4_pickup SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=C4_pickup SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=C4_pickup SEQ=Open STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP NEW MESHMAP=C4_pickup MESH=C4_pickup
#exec MESHMAP SCALE MESHMAP=C4_pickup X=0.00390625 Y=0.00390625 Z=0.00390625
#exec MESHMAP SETTEXTURE MESHMAP=C4_pickup NUM=0 TEXTURE=LED_off
#exec MESHMAP SETTEXTURE MESHMAP=C4_pickup NUM=1 TEXTURE=C4_brick
#exec MESHMAP SETTEXTURE MESHMAP=C4_pickup NUM=2 TEXTURE=DeusExItems.GasGrenadeTex1
#exec MESHMAP SETTEXTURE MESHMAP=C4_pickup NUM=3 TEXTURE=C4_brick
#exec MESHMAP SETTEXTURE MESHMAP=C4_pickup NUM=4 TEXTURE=C4_wires


#exec OBJ LOAD FILE=Zodiac_Misc

//
// JOSHUA rifle
//
// Textures
#exec TEXTURE IMPORT NAME=EnergyClip FILE=Textures\EnergyClip.pcx GROUP=Weapons
#exec TEXTURE IMPORT NAME=EClipTop FILE=Textures\EClipTop.pcx GROUP=Weapons
#exec TEXTURE IMPORT NAME=JoshuaTex FILE=Textures\joshuatex.pcx GROUP=Weapons

// player view version
#exec MESH IMPORT MESH=Joshua_1st ANIVFILE=Models\Joshua_1st_a.3d DATAFILE=Models\Joshua_1st_d.3d
#exec MESH ORIGIN MESH=Joshua_1st X=0 Y=0 Z=0 YAW=-64 ROLL=6
#exec MESHMAP SCALE MESHMAP=Joshua_1st X=0.00390625 Y=0.00390625 Z=0.00390625
#exec MESH SEQUENCE MESH=Joshua_1st SEQ=All		STARTFRAME=0	NUMFRAMES=1
#exec MESH SEQUENCE MESH=Joshua_1st SEQ=Still		STARTFRAME=0	NUMFRAMES=1
#exec MESH SEQUENCE MESH=Joshua_1st SEQ=Select		STARTFRAME=1	NUMFRAMES=2		RATE=3	GROUP=Select
#exec MESH SEQUENCE MESH=Joshua_1st SEQ=Shoot		STARTFRAME=3	NUMFRAMES=6		RATE=18
#exec MESH SEQUENCE MESH=Joshua_1st SEQ=ReloadBegin	STARTFRAME=9	NUMFRAMES=3		RATE=2
#exec MESH SEQUENCE MESH=Joshua_1st SEQ=Reload		STARTFRAME=12	NUMFRAMES=3		RATE=2
#exec MESH SEQUENCE MESH=Joshua_1st SEQ=ReloadEnd	STARTFRAME=15	NUMFRAMES=2		RATE=4
#exec MESH SEQUENCE MESH=Joshua_1st SEQ=Down		STARTFRAME=17	NUMFRAMES=2		RATE=2
#exec MESH SEQUENCE MESH=Joshua_1st SEQ=Idle1		STARTFRAME=19	NUMFRAMES=5		RATE=1
#exec MESH SEQUENCE MESH=Joshua_1st SEQ=Idle2		STARTFRAME=24	NUMFRAMES=5       RATE=1
#exec MESH SEQUENCE MESH=Joshua_1st SEQ=Idle3		STARTFRAME=29	NUMFRAMES=5       RATE=1

#exec MESHMAP SETTEXTURE MESHMAP=Joshua_1st NUM=0 TEXTURE=EnergyClip
#exec MESHMAP SETTEXTURE MESHMAP=Joshua_1st NUM=1 TEXTURE=Zodiac_Misc.eclip_led_00
#exec MESHMAP SETTEXTURE MESHMAP=Joshua_1st NUM=2 TEXTURE=JoshuaTex

// 3rd person version (pitch it up in case NPC's use it)
#exec MESH IMPORT MESH=Joshua_3rd ANIVFILE=MODELS\Joshua_3rd_a.3d DATAFILE=MODELS\Joshua_3rd_d.3d 
#exec MESH ORIGIN MESH=Joshua_3rd X=250 Y=0 Z=0 PITCH=24
#exec MESH SEQUENCE MESH=Joshua_3rd SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=Joshua_3rd SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP SCALE MESHMAP=Joshua_3rd X=0.00390625 Y=0.00390625 Z=0.00390625
#exec MESHMAP SETTEXTURE MESHMAP=Joshua_3rd NUM=0 TEXTURE=EnergyClip
#exec MESHMAP SETTEXTURE MESHMAP=Joshua_3rd NUM=1 TEXTURE=Zodiac_Misc.eclip_led_00
#exec MESHMAP SETTEXTURE MESHMAP=Joshua_3rd NUM=2 TEXTURE=JoshuaTex

// Pickup version (put gun on its side)
#exec MESH IMPORT MESH=Joshua_pickup ANIVFILE=MODELS\Joshua_pickup_a.3d DATAFILE=MODELS\Joshua_pickup_d.3d 
#exec MESH ORIGIN MESH=Joshua_pickup X=0 Y=0 Z=0 ROLL=-64
#exec MESH SEQUENCE MESH=Joshua_pickup SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=Joshua_pickup SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP SCALE MESHMAP=Joshua_pickup X=0.00390625 Y=0.00390625 Z=0.00390625
#exec MESHMAP SETTEXTURE MESHMAP=Joshua_pickup NUM=0 TEXTURE=EnergyClip
#exec MESHMAP SETTEXTURE MESHMAP=Joshua_pickup NUM=1 TEXTURE=Zodiac_Misc.eclip_led_00
#exec MESHMAP SETTEXTURE MESHMAP=Joshua_pickup NUM=2 TEXTURE=JoshuaTex

//
// JOSHUA rifle energy clip (ammo)
//
#exec MESH IMPORT MESH=eclip ANIVFILE=Models\eclip_a.3d DATAFILE=Models\eclip_d.3d
#exec MESHMAP SCALE MESHMAP=eclip X=0.00390625 Y=0.00390625 Z=0.00390625
#exec MESH SEQUENCE MESH=eclip SEQ=All		STARTFRAME=0	NUMFRAMES=1
#exec MESH SEQUENCE MESH=eclip SEQ=Still		STARTFRAME=0	NUMFRAMES=1
#exec MESHMAP SETTEXTURE MESHMAP=eclip NUM=0 TEXTURE=EnergyClip
#exec MESHMAP SETTEXTURE MESHMAP=eclip NUM=1 TEXTURE=EClipTop
#exec MESHMAP SETTEXTURE MESHMAP=eclip NUM=2 TEXTURE=Zodiac_Misc.eclip_led_00

//
// JOSHUA beam effect model
//
#exec MESH IMPORT MESH=JoshuaBeam ANIVFILE=Models\JoshuaBeam_a.3d DATAFILE=Models\JoshuaBeam_d.3d
#exec MESH ORIGIN MESH=JoshuaBeam X=0 Y=0 Z=0 YAW=-64
#exec MESHMAP SCALE MESHMAP=JoshuaBeam X=0.01 Y=1 Z=0.02
#exec MESH SEQUENCE MESH=JoshuaBeam SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=JoshuaBeam SEQ=Still STARTFRAME=0 NUMFRAMES=1

defaultproperties
{
}