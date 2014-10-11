// "x\addons\a3_epoch_server\compile\epoch_sf_traders\EPOCH_server_spawnTraders.sqf"
private["_position", "_marker", "_slot", "_aiTables", "_randomIndex", "_randomAIClass", "_agent", "_building", "_home", "_nearestCity", "_buildings", "_work", "_id", "_objHiveKey", "_VAL", "_return", "_buildingPosition", "_startTime", "_endTime", "_schedule", "_acceptableBlds", "_homeBuildingPosition", "_pos", "_buildingWork", "_buildingPositions", "_VAL1", "_homeBuildingPositions"];

_counter = 0;
while {true} do {

if (_counter >= EPOCH_NPCSlotsLimit) exitWith{};

_slot = EPOCH_TraderSlots find 0;
if (_slot == -1) exitWith{};

_counter = _counter + 1;

_position = [epoch_centerMarkerPosition, 0, EPOCH_dynamicVehicleArea, 20, 0, 4000, 0] call BIS_fnc_findSafePos;


if (count _position == 2) then{
_aiTables = ["C_man_1", "C_man_1_1_F", "C_man_1_2_F", "C_man_1_3_F", "C_man_polo_1_F", "C_man_polo_2_F", "C_man_polo_3_F","C_man_polo_1_F_euro","C_man_polo_2_F_afro","C_man_p_fugitive_F","C_scientist_F","C_man_hunter_1_F"];
_randomIndex = floor(random(count _aiTables));
_randomAIClass = _aiTables select _randomIndex;

_usedBuildings = [];


_building = nearestBuilding _position;

if !(_building in _usedBuildings) then {

_home = getPosATL _building;
_pos = _home;		

_usedBuildings pushBack _building;

_homeBuildingPositions = [];
for "_p" from 0 to 20 do {
_homeBuildingPosition = _building buildingPos _p;
if (_homeBuildingPosition isEqualTo[0, 0, 0]) exitWith{};
_homeBuildingPositions pushBack _homeBuildingPosition;
};
if !(_homeBuildingPositions isEqualTo []) then{
_home = _homeBuildingPositions select floor(random(count _homeBuildingPositions));
};

_acceptableBlds = ["Land_Kiosk_blueking_F", "Land_FuelStation_Build_F", "Land_CarService_F", "Land_i_Garage_V1_F", "Land_i_Shed_Ind_F", "Land_i_Shop_01_V1_F"];
_buildings = nearestObjects[_home, _acceptableBlds, 500];

if !(_buildings isEqualTo []) then{

_buildingWork = _buildings select floor(random(count _buildings));

if !(_buildingWork in _usedBuildings) then {

_usedBuildings pushBack _building;

_work = getPosATL _buildingWork;

_buildingPositions = [];
for "_p" from 0 to 20 do {
_buildingPosition = _buildingWork buildingPos _p;
if (_buildingPosition isEqualTo[0, 0, 0]) exitWith{};
_buildingPositions pushBack _buildingPosition;
};

if !(_buildingPositions isEqualTo []) then{
_work = _buildingPositions select floor(random(count _buildingPositions));
};

_startTime = floor(random 16);
_endTime = _startTime + 8;
_schedule = [_startTime, _endTime];

if (daytime > (_schedule select 0) && daytime < (_schedule select 1)) then{
_pos = _work;
};

_agent = createAgent[_randomAIClass, _pos, [], 0, "CAN_COLLIDE"];

EPOCH_TraderSlots set[_slot, 1];


_agent setVariable["AI_SLOT", _slot, true];
_agent setVariable["AI_ITEMS", [[], []]];
_objHiveKey = format["%1:%2", EPOCH_InstanceID, _slot];

_VAL1 = [[], []];
_return = ["AI_ITEMS", _objHiveKey, _VAL1, EPOCH_hive] call EPOCH_server_hiveSET;

if (EPOCH_forceStaticTraders) then{
_agent addEventHandler["Killed", { _this call EPOCH_server_traderKilled; }];
} else {
_agent addEventHandler["Killed", { _this call EPOCH_server_traderKilled; }];
_id = [_agent, _home, [_work, _schedule]] execFSM "\x\addons\a3_epoch_server\system\Trader_brain.fsm";
};

_VAL = [_randomAIClass, _home, [_work, _schedule]];
_return = ["AI", _objHiveKey, _VAL, EPOCH_hive] call EPOCH_server_hiveSET;

if (EPOCH_SHOW_TRADERS) then{
_marker = createMarker[str(_pos), (_pos)];
_marker setMarkerShape "ICON";
_marker setMarkerType "mil_dot";
_marker setMarkerColor "ColorBlack";
};
};
};
};
};
};
true