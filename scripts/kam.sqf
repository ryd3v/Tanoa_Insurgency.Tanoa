// by ALIAS
// nul = [this,distance_trigger] execvm "Scripts\kam.sqf";

private ["_soundk","_chase_players","_dist","_kamm","_expl1","_expl2","_expl3","_bombk","_list_p","_grp","_strigat","_check_p"];

if (!isServer) exitWith {};

	[] spawn 
	{
	if (isNil "unitus") then
		{
			while {true} do 
			{
			_allunits = [];
				{
					if (alive _x) then
					{
						[[_x, "NoVoice"], "setSpeaker", true] call BIS_fnc_MP;
						_allunits pushBack _x;
					};
				}  foreach (if (isMultiplayer) then {playableUnits} else {switchableUnits});
			unitus = _allunits call BIS_fnc_selectRandom;
			publicVariable "unitus"; 
			sleep 60;
			};
		};
	};

waitUntil {!isNil "unitus"};

_kamm		 	= _this select 0;
_dist		 	= _this select 1;
_soundk 		= _this select 2;
_chase_players	= _this select 3;

_kamm enableFatigue false;

_grp = createGroup civilian;

[_kamm] joinSilent _grp;

_grp setBehaviour "AWARE";
_grp setCombatMode "RED";
_grp setSpeedMode "FULL";

_expl1 = "DemoCharge_Remote_Ammo" createVehicle position _kamm;
_expl1 attachTo [_kamm, [-0.1, 0.1, 0.15], "Pelvis"];
_expl1 setVectorDirAndUp [ [0.5, 0.5, 0], [-0.5, 0.5, 0] ];
_expl2 = "DemoCharge_Remote_Ammo" createVehicle position _kamm;
_expl2 attachTo [_kamm, [0, 0.15, 0.15], "Pelvis"];
_expl2 setVectorDirAndUp [ [1, 0, 0], [0, 1, 0] ];
_expl3 = "DemoCharge_Remote_Ammo" createVehicle position _kamm;
_expl3 attachTo [_kamm, [0.1, 0.1, 0.15], "Pelvis"];
_expl3 setVectorDirAndUp [ [0.5, -0.5, 0], [0.5, 0.5, 0] ];

while {alive _kamm} do 
{
	if (_soundk) then 
	{
		_strigat = ["NoSound","01","NoSound","02","NoSound","04","NoSound","05","NoSound","06","NoSound","07","NoSound","08","NoSound","09","NoSound","099","NoSound"] call BIS_fnc_selectRandom;
		[_kamm,[_strigat,300]] remoteExec ["say3d"];
	};
	
	if (_chase_players) then {{_x doMove getPos unitus;} forEach units _grp};
	
	_check_p = [];
	_check_p = allPlayers inAreaArray [getPosATL _kamm,_dist,_dist,0,false,-1];
	
	if ( count _check_p >0) then 
	{
		_strigat = ["01","02","04","05","06","07","08","09","099"] call BIS_fnc_selectRandom;
		[_kamm,[_strigat,300]] remoteExec ["say3d"];
		sleep 1 + random 2;
		_kamm setVelocity [random 3, random 3, 5+random 15];
		sleep 0.01;
		_bombk = "M_Mo_82mm_AT_LG" createVehicle (getPos _kamm);
		sleep 0.01;
		_kamm setDamage 1;
		deleteVehicle _expl1;
		deleteVehicle _expl2;
		deleteVehicle _expl3;	
	};
	sleep 2+random 3;
};
    if (!isNull _expl1) then 
	{
	_strigat = ["01","02","04","05","06","07","08","09","099"] call BIS_fnc_selectRandom;
	[_kamm,[_strigat,300]] remoteExec ["say3d"];
	_kamm setVelocity [random 3, random 3, 5+random 15];
	sleep 0.1;
	_bombk = "M_Mo_82mm_AT_LG" createVehicle (getPos _kamm);
	_kamm setDamage 1;
	deleteVehicle _expl1;
	deleteVehicle _expl2;
	deleteVehicle _expl3;
	};