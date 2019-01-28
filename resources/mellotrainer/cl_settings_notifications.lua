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

local selfDeathMessage = "~o~You ~s~died."
local deathSuicideMessage = "~o~You ~s~commited suicide."

-- Hold dead players to prevent multiple messages.
local deadPlayers = {}

--[[RegisterNUICallback("notifications", function(data, cb)
	local action = data.action
	local state = data.newstate
	local request = data.data[3]
	local text,text2

	if(state) then
		text = "~g~ON"
		text2 = "~r~OFF"
	else
		text = "~r~OFF"
		text2 = "~g~ON"
	end

	if(action=="players")then
		featurePlayerNotifications = state
		drawNotification("Player Notifications: "..text)

	elseif(action=="death")then
		featureDeathNotifications = state
		drawNotification("Death Notifications: "..text)
	end

	if(cb)then cb("ok") end
end)

RegisterNetEvent( 'mellotrainer:playerJoined' )
AddEventHandler( 'mellotrainer:playerJoined', function( ID )
	local id = tonumber( ID )
	if ( featurePlayerNotifications and id ~= PlayerId() ) then
		local name = GetPlayerName( id )
		drawNotification( "~g~<C>"..name.."</C> ~s~joined." )
	end
end )

RegisterNetEvent( 'mellotrainer:playerLeft' )
AddEventHandler( 'mellotrainer:playerLeft', function( name )
	if ( featurePlayerNotifications ) then
		drawNotification( "~r~<C>" .. name .. "</C> ~s~left." )
	end
end )

-- Better Death Messages
function killActionFromWeaponHash(weaponHash)
	if (weaponHash ~= nil)then
		if (weaponHash == GetHashKey("WEAPON_RUN_OVER_BY_CAR") or weaponHash == GetHashKey("WEAPON_RAMMED_BY_CAR")) then
			return "flattened";
		end
		if (weaponHash == GetHashKey("WEAPON_CROWBAR") or weaponHash == GetHashKey("WEAPON_BAT") or weaponHash == GetHashKey("WEAPON_HAMMER") or weaponHash == GetHashKey("WEAPON_GOLFCLUB") or weaponHash == GetHashKey("WEAPON_NIGHTSTICK") or weaponHash == GetHashKey("WEAPON_KNUCKLE")) then
			return "whacked";
		end
		if (weaponHash == GetHashKey("WEAPON_DAGGER") or weaponHash == GetHashKey("WEAPON_KNIFE")) then
			return "stabbed";
		end
		if (weaponHash == GetHashKey("WEAPON_SNSPISTOL") or weaponHash == GetHashKey("WEAPON_HEAVYPISTOL") or weaponHash == GetHashKey("WEAPON_VINTAGEPISTOL") or weaponHash == GetHashKey("WEAPON_PISTOL") or weaponHash == GetHashKey("WEAPON_APPISTOL") or weaponHash == GetHashKey("WEAPON_COMBATPISTOL") or weaponHash == GetHashKey("WEAPON_SNSPISTOL")) then
			return "shot";
		end
		if (weaponHash == GetHashKey("WEAPON_GRENADELAUNCHER") or weaponHash == GetHashKey("WEAPON_HOMINGLAUNCHER") or weaponHash == GetHashKey("WEAPON_STICKYBOMB") or weaponHash == GetHashKey("WEAPON_PROXMINE") or weaponHash == GetHashKey("WEAPON_RPG") or weaponHash == GetHashKey("WEAPON_EXPLOSION") or weaponHash == GetHashKey("VEHICLE_WEAPON_TANK")) then
			return "bombed";
		end
		if (weaponHash == GetHashKey("WEAPON_MICROSMG") or weaponHash == GetHashKey("WEAPON_SMG") or weaponHash == GetHashKey("WEAPON_ASSAULTSMG") or weaponHash == GetHashKey("WEAPON_MG") or weaponHash == GetHashKey("WEAPON_COMBATMG") or weaponHash == GetHashKey("WEAPON_COMBATPDW") or weaponHash == GetHashKey("WEAPON_MINIGUN")) then
			return "sprayed";
		end
		if (weaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") or weaponHash == GetHashKey("WEAPON_CARBINERIFLE") or weaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") or weaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") or weaponHash == GetHashKey("WEAPON_SPECIALCARBINE") or weaponHash == GetHashKey("WEAPON_GUSENBERG")) then
			return "rifled";
		end
		if (weaponHash == GetHashKey("WEAPON_MARKSMANRIFLE") or weaponHash == GetHashKey("WEAPON_SNIPERRIFLE") or weaponHash == GetHashKey("WEAPON_HEAVYSNIPER") or weaponHash == GetHashKey("WEAPON_ASSAULTSNIPER") or weaponHash == GetHashKey("WEAPON_REMOTESNIPER")) then
			return "sniped";
		end
		if (weaponHash == GetHashKey("WEAPON_BULLPUPSHOTGUN") or weaponHash == GetHashKey("WEAPON_ASSAULTSHOTGUN") or weaponHash == GetHashKey("WEAPON_PUMPSHOTGUN") or weaponHash == GetHashKey("WEAPON_HEAVYSHOTGUN") or weaponHash == GetHashKey("WEAPON_SAWNOFFSHOTGUN")) then
			return "shotgunned";
		end
		if (weaponHash == GetHashKey("WEAPON_HATCHET") or weaponHash == GetHashKey("WEAPON_MACHETE")) then
			return "eviscerated";
		end
		if (weaponHash == GetHashKey("WEAPON_MOLOTOV")) then
			return "torched";
		end
		return "murdered";
	end
	return "murdered";
end

-- Other Player died
function handlePlayerDeathMessage( pedID, currentPed )
	local me = PlayerId()
	local entity, weaponHash = NetworkGetEntityKillerOfPlayer( pedID )
	local name = GetPlayerName( pedID )

	local msg = "~o~<C>" .. name .. "</C> ~s~died."

	if ( IsPedAPlayer( entity ) ) then
		local killer = NetworkGetPlayerIndexFromPed( entity )
		local kname = GetPlayerName( killer )

		if ( kname == name ) then
			msg = "~o~<C>" .. name .. "</C> ~s~commited suicide."
		elseif ( kname == GetPlayerName( me ) )then
			msg = "~o~<C>You</C> ~s~" .. killActionFromWeaponHash( weaponHash ) .. " ~o~<C>" .. name .. "</C>~s~."
		else
			msg = "~y~<C>" .. kname .. "</C> ~s~" .. killActionFromWeaponHash( weaponHash ) .. " ~o~<C>" .. name .. "</C>~s~."
		end
	end

	drawNotification( msg )
end


-- Check for death messages
function checkForDeaths()
    local me = PlayerId()

    for i = 0, maxPlayers, 1 do
        if ( NetworkIsPlayerConnected( i ) ) then
        	local currentPed = GetPlayerPed( i )

        	if ( DoesEntityExist( currentPed ) and IsEntityDead( currentPed ) ) then 

        		if(deadPlayers[i] == nil)then
	       			handlePlayerDeathMessage( i, currentPed )
	       			deadPlayers[i] = true
	       		end
	       	else
				deadPlayers[i] = nil	       		
			end
		end
	end
end


Citizen.CreateThread( function()
	while true do
		Citizen.Wait( 0 )

		if ( featureDeathNotifications ) then
			checkForDeaths()
		end
	end
end )]]--