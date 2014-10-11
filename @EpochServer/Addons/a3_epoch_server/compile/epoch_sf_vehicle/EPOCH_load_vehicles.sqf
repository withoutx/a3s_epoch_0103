// "x\addons\a3_epoch_server\compile\epoch_sf_vehicle\EPOCH_load_vehicles.sqf"
private ["_forEachIndex","_objTypes","_objQty","_arr","_class","_worldspace","_damage","_hitpoints","_fuel","_inventory","_dir","_location","_vehicle","_actualHitpoints","_vehHiveKey","_response","_objType","_marker","_isAir","_isShip","_arrNum","_config","_magazines","_colors","_color","_index","_varName","_varData","_selections","_textures","_textureSelectionIndex","_normalAdd","_magazine","_type","_weapon","_suppressor","_laser","_optics","_attachments","_magazineName","_magazineSize","_count","_qty","_diag","_KEYMASTERGRP","_KEYMASTER","_dataVars","_dataFormat"];

_diag = diag_tickTime;
_KEYMASTERGRP = createGroup civilian;
_KEYMASTER = _KEYMASTERGRP createUnit ["C_man_1", [(epoch_centerMarkerPosition select 0),(epoch_centerMarkerPosition select 1),0], [], 0, "CAN_COLLIDE"];
_KEYMASTER hideObjectGlobal true;
_KEYMASTER allowDammage false;
{
_KEYMASTER disableAI _x;
}forEach ["FSM","MOVE","AUTOTARGET","TARGET"];

_KEYMASTER addVest "V_HarnessO_brn";
_KEYMASTER addbackpack "B_FieldPack_blk";

_dataVars = ["EP_class","EP_worldspace","EP_damage","EP_hitpoints","EP_fuel","EP_inventory","EP_magazines","EP_color"];
_dataFormat = ["",[],0,[],0,[],[],0];

