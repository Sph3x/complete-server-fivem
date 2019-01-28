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
--Not Needed? 
--require("map.lua") -- Require map.lua so we can call the toggleMapBlips function.

-- Variables used for this part of the trainer.
local playerdb = {}

-- Creates an empty table of tables to hold the blip/ped information for users.
for i=0, maxPlayers, 1 do
	playerdb[i] = {}
end




--[[
  _   _   _    _   _____      _____           _   _   _                      _          
 | \ | | | |  | | |_   _|    / ____|         | | | | | |                    | |         
 |  \| | | |  | |   | |     | |        __ _  | | | | | |__     __ _    ___  | | __  ___ 
 | . ` | | |  | |   | |     | |       / _` | | | | | | '_ \   / _` |  / __| | |/ / / __|
 | |\  | | |__| |  _| |_    | |____  | (_| | | | | | | |_) | | (_| | | (__  |   <  \__ \
 |_| \_|  \____/  |_____|    \_____|  \__,_| |_| |_| |_.__/   \__,_|  \___| |_|\_\ |___/
--]]



RegisterNUICallback("settingtoggle", function(data, cb)
	local action = data.action
	local newstate = data.newstate
	local text,text2

	if(newstate) then
		text = "~g~ON"
		text2 = "~r~OFF"
	else
		text = "~r~OFF"
		text2 = "~g~ON"
	end


	--Hud Toggle
	if(action == "hud")then
		featureHideHud = newstate
		DisplayHud(not featureHideHud)
		drawNotification("Hud Display: "..tostring(text2))

	-- Radr Toggle
	elseif(action == "radar")then
		featureHideMap = newstate
		DisplayRadar(not featureHideMap)
		drawNotification("Radar Display: "..tostring(text2))

	-- Large Map Toggle
	elseif(action == "enlarge")then
		featureBigHud = newstate
		SetRadarBigmapEnabled(featureBigHud, false)
		drawNotification("Large Map: "..tostring(text))	

	-- Player Blip Toggle
	elseif(action == "blips")then
		featurePlayerBlips = newstate
		drawNotification("Player Blips: "..tostring(text))

	-- Player Overhead Name Toggle
	elseif(action == "text")then
		featurePlayerHeadDisplay = newstate
		drawNotification("Overhead Player Names: "..tostring(text))

	-- Street Name Toggle
	elseif(action == "streets")then
		featureAreaStreetNames = newstate
		drawNotification("Street Names: "..tostring(text2))

	-- Map Location Blips
	elseif(action == "mapblips")then
		featureMapBlips = newstate
		toggleMapBlips(featureMapBlips) -- In maps.lua

	-- Radio Always Off
	elseif(action=="radiooff")then
		featureRadioAlwaysOff = newstate
		drawNotification("Radio Always Off: "..text)

	-- Mobile Radio 
	elseif(action=="mobileradio")then
		featurePlayerRadio = newstate
		SetMobileRadioEnabledDuringGameplay(featurePlayerRadio);
		SetUserRadioControlEnabled(not featureRadioAlwaysOff)
		drawNotification("Player Radio: "..text)

	elseif(action=="skipradio")then
		SkipRadioForward();
	end
	--elseif(action == )then
end)



--[[
  ______                        _     _                       
 |  ____|                      | |   (_)                      
 | |__   _   _   _ __     ___  | |_   _    ___    _ __    ___ 
 |  __| | | | | | '_ \   / __| | __| | |  / _ \  | '_ \  / __|
 | |    | |_| | | | | | | (__  | |_  | | | (_) | | | | | \__ \
 |_|    \__,_| |_| |_|  \___|  \__| |_|  \___/  |_| |_| |___/
--]]



-- Update player information.
function checkPlayerInformation(i)
	if(NetworkIsPlayerConnected(i) == false)then
		playerdb[i] = {}
		return
	end
	
	local name = GetPlayerName(i)
	local playerPed = GetPlayerPed(i)

	-- Player has changed since last load, lets save the user information.
	if( (playerdb[i].ped ~= playerPed) or (playerdb[i].name ~= name) ) then
		playerdb[i].ped = playerPed
		playerdb[i].name = name
	end
end



-- Toggle Blips on/off
function toggleBlips()
	for i=0,maxPlayers, 1 do
		if(NetworkIsPlayerConnected(i) and (i ~= PlayerId()) ) then
			checkPlayerInformation(i)

			if (featurePlayerBlips) then
				if (playerdb[i].blip == nil or (not DoesBlipExist(playerdb[i].blip)) ) then
					createBlip(i)
				end
			else
				clearBlip(i)
			end
		end
	end
end



-- Create player blip
function createBlip(i)
	-- Create the player blip for the current indexed ped.
	playerdb[i].blip = AddBlipForEntity(playerdb[i].ped)
	SetBlipColour(playerdb[i].blip, 0)
	SetBlipScale(playerdb[i].blip, 0.8)
	SetBlipNameToPlayerName(playerdb[i].blip, i)
	SetBlipCategory(playerdb[i].blip, 7)

	N_0x5fbca48327b914df(playerdb[i].blip, 1) --ShowHeadingIndicator


	-- Update it to a vehicle sprite if needed.
	if (IsPedInAnyVehicle(playerdb[i].ped, 0)) then
		N_0x5fbca48327b914df(playerdb[i].blip, 0) --ShowHeadingIndicator
		local sprite = 1
		local veh = GetVehiclePedIsIn(playerdb[i].ped, false)
		local vehClass = GetVehicleClass(veh)

		if(vehClass == 8 or vehClass == 13)then
			sprite = 226 -- Bikes
		elseif(vehClass == 14)then
			sprite = 410 -- Boats
		elseif(vehClass == 15)then
			sprite = 422 -- Helicopters
		elseif(vehClass == 16)then
			sprite = 423 -- Airplanes
		elseif(vehClass == 19)then
			sprite = 421 -- Military
		else
			sprite = 225 -- Car
		end

		if(GetBlipSprite(playerdb[i].blip) ~= sprite) then
			SetBlipSprite(playerdb[i].blip, sprite)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(playerdb[i].name)
			EndTextCommandSetBlipName(playerdb[i].blip)
			--SetBlipNameToPlayerName(playerdb[i].blip, playerdb[i].name) -- Blip name sometimes gets overriden by sprite name
		end
	end
end



-- Removes player blip
function clearBlip(i) -- If there was a blip remove it.
	if (DoesBlipExist(playerdb[i].blip)) then
		RemoveBlip(playerdb[i].blip)
	end
	playerdb[i].blip = nil
	checkPlayerInformation(i)
end



-- Check for any changes in player information.
function checkPlayerTypes()
	for i=0,maxPlayers,1 do
		if(NetworkIsPlayerConnected(i) and (i ~= PlayerId()))then


			-- Update player information.
			checkPlayerInformation(i)


			-- Player Blips
			if(featurePlayerBlips)then
				-- Create new blip or update blip sprite.
				if(playerdb[i].blip == nil or (not DoesBlipExist(playerdb[i].blip)))then
					createBlip(i)
				else

					-- Update it to a vehicle sprite if needed.
					local sprite = 1
					if (IsPedInAnyVehicle(playerdb[i].ped, 0)) then
						local veh = GetVehiclePedIsIn(playerdb[i].ped, false)
						local vehClass = GetVehicleClass(veh)

						if(vehClass == 8 or vehClass == 13)then
							sprite = 226 -- Bikes
						elseif(vehClass == 14)then
							sprite = 410 -- Boats
						elseif(vehClass == 15)then
							sprite = 422 -- Helicopters
						elseif(vehClass == 16)then
							sprite = 423 -- Airplanes
						elseif(vehClass == 19)then
							sprite = 421 -- Military
						else
							sprite = 225 -- Car
						end
					end

					if(GetBlipSprite(playerdb[i].blip) ~= sprite) then
						SetBlipSprite(playerdb[i].blip, sprite)
						
						-- Blip name sometimes gets overriden by sprite name
						SetBlipNameToPlayerName(playerdb[i].blip, playerdb[i].name)
					end
				end
			end


			-- Player Heads
			if(featurePlayerHeadDisplay)then
				if(playerdb[i].head == nil)then
					createHead(i)
				end
			end


		else
			clearBlip(i)
			clearHead(i)
		end
	end
end



-- Toggle head display on/off
function toggleHeadDisplay()
	for i=0,maxPlayers, 1 do
		if(NetworkIsPlayerConnected(i) and (i ~= PlayerId())) then
			checkPlayerInformation(i)

			if (featurePlayerHeadDisplay) then
				createHead(i)
			else
				clearHead(i)
			end
		end
	end
end



-- Create player head
function createHead(i)
	if(playerdb[i].head == nil) then
		--Citizen.Trace("Head Display created for:"..playerdb[i].name)
		playerdb[i].head = CreateMpGamerTag(playerdb[i].ped, playerdb[i].name, false, false, "", false) -- Create head display
	end

	SetMpGamerTagVisibility(playerdb[i].head, 0, true) -- _SetHeadDisplayFlag
end


-- Remove player head display
function clearHead( i )-- If there was a head display remove it.
	if ( IsMpGamerTagActive( playerdb[i].head ) ) then
		RemoveMpGamerTag( playerdb[i].head )
		playerdb[i].head = nil
	end
end




-- Toggle Radio Control
function toggleRadio(playerPed)
	if(IsPedInAnyVehicle(playerPed, false))then
		local veh = GetVehiclePedIsUsing(playerPed)
		SetVehicleRadioEnabled(veh, not featureRadioAlwaysOff)
	end

	SetUserRadioControlEnabled(not featureRadioAlwaysOff)
end

--[[
  _______   _                                 _ 
 |__   __| | |                               | |
    | |    | |__    _ __    ___    __ _    __| |
    | |    | '_ \  | '__|  / _ \  / _` |  / _` |
    | |    | | | | | |    |  __/ | (_| | | (_| |
    |_|    |_| |_| |_|     \___|  \__,_|  \__,_|
--]]



Citizen.CreateThread(function()
	-- Only run once toggles.
	local blipToggle = false


	while true do
		Wait(0)

		-- Street Names
		if(featureAreaStreetNames) then
			HideHudComponentThisFrame(7)
			HideHudComponentThisFrame(9)
		end


		-- Head Display (Player & Vehicles)
		if (featurePlayerHeadDisplay) then
			if (not nameToggle) then
				toggleHeadDisplay()
				nameToggle = true
			end
		else
			if(nameToggle) then
				toggleHeadDisplay()
				nameToggle = false
			end
		end


		-- Player Blips
		if(featurePlayerBlips) then
			if(not blipToggle)then
				toggleBlips()
				blipToggle = true
			end
		else
			if (blipToggle) then
				blipToggle = false
				toggleBlips()
			end
		end


		-- Constantly check online player blips & head displays.
		if(featurePlayerBlips or featurePlayerHeadDisplay)then
			checkPlayerTypes()
		end

	end
end)



-- Toggles to reset whenever someone enters a new vehicle (any vehicle)
RegisterNetEvent('mellotrainer:playerEnteredVehicle')
AddEventHandler('mellotrainer:playerEnteredVehicle', function(h,m,s)
	local playerPed = GetPlayerPed(-1)
	toggleRadio(playerPed)
	resetVehOptions()
end)



-- Turn off Radio.
Citizen.CreateThread(function()
	local radioToggle = false
	while true do
		Wait(100)
		local playerPed = GetPlayerPed(-1)

		-- Radio Always Off
		if(featureRadioAlwaysOff)then
			if(featurePlayerRadio)then
				SetMobileRadioEnabledDuringGameplay(false);
				featurePlayerRadio = false;
			end

			if(not radioToggle)then
				toggleRadio(playerPed)
			end
			radioToggle = true
		else
			if(radioToggle)then
				toggleRadio(playerPed)
				radioToggle = false
			end
		end
	end
end)