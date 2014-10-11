// "x\addons\a3_epoch_server\compile\epoch_sf_vehicle\EPOCH_save_vehicles.sqf"
private ["_vehSlot"];
{
_vehSlot = _x getVariable ["VEHICLE_SLOT", "ABORT"];
if (_vehSlot != "ABORT") then {
_x call EPOCH_save_vehicle;
};
_storSlot = _x getVariable["STORAGE_SLOT", "ABORT"];
if (_storSlot != "ABORT") then{
_x call EPOCH_save_storage;
};
} forEach _this;