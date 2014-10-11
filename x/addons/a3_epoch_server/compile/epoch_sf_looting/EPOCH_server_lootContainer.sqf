// "x\addons\a3_epoch_server\compile\epoch_sf_looting\EPOCH_server_lootContainer.sqf"
private ["_class","_pos","_dir","_object","_whConfig","_type","_lootClasses","_player"];

_object = _this;
if (!isNull _object) then {
if !(_object getVariable ["LOOTED",false]) then {
_object setVariable ["LOOTED",true];

_type = typeOf _object;
if (_type in ["Shelf_EPOCH","Bed_EPOCH","Couch_EPOCH","Chair_EPOCH","ChairRed_EPOCH","Filing_EPOCH","Table_EPOCH","ToolRack_EPOCH"]) then {
if (local _object) then {
_player = (getPosATL _object) nearEntities [["Epoch_Male_F","Epoch_Female_F"], 30];
if (_player isEqualTo []) then {
_player = (getPosATL _object) nearEntities [["Epoch_Male_F","Epoch_Female_F"], 150];
};
if !(_player isEqualTo []) then {
_object setOwner (owner (_player select 0));
_object spawn {
sleep 0.5;
_this setDamage 1;
sleep 2;
_this enableSimulationGlobal false;
};
};
} else {
_object setDamage 1;
};
};

_lootClasses = [] + getArray (configFile >> "CfgVehicles" >> _type >> "availableLootClasses");
if !(_lootClasses isEqualTo []) then{
_whConfig = configFile >> "CfgVehicles" >> _type >> "weaponHolderProxy";
_maxLoot = getNumber(configFile >> "CfgVehicles" >> _type >> "maxloot");
if (isText _whConfig) then {
_class = getText (_whConfig);
_pos = getPosATL _object;
_dir = getDir _object;
_object = createVehicle [_class, _pos, [], 0.0, "CAN_COLLIDE"];
_object setDir _dir;
_object setPosATL _pos;
};
if (_maxLoot == 0) then{_maxLoot = 2};
[_object,_lootClasses,_maxLoot] call EPOCH_serverLootObject;
} else {
[_object,["Food"],2] call EPOCH_serverLootObject;
};


if ((random 1) <= 0.05) then {

_triggerType = floor(random 3);
if (_class == "container_epoch") then {
_triggerType = 3;
};
_player = (getPosATL _object) nearEntities [["Epoch_Male_F","Epoch_Female_F"], 30];
if (_player isEqualTo []) then {
_player = (getPosATL _object) nearEntities [["Epoch_Male_F","Epoch_Female_F"], 150];
};
if !(_player isEqualTo []) then {
[_player select 0,_triggerType] call EPOCH_server_triggerEvent;
};
};
};
};