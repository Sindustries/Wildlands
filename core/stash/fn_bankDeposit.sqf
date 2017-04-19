/*
    fn_bankDeposit
    Author: Sinbane

    Description:
    Deposits credits to the player GBC account
*/
private["_balance","_cash","_value"];
_value = parseNumber(ctrlText 144414);
_balance = player getVariable ["WLD_bank",0];
_cash = player getVariable ["WLD_cash",0];
_balance = [_balance,2] call BIS_fnc_cutDecimals;
_cash = [_cash,2] call BIS_fnc_cutDecimals;
_value = [_value,2] call BIS_fnc_cutDecimals;

if (_value > 999999) exitWith {hint "GBC Error: You can't deposit this much.";};
if (_value < 0) exitWith {};
if (_value > _cash) exitWith {hint "GBC Error: You don't have enough cash."};

_cash = _cash - _value;
_balance = _balance + _value;
player setVariable ["WLD_bank",_balance,true];
player setVariable ["WLD_cash",_cash,true];
[_value,0] call WLD_fnc_bankMessage;

[] call WLD_fnc_bank;