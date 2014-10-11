// "x\addons\a3_epoch_server\compile\epoch_sf_bases\EPOCH_server_upgradeBUILD.sqf"
private ["_worldspace","_class","_newObj","_objHiveKey","_VAL","_return","_upgrade","_objSlot"];
_objSlot = _this getVariable ["BUILD_SLOT", -1];
if (_objSlot != -1) then {
_upgrade = getArray (configFile >> "CfgVehicles" >> (typeOf _this) >> "upgradeBuilding");
if !(_upgrade isEqualTo []) then{
_worldspace = [getposATL _this,vectordir _this,vectorup _this];
deleteVehicle _this;
_class = _upgrade select 0;

_newObj = createVehicle [_class, (_worldspace select 0), [], 0, "CAN_COLLIDE"];
_newObj setVariable ["BUILD_SLOT",_objSlot,true];
_newObj setVectorDirAndUp [(_worldspace select 1),(_worldspace select 2)];
_newObj setposATL (_worldspace select 0);

_objHiveKey = format ["%1:%2", EPOCH_InstanceID,_objSlot];
_VAL = [_class,_worldspace];
_return = ["B", _objHiveKey, _VAL, EPOCH_hive] call EPOCH_server_hiveSET;
};
} else {
diag_log format["DEBUG upgrade BUILD : %1 slot %2", _this, _objSlot];
};