// "x\addons\a3_epoch_server\compile\epoch_server\EPOCH_server_masterLoop.sqf"
_lastWeatherChange = diag_tickTime;
_lastGroupClean = diag_tickTime;
_lastPlayerUpdate = diag_tickTime;
_prevPlayers = [];

[] execFSM "\x\addons\a3_epoch_server\system\Vehicle_Simulation.fsm";

while {true} do {

_currentTime = diag_tickTime;

if ((_currentTime - _lastWeatherChange) >= EPOCH_WeatherChangeTime) then{
false call EPOCH_server_setWeather;
_lastWeatherChange = _currentTime;

_position = [epoch_centerMarkerPosition,0,EPOCH_dynamicVehicleArea,10,0,1000,0] call BIS_fnc_findSafePos;
if ((count _position) == 2) then {
_plyrsNearEpicenter = _position nearEntities[["Epoch_Male_F", "Epoch_Female_F"], 1000];

if !(_plyrsNearEpicenter isEqualTo []) then {
EPOCH_earthQuake_PVC = _position;
{
(owner _x) publicVariableClient "EPOCH_earthQuake_PVC";
}forEach _plyrsNearEpicenter;

if (random 1 < 0.3) then{
_randomIndex = floor(random(count EPOCH_minerals));
_item = createVehicle[(EPOCH_minerals select _randomIndex), _position, [], 0.0, "CAN_COLLIDE"];
};

if (EPOCH_showEarthQuakes) then {
_marker = createMarker[str(_position), _position];
_marker setMarkerShape "ICON";
_marker setMarkerType "mil_dot";
_marker setMarkerText "Epicenter";
_marker setMarkerColor "ColorRed";
};
} else {

_CargoPosition = [_position, 0, 1000, 10, 0, 4000, 1] call BIS_fnc_findSafePos;
if ((count _CargoPosition) == 2) then{
_item = createVehicle["Cargo_Container", _CargoPosition, [], 0.0, "CAN_COLLIDE"];

if (EPOCH_showShippingContainers) then{
_marker = createMarker[str(_CargoPosition), _CargoPosition];
_marker setMarkerShape "ICON";
_marker setMarkerType "mil_dot";
_marker setMarkerText "Shipping Container";
_marker setMarkerColor "ColorRed";
};
};
};
};
};

uiSleep 1;
};