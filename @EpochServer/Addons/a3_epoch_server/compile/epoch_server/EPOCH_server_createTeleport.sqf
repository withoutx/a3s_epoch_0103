// "x\addons\a3_epoch_server\compile\epoch_server\EPOCH_server_createTeleport.sqf"
private ["_pos1","_pos","_veh","_veh1","_veh2"];
_config = configFile >> "CfgEpoch";
{
_pos1 = _x select 0;
_pos = _x select 1;
_veh = createVehicle ["Land_i_Shed_Ind_F", _pos, [], 0, "NONE"];
_veh setposATL _pos;
_veh1 = createVehicle ["Transport_EPOCH", _pos1, [], 0, "CAN_COLLIDE"];
_veh1 enableSimulationGlobal false;
_veh1 allowDamage false;
_veh1 setVariable ["ParentBuilding",_pos,true];
_veh1 setposATL _pos1;
_pro1 = createVehicle ["ProtectionZone_Invisible_F", _pos1, [], 0, "CAN_COLLIDE"];
_veh2 = createVehicle ["Transport_EPOCH", _pos, [], 0, "CAN_COLLIDE"];
_veh2 enableSimulationGlobal false;
_veh2 allowDamage false;
_pro2 = createVehicle ["ProtectionZone_Invisible_F", _pos, [], 0, "CAN_COLLIDE"];
_veh2 setVariable ["ParentBuilding",_pos1,true];
_veh2 setposATL _pos;
} foreach (getArray (_config >> worldname >> "telePos"));


{
_class = _x select 0;
_pos = _x select 1;
_dir = _x select 2;
_ep = createVehicle[_class, _pos, [], 0, "CAN_COLLIDE"];
if (_class isKindOf "ThingX") then{
_ep enableSimulationGlobal false;
};
_ep allowDamage false;

_ep setDir _dir;
_ep setposATL _pos;
} forEach (getArray(_config >> worldname >> "propsPos"));

{
_pos1 = _x select 0;
_pos = _x select 1;
_pro1 = createVehicle ["ProtectionZone_Invisible_F", _pos1, [], 0, "CAN_COLLIDE"];
_veh1 = createVehicle["Transport_EPOCH", _pos1, [], 0, "CAN_COLLIDE"];
_veh1 enableSimulationGlobal false;
_veh1 allowDamage false;
_veh1 setVariable["ParentBuilding", _forEachIndex, true];
_veh1 setDir 0;
_veh1 setposATL _pos1;
_pro2 = createVehicle ["ProtectionZone_Invisible_F", _pos, [], 0, "CAN_COLLIDE"];
} foreach (getArray(_config >> worldname >> "oneWayTelePos"));
