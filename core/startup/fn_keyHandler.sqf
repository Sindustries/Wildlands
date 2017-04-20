/*
	fn_keyHandler
	Author: Sinbane
	Description:
	Handles all custom key controls
	https://resources.bisimulations.com/wiki/DIK_KeyCodes
*/
private ["_ID","_code","_shift","_ctrl","_alt","_handled"];
//-----------------------------------
_ID = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrl = _this select 3;
_alt = _this select 4;
_handled = false;
//-----------------------------------
_pumps = ["Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F"];
//-----------------------------------
switch (_code) do {
	//H - Holster
	case 35: {
        if (_shift && !_ctrl && !_alt && !(currentWeapon player isEqualTo "")) then {
			_handled = true;
            curWep = currentWeapon player;
            player action ["SwitchWeapon", player, player, 100];
        };
        if (!_shift && _ctrl && !_alt && !isNil "curWep" && {!(curWep isEqualTo "")}) then {
            if (curWep in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
				_handled = true;
                player selectWeapon curWep;
            };
        };
    };

	//O - Earplugs
    case 24: {
        if (_shift && !_ctrl && !_alt) then {
            if (soundVolume != 1) then {
				_handled = true;
                1 fadeSound 1;
            } else {
				_handled = true;
                1 fadeSound 0.25;
            };
        };
    };

	//U - Locking and Unlocking
    case 22: {
        if (!_shift && !_ctrl && !_alt) then {
			private ["_veh","_house","_locked","_owner"];
			if (isNull objectParent player) then {
				_veh = cursorObject;
			} else {
				_veh = vehicle player;
			};
            if (_veh isKindOf "House_F" && _veh in WLD_safehouses && player distance _veh < 10) then {
				_house = cursorObject;
				_locked = (_house getVariable ["bis_disabled_Door_1",1]);
				_doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
                if (_locked isEqualTo 1) then {
					for "_i" from 0 to _doors do {
						_house setVariable [format["bis_disabled_Door_%1",_i],0,false];
					};
					[1,"HOUSE UNLOCKED"] spawn WLD_fnc_message;
				} else {
					for "_i" from 0 to _doors do {
						_house setVariable [format["bis_disabled_Door_%1",_i],1,true];
					};
					[1,"HOUSE LOCKED"] spawn WLD_fnc_message;
				};
				_handled = true;
            };
			if (_veh isKindOf "Land" || _veh isKindOf "Sea" || _veh isKindOf "Air") then {
				_owner = (_veh getVariable ["WLD_owner",0]);
				if ((getPlayerUID player) isEqualTo _owner) then {
					if (vehicle player isEqualTo _veh || player distance _veh < 6) then {
						_locked = locked _veh;
						if (_locked isEqualTo 0) then {
							_veh lock 2;
							[1,"VEHICLE LOCKED"] spawn WLD_fnc_message;
						};
						if (_locked isEqualTo 2) then {
							_veh lock 0;
							[1,"VEHICLE UNLOCKED"] spawn WLD_fnc_message;
						};
						_handled = true;
					};
				};
			};
        };
    };
    //Windows Key
	case 219: {
		private ["_veh"];
		if (isNull objectParent player) then {
			_veh = cursorObject;
		} else {
			_veh = vehicle player;
		};
		//Is it a house?
	  	if (_veh isKindOf "House_F" && _veh in WLD_safehouses && player distance _veh < 10) then {
	  		if ((player getVariable ["WLD_stashSpawned",false]) isEqualTo false) then {
	  			player setVariable ["WLD_stashSpawned",true,true];
				WLD_stash hideObjectGlobal false;
				WLD_stash attachTo [player, [0, 2.7, 1.1]];
				detach WLD_stash;
				[1,"STASH SPAWNED"] spawn WLD_fnc_message;
			} else {
				player setVariable ["WLD_stashSpawned",false,true];
				WLD_stash setPos ([[0,0,0],0,999999,0,2] call SIN_fnc_findPos);
				WLD_stash hideObjectGlobal true;
				[1,"STASH DESPAWNED"] spawn WLD_fnc_message;
			};
		};
		_handled = true;
	};
};

_handled;

//-----------------------------------