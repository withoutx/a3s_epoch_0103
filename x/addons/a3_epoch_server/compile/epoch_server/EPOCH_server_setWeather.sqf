// "x\addons\a3_epoch_server\compile\epoch_server\EPOCH_server_setWeather.sqf"
private["_rain", "_fog", "_overcast", "_windValX", "_windValZ"];

EPOCH_CURRENT_WEATHER = if (sunOrMoon < 1) then{ (random 35) + 15 }
else { (random 75) + 50 };
publicVariable "EPOCH_CURRENT_WEATHER";

_fog = [0, 0, 0];
_rain = 0;
_overcast = 0;

if (EPOCH_CURRENT_WEATHER < 100) then{
_rain = random 1;
_fog = [random 0.1, random 0.1, random 20];
_overcast = if (_this) then [{random 0.5},{random 1}];
};

EPOCH_WeatherChangeTime setFog _fog;
EPOCH_WeatherChangeTime setOvercast _overcast;
EPOCH_WeatherChangeTime setRain _rain;

_windValX = random 10 - 5;
_windValZ = random 10 - 5;
if (_rain > 0.5) then{
_windValX = random 20 - 10;
_windValZ = random 20 - 10;
};
setWind[_windValX, _windValZ, true];

if (_this) then{
forceWeatherChange;
};

diag_log format["Weather Change: fog: %1 rain: %2 overcast: %3 windx: %4 windz: %5 forced: %6", _fog, _overcast, _rain, _windValX, _windValZ, _this];