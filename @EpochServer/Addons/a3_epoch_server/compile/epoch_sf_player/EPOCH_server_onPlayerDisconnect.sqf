// "x\addons\a3_epoch_server\compile\epoch_sf_player\EPOCH_server_onPlayerDisconnect.sqf"
{
if ((_x getVariable ["PUID", "0"]) == _this) exitWith{ 
[_x,_x getVariable ["VARS",[]],true] call EPOCH_server_savePlayer;
deletevehicle _x;
};
} forEach playableUnits;