0 setFog 0;
forceWeatherChange;
999999 setFog 0;
setTimeMultiplier 6;
["Initialize"] call BIS_fnc_dynamicGroups;
//Stamina Override 
if (hasinterface) then 
{
waitUntil {!isnull player};
player enableStamina false;
player setCustomAimCoef 0;
player addEventHandler ["Respawn", {player enableStamina  false}];
player addEventHandler ["Respawn", {player setCustomAimCoef  0}];
};