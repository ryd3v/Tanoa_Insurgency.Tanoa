//Support Requester By ryd3v 2018
_this select 0 synchronizeObjectsAdd [SupportRequester];
SupportRequester synchronizeObjectsAdd [_this select 0];
BIS_supp_refresh = TRUE;
publicVariable "BIS_supp_refresh";
if (typeOf (_this select 0) isEqualTo "player") then {
[_this select 0, SupportRequester, ArtilleryProvider] call BIS_fnc_addSupportLink;
[_this select 0, SupportRequester, CasProvider] call BIS_fnc_addSupportLink;
[_this select 0, SupportRequester, TransportProvider] call BIS_fnc_addSupportLink;
[_this select 0, SupportRequester, AmmoProvider] call BIS_fnc_addSupportLink;
[_this select 0, SupportRequester, HelicasProvider] call BIS_fnc_addSupportLink;
};
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;
