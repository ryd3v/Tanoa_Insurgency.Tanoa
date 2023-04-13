_activatingPlayer = _this select 1;
laptop = "Land_Laptop_unfolded_F" createVehicle (getPos _activatingPlayer);
_activatingPlayer removeAction NewAct;
laptop addaction ["Pick Up Laptop","NewAddaction.sqf"];