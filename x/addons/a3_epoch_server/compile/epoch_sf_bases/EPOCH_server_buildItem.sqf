// "x\addons\a3_epoch_server\compile\epoch_sf_bases\EPOCH_server_buildItem.sqf"
private ["_slot","_buildClass","_pos","_dir","_storageObj"];
_itemClass = _this select 0;
_pos = _this select 1;
_plyr = _this select 2;
_dir = (getdir _plyr);

_buildClass = getText(configfile >> "CfgMagazines" >> (_itemClass) >> "buildClass");

if (_buildClass != "") then{

_isStorage = getNumber(configfile >> "CfgMagazines" >> (_itemClass) >> "isStorage");

if (_isStorage == 1) then{
if !(EPOCH_StorageSlots isEqualTo []) then{


_storageObj = createVehicle[_buildClass, _pos, [], 0.0, "CAN_COLLIDE"];
_storageObj setDir _dir;
_storageObj setPosATL _pos;

_slot = EPOCH_StorageSlots select 0;
EPOCH_StorageSlots = EPOCH_StorageSlots - [_slot];

_storageObj setVariable["STORAGE_SLOT", _slot, true];

_storageObj call EPOCH_save_storage;

_storageObj call EPOCH_server_storageInit;

diag_log format["STORAGE: %1 created storage %2 at %3", (getPlayerUID _plyr), _buildClass, _pos];

EPOCH_StorageSlotsCount = count EPOCH_StorageSlots;
publicVariable "EPOCH_StorageSlotsCount";
};
} else {

_isTemp = getNumber(configfile >> "CfgMagazines" >> (_itemClass) >> "isTemp");


_storageObj = createVehicle[_buildClass, _pos, [], 0.0, "CAN_COLLIDE"];
_storageObj setDir _dir;
_storageObj setPosATL _pos;

if (_isTemp == 0) then {
[_storageObj, _plyr] call EPOCH_server_saveBuilding;
};

diag_log format["BUILDING: %1 created building %2 at %3", (getPlayerUID _plyr), _buildClass, _pos];
};
};