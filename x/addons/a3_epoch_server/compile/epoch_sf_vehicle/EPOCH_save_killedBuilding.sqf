// "x\addons\a3_epoch_server\compile\epoch_sf_vehicle\EPOCH_save_killedBuilding.sqf"
private ["_vehicle","_class","_vehSlot","_vehHiveKey","_damage","_fuel","_pos","_dir","_worldspace","_hitpoints","_actualHitpoints","_inventory","_VAL","_return","_magazines","_colorSlot"];
if (!isNull _this) then{
_vehicle = _this;
_class = typeOf _vehicle;
_vehSlot = _vehicle getVariable["BUILD_SLOT", -1];
if (_vehSlot != -1) then{
_vehHiveKey = format["%1:%2", EPOCH_InstanceID, _vehSlot];
_VAL = false;
["B", _vehHiveKey, _VAL, EPOCH_hive] call EPOCH_server_hiveSET;
EPOCH_BuildingSlots set[_vehSlot, 0];

EPOCH_BuildingSlotCount = { _x == 0 } count EPOCH_BuildingSlots;
publicVariable "EPOCH_BuildingSlotCount";
};
};