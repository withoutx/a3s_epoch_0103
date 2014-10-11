// "x\addons\a3_epoch_server\compile\epoch_server\EPOCH_server_vehicleInit.sqf"
_this addMPEventHandler["MPKilled", { (_this select 0) call EPOCH_save_killedVehicle }];
_this addMPEventHandler["MPHit", { (_this select 0) call EPOCH_save_vehicle }];
_this addEventHandler["GetOut", { (_this select 0) call EPOCH_save_vehicle }];