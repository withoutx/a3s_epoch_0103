// "x\addons\a3_epoch_server\compile\epoch_group\EPOCH_server_createGroup.sqf"







_return = false;
diag_log format["GROUP: Create %1", _this];
_leader = _this select 0;
_groupName = _this select 1;
if (!isNull _leader && _groupName != "") then {

_groupID = getPlayerUID _leader;


_leaderName = if (alive _leader) then {name _leader} else {"Dead Player"};

_contentArray = [_groupName, _leaderName, EPOCH_group_upgrade_lvl_SVar select 0, [], []];
Epoch_my_Group = _contentArray;
Epoch_my_GroupUID = _groupID;
(owner _leader) publicVariableClient "Epoch_my_Group";
(owner _leader) publicVariableClient "Epoch_my_GroupUID";

_leader setVariable ["GROUP", _groupID];


_return = ((["G", _groupID, _contentArray, EPOCH_hivePlayer] call EPOCH_server_hiveSET) == "OK");

};
_return 