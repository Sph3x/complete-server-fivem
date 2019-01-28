
local settings = {}


RegisterNetEvent("mellotrainer:receiveConfigSetting")
AddEventHandler("mellotrainer:receiveConfigSetting",function(name,value)
	settings[name] = value
end)



-- Used to turn on global server settings
function initServerConfig()
	NetworkSetFriendlyFireOption(false)
end

-- FONCTIONS GLOBAL 

-- TELEPORTER AU MARKERS
function teleportToWaypoint()
	local targetPed = GetPlayerPed(-1)
	local targetVeh = GetVehiclePedIsUsing(targetPed)
	if(IsPedInAnyVehicle(targetPed))then
		targetPed = targetVeh
	end

	if(not IsWaypointActive())then
		drawNotification("Map Marker not found.")
		return
	end

	local waypointBlip = GetFirstBlipInfoId(8) -- 8 = Waypoint ID
	local x,y,z = table.unpack(Citizen.InvokeNative(0xFA7C7F0AADF25D09, waypointBlip, Citizen.ResultAsVector())) 



	-- Ensure Entity teleports above the ground
	local ground
	local groundFound = false
	local groundCheckHeights = {100.0, 150.0, 50.0, 0.0, 200.0, 250.0, 300.0, 350.0, 400.0,450.0, 500.0, 550.0, 600.0, 650.0, 700.0, 750.0, 800.0}


	for i,height in ipairs(groundCheckHeights) do
		SetEntityCoordsNoOffset(targetPed, x,y,height, 0, 0, 1)
		Wait(10)

		ground,z = GetGroundZFor_3dCoord(x,y,height)
		if(ground) then
			z = z + 3
			groundFound = true
			break;
		end
	end

	if(not groundFound)then
		z = 1000
		GiveDelayedWeaponToPed(PlayerPedId(), 0xFBAB5776, 1, 0) -- Parachute
	end

	SetEntityCoordsNoOffset(targetPed, x,y,z, 0, 0, 1)
	drawNotification("Teleported to waypoint.")
end


-- TRAINER MENU

-- Admin seulement ci il a le status ?
local adminStatus = nil
RegisterNetEvent("mellotrainer:adminStatusReceived")
AddEventHandler("mellotrainer:adminStatusReceived", function(status)
	Citizen.Trace("Your Admin Status: "..tostring(status))
	adminStatus = status
end)

-- Obtenir leur statut d'administrateur une fois qu'ils sont chargés dans le jeu.
AddEventHandler('onClientMapStart', function()
	TriggerServerEvent("mellotrainer:getAdminStatus")
end)



-- Demande le statut d'administrateur 10 secondes après le redémarrage du script.
-- Si le joueur se joint, cela devrait se déclencher via onClientMapStart.
Citizen.CreateThread(function()
	Wait(10000)
	if(adminStatus == nil)then
		TriggerServerEvent("mellotrainer:getAdminStatus")
	end
end)

-- faut-il montrer le formateur?
showtrainer = false


