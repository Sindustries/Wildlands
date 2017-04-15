/*
    fn_loadOptions
    Author: Sinbane

    Description:
    Gives player starting gear based on whatever they choose
*/
#define Btn1 88881
#define Btn2 88882
#define Btn3 88883
#define Btn4 88884
#define Btn5 88885
#define Btn6 88886
#define Btn7 88887
#define Btn8 88888

private["_display","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8"];
disableSerialization;

//-----------------------------------

_display = findDisplay 1222;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
{
	_x ctrlEnable false;
} forEach [_Btn1,_Btn2,_Btn3,_Btn4,_Btn5,_Btn6,_Btn7,_Btn8];

//-----------------------------------
private ["_option","_spawned","_location","_spawnableHouses","_houseList","_buildingPos","_house","_housePos","_grp","_unit","_unitType","_side","_container","_car","_locale","_housing","_spawnPos","_crate","_cratePos","_carPosFound","_add","_nearRoads","_road","_connectedRoads","_dir","_spawncar"];
//-----------------------------------
_option = _this select 0;
_cars = [
"Jonzie_30CSL",
"Jonzie_Escalade",
"Jonzie_Datsun_510",
"Jonzie_Datsun_Z432",
"Jonzie_Viper",
"Jonzie_Raptor",
"Jonzie_XB",
"Jonzie_Transit",
"Jonzie_VE",
"Jonzie_Ute",
"Jonzie_Ceed",
"Jonzie_Quattroporte",
"Jonzie_STI",
"Jonzie_Corolla"
];
_car = selectRandom _cars;
_side = resistance;
_container = "plp_ct_TravelBagBlue";
_locale = WLD_villages;
_housing = WLD_tier1Housing;
//-----------------------------------
if (_option isEqualTo 1) then {
	_unitType = "B_Soldier_SL_F";
};
if (_option isEqualTo 2) then {
	_unitType = "B_Soldier_GL_F";
};
if (_option isEqualTo 3) then {
	_unitType = "B_Soldier_M_F";
};
if (_option isEqualTo 4) then {
	_unitType = "B_Medic_F";
};
if (_option isEqualTo 5) then {
	_unitType = "B_Soldier_SL_F";
};
if (_option isEqualTo 6) then {
	_unitType = "B_Soldier_GL_F";
};
if (_option isEqualTo 7) then {
	_unitType = "B_Soldier_M_F";
};
if (_option isEqualTo 8) then {
	_unitType = "B_Medic_F";
};
//-----------------------------------
diag_log "-- FINDING SPAWN BUILDING.. --";
_spawned = false;
_spawnableHouses = [];
if (!(isNil "_locale")) then {
	_location = (selectRandom _locale);
	_houseList = nearestObjects [(_location select 1), _housing, ((_location select 2) select 0)];
} else {
	_houseList = nearestObjects [(getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition")), _housing, 50000];
};
_toRemove = [];
{
	if (!((typeOf _x) in _housing)) then {
		_toRemove pushBack _x;
	};
} forEach _houseList;
_houseList = _houseList - _toRemove;
if ((count _houseList) > 0) then {
	{
		_buildingPos = _x buildingPos -1;
		if ((count _buildingPos) >= 2) then {
			_spawnableHouses pushBack _x;
		};
	} forEach _houseList;
	if ((count _spawnableHouses) > 0) then {
		private ["_playerPosFound","_markerName","_marker","_posFound"];
		_playerPosFound = false;
		_house = selectRandom _spawnableHouses;
		_housePos = _house buildingPos -1;
		_posFound = false;
		_crate = _container createVehicle [0,0,0];
		while {!_posFound} do {
			_cratePos = selectRandom _housePos;
			_crate setPos _cratePos;
			if ((getPosATL _crate select 2) < 6) then {
				_posFound = true;
				_housePos = _housePos - _cratePos;
			};
		};
		while {!_playerPosFound} do {
			_spawnPos = selectRandom _housePos;
			_markerName = format["House %1",(getPos _house)];
			_marker = createMarkerLocal [_markerName, (getPos _house)];
			_marker setMarkerShapeLocal "ICON";
			_marker setMarkerTypeLocal "loc_Tourism";
			_marker setMarkerColorLocal "ColorBlufor";
			_marker setMarkerSizeLocal [0.75,0.75];
			_marker setMarkerAlphaLocal 1;
			_marker setMarkerTextLocal "Safehouse";
			WLD_clientMarkers pushBack _marker;
			_playerPosFound = true;
		};
		_spawned = true;
		_carPosFound = false;
		_add = 20;
		while {!_carPosFound} do {
			_nearRoads = _house nearRoads _add;
			if (count _nearRoads > 0) then {
				_carPosFound = true;
				_road = (_nearRoads select 0);
				_connectedRoads = roadsConnectedTo _road;
				_dir = [_road, (_connectedRoads select 0)] call BIS_fnc_DirTo;
				_carpos = (getPos _road);
				_spawncar = _car createVehicle [0,0,0];
				_spawncar setPos _carpos;
				_spawncar setDir _dir;
				[_spawncar] call WLD_fnc_emptyVeh;
			} else {
				_add = _add + 20;;
			};
		};
	};
};
if (!_spawned) then {
	if (!(isNil "_location")) then {
		_spawnPos = [(_location select 1),0,((_location select 2) select 0)] call WLD_fnc_findPos;
	} else {
		_spawnPos = [(getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition")),0,50000] call WLD_fnc_findPos;
	};
	_cratePos = [_spawnPos,2,10] call WLD_fnc_findPos;
	_carPos = [_spawnPos,5,20] call WLD_fnc_findPos;
	_crate = _container createVehicle [0,0,0];
	_crate setPos _cratePos;
	_spawncar = _car createVehicle [0,0,0];
	_spawncar setPos _carpos;
	_spawncar setDir (random 360);
	[_spawncar] call WLD_fnc_emptyVeh;
};
[_crate] call WLD_fnc_emptyVeh;
_grp = createGroup _side;
_unit = _grp createUnit [_unitType, _spawnPos, [], 0, "NONE"];
if (!(isNil "_house")) then {
	_house setVariable ['bis_disabled_Door_1',1,true];
	_house setVariable ["WLD_owner",(getPlayerUID player)];
	WLD_safehouses pushBack _house;
};
_spawncar setVariable ["WLD_owner",(getPlayerUID player)];
_spawncar lock 2;
//-----------------------------------
if (!(isNil "_location")) then {
	diag_log format["-- SPAWN LOCATION: %1 --",(_location select 0)];
} else {
	diag_log format["-- SPAWN LOCATION: %1 --",(getPos player)];
};
[_option,_unit,_crate] call WLD_fnc_loadOptions;
//-----------------------------------