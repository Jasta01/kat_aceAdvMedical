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
 * [cursorTarget] call kat_aceExposure_fnc_handleDamage_fractures;
 *
 * Public: No
 */

params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];

if !(kat_aceExposure_fractures_enable) exitWith {};

private _newFracture = [];

private _oldFractures = _unit getVariable ["kat_aceExposure_fractures", []];
_oldFractures pushBack _newFracture;
_unit setVariable ["kat_aceExposure_fractures", [], true];
