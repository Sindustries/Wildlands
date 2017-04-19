/*
	fn_fuelStation
	Author: Sinbane
	Description:
	Handles the refuelling process
*/
if ((player getVariable ["WLD_pumpingFuel",false]) isEqualTo true) exitWith {};
private ["_pump","_veh","_cost","_totalCost"];

_veh = nearestObject [(getPos player), "car"];
_pump = cursorObject;
_fuelCost = (["WLDrefuelCost"] call WLD_fnc_getSetting);
_totalCost = 0;

//-----------------------------------
player setVariable ["WLD_pumpingFuel",true];
//-----------------------------------
//-Refuel
private ["_counter","_fuel"];
_fuel = fuel _veh;
_counter = (1-_fuel);
while {_fuel < 1 && player distance _pump < 3.5 && vehicle player isEqualTo player} do {
	if (_totalCost >= (player getVariable ["WLD_cash",0]) && _totalCost >= (player getVariable ["WLD_bank",0])) exitWith {};

	_paid = false;
	player playMove "Acts_carFixingWheel";
	player setDir ([_pump, _veh] call BIS_fnc_dirTo);

	_cost = (random _fuelCost);
	_cost = [_cost,2] call BIS_fnc_cutDecimals;
	_refuel = (_fuel + (random 0.025));
	[_veh,_refuel] remoteExec ["setFuel", 0];
	_fuel = fuel _veh;
	_msg = format ["REFUELING: %1%2",([(_fuel*100),2] call BIS_fnc_cutDecimals),"%"];
	sleep 0.1;
	titleText [_msg, "PLAIN", 0.5];

	if (_totalCost <= (player getVariable ["WLD_cash",0]) && _paid isEqualTo false) then {
		player setVariable ["WLD_cash",((player getVariable ["WLD_cash",0])-_cost),true];
		_paid = true;
		sleep 0.2;
	};
	if (_totalCost <= (player getVariable ["WLD_bank",0]) && _paid isEqualTo false) then {
		player setVariable ["WLD_bank",((player getVariable ["WLD_bank",0])-_cost),true];
		_paid = true;
	};

	_totalCost = _totalCost + _cost;
	sleep 0.1;
};
//-----------------------------------
titleText ["", "PLAIN", 0.5];
player switchMove "AidlPercMstpSrasWrflDnon_G01";
player setVariable ["WLD_pumpingFuel",false];
//-----------------------------------
if (_totalCost > 0) then {
	[_totalCost,3] call WLD_fnc_bankMessage;
};
//-----------------------------------