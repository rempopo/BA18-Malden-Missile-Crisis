/*
 *	Add NVG to team leaders is it night
 */

waitUntil { !isNil "dzn_dynai_initialized" && { dzn_dynai_initialized } && { !isNil "dzn_OPFOR_Groups"} };

if (daytime < 9 || daytime > 18) then {
	#define NVG_ITEM "NVGoggles_OPFOR"
	
	{
		if (!isPlayer (leader _x)) then {
			[(leader _x), NVG_ITEM] remoteExec ["addWeapon", leader _x];
		};
	} forEach dzn_OPFOR_Groups;
};
