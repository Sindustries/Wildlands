/*
	Mission: Wildlands
	Author: Sinbane
	Description:
*/
//-----------------------------------
waitUntil {isPlayer player};
enableSaving [false, false];
enableSentences false;
enableEnvironment false;
player enableSimulation false;
player allowDamage false;
player enableStamina false;
//-----------------------------------
diag_log "----------------------------------------------------------------------------------------------------";
diag_log "-------------------------------------- WILDLANDS CLIENT INIT ---------------------------------------";
diag_log "----------------------------------------------------------------------------------------------------";
//-----------------------------------
//-GET SETTINGS
["WLD"] call WLD_fnc_getSettings;
//-----------------------------------
//-PLAYER VARIABLES
player setVariable ["WLD_bank",(["defaultCash"] call WLD_fnc_getSetting),true];
player setVariable ["WLD_cash",0,true];
//-----------------------------------
WLD_safehouses = [];
WLD_clientMarkers = [];
//-----------------------------------
waitUntil {time > 0};
cutText ["PREPARING WILDLANDS", "BLACK FADED", 999];
waitUntil {WLD_serverReady isEqualTo true};
diag_log "-- SERVER READY, PREPARING.. --";
//-----------------------------------
//-MAIN
//[] call WLD_fnc_loadPlayerSpawn;
//Find starting location -- TO BE REFINED
//_startPos = [[0,0,0],0,999999] call SIN_fnc_findPos;
//player setPos _startPos;
//-----------------------------------
//-

//-----------------------------------
//-OPERATOR SELECTOR
spawnChosen = false;
while {!spawnChosen} do {
	[] call WLD_fnc_startupMenu;
	waitUntil {dialog};
	waitUntil {!dialog};
};
spawnChosen = nil;
diag_log "-- PLAYER SPAWNED --";
//-----------------------------------
//-CUSTOM KEYS AND ADDACTIONS
[] spawn {
	waitUntil {!isNull (findDisplay 46)};
	private "_keyHandler";
	_keyHandler = (findDisplay 46) displayAddEventHandler ["KeyDown", {
		[_this select 0,_this select 1,_this select 2,_this select 3,_this select 4] call WLD_fnc_keyHandler;
	}];
};
[] call WLD_fnc_addActions;
//-----------------------------------
//enableSaving [false, true];
enableEnvironment true;
player enableSimulation true;
player allowDamage true;
player enableStamina true;
cutText ["", "BLACK IN", 5];
//-----------------------------------
[] spawn WLD_fnc_locationDisplay;
//-----------------------------------
diag_log "----------------------------------------------------------------------------------------------------";
diag_log "--------------------------------- WILDLANDS CLIENT INIT COMPLETE  ----------------------------------";
diag_log "----------------------------------------------------------------------------------------------------";
//-----------------------------------