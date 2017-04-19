/*
	HVP Weather Controller
	Author: Sinbane
	Sets weather depending on game mode and time of day
*/
private ["_dayMult","_nightMult"];
//-----------------------------------
if (DebugMode) then {
	systemChat "DEBUG MODE :: Changing Weather";
	showChat true;
};
//-----------------------------------
(30 * timeMultiplier) setOvercast (random 1);
sleep 30;
(30 * timeMultiplier) setFog (random 0.8);
_sleepTime = ((random 30)*60);
if (DebugMode) then {
	systemChat format["DEBUG MODE :: Weather sleeping for %1 seconds (%2 minutes)",_sleepTime,(_sleepTime/60)];
	showChat true;
};
sleep _sleepTime;
//-----------------------------------
[] call WLD_fnc_weather;
//-----------------------------------