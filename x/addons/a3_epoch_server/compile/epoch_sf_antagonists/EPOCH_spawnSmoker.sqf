// "x\addons\a3_epoch_server\compile\epoch_sf_antagonists\EPOCH_spawnSmoker.sqf"
private ["_xpos","_ypos","_zpos","_location","_wpIndex","_canSee","_targetPos","_target","_uavPos","_nearPlayers","_nearPlayersCount","_uav","_group","_uavRadius","_uavRange"];
_uav = createVehicle [_this select 0, (getPos (_this select 1)), [], 100, "NONE"];
createVehicleCrew _uav;
_group = group _uav;

_uavPos = getPosATL _uav;
_uavRadius = 50;
_wpIndex  = 0;
_uavRange = 250;

for "_i" from 0 to 360 step (270 / _uavRadius) do {
_xpos = (_uavPos select 0) + ((cos _i) * _uavRadius);
_ypos = (_uavPos select 1) + ((sin _i) * _uavRadius);
_zpos = _uavPos select 2;
_location = [_xpos,_ypos,_zpos];
_group addWaypoint [_location, _wpIndex];
_wpIndex = _wpIndex + 1;
};
while {alive _uav} do {

_uavPos = getPosATL _uav;
_nearPlayers = _uavPos nearEntities[["Epoch_Male_F", "Epoch_Female_F"], _uavRange];
_nearPlayersCount = count _nearPlayers;

if ((_nearPlayersCount) > 0) then {
_target = _nearPlayers select (floor(random(_nearPlayersCount)));

if (isPlayer _target) then {
_targetPos = getPosATL _target;
_wpIndex  = 0;
for "_i" from 0 to 360 step (270 / _uavRadius) do {
_xpos = (_targetPos select 0) + ((cos _i) * _uavRadius);
_ypos = (_targetPos select 1) + ((sin _i) * _uavRadius);
_zpos = _targetPos select 2;
_location = [_xpos,_ypos,_zpos];
_group addWaypoint [_location, _wpIndex];

_wpIndex = _wpIndex + 1;
};
if ((_target distance _uav) < 100) then {
_canSee = lineIntersects [eyePos _target, aimPos _uav, _target, _uav];
if (!_canSee) then {

};
};
};
};
sleep 60;
};