// "x\addons\a3_epoch_server\compile\epoch_group\EPOCH_server_deleteGroup.sqf"








_groupID = _this; 
diag_log format ["GROUP: Delete %1",_this];

_contentArray = call compile(["G", _groupID, EPOCH_hivePlayer] call EPOCH_server_hiveGET);
if ((typeName _contentArray) == "ARRAY") then {

{
if ((_x getVariable["GROUP", ""]) == _groupID) exitWith {
Epoch_my_Group = [];
Epoch_my_GroupUID = "";
{
_x setVariable ["GROUP", nil];
(owner _x) publicVariableClient "Epoch_my_Group";
(owner _x) publicVariableClient "Epoch_my_GroupUID";
[_x] joinSilent (createGroup west);
}count (units group _x);
};
}count playableUnits;


["G", _groupID, EPOCH_hivePlayer] call EPOCH_server_hiveDEL;


};
true;