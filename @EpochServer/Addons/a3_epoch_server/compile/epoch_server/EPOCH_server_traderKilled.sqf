// "x\addons\a3_epoch_server\compile\epoch_server\EPOCH_server_traderKilled.sqf"
private ["_objHiveKey","_VAL","_slot"];
if (!isNull (_this select 0)) then{
_slot = (_this select 0) getVariable["AI_SLOT", -1];

if (_slot != -1) then{

[(_this select 1), 0] call EPOCH_server_triggerEvent;

_objHiveKey = format["%1:%2", EPOCH_InstanceID, _slot];
_VAL = false;
["AI", _objHiveKey, _VAL, EPOCH_hive] call EPOCH_server_hiveSET;
};
};