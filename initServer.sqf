/*
 *	You can change MissionDate to some specific date to override date set in mission editor:
 *		format:		[@Year, @Month, @Day, @Hours, @Minutes] (e.g. [2012, 12, 31, 12, 45])
 */
MissionDate = [
	date select 0
	, date select 1
	, date select 2
	, switch ("par_daytime" call BIS_fnc_getParamValue) do {
		case 0: { 10 + round(random 4) };
		case 1: { 
			private _hrs = 21 + round(random 8); 
			if (_hrs >= 24) then { _hrs = _hrs - 24; }; 
			_hrs 
		};
		case 2: { 6 };
		case 3: { round(random 23) };
	}
	, selectRandom [0,10,15,20,25,30,40,45,50]
];
publicVariable "MissionDate";

/*
 * Date
 */
setDate MissionDate;

/*
 *	Weather
 */
if (!isNil "dzn_fnc_setWeather") then {
	("par_weather" call BIS_fnc_getParamValue) spawn dzn_fnc_setWeather;
};


/*
 *	Collect Some Player connection data
 */
PlayerConnectedData = [];
PlayerConnectedEH = addMissionEventHandler ["PlayerConnected", {
	diag_log "Client connected";
	diag_log _this;
	// [ DirectPlayID, getPlayerUID player, name player, @bool, clientOwner ]
	PlayerConnectedData pushBack _this;
	publicVariable "PlayerConnectedData";
}];


/*
 *	Weapon center of masses
 */

{
	_x setCenterOfMass [(getCenterOfMass _x) vectorAdd [ 0, 0, -1 ], 0 ];
	_x setMass [1,0];
} forEach (synchronizedObjects StaticWeaponsLogic);
deleteVehicle StaticWeaponsLogic;

/*
 *	Process Dynai Indoor logics
 */

((entities "Logic") select { _x getVariable ['dzn_dynai_setBehavior', ""] == 'indoor' }) apply { (synchronizedObjects _x) apply { doStop _x } };
 
 
/*
 *	Spawn vehicles for OPFOR QRF
 */
[
	["par_opfor_vehicleClass1", O_VehiclePosition_1]
	, ["par_opfor_vehicleClass2", O_VehiclePosition_2]
] apply {
	[ 
		_x # 1
		, ["rhs_tigr_sts_vmf", "rhs_btr80_vmf", "rhs_btr80a_vmf", "rhs_bmp2k_vmf"] select ((_x # 0) call BIS_fnc_getParamValue)
		, "cargo_kit_o_vehicle"
	] call dzn_fnc_createVehicle;
};




/*
 *	JDAM and AAA 
 */
 
#include "Scripts\server_JDAMSupport.sqf"

/*
 *	BLUFOR Detection
 */
#include "Scripts\server_BluforDetection.sqf"

/*
 *	Add some units NVGs
 */

#include "Scripts\server_NVGsToGroupLeaders.sqf"
