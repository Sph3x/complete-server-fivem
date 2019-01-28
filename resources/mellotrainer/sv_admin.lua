--[[--------------------------------------------------------------------------
	*
	* Mello Trainer
	* (C) Michael Goodwin 2017
	* http://github.com/thestonedturtle/mellotrainer/releases
	*
	* This menu used the Scorpion Trainer as a framework to build off of.
	* https://github.com/pongo1231/ScorpionTrainer
	* (C) Emre Cürgül 2017
	* 
	* A lot of useful functionality has been converted from the lambda menu.
	* https://lambda.menu
	* (C) Oui 2017
	*
	* Additional Contributors:
	* WolfKnight (https://forum.fivem.net/u/WolfKnight)
	*
---------------------------------------------------------------------------]]


--[[------------------------------------------------------------------------
	Kick Player 
------------------------------------------------------------------------]]--
RegisterServerEvent( 'mellotrainer:adminKick' )
AddEventHandler( 'mellotrainer:adminKick', function( id, reason ) 
	DropPlayer( id, reason )
end )

--[[------------------------------------------------------------------------
	Temp Ban Player 
------------------------------------------------------------------------]]--
local tempBannedUsers = {}

RegisterServerEvent( 'mellotrainer:adminTempBan' )
AddEventHandler( 'mellotrainer:adminTempBan', function( id ) 
	local license = DATASAVE:GetIdentifier( id, "license" )

	if ( license ~= nil ) then 
		tempBannedUsers[license] = true 
		DATASAVE:print( GetPlayerName( id ) .. " has been temporarily banned by " .. GetPlayerName( source ) .. "." )
		DropPlayer( id, "Banned: You have been temporarily banned." )
	end 
end )

AddEventHandler( 'playerConnecting', function( name, setReason ) 
	local license = DATASAVE:GetIdentifier( source, "license" )

	if ( license ~= nil ) then 
		if ( tempBannedUsers[license] ) then 
			DATASAVE:print( GetPlayerName( source ) .. " is temporarily banned, refusing connection." )
			setReason( "Banned: You have been temporarily banned." )
			CancelEvent()
		end 
	end 
end )

--    _______ _                    ____        _   _                 
--   |__   __(_)                  / __ \      | | (_)                
--      | |   _ _ __ ___   ___   | |  | |_ __ | |_ _  ___  _ __  ___ 
--      | |  | | '_ ` _ \ / _ \  | |  | | '_ \| __| |/ _ \| '_ \/ __|
--      | |  | | | | | | |  __/  | |__| | |_) | |_| | (_) | | | \__ \
--      |_|  |_|_| |_| |_|\___|   \____/| .__/ \__|_|\___/|_| |_|___/
--                                      | |                          
--                                      |_|                          

RegisterServerEvent('mellotrainer:adminTime')
AddEventHandler('mellotrainer:adminTime', function(from, hour, minutes, seconds)
	TriggerClientEvent('mellotrainer:updateTime', -1, hour, minutes, seconds)
end)



-- __          __        _   _                  ____        _   _                 
-- \ \        / /       | | | |                / __ \      | | (_)                
--  \ \  /\  / /__  __ _| |_| |__   ___ _ __  | |  | |_ __ | |_ _  ___  _ __  ___ 
--   \ \/  \/ / _ \/ _` | __| '_ \ / _ \ '__| | |  | | '_ \| __| |/ _ \| '_ \/ __|
--    \  /\  /  __/ (_| | |_| | | |  __/ |    | |__| | |_) | |_| | (_) | | | \__ \
--     \/  \/ \___|\__,_|\__|_| |_|\___|_|     \____/| .__/ \__|_|\___/|_| |_|___/
--                                                   | |                          
--                                                   |_|                          

RegisterServerEvent('mellotrainer:adminWeather')
AddEventHandler('mellotrainer:adminWeather', function(from, weatherState, persistToggle)
	TriggerClientEvent('mellotrainer:updateWeather', -1, weatherState, persistToggle)
end)


RegisterServerEvent('mellotrainer:adminBlackout')
AddEventHandler('mellotrainer:adminBlackout', function(from, toggle)
	TriggerClientEvent('mellotrainer:updateBlackout', -1, toggle)
end)




RegisterServerEvent('mellotrainer:adminWind')
AddEventHandler('mellotrainer:adminWind', function(from, state, heading)
	TriggerClientEvent('mellotrainer:updateWind', -1, state, heading)
end)