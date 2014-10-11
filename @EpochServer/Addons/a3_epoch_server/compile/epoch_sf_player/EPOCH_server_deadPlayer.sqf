// "x\addons\a3_epoch_server\compile\epoch_sf_player\EPOCH_server_deadPlayer.sqf"
private["_playerObj", "_pos", "_veh", "_krypto"];
_playerObj = _this select 0;
_krypto = _this select 1;
_killer = _this select 2;

if (!isNull _playerObj) then{
if (_playerObj != _killer) then{
if (random 1 <= 0.5) then{
[_killer, 2] call EPOCH_server_triggerEvent;
};
};
if (_krypto > 0) then{
_pos = getposATL _playerObj;
_veh = createVehicle["Land_MPS_EPOCH", _pos, [], 1.5, "CAN_COLLIDE"];
diag_log format["ADMIN: Created crypto device for %1 with %2 at %3", getPlayerUID _playerObj, _krypto, _pos];
_veh setVariable["Crypto", _krypto, true];
};
[_playerObj, EPOCH_defaultVars_SVar] call EPOCH_server_savePlayer;
};
