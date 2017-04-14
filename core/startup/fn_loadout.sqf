/*
	Wildlands Loadout Script
	By Sinbane
	Handles player loadout at game start
*/
//-----------------------------------
//-REMOVE PLAYER DEFAULT GEAR

removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

//-----------------------------------
//-ASSIGN CORRECT LOADOUT

//SQUAD LEADER
if (player isKindof "B_Soldier_SL_F") then {
	player forceAddUniform "U_I_C_Soldier_Bandit_3_F";
	player addHeadgear "H_Cap_tan";

};

//GRENADIER
if (player isKindof "B_Soldier_GL_F") then {
	player forceAddUniform "U_I_C_Soldier_Bandit_2_F";
	player addHeadgear "H_Bandanna_khk";
};

//MARKSMAN
if (player isKindof "B_Soldier_M_F") then {
	player forceAddUniform "U_I_C_Soldier_Bandit_5_F";
	player addHeadgear "H_Booniehat_khk";
};

//MEDIC
if (player isKindof "B_Medic_F") then {
	player forceAddUniform "U_BG_Guerilla2_1";
	player addHeadgear "H_Cap_blk";
};

player linkItem "itemMap";
player linkItem "itemWatch";
player linkItem "itemCompass";

//-----------------------------------