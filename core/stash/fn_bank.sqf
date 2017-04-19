/*
    fn_bank
    Author: Sinbane

    Description:
    Opens the ATM menu
*/
//-----------------------------------

disableSerialization;
#define Btn1 144412
#define Btn2 144413
#define Text1 144411
#define Input1 144414

private["_display","_Btn1","_Btn2","_Text1","_Input1"];

_balance = player getVariable ["WLD_bank",0];
_cash = player getVariable ["WLD_cash",0];
if (_cash < 0) then {_cash = 0};
if (_balance < 0) then {_balance = 0};
_balance = [_balance,2] call BIS_fnc_cutDecimals;
_cash = [_cash,2] call BIS_fnc_cutDecimals;
player setVariable ["WLD_bank",_balance];
player setVariable ["WLD_cash",_cash];

//-----------------------------------
if (!dialog) then {
    createDialog "RPG_atm";
	waitUntil {dialog};
};

_display = findDisplay 1444;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Text1 = _display displayCtrl Text1;
_Input1 = _display displayCtrl Input1;
_Input1 ctrlSetText "";

//-----------------------------------
_Text1 ctrlSetStructuredText parseText format[
"<t align='center' underline='true' color='#ffff00'>GLOBAL BANKING<br/>
CORPORATION</t><br/>
<t align='center' size='0.7'>ACCOUNT BALANCE:<br/>
$%1<br/>
CASH BALANCE:<br/>
$%2<br/></t>
<br/>
<t align='center' size='0.6'>Thank you for choosing GBC for your banking needs.</t>",
_balance,_cash];
//-----------------------------------
