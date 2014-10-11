// "x\addons\a3_epoch_server\compile\epoch_group\EPOCH_server_updatePlayerGroup.sqf"
diag_log format ["GROUP: Update %1",_this];
_groupID = _this select 0;
_selectedPlayerUID = _this select 1;
_addOrRemove = _this select 2; 
_modOrMember = if (_this select 3) then [{3},{4}];
_modOrMemberRevert = if (_this select 3) then [{4},{3}];


_contentArray = call compile(["G", _groupID, EPOCH_hivePlayer] call EPOCH_server_hiveGET);
if ((typeName _contentArray) == "ARRAY") then {




_modArray = _contentArray select 3;
_memberArray = _contentArray select 4;

if (_addOrRemove) then { 
_selectedPlayerName = "Dead Player";

{
if (getPlayerUID _x == _selectedPlayerUID) exitWith {
_selectedPlayerName = if (alive _x) then {name _x};
if ((_x getVariable ["GROUP",""]) != _groupID) then {
_x setVariable ["GROUP", _groupID];
_group = grpNull;
{
if ((_x getVariable["GROUP",""]) == _groupID) exitWith {
_group = group _x;
};
}count playableUnits;

if (isNull _group) then{
_group = createGroup west;
};
[_x] joinSilent _group;
};
};
}count playableUnits;

_removePlayerArray = _contentArray select _modOrMemberRevert;

{
if (_x select 0 == _selectedPlayerUID) exitWith {
_removePlayerArray set [_forEachIndex,objNull];
_removePlayerArray = _removePlayerArray - [objNull];
_contentArray set [_modOrMemberRevert,_removePlayerArray];
};
}forEach _removePlayerArray;

_modOrMemberArray = _contentArray select _modOrMember;
_modOrMemberArray pushBack [_selectedPlayerUID,_selectedPlayerName];

_contentArray set [_modOrMember,_modOrMemberArray];

} else { 

_found = false;

{
if (getPlayerUID _x == _selectedPlayerUID) exitWith {
_x setVariable ["GROUP", nil];
[_x] joinSilent (createGroup west);
Epoch_my_Group = [];
Epoch_my_GroupUID = "";
(owner _x) publicVariableClient "Epoch_my_Group";
(owner _x) publicVariableClient "Epoch_my_GroupUID";
};
}count playableUnits;

{
if (_x select 0 == _selectedPlayerUID) exitWith {
_memberArray set [_forEachIndex,objNull];
_found = true;
};
}forEach _memberArray;

if (!_found) then {
{
if (_x select 0 == _selectedPlayerUID) exitWith {
_modArray set [_forEachIndex,objNull];
_found = true;
};
}forEach _modArray;
_modArray = _modArray - [objNull];
_contentArray set [3,_modArray];
}else {
_memberArray = _memberArray - [objNull];
_contentArray set [4,_memberArray];
};

if (!_found) then {diag_log format ["%1 cannot remove Player! (%1)","x\addons\a3_epoch_server\compile\epoch_group\EPOCH_server_updatePlayerGroup.sqf",_this]};

};

{
if ((_x getVariable["GROUP", ""]) == _groupID) exitWith {
Epoch_my_Group = _contentArray;
{
(owner _x) publicVariableClient "Epoch_my_Group";
}count (units group _x);
};
}count playableUnits;


["G", _groupID, _contentArray, EPOCH_hivePlayer] call EPOCH_server_hiveSET;
};