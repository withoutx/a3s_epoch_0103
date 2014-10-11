// "x\addons\a3_epoch_server\compile\epoch_sf_vehicle\EPOCH_save_killedStorage.sqf"
private ["_vehicle","_class","_vehSlot","_vehHiveKey","_damage","_fuel","_pos","_dir","_worldspace","_hitpoints","_actualHitpoints","_inventory","_VAL","_return","_magazines","_colorSlot"];
if (!isNull _this) then{
_vehicle = _this;
_class = typeOf _vehicle;
_vehSlot = _vehicle getVariable["STORAGE_SLOT", "ABORT"];
if (_vehSlot != "ABORT") then{
_vehHiveKey = format["%1:%2", EPOCH_InstanceID, _vehSlot];
_VAL = false;
["S", _vehHiveKey, _VAL, EPOCH_hive] call EPOCH_server_hiveSET;
EPOCH_StorageSlots pushBack _vehSlot;

EPOCH_StorageSlotsCount = count EPOCH_StorageSlots;
publicVariable "EPOCH_StorageSlotsCount";
};
};