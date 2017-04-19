/*
    fn_bankMessage
    Author: Sinbane

    Description:
    Informs player of changes to their bank balance
    [_value,0] call WLD_fnc_bankMessage;
    0 = deposit
    1 = withdraw
    2 = interest payment
    3 = sent payment
    4 = received payment
*/
private ["_balance","_hour","_min","_time"];
params [
	["_value",0,[0]],
	["_type",-1,[0]]
];
if (_type isEqualTo -1) exitWith {};

_balance = (player getVariable ["WLD_bank",0]);
_hour = (date select 3);
_min = (date select 4);
if (_min < 10) then {
	_min = format["0%1",(date select 4)];
};
_time = format["%1:%2",_hour,_min];

switch (_type) do {
	case 0: {
		hint parseText format["
		<t align='center' underline='true' color='#ffff00'>GLOBAL BANKING<br/>
		CORPORATION</t><br/>
		<t align='center'>ACCOUNT UPDATE<br/></t>
		<t size='0.9' align='center'>@ %1<br/></t>
		<t size='0.8' align='center'>$%2 has been deposited into your account</t>
		<t size='0.8' align='center'>Your new balance is: $%3</t>",
		_time,_value,_balance];
	};
	case 1: {
		hint parseText format["
		<t align='center' underline='true' color='#ffff00'>GLOBAL BANKING<br/>
		CORPORATION</t><br/>
		<t align='center'>ACCOUNT UPDATE<br/></t>
		<t size='0.9' align='center'>@ %1<br/></t>
		<t size='0.8' align='center'>$%2 has been withdrawn from your account</t>
		<t size='0.8' align='center'>Your new balance is: $%3</t>",
		_time,_value,_balance];
	};
	case 2: {
		hint parseText format["
		<t align='center' underline='true' color='#ffff00'>GLOBAL BANKING<br/>
		CORPORATION</t><br/>
		<t align='center'>ACCOUNT UPDATE<br/></t>
		<t size='0.9' align='center'>@ %1<br/></t>
		<t size='0.8' align='center'>You just recieved $%2 in interest</t>
		<t size='0.8' align='center'>Your new balance is: $%3</t>",
		_time,_value,_balance];
	};
	case 3: {
		hint parseText format["
		<t align='center' underline='true' color='#ffff00'>GLOBAL BANKING<br/>
		CORPORATION</t><br/>
		<t align='center'>ACCOUNT UPDATE<br/></t>
		<t size='0.9' align='center'>@ %1<br/></t>
		<t size='0.8' align='center'>You just sent a payment of $%2</t>
		<t size='0.8' align='center'>Your new balance is: $%3</t>",
		_time,_value,_balance];
	};
	case 4: {
		hint parseText format["
		<t align='center' underline='true' color='#ffff00'>GLOBAL BANKING<br/>
		CORPORATION</t><br/>
		<t align='center'>ACCOUNT UPDATE<br/></t>
		<t size='0.9' align='center'>@ %1<br/></t>
		<t size='0.8' align='center'>You just received a payment of $%2</t>
		<t size='0.8' align='center'>Your new balance is: $%3</t>",
		_time,_value,_balance];
	};

};