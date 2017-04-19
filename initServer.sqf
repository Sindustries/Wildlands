/*
	A3DRPG
	Arma 3 Dynamic Role Playing Game
	Author: Sinbane
*/
//-----------------------------------
WLD_version = "0.0.1-alpha";
publicVariable "WLD_version";
WLD_serverReady = false;
publicVariable "WLD_serverReady";
//-----------------------------------
diag_log "----------------------------------------------------------------------------------------------------";
diag_log "-------------------------------------- WILDLANDS SERVER INIT ---------------------------------------";
diag_log "----------------------------------------------------------------------------------------------------";
//-----------------------------------
//-GET SETTINGS
["WLD"] call WLD_fnc_getSettings;
DebugMode = ["WLDdebugMode"] call WLD_fnc_getSetting;
if (DebugMode isEqualTo 1) then {
	DebugMode = true;
	publicVariable "DebugMode";
};
//-----------------------------------
setDate [2023, 8, 11, 7, 0];
setTimeMultiplier 0;
//-----------------------------------
//-FIND LOCATIONS
diag_log "-- FINDING LOCATIONS --";
WLD_cities = [];
WLD_villages = [];
WLD_local = [];
{
	if (type _x isEqualTo "NameCityCapital" || type _x isEqualTo "NameCity") then {
		WLD_cities pushBack [(text _x),(locationPosition _x),(size _x)];
	};
	if (type _x isEqualTo "NameVillage") then {
		WLD_villages pushBack [(text _x),(locationPosition _x),(size _x)];
	};
	if (type _x isEqualTo "NameLocal") then {
		WLD_local pushBack [(text _x),(locationPosition _x),(size _x)];
	};
} forEach nearestLocations [[0,0,0], ["NameCity","NameCityCapital","NameLocal","NameMarine","NameVillage"], 100000];
publicVariable "WLD_cities";
publicVariable "WLD_villages";
publicVariable "WLD_local";
diag_log "-- COMPLETE --";
//-----------------------------------
//-SET VEHICLES
WLD_civVehicles = ["WLD_civVehicles"] call WLD_fnc_getSetting;
WLD_parkVehicles = ["WLD_parkVehicles"] call WLD_fnc_getSetting;
//-----------------------------------
//-SET BUILDING TIERS
diag_log "-- SETTING BUILDING TIERS --";
WLD_tier1Housing = ["Land_i_House_Small_03_V1_F","Land_i_House_Small_02_V3_F","Land_i_House_Small_02_V1_F","Land_i_House_Small_02_V2_F","Land_i_House_Small_01_V3_F","Land_i_House_Small_01_V1_F","Land_i_House_Small_01_V2_F"];
publicVariable "WLD_tier1Housing";
WLD_tier2Housing = ["Land_i_House_Big_02_V3_F","Land_i_House_Big_02_V1_F","Land_i_House_Big_02_V2_F"];
publicVariable "WLD_tier2Housing";
WLD_tier3Housing = ["Land_i_House_Big_01_V3_F","Land_i_House_Big_01_V1_F","Land_i_House_Big_01_V2_F"];
publicVariable "WLD_tier3Housing";
WLD_militaryHousing = ["Land_i_Barracks_V1_F","Land_i_Barracks_V2_F","Land_u_Barracks_V2_F"];
publicVariable "WLD_militaryHousing";
WLD_CPDbuildings = ["Land_Offices_01_V1_F"];
publicVariable "WLD_CPDbuildings";
WLD_shopBuildings = ["Land_i_Shop_02_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F"];
publicVariable "WLD_shopBuildings";
WLD_carServiceBuildings = ["Land_CarService_F"];
publicVariable "WLD_carServiceBuildings";
WLD_ATMs = ["Land_Atm_01_F","Land_Atm_02_F"];
publicVariable "WLD_ATMs";
WLD_fuelPumps = ["Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F"];
publicVariable "WLD_fuelPumps";
//-----------------------------------
if (worldName isEqualTo "Tanoa") then {
	{WLD_tier1Housing pushBack _x} forEach ["Land_House_Small_04_F","Land_House_Small_05_F","Land_House_Small_06_F","Land_House_Big_01_F"];
	publicVariable "WLD_tier1Housing";
	{WLD_tier2Housing pushBack _x} forEach ["Land_House_Big_04_F","Land_House_Big_02_F"];
	publicVariable "WLD_tier2Housing";
	{WLD_tier3Housing pushBack _x} forEach ["Land_House_Big_03_F"];
	publicVariable "WLD_tier3Housing";
	{WLD_militaryHousing pushBack _x} forEach ["Land_Barracks_01_grey_F","Land_Barracks_01_camo_F"];
	publicVariable "WLD_militaryHousing";
	{WLD_CPDbuildings pushBack _x} forEach [""];
	publicVariable "WLD_CPDbuildings";
	{WLD_shopBuildings pushBack _x} forEach ["Land_Shop_City_01_F","Land_Shop_City_02_F","Land_Shop_Town_03_F","Land_Shop_Town_01_F"];
	publicVariable "WLD_shopBuildings";
	{WLD_ATMs pushBack _x} forEach [""];
	publicVariable "WLD_ATMs";
	{WLD_fuelPumps pushBack _x} forEach [""];
	publicVariable "WLD_fuelPumps";
};
diag_log "-- COMPLETE --";
//-----------------------------------
//-TPW init
[[]] spawn WLD_fnc_tpw_core;
[10,600,2,[50,250,500],0] spawn WLD_fnc_tpw_air;
[10,25,1000,75,60] spawn WLD_fnc_tpw_animals;
[10,1000,15,2] spawn WLD_fnc_tpw_boats;
[10,1000,15,4,1,[]] spawn WLD_fnc_tpw_cars;
[10,300,15,5,4,50,0,20,15,1,[]] spawn WLD_fnc_tpw_civs;
[25,600,300,100,10,[]] spawn WLD_fnc_tpw_park;
//-----------------------------------
diag_log "-- CREATING MAP MARKERS --";
//-----------------------------------
//-ATM map markers
private "_ATMs";
_ATMs = [];
for "_i" from 0 to ((count WLD_cities)-1) do {
	_location = (WLD_cities select _i);
	{
		if (str _x find ": atm_" > -1) then {
			_ATMs pushback _x;
		};
	} forEach (nearestObjects [(_location select 1), [], ((_location select 2) select 0)]);
};
{
	_id = format ["ATM%1",(getPos _x)];
	_debug = createMarker [_id,(getPos _x)];
	_debug setMarkerShape "ICON";
	_debug setMarkerType "loc_Tourism";
	_debug setMarkerSize [0.8,0.8];
	_debug setMarkerAlpha 0.5;
	_debug setMarkerColor "ColorYellow";
} foreach _ATMs;
//-----------------------------------
diag_log "-- MAP MARKERS COMPLETE --";
//-----------------------------------
setTimeMultiplier 20;
[] spawn WLD_fnc_weather;
[] call SIN_fnc_adminInit;
//-----------------------------------
WLD_serverReady = true;
publicVariable "WLD_serverReady";
//-----------------------------------
diag_log "----------------------------------------------------------------------------------------------------";
diag_log "----------------------------------- A3DRPG SERVER INIT COMPLETE  -----------------------------------";
diag_log "----------------------------------------------------------------------------------------------------";
//-----------------------------------
