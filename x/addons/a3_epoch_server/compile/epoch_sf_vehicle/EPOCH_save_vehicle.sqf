// "x\addons\a3_epoch_server\compile\epoch_sf_vehicle\EPOCH_save_vehicle.sqf"
private ["_vehicle","_class","_vehSlot","_vehHiveKey","_damage","_fuel","_pos","_dir","_worldspace","_hitpoints","_actualHitpoints","_inventory","_VAL","_return","_magazines","_colorSlot"];
if (!isNull _this) then{

_vehicle = _this;

_vehSlot = _this getVariable["VEHICLE_SLOT", "ABORT"];
if (_vehSlot != "ABORT") then{

_vehHiveKey = format ["%1:%2", EPOCH_InstanceID,_vehSlot];

_hitpoints = [];
_actualHitpoints = _vehicle call EPOCH_getHitpoints;
{
_hitpoints pushBack (_vehicle getHitPointDamage _x);
} forEach _actualHitpoints;


_wepsItemsCargo = weaponsItemsCargo _vehicle;
if (isNil "_wepsItemsCargo") then {
_wepsItemsCargo = [];
};
_magsAmmoCargo = magazinesAmmoCargo _vehicle;
if (isNil "_magsAmmoCargo") then {
_magsAmmoCargo = [];
};

_inventory = [
_wepsItemsCargo,
_magsAmmoCargo,
getBackpackCargo _vehicle,
getItemCargo _vehicle
];
_colorSlot = _vehicle getVariable ["VEHICLE_TEXTURE",0];

_VAL = [typeOf _vehicle,[getDir _vehicle,getPosATL _vehicle],damage _vehicle,_hitpoints,fuel _vehicle,_inventory,magazinesAmmo _vehicle,_colorSlot];
["V", _vehHiveKey, _VAL, EPOCH_hive] call EPOCH_server_hiveSET;
};
};