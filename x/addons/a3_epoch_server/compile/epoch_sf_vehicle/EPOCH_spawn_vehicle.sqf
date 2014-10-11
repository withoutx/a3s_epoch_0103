// "x\addons\a3_epoch_server\compile\epoch_sf_vehicle\EPOCH_spawn_vehicle.sqf"
private ["_velimit","_isAir","_isShip","_position","_dir","_marker","_vehObj","_slot","_vehClass","_colors","_color","_config","_selections","_textures","_forEachIndex","_textureSelectionIndex","_vehicleFound","_randomVehicleIndex","_randomVehicle","_vehicleCount","_count"];

_vehClass = _this select 0;
_plyr = _this select 1;

if (!isNull _plyr) then {

if !(EPOCH_VehicleSlots isEqualTo [])  then {

_position = getPosATL _plyr;

_helipad = nearestObjects[_position, ["Land_HelipadEmpty_F", "Land_HelipadCircle_F"], 30];
if !(_helipad isEqualTo []) then{
_position = getPosATL (_helipad select 0);
} else {
_tmpposition = [];
if (_vehClass isKindOf "Ship") then{
_tmpposition = [_position, 0, 100, 10, 0, 1000, 1] call BIS_fnc_findSafePos;
_tmpposition = [_tmpposition, 0, 100, 10, 2, 1000, 0] call BIS_fnc_findSafePos;
} else {
_tmpposition = [_position, 0, 30, 10, 0, 1000, 0] call BIS_fnc_findSafePos;
};
if ((count _tmpposition) == 2) then{
_position = _tmpposition;
};
};


_slot = EPOCH_VehicleSlots select 0;


EPOCH_VehicleSlots = EPOCH_VehicleSlots - [_slot];

EPOCH_VehicleSlotCount = count EPOCH_VehicleSlots;
publicVariable "EPOCH_VehicleSlotCount";


_vehObj = createVehicle [_vehClass, _position, [], 0, "NONE"];

clearWeaponCargoGlobal    _vehObj;
clearMagazineCargoGlobal  _vehObj;
clearBackpackCargoGlobal  _vehObj;
clearItemCargoGlobal	  _vehObj;

[_vehObj,true] call EPOCH_server_lockVehicle;


_config = (configFile >> "CfgVehicles" >> _vehClass >> "availableColors");
if (isArray(_config)) then {

_textureSelectionIndex = configFile >> "CfgVehicles" >> _vehClass >> "textureSelectionIndex";
_selections = if (isArray(_textureSelectionIndex)) then {getArray(_textureSelectionIndex)} else { [0] };

_colors = getArray(_config);
_textures = _colors select 0;
_color = floor (random (count _textures));
_count = (count _colors)-1;
{
if (_count >= _forEachIndex) then {
_textures = _colors select _forEachIndex;
};

_vehObj setObjectTextureGlobal [_x, (_textures select _color)];
} forEach _selections;

_vehObj setVariable ["VEHICLE_TEXTURE",_color];
};


_vehObj setVariable ["VEHICLE_SLOT",_slot,true];


_vehObj call EPOCH_save_vehicle;

_vehObj call EPOCH_server_vehicleInit;
};
};
true