// "x\addons\a3_epoch_server\compile\epoch_sf_vehicle\EPOCH_server_repairVehicle.sqf"
private ["_vehicle","_value"];
_vehicle = _this select 0;
if (!isNull _vehicle) then{
_value = _this select 1;
if ((_value select 0) == "ALL") then{
_vehicle setDamage 0;
} else {
if (local _vehicle) then{
_vehicle setHitPointDamage _value;
diag_log format["REPAIR VEHICLE: %1 server local", _vehicle];
} else {
EPOCH_repairVehicle = [_vehicle, _value];
(owner _vehicle) publicVariableClient "EPOCH_repairVehicle";
diag_log format["REPAIR VEHICLE: %1 owner: %2", _vehicle, owner _vehicle];
};
};
_vehicle call EPOCH_save_vehicle;
};