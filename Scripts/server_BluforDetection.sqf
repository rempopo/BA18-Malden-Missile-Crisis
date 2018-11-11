/*
 *	BLUFOR detection script - draws marker on blufor position spotted by opfor AI units
 */

waitUntil { !isNil "dzn_dynai_initialized" && { dzn_dynai_initialized } };

// --- Detection timeout settings
dzn_BLUFOR_DetectionMarkerTimeout = 30; // Spotting loop timeout
dzn_BLUFOR_DetectionMarkerUpdateTimeout = 15; // Timeout for spotting marker update
dzn_BLUFOR_DetectionTargetAgeMax = 60; // Max. target age to be spotted
dzn_BLUFOR_DetectionDeleteTimeout = 120; // Timeout for spotting marker before deletion
dzn_BLUFOR_DetectionMakeOldTimeout = 30; // Timeout for spotting marker before making it half-transperent

// --- Init
dzn_BLUFOR_DetectionMarkers = [];
dzn_OPFOR_Groups = allGroups select {side _x == EAST};

dzn_fnc_drawDetectionMarker = {
	params["_tgt"];
	
	private _mrk = [
		format["mrk_d_%1", diag_tickTime]
		, _tgt getPos [random 50, random 360]
		, "hd_warning", "ColorBlue", "", false
	] call dzn_fnc_createMarkerIcon;
	_mrk setMarkerAlpha 0;
	
	dzn_BLUFOR_DetectionMarkers pushBack [
		_mrk
		, diag_tickTime + dzn_BLUFOR_DetectionMakeOldTimeout
		, diag_tickTime + dzn_BLUFOR_DetectionDeleteTimeout
		, diag_tickTime
	];
};

dzn_fnc_publicDetectionMarkers = {
	if (hasInterface && {side player == east}) then {
		{ 
			_x params ["_mrk", "_oldTimeout", "", "_foundTime"];
			
			_mrk setMarkerAlphaLocal (if (diag_tickTime >= _oldTimeout) then { 0.5 } else { 1 });
			_mrk setMarkerTextLocal format ["%1s ago", round(diag_tickTime - _foundTime)];
		} forEach dzn_BLUFOR_DetectionMarkers;
	};

	if (isServer) exitWith {
		[] remoteExec ["dzn_fnc_publicDetectionMarkers", -2];
	};
};
publicVariable "dzn_fnc_publicDetectionMarkers";

["itemAdd", [
	"BLUFOR_Detection_CreateMarkerLoop"
	, { 
		// --- Get targets and call detection markers drawing
		private _tgtsFull = [];
		{
			private _leader = (leader _x);
			if (alive _leader) then {
				private _tgts = _leader targets [true, 800, [west], dzn_BLUFOR_DetectionTargetAgeMax];
				if !(_tgts isEqualTo []) then {
					{
						if (_leader knowsAbout _x >= 1 && _leader distance2d _x < 500) then {
							if (_tgtsFull pushBackUnique _x > -1) then {
								[_x] call dzn_fnc_drawDetectionMarker; 
							};
						};
					} forEach _tgts;
				};
			};
		} forEach dzn_OPFOR_Groups;
	}
	, dzn_BLUFOR_DetectionMarkerTimeout
]] call BIS_fnc_loop;

["itemAdd", [
	"BLUFOR_Detection_UpdateMarkerLoop"
	, { 
		// --- Clear outdated markers, draw and update text/opacity of existing markers on clients
		private _toRemove = [];
		{ 
			if (diag_tickTime >= _x # 2) then { 
				deleteMarker (_x # 0);
				_toRemove pushBack _x; 
			}; 
		} forEach dzn_BLUFOR_DetectionMarkers;
		dzn_BLUFOR_DetectionMarkers = dzn_BLUFOR_DetectionMarkers - _toRemove;
		_toRemove = [];		
		
		publicVariable "dzn_BLUFOR_DetectionMarkers";
		[] call dzn_fnc_publicDetectionMarkers;		
	}
	, dzn_BLUFOR_DetectionMarkerUpdateTimeout
]] call BIS_fnc_loop;