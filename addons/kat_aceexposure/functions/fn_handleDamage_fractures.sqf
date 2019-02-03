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
 * [player, "leg_l", 0.8, ] call kat_aceExposure_fnc_handleDamage_fractures;
 *
 * Public: No
 */

params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];

// ATTENTION: _source != _cause

if !(kat_aceExposure_fractures_enable) exitWith {};

// Find the proper attributes
private _oldFractures = _unit getVariable ["kat_aceExposure_fractures", [0,0,0,0,0,0]];
private _selectioNumber = [_selection] call ace_medical_fnc_selectionNameToNumber;

if !(_oldFractures select _selectioNumber isEqualTo 0) exitWith {};

private _path = (configFile >> "ACE_Medical_Advanced" >> "Injuries" >> "fractures");

private _subClass = _path call BIS_fnc_getCfgSubClasses;
private _newFractures = [];
{
	private _pathNew = (_path >> _x);
	private _selections = getArray (_pathNew >> "selections");
	private _cause = getArray (_pathNew >> "causes");
	if (_selection in _selections && _projectile in _cause) then {
		_newFractures pushBack _x;
	};
} forEach _subClass;

if (_newFractures isEqualTo []) exitWith {};
if (random(100) > kat_aceExposure_fractures_probability) exitWith {};

private _fracture = selectRandom _newFractures;
_path = (_path >> _fracture);
private _minDamage = getNumber (_path >> "minDamage");
private _pain = getNumber (_path >> "pain");
if (_damage < _minDamage) exitWith {};


_oldFractures set [_selectioNumber, [_fracture]];
_unit setVariable ["kat_aceExposure_fractures", _oldFractures, true];

private _select = _selection select [0, 3];

switch (true) do {
    case (_select isEqualto "leg"): {
        _unit forceWalk true;
    };
	case (_select isEqualTo "han"): {
	    [_unit, "kat_fracture", 200, true] call ace_common_fnc_setAimCoef;
	};
};
[_unit, _pain] call ace_medical_fnc_adjustPainLevel;
