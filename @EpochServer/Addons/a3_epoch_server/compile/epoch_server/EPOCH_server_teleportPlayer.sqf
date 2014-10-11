// "x\addons\a3_epoch_server\compile\epoch_server\EPOCH_server_teleportPlayer.sqf"
private ["_player","_teleporter","_pos","_telePosArray"];

_player = _this select 0;
_teleporter = _this select 1;

if (!isNull _player) then {
_telePosArray = getArray(configFile >> "CfgEpoch" >> worldName >> "oneWayTelePos");
if (count _telePosArray >= _teleporter) then {
_pos = _telePosArray select _teleporter;
_player setPosATL (_pos select 1);
};
};