EPOCH_VehicleSlots = [];
for "_i" from 1 to _this do {

EPOCH_VehicleSlots pushBack str(_i);

_vehHiveKey = format ["%1:%2", EPOCH_InstanceID,_i];
_response = ["V", _vehHiveKey, EPOCH_hive] call EPOCH_server_hiveGET;

if (_response != "") then {

_arr = call compile _response;

if (!isNil "_arr" && {(typeName _arr) == "ARRAY"}) then{
_arrNum = count _arr;

EP_class = "";
EP_worldspace = [];
EP_damage = 0;
EP_hitpoints = [];
EP_fuel = 0;
EP_inventory = [];
EP_magazines = [];
EP_color = 0;

if (_arrNum == (count _dataFormat)) then {
{
_index = _forEachIndex;
_varName = _dataVars select _index;
_varData = _arr select _index;
if (typeName _varData == typeName _x) then {
call compile format ["%1 = _varData;",_varName];
} else {
call compile format ["%1 = _x;",_varName];
};
} foreach _dataFormat;

if (EP_class != "" && EP_damage < 1) then {

_dir = 0;
_location = [];
if (typeName (EP_worldspace select 0) == "SCALAR") then {
_dir = EP_worldspace select 0;
};
if (typeName (EP_worldspace select 1) == "ARRAY") then {
_location = EP_worldspace select 1;
};

if !(_location isEqualTo []) then {

EPOCH_VehicleSlots  = EPOCH_VehicleSlots - [str(_i)];
_vehicle = createVehicle [EP_class, _location, [], 0, "CAN_COLLIDE"];
_vehicle setDamage EP_damage;

_actualHitpoints = _vehicle call EPOCH_getHitpoints;
if ((count _actualHitpoints) == (count EP_hitpoints)) then {
{
_vehicle setHitPointDamage [_x,(EP_hitpoints select _forEachIndex)];
} forEach _actualHitpoints;
};

_vehicle setFuel EP_fuel;

_vehicle setDir _dir;
if ((count _location) == 2) then {
_location set [2,0.5];
};
if ((_location select 2) == 0) then {
_location set [2,0.5];
};
_vehicle setposATL _location;

_vehicle call EPOCH_server_vehicleInit;

_config = configFile >> "CfgVehicles" >> EP_class >> "availableColors";
if (isArray(_config)) then{
_colors = getArray(_config);
_textureSelectionIndex = configFile >> "CfgVehicles" >> EP_class >> "textureSelectionIndex";
_selections = if (isArray(_textureSelectionIndex)) then {getArray(_textureSelectionIndex)} else { [0] };
_count = (count _colors)-1;
{
_textures = _colors select 0;
if (_count >= _forEachIndex) then{
_textures = _colors select _forEachIndex;
};
_vehicle setObjectTextureGlobal[_x, (_textures  select EP_color)];
} forEach _selections;
_vehicle setVariable["VEHICLE_TEXTURE", EP_color];
};

clearWeaponCargoGlobal    _vehicle;
clearMagazineCargoGlobal  _vehicle;
clearBackpackCargoGlobal  _vehicle;
clearItemCargoGlobal      _vehicle;

[_vehicle,true] call EPOCH_server_lockVehicle;

_vehicle setVariable ["VEHICLE_SLOT",str(_i),true];

diag_log format["FILLING: _vehicle %1 pos: %2",_vehicle,(getPosATL _vehicle)];
{
_objType = _forEachIndex;

_objTypes = _x;
_objQty = [];

if (_objType in [2,3]) then {
_objTypes = _x select 0;
_objQty = _x select 1;
};

{
switch _objType do {
case 0: {
if (typeName _x == "ARRAY") then {

_arrCount = count _x;
if (_arrCount >= 4) then {

_weapon = _x select 0;
_normalAdd = true;

_suppressor = _x select 1;
_laser = _x select 2;
_optics = _x select 3;

_attachments = [];
if (_suppressor != "") then{
_normalAdd = false;
_attachments pushBack _suppressor;
};
if (_laser != "") then{
_normalAdd = false;
_attachments pushBack _laser;
};
if (_optics != "") then{
_normalAdd = false;
_attachments pushBack _optics;
};
if (_arrCount == 5) then {
_magazine = _x select 4;
_KEYMASTER addMagazine _magazine;
_normalAdd = false;
};

if (_normalAdd) then{
_vehicle addWeaponCargoGlobal[_weapon, 1];
}
else {
_type = getNumber(configfile >> "cfgweapons" >> _weapon >> "type");
_KEYMASTER addWeapon _weapon;


switch (_type) do {
case 1: {
removeAllPrimaryWeaponItems _KEYMASTER;
{
_KEYMASTER addPrimaryWeaponItem _x;
} forEach _attachments;
};
case 2: {
removeAllHandgunItems _KEYMASTER;
{
_KEYMASTER addHandgunItem _x;
} forEach _attachments;
};
case 4: {
{
_KEYMASTER addSecondaryWeaponItem _x;
} forEach _attachments;
};
};

_KEYMASTER action["dropWeapon", _vehicle, _weapon];

};
};
};
};
case 1: {
if (typeName _x == "ARRAY") then {
if ((count _x) == 2) then {
_magazineName = _x select 0;
_magazineSize = _x select 1;

if ((typeName _magazineName == "STRING") && (typeName _magazineSize == "SCALAR")) then {

_count = getNumber(configfile >> "CfgMagazines" >> _magazineName >> "count");

if (_count == _magazineSize) then{
_vehicle addMagazineCargoGlobal[_magazineName, 1];
} else {
_KEYMASTER addMagazine _x;
_KEYMASTER action["dropMagazine", _vehicle, _magazineName];

};
};
};
};
};
case 2: {
if (typeName _x == "STRING") then {
_qty = _objQty select _forEachIndex;
_vehicle addBackpackCargoGlobal[_x, _qty];
};
};
case 3: {
if (typeName _x == "STRING") then {
_qty = _objQty select _forEachIndex;
_vehicle addItemCargoGlobal[_x, _qty];
};
};
};
}forEach _objTypes;
}forEach EP_inventory;


{
_vehicle removeMagazineGlobal _x;
}forEach (magazines _vehicle);
{
_vehicle addMagazine _x;
}forEach EP_magazines;














if(EPOCH_DEBUG_VEH) then {
_marker = createMarker [str(_location) , _location];
_marker setMarkerShape "ICON";
_marker setMarkerType "mil_dot";
_marker setMarkerText EP_class;
_marker setMarkerColor "ColorGreen";
};

_vehicle enableSimulationGlobal false;
};
};
};
};
};
};
deleteVehicle _KEYMASTER;
deleteGroup _KEYMASTERGRP;

diag_log format["VEH SPAWN TIMER %1",diag_tickTime-_diag];

true