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
	Player Management 
------------------------------------------------------------------------]]--
function GetNetworkPlayers()
    local players = {}

    for i = 0, 31 do 
        if ( NetworkIsPlayerActive( i ) ) then 
            table.insert( players, i )
        end 
    end 

    if ( next( players ) == nil ) then return nil else return players end 
end 

--[[ function GeneratePlayerBans( id )
	local bans = { 0.016667, 0.085, 0.17, 0.25, 0.5, 1, 2, 3, 4, 5, 8, 10, 15, 20, 30, 40, 60, 120, 240, 480 }
	local options = {}

	for k, v in pairs( bans ) do 
		local option = {
			[ "menuName" ] = tostring( v ) .. " hours",
			[ "data" ] = {
				[ "action" ] = "adminban " .. id .. " " .. v
			}
		}

		table.insert( options, option )
	end 

	return options 
end ]]--

function GeneratePlayerAdminMenus( id )
	local serverid = GetPlayerServerId( id )

	local kick = {
		[ "menuName" ] = "Kick",
		[ "data" ] = {
			[ "action" ] = "adminkick " .. serverid
		}
	}

	local kick_reason = {
		[ "menuName" ] = "Kick (specify reason)", 
		[ "data" ] = {
			[ "action" ] = "adminkick input " .. serverid
		}
	}

	local temp_ban = {
		[ "menuName" ] = "Temp Ban", 
		[ "data" ] = {
			[ "action" ] = "admintempban " .. serverid
		}
	}

	--[[ local banOptions = GeneratePlayerBans( serverid )
	local ban = {
		[ "menuName" ] = "Ban", 
		[ "data" ] = {
			[ "sub" ] = 3
		}, 
		[ "submenu" ] = banOptions
	} ]]--

	local options = { kick, kick_reason, temp_ban }

	return options 
end 

RegisterNUICallback( "playermanagement", function( data, cb ) 
    local players = GetNetworkPlayers()
    local validOptions = {}
 
    for k, v in pairs( players ) do
    	local playerOptions = GeneratePlayerAdminMenus( v )

        table.insert( validOptions, {
            [ "menuName" ] = GetPlayerName( v ),
            [ "data" ] = {
                [ "sub" ] = GetPlayerServerId( v )
            },
            [ "submenu" ] = playerOptions
        } )
    end
 
    local customJSON = "{}"

    if ( getTableLength( validOptions ) > 0 ) then
        customJSON = json.encode( validOptions, { indent = true } )
    end
 
    SendNUIMessage( {
        createmenu = true,
        menuName = "playermanagement",
        menudata = customJSON
    } )
   
    if ( cb ) then cb( "ok" ) end
end )

RegisterNUICallback( "adminkick", function( data, cb ) 
	if ( data.action == "input" ) then 
		local id = tonumber( data.data[3] )
		local reason = requestInput( "", 60 )

		if ( reason ) then 
			TriggerServerEvent( 'mellotrainer:adminKick', id, "Kicked: " .. reason )
		end 
	else 
		local id = tonumber( data.action )

		TriggerServerEvent( 'mellotrainer:adminKick', id, "Kicked: You have been kicked from the server." )
	end 
end )

RegisterNUICallback( "admintempban", function( data, cb ) 
	local id = tonumber( data.action )
	TriggerServerEvent( 'mellotrainer:adminTempBan', id )
end )


--    _______ _                    ____        _   _                 
--   |__   __(_)                  / __ \      | | (_)                
--      | |   _ _ __ ___   ___   | |  | |_ __ | |_ _  ___  _ __  ___ 
--      | |  | | '_ ` _ \ / _ \  | |  | | '_ \| __| |/ _ \| '_ \/ __|
--      | |  | | | | | | |  __/  | |__| | |_) | |_| | (_) | | | \__ \
--      |_|  |_|_| |_| |_|\___|   \____/| .__/ \__|_|\___/|_| |_|___/
--                                      | |                          
--                                      |_|                          

-- Forward one hour
function getForwardTime()
	local hour = GetClockHours() + 1
	if(hour == 24)then
		hour = 0
	end
	return {h=hour,m=GetClockMinutes(),s=GetClockSeconds()}
end


-- Back one hour
function getReverseTime()
	local hour = GetClockHours() - 1
	if(hour < 0)then
		hour = 23
	end
	return {h=hour,m=GetClockMinutes(),s=GetClockSeconds()}
end



-- Update time
RegisterNetEvent('mellotrainer:updateTime')
AddEventHandler('mellotrainer:updateTime', function(h,m,s)
	--Citizen.Trace("Time Updated")
	NetworkOverrideClockTime(h,m,s)
end)




