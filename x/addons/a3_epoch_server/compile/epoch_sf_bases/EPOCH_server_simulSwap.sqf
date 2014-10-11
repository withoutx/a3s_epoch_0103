// "x\addons\a3_epoch_server\compile\epoch_sf_bases\EPOCH_server_simulSwap.sqf"
private ["_cfgClass","_worldspace","_newObj","_return","_class","_oemType","_config","_object","_status","_objSlot"];
_object = (_this select 0);
_status = (_this select 1);

_return = _object;

_objSlot = _object getVariable ["BUILD_SLOT", -1];
if (_objSlot != -1) then {

_cfgClass = "staticClass";
if(_status) then {
_cfgClass = "simulClass";
};
_oemType = (typeOf _object);

_config = (configFile >> "CfgVehicles" >> _oemType >> _cfgClass);
if (isText(_config)) then {
_class = getText(_config);

if (_oemType != _class) then {

_worldspace = [(getposATL _object),(vectordir _object),(vectorup _object)];
deleteVehicle _object;

_newObj = createVehicle [_class, (_worldspace select 0), [], 0, "CAN_COLLIDE"];
_newObj setVariable ["BUILD_SLOT",_objSlot,true];
_newObj setVectorDirAndUp [(_worldspace select 1),(_worldspace select 2)];
_newObj setposATL (_worldspace select 0);
_return = _newObj;

};
};
};
_return