// "x\addons\a3_epoch_server\compile\epoch_server\EPOCH_serverLootObject.sqf"
private ["_quan","_randomLootClass","_config","_items","_type","_randomItem","_lootTables","_object"];
_object = _this select 0;
_lootTables = _this select 1;
for "_k" from 1 to (_this select 2) do {
_randomLootClass = _lootTables select (floor(random (count _lootTables)));
_config = configFile >> "CfgLootTable" >> _randomLootClass;
_items = getArray (_config >> "items");
_type = getText (_config >> "itemType");
_randomItem = _items select (floor(random (count _items)));
_quan = 1;
if ((count _randomItem) >= 2) then {
_quan = _randomItem select 1;
};
switch _type do {
case "item": {
_object additemCargoGlobal [_randomItem select 0,_quan];
};
case "magazine": {
_object addMagazineCargoGlobal [_randomItem select 0,_quan];
};
case "backpack": {
_object addBackpackCargoGlobal [_randomItem select 0,_quan];
};
case "weapon": {
_object addWeaponCargoGlobal [_randomItem select 0,_quan];
_mags = getArray (configFile >> "CfgWeapons" >> (_randomItem select 0) >> "magazines");
if !(_mags isEqualTo []) then {
_object addMagazineCargoGlobal [_mags select 0,ceil(random 2)];	
};
};
default {
diag_log format ["%1: CASE DEFAULT WITH %1","x\addons\a3_epoch_server\compile\epoch_server\EPOCH_serverLootObject.sqf",_this];
};
};
diag_log format["DEBUG SPAWN LOOT IN VEH: %1 %2 %3 type:%4", typeOf _object,_randomLootClass, _randomItem select 0, _type];
};