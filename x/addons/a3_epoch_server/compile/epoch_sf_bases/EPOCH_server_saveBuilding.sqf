// "x\addons\a3_epoch_server\compile\epoch_sf_bases\EPOCH_server_saveBuilding.sqf"
private ["_objSlot","_findnextslot","_class","_worldspace","_objHiveKey","_VAL","_return","_config"];

_vehicle = _this select 0;
_plyr = _this select 1;

if (!isNull _vehicle && !isNull _plyr) then{

_plyrUID = getPlayerUID _plyr;

if (_vehicle isKindOf "ThingX" || _vehicle isKindOf "Foundation_Ghost_EPOCH" || _vehicle isKindOf "PlotPole_EPOCH") then{

_objSlot = _vehicle getVariable["BUILD_SLOT", -1];
if (_objSlot == -1) then {
_findnextslot = EPOCH_BuildingSlots find 0;
if (_findnextslot != -1) then {
_objSlot = _findnextslot;
EPOCH_BuildingSlots set [_findnextslot,1];
_vehicle setVariable["BUILD_SLOT", _findnextslot, true];
};
};

EPOCH_BuildingSlotCount = { _x == 0 } count EPOCH_BuildingSlots;
publicVariable "EPOCH_BuildingSlotCount";

_class = typeOf _vehicle;
if (_objSlot == -1) exitWith{ diag_log format["DEBUG BUILD SAVE ABORT: %1 %2", _vehicle, _class] };

_worldspace = [(getposATL _vehicle), (vectordir _vehicle), (vectorup _vehicle)];
_objHiveKey = format["%1:%2", EPOCH_InstanceID, _objSlot];

_newVehicle = [_vehicle, false] call EPOCH_server_simulSwap;

missionNamespace setVariable[format["EPOCH_BUILD_%1", _objSlot], _newVehicle];

_newVehicle setVariable["BUILD_OWNER", _plyrUID, true];

_slot = "-1";

if (_class == "LockBox_SIM_EPOCH") then{

diag_log format["building lockbox %1", _class];

_buildClass = "LockBoxProxy_EPOCH";

if (!isNull _newVehicle) then{

diag_log format["building lockbox !isnull %1", _newVehicle];

if !(EPOCH_StorageSlots isEqualTo []) then{

diag_log format["building lockbox findslot %1", _newVehicle];


_storageObj = createVehicle[_buildClass, (_worldspace select 0), [], 0.0, "CAN_COLLIDE"];

_slot = EPOCH_StorageSlots select 0;
EPOCH_StorageSlots = EPOCH_StorageSlots - [_slot];

diag_log format["building lockbox found slot %1", _slot];

missionNamespace setVariable[format["EPOCH_STORAGE_%1", _slot], _storageObj];

_newVehicle setVariable["EPOCH_secureStorage", _slot];
_newVehicle setVariable["EPOCH_Locked", false, true];

_storageObj setVariable["STORAGE_OWNERS", [_plyrUID]];
_storageObj setVariable["EPOCH_secStorParent", _objSlot];
_storageObj setVariable["STORAGE_SLOT", _slot, true];

_storageObj call EPOCH_save_storage;

_storageObj call EPOCH_server_storageInit;

diag_log format["STORAGE: %1 created storage %2 at %3", _plyrUID, _buildClass, _pos];

EPOCH_StorageSlotsCount = count EPOCH_StorageSlots;
publicVariable "EPOCH_StorageSlotsCount";
};
};
};

_config = (configFile >> "CfgVehicles" >> _class >> "staticClass");
if (isText(_config)) then {
_class = getText(_config);
};

_VAL = [_class, _worldspace, _slot, _plyrUID];
_return = ["B", _objHiveKey, _VAL, EPOCH_hive] call EPOCH_server_hiveSET;
} else {
diag_log format["DEBUG BUILD SAVE ABORT TYPE ERROR: %1", _this]
};
};

_return
