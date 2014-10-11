//#line  1 "x\addons\a3_epoch_server\compile\epoch_hive\EPOCH_server_hiveGET.sqf"

_type = _this select 0;

_response = "";

//handle player saving
if(_type == "P") then {
	_plyrUID = _this select 1;
	
	_uidArray = profilenamespace getVariable ["PLAYERS",[]];
	_index = _uidArray find _plyrUID;
	if(_index != -1) then {
		_dataArray = profilenamespace getVariable ["PLAYER_DATA",[]];
		_response = _dataArray select _index;
	};
};
if(_type == "V") then {
	_key = _this select 1;
	
	_keyArray = profilenamespace getVariable ["VEHICLE_KEYS",[]];
	_index = _keyArray find _key;
	if(_index != -1) then {
		_dataArray = profilenamespace getVariable ["VEHICLE_DATA",[]];
		_response = _dataArray select _index;
	};
};
if(_type == "SI") then {
	_key = _this select 1;
	
	_keyArray = profilenamespace getVariable ["STORAGEITEMS",[]];
	_index = _keyArray find _key;
	if(_index != -1) then {
		_dataArray = profilenamespace getVariable ["STORAGEITEM_DATA",[]];
		_response = _dataArray select _index;
	};
};

if(_type == "S") then {
	_key = _this select 1;
	
	_keyArray = profilenamespace getVariable ["STORAGES",[]];
	_index = _keyArray find _key;
	if(_index != -1) then {
		_dataArray = profilenamespace getVariable ["STORAGE_DATA",[]];
		_response = _dataArray select _index;
	};
};
if(_type == "G") then {
	_key = _this select 1;
	
	_keyArray = profilenamespace getVariable ["GROUPS",[]];
	//_keyArray = [_databasename, "HIVE_GROUP", "GROUPS", "ARRAY"] call iniDB_read;
	_index = _keyArray find _key;
	if(_index != -1) then {
		_dataArray = profilenamespace getVariable ["GROUPS_DATA",[]];
		//_dataArray = [_databasename, "HIVE_GROUP", "GROUPS_DATA", "ARRAY"] call iniDB_read;
		_response = _dataArray select _index;
	};
};
if(_type == "B") then {
	_key = _this select 1;
	
	_keyArray = profilenamespace getVariable ["BUILDINGS",[]];
	_index = _keyArray find _key;
	if(_index != -1) then {
		_dataArray = profilenamespace getVariable ["BUILDINGS_DATA",[]];
		_response = _dataArray select _index;
	};
};


_response;
/*
//Commented out until hiving dll is created
(_this select 2) callExtension format["GET|%1%2|NA", _this select 0, _this select 1];

/*
//Data for playerload
[
	[	
		0, //dir
		[], //position
		EPOCH_InstanceID //prevInstance
	],  //worldspace
	[
		0,
		0,
		1,
		0, //dead
		[]
	], //medical
	[
		"",
		"",
		"", 
		"",
		"U_Test1_uniform",
		"Epoch_Male_F" //CLASS
	], //appearance
	[
		""
	],
	[
		98.6,
		5000,
		2500,
		2500,
		0,
		0,
		0,
		0,
		0,
		100
	], //variables
	[
		"",  //current weapon
		[] //items / weapons
	], //weapons and items
	[
		"ItemMap"
	], //linked items
	[], //magazines
	[], //items in slots
	[], //items in slots?
	"",//group
	true //can be revived
]