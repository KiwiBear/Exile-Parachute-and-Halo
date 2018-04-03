/*  
	Parachute from ExAd.. Modified by [FPS]kuplion
*/

waitUntil {!isNil "ExileClientLoadedIn"};
//uiSleep 0.1;
waitUntil {ExileClientLoadedIn};
//uiSleep 0.1;
waitUntil {alive player};

if (ExAd_HALOPARACHUTE_USE_ACTIONS) then
{
	if (isNil "ExAd_ACTION_PARACHUTE") then
	{
		ExAd_ACTION_PARACHUTE  = player addAction ["<t color='#E48A36'><img image='\a3\ui_f\data\gui\cfg\CommunicationMenu\supplydrop_ca.paa' /> Open Parachute!</t>", "call ExAd_fnc_pullParachute", [], 6, true, true, "", "call ExAd_fnc_showParachute"];
	};
	
	if (isNil "ExAd_ACTION_EJECT") then
	{
		ExAd_ACTION_EJECT  = player addAction ["<t color='#E48A36'><img image='\a3\ui_f\data\gui\cfg\CommunicationMenu\supplydrop_ca.paa' /> Halo Jump!</t>", "call ExAd_fnc_ejectPlayer", [], 6, false, true, "", "call ExAd_fnc_showEject;"];
	};
};

if (ExAd_HALOPARACHUTE_USE_KEY_ACTIONS) then
{
	ExAd_ACTION_HALOPARACHUTE_USE_KEY_ACTIONS = (findDisplay 46) displayAddEventHandler ["KeyDown",{
		if (_this select 1 == 47 && _this select 2 && _this select 4) then
		{
			if ((getPos player) select 2 > ExAd_ACTION_EJECT_HEIGHT && vehicle player != player) then
			{
				call ExAd_fnc_ejectPlayer;
			}
			else
			{
				if (call ExAd_fnc_showParachute) then
				{
					call ExAd_fnc_pullParachute;
				}
			}
		}
	}];
};

//waitUntil {!alive player};
if ((ExAd_HALOPARACHUTE_USE_ACTIONS) && (!alive player)) then
{
	player removeAction ExAd_ACTION_PARACHUTE;
	player removeAction ExAd_ACTION_EJECT;
	
	if (ExAd_HALOPARACHUTE_USE_KEY_ACTIONS) then
	{
		(findDisplay 46) displayRemoveEventHandler ["KeyDown", ExAd_ACTION_HALOPARACHUTE_USE_KEY_ACTIONS];
	};
};
