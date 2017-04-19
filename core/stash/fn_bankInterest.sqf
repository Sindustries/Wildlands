/*
    fn_bankInterest
    Author: Sinbane

    Description:
    Applies daily interest on bank funds
*/
private["_balance","_value"];
//-----------------------------------
waitUntil {(date select 3) isEqualTo 12};
_balance = player getVariable ["WLD_bank",0];
_balance = [_balance,2] call BIS_fnc_cutDecimals;
if (_balance <= 0) exitWith {};
_rate = ["WLDinterestRate"] call WLD_fnc_getSetting;
_value = (_balance*_rate);
_value = [_value,2] call BIS_fnc_cutDecimals;
//-----------------------------------
_balance = _balance + _value;
player setVariable ["WLD_bank",_balance,true];
[_value,2] call WLD_fnc_bankMessage;
//-----------------------------------
[] call WLD_bankInterest;
//-----------------------------------