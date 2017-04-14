/*
    fn_loadOptions
    Author: Sinbane

    Description:
    Gives player starting gear based on whatever they choose
*/
private ["_option","_newUnit","_oldUnit","_crate","_weapons","_magazines","_items","_uniform","_vest","_helmet","_backpack","_glasses"];
//-----------------------------------
_crate = _this select 0;
//-----------------------------------
[] call WLD_fnc_loadout;
//-----------------------------------
if (player isKindof "B_Soldier_SL_F") then {
	_weapons = [["arifle_AKM_F",1],["hgun_P07_F",1]];
	_magazines = [["30Rnd_762x39_Mag_F",3],["16Rnd_9x21_Mag",2]];
	_items = [
		["Binocular",1],
		["ItemGPS",1],
		["FirstAidKit",3],
		["V_BandollierB_cbr",1],
		["ItemRadio",1]
	];
	_crate addBackPackCargoGlobal ["B_AssaultPack_rgr",1];
};
//-----------------------------------
if (player isKindof "B_Soldier_GL_F") then {
	_weapons = [["arifle_CTAR_GL_blk_F",1],["hgun_P07_F",1]];
	_magazines = [["30Rnd_580x42_Mag_F",3],["1Rnd_Smoke_Grenade_shell",3],["16Rnd_9x21_Mag",2]];
	_items = [
		["Binocular",1],
		["ItemGPS",1],
		["FirstAidKit",3],
		["V_HarnessO_brn",1],
		["ItemRadio",1]
	];
	_crate addBackPackCargoGlobal ["B_AssaultPack_cbr",1];
};
//-----------------------------------
if (player isKindof "B_Soldier_M_F") then {
	_weapons = [["srifle_DMR_06_olive_F",1],["hgun_P07_F",1]];
	_magazines = [["20Rnd_762x51_Mag",2],["16Rnd_9x21_Mag",2]];
	_items = [
		["ItemGPS",1],
		["FirstAidKit",3],
		["V_TacChestrig_grn_F",1],
		["Rangefinder",1],
		["ItemRadio",1],
		["optic_KHS_old",1]
	];
};

//-----------------------------------
if (player isKindof "B_Medic_F") then {
	_weapons = [["SMG_05_F",1],["hgun_P07_F",1]];
	_magazines = [["30Rnd_9x21_Mag_SMG_02",3],["16Rnd_9x21_Mag",2]];
	_items = [
		["Binocular",1],
		["ItemGPS",1],
		["Medikit",1],
		["V_PlateCarrier1_blk",1],
		["ItemRadio",1]
	];
	_crate addBackPackCargoGlobal ["B_AssaultPack_mcamo",1];
};
//-----------------------------------
//-----------------------------------
//-----------------------------------
//-----------------------------------
//-----------------------------------
//-----------------------------------
//-----------------------------------
//-----------------------------------
//-----------------------------------
//-----------------------------------
//-----------------------------------
if ((count _weapons) > 0) then {
	{
		_crate addWeaponCargoGlobal [(_x select 0),(_x select 1)];
	} forEach _weapons;
};
if ((count _magazines) > 0) then {
	{
		_crate addMagazineCargoGlobal [(_x select 0),(_x select 1)];
	} forEach _magazines;
};
if ((count _items) > 0) then {
	{
		_crate addItemCargoGlobal [(_x select 0),(_x select 1)];
	} forEach _items;
};
//-----------------------------------
diag_log "-- SPAWN COMPLETE --";
//-----------------------------------