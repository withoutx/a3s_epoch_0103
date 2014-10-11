// "x\addons\a3_epoch_server\compile\epoch_sf_bases\EPOCH_server_loadBuildings.sqf"
private ["_marker","_arr","_class","_worldspace","_location","_vdir","_vup","_baseObj","_vehHiveKey","_response"];
for "_i" from 0 to _this do {
_vehHiveKey = format ["%1:%2", EPOCH_InstanceID,_i];
_response = ["B", _vehHiveKey, EPOCH_hive] call EPOCH_server_hiveGET;
if (_response != "" && _response != "any") then {
_arr = call compile _response;
if (!isNil "_arr" && {(typeName _arr) == "ARRAY"}) then{
_arrCount = count _arr;

_class = _arr select 0;
_worldspace = _arr select 1;

_storageSlot = "-1";
if (_arrCount >= 3) then{

if ((typeName (_arr select 2)) == "SCALAR") then {
_storageSlot = str(_arr select 2);
} else {
_storageSlot = _arr select 2;
};

};

_owner = "-1";
if (_arrCount >= 4) then{
_owner = _arr select 3;
};

_location = _worldspace select 0;
_vdir = _worldspace select 1;
_vup = _worldspace select 2;
if (isClass(configFile >> "CfgVehicles" >> _class)) then{

_baseObj = createVehicle[_class, _location, [], 0, "CAN_COLLIDE"];
_baseObj setposATL _location;


if (_class == "LockBox_EPOCH") then{

if ((_location select 2) < 0) then{
_location set[2, 0];
_baseObj setposATL _location;
};

if (_storageSlot != "-1") then{
_baseObj setVariable["EPOCH_secureStorage", _storageSlot];
_baseObj setVariable["EPOCH_Locked", true, true];
};
};

_baseObj setVectorDirAndUp[_vdir, _vup];
_baseObj call EPOCH_server_buildingInit;
_baseObj setVariable["BUILD_SLOT", _i, true];

if (_owner != "-1") then{
_baseObj setVariable["BUILD_OWNER", _owner, true];
};

missionNamespace setVariable[format["EPOCH_BUILD_%1",_i], _baseObj];

EPOCH_BuildingSlots set [_i,1];
if(EPOCH_DEBUG_VEH) then {
_marker = createMarker [str(_location) , _location];
_marker setMarkerShape "ICON";
_marker setMarkerType "mil_dot";
_marker setMarkerText _class;
_marker setMarkerColor "ColorRed";
};
} else {
EPOCH_BuildingSlots set [_i,0];
};
} else {
EPOCH_BuildingSlots set [_i,0];
};
} else {
EPOCH_BuildingSlots set [_i,0];
};
};
EPOCH_BuildingSlotCount = {_x == 0} count EPOCH_BuildingSlots;
publicVariable "EPOCH_BuildingSlotCount";
true