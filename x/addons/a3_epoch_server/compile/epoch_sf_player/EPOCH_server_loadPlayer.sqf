/*

	Player Login

	

	Epoch Mod - EpochMod.com 

	All Rights Reserved.

*/

private ["_arr","_newPlyr","_medical","_apperance","_plyr","_plyrNetID","_plyrUID","_vars","_weaponsAndItems","_class","_alreadyDead","_dir","_location","_type","_weapon","_attachments","_currWeap","_itemSlot","_itemqtys","_reject","_prevInstance","_worldspace","_countArr","_defaultUniform","_defaultModel","_group","_attachment","_equipped","_wMags","_forEachIndex","_goggles","_headgear","_vest","_backpack","_uniform","_plyrGroup","_contentArray","_res","_canBeRevived","_gender"];

_reject = true;



if !(typename _this == "ARRAY") exitWith{};



_plyr = _this select 0;

_gender = _this select 1;



_plyrNetID = owner _plyr;

if (!isNull _plyr) then {

	_plyrUID = getPlayerUID _plyr;

	if (!isNil "_plyrUID" && _plyrUID != "") then{

		// Make Hive call

		_res = ["P", _plyrUID, EPOCH_hivePlayer] call EPOCH_server_hiveGET;

		if (_res != "") then{

			_arr = call compile _res;

		};



		if (isNil "_arr") then{ _arr = []; };

		if (typeName _arr != "ARRAY") then{ _arr = []; };

			

		_countArr = count _arr;

		if (_countArr == 10) then{

			_arr pushBack ""; //Group UID

			_countArr = _countArr + 1;

		};

		if (_countArr == 11) then{

			_arr pushBack true;	//Revive Stuff

			_countArr = _countArr + 1;

		};

		

		_defaultUniform = "U_Test1_uniform";

		_defaultModel = "Epoch_Male_F";

		if (_gender == 1) then {

			_defaultUniform = "U_Test_uniform";

			_defaultModel = "Epoch_Female_F";

		};



		if (_countArr < 11) then{ // invaild format attempt to override

			_arr = [[0, [], EPOCH_InstanceID], [0, 0, 1, 0, []], ["", "", "", "", _defaultUniform, _defaultModel], [""], [98.6, 5000, 2500, 2500, 0, 0, 0, 0, 0, 100], ["", []], ["ItemMap"], [], [], [], "", true];

			diag_log format["DEBUG: invaild format override arr %1", _plyrUID];

		};



		_class = _defaultModel;

				

		_medical = _arr select 1;

		_alreadyDead = (_medical select 3) >= 1;



		_worldspace = _arr select 0;

		_dir = _worldspace select 0;

		_location = _worldspace select 1;

		_prevInstance = _worldspace select 2;



		_plyrGroup = _arr select 10;

		_canBeRevived = _arr select 11;

		_vars = _arr select 4;



		if (isNil "_prevInstance") then{

			_prevInstance = EPOCH_InstanceID;

		};



		if (_alreadyDead || _prevInstance != EPOCH_InstanceID || (count _location) < 3) then{

			_dir = random 360;

			_location = getMarkerPos "respawn_west";

			_location set[2, 0];

		};



		_group = grpNull;

			

		{

			if (_plyrGroup != "") then{

				if ((_x getVariable["GROUP", ""]) == _plyrGroup) exitWith{

					_group = group _x;

				};

			};

			if ((_x getVariable["PUID", "0"]) == _plyrUID) then{

				deleteVehicle _x

			};

		}count allUnits;

			

		if (isNull _group) then{

			_group = createGroup west;

		};



		_newPlyr = _group createUnit[_class, _location, [], 0, "CAN_COLLIDE"];



		//diag_log format["DEBUG Created New Player: %1", _newPlyr];



		_newPlyr allowDamage false;

		{

			_newPlyr disableAI _x;

		}count["FSM", "MOVE", "AUTOTARGET", "TARGET"];



		_newPlyr setDir _dir;

		_newPlyr setPosATL _location;



		_currWeap = "";



		if (!_alreadyDead) then{

			// Medical

			_newPlyr setBleedingRemaining (_medical select 0);

			// _newPlyr setFatigue (_medical select 1);

			_newPlyr setOxygenRemaining (_medical select 2);

			_newPlyr setDamage (_medical select 3);



			// Apperance

			_apperance = _arr select 2;

			_goggles = _apperance select 0;

			_headgear = _apperance select 1;

			_vest = _apperance select 2;

			_backpack = _apperance select 3;

			_uniform = _apperance select 4;



			if (_uniform != "") then{

				_newPlyr addUniform _uniform;

			};

			if (_backpack != "") then{

				_newPlyr addBackpack _backpack;

			};

			if (_goggles != "") then{

				_newPlyr addGoggles _goggles;

			};

			if (_headgear != "") then{

				_newPlyr addHeadgear _headgear;

			};

			if (_vest != "") then{

				_newPlyr addVest _vest;

			};



			// Weapons

			_weaponsAndItems = _arr select 5;

			if (count _weaponsAndItems >= 2) then{



				_equipped = _weaponsAndItems select 2;



				{

					_weapon = _x select 0;

					_type = getNumber(configfile >> "cfgweapons" >> _weapon >> "type");



					_attachments = [];

					// suppressor, laser, optics

					for "_a" from 1 to 3 do {

						_attachment = _x select _a;

						if (_attachment != "") then{

							_attachments pushBack _attachment;

						};

					};



					_wMags = (count _x) == 5;



					// add weapon if equiped

					if (_weapon in _equipped) then{



						_equipped = _equipped - [_weapon];



						if (_wMags) then{

							_newPlyr addMagazine(_x select 4);

						};



						if (_weapon != "") then{

							_newPlyr addWeapon _weapon;

						};



						switch _type do {

						case 1: { // primary

							removeAllPrimaryWeaponItems _newPlyr;

							{_newPlyr addPrimaryWeaponItem _x}forEach _attachments;

						};

						case 2:	{ // handgun

							removeAllHandgunItems _newPlyr;

							{_newPlyr addHandgunItem _x}forEach _attachments;

						};

						case 4:	{ // secondary

							// removeAllSecondaryWeaponItems player; does not exist ?

								{_newPlyr addSecondaryWeaponItem _x}forEach _attachments;

						};

						};

					}

					else { // overflow need to add these items to storage

							{

								_newPlyr addItem _x;

							}forEach _attachments;



							if (_wMags) then{

								_newPlyr addMagazine(_x select 4);

							};

					};



				}forEach(_weaponsAndItems select 1);



				_currWeap = _weaponsAndItems select 0;

			};



			// Linked items

			{

				if (_x in["Binocular", "Rangefinder"]) then{

					_newPlyr addWeapon _x;

				} else {

					_newPlyr linkItem _x;

				};

			}forEach(_arr select 6);



			// add items to containers

			{

				_itemSlot = _forEachIndex;

				_itemqtys = _x select 1;

				{

					for "_i" from 1 to(_itemqtys select _forEachIndex) do {

						switch _itemSlot do {

						case 0: { _newPlyr addItemToUniform _x };

						case 1: { _newPlyr addItemToVest _x };

						case 2: { _newPlyr addItemToBackpack _x };

						};

					};

				}forEach(_x select 0);

			}forEach(_arr select 8);



			// add weapons to containers

			{

				_itemSlot = _forEachIndex;

				_itemqtys = _x select 1;

				{

					for "_i" from 1 to(_itemqtys select _forEachIndex) do {

						switch _itemSlot do {

						case 0: { _newPlyr addItemToUniform _x };

						case 1: { _newPlyr addItemToVest _x };

						case 2: { _newPlyr addItemToBackpack _x };

						};

					};

				}forEach(_x select 0);

			}forEach(_arr select 9);



			// Add magazines

			{

				_newPlyr addMagazine _x;

			} forEach(_arr select 7);



		};

		// Final Push

		if (isNull _plyr) then{

			deleteVehicle _newPlyr;

			diag_log "DEBUG: _plyr object was null reject connection";

		} else {

			_reject = false;



			if (_plyrGroup != "") then{

				_contentArray = call compile(["G", _plyrGroup, EPOCH_hivePlayer] call EPOCH_server_hiveGET);

				if ((typeName _contentArray) == "ARRAY") then{

					Epoch_my_Group = _contentArray;

					_plyrNetID publicVariableClient "Epoch_my_Group";

					_newPlyr setVariable["GROUP", _plyrGroup];

				}

				else {

					_plyrGroup = ""; //set NULL if group doesnt exist / got deleted

				};

				diag_log format["DEBUG (Load Player) Set Group: %1", _plyrGroup];

				diag_log format["DEBUG (Load Player) Group Content: %1", _contentArray];

			};



			_newPlyr setVariable["SETUP", true];

			_newPlyr setVariable["PUID", _plyrUID];

			if !(_vars isEqualTo []) then{

				_newPlyr setVariable["VARS", _vars];

			};



			if (!_canBeRevived) then{

				_newPlyr setVariable["REVIVE", _canBeRevived]

			};



			EPOCH_C_SET = [_newPlyr, _vars, _currWeap, count(magazines _newPlyr), _plyrGroup, _canBeRevived,""];

			_plyrNetID publicVariableClient "EPOCH_C_SET";

		};

	};

};

if (_reject) then {

	diag_log format["DEBUG PLAYER NOT SETUP OR INVAILD: %1", _plyr];

	EPOCH_BADHIVE = true;

	_plyrNetID publicVariableClient "EPOCH_BADHIVE";

};