-- Constantly check for trainer movement.
Citizen.CreateThread( function()
	while true do
		Citizen.Wait( 0 )

		if ( IsControlJustReleased( 0, 57 ) or IsDisabledControlJustReleased( 0, 57 ) ) and GetLastInputMethod( 0 ) and not IsPauseMenuActive() and not blockinput and ((settings["adminOnlyTrainer"] == true and adminStatus == true) or settings["adminOnlyTrainer"] == false) then -- f6
			showtrainer = not showtrainer
			if showtrainer then
				SendNUIMessage({
					showtrainer = true
				})
			else
				SendNUIMessage({
					hidetrainer = true
				})
			end
		end

		if ( IsControlJustReleased( 0, 170 ) or IsDisabledControlJustReleased( 0, 170 ) ) and GetLastInputMethod( 0 ) and not blockinput and ((settings["adminOnlyTrainer"] == true and adminStatus == true) or settings["adminOnlyTrainer"] == false) then -- f3
			teleportToWaypoint()
		end

		--noclipmode
		-- if ( IsControlJustReleased( 0, 289 ) or IsDisabledControlJustReleased( 0, 289 ) ) and GetLastInputMethod( 0 ) and ((settings["adminOnlyNoclip"] == true and adminStatus == true) or settings["adminOnlyNoclip"] == false) then
			-- toggleNoClipMode()
		-- end

		if showtrainer and not blockinput then
			if ( IsControlJustPressed( 1, 199 ) or IsControlJustPressed( 1, 200 ) ) then 
				showtrainer = false
				SendNUIMessage({
					hidetrainer = true
				})				
			end

			if ( IsControlJustReleased( 1, 201 ) or IsDisabledControlJustReleased( 1, 201 ) ) then -- enter
				SendNUIMessage({
					trainerenter = true
				})
			elseif ( IsControlJustReleased( 1, 202 ) or IsDisabledControlJustReleased( 1, 202 ) ) then -- back
				SendNUIMessage({
					trainerback = true
				})
			end

			if ( IsControlJustReleased( 1, 172 ) or IsDisabledControlJustReleased( 1, 172 ) ) then -- up
				SendNUIMessage({
					trainerup = true
				})
			elseif ( IsControlJustReleased( 1, 173 ) or IsDisabledControlJustReleased( 1, 173 ) ) then -- down
				SendNUIMessage({
					trainerdown = true
				})
			end

			if ( IsControlJustReleased( 1, 174 ) or IsDisabledControlJustReleased( 1, 174 ) ) then -- left
				SendNUIMessage({
					trainerleft = true
				})
			elseif ( IsControlJustReleased( 1, 175 ) or IsDisabledControlJustReleased( 1, 175 ) ) then -- right
				SendNUIMessage({
					trainerright = true
				})
			end
		end
	end
end)

---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------

-- NUI CALLBACK

-- Callbacks from the trainer.
RegisterNUICallback("debug", function(data, cb)
	Citizen.Trace(tostring(data))
end)


RegisterNUICallback("statetoggles", function(data, cb)
	--Citizen.Trace("State Toggles NUI Callback")
	local array = data.data
	local menuID = data.menuid

	-- Wait 100 should be used in most places so lets wait for them to update variables if needed
	-- Before checking.
	Wait(300)
	local results = {}

	for	k,v in pairs(array) do
		results[k] = GetToggleState(k)
		--Citizen.Trace(k.." is "..results[k])
	end
	local jsonResult = json.encode(results,{indent = true})

	SendNUIMessage({
		statetoggles = true,
		statesdata = jsonResult,
		menuid = menuID
	})
end)


RegisterNUICallback("playsound", function(data, cb)
	PlaySoundFrontend(-1, data.name, "HUD_FRONTEND_DEFAULT_SOUNDSET",  true)
	if cb then cb("ok") end
end)


RegisterNUICallback("trainerclose", function(data, cb)
	showtrainer = false
	if cb then cb("ok") end
end)

-- Reset certain non-static menus.
function resetTrainerMenus(message)
	SendNUIMessage({
		resetmenus = message
	})
end



-- Check for ingame Events that should trigger trainer resets.
Citizen.CreateThread(function()
	local inVeh = false
	
	while true do
		Wait(1)
		local playerPed = GetPlayerPed(-1)
		local playerVeh = GetVehiclePedIsUsing(playerPed)

		if(IsPedInAnyVehicle(playerPed))then
			if(playerPed == GetPedInVehicleSeat(playerVeh, -1))then
				-- Only toggle on first find of new vehicle
				if(not(inVeh))then
					-- Toggle any vehicle settings
					Citizen.Trace("Applying Vehicle Options")
					TriggerEvent('mellotrainer:playerEnteredVehicle')
				end

				inVeh = true
			end
		else
			inVeh = false
		end

	end
end)



initServerConfig()