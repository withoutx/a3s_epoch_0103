// "x\addons\a3_epoch_server\compile\epoch_sf_vehicle\EPOCH_save_storage.sqf"
private ["_vehicle","_class","_vehSlot","_vehHiveKey","_damage","_fuel","_pos","_dir","_worldspace","_hitpoints","_actualHitpoints","_inventory","_VAL","_return","_magazines","_colorSlot"];
if (!isNull _this) then{
_vehicle = _this;

_class = typeOf _vehicle;
_vehSlot = _vehicle getVariable["STORAGE_SLOT", "ABORT"];
if (_vehSlot != "ABORT") then{

_vehHiveKey = format ["%1:%2", EPOCH_InstanceID,_vehSlot];
_damage = damage _vehicle;

_pos = getPosATL _vehicle;
_dir = getDir _vehicle;
_worldspace = [_dir,_pos];

_inventory = [
(weaponsItemsCargo _vehicle),
(magazinesAmmoCargo _vehicle),
getBackpackCargo _vehicle,
getItemCargo _vehicle
];

_colorSlot = _vehicle getVariable ["STORAGE_TEXTURE",0];

_storageOwners = _vehicle getVariable["STORAGE_OWNERS",[]];
_storageParent = _vehicle getVariable["EPOCH_secStorParent",-1];





_invChars = toArray(str(_inventory));
_charCount = count _invChars;

_shardCount = 1;
if (_charCount > EPOCH_hiveCharLimit) then {
_shardCount = ceil(_charCount / EPOCH_hiveCharLimit);
};

_partsArray = [];
for "_i" from 1 to _shardCount do { 
_partsArray pushBack [];
};

{
_shardIndex = floor(_forEachIndex / EPOCH_hiveCharLimit);
(_partsArray select _shardIndex) pushBack _x;
} foreach _invChars;

{
_vehInvHiveKey = format["%1:%2:%3", EPOCH_InstanceID, _vehSlot, _forEachIndex];
["SI", _vehInvHiveKey, toString(_x), EPOCH_hive] call EPOCH_server_hiveSET;
} foreach _partsArray;

_VAL = [_class, _worldspace, _damage, _shardCount, _colorSlot, _storageOwners, _storageParent];
["S", _vehHiveKey, _VAL, EPOCH_hive] call EPOCH_server_hiveSET;

diag_log format["STORAGE: saved to hive %1 Pos %2 Owners %3 Parent %4", _class, _worldspace, _storageOwners, _storageParent];
};

};