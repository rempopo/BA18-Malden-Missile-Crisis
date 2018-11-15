/*
 *	JDAM Support script
 *	Client side script
 */
 
dzn_fnc_B_showStrikeCallMenu = {
	
	(player getVariable ["#rev",0]) params ["_reviveState"];
	
	if (!alive player || !(_reviveState < 2)) exitWith {};
	if !(call TFAR_fnc_haveLRRadio ) exitWith { hint "Для запроса авиаудара у вас должна быть ДВ рация!"; };
	if (isNil "dzn_JDAM_AvailableCount" || { dzn_JDAM_AvailableCount < 1 }) exitWith { hint "Не осталось JDAM для выполнения удара!"; };
	if (diag_tickTime < dzn_JDAM_RequestTimeout) exitWith { hint "Запрос выполняется, ожидайте"; };
	
	hint ":::> LINK-16 connection established";
	
	[
		[0, "HEADER", format ["<t font='PuristaBold'>JDAM Strike Call-In</t> (%1 left)", dzn_JDAM_AvailableCount]]
		, [1, "LABEL", "<t align='center'>Viper 1`1, this is Riven 1`1,</t>"]
		, [2, "LABEL", "<t align='right'>requesting JDAM strike at 8-grid </t>"]
		, [2, "INPUT"]
		, [3, "LABEL",""]
		, [4, "BUTTON", "CANCEL", { closeDialog 2; }]
		, [4, "LABEL", ""]
		, [4, "BUTTON", "REQUEST", {
			(_this select 0) call dzn_fnc_B_requestStrike;
			closeDialog 2;
		}]	
	] call dzn_fnc_ShowAdvDialog
};

dzn_fnc_B_requestStrike = {
	params ["_gridpos"];
	
	private _pos = _gridpos call dzn_fnc_getPosOnMapGrid;	
	
	if !(_pos inArea AreaOfOperations) exitWith { 
		hint parseText "<t color='#42aaf4' align='center' font='PuristaBold' size='1.5'>Viper 1`1</t><br />Указанные координаты вне зоны операции! Атака отменяется!"; 
	};
	
	hint parseText format [
		"<t color='#42aaf4' align='center' font='PuristaBold' size='1.5'>Viper 1`1</t><br />Координаты получены, посылка на месте через %1 секунд. Конец." 
		, dzn_JDAM_StrikeTimeout
	];
	
	dzn_JDAM_RequestTimeout = diag_tickTime + dzn_JDAM_RequestTimeoutSetting;
	dzn_JDAM_AvailableCount = dzn_JDAM_AvailableCount - 1;
	publicVariable "dzn_JDAM_RequestTimeout";
	publicVariable "dzn_JDAM_AvailableCount";
	
	[_pos] remoteExec ["dzn_fnc_server_requestStrike", 2];
	
	[] spawn {
		uiSleep 27;
		hint parseText "<t color='#42aaf4' align='center' font='PuristaBold' size='1.5'>Viper 1`1</t><br />Посылка прибывает. Конец.";
	};
};

dzn_fnc_addJDAMRequestButton = {
	waitUntil { !isNull findDisplay 12 };
	disableSerialization;
	
	private _fnc_createClickableLabel = {
		params ["_display", "_label", "_code", "_xpos", "_ypos", "_w", "_h", ["_bg", [0,0,0,1]], ["_tooltip", ""]];

		if (!isNil "_code") then {
			private _strCode = ((str(_code) splitString "") select [1, count str(_code) - 2]) joinString "";
			_code = compile format [
				'params ["_control", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"]; %1'
				, _strCode
			];
		};

		private _ctrl = _display ctrlCreate ["RscStructuredText", -1];
		_ctrl ctrlSetStructuredText parseText _label;
		_ctrl ctrlSetBackgroundColor _bg;
		_ctrl ctrlSetPosition [_xpos, _ypos, _w, _h];

		if (!isNil "_code") then {
			_ctrl ctrlAddEventHandler ["MouseButtonDown", _code];
		};

		if (_tooltip != "") then {
			_ctrl ctrlSetTooltip _tooltip;
		};

		_ctrl ctrlCommit 0;

		(_ctrl)
	};
	
	private _gX = (((safezoneW / safezoneH) min 1.2) / 40);
	private _gY = ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25);	
	
	private _ctrl1 = [
		findDisplay 12
		, "SUPPORT:"
		, nil
		, ( safezoneX + safezoneW - 63 * _gX )
		, ( 30 * _gY + (safezoneY) )
		, 12 * _gX
		, 1 * _gY
		, [0,0,0,0.5]
	] call _fnc_createClickableLabel;
	
	private _ctrl2 = [
		findDisplay 12
		, "F-22 / VIPER-1-1"
		, { call dzn_fnc_B_showStrikeCallMenu }
		, ( safezoneX + safezoneW - 63 * _gX )
		, ( 31 * _gY + (safezoneY) )
		, 12 * _gX
		, 1 * _gY
		, [0,0,0,1]
		, "Request JDAM strike"
	] call _fnc_createClickableLabel;
};

[] spawn dzn_fnc_addJDAMRequestButton;