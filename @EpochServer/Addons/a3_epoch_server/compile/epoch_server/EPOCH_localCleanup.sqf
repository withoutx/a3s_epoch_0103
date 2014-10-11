// "x\addons\a3_epoch_server\compile\epoch_server\EPOCH_localCleanup.sqf"
_target = _this;
if (typename _this == "ARRAY") then{
_target = _this select 0;
};
if (!isNull _target) then{
_target addEventHandler["local", {
if (_this select 1) then {
private["_unit"];
_unit = _this select 0;
{
_unit removeAllMPEventHandlers _x;
}forEach ["mpkilled","mphit","mprespawn"];
{
_unit removeAllEventHandlers _x;
}forEach ["FiredNear","HandleDamage","Killed","Fired","GetOut","GetIn","Local"];
deleteVehicle _unit;
deleteGroup (group _unit);
};
}];
};