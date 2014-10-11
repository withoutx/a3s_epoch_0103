// "x\addons\a3_epoch_server\compile\epoch_server\EPOCH_save_queueTrader.sqf"
private ["_objHiveKey","_VAL","_slot"];
if (!isNull _this) then{
_slot = _this getVariable["AI_SLOT", -1];

if (_slot != -1) then{
_objHiveKey = format["%1:%2", EPOCH_InstanceID, _slot];
_VAL = _this getVariable["AI_ITEMS", [[], []]];
_return = ["AI_ITEMS", _objHiveKey, _VAL, EPOCH_hive] call EPOCH_server_hiveSET;

};
};