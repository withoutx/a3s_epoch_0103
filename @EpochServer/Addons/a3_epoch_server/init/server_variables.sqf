// "x\addons\a3_epoch_server\init\server_variables.sqf"
EPOCH_AnimalSlots = [];
EPOCH_BuildingSlots = [];
EPOCH_TraderSlots = [];
EPOCH_arr_cleanObjects = [];
EPOCH_defaultVars_SVar = EPOCH_defaultVars;
EPOCH_group_upgrade_lvl_SVar = EPOCH_group_upgrade_lvl;

if (isNil "EPOCH_InstanceID") then {
EPOCH_InstanceID = "NA1234";
};
if (isNil "EPOCH_DEBUG_VEH") then {
EPOCH_DEBUG_VEH = false;
};
if (isNil "EPOCH_SHOW_TRADERS") then{
EPOCH_SHOW_TRADERS = true;
};
if (isNil "EPOCH_VehicleSlotsLimit") then {
EPOCH_VehicleSlotsLimit = 150;
};
if (isNil "EPOCH_StorageSlotsLimit") then{
EPOCH_StorageSlotsLimit = 1000;
};
if (isNil "EPOCH_BuildingSlotsLimit") then {
EPOCH_BuildingSlotsLimit = 1000;
};
if (isNil "EPOCH_NPCSlotsLimit") then {
EPOCH_NPCSlotsLimit = 50;
};
if (isNil "EPOCH_LootObjSlotsLimit") then {
EPOCH_LootObjSlotsLimit = 100;
};
if (isNil "EPOCH_timeDifference") then {
EPOCH_timeDifference = 0;
};
if (isNil "EPOCH_hiveCharLimit") then{
EPOCH_hiveCharLimit = 8000;
};
if (isNil "EPOCH_forceStaticTraders") then{
EPOCH_forceStaticTraders = true;
};
if (isNil "EPOCH_allowedVehiclesList") then {
EPOCH_allowedVehiclesList = [
["C_Offroad_01_EPOCH",10],
["C_Quadbike_01_EPOCH",10],
["C_Hatchback_01_EPOCH",15],
["C_Hatchback_02_EPOCH",12],
["C_SUV_01_EPOCH",12],
["C_Rubberboat_EPOCH",5],
["C_Rubberboat_02_EPOCH",5],
["C_Rubberboat_03_EPOCH",5],
["C_Rubberboat_04_EPOCH",5],
["C_Van_01_box_EPOCH",10],
["C_Van_01_transport_EPOCH",10],
["C_Boat_Civil_01_EPOCH",5],
["C_Boat_Civil_01_police_EPOCH",5],
["C_Boat_Civil_01_rescue_EPOCH",5],
["B_Heli_Light_01_EPOCH",2],
["B_SDV_01_EPOCH",5],
["B_MRAP_01_EPOCH",5],
["B_Truck_01_transport_EPOCH",1],
["B_Truck_01_covered_EPOCH",1],
["B_Truck_01_mover_EPOCH",1],
["B_Truck_01_box_EPOCH",1],
["O_Truck_02_covered_EPOCH",1],
["O_Truck_02_transport_EPOCH",1],
["O_Truck_03_covered_F",1],
["O_Truck_02_box_EPOCH",1],
["O_Heli_Light_02_unarmed_EPOCH",1],
["I_Heli_Transport_02_EPOCH",1],
["I_Heli_light_03_unarmed_EPOCH",1],
["jetski_epoch",8]
];
};
if (isNil "EPOCH_hive") then {
EPOCH_hive = "EpochHive";
};
if (isNil "EPOCH_hivePlayer") then{
EPOCH_hivePlayer = "EpochHive";
};
if (isNil "EPOCH_whitelist") then {
EPOCH_whitelist = false;
};
if (isNil "EPOCH_WeatherChangeTime") then{
EPOCH_WeatherChangeTime = 3600;
};
if (isNil "EPOCH_StaticDateTime") then{
EPOCH_StaticDateTime = [2014, 2, 25, 9, 0];
};
if (isNil "EPOCH_showShippingContainers") then{
EPOCH_showShippingContainers = true;
};
if (isNil "EPOCH_showEarthQuakes") then{
EPOCH_showEarthQuakes = true;
};

EPOCH_loots = [
["shelfPos", "Shelf_EPOCH", true],
["fridgePos", "Fridge_EPOCH", true],
["bedPos", "Bed_EPOCH", false],
["couchPos", "Couch_EPOCH", false],
["wardrobePos", "wardrobe_epoch", false],
["cookerPos", "cooker_epoch", false],
["chairPos", ["Chair_EPOCH", "ChairRed_EPOCH"], true],
["filingPos", "Filing_epoch", true],
["pelicanPos", "Pelican_EPOCH", false],
["tablePos", "Table_EPOCH", false],
["lockerPos", "Locker_EPOCH", false],
["toolRackPos", "ToolRack_EPOCH", false]
];