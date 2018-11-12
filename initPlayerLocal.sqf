/*
 *	Removes markers from opposite side
 */
if (side player == west) then {
	deleteMarkerLocal "respawn_east";	
	allMapMarkers apply { if (["mrk_o", _x] call BIS_fnc_inString) then { deleteMarkerLocal _x; } };
	
	/*
	 *	JDAM and AAA 
	 */
	#include "Scripts\client_JDAMSupport.sqf"
};

if (side player == east) then {
	deleteMarkerLocal "respawn_west";	
	allMapMarkers apply { if (["mrk_b", _x] call BIS_fnc_inString) then { deleteMarkerLocal _x; } };
	
	// --- Auto-Revive
	["itemAdd", ["dzn_OPFOR_AutoRevive", {
		private _rev = player getVariable "#rev";
		if (
			!isNil { _rev }
			&& isNil "dzn_client_reviveStarted"
			&& { _rev isEqualTo 2 || (typename _rev == "ARRAY" && { (_rev # 0) isEqualTo 2 }) }
		) then {
			dzn_client_reviveStarted = true;
			[] spawn {
				for "_i" from 60 to 0 step -1 do {
					hintSilent format ["Revive in %1 sec", _i];
					uiSleep 1;
				};
				
				player setDamage 0;
		
				["", 1, player] call BIS_fnc_reviveOnState;
				player setVariable ["#rev", 1];

				// --- ACE Healing
				if (!isNil "ace_medical_fnc_treatmentAdvanced_fullHealLocal") then {
					[player ,player] call ace_medical_fnc_treatmentAdvanced_fullHealLocal;
				};
			
				dzn_client_reviveStarted = nil;
			};
		};
	}, 5]] call BIS_fnc_loop;
};

