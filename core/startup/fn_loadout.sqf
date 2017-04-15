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
	player forceAddUniform "";
	player addHeadgear "";

};

//GRENADIER
if (player isKindof "B_Soldier_GL_F") then {
	player forceAddUniform "";
	player addHeadgear "";
};

//MARKSMAN
if (player isKindof "B_Soldier_M_F") then {
	player forceAddUniform "";
	player addHeadgear "";
};

//MEDIC
if (player isKindof "B_Medic_F") then {
	player forceAddUniform "";
	player addHeadgear "";
};

player linkItem "itemMap";
player linkItem "itemWatch";
player linkItem "itemCompass";

//-----------------------------------