// "x\addons\a3_epoch_server\compile\epoch_sf_looting\EPOCH_server_destroyTrash.sqf"
private [];
if (!(_this isKindOf "All")) then{
if (alive _this) then {
_this spawn {

private ["_pos","_anvil","_posWH","_JIP_FIX","_item"];
_posWH = ASLtoATL (getPosASL _this);












_this setdamage 1;

_item = createVehicle ["groundWeaponHolder", _posWH, [], 0.0, "CAN_COLLIDE"];
_item setPosATL _posWH;
if (random 1 < 0.33) then {
[_item, ["Items", "Items", "Equipment", "Equipment", "Pistols", "PistolAmmo", "Uniforms", "Vests", "Headgear", "Food", "Food", "Hand", "Backpack", "Generic", "Generic", "GenericLarge"], 1] call EPOCH_serverLootObject;
};

if ((random 4) <= 0.1) then {
_nearPlayers = _posWH nearEntities[["Epoch_Male_F", "Epoch_Female_F"], 50];

if (!(_nearPlayers isEqualTo [])) then{
_target = _nearPlayers select (floor(random (count _nearPlayers)));

_triggerType = floor(random 3);
[_target, _triggerType] call EPOCH_server_triggerEvent;
};
};
};
};
};
true
