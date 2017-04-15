/*
    fn_loadOptions
    Author: Sinbane

    Description:
    Gives player starting gear based on whatever they choose
*/
private ["_option","_newUnit","_oldUnit","_crate","_weapons","_magazines","_items","_uniform","_vest","_helmet","_backpack","_glasses"];
//-----------------------------------
_option = _this select 0;
_newUnit = _this select 1;
_crate = _this select 2;
//-----------------------------------
//-SWITCH UNIT
_oldUnit = player;
addSwitchableUnit _newUnit;
setPlayable _newUnit;
selectPlayer _newUnit;
removeSwitchableUnit _oldUnit;
deleteVehicle _oldUnit;
removeUniform player;
removeVest player;
removeHeadgear player;
removeBackpack player;
removeAllWeapons player;
removeAllAssignedItems player;
removeGoggles player;
//-----------------------------------
if (_option isEqualTo 1) then {
	player setFace "WhiteHead_12";
	player setSpeaker "male01engb";
	player forceAddUniform "tacs_Uniform_Combat_RS_GS_TP_BB";
	player addHeadgear "tacs_Cap_Backwards_BlackLogo";
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
if (_option isEqualTo 2) then {
	player setFace "GreekHead_A3_03";
	player setSpeaker "male01gre";
	player forceAddUniform "tacs_Uniform_Combat_RS_CPS_BP_BB";
	player addHeadgear "tacs_Cap_Headphones_BlackLogo";
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
if (_option isEqualTo 3) then {
	player setFace "WhiteHead_20";
	player setSpeaker "male03eng";
	player forceAddUniform "tacs_Uniform_TShirt_JP_GS_LP_BB";
	player addHeadgear "H_Booniehat_khk";
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
if (_option isEqualTo 4) then {
	player setFace "PersianHead_A3_03";
	player setSpeaker "male04gre";
	player forceAddUniform "tacs_Uniform_TShirt_JP_BS_LP_BB";
	player addHeadgear "H_Cap_blk";
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
if (_option isEqualTo 5) then {
	player setFace "max_female1";
	player setSpeaker "male10eng";
	player forceAddUniform "EF_FEM_4A2_2";
	player addHeadgear "tacs_Cap_Backwards_BlackLogo";
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
if (_option isEqualTo 6) then {
	player setFace "max_female11";
	player setSpeaker "male01gre";
	player forceAddUniform "EF_FEM_4_4B";
	player addHeadgear "tacs_Cap_Headphones_BlackLogo";
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
if (_option isEqualTo 7) then {
	player setFace "max_female12";
	player setSpeaker "male03eng";
	player forceAddUniform "EF_FEM_4A";
	player addHeadgear "H_Booniehat_khk";
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
if (_option isEqualTo 8) then {
	player setFace "max_female7";
	player setSpeaker "male04gre";
	player forceAddUniform "EF_FEM_4A_EMS";
	player addHeadgear "H_Cap_blk";
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
player linkItem "itemMap";
player linkItem "itemWatch";
player linkItem "itemCompass";
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
diag_log "-- CLASS CHOSEN --";
spawnChosen = true;
closeDialog 0;
//-----------------------------------