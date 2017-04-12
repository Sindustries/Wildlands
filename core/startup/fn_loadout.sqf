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
	for "_i" from 1 to 3 do {player addItemToUniform "FirstAidKit";};
	player addVest "V_BandollierB_cbr";
	for "_i" from 1 to 2 do {player addItemToVest "16Rnd_9x21_Mag";};
	for "_i" from 1 to 3 do {player addItemToVest "30Rnd_762x39_Mag_F";};
	player addBackpack "B_AssaultPack_rgr";
	player addHeadgear "H_Cap_tan";

	comment "Add weapons";
	player addWeapon "arifle_AKM_F";
	player addWeapon "hgun_P07_F";
	player addWeapon "Binocular";

	comment "Add items";
	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "ItemWatch";
	player linkItem "ItemRadio";
	player linkItem "ItemGPS";
};

//GRENADIER
if (player isKindof "B_Soldier_GL_F") then {
	player forceAddUniform "U_I_C_Soldier_Bandit_2_F";
	for "_i" from 1 to 3 do {player addItemToUniform "FirstAidKit";};
	player addVest "V_HarnessO_brn";
	for "_i" from 1 to 2 do {player addItemToVest "16Rnd_9x21_Mag";};
	for "_i" from 1 to 3 do {player addItemToVest "30Rnd_580x42_Mag_F";};
	for "_i" from 1 to 3 do {player addItemToVest "1Rnd_Smoke_Grenade_shell";};
	player addBackpack "B_AssaultPack_cbr";
	player addHeadgear "H_Bandanna_khk";

	player addWeapon "arifle_CTAR_GL_blk_F";
	player addWeapon "hgun_P07_F";
	player addWeapon "Binocular";

	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "ItemWatch";
	player linkItem "ItemRadio";
	player linkItem "ItemGPS";
};

//MARKSMAN
if (player isKindof "B_Soldier_M_F") then {
	comment "Add containers";
	player forceAddUniform "U_I_C_Soldier_Bandit_5_F";
	for "_i" from 1 to 3 do {player addItemToUniform "FirstAidKit";};
	player addVest "V_TacChestrig_grn_F";
	for "_i" from 1 to 2 do {player addItemToVest "16Rnd_9x21_Mag";};
	for "_i" from 1 to 3 do {player addItemToVest "1Rnd_Smoke_Grenade_shell";};
	for "_i" from 1 to 3 do {player addItemToVest "20Rnd_762x51_Mag";};
	player addHeadgear "H_Booniehat_khk";

	player addWeapon "srifle_DMR_06_olive_F";
	player addPrimaryWeaponItem "optic_KHS_old";
	player addWeapon "hgun_P07_F";
	player addWeapon "Binocular";

	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "ItemWatch";
	player linkItem "ItemRadio";
	player linkItem "ItemGPS";
};

//MEDIC
if (player isKindof "B_Medic_F") then {
	player forceAddUniform "U_BG_Guerilla2_1";
	for "_i" from 1 to 3 do {player addItemToUniform "SmokeShellGreen";};
	player addBackpack "B_AssaultPack_mcamo";
	player addItemToBackpack "Medikit";
	for "_i" from 1 to 3 do {player addItemToBackpack "30Rnd_9x21_Mag_SMG_02";};
	for "_i" from 1 to 2 do {player addItemToBackpack "16Rnd_9x21_Mag";};
	player addHeadgear "H_Cap_blk";

	player addWeapon "SMG_05_F";
	player addWeapon "hgun_P07_F";
	player addWeapon "Binocular";

	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "ItemWatch";
	player linkItem "ItemRadio";
	player linkItem "ItemGPS";
};

//-----------------------------------