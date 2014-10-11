// "x\addons\a3_epoch_server\compile\epoch_sf_player\EPOCH_server_revivePlayer.sqf"
private ["_hitpoints","_appearance","_plyr","_plyrUID","_forEachIndex","_vars","_items","_push","_class","_dir","_location","_type","_magazine","_weapon","_suppressor","_laser","_optics","_attachments","_currWeap","_itemSlot","_itemqtys","_actualHitpoints","_var","_pos","_bleeding","_goggles","_headgear","_vest","_backpack","_uniform","_appearance","_weaponsItems","_weapons","_magazinesAmmo","_itemsplayer","_uniformW","_vestW","_backpackW","_weaponsplayer","_group"];
_plyr = _this;
_owner = owner _plyr;

diag_log format["DEBUG server_revivePlayer : %1", _this];

if (!isNull _plyr && !local _plyr) then {
_plyrUID = getPlayerUID _plyr;
if (!isNil "_plyrUID" && !alive _plyr) then {

_class = typeOf _plyr;

if (_class in ["Epoch_Male_F", "Epoch_Female_F"]) then{


if (_plyr getVariable["REVIVE", true]) then {


_location = getPosATL _plyr;
_dir = getDir _plyr;
_plyrGroup = _plyr getVariable["GROUP", ""];

_goggles = goggles _plyr;
_headgear = headgear _plyr;
_vest = vest _plyr;
_backpack = backpack _plyr;
_uniform = uniform _plyr;

_items = assignedItems _plyr;
_magazinesAmmo = magazinesAmmo _plyr;

_primaryWeapon = "";
_secondaryWeapon = "";

_droppedWeapons = [];
{
{
_droppedWeapons pushBack _x;
_type = getNumber(configfile >> "cfgweapons" >> (_x select 0) >> "type");
switch _type do {
case 1: { _primaryWeapon = _x select 0 };
case 4: { _secondaryWeapon = _x select 0 };
};
} forEach (weaponsItemsCargo _x);

} forEach nearestObjects[_plyr, ["WeaponHolderSimulated"], 2];

diag_log ["DEBUG: _droppedWeapons %1", _droppedWeapons];

_itemsplayer = [getItemCargo(uniformContainer _plyr), getItemCargo(vestContainer _plyr), getItemCargo(backpackContainer _plyr)];
_weaponsplayer = [getWeaponCargo(uniformContainer _plyr), getWeaponCargo(vestContainer _plyr), getWeaponCargo(backpackContainer _plyr)];
_weapons = [currentWeapon _plyr, ((weaponsItems _plyr) + _droppedWeapons), [_primaryWeapon, _secondaryWeapon, handgunWeapon _plyr]];

hideObjectGlobal _plyr;


_group = grpNull;
if (_plyrGroup != "") then {
{
if ((_x getVariable["GROUP",""]) == _plyrGroup) exitWith {
_group = group _x;
};
}forEach playableUnits;

if (isNull _group) then{
_group = createGroup west;
};

diag_log format["DEBUG Group Found: %1", _group];
} else {
_group = createGroup west;
diag_log format["DEBUG Group Created: %1", _group];
};

_newPlyr = _group createUnit[_class, _location, [], 0, "CAN_COLLIDE"];

_newPlyr allowDammage false;
{
_newPlyr disableAI _x;
}forEach["FSM", "MOVE", "AUTOTARGET", "TARGET"];

_newPlyr setVariable ["SETUP", true];
_newPlyr setVariable ["PUID", _plyrUID];
_newPlyr setVariable ["GROUP", _plyrGroup];
_newPlyr setVariable ["REVIVE", false];



_newPlyr setDir _dir;
_newPlyr setPosATL _location;


_newPlyr setFatigue 1;
_newPlyr setDamage 0.25;


if (_uniform != "") then{
_newPlyr addUniform _uniform;
};
if (_backpack != "") then{
_newPlyr addBackpack _backpack;
};
if (_goggles != "") then{
_newPlyr addGoggles _goggles;
};
if (_headgear != "") then{
_newPlyr addHeadgear _headgear;
};
if (_vest != "") then{
_newPlyr addVest _vest;
};


if (count _weapons >= 2) then {

_equipped = _weapons select 2;
{
_weapon = _x select 0;
_type = getNumber(configfile >> "cfgweapons" >> _weapon >> "type");

_attachments = [];

for "_a" from 1 to 3 do {
_attachment = _x select _a;
if (_attachment != "") then{
_attachments pushBack _attachment;
};
};
_wMags = (count _x) == 5;



if (_weapon in _equipped) then{
_equipped = _equipped - [_weapon];

if (_wMags) then{
_newPlyr addMagazine(_x select 4);
};

if (_weapon != "") then {
_newPlyr addWeapon _weapon;
};

switch _type do {
case 1: { 
removeAllPrimaryWeaponItems _newPlyr;
{ _newPlyr addPrimaryWeaponItem _x }forEach _attachments;
};
case 2:	{ 
removeAllHandgunItems _newPlyr;
{ _newPlyr addHandgunItem _x }forEach _attachments;
};
case 4:	{ 

{ _newPlyr addSecondaryWeaponItem _x }forEach _attachments;
};
};
} else {
{
_newPlyr addItem _x;
}forEach _attachments;

if (_wMags) then{
_newPlyr addMagazine(_x select 4);
};
};

} forEach (_weapons select 1);

_currWeap = (_weapons select 0);

};


{
if (_x in ["Binocular","Rangefinder"]) then {
_newPlyr addWeapon _x;
} else {
_newPlyr linkItem _x;
};
}forEach _items;



{
_itemSlot = _forEachIndex;
_itemqtys = _x select 1;
{
for "_i" from 1 to (_itemqtys select _forEachIndex) do {
switch _itemSlot do {
case 0: { _newPlyr addItemToUniform _x };
case 1: { _newPlyr addItemToVest _x };
case 2: { _newPlyr addItemToBackpack _x };
};

};

}forEach (_x select 0);
}forEach _itemsplayer;


{
_itemSlot = _forEachIndex;
_itemqtys = _x select 1;
{
for "_i" from 1 to (_itemqtys select _forEachIndex) do {
switch _itemSlot do {
case 0: { _newPlyr addItemToUniform _x };
case 1: { _newPlyr addItemToVest _x };
case 2: { _newPlyr addItemToBackpack _x };
};

};

}forEach (_x select 0);
}forEach _weaponsplayer;


{
_newPlyr addMagazine _x;

}forEach _magazinesAmmo;


EPOCH_clientRevive_PVC = _newPlyr;
_owner publicVariableClient "EPOCH_clientRevive_PVC";


};
};
};
};