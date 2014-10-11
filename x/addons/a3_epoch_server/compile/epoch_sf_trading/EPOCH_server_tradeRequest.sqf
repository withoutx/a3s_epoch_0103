// "x\addons\a3_epoch_server\compile\epoch_sf_trading\EPOCH_server_tradeRequest.sqf"
private ["_target","_source"];
_target = _this select 0;
_source = _this select 1;
if (!isNull _target && !isNull _source) then{
EPOCH_TRADE_REQ = _source;
(owner _target) publicVariableClient "EPOCH_TRADE_REQ";
};