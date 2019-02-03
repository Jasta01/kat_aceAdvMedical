/*
 * Author: Katalam
 * CBA Events function
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call kat_aceExposure_fnc_events;
 *
 * Public: No
 */

 ["treatmentSAM", {_this call kat_aceExposure_fnc_treatment_SAMLocal}] call CBA_fnc_addEventHandler;
