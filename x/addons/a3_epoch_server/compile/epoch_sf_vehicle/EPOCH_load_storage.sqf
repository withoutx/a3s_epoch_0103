// "x\addons\a3_epoch_server\compile\epoch_sf_vehicle\EPOCH_load_storage.sqf"
private ["_forEachIndex","_objTypes","_objQty","_arr","_class","_damage","_hitpoints","_fuel","_count","_inventory","_dir","_location","_vehicle","_actualHitpoints","_vehHiveKey","_response","_objType","_marker","_isAir","_isShip","_config","_magazines","_colors","_color"];


_diag = diag_tickTime;
_KEYMASTERGRP = createGroup civilian;
_KEYMASTER = _KEYMASTERGRP createUnit ["C_man_1", [(epoch_centerMarkerPosition select 0),(epoch_centerMarkerPosition select 1),0], [], 0, "CAN_COLLIDE"];
_KEYMASTER hideObjectGlobal true;
_KEYMASTER allowDammage false;
_KEYMASTER disableAI "FSM";
_KEYMASTER disableAI "MOVE";
_KEYMASTER disableAI "AUTOTARGET";
_KEYMASTER disableAI "TARGET";

_KEYMASTER addVest "V_HarnessO_brn";
_KEYMASTER addbackpack "B_FieldPack_blk";

EPOCH_StorageSlots = [];
for "_i" from 1 to _this do {
_vehHiveKey = format ["%1:%2", EPOCH_InstanceID,_i];
_response = ["S", _vehHiveKey, EPOCH_hive] call EPOCH_server_hiveGET;


if (_response != "") then {
_arr = call compile _response;

if (!isNil "_arr" && {(typeName _arr) == "ARRAY"}) then{
_class = _arr select 0;
_damage = _arr select 2;
_inventory = _arr select 3;


if (typeName (_arr select 3) == "SCALAR") then{
_inventoryStr = "";
for "_j" from 0 to (_arr select 3) - 1 do {
_vehInvHiveKey = format["%1:%2:%3", EPOCH_InstanceID, _i, _j];
_inventoryStr = _inventoryStr + (["SI", _vehInvHiveKey, EPOCH_hive] call EPOCH_server_hiveGET);
diag_log format["DEBUG: _vehInvHiveKey %1", [_vehInvHiveKey]];
};
_inventory = call compile _inventoryStr;
};

_dir = _arr select 1 select 0;
_location = _arr select 1 select 1;

_vehicle = createVehicle [_class, _location, [], 0, "CAN_COLLIDE"];
_vehicle setDamage _damage;
_vehicle setDir _dir;

diag_log format["STORAGE: created storage %1 at %2", _class, _location];

if (count _location == 2) then {
_location set [2,0];
};

_vehicle setposATL _location;

_vehicle setVariable ["STORAGE_SLOT",str(_i),true];

missionNamespace setVariable[format["EPOCH_STORAGE_%1",_i], _vehicle];

_vehicle call EPOCH_server_storageInit;

if (count _arr >= 5) then{
_color = _arr select 4;
_config = configFile >> "CfgVehicles" >> _class >> "availableColors";
if (isArray _config) then{
_colors = getArray(_config);
_textureSelectionIndex = configFile >> "CfgVehicles" >> _class >> "textureSelectionIndex";
_selections = if (isArray(_textureSelectionIndex)) then {getArray(_textureSelectionIndex)} else { [0] };
_count = (count _colors)-1;
{
_textures = _colors select 0;
if (_count >= _forEachIndex) then{
_textures = _colors select _forEachIndex;
};
_vehicle setObjectTextureGlobal[_x, (_textures  select _color)];
} forEach _selections;
_vehicle setVariable["STORAGE_TEXTURE", _color];
};
};

if (count _arr >= 6) then{
_vehicle setVariable["STORAGE_OWNERS", _arr select 5];

if (_class == "LockBoxProxy_EPOCH") then{

if ((_arr select 6) != -1) then{
_vehicle setVariable["EPOCH_secStorParent", _arr select 6];
_location set[2, -10];
_vehicle setPosATL _location;
};
};
};

clearWeaponCargoGlobal    _vehicle;
clearMagazineCargoGlobal  _vehicle;
clearBackpackCargoGlobal  _vehicle;
clearItemCargoGlobal	  _vehicle;

if !(_inventory isEqualTo []) then{

diag_log format["FILLING: storage %1 pos: %2",_vehicle,(getPosATL _vehicle)];
{
_objType = _forEachIndex;

_objTypes = _x;
_objQty = [];

if (_objType in [2,3]) then{
_objTypes = _x select 0;
_objQty = _x select 1;
};

{

switch _objType do {
case 0: {
_weapon = _x select 0;
_normalAdd = true;

_suppressor = _x select 1;
_laser = _x select 2;
_optics = _x select 3;

_attachments = [];
if(_suppressor != "") then {
_normalAdd = false;
_attachments pushBack _suppressor;
};
if(_laser != "") then {
_normalAdd = false;
_attachments pushBack _laser;
};
if(_optics != "") then {
_normalAdd = false;
_attachments pushBack _optics;
};
if ((count _x) >= 5 ) then {
_magazine = _x select 4;
_KEYMASTER addMagazine _magazine;
_normalAdd = false;
};

if (_normalAdd) then {
_vehicle addWeaponCargoGlobal[_weapon, 1];
} else {
_type = getNumber (configfile >> "cfgweapons" >> (_weapon) >> "type");
_KEYMASTER addWeapon _weapon;
diag_log format["_KEYMASTER addweapon: %1",_weapon];

switch _type do {
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

_KEYMASTER action ["dropWeapon", _vehicle, _weapon];
diag_log format["_KEYMASTER dropweapon: %1 into %2",_weapon,_vehicle];
};

};
case 1: {
_magazineName = _x select 0;
_magazineSize = _x select 1;

_count = getNumber (configfile >> "CfgMagazines" >> _magazineName >> "count");

if (_count == _magazineSize) then {
_vehicle addMagazineCargoGlobal [_magazineName, 1];
} else {
_KEYMASTER addMagazine _x;
_KEYMASTER action ["dropMagazine", _vehicle, _magazineName];
diag_log format["_KEYMASTER dropMagazine: %1 into %2",_x,_vehicle];
};
};
case 2: {
_qty = _objQty select _forEachIndex;
_vehicle addBackpackCargoGlobal[_x, _qty];
};
case 3: {
_qty = _objQty select _forEachIndex;
_vehicle addItemCargoGlobal[_x, _qty];
};
};
}forEach _objTypes;
}forEach _inventory;
};

if(EPOCH_DEBUG_VEH) then {
_marker = createMarker [str(_location) , _location];
_marker setMarkerShape "ICON";
_marker setMarkerType "mil_dot";
_marker setMarkerText _class;
_marker setMarkerColor "ColorBlue";
};
} else {
EPOCH_StorageSlots pushBack str(_i);
};
} else {
EPOCH_StorageSlots pushBack str(_i);
};
};
deleteVehicle _KEYMASTER;
deleteGroup _KEYMASTERGRP;

EPOCH_StorageSlotsCount = count EPOCH_StorageSlots;
publicVariable "EPOCH_StorageSlotsCount";

_diag_fin = diag_tickTime-_diag;
diag_log format["Storage SPAWN TIMER %1",_diag_fin];

true