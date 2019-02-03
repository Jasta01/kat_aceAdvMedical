/*
 * Author: Katalam
 * Handle damage for fractures
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorTarget] call kat_aceExposure_fnc_SAM;
 *
 * Public: No
 */

params ["_caller", "_target", "_className"];

if (local _target) then {
	["treatmentSAM", [_caller, _target, _className]] call CBA_fnc_localEvent;
} else {
	["treatmentSAM", [_caller, _target, _className], _target] call CBA_fnc_targetEvent;
};

true;
