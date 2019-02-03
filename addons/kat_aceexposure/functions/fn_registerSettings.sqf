/*
 * Author: Katalam
 * CBA Settings function
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call kat_aceExposure_fnc_registerSettings;
 *
 * Public: No
 */

#define CBA_SETTINGS_CAT "KAT - ACE Exposure"

//Enable aceExposure things
[
	"kat_aceExposure_enable",
	"CHECKBOX",
	localize "STR_kat_aceExposure_SETTING_ENABLE",
	CBA_SETTINGS_CAT,
	[true],
	true
] call CBA_Settings_fnc_init;

[
	"kat_aceExposure_fractures_enable",
	"CHECKBOX",
	localize "STR_kat_aceExposure_SETTING_FRACTURES_ENABLE",
	CBA_SETTINGS_CAT,
	[true],
	true
] call CBA_Settings_fnc_init;

[
	"kat_aceExposure_fractures_probability",
	"SLIDER",
	localize "STR_kat_aceExposure_SETTING_FRACTURES_PROBABILITY",
	CBA_SETTINGS_CAT,
	[0, 100, 20, 0],
	true
] call CBA_Settings_fnc_init;

nil;
