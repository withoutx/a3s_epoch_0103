// "x\addons\a3_epoch_server\compile\epoch_sf_player\EPOCH_server_storeCrypto.sqf"
private["_pos", "_veh", "_crypto2", "_plyr"];
_plyr = _this select 0;
if !(isNull _plyr) then{
_crypto2 = _plyr getVariable["Crypto", 0];
if (_crypto2 > 0) then{
_pos = getposATL _plyr;
_veh = createVehicle["Land_MPS_EPOCH", _pos, [], 1.0, "CAN_COLLIDE"];
diag_log format["ADMIN: Crypto Device with 1:%1 2:%2 at %3", (_this select 1), _crypto2, _pos];
_veh setVariable["Crypto", _crypto2, true];
};
};