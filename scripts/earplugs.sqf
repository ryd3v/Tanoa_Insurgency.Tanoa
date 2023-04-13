_run = true;
_listOfVehicleTypes = ["air","support","armoured","ship","submarine","car","autonomous"];
_earplugs = false;
_playerInVehicle = false;

while {_run} do
{
	if !(_earplugs) then
	{
		{
			if ((typeOf (vehicle player)) isKindOf _x) then
			{
				_playerInVehicle = true;
			};
		} forEach _listOfVehicleTypes;
		if (_playerInVehicle) then
		{
			1 fadeSound .35;
			hintSilent "Putting earplugs in...";
			_earplugs = true;
		};
	} else {
		_playerInVehicle = false;
		{
			if ((typeOf (vehicle player)) isKindOf _x) then
			{
				_playerInVehicle = true;
			}
		} forEach _listOfVehicleTypes;
		if !(_playerInVehicle) then
		{
			1 fadeSound 1;
			hintSilent "Taking earplugs out...";
			_earplugs = false;
		};
	};
	
	
	//sleep 2;
	//if (_earplugs != "false") then {_run = false;};
};