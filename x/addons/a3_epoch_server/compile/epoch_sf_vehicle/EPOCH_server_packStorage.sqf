// "x\addons\a3_epoch_server\compile\epoch_sf_vehicle\EPOCH_server_packStorage.sqf"
_unit = _this select 0;
_plyr = _this select 1;

if (!isNull _unit && !isNull _plyr) then{

if (typeOf _unit == "LockBox_EPOCH") then{

_parentID = _unit getVariable["EPOCH_secureStorage", "-1"];

_weaponHolder = missionNamespace getVariable[format["EPOCH_STORAGE_%1", _parentID], objNull];

diag_log format["_parentID %1", _parentID];

if (!isNull _weaponHolder) then{

_owners = _weaponHolder getVariable["STORAGE_OWNERS", []];

diag_log format["_owners %1", _owners];

if ((getPlayerUID _plyr) in _owners) then{

_unit call EPOCH_save_killedBuilding;
deleteVehicle _unit;

_weaponHolder call EPOCH_save_killedStorage;
deleteVehicle _weaponHolder;

_plyr addMagazine["ItemLockbox", 1];

diag_log format["added ItemLockbox to %1", _plyr];

};
};
};
};