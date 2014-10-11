// "x\addons\a3_epoch_server\compile\epoch_sf_trading\EPOCH_server_makeTrade.sqf"
private ["_type","_player1","_player2","_trade1","_trade2","_tradeOffer1","_tradeOffer2"];
_player1 = _this select 0;
_player2 = _this select 1;
if (!isNull _player1 && !isNull _player2) then {
if ((_player1 getVariable["Accept", false]) && (_player2 getVariable["Accept", false])) then{
_tradeOffer1 = _player1 getVariable["Offer", []];
_tradeOffer2 = _player2 getVariable["Offer", []];

_tradeCryptoOffer1 = _player1 getVariable["cryptoOffer", 0];
_tradeCryptoOffer2 = _player2 getVariable["cryptoOffer", 0];

if !(_tradeOffer1 isEqualTo []) then{
{
if ([_x, "CfgWeapons"] call EPOCH_isAny) then {
_player1 removeItem _x;
} else {
_player1 removeMagazineGlobal _x;
};
}forEach _tradeOffer1;
};

if (_tradeCryptoOffer1 != 0) then{
EPOCH_effectCrypto_PVC = -_tradeCryptoOffer1;
(owner _player1) publicVariableClient "EPOCH_effectCrypto_PVC";
};

if !(_tradeOffer2 isEqualTo []) then {
{
if ([_x, "CfgWeapons"] call EPOCH_isAny) then{
_player1 addItem _x;
} else {
_player1 addMagazine[_x, 1];
};
}forEach _tradeOffer2;
};

if (_tradeCryptoOffer2 != 0) then{
EPOCH_effectCrypto_PVC = _tradeCryptoOffer2;
(owner _player1) publicVariableClient "EPOCH_effectCrypto_PVC";
};

diag_log format["In:%1 Out:%2", _tradeOffer2, _tradeOffer1];
};
};