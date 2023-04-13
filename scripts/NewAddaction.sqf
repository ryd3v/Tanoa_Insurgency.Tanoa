_laptop = _this select 0;
deleteVehicle laptop1;
deleteVehicle _laptop;
private ["_activatingPlayer","_laptop"];
_activatingPlayer = _this select 1;
NewAct = _activatingPlayer addAction [("<t color=""#CC2900"">" + ("Deposite LapTop Here") + "</t>"), "scripts\Dropit.sqf", "radio", -1, false, true,"", "_this == _target"];