/*
    fn_startupMenu
    Author: Sinbane

    Description:
    Lets the player choose spawn options
*/
//-----------------------------------
#define Btn1 88881
#define Btn2 88882
#define Btn3 88883
#define Btn4 88884
#define Btn5 88885
#define Btn6 88886
#define Btn7 88887
#define Btn8 88888

#define Class1 888811
#define Class2 888822
#define Class3 888833
#define Class4 888844
#define Class5 888855
#define Class6 888866
#define Class7 888877
#define Class8 888888

private["_display","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Class1","_Class2","_Class3","_Class4","_Class5","_Class6","_Class7","_Class8"];
disableSerialization;
diag_log "-- CLASS SELECTION OPEN --";

//-----------------------------------
if (!dialog) then {
    createDialog "WLD_startup";
	waitUntil {dialog};
};

_display = findDisplay 1222;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
_Class1 = _display displayCtrl Class1;
_Class2 = _display displayCtrl Class2;
_Class3 = _display displayCtrl Class3;
_Class4 = _display displayCtrl Class4;
_Class5 = _display displayCtrl Class5;
_Class6 = _display displayCtrl Class6;
_Class7 = _display displayCtrl Class7;
_Class8 = _display displayCtrl Class8;

{
	_x ctrlEnable false;
	_x ctrlSetTooltip "Not available yet";
} forEach [];
{
	_x ctrlSetStructuredText parseText "<t align='center'>COMING SOON</t>";
} forEach [];
//-----------------------------------
_Btn1 buttonSetAction "[1] call WLD_fnc_loadPlayerSpawn;";
_Class1 ctrlSetStructuredText parseText
"<t align='center' underline='true'>Mr Col. Guy Man</t><br/>
Weapon: AKM pew pew</t><br/>";
//-----------------------------------
_Btn2 buttonSetAction "[2] call WLD_fnc_loadPlayerSpawn;";
_Class2 ctrlSetStructuredText parseText
"<t align='center' underline='true'>Cockblocker Grenadier D00d</t><br/>
Weapon: cant remember</t><br/>";
//-----------------------------------
_Btn3 buttonSetAction "[3] call WLD_fnc_loadPlayerSpawn;";
_Class3 ctrlSetStructuredText parseText
"<t align='center' underline='true'>Pussy Sniper</t><br/>
Weapon: M14 7.62</t><br/>";
//-----------------------------------
_Btn4 buttonSetAction "[4] call WLD_fnc_loadPlayerSpawn;";
_Class4 ctrlSetStructuredText parseText
"<t align='center' underline='true'>MEDIC! MEDIC!</t><br/>
Weapon: Protector</t><br/>";
//-----------------------------------
_Btn5 buttonSetAction "[5] call WLD_fnc_loadPlayerSpawn;";
_Class5 ctrlSetStructuredText parseText
"<t align='center' underline='true'>Riflebitch</t><br/>
Weapon: AKM</t><br/>";
//-----------------------------------
_Btn6 buttonSetAction "[6] call WLD_fnc_loadPlayerSpawn;";
_Class6 ctrlSetStructuredText parseText
"<t align='center' underline='true'>Grenadyke</t><br/>
Weapon: CAR78</t><br/>";
//-----------------------------------
_Btn7 buttonSetAction "[7] call WLD_fnc_loadPlayerSpawn;";
_Class7 ctrlSetStructuredText parseText
"<t align='center' underline='true'>Markswoman</t><br/>
Weapon: yaddayadda</t><br/>";
//-----------------------------------
_Btn8 buttonSetAction "[8] call WLD_fnc_loadPlayerSpawn;";
_Class8 ctrlSetStructuredText parseText
"<t align='center' underline='true'>Beaitfulems</t><br/>
Weapon: protector</t><br/>";
//-----------------------------------