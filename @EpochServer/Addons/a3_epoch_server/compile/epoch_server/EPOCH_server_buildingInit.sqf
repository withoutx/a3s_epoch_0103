// "x\addons\a3_epoch_server\compile\epoch_server\EPOCH_server_buildingInit.sqf"
_this addMPEventHandler["MPKilled", { (_this select 0) call EPOCH_save_killedBuilding; }];
