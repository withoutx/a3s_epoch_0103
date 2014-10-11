// "x\addons\a3_epoch_server\init\server_compiles.sqf"
EPOCH_server_publicEH =				compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\init\server_publicEH.sqf";
EPOCH_server_masterLoop =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_server\EPOCH_server_masterLoop.sqf";


EPOCH_spawnSmoker =					compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_antagonists\EPOCH_spawnSmoker.sqf";
EPOCH_server_triggerEvent =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_antagonists\EPOCH_server_triggerEvent.sqf";


EPOCH_server_upgradeGroup =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_group\EPOCH_server_upgradeGroup.sqf";
EPOCH_server_updatePlayerGroup =	compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_group\EPOCH_server_updatePlayerGroup.sqf";
EPOCH_server_createGroup =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_group\EPOCH_server_createGroup.sqf";
EPOCH_server_deleteGroup =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_group\EPOCH_server_deleteGroup.sqf";
EPOCH_server_invitePlayer =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_group\EPOCH_server_invitePlayer.sqf";

EPOCH_server_loadBuildings =		compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_bases\EPOCH_server_loadBuildings.sqf";
EPOCH_server_saveBuilding =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_bases\EPOCH_server_saveBuilding.sqf";
EPOCH_server_upgradeBUILD =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_bases\EPOCH_server_upgradeBUILD.sqf";
EPOCH_server_simulSwap =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_bases\EPOCH_server_simulSwap.sqf";
EPOCH_server_changeOwner =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_bases\EPOCH_server_changeOwner.sqf";
EPOCH_server_simToStatic =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_bases\EPOCH_server_simToStatic.sqf";
EPOCH_server_unsuppported =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_bases\EPOCH_server_unsuppported.sqf";
EPOCH_server_buildItem =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_bases\EPOCH_server_buildItem.sqf";
EPOCH_server_handle_say3D =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_antagonists\EPOCH_server_handle_say3D.sqf";

EPOCH_server_lootContainer =		compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_looting\EPOCH_server_lootContainer.sqf";
EPOCH_server_spawnBoatLoot =		compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_looting\EPOCH_server_spawnBoatLoot.sqf";
EPOCH_server_destroyTrash =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_looting\EPOCH_server_destroyTrash.sqf";
EPOCH_server_knockDownTree =		compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_looting\EPOCH_server_knockDownTree.sqf";
EPOCH_server_lootAnimal =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_looting\EPOCH_server_lootAnimal.sqf";

EPOCH_server_savePlayer =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_player\EPOCH_server_savePlayer.sqf";
EPOCH_server_loadPlayer =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_player\EPOCH_server_loadPlayer.sqf";
EPOCH_server_onPlayerDisconnect =	compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_player\EPOCH_server_onPlayerDisconnect.sqf";
EPOCH_server_deadPlayer =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_player\EPOCH_server_deadPlayer.sqf";
EPOCH_server_revivePlayer =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_player\EPOCH_server_revivePlayer.sqf";
EPOCH_server_storeCrypto =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_player\EPOCH_server_storeCrypto.sqf";
EPOCH_server_equippedItem =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_player\EPOCH_server_equippedItem.sqf";

EPOCH_server_loadTraders =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_traders\EPOCH_server_loadTraders.sqf";
EPOCH_server_spawnTraders =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_traders\EPOCH_server_spawnTraders.sqf";

EPOCH_server_makeTrade =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_trading\EPOCH_server_makeTrade.sqf";
EPOCH_server_tradeRequest =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_trading\EPOCH_server_tradeRequest.sqf";
EPOCH_server_makeNPCTrade =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_trading\EPOCH_server_makeNPCTrade.sqf";

EPOCH_save_vehicles =				compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_vehicle\EPOCH_save_vehicles.sqf";
EPOCH_save_vehicle =				compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_vehicle\EPOCH_save_vehicle.sqf";
EPOCH_save_killedVehicle =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_vehicle\EPOCH_save_killedVehicle.sqf";
EPOCH_save_killedStorage =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_vehicle\EPOCH_save_killedStorage.sqf";
EPOCH_save_killedBuilding =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_vehicle\EPOCH_save_killedBuilding.sqf";
EPOCH_load_vehicles =				compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_vehicle\EPOCH_load_vehicles.sqf";
EPOCH_spawn_vehicle =				compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_vehicle\EPOCH_spawn_vehicle.sqf";
EPOCH_load_storage =				compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_vehicle\EPOCH_load_storage.sqf";
EPOCH_save_storage =				compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_vehicle\EPOCH_save_storage.sqf";
EPOCH_spawn_vehicles =				compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_vehicle\EPOCH_spawn_vehicles.sqf";
EPOCH_server_lockVehicle =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_vehicle\EPOCH_server_lockVehicle.sqf";
EPOCH_server_fillVehicle =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_vehicle\EPOCH_server_fillVehicle.sqf";
EPOCH_server_repairVehicle =		compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_vehicle\EPOCH_server_repairVehicle.sqf";
EPOCH_fill_inventory =				compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_vehicle\EPOCH_fill_inventory.sqf";
EPOCH_server_lockStorage =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_vehicle\EPOCH_server_lockStorage.sqf";
EPOCH_server_packStorage =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_sf_vehicle\EPOCH_server_packStorage.sqf";

EPOCH_server_hiveSET =				compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_hive\EPOCH_server_hiveSET.sqf";
EPOCH_server_hiveGET =				compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_hive\EPOCH_server_hiveGET.sqf";
EPOCH_server_hiveDEL =				compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_hive\EPOCH_server_hiveDEL.sqf";

EPOCH_serverLootObject =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_server\EPOCH_serverLootObject.sqf";
EPOCH_save_queueTrader =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_server\EPOCH_save_queueTrader.sqf";

EPOCH_server_vehicleInit =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_server\EPOCH_server_vehicleInit.sqf";
EPOCH_server_storageInit =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_server\EPOCH_server_storageInit.sqf";
EPOCH_test_damage =					compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_server\EPOCH_test_damage.sqf";
EPOCH_server_buildingInit =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_server\EPOCH_server_buildingInit.sqf";

EPOCH_server_traderKilled =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_server\EPOCH_server_traderKilled.sqf";


EPOCH_server_setWeather =			compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_server\EPOCH_server_setWeather.sqf";

EPOCH_localCleanup =				compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_server\EPOCH_localCleanup.sqf";
EPOCH_server_createTeleport =		compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_server\EPOCH_server_createTeleport.sqf";
EPOCH_server_teleportPlayer =		compileFinal preprocessFileLineNumbers "\x\addons\a3_epoch_server\compile\epoch_server\EPOCH_server_teleportPlayer.sqf";
