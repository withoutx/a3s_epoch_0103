// "x\addons\a3_epoch_server\compile\epoch_sf_vehicle\EPOCH_save_killedVehicle.sqf"
private["_vehicle", "_class", "_vehSlot", "_vehHiveKey", "_VAL"];
if (!isNull _this) then{
_vehicle = _this;
_class = typeOf _vehicle;
_vehSlot = _vehicle getVariable["VEHICLE_SLOT", "ABORT"];
if (_vehSlot != "ABORT") then{
_vehHiveKey = format["%1:%2", EPOCH_InstanceID, _vehSlot];
_VAL = false;
["V", _vehHiveKey, _VAL, EPOCH_hive] call EPOCH_server_hiveSET;
EPOCH_VehicleSlots pushBack _vehSlot;
EPOCH_VehicleSlotCount = count EPOCH_VehicleSlots;
publicVariable "EPOCH_VehicleSlotCount";
};
};