/*
	Mission: Wildlands
	Author: Sinbane
	Description:
*/
private "_version";
_version = "0.0.0";
//-----------------------------------
waitUntil {isPlayer player};
enableSaving [false, false];
enableSentences false;
enableEnvironment false;
setTimeMultiplier 0;
player enableSimulation false;
player allowDamage false;
player enableStamina false;
//-----------------------------------
//-MAIN
