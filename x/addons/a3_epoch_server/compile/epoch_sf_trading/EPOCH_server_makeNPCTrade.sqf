// "x\addons\a3_epoch_server\compile\epoch_sf_trading\EPOCH_server_makeNPCTrade.sqf"
private ["_vehHiveKey","_VAL","_vehSlot","_vehicle","_vehicles","_trader","_tradeType","_item","_plyrNetID","_plyr","_itemWorth"];
_trader = _this select 0;
_trader call EPOCH_save_queueTrader;

_tradeType = _this select 1;
_item = _this select 2;
_plyr = _this select 3;

_itemWorth = getNumber(configFile >> "CfgPricing" >> _item >> "price");

if (_tradeType == 1) then{

if (isClass(configfile >> "CfgPricing" >> _item)) then {

_vehicles = _trader nearEntities[[_item], 30];

if (!(_vehicles isEqualTo [])) then{

_vehicle = _vehicles select 0;
if (!isNull _vehicle) then{

_plyrNetID = owner _plyr;
if (_plyrNetID == (owner _vehicle)) then {

_vehSlot = _vehicle getVariable["VEHICLE_SLOT", "ABORT"];
if (_vehSlot != "ABORT") then{
deleteVehicle _vehicle;

_vehHiveKey = format["%1:%2", EPOCH_InstanceID, _vehSlot];
_VAL = false;
["V", _vehHiveKey, _VAL, EPOCH_hive] call EPOCH_server_hiveSET;
EPOCH_VehicleSlots pushBack _vehSlot;

EPOCH_VehicleSlotCount = count EPOCH_VehicleSlots;
publicVariable "EPOCH_VehicleSlotCount";


EPOCH_effectCrypto_PVC = _itemWorth;
_plyrNetID publicVariableClient "EPOCH_effectCrypto_PVC";

diag_log format["TRADE 1: ITEM %1 WORTH: %2 BY %3 %4", _item, _itemWorth, _plyr, getPlayerUID _plyr];
};
};
};
};
};
} else {
diag_log format["TRADE 0: ITEM %1 WORTH: %2 BY %3 %4", _item, _itemWorth, _plyr, getPlayerUID _plyr];
};