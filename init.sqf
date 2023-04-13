[]execVM "supply\supplyInit.sqf";
[]execVM "scripts\fn_advancedSlingLoadingInit.sqf";
//IED
execVM"ied.sqf";
//AI Spawn System
[]execVM "eos\OpenMe.sqf";
//Ear Plugs
_handle = []execVM "scripts\earplugs.sqf"
//Traffic,Civ's 
execVM "Engima\Traffic\Init.sqf";
execVM "Engima\Civilians\Init.sqf";
//Stamina
if (hasinterface) then 
{
waitUntil {!isnull player};
player enableStamina false;
player setCustomAimCoef 0;
player addEventHandler ["Respawn", {player enableStamina  false}];
player addEventHandler ["Respawn", {player setCustomAimCoef  0}];
};