// "x\addons\a3_epoch_server\compile\epoch_sf_player\EPOCH_server_savePlayer.sqf"
private["_return", "_pos", "_hitpoints", "_medical", "_plyrUID", "_var", "_weapons", "_vars", "_itemsplayer", "_weaponsplayer", "_appearance", "_plyr"];

_plyr = _this select 0;
_vars = _this select 1;

if (isNull _plyr) exitWith {
diag_log "DEBUG SAVE ABORT null player object";
};
if !(_plyr getVariable ["SETUP", false]) exitWith {
diag_log format["DEBUG SAVE ABORT not setup: %1", _plyr]
};

_plyrUID = _plyr getVariable ["PUID",""]; 
_group = _plyr getVariable ["GROUP", ""];
_revive = _plyr getVariable ["REVIVE", true];

if (_plyrUID == "") exitWith {
diag_log format["DEBUG SAVE ABORT %1", _plyrUID]
};

_pos = getPosATL _plyr;
if (vehicle _plyr != _plyr) then {_pos set [2,0]};

_medical = [getBleedingRemaining _plyr,0,getOxygenRemaining _plyr,damage _plyr];
_appearance = [goggles _plyr,headgear _plyr,vest _plyr,backpack _plyr,uniform _plyr,typeOf _plyr];
_itemsplayer = [getItemCargo (uniformContainer _plyr),getItemCargo (vestContainer _plyr),getItemCargo (backpackContainer _plyr)];
_weaponsplayer = [getWeaponCargo (uniformContainer _plyr),getWeaponCargo (vestContainer _plyr),getWeaponCargo (backpackContainer _plyr)];
_weapons = [currentWeapon _plyr,weaponsItems _plyr,[primaryWeapon _plyr,secondaryWeapon _plyr,handgunWeapon _plyr]];

if (count _this >= 3) then {
_plyr setVariable ["VARS",nil];
} else {
_plyr setVariable ["VARS",_vars];
};


_plyrNameArr = [];
{
_key = _x;
if (_x == 124) then{_key = 32};
_plyrNameArr pushBack _key;
} forEach (toArray(name _plyr));
_plyrName = toString(_plyrNameArr);

_return = ["P", _plyrUID, [[getDir _plyr,_pos,EPOCH_InstanceID],_medical,_appearance,[_plyrName],_vars,_weapons,assignedItems _plyr,magazinesAmmo _plyr,_itemsplayer,_weaponsplayer,_group], EPOCH_hivePlayer] call EPOCH_server_hiveSET;




































