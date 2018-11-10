/*
 *	Removes markers from opposite side
 */
if (side player == west) then {
	deleteMarkerLocal "respawn_east";	
	allMapMarkers apply { if (["mrk_o", _x] call BIS_fnc_inString) then { deleteMarkerLocal _x; } };
};

if (side player == east) then {
	deleteMarkerLocal "respawn_west";	
	allMapMarkers apply { if (["mrk_b", _x] call BIS_fnc_inString) then { deleteMarkerLocal _x; } };
};

