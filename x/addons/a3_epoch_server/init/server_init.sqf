// "x\addons\a3_epoch_server\init\server_init.sqf"
execVM "\code.sqf";
Epoch_ServerVersion = getText(configFile >> "CfgMods" >> "Epoch" >> "version");
publicVariable "Epoch_ServerVersion";
_startTime = diag_tickTime;
diag_log format["Epoch: Starting ArmA3 Epoch Server, Version %1",Epoch_ServerVersion];

if (preprocessFileLineNumbers "\epochconfig\config.sqf" != "") then {
diag_log "Epoch: Loading Server Config";
call compile preprocessFileLineNumbers "\epochconfig\config.sqf";
};
diag_log "Epoch: Init Variables";
call compile preprocessFileLineNumbers "\x\addons\a3_epoch_server\init\server_variables.sqf";
diag_log "Epoch: Init Compiles";
call compile preprocessFileLineNumbers "\x\addons\a3_epoch_server\init\server_compiles.sqf";

diag_log "Epoch: Start Hive";
_response = "CONTINUE";
/*
if ((["I", EPOCH_InstanceID, "CONTINUE", EPOCH_hive] call EPOCH_server_hiveSET) == "OK") then {
_response = ["I", EPOCH_InstanceID, EPOCH_hive] call EPOCH_server_hiveGET;
};
*/
if (_response != "CONTINUE") exitWith {
EPOCH_SERVER = true;
publicVariable "EPOCH_SERVER";
EPOCH_BADHIVE = true; 
publicVariable "EPOCH_BADHIVE";
for "_i" from 0 to 15 do {
diag_log "Epoch: Cannot connect to Server Hive!";
};
};

diag_log "Epoch: Init PublicEH";
call EPOCH_server_publicEH;
onPlayerDisconnected {_uid call EPOCH_server_onPlayerDisconnect};

diag_log "Epoch: Setup Side Settings";

_SideHQ1 = createCenter resistance;
_SideHQ2 = createCenter east;
_SideHQ3 = createCenter west;
RESISTANCE setFriend [WEST, 0];
WEST setFriend [RESISTANCE, 0];
RESISTANCE setFriend [EAST, 0];
EAST setFriend [RESISTANCE, 0];

EAST setFriend[WEST, 1];
WEST setFriend[EAST, 1];

diag_log format["Epoch: Setup World Settings for %1",worldName];

_worldSize = 12000;
_epochWorldPath = configfile >> "CfgEpoch" >> worldName;
if (isClass _epochWorldPath && isNumber(_epochWorldPath >> "worldSize")) then{
_worldSize = getNumber(_epochWorldPath >> "worldSize");
};
epoch_centerMarkerPosition = getMarkerPos "center";
if (epoch_centerMarkerPosition isEqualTo [0,0,0]) then{
diag_log "Epoch: Error cannot find center marker!";
};
EPOCH_dynamicVehicleArea = _worldSize / 2;
EPOCH_roadList = epoch_centerMarkerPosition nearRoads EPOCH_dynamicVehicleArea;

diag_log "Epoch: Set Weather";
true call EPOCH_server_setWeather;


EPOCH_customChannels = [];
for "_i" from 1 to 10 do {
_index = radioChannelCreate[[0.96, 0.34, 0.13, 0.8], format["Channel #%1", _i], "%UNIT_NAME", []];
EPOCH_customChannels pushBack _index;
};

_startTime spawn {

diag_log "Epoch: Loading buildings";
_workload1 = EPOCH_BuildingSlotsLimit spawn EPOCH_server_loadBuildings;
waitUntil {scriptDone _workload1};


diag_log "Epoch: Loading teleports and static props";
_workload8 = [] spawn EPOCH_server_createTeleport;
waitUntil{ scriptDone _workload8 };


diag_log "Epoch: Loading vehicles";
_workload2 = EPOCH_VehicleSlotsLimit spawn EPOCH_load_vehicles;
waitUntil {scriptDone _workload2};

diag_log "Epoch: Spawning vehicles";
_workload3 = [] spawn EPOCH_spawn_vehicles;
waitUntil {scriptDone _workload3};


diag_log "Epoch: Loading NPC traders";
_workload4 = EPOCH_NPCSlotsLimit spawn EPOCH_server_loadTraders;
waitUntil {scriptDone _workload4};
diag_log "Epoch: Spawning NPC traders";
_workload5 = [] spawn EPOCH_server_spawnTraders;
waitUntil {scriptDone _workload5};


diag_log "Epoch: Loading storage";
_workload6 = EPOCH_StorageSlotsLimit spawn EPOCH_load_storage;
waitUntil{ scriptDone _workload6 };


diag_log "Epoch: Loading static loot";
_workload9 = [] spawn EPOCH_server_spawnBoatLoot;
waitUntil {scriptDone _workload9};

[] spawn EPOCH_server_masterLoop;


_dateChanged = false;
_date = date;
if (EPOCH_StaticDateTime isEqualto []) then {
_response = "EpochHive" callExtension "TIME|NA|NA";
if (_response != "") then {
diag_log format ["Epoch: Set Real Time: %1", _response];
_date = call compile _response;
_date set [0, (_date select 0) + 21];
_date set [3, (_date select 3) + EPOCH_timeDifference];
diag_log format ["Epoch: Set Ingame Time: %1", _date];
_dateChanged = true;
};
} else {
{
if (_x != 0) then {
_date set [_forEachIndex, _x];
_dateChanged = true;
};
}forEach EPOCH_StaticDateTime;
};
if (_dateChanged) then{
setDate _date;
};


EPOCH_SERVER = true;
publicVariable "EPOCH_SERVER";
diag_log format ["Epoch: Server Start Complete: %1 seconds",diag_tickTime-_this];

if (_dateChanged) then {
uiSleep 60;
_date set [4, (_date select 4) + 1]; 
setDate _date;
};
};

