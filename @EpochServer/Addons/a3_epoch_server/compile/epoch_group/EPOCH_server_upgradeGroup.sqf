// "x\addons\a3_epoch_server\compile\epoch_group\EPOCH_server_upgradeGroup.sqf"
diag_log format ["GROUP: Upgrade %1",_this];
_groupID = _this;


_contentArray = call compile(["G", _groupID, EPOCH_hivePlayer] call EPOCH_server_hiveGET);
if ((typeName _contentArray) == "ARRAY") then{



_groupSize = _contentArray select 2;
_modArray = _contentArray select 3;
_memberArray = _contentArray select 4;

_found = EPOCH_group_upgrade_lvl_SVar find _groupSize;

if ((_found != -1) && count EPOCH_group_upgrade_lvl_SVar >= (_found + 3)) then{

_newGroupSize = EPOCH_group_upgrade_lvl_SVar select (_found + 2);
_contentArray set [2, _newGroupSize];


_groupMemberPUID = [_groupID];
{
{
_groupMemberPUID pushback(_x select 0);
}forEach _x;
}forEach[_modArray, _memberArray];


Epoch_my_Group = _contentArray;
{
if (getPlayerUID _x in _groupMemberPUID) then{
(owner _x) publicVariableClient "Epoch_my_Group";
};
}forEach playableUnits;


["G", _groupID, _contentArray, EPOCH_hivePlayer] call EPOCH_server_hiveSET;
};
};