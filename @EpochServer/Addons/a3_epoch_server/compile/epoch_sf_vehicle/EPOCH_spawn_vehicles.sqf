// "x\addons\a3_epoch_server\compile\epoch_sf_vehicle\EPOCH_spawn_vehicles.sqf"
private ["_velimit","_isAir","_isShip","_position","_dir","_marker","_vehObj","_slot","_vehClass","_colors","_color","_config","_selections","_textures","_forEachIndex","_textureSelectionIndex","_vehicleFound","_randomVehicleIndex","_randomVehicle","_vehicleCount","_count"];
{
_slot = _x;




_vehicleFound = false;
_vehClass = "";
while {!_vehicleFound} do {
_countAllowedVeh = count EPOCH_allowedVehiclesList;
if (_countAllowedVeh == 0) exitWith{};

_randomVehicleIndex = floor(random(_countAllowedVeh));
_randomVehicle = EPOCH_allowedVehiclesList select _randomVehicleIndex;
_vehClass = _randomVehicle select 0;
_velimit = _randomVehicle select 1;

_vehicleCount = {typeOf _x == _vehClass} count vehicles;
if (_vehicleCount >= _velimit) then {

EPOCH_allowedVehiclesList set [_randomVehicleIndex,"REM"];
EPOCH_allowedVehiclesList = EPOCH_allowedVehiclesList - ["REM"];
} else {

if (_vehicleCount == (_velimit-1)) then {

EPOCH_allowedVehiclesList set [_randomVehicleIndex,"REM"];
EPOCH_allowedVehiclesList = EPOCH_allowedVehiclesList - ["REM"];
};
_vehicleFound = true;
};
};

if (!_vehicleFound) exitWith { diag_log "DEBUG: Vehicle spawner unable to find suitable vehicle" };


_isAir = _vehClass isKindOf "Air";
_isShip = _vehClass isKindOf "Ship";

if(_isShip || _isAir) then {
if(_isShip) then {
_position = [epoch_centerMarkerPosition,0,EPOCH_dynamicVehicleArea,10,0,4000,1] call BIS_fnc_findSafePos;
_position = [_position,0,100,10,2,4000,0] call BIS_fnc_findSafePos;
} else {
_position = [epoch_centerMarkerPosition,0,EPOCH_dynamicVehicleArea,10,0,1000,0] call BIS_fnc_findSafePos;
};
} else {

_position = EPOCH_roadList call BIS_fnc_selectRandom;
_position = _position modelToWorld [0,0,0];
_position = [_position,0,10,10,0,2000,0] call BIS_fnc_findSafePos;
};

if ((count _position) == 2) then {

_dir = round(random 360);


_vehObj = createVehicle [_vehClass, _position, [], 0, "CAN_COLLIDE"];
_vehObj setdir _dir;

clearWeaponCargoGlobal    _vehObj;
clearMagazineCargoGlobal  _vehObj;
clearBackpackCargoGlobal  _vehObj;
clearItemCargoGlobal	  _vehObj;

[_vehObj,true] call EPOCH_server_lockVehicle;

_position set [2,0];

if(surfaceIsWater _position) then {
_vehObj setposASL _position;
} else {
_vehObj setposATL _position;
};


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


if (_vehClass isKindOf "Ship") then{
[_vehObj, ["Items", "Items", "Equipment", "Equipment", "Pistols", "Pistols", "PistolAmmo", "PistolAmmo", "PistolAmmo", "Scopes", "Muzzles", "Uniforms", "Vests", "Headgear", "Food", "Food", "Generic", "GenericLarge", "GenericLarge", "RifleBoat", "RifleBoat", "RifleAmmoBoat", "RifleAmmoBoat", "Hand", "Explosives", "Grenades", "Backpack"], 4] call EPOCH_serverLootObject;
} else {
[_vehObj, ["Items", "Items", "Equipment", "Equipment", "Pistols", "Pistols", "PistolAmmo", "PistolAmmo", "PistolAmmo", "Scopes", "Muzzles", "Uniforms", "Vests", "Headgear", "Food", "Food", "Generic", "GenericLarge", "GenericLarge", "Machinegun", "MachinegunAmmo", "MachinegunAmmo", "Rifle", "RifleAmmo", "RifleAmmo", "SniperRifle", "SniperRifleAmmo", "SniperRifleAmmo", "Hand", "Hand", "Explosives", "Grenades", "Backpack"], 4] call EPOCH_serverLootObject;
};


_vehObj setVariable ["VEHICLE_SLOT",_slot,true];


_vehObj call EPOCH_save_vehicle;


EPOCH_VehicleSlots = EPOCH_VehicleSlots - [_slot];

_vehObj call EPOCH_server_vehicleInit;

if(EPOCH_DEBUG_VEH) then {
_marker = createMarker [str(_position) , _position];
_marker setMarkerShape "ICON";
_marker setMarkerType "mil_dot";
_marker setMarkerText _vehClass;
};
};

} forEach EPOCH_VehicleSlots;



EPOCH_VehicleSlotCount = count EPOCH_VehicleSlots;
publicVariable "EPOCH_VehicleSlotCount";

EPOCH_roadList = nil;
EPOCH_allowedVehiclesList = nil;
true