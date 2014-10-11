// "x\addons\a3_epoch_server\init\server_publicEH.sqf"

"EPOCH_SAVEBUILD"			addPublicVariableEventHandler {(_this select 1) call EPOCH_server_saveBuilding};
"EPOCH_UPBUILD"				addPublicVariableEventHandler {(_this select 1) call EPOCH_server_upgradeBUILD};
"EPOCH_loadPlayer_PVS"		addPublicVariableEventHandler {(_this select 1) call EPOCH_server_loadPlayer};
"EPOCH_S_S_VEHICLES"		addPublicVariableEventHandler {(_this select 1) call EPOCH_save_vehicles};
"EPOCH_pushPlayer_PVS"		addPublicVariableEventHandler {(_this select 1) call EPOCH_server_savePlayer};
"EPOCH_deadPlayer_PVS"		addPublicVariableEventHandler {(_this select 1) call EPOCH_server_deadPlayer};
"EPOCH_destroyTrash"		addPublicVariableEventHandler {(_this select 1) call EPOCH_server_destroyTrash};
"EPOCH_knockDownTree"		addPublicVariableEventHandler {(_this select 1) call EPOCH_server_knockDownTree};
"EPOCH_lootAnimal"			addPublicVariableEventHandler {(_this select 1) call EPOCH_server_lootAnimal};

"EPOCH_say3D_PVS"			addPublicVariableEventHandler {(_this select 1) call EPOCH_server_handle_say3D};

"EPOCH_GROUP_Upgrade_PVS"	addPublicVariableEventHandler {(_this select 1) call EPOCH_server_upgradeGroup};
"EPOCH_GROUP_Player_PVS"	addPublicVariableEventHandler {(_this select 1) call EPOCH_server_updatePlayerGroup};
"EPOCH_GROUP_create_PVS"	addPublicVariableEventHandler {(_this select 1) call EPOCH_server_createGroup};
"EPOCH_GROUP_Delete_PVS"	addPublicVariableEventHandler {(_this select 1) call EPOCH_server_deleteGroup};
"EPOCH_GROUP_Invite_PVS"	addPublicVariableEventHandler {(_this select 1) call EPOCH_server_invitePlayer};
"EPOCH_changeOwner_PVEH"	addPublicVariableEventHandler {(_this select 1) call EPOCH_server_changeOwner};
"EPOCH_lootContainer"		addPublicVariableEventHandler {(_this select 1) call EPOCH_server_lootContainer};
"EPOCH_revivePlayer_PVS"	addPublicVariableEventHandler {(_this select 1) call EPOCH_server_revivePlayer};
"EPOCH_buildItem_PVS"		addPublicVariableEventHandler {(_this select 1) call EPOCH_server_buildItem};

"EPOCH_storeCrypto_PVS"		addPublicVariableEventHandler {(_this select 1) call EPOCH_server_storeCrypto};

"EPOCH_MAKETRADEREQ"		addPublicVariableEventHandler {(_this select 1) call EPOCH_server_tradeRequest};
"EPOCH_MAKETRADE"			addPublicVariableEventHandler {(_this select 1) call EPOCH_server_makeTrade};
"EPOCH_MAKENPCTRADE"		addPublicVariableEventHandler {(_this select 1) call EPOCH_server_makeNPCTrade};

"EPOCH_repairVehicle_PVS"	addPublicVariableEventHandler {(_this select 1) call EPOCH_server_repairVehicle};
"EPOCH_fillVehicle_PVS"		addPublicVariableEventHandler {(_this select 1) call EPOCH_server_fillVehicle};
"EPOCH_lockVehicle_PVS"		addPublicVariableEventHandler {[_this select 1,true] call EPOCH_server_lockVehicle};
"EPOCH_unlockVehicle_PVS"	addPublicVariableEventHandler {[_this select 1,false] call EPOCH_server_lockVehicle};
"EPOCH_spawnVehicle_PVS"	addPublicVariableEventHandler {(_this select 1) call EPOCH_spawn_vehicle};
"EPOCH_equippedItem_PVS"	addPublicVariableEventHandler {(_this select 1) call EPOCH_server_equippedItem};
"EPOCH_lockStorage_PVS"		addPublicVariableEventHandler {(_this select 1) call EPOCH_server_lockStorage};
"EPOCH_packStorage_PVS"		addPublicVariableEventHandler {(_this select 1) call EPOCH_server_packStorage};

"EPOCH_TEMPOBJ_PVS"			addPublicVariableEventHandler {(_this select 1) call EPOCH_localCleanup};
"EPOCH_oneWayTeleport"		addPublicVariableEventHandler {(_this select 1) call EPOCH_server_teleportPlayer};