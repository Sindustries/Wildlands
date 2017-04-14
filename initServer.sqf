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
setDate [2023, 8, 11, 8, 0];
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
//-FIND LOCATIONS
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
WLD_ATMs = ["Land_Atm_01_F","Land_Atm_02_F"];
publicVariable "WLD_ATMs";
diag_log "-- COMPLETE --";
//-----------------------------------
//-TPW init
[[]] spawn WLD_fnc_tpw_core;
[10,600,2,[50,250,500],0] spawn WLD_fnc_tpw_air;
[10,25,1000,75,60] spawn WLD_fnc_tpw_animals;
[10,1000,15,2] spawn WLD_fnc_tpw_boats;
[10,1000,15,4,1,["Jonzie_"]] spawn WLD_fnc_tpw_cars;
[10,300,15,5,4,50,0,20,15,1,[]] spawn WLD_fnc_tpw_civs;
[25,600,300,100,10,["Jonzie_"]] spawn WLD_fnc_tpw_park;
//-----------------------------------
WLD_serverReady = true;
publicVariable "WLD_serverReady";
//-----------------------------------
diag_log "----------------------------------------------------------------------------------------------------";
diag_log "----------------------------------- A3DRPG SERVER INIT COMPLETE  -----------------------------------";
diag_log "----------------------------------------------------------------------------------------------------";
//-----------------------------------