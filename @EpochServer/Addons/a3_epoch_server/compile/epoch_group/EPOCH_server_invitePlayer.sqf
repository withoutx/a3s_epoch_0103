// "x\addons\a3_epoch_server\compile\epoch_group\EPOCH_server_invitePlayer.sqf"
_playerUID = _this select 0;
{
if (getPlayerUID _x == _playerUID) exitWith {
diag_log format ["DEBUG GROUP %1 - %2",_this,_x];
EPOCH_invitePlayer_PVC = [_this select 1,_this select 2]; 
(owner _x) publicVariableClient "EPOCH_invitePlayer_PVC";
};
}count playableUnits;
