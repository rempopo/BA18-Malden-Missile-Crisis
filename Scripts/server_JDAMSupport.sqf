/*
 *	JDAM Support script
 *	Server-side
 */
dzn_AAAs = synchronizedObjects dzn_AAA_Logic;
dzn_AAA_Radar = AAA_Radar;

// --- Settings
dzn_AAA_InterceptChance = 25;
dzn_AAA_InterceptChanceBonusPerBomb = 5;
dzn_JDAM_AimingError = 5;
dzn_JDAM_StrikeTimeout = 30;

dzn_JDAM_AvailableCount = 8;
dzn_JDAM_RequestTimeout = 0;
dzn_JDAM_RequestTimeoutSetting = dzn_JDAM_StrikeTimeout + 10;
publicVariable "dzn_JDAM_Available";
publicVariable "dzn_JDAM_RequestTimeout";
publicVariable "dzn_JDAM_RequestTimeoutSetting";
publicVariable "dzn_JDAM_StrikeTimeout";


// --- Functions
dzn_fnc_server_requestStrike = {
	params ["_pos"];
	
	sleep dzn_JDAM_StrikeTimeout;
	
	private _bomb = [
		_pos
		, "Bo_Mk82_MI08"
		, dzn_JDAM_AimingError
		, false
		, 1500
		, -100
	] call dzn_fnc_SpawnShell;
	
	// --- Intercept JDAM if radra is working
	if (!alive dzn_AAA_Radar) exitWith {};
	{
		[_x, _bomb, 6.5] spawn dzn_fnc_server_interceptByAAA;
	} forEach dzn_AAAs;
	
	[6.5] spawn dzn_fnc_server_makeAllAIDown;
	
	// --- Intercept sequence
	dzn_AAA_InterceptChance = dzn_AAA_InterceptChance + dzn_AAA_InterceptChanceBonusPerBomb;
	if ((random 100) > dzn_AAA_InterceptChance) exitWith { 
		/* Failed to intercept */ 
		
		waitUntil { ((getPosATL _bomb) # 2) < 15 };
		private _newPos = (getPosATL _bomb);
		[_newPos, "Bo_Mk82_MI08", 0, false, _newPos # 2, -100] call dzn_fnc_SpawnShell
	};	
	waitUntil { ((getPosATL _bomb) # 2) < (100 + random (200)) };	
	createVehicle ["HelicopterExploBig", getPosATL _bomb, [], 0, "NONE"];	
	createVehicle ["HelicopterExploBig", getPosATL _bomb, [], 0, "NONE"];
	deleteVehicle _bomb;
};

dzn_fnc_server_interceptByAAA = {
	params ["_gun","_tgt", "_sleepTimeout"];
	
	private _dist = _gun distance2d _tgt;
	if (_dist > 2000) exitWith { /* Target is too far, don't shoot */ };
	
	private _leadOffset = [0, 120, 0];
	if (_dist > 500 && _dist < 1000) then {
		_leadOffset = [0,240,0];
	} else {
		if (_dist > 1000) then {
			_leadOffset = [0,360,0];
		};
	};
	
	private _g = (gunner _gun);
	if !(alive _g) exitWith { /* Gunner is dead, no shooting */ };
	
	_g reveal [_tgt, 4];
	_g doWatch _tgt;
	_g doTarget _tgt;
	
	sleep _sleepTimeout;
	_g doWatch (_tgt modelToWorldVisual _leadOffset);
	
	for "_i" from 0 to 75 do {
		if (isNull _tgt) then {
			// Bomb destoryed -- stop shooting with delay
			if (_i < 70) then { _i = 70; };
			_g doWatch (_gun modelToWorldVisual [0,40,120]);
			uiSleep 0.05;
			_g fireAtTarget [_tgt];
		} else {
			// Bomb not destroy - continue 
			_g  doWatch (_tgt modelToWorldVisual _leadOffset);
			uiSleep 0.05;
			_g fireAtTarget [_tgt];
		};
	};
	
	_gun setVehicleAmmo 1;
};

dzn_fnc_server_makeAllAIDown = {
	params ["_sleepTimeout"];
	
	private _units = allUnits select { side _x == east && { !isPlayer _x } };
	sleep _sleepTimeout;
	
	{
		[_x, "DOWN"] remoteExec ["setUnitPos", _x];
	} forEach _units;
	
	sleep 15;
	
	{
		[_x, "AUTO"] remoteExec ["setUnitPos", _x];
	} forEach _units;
};

["itemAdd", ["dzn_JDAM_ReloadLoop", { 
	if (dzn_JDAM_AvailableCount < 1 && isNil "JDAM_RealodTriggered") then { 
		JDAM_RealodTriggered = true;
		[] spawn {
			sleep 60 * 30;
			dzn_JDAM_AvailableCount = 8;
			publicVariable "dzn_JDAM_AvailableCount";
			
			JDAM_RealodTriggered = nil;
		};
	};
}, 60]] call BIS_fnc_loop;