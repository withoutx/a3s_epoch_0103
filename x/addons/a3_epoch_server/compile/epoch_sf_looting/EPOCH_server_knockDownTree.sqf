// "x\addons\a3_epoch_server\compile\epoch_sf_looting\EPOCH_server_knockDownTree.sqf"
private["_posWH", "_item", "_nearbyWH"];
if !(_this isKindOf "All") then{
if (alive _this) then{
_posWH = getPosATL _this;
_posWH set[2, 0];
_this setdamage((damage _this) + 0.25) min 1;
_nearbyWH = nearestObjects[_posWH, ["groundWeaponHolder"], 2];
if !(_nearbyWH isEqualTo []) then{
_posWH = getPosATL (_nearbyWH select 0);
(_nearbyWH select 0) addMagazineCargoGlobal["WoodLog_EPOCH", 1];
} else {
_item = createVehicle["groundWeaponHolder", _posWH, [], 0, "CAN_COLLIDE"];
_item setPosATL _posWH;
_item addMagazineCargoGlobal["WoodLog_EPOCH", 1];
};
};
};
true