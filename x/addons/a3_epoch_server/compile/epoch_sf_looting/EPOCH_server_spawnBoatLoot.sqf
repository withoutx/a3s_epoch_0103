// "x\addons\a3_epoch_server\compile\epoch_sf_looting\EPOCH_server_spawnBoatLoot.sqf"
private ["_item"];
{

if ((random 1) <= 0.4) then {
_item = createVehicle["container_epoch", _x, [], 0, "NONE"];
_item setMass 220;
};
} foreach (getArray (configFile >> "CfgEpoch" >> worldname >> "containerPos"));