RegisterNUICallback("time", function(data, cb)
	local h,m,s
	local action = data.action
	if (action == "input") then
		local request = tonumber(requestInput("", 2))

		if (request == nil) or (request > 24) or (request < 0) then
			drawNotification("~r~You must specify a number from 0-24.")
			return
		else
			h=request
			m=0
			s=0
		end
	elseif(action == "forwards")then
		local time = getForwardTime()
		h=time.h
		m=time.m
		s=time.s
	elseif(action == "backwards")then
		local time = getReverseTime()
		h=time.h
		m=time.m
		s=time.s
	else
		h=tonumber(data.action) or 0
		m=0
		s=0
	end
	TriggerServerEvent("mellotrainer:adminTime", PlayerId(), h,m,s)
	drawNotification("~g~Time changed to "..tostring(h)..":"..string.format("%02d", tostring(m)))
end)



-- __          __        _   _                  ____        _   _                 
-- \ \        / /       | | | |                / __ \      | | (_)                
--  \ \  /\  / /__  __ _| |_| |__   ___ _ __  | |  | |_ __ | |_ _  ___  _ __  ___ 
--   \ \/  \/ / _ \/ _` | __| '_ \ / _ \ '__| | |  | | '_ \| __| |/ _ \| '_ \/ __|
--    \  /\  /  __/ (_| | |_| | | |  __/ |    | |__| | |_) | |_| | (_) | | | \__ \
--     \/  \/ \___|\__,_|\__|_| |_|\___|_|     \____/| .__/ \__|_|\___/|_| |_|___/
--                                                   | |                          
--                                                   |_|                          



-- Change Weather Type
function changeWeatherType(type, freezeToggle)
	SetOverrideWeather(type)
	if(freezeToggle)then
		ClearWeatherTypePersist()
		SetWeatherTypePersist(type)
	end
end


-- Blackout
RegisterNetEvent('mellotrainer:updateBlackout')
AddEventHandler('mellotrainer:updateBlackout', function(toggle)
	SetBlackout(toggle)
end)


-- Wind
RegisterNetEvent('mellotrainer:updateWind')
AddEventHandler('mellotrainer:updateWind', function(toggle, heading)
	if(toggle) then
		SetWind(1.0)
		SetWindSpeed(11.99);
		SetWindDirection(heading)
	else
		SetWind(0.0)
		SetWindSpeed(0.0);
	end
end)


-- Weather
RegisterNetEvent('mellotrainer:updateWeather')
AddEventHandler('mellotrainer:updateWeather', function(weatherString, toggle)
	SetOverrideWeather(weatherString)
	if(toggle)then
		ClearWeatherTypePersist()
		SetWeatherTypePersist(weatherString)
	end
end)


RegisterNUICallback("weatheroptions", function(data, cb)
	local action = data.action
	local newstate = data.newstate

	-- Notification Toggle Text
	local text = "~r~OFF"
	if(newstate) then
		text = "~g~ON"
	end


	if(action == "wind")then
		featureWeatherWind = newstate
		local heading = GetEntityHeading(PlayerPedId())
		TriggerServerEvent("mellotrainer:adminWind", PlayerId(), featureWeatherWind, heading)
		drawNotification("Wind "..text)
	elseif(action == "freeze")then
		featureWeatherFreeze = newstate
		drawNotification("Persistent Weather "..text.."~w~, Select weather to apply")
	elseif(action == "blackout")then
		featureBlackout = newstate
		TriggerServerEvent("mellotrainer:adminBlackout", PlayerId(), featureBlackout)
		drawNotification("Blackout "..text)
	end

end)

RegisterNUICallback("weather", function(data, cb)
	local weather = data.action

	TriggerServerEvent("mellotrainer:adminWeather", PlayerId(), weather, featureWeatherFreeze)

	drawNotification("Weather changed to ~g~" .. weather .. ".")
	cb("ok")
end)



RegisterNetEvent("mellotrainer:adminstatus")
AddEventHandler("mellotrainer:adminstatus", function(status)
	if(status)then
		SendNUIMessage({adminaccess = true})
	else
		drawNotification("~r~You are not an admin!")
	end		
end)

-- Only show menu if they are an admin
RegisterNUICallback("requireadmin", function(data, cb)
	TriggerServerEvent("mellotrainer:isAdmin")
end)

-- Wait until in game to trigger proper join
Citizen.CreateThread(function()
	while true do
		Citizen.Wait( 0 )

		if NetworkIsSessionStarted() then
			TriggerServerEvent( "mellotrainer:firstJoinProper", PlayerId() )
			return
		end
	end
end )