local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX                             = nil
local PlayerData                = {}
local GUI                       = {}
GUI.Time                        = 0
local HasAlreadyEnteredMarker   = false
local LastStation               = nil
local LastPart                  = nil
local LastPartNum               = nil
local LastEntity                = nil
local CurrentAction             = nil
local CurrentActionMsg          = ''
local CurrentActionData         = {}
local IsHandcuffed              = false
local isArmure 					= true
local isGilet					= false
local isDragged 				= false
local CopPed					= 0
--local Caution                   = 0

--- Prison
local cJ                        = false
local eJE                       = false
local prisonierped              = 0

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function SetVehicleMaxMods(vehicle)

	local props = {
		modEngine       = 4,
		modBrakes       = 4,
		modTransmission = 4,
		modSuspension   = 4,
		modTurbo        = true,
	}

	ESX.Game.SetVehicleProperties(vehicle, props)

end

function OpenCloakroomMenu()

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'cloakroom',
		{
			title    = _U('cloakroom'),
			align    = 'top-left',
			elements = {
				{label = _U('citizen_wear'), value = 'citizen_wear'},
				{label = _U('police_wear'), value = 'police_wear'},
				{label = _U('afterpolice_wear'), value = 'afterpolice_wear'},
				--{label = _U('grade_wear'), value = 'grade_wear'},
				{label = _U('gilet_wear'), value = 'gilet_wear'},
				{label = _U('giletj_wear'), value = 'giletj_wear'},
				--{label = _U('helmet_wear'), value = 'helmet_wear'},

			},
		},
		function(data, menu)
			
			menu.close()

			if data.current.value == 'citizen_wear' then
				TriggerServerEvent("player:serviceOff", "police")
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
					TriggerEvent('skinchanger:loadSkin', skin)
					local playerPed = GetPlayerPed(-1)
    				SetPedArmour(playerPed, 0)
				end)

			end
			--[[ gilet par balle
			if data.current.value == 'gilet_wear' then
				TriggerEvent('skinchanger:getSkin', function(skin)
					if skin.sex == 0 then
						local Gilet = {
							['bproof_1'] 	= 11, ['bproof_2'] = 1
						}
						TriggerEvent('skinchanger:loadClothes', skin, Gilet)
					else
						local Gilet = {
							['bproof_1'] 	= 12, ['bproof_2'] = 1
						}
						TriggerEvent('skinchanger:loadClothes', skin, Gilet)
					end
					local playerPed = GetPlayerPed(-1)
    				SetPedArmour(playerPed, 100)
				end)
			end
			]]
			if data.current.value == 'afterpolice_wear' then
				TriggerEvent('skinchanger:getSkin', function(skin)

				    if skin.sex == 0 then

        				local TenuPolice = {
            				['tshirt_1'] 	= 58, ['tshirt_2'] 	= 0,
            				['torso_1'] 	= 55, ['torso_2'] 	= 0,
            				['decals_1']	= 0,  ['decals_2']	= 0,
            				['arms'] 		= 30,
            				['pants_1'] 	= 33, ['pants_2'] 	= 0,
            				['shoes_1'] 	= 25, ['shoes_2'] 	= 0,
            				['bproof_1'] 	= 0,  ['bproof_2'] 	= 0,
            				['helmet_1']	= -1, ['helmet_2'] = 0
        				}

        				TriggerEvent('skinchanger:loadClothes', skin, TenuPolice)
    				else
        				local TenuPolice = {
            				['tshirt_1'] 	= 35, ['tshirt_2'] 	= 0,
            				['torso_1'] 	= 48, ['torso_2'] 	= 0,
            				['decals_1']	= 0,  ['decals_2']	= 0,
            				['arms'] 		= 44,
            				['pants_1'] 	= 61, ['pants_2'] 	= 9,
            				['shoes_1'] 	= 25, ['shoes_2'] 	= 0,
            				['bproof_1'] 	= 0,  ['bproof_2'] 	= 0,
            				['helmet_1']	= -1, ['helmet_2'] = 0
        				}

        				TriggerEvent('skinchanger:loadClothes', skin, TenuPolice)
        			end
        			local playerPed = GetPlayerPed(-1)
    				SetPedArmour(playerPed, 0)
    				ClearPedBloodDamage(playerPed)
    				ResetPedVisibleDamage(playerPed)
    				ClearPedLastWeaponDamage(playerPed)
    			end)
    		end

    		if data.current.value == 'helmet_wear' then
    			TriggerEvent('skinchanger:getSkin', function(skin)

    				if skin.sex == 0 then
    					local Helmet = {
    						['helmet_1']	= 46, ['helmet_2'] = 0
    					}
    					TriggerEvent('skinchanger:loadClothes', skin, Helmet)
    				else
    					local Helmet = {
    						['helmet_1']	= 45, ['helmet_2'] = 0
	    				}
	    				TriggerEvent('skinchanger:loadClothes', skin, Helmet)
	    			end
	    		end)
    		end

    		if data.current.value == 'giletj_wear' then
    			TriggerEvent('skinchanger:getSkin', function(skin)

    				if skin.sex == 0 then
    					local GiletJ = {
    						['tshirt_1']	= 59, ['tshirt_2'] 	= 0
       					}
       					TriggerEvent('skinchanger:loadClothes', skin, GiletJ)
       				else
       					local GiletJ = {
       						['tshirt_1']	= 36, ['tshirt_2'] 	= 0
       					}
       					TriggerEvent('skinchanger:loadClothes', skin, GiletJ)
       				end
       			end)
       		end

    		if data.current.value == 'grade_wear' then
    			TriggerEvent('skinchanger:getSkin', function(skin)

    				if PlayerData.job.grade_name == 'sergeantchief' then
    					if skin.sex == 0 then
        					local grade1 = {
        						['decals_1']	= 8, ['decals_2']	= 1
        					}
        					TriggerEvent('skinchanger:loadClothes', skin, grade1)
        				else
        					local grade1 = {
        						['decals_1']	= 7, ['decals_2']	= 1
        					}
        					TriggerEvent('skinchanger:loadClothes', skin, grade1)
        				end
        			end


        			if PlayerData.job.grade_name == 'lieutenant' then
        				if skin.sex == 0 then
        					local grade2 = {
        						['decals_1']	= 8, ['decals_2']	= 2
        					}
        					TriggerEvent('skinchanger:loadClothes', skin, grade2)
        				else
        					local grade2 = {
        						['decals_1']	= 7, ['decals_2']	= 2
        					}
        					TriggerEvent('skinchanger:loadClothes', skin, grade2)
        				end
        			end

        			if PlayerData.job.grade_name == 'boss' then
        				if skin.sex == 0 then
        					local grade3 = {
        						['decals_1']	= 8, ['decals_2']	= 3
        					}
        					TriggerEvent('skinchanger:loadClothes', skin, grade3)
        				else
        					local grade3 = {
        						['decals_1']	= 7, ['decals_2']	= 3
        					}
        					TriggerEvent('skinchanger:loadClothes', skin, grade3)
        				end
        			end
    			end)
    		end
			
			if data.current.value == 'police_wear' then
				TriggerServerEvent("player:serviceOn", "police")
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

					if skin.sex == 0 then
						TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)
					else
						TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
					end
					
				end)

			end	

			CurrentAction     = 'menu_cloakroom'
			CurrentActionMsg  = _U('open_cloackroom')
			CurrentActionData = {}

		end,
		function(data, menu)
			
			menu.close()

			CurrentAction     = 'menu_cloakroom'
			CurrentActionMsg  = _U('open_cloackroom')
			CurrentActionData = {}
		end
	)

end

function OpenArmoryMenu(station)

	if Config.EnableArmoryManagement then

		local elements = {
			--{label = _U('get_weapon'), value = 'get_weapon'},
			--{label = _U('put_weapon'), value = 'put_weapon'},
			{label = 'Deposer Stock', value = 'put_stock'},
			{label = 'Pendre Stock', value = 'get_stock'}
		}

		--if PlayerData.job.grade_name == 'boss' then
			--table.insert(elements, {label = _U('buy_weapons'), value = 'buy_weapons'})
		--end

		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'armory',
			{
				title    = _U('armory'),
				align    = 'top-left',
				elements = elements,
			},
			function(data, menu)

				if data.current.value == 'get_weapon' then
					OpenGetWeaponMenu()
				end

				if data.current.value == 'put_weapon' then
					OpenPutWeaponMenu()
				end

				if data.current.value == 'buy_weapons' then
					OpenBuyWeaponsMenu(station)
				end	

				if data.current.value == 'put_stock' then
	        OpenPutStocksMenu()
        end	

        if data.current.value == 'get_stock' then
	        OpenGetStocksMenu()
        end

			end,
			function(data, menu)
				
				menu.close()

				CurrentAction     = 'menu_armory'
				CurrentActionMsg  = _U('open_armory')
				CurrentActionData = {station = station}
			end
		)

	else

		local elements = {}

		for i=1, #Config.PoliceStations[station].AuthorizedWeapons, 1 do
			local weapon = Config.PoliceStations[station].AuthorizedWeapons[i]
			table.insert(elements, {label = ESX.GetWeaponLabel(weapon.name), value = weapon.name})
		end

		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'armory',
			{
				title    = _U('armory'),
				align    = 'top-left',
				elements = elements,
			},
			function(data, menu)
				local weapon = data.current.value
				TriggerServerEvent('esx_policejob:giveWeapon', weapon,  1000)
			end,
			function(data, menu)

				menu.close()

				CurrentAction     = 'menu_armory'
				CurrentActionMsg  = _U('open_armory')
				CurrentActionData = {station = station}

			end
		)

	end

end

function OpenVehicleSpawnerMenu(station, partNum)

	--local elements = {}
	local vehicles = Config.PoliceStations[station].Vehicles

	--for i=1, #Config.PoliceStations[station].AuthorizedVehicles, 1 do
	--	local vehicle = Config.PoliceStations[station].AuthorizedVehicles[i]
	--	table.insert(elements, {label = vehicle.label, value = vehicle.name})

	--end

	ESX.UI.Menu.CloseAll()

	if Config.EnableSocietyOwnedVehicles then

		local elements = {}

		ESX.TriggerServerCallback('esx_society:getVehiclesInGarage', function(garageVehicles)

			for i=1, #garageVehicles, 1 do
				table.insert(elements, {label = GetDisplayNameFromVehicleModel(garageVehicles[i].model) .. ' [' .. garageVehicles[i].plate .. ']', value = garageVehicles[i]})
			end

			ESX.UI.Menu.Open(
				'default', GetCurrentResourceName(), 'vehicle_spawner',
				{
					title    = _U('vehicle_menu'),
					align    = 'top-left',
					elements = elements,
				},
				function(data, menu)

					menu.close()

					local vehicleProps = data.current.value
					local platenum = math.random(100, 900)
					ESX.Game.SpawnVehicle(vehicleProps.model, vehicles[partNum].SpawnPoint, 270.0, function(vehicle)
						ESX.Game.SetVehicleProperties(vehicle, vehicleProps)
						local playerPed = GetPlayerPed(-1)
						TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)
						SetVehicleNumberPlateText(vehicle, "Lspd" .. platenum)
						TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)
						SetVehicleMaxMods(vehicle)
						local plate = GetVehicleNumberPlateText(vehicle)
              			plate = string.gsub(plate, " ", "")
						TriggerServerEvent('esx_vehiclelock:givekey', 'no', plate)
					end)

					TriggerServerEvent('esx_society:removeVehicleFromGarage', 'police', vehicleProps)

				end,
				function(data, menu)

					menu.close()

					CurrentAction     = 'menu_vehicle_spawner'
					CurrentActionMsg  = _U('vehicle_spawner')
					CurrentActionData = {station = station, partNum = partNum}

				end
			)

		end, 'police')

	else


	local elements = {}

    if PlayerData.job.grade_name == 'recruit' then
      table.insert(elements, { label = 'Ford Focus', value = 'police' })
	  table.insert(elements, { label = 'moto ecole ville', value = 'policeb'})
	  table.insert(elements, { label = 'quad école', value = 'blazer5'}) 
    end

    if PlayerData.job.grade_name == 'officer' then
	  table.insert(elements, { label = 'partner', value = 'police3'})
	  table.insert(elements, { label = 'Ford Focus', value = 'police' })
	  table.insert(elements, { label = 'moto', value = 'policeb'})
    end

    if PlayerData.job.grade_name == 'brigade' or PlayerData.job.grade_name == 'sergent_chef' then
      table.insert(elements, { label = 'partner', value = 'police3'})
	  table.insert(elements, { label = 'Ford Focus', value = 'police' })
	  table.insert(elements, { label = 'moto de ville', value = 'policeb'})
	  table.insert(elements, { label = 'moto autoroute', value = 'policebmw'})
	  table.insert(elements, { label = 'dacia duster', value = 'sheriff'})
	  table.insert(elements, { label = 'jeep', value = 'sheriff2' })
    end

    if PlayerData.job.grade_name == 'brigadier' then
      table.insert(elements, { label = 'partner', value = 'police3'})
	  table.insert(elements, { label = 'Ford Focus', value = 'police' })
	  table.insert(elements, { label = 'moto de ville', value = 'policeb'})
	  table.insert(elements, { label = 'moto autoroute', value = 'policebmw'})
	  table.insert(elements, { label = 'dacia duster', value = 'sheriff'})
	  table.insert(elements, { label = 'jeep', value = 'sheriff2' })
    end

    if PlayerData.job.grade_name == 'ajudant_chief' then
      table.insert(elements, { label = 'fourgon transport divers', value = 'policet'})
      table.insert(elements, { label = 'transport détenus gign', value = 'pbus'})
      table.insert(elements, { label = 'partner', value = 'police3'})
	  table.insert(elements, { label = 'Ford Focus', value = 'police' })
	  table.insert(elements, { label = 'moto de ville', value = 'policeb'})
	  table.insert(elements, { label = 'moto autoroute', value = 'policebmw'})
	  table.insert(elements, { label = 'dacia duster', value = 'sheriff'})
	  table.insert(elements, { label = 'jeep', value = 'sheriff2' })
	  table.insert(elements, { label = 'hélicoptère', value = 'polmav' })
    end

    if PlayerData.job.grade_name == 'ajudant' then
      table.insert(elements, { label = 'fourgon transport divers', value = 'policet'})
      table.insert(elements, { label = 'transport détenus gign', value = 'pbus'})
      table.insert(elements, { label = 'partner', value = 'police3'})
	  table.insert(elements, { label = 'Ford Focus', value = 'police' })
	  table.insert(elements, { label = 'moto de ville', value = 'policeb'})
	  table.insert(elements, { label = 'moto autoroute', value = 'policebmw'})
	  table.insert(elements, { label = 'dacia duster', value = 'sheriff'})
	  table.insert(elements, { label = 'jeep', value = 'sheriff2' })
	  table.insert(elements, { label = 'hélicoptère', value = 'polmav' })
    end

    if PlayerData.job.grade_name == 'major' then
      table.insert(elements, { label = "maserati", value = 'police2'})
      table.insert(elements, { label = 'véhicule commandement', value = 'fbi'})
      table.insert(elements, { label = 'fourgon transport divers', value = 'policet'})
      table.insert(elements, { label = 'transport détenus gign', value = 'pbus'})
      table.insert(elements, { label = 'partner', value = 'police3'})
	  table.insert(elements, { label = 'Ford Focus', value = 'police' })
	  table.insert(elements, { label = 'moto de ville', value = 'policeb'})
	  table.insert(elements, { label = 'moto autoroute', value = 'policebmw'})
	  table.insert(elements, { label = 'dacia duster', value = 'sheriff'})
	  table.insert(elements, { label = 'jeep', value = 'sheriff2' })
	  table.insert(elements, { label = 'hélicoptère', value = 'polmav' })
    end

    if PlayerData.job.grade_name == 'lieutenant' then
      table.insert(elements, { label = "maserati", value = 'police2'})
      table.insert(elements, { label = 'véhicule commandement', value = 'fbi'})
      table.insert(elements, { label = 'fourgon transport divers', value = 'policet'})
      table.insert(elements, { label = 'transport détenus gign', value = 'pbus'})
      table.insert(elements, { label = 'partner', value = 'police3'})
	  table.insert(elements, { label = 'Ford Focus', value = 'police' })
	  table.insert(elements, { label = 'moto de ville', value = 'policeb'})
	  table.insert(elements, { label = 'moto autoroute', value = 'policebmw'})
	  table.insert(elements, { label = 'dacia duster', value = 'sheriff'})
	  table.insert(elements, { label = 'jeep', value = 'sheriff2' })
	  table.insert(elements, { label = 'quad école', value = 'blazer5'})
	  table.insert(elements, { label = 'hélicoptère', value = 'polmav' })
    end

    if PlayerData.job.grade_name == 'boss' then
      table.insert(elements, { label = 'véhicule gign lourd', value = 'riot'})
      table.insert(elements, { label = "maserati", value = 'police2'})
      table.insert(elements, { label = 'véhicule commandement', value = 'fbi'})
      table.insert(elements, { label = 'fourgon transport divers', value = 'policet'})
      table.insert(elements, { label = 'transport détenus gign', value = 'pbus'})
      table.insert(elements, { label = 'partner', value = 'police3'})
	  table.insert(elements, { label = 'Ford Focus', value = 'police' })
	  table.insert(elements, { label = 'moto de ville', value = 'policeb'})
	  table.insert(elements, { label = 'moto autoroute', value = 'policebmw'})
	 table.insert(elements, { label = 'dacia duster', value = 'sheriff'})
	  table.insert(elements, { label = 'jeep', value = 'sheriff2' })
	  table.insert(elements, { label = 'quad école', value = 'blazer5'})
	  table.insert(elements, { label = 'hélicoptère', value = 'polmav' })
	end

    if PlayerData.job.grade_name == 'gign' then
      table.insert(elements, { label = 'véhicule gign lourd', value = 'riot'})
      table.insert(elements, { label = "maserati", value = 'police2'})
      table.insert(elements, { label = 'véhicule commandement', value = 'fbi'})
      table.insert(elements, { label = 'fourgon transport divers', value = 'policet'})
      table.insert(elements, { label = 'transport détenus gign', value = 'pbus'})
      table.insert(elements, { label = 'partner', value = 'police3'})
	  table.insert(elements, { label = 'Ford Focus', value = 'police' })
	  table.insert(elements, { label = 'moto de ville', value = 'policeb'})
	  table.insert(elements, { label = 'moto autoroute', value = 'policebmw'})
	  table.insert(elements, { label = 'dacia duster', value = 'sheriff'})
	  table.insert(elements, { label = 'jeep', value = 'sheriff2' })
	  table.insert(elements, { label = 'hélicoptère', value = 'polmav' })
    end

    if PlayerData.job.grade_name == 'tireur_d_elite' then
      table.insert(elements, { label = 'véhicule gign lourd', value = 'riot'})
      table.insert(elements, { label = "maserati", value = 'police2'})
      table.insert(elements, { label = 'véhicule commandement', value = 'fbi'})
      table.insert(elements, { label = 'fourgon transport divers', value = 'policet'})
      table.insert(elements, { label = 'transport détenus gign', value = 'pbus'})
      table.insert(elements, { label = 'partner', value = 'police3'})
	  table.insert(elements, { label = 'Ford Focus', value = 'police' })
	  table.insert(elements, { label = 'moto de ville', value = 'policeb'})
	  table.insert(elements, { label = 'moto autoroute', value = 'policebmw'})
	  table.insert(elements, { label = 'dacia duster', value = 'sheriff'})
	  table.insert(elements, { label = 'jeep', value = 'sheriff2' })
	  table.insert(elements, { label = 'Banalisée préfèt', value = 'police4' })
	  table.insert(elements, { label = 'hélicoptère', value = 'polmav' })
    end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'vehicle_spawner',
		{
			title    = _U('vehicle_menu'),
			align    = 'top-left',
			elements = elements,
		},
		function(data, menu)

			menu.close()

			local model = data.current.value

			local vehicle = GetClosestVehicle(vehicles[partNum].SpawnPoint.x,  vehicles[partNum].SpawnPoint.y,  vehicles[partNum].SpawnPoint.z,  3.0,  0,  71)

			if not DoesEntityExist(vehicle) then

				local playerPed = GetPlayerPed(-1)

				if Config.MaxInService == -1 then
					local platenum = math.random(100, 900)
					ESX.Game.SpawnVehicle(model, {
						x = vehicles[partNum].SpawnPoint.x, 
						y = vehicles[partNum].SpawnPoint.y, 
						z = vehicles[partNum].SpawnPoint.z
					}, vehicles[partNum].Heading, function(vehicle)
						SetVehicleNumberPlateText(vehicle, "Lspd" .. platenum)
						TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)
						SetVehicleMaxMods(vehicle)
						local plate = GetVehicleNumberPlateText(vehicle)
              			plate = string.gsub(plate, " ", "")
						TriggerServerEvent('esx_vehiclelock:givekey', 'no', plate) -- vehicle lock
						--TriggerServerEvent('esx_policejob:Takecaution', Caution) -- caution de 300$
					end)

				else

					ESX.TriggerServerCallback('esx_service:enableService', function(canTakeService, maxInService, inServiceCount)

						if canTakeService then

							ESX.Game.SpawnVehicle(model, {
								x = vehicles[partNum].SpawnPoint.x, 
								y = vehicles[partNum].SpawnPoint.y, 
								z = vehicles[partNum].SpawnPoint.z
							}, vehicles[partNum].Heading, function(vehicle)
								TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)
								SetVehicleMaxMods(vehicle)
							end)

						else
							ESX.ShowNotification(_U('service_max') .. inServiceCount .. '/' .. maxInService)
						end

					end, 'police')

				end

			else
				ESX.ShowNotification(_U('vehicle_out'))
			end

		end,
		function(data, menu)

			menu.close()

			CurrentAction     = 'menu_vehicle_spawner'
			CurrentActionMsg  = _U('vehicle_spawner')
			CurrentActionData = {station = station, partNum = partNum}

		end
	)
	end

end

function OpenPersonalBilling()

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'police_persobilling_actions',
		{
			title    = 'LSPD',
			elements = {
				{label = 'Facture divers', value = 'billing'}
			}
		},
		function(data, menu)

			if data.current.value == 'billing' then

				ESX.UI.Menu.Open(
					'dialog', GetCurrentResourceName(), 'billing',
					{
						title = _U('invoice_amount')
					},
					function(data, menu)

						local amount = tonumber(data.value)

						if amount == nil then
							ESX.ShowNotification(_U('amount_invalid'))
						else

							menu.close()

							local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

							if closestPlayer == -1 or closestDistance > 3.0 then
								ESX.ShowNotification(_U('no_players_nearby'))
							else
								TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_police', 'Divers', amount)
							end

						end
					end,
					function(data, menu)
						menu.close()
					end
				)
			end
		end,
		function(data, menu)
			menu.close()
		end
	)

end

function OpenPoliceActionsMenu()
	
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'police_actions',
		{
			title    = 'Police',
			align    = 'top-left',
			elements = {
		  	{label = _U('citizen_interaction'), value = 'citizen_interaction'},
		  	{label = _U('vehicle_interaction'), value = 'vehicle_interaction'},
		  	{label = _U('object_spawner'),      value = 'object_spawner'},
		  	{label = _U('radar_spawner'),      value = 'radar_spawner'},
			},
		},
		function(data, menu)

			if data.current.value == 'citizen_interaction' then

				ESX.UI.Menu.Open(
					'default', GetCurrentResourceName(), 'citizen_interaction',
					{
						title    = _U('citizen_interaction'),
						align    = 'top-left',
						elements = {
							{label = _U('id_card'),     	value = 'identity_card'},
							{label = _U('search'),      	value = 'body_search'},
							{label = _U('handcuff'), 		value = 'handcuff'},
							{label = _U('put_in_vehicle'),  value = 'put_in_vehicle'},
							{label = _U('out_the_vehicle'), value = 'out_the_vehicle'},
							{label = _U('drag'), 			value = 'drag'},
							{label = _U('fine'),            value = 'fine'},
							{label = _U('persofine'),       value = 'persofine'},
							{label = _U('jail'),            value = 'jail'},
              				{label = _U('unjail'),          value = 'unjail'},
							{label = _U('codedrive'),       value = 'codedrive'},
			  				{label = _U('codedrivebike'),   value = 'codedrivebike'},
			  				{label = _U('codedrivetruck'),  value = 'codedrivetruck'},
			  				{label = _U('weaponlicense'),   value = 'weaponlicense'},
			  				{label = _U('codedmv'),         value = 'dmvlicense'},
						},
					},
					function(data2, menu2)

						local player, distance = ESX.Game.GetClosestPlayer()

						if distance ~= -1 and distance <= 3.0 then

							if data2.current.value == 'identity_card' then
								OpenIdentityCardMenu(player)
							end
							if data2.current.value == 'persofine' then
								OpenPersonalBilling(player)
							end

							if data2.current.value == 'body_search' then
								OpenBodySearchMenu(player)
							end

							if data2.current.value == 'handcuff' then
								TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(player))
							end

							if data2.current.value == 'put_in_vehicle' then
								TriggerServerEvent('esx_policejob:putInVehicle', GetPlayerServerId(player))
							end
							if data2.current.value == 'out_the_vehicle' then
 							    TriggerServerEvent('esx_policejob:OutVehicle', GetPlayerServerId(player))
 							end
							if data2.current.value == 'drag' then
 								TriggerServerEvent('esx_policejob:drag', GetPlayerServerId(player))
 							end

							if data2.current.value == 'fine' then
								OpenFineMenu(player)
							end

							if data2.current.value == 'codedrive' then
                				TriggerServerEvent('esx_policejob:deletelicense', GetPlayerServerId(player), 'drive')
              				end
			  
			  				if data2.current.value == 'codedrivebike' then
                				TriggerServerEvent('esx_policejob:deletelicense', GetPlayerServerId(player), 'drive_bike')
              				end
			  
			  				if data2.current.value == 'codedrivetruck' then
                				TriggerServerEvent('esx_policejob:deletelicense', GetPlayerServerId(player), 'drive_truck')
              				end 
			  
			  				if data2.current.value == 'weaponlicense' then
                				TriggerServerEvent('esx_policejob:deletelicense', GetPlayerServerId(player), 'weapon')
              				end

              				if data2.current.value == 'dmvlicense' then
                				TriggerServerEvent('esx_policejob:deletelicense', GetPlayerServerId(player), 'dmv')
              				end
              				
							if data2.current.value == 'jail' then
                				OpenJailMenu(player)
             	 			end

              				if data2.current.value == 'unjail' then
                				OpenUnjailMenu(player)
              				end

						else
							ESX.ShowNotification(_U('no_players_nearby'))
						end

					end,
					function(data2, menu2)
						menu2.close()
					end
				)

			end

			if data.current.value == 'vehicle_interaction' then

				ESX.UI.Menu.Open(
					'default', GetCurrentResourceName(), 'vehicle_interaction',
					{
						title    = _U('vehicle_interaction'),
						align    = 'top-left',
						elements = {
					  	{label = _U('vehicle_info'), value = 'vehicle_infos'},
					  	{label = _U('pick_lock'),  	 value = 'hijack_vehicle'},
						},
					},
					function(data2, menu2)

						local playerPed = GetPlayerPed(-1)
						local coords    = GetEntityCoords(playerPed)
						local vehicle   = GetClosestVehicle(coords.x,  coords.y,  coords.z,  3.0,  0,  71)

						if DoesEntityExist(vehicle) then

							local vehicleData = ESX.Game.GetVehicleProperties(vehicle)

							if data2.current.value == 'vehicle_infos' then
								OpenVehicleInfosMenu(vehicleData)
							end

							if data2.current.value == 'hijack_vehicle' then

					      local playerPed = GetPlayerPed(-1)
					      local coords    = GetEntityCoords(playerPed)

					      if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 3.0) then

									local vehicle = GetClosestVehicle(coords.x,  coords.y,  coords.z,  3.0,  0,  71)
					        
					        if DoesEntityExist(vehicle) then

					        	Citizen.CreateThread(function()

									TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)

									Wait(20000)

									ClearPedTasksImmediately(playerPed)

						        	SetVehicleDoorsLocked(vehicle, 1)
					            	SetVehicleDoorsLockedForAllPlayers(vehicle, false)

					            TriggerEvent('esx:showNotification', _U('vehicle_unlocked'))

					        	end)

					        end

					      end

							end

						else
							ESX.ShowNotification(_U('no_vehicles_nearby'))
						end

					end,
					function(data2, menu2)
						menu2.close()
					end
				)

			end

		  	if data.current.value == 'radar_spawner' then 
        		POLICE_radar() 
      		end 

			if data.current.value == 'object_spawner' then

				ESX.UI.Menu.Open(
					'default', GetCurrentResourceName(), 'citizen_interaction',
					{
						title    = _U('traffic_interaction'),
						align    = 'top-left',
						elements = {
					    {label = _U('cone'),     value = 'prop_roadcone02a'},
					    {label = _U('barrier'), value = 'prop_barrier_work06a'},
					    {label = _U('spikestrips'),    value = 'p_ld_stinger_s'},
					    {label = _U('box'),   value = 'prop_boxpile_07d'},
					    --{label = _U('cash'),   value = 'hei_prop_cash_crate_half_full'}
						},
					},
					function(data2, menu2)
						local model     = data2.current.value
						local playerPed = GetPlayerPed(-1)
						local coords    = GetEntityCoords(playerPed)
						local forward   = GetEntityForwardVector(playerPed)
						local x, y, z   = table.unpack(coords + forward * 1.0)

						if model == 'prop_roadcone02a' then
							z = z - 2.0
						end

						ESX.Game.SpawnObject(model, {
							x = x,
							y = y,
							z = z
						}, function(obj)
							SetEntityHeading(obj, GetEntityHeading(playerPed))
							PlaceObjectOnGroundProperly(obj)
						end)

					end,
					function(data2, menu2)
						menu2.close()
					end
				)

			end

		end,
		function(data, menu)
			
			menu.close()

		end
	)

end


function OpenIdentityCardMenu(player)

  if Config.EnableESXIdentity then

    ESX.TriggerServerCallback('esx_policejob:getOtherPlayerData', function(data)

      local jobLabel    = nil
      local sexLabel    = nil
      local sex         = nil
      local dobLabel    = nil
      local heightLabel = nil
      local idLabel     = nil

      if data.job.grade_label ~= nil and  data.job.grade_label ~= '' then
        jobLabel = 'Job : ' .. data.job.label .. ' - ' .. data.job.grade_label
      else
        jobLabel = 'Job : ' .. data.job.label
      end

      if data.sex ~= nil then
        if (data.sex == 'h') or (data.sex == 'H') then
          sex = 'Homme'
        else
          sex = 'Femme'
        end
        sexLabel = 'Sexe : ' .. sex
      else
        sexLabel = 'Sexe : Unknown'
      end

      if data.dob ~= nil then
        dobLabel = 'DOB : ' .. data.dob
      else
        dobLabel = 'DOB : Unknown'
      end

      if data.height ~= nil then
        heightLabel = 'Height : ' .. data.height
      else
        heightLabel = 'Height : Unknown'
      end

      if data.name ~= nil then
        idLabel = 'ID : ' .. data.name
      else
        idLabel = 'ID : Unknown'
      end

      local elements = {
        {label = _U('name') .. data.firstname .. " " .. data.lastname, value = nil},
        {label = sexLabel,    value = nil},
        {label = dobLabel,    value = nil},
        {label = heightLabel, value = nil},
        {label = jobLabel,    value = nil},
        {label = idLabel,     value = nil},
      }

      if data.drunk ~= nil then
        table.insert(elements, {label = _U('bac') .. data.drunk .. '%', value = nil})
      end

      if data.licenses ~= nil then

        table.insert(elements, {label = '--- Licenses ---', value = nil})

        for i=1, #data.licenses, 1 do
          table.insert(elements, {label = data.licenses[i].label, value = nil})
        end

      end

      ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'citizen_interaction',
        {
          title    = _U('citizen_interaction'),
          align    = 'top-left',
          elements = elements,
        },
        function(data, menu)

        end,
        function(data, menu)
          menu.close()
        end
      )

    end, GetPlayerServerId(player))

  else

    ESX.TriggerServerCallback('esx_policejob:getOtherPlayerData', function(data)

      local jobLabel = nil

      if data.job.grade_label ~= nil and  data.job.grade_label ~= '' then
        jobLabel = 'Job : ' .. data.job.label .. ' - ' .. data.job.grade_label
      else
        jobLabel = 'Job : ' .. data.job.label
      end

        local elements = {
          {label = _U('name') .. data.name, value = nil},
          {label = jobLabel,              value = nil},
        }

      if data.drunk ~= nil then
        table.insert(elements, {label = _U('bac') .. data.drunk .. '%', value = nil})
      end

      if data.licenses ~= nil then

        table.insert(elements, {label = '--- Licenses ---', value = nil})

        for i=1, #data.licenses, 1 do
          table.insert(elements, {label = data.licenses[i].label, value = nil})
        end

      end

      ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'citizen_interaction',
        {
          title    = _U('citizen_interaction'),
          align    = 'top-left',
          elements = elements,
        },
        function(data, menu)

        end,
        function(data, menu)
          menu.close()
        end
      )

    end, GetPlayerServerId(player))

  end

end

function OpenBodySearchMenu(player)

  ESX.TriggerServerCallback('esx_policejob:getOtherPlayerData', function(data)

    local elements = {}

    local blackMoney = 0

    for i=1, #data.accounts, 1 do
      if data.accounts[i].name == 'black_money' then
        blackMoney = data.accounts[i].money
      end
    end

    table.insert(elements, {
      label          = _U('confiscate_dirty') .. blackMoney,
      value          = 'black_money',
      itemType       = 'item_account',
      amount         = blackMoney
    })

    table.insert(elements, {label = '--- Armes ---', value = nil})

    for i=1, #data.weapons, 1 do
      table.insert(elements, {
        label          = _U('confiscate') .. ESX.GetWeaponLabel(data.weapons[i].name),
        value          = data.weapons[i].name,
        itemType       = 'item_weapon',
        amount         = data.ammo,
      })
    end

    table.insert(elements, {label = _U('inventory_label'), value = nil})

    for i=1, #data.inventory, 1 do
      if data.inventory[i].count > 0 then
        table.insert(elements, {
          label          = _U('confiscate_inv') .. data.inventory[i].count .. ' ' .. data.inventory[i].label,
          value          = data.inventory[i].name,
          itemType       = 'item_standard',
          amount         = data.inventory[i].count,
        })
      end
    end


    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'body_search',
      {
        title    = _U('search'),
        align    = 'top-left',
        elements = elements,
      },
      function(data, menu)

        local itemType = data.current.itemType
        local itemName = data.current.value
        local amount   = data.current.amount

        if data.current.value ~= nil then

          TriggerServerEvent('esx_policejob:confiscatePlayerItem', GetPlayerServerId(player), itemType, itemName, amount)

          OpenBodySearchMenu(player)

        end

      end,
      function(data, menu)
        menu.close()
      end
    )

  end, GetPlayerServerId(player))

end

function OpenFineMenu(player)

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'fine',
		{
			title    = _U('fine'),
			align    = 'top-left',
			elements = {
		  	{label = _U('traffic_offense'),   value = 0},
		  	{label = _U('minor_offense'),     value = 1},
		  	{label = _U('average_offense'),   value = 2},
		  	{label = _U('major_offense'),     value = 3}
			},
		},
		function(data, menu)
			
			OpenFineCategoryMenu(player, data.current.value)

		end,
		function(data, menu)
			menu.close()
		end
	)

end

function OpenFineCategoryMenu(player, category)

	ESX.TriggerServerCallback('esx_policejob:getFineList', function(fines)

		local elements = {}
		
		for i=1, #fines, 1 do
			table.insert(elements, {
				label     = fines[i].label .. ' $' .. fines[i].amount,
				value     = fines[i].id,
				amount    = fines[i].amount,
				fineLabel = fines[i].label
			})
		end

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'fine_category',
			{
				title    = _U('fine'),
				align    = 'top-left',
				elements = elements,
			},
			function(data, menu)

				local label  = data.current.fineLabel
				local amount = data.current.amount

				menu.close()

				if Config.EnablePlayerManagement then
					TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_police', _U('fine_total') .. label, amount)
				else
					TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), '', _U('fine_total') .. label, amount)
				end

				ESX.SetTimeout(300, function()
					OpenFineCategoryMenu(player, category)
				end)

			end,
			function(data, menu)
				menu.close()
			end
		)

	end, category)

end

function OpenVehicleInfosMenu(vehicleData)

	ESX.TriggerServerCallback('esx_policejob:getVehicleInfos', function(infos)

		local elements = {}

		table.insert(elements, {label = _U('plate') .. infos.plate, value = nil})

		if infos.owner == nil then
			table.insert(elements, {label = _U('owner_unknown'), value = nil})
		else
			table.insert(elements, {label = _U('owner') .. infos.owner, value = nil})
		end

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'vehicle_infos',
			{
				title    = _U('vehicle_info'),
				align    = 'top-left',
				elements = elements,
			},
			nil,
			function(data, menu)
				menu.close()
			end
		)

	end, vehicleData.plate)

end

function OpenGetWeaponMenu()

	ESX.TriggerServerCallback('esx_policejob:getArmoryWeapons', function(weapons)

		local elements = {}

		for i=1, #weapons, 1 do
			if weapons[i].count > 0 then
				table.insert(elements, {label = 'x' .. weapons[i].count .. ' ' .. weapons[i].name, value = weapons[i].name})
			end
		end

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'armory_get_weapon',
			{
				title    = _U('get_weapon_menu'),
				align    = 'top-left',
				elements = elements,
			},
			function(data, menu)

				menu.close()

				ESX.TriggerServerCallback('esx_policejob:removeArmoryWeapon', function()
					OpenGetWeaponMenu()
				end, data.current.value)

			end,
			function(data, menu)
				menu.close()
			end
		)
		
	end)

end

function OpenPutWeaponMenu()

	local elements   = {}
	local playerPed  = GetPlayerPed(-1)
	local weaponList = ESX.GetWeaponList()

	for i=1, #weaponList, 1 do

		local weaponHash = GetHashKey(weaponList[i].name)

		if HasPedGotWeapon(playerPed,  weaponHash,  false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
			local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
			table.insert(elements, {label = weaponList[i].label, value = weaponList[i].name})
		end

	end

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'armory_put_weapon',
		{
			title    = _U('put_weapon_menu'),
			align    = 'top-left',
			elements = elements,
		},
		function(data, menu)
			
			menu.close()

			ESX.TriggerServerCallback('esx_policejob:addArmoryWeapon', function()
				OpenPutWeaponMenu()
			end, data.current.value)

		end,
		function(data, menu)
			menu.close()
		end
	)

end

function OpenBuyWeaponsMenu(station)

	ESX.TriggerServerCallback('esx_policejob:getArmoryWeapons', function(weapons)

		local elements = {}

		for i=1, #Config.PoliceStations[station].AuthorizedWeapons, 1 do
			
			local weapon = Config.PoliceStations[station].AuthorizedWeapons[i]
			local count  = 0

			for i=1, #weapons, 1 do
				if weapons[i].name == weapon.name then
					count = weapons[i].count
					break
				end
			end

			table.insert(elements, {label = 'x' .. count .. ' ' .. weapon.name .. ' $' .. weapon.price, value = weapon.name, price = weapon.price})
		
		end

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'armory_buy_weapons',
			{
				title    = _U('buy_weapon_menu'),
				align    = 'top-left',
				elements = elements,
			},
			function(data, menu)

				ESX.TriggerServerCallback('esx_policejob:buy', function(hasEnoughMoney)
					
					if hasEnoughMoney then
						ESX.TriggerServerCallback('esx_policejob:addArmoryWeapon', function()
							OpenBuyWeaponsMenu(station)
						end, data.current.value)
					else
						ESX.ShowNotification(_U('not_enough_money'))
					end

				end, data.current.price)

			end,
			function(data, menu)
				menu.close()
			end
		)

	end)

end

function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.abs(math.floor(num * mult + 0.5))
end

function OpenGetStocksMenu()

	ESX.TriggerServerCallback('esx_policejob:getStockItems', function(items)

		print(json.encode(items))

		local elements = {}

		for i=1, #items, 1 do
			table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name})
		end

	  ESX.UI.Menu.Open(
	    'default', GetCurrentResourceName(), 'stocks_menu',
	    {
	      title    = 'Police Stock',
	      elements = elements
	    },
	    function(data, menu)

	    	local itemName = data.current.value

				ESX.UI.Menu.Open(
					'dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count',
					{
						title = 'Quantité'
					},
					function(data2, menu2)

						--local count = tonumber(data2.value)
						local rounded = round(tonumber(data2.value), 0)
						if rounded == nil then
							ESX.ShowNotification('Quantité invalide')
						else
							menu2.close()
				    	menu.close()
				    	--OpenGetStocksMenu()

							TriggerServerEvent('esx_policejob:getStockItem', itemName, rounded)
						end

					end,
					function(data2, menu2)
						menu2.close()
					end
				)

	    end,
	    function(data, menu)
	    	menu.close()
	    end
	  )

	end)

end

function OpenPutStocksMenu()

	ESX.TriggerServerCallback('esx_policejob:getPlayerInventory', function(inventory)

		local elements = {}

		for i=1, #inventory.items, 1 do

			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {label = item.label .. ' x' .. item.count, type = 'item_standard', value = item.name})
			end

		end

	  ESX.UI.Menu.Open(
	    'default', GetCurrentResourceName(), 'stocks_menu',
	    {
	      title    = 'Inventaire',
	      elements = elements
	    },
	    function(data, menu)

	    	local itemName = data.current.value

				ESX.UI.Menu.Open(
					'dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count',
					{
						title = 'Quantité'
					},
					function(data2, menu2)

						--local count = tonumber(data2.value)
						local rounded = round(tonumber(data2.value), 0)
						
						if rounded == nil then
							ESX.ShowNotification('Quantité invalide')
						else
							menu2.close()
				    	menu.close()
				    	OpenPutStocksMenu()

							TriggerServerEvent('esx_policejob:putStockItems', itemName, rounded)
						end

					end,
					function(data2, menu2)
						menu2.close()
					end
				)

	    end,
	    function(data, menu)
	    	menu.close()
	    end
	  )

	end)

end


RegisterNetEvent('esx_policejob:OutVehicle')
AddEventHandler('esx_policejob:OutVehicle', function(t)
     local ped = GetPlayerPed(t)
     ClearPedTasksImmediately(ped)
     plyPos = GetEntityCoords(GetPlayerPed(-1),  true)
     local xnew = plyPos.x+2
     local ynew = plyPos.y+2
    
     SetEntityCoords(GetPlayerPed(-1), xnew, ynew, plyPos.z)
 end)
 

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer 
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)



AddEventHandler('esx_policejob:hasEnteredMarker', function(station, part, partNum)

	if part == 'Cloakroom' then
		CurrentAction     = 'menu_cloakroom'
		CurrentActionMsg  = _U('open_cloackroom')
		CurrentActionData = {}
	end

	if part == 'Armory' then
		CurrentAction     = 'menu_armory'
		CurrentActionMsg  = _U('open_armory')
		CurrentActionData = {station = station}
	end

	if part == 'TpArmIn1' then
		TeleportFadeEffect(GetPlayerPed(-1), Config.PoliceStations.TpArmOut1.Pos)
	end

	if part == 'TpArmIn2' then
		TeleportFadeEffect(GetPlayerPed(-1), Config.Zones.TpArmOut2.Pos)
	end

	if part == 'VehicleSpawner' then
		CurrentAction     = 'menu_vehicle_spawner'
		CurrentActionMsg  = _U('vehicle_spawner')
		CurrentActionData = {station = station, partNum = partNum}
	end

	if part == 'HelicopterSpawner' then

		local helicopters = Config.PoliceStations[station].Helicopters

		if not IsAnyVehicleNearPoint(helicopters[partNum].SpawnPoint.x, helicopters[partNum].SpawnPoint.y, helicopters[partNum].SpawnPoint.z,  3.0) then

			ESX.Game.SpawnVehicle('polmav', {
				x = helicopters[partNum].SpawnPoint.x, 
				y = helicopters[partNum].SpawnPoint.y, 
				z = helicopters[partNum].SpawnPoint.z
			}, helicopters[partNum].Heading, function(vehicle)
				SetVehicleModKit(vehicle, 0)
				SetVehicleLivery(vehicle, 0)
			end)

		end

	end

	if part == 'VehicleDeleter' then

		local playerPed = GetPlayerPed(-1)
		local coords    = GetEntityCoords(playerPed)

		if IsPedInAnyVehicle(playerPed,  false) then

			local vehicle = GetVehiclePedIsIn(playerPed, false)

			if DoesEntityExist(vehicle) then
				CurrentAction     = 'delete_vehicle'
				CurrentActionMsg  = _U('store_vehicle')
				CurrentActionData = {vehicle = vehicle}
			end

		end

	end

	if part == 'BossActions' then
		CurrentAction     = 'menu_boss_actions'
		CurrentActionMsg  = _U('open_bossmenu')
		CurrentActionData = {}
	end

end)

AddEventHandler('esx_policejob:hasExitedMarker', function(station, part, partNum)
	ESX.UI.Menu.CloseAll()
	CurrentAction = nil
end)

AddEventHandler('esx_policejob:hasEnteredEntityZone', function(entity)

	local playerPed = GetPlayerPed(-1)

	if PlayerData.job ~= nil and PlayerData.job.name == 'police' and not IsPedInAnyVehicle(playerPed, false) then
		CurrentAction     = 'remove_entity'
		CurrentActionMsg  = _U('remove_object')
		CurrentActionData = {entity = entity}
	end

	if GetEntityModel(entity) == GetHashKey('p_ld_stinger_s') then

		local playerPed = GetPlayerPed(-1)
		local coords    = GetEntityCoords(playerPed)

		if IsPedInAnyVehicle(playerPed,  false) then

			local vehicle = GetVehiclePedIsIn(playerPed)

			for i=0, 7, 1 do
				SetVehicleTyreBurst(vehicle,  i,  true,  1000)
			end

		end

	end

end)

AddEventHandler('esx_policejob:hasExitedEntityZone', function(entity)

	if CurrentAction == 'remove_entity' then
		CurrentAction = nil
	end

end)

RegisterNetEvent('esx_policejob:handcuff')
AddEventHandler('esx_policejob:handcuff', function()

	IsHandcuffed    = not IsHandcuffed;
	local playerPed = GetPlayerPed(-1)

	Citizen.CreateThread(function()

		if IsHandcuffed then
			
			RequestAnimDict('mp_arresting')
			
			while not HasAnimDictLoaded('mp_arresting') do
				Wait(100)
			end
			
			TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
			SetEnableHandcuffs(playerPed, true)
			SetPedCanPlayGestureAnims(playerPed, false)
			FreezeEntityPosition(playerPed,  true)
		
		else
			
			ClearPedSecondaryTask(playerPed)
			SetEnableHandcuffs(playerPed, false)
			SetPedCanPlayGestureAnims(playerPed,  true)
			FreezeEntityPosition(playerPed, false)
		
		end

	end)
end)
RegisterNetEvent('esx_policejob:drag')
 AddEventHandler('esx_policejob:drag', function(cop)
 	TriggerServerEvent('esx:clientLog', 'starting dragging')
 	IsDragged = not IsDragged
 	CopPed = tonumber(cop)
 end)
 
 Citizen.CreateThread(function()
 	while true do
 		Wait(0)
 		if IsHandcuffed then
 			if IsDragged then
 				local ped = GetPlayerPed(GetPlayerFromServerId(CopPed))
 				local myped = GetPlayerPed(-1)
 				AttachEntityToEntity(myped, ped, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)		
 			else
 				DetachEntity(GetPlayerPed(-1), true, false)	
 			end
 		end
 	end
 end)

RegisterNetEvent('esx_policejob:putInVehicle')
AddEventHandler('esx_policejob:putInVehicle', function()

	local playerPed = GetPlayerPed(-1)
	local coords    = GetEntityCoords(playerPed)

  if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then

		local vehicle = GetClosestVehicle(coords.x,  coords.y,  coords.z,  5.0,  0,  71)
    
    if DoesEntityExist(vehicle) then

    	local maxSeats = GetVehicleMaxNumberOfPassengers(vehicle)
    	local freeSeat = nil

    	for i=maxSeats - 1, 0, -1 do
    		if IsVehicleSeatFree(vehicle,  i) then
    			freeSeat = i
    			break
    		end
    	end

    	if freeSeat ~= nil then
    		TaskWarpPedIntoVehicle(playerPed,  vehicle,  freeSeat)
    	end

    end

  end	

end)

-- Handcuff
Citizen.CreateThread(function()
	while true do
		Wait(0)
		if IsHandcuffed then
			DisableControlAction(0, 142, true) -- MeleeAttackAlternate
			DisableControlAction(0, 30,  true) -- MoveLeftRight
			DisableControlAction(0, 31,  true) -- MoveUpDown
		end
	end
end)

-- Create blips
Citizen.CreateThread(function()

	for k,v in pairs(Config.PoliceStations) do

		local blip = AddBlipForCoord(v.Blip.Pos.x, v.Blip.Pos.y, v.Blip.Pos.z)
	  
	  SetBlipSprite (blip, 60)
	  SetBlipDisplay(blip, 4)
	  SetBlipScale  (blip, 1.2)
	  SetBlipColour (blip, v.Blip.Color)
	  SetBlipAsShortRange(blip, true)
		
		BeginTextCommandSetBlipName("STRING")
	  AddTextComponentString(_U('map_blip'))
	  EndTextCommandSetBlipName(blip)

	end

end)

-- Display markers
Citizen.CreateThread(function()
	while true do
		
		Wait(0)
		
		if PlayerData.job ~= nil and PlayerData.job.name == 'police' then

			local playerPed = GetPlayerPed(-1)
			local coords    = GetEntityCoords(playerPed)
			
			for k,v in pairs(Config.PoliceStations) do

				for i=1, #v.Cloakrooms, 1 do
					if GetDistanceBetweenCoords(coords,  v.Cloakrooms[i].x,  v.Cloakrooms[i].y,  v.Cloakrooms[i].z,  true) < Config.DrawDistance then
						DrawMarker(Config.MarkerType, v.Cloakrooms[i].x, v.Cloakrooms[i].y, v.Cloakrooms[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
					end
				end

				for i=1, #v.Armories, 1 do
					if GetDistanceBetweenCoords(coords,  v.Armories[i].x,  v.Armories[i].y,  v.Armories[i].z,  true) < Config.DrawDistance then
						DrawMarker(Config.MarkerType, v.Armories[i].x, v.Armories[i].y, v.Armories[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
					end
				end

				for i=1, #v.Vehicles, 1 do
					if GetDistanceBetweenCoords(coords,  v.Vehicles[i].Spawner.x,  v.Vehicles[i].Spawner.y,  v.Vehicles[i].Spawner.z,  true) < Config.DrawDistance then
						DrawMarker(Config.MarkerType, v.Vehicles[i].Spawner.x, v.Vehicles[i].Spawner.y, v.Vehicles[i].Spawner.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
					end
				end

				for i=1, #v.VehicleDeleters, 1 do
					if GetDistanceBetweenCoords(coords,  v.VehicleDeleters[i].x,  v.VehicleDeleters[i].y,  v.VehicleDeleters[i].z,  true) < Config.DrawDistance then
						DrawMarker(Config.MarkerType, v.VehicleDeleters[i].x, v.VehicleDeleters[i].y, v.VehicleDeleters[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
					end
				end

				if Config.EnablePlayerManagement and PlayerData.job ~= nil and PlayerData.job.name == 'police' and PlayerData.job.grade_name == 'boss' then

					for i=1, #v.BossActions, 1 do
						if not v.BossActions[i].disabled and GetDistanceBetweenCoords(coords,  v.BossActions[i].x,  v.BossActions[i].y,  v.BossActions[i].z,  true) < Config.DrawDistance then
							DrawMarker(Config.MarkerType, v.BossActions[i].x, v.BossActions[i].y, v.BossActions[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
						end
					end

				end

			end

		end

	end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()

	while true do

		Wait(0)

		if PlayerData.job ~= nil and PlayerData.job.name == 'police' then

			local playerPed      = GetPlayerPed(-1)
			local coords         = GetEntityCoords(playerPed)
			local isInMarker     = false
			local currentStation = nil
			local currentPart    = nil
			local currentPartNum = nil

			for k,v in pairs(Config.PoliceStations) do

				for i=1, #v.Cloakrooms, 1 do
					if GetDistanceBetweenCoords(coords,  v.Cloakrooms[i].x,  v.Cloakrooms[i].y,  v.Cloakrooms[i].z,  true) < Config.MarkerSize.x then
						isInMarker     = true
						currentStation = k
						currentPart    = 'Cloakroom'
						currentPartNum = i
					end
				end

				for i=1, #v.Armories, 1 do
					if GetDistanceBetweenCoords(coords,  v.Armories[i].x,  v.Armories[i].y,  v.Armories[i].z,  true) < Config.MarkerSize.x then
						isInMarker     = true
						currentStation = k
						currentPart    = 'Armory'
						currentPartNum = i
					end
				end

				for i=1, #v.Vehicles, 1 do
					
					if GetDistanceBetweenCoords(coords,  v.Vehicles[i].Spawner.x,  v.Vehicles[i].Spawner.y,  v.Vehicles[i].Spawner.z,  true) < Config.MarkerSize.x then
						isInMarker     = true
						currentStation = k
						currentPart    = 'VehicleSpawner'
						currentPartNum = i
					end

					if GetDistanceBetweenCoords(coords,  v.Vehicles[i].SpawnPoint.x,  v.Vehicles[i].SpawnPoint.y,  v.Vehicles[i].SpawnPoint.z,  true) < Config.MarkerSize.x then
						isInMarker     = true
						currentStation = k
						currentPart    = 'VehicleSpawnPoint'
						currentPartNum = i
					end

				end

				for i=1, #v.Helicopters, 1 do
					
					if GetDistanceBetweenCoords(coords,  v.Helicopters[i].Spawner.x,  v.Helicopters[i].Spawner.y,  v.Helicopters[i].Spawner.z,  true) < Config.MarkerSize.x then
						isInMarker     = true
						currentStation = k
						currentPart    = 'HelicopterSpawner'
						currentPartNum = i
					end

					if GetDistanceBetweenCoords(coords,  v.Helicopters[i].SpawnPoint.x,  v.Helicopters[i].SpawnPoint.y,  v.Helicopters[i].SpawnPoint.z,  true) < Config.MarkerSize.x then
						isInMarker     = true
						currentStation = k
						currentPart    = 'HelicopterSpawnPoint'
						currentPartNum = i
					end

				end

				for i=1, #v.VehicleDeleters, 1 do
					if GetDistanceBetweenCoords(coords,  v.VehicleDeleters[i].x,  v.VehicleDeleters[i].y,  v.VehicleDeleters[i].z,  true) < Config.MarkerSize.x then
						isInMarker     = true
						currentStation = k
						currentPart    = 'VehicleDeleter'
						currentPartNum = i
					end
				end

				if Config.EnablePlayerManagement and PlayerData.job ~= nil and PlayerData.job.name == 'police' and PlayerData.job.grade_name == 'boss' then

					for i=1, #v.BossActions, 1 do
						if GetDistanceBetweenCoords(coords,  v.BossActions[i].x,  v.BossActions[i].y,  v.BossActions[i].z,  true) < Config.MarkerSize.x then
							isInMarker     = true
							currentStation = k
							currentPart    = 'BossActions'
							currentPartNum = i
						end
					end

				end

			end

			local hasExited = false

			if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum) ) then
				
				if
					(LastStation ~= nil and LastPart ~= nil and LastPartNum ~= nil) and
					(LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)
				then
					TriggerEvent('esx_policejob:hasExitedMarker', LastStation, LastPart, LastPartNum)
					hasExited = true
				end

				HasAlreadyEnteredMarker = true
				LastStation             = currentStation
				LastPart                = currentPart
				LastPartNum             = currentPartNum
				
				TriggerEvent('esx_policejob:hasEnteredMarker', currentStation, currentPart, currentPartNum)
			end

			if not hasExited and not isInMarker and HasAlreadyEnteredMarker then
				
				HasAlreadyEnteredMarker = false
				
				TriggerEvent('esx_policejob:hasExitedMarker', LastStation, LastPart, LastPartNum)
			end

		end

	end
end)

-- -- Enter / Exit entity zone events
-- Citizen.CreateThread(function()
	
-- 	local trackedEntities = {
-- 		'prop_roadcone02a',
-- 		'prop_barrier_work06a',
-- 		'p_ld_stinger_s',
-- 		'prop_boxpile_07d',
-- 		'prop_cctv_pole_01a',
-- 		'hei_prop_cash_crate_half_full'
-- 	}

-- 	while true do

-- 		Citizen.Wait(0)

-- 		local playerPed = GetPlayerPed(-1)
-- 		local coords    = GetEntityCoords(playerPed)

-- 		local closestDistance = -1
-- 		local closestEntity   = nil

-- 		for i=1, #trackedEntities, 1 do
			
-- 			local object = GetClosestObjectOfType(coords.x,  coords.y,  coords.z,  3.0,  GetHashKey(trackedEntities[i]), false, false, false)
			
-- 			if DoesEntityExist(object) then

-- 				local objCoords = GetEntityCoords(object)
-- 				local distance  = GetDistanceBetweenCoords(coords.x,  coords.y,  coords.z,  objCoords.x,  objCoords.y,  objCoords.z,  true)

-- 				if closestDistance == -1 or closestDistance > distance then
-- 					closestDistance = distance
-- 					closestEntity   = object
-- 				end

-- 			end

-- 		end

-- 		if closestDistance ~= -1 and closestDistance <= 3.0 then

--  			if LastEntity ~= closestEntity then
-- 				TriggerEvent('esx_policejob:hasEnteredEntityZone', closestEntity)
-- 				LastEntity = closestEntity
-- 			end

-- 		else

-- 			if LastEntity ~= nil then
-- 				TriggerEvent('esx_policejob:hasExitedEntityZone', LastEntity)
-- 				LastEntity = nil
-- 			end

-- 		end

-- 	end
-- end)

-- Key Controls
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(0)

		if CurrentAction ~= nil then

			SetTextComponentFormat('STRING')
			AddTextComponentString(CurrentActionMsg)
			DisplayHelpTextFromStringLabel(0, 0, 1, -1)

			if IsControlPressed(0,  Keys['E']) and PlayerData.job ~= nil and PlayerData.job.name == 'police' and (GetGameTimer() - GUI.Time) > 150 then

				if CurrentAction == 'menu_cloakroom' then
					OpenCloakroomMenu()
				end

				if CurrentAction == 'menu_armory' then
					ESX.TriggerServerCallback('esx_policejob:getItemAmount', function(qtty)
						if qtty > 0 then
							OpenArmoryMenu(CurrentActionData.station)
						else
							ESX.ShowNotification('Vous n\'avez pas la clé de l\'armurerie')
						end
					end, 'keyarmory')
				end

				if CurrentAction == 'menu_vehicle_spawner' then
					OpenVehicleSpawnerMenu(CurrentActionData.station, CurrentActionData.partNum)
				end

				if CurrentAction == 'delete_vehicle' then
					local playerPed = GetPlayerPed(-1)
					local vehicle   = GetVehiclePedIsIn(playerPed,  false)
					local hash      = GetEntityModel(vehicle)
					if Config.EnableSocietyOwnedVehicles then

						local vehicleProps = ESX.Game.GetVehicleProperties(CurrentActionData.vehicle)
						TriggerServerEvent('esx_society:putVehicleInGarage', 'police', vehicleProps)
						TriggerServerEvent('esx_service:disableService', 'police')
							local vehicle = GetVehiclePedIsIn(playerPed, false)
							local plate = GetVehicleNumberPlateText(vehicle)
							local damage = GetVehicleEngineHealth(vehicle)
							plate = string.gsub(plate, " ", "")
							TriggerServerEvent('esx_vehiclelock:deletekeyjobs', 'no', plate) --vehicle lock
							DeleteVehicle(vehicle)

					else										
						if
							GetEntityModel(vehicle) == GetHashKey('police')  or
							GetEntityModel(vehicle) == GetHashKey('police2') or
							GetEntityModel(vehicle) == GetHashKey('police3') or
							GetEntityModel(vehicle) == GetHashKey('police4') or
							GetEntityModel(vehicle) == GetHashKey('policeb') or
							GetEntityModel(vehicle) == GetHashKey('policet') or
							GetEntityModel(vehicle) == GetHashKey('policebike') or
							GetEntityModel(vehicle) == GetHashKey('sheriff2') or
							GetEntityModel(vehicle) == GetHashKey('pbus') or
							GetEntityModel(vehicle) == GetHashKey('riot') or
							GetEntityModel(vehicle) == GetHashKey('fbi') or
							GetEntityModel(vehicle) == GetHashKey('fbi2')

						then
							TriggerServerEvent('esx_service:disableService', 'police')
							local vehicle = GetVehiclePedIsIn(playerPed, false)
							local plate = GetVehicleNumberPlateText(vehicle)
							local damage = GetVehicleEngineHealth(vehicle)
							plate = string.gsub(plate, " ", "")
							TriggerServerEvent('esx_vehiclelock:deletekeyjobs', 'no', plate) --vehicle lock
							DeleteVehicle(vehicle)
							--[[
	                        if damage >= 990 then
	                            Caution = 300
	                            TriggerServerEvent('esx_policejob:Caution900', Caution)
	                        elseif damage >= 980 then
	                            Caution = 200
	                            TriggerServerEvent('esx_policejob:Caution800', Caution)
	                        elseif damage >= 970 then
	                            Caution = 100
	                            TriggerServerEvent('esx_policejob:Caution700', Caution)
	                        elseif damage <= 960 then
	                            Caution = 0
	                            TriggerServerEvent('esx_policejob:Caution0', Caution)
							end
							]]
						else
							ESX.ShowNotification('Vous ne pouvez ranger que des ~b~véhicules de service')
						end
					end
				end

				if CurrentAction == 'menu_boss_actions' then
					
					ESX.UI.Menu.CloseAll()

					TriggerEvent('esx_society:openBossMenu', 'police', function(data, menu)

						menu.close()

						CurrentAction     = 'menu_boss_actions'
						CurrentActionMsg  = _U('open_bossmenu')
						CurrentActionData = {}

					end)

				end

				if CurrentAction == 'remove_entity' then
					DeleteEntity(CurrentActionData.entity)
				end

				CurrentAction = nil
				GUI.Time      = GetGameTimer()
				
			end

		end

		if IsControlPressed(0,  Keys['F6']) and PlayerData.job ~= nil and PlayerData.job.name == 'police' and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'police_actions') and (GetGameTimer() - GUI.Time) > 150 then
			OpenPoliceActionsMenu()
			GUI.Time = GetGameTimer()
		end

	end
end)

---------- Prison ---------------

function OpenUnjailMenu(player)
  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'unjail',
    {
      title    = _U('unjail'),
      align    = 'top-left',
      elements = {
        {label = _U('cop_unjail'),   value = 1}
      },
    },
    function(data, menu)
        menu.close()

        if data.current.value == 1 then
          ESX.ShowNotification(_U('unjail_ok'))
          TriggerServerEvent('esx_policejob:UnjailPlayer', GetPlayerServerId(player))
        end

        ESX.SetTimeout(300, function()
          OpenUnjailMenu(player)
        end)

      end,
      function(data, menu)
        menu.close()
      end
  )
end

function OpenJailMenu(player)
  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'jail',
    {
      title    = _U('jail'),
      align    = 'top-left',
      elements = {
        {label = _U('5_jail'),   value = 300},
        {label = _U('10_jail'),     value = 600},
        {label = _U('15_jail'),   value = 900},
        {label = _U('Illimité'), value = 999999999}
      },
    },
    function(data, menu)
        menu.close()

        if data.current.value == 120 then
          TriggerServerEvent('esx_policejob:AddPlayer', GetPlayerServerId(player), data.current.value)
        end

        if data.current.value == 300 then
          TriggerServerEvent('esx_policejob:AddPlayer', GetPlayerServerId(player), data.current.value)
        end

        if data.current.value == 600 then
          TriggerServerEvent('esx_policejob:AddPlayer', GetPlayerServerId(player), data.current.value)
        end

        if data.current.value == 999999999 then
          TriggerServerEvent('esx_policejob:AddPlayer', GetPlayerServerId(player), data.current.value)
        end

        ESX.SetTimeout(300, function()
          OpenJailMenu(player)
        end)

      end,
      function(data, menu)
        menu.close()
      end
  )
end

RegisterNetEvent("Jail")
AddEventHandler("Jail", function(jT)
  if cJ == true then
    return
  end
  local pP = GetPlayerPed(-1)
  if DoesEntityExist(pP) then
    Citizen.CreateThread(function()
      local playerOldLoc = GetEntityCoords(pP, true)
      SetEntityCoords(pP, 1796.4204101563, 2477.7270507813, -122.69639587402)
      ----
      ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jailSkin)
			if skin.sex == 0 then
				SetPedComponentVariation(GetPlayerPed(-1), 3, 5, 0, 0)--Gants
				SetPedComponentVariation(GetPlayerPed(-1), 4, 9, 4, 0)--Jean
				SetPedComponentVariation(GetPlayerPed(-1), 6, 61, 0, 0)--Chaussure
				SetPedComponentVariation(GetPlayerPed(-1), 11, 5, 0, 0)--Veste
				SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 0)--GiletJaune
			elseif skin.sex == 1 then
                SetPedComponentVariation(GetPlayerPed(-1), 3, 14, 0, 0)--Gants
                SetPedComponentVariation(GetPlayerPed(-1), 4, 3, 15, 0)--Jean
                SetPedComponentVariation(GetPlayerPed(-1), 6, 52, 0, 0)--Chaussure
                SetPedComponentVariation(GetPlayerPed(-1), 11, 73, 0, 0)--Veste
                SetPedComponentVariation(GetPlayerPed(-1), 8, 14, 0, 0)--GiletJaune
			else
				TriggerEvent('skinchanger:loadClothes', skin, jailSkin.skin_female)
			end
		end)
      ----
      cJ = true
      eJE = false
      while jT > 0 and not eJE do
        pP = GetPlayerPed(-1)
        --RemoveAllPedWeapons(pP, true)
        SetEntityInvincible(pP, true)
        if IsPedInAnyVehicle(pP, false) then
          ClearPedTasksImmediately(pP)
        end
        if jT % 30 == 0 then
          TriggerEvent('chatMessage', 'GARDIEN', { 0, 0, 0 }, jT .." secondes manquantes avant votre libération.")
        end
        Citizen.Wait(500)
        jT = jT - 0.5
      end
      TriggerServerEvent('esx_policejob:FreePlayer', GetPlayerName(PlayerId()))
      SetEntityCoords(pP, 460.2106628418, -994.19104003906, 24.914875030518)
----
      ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jailSkin)
			TriggerEvent('skinchanger:loadSkin', skin)
		end)
----
      cJ = false
      SetEntityInvincible(pP, false)
    end)
  end
end)

RegisterNetEvent("UnJail")
AddEventHandler("UnJail", function()
  eJE = true
end)


----------------
--Teste SWAT
----------------


--Début Swat
--Tenu Swat
RegisterNetEvent('esx_tenues:settenueswt1')
AddEventHandler('esx_tenues:settenueswt1', function(swat)
	if UseTenu then

		TriggerEvent('skinchanger:getSkin', function(skin)

    		if skin.sex == 0 then
        		local clothesSkinSwat = {
            		['tshirt_1'] 	= 15, 	['tshirt_2'] 	= 0,
            		['torso_1'] 	= 50, 	['torso_2'] 	= 0,
            		['mask_1'] 		= 46, 	['mask_2'] 		= 0,
            		['arms'] 		= 49,
            		['pants_1'] 	= 33, 	['pants_2'] 	= 0,
            		['shoes_1'] 	= 25, 	['shoes_2'] 	= 0,
            		['helmet_1'] 	= 39, 	['helmet_2'] 	= 0,
            		['bags_1']		= 0, 	['bags_2']		= 0,
            		['bproof_1'] 	= 16,  	['bproof_2'] 	= 2,
            		['glasses_1'] 	= 0,  	['glasses_2'] 	= 0
        		}
        		TriggerEvent('skinchanger:loadClothes', skin, clothesSkinSwat)
    		else
        		local clothesSkinSwat = {
            		['tshirt_1'] 	= 15, ['tshirt_2'] 	= 0,
            		['torso_1'] 	= 103, ['torso_2'] 	= 3,
            		['mask_1'] 		= 46, ['mask_2'] 	= 0,
            		['arms'] 		= 53,
					['face']		= 0,
            		['pants_1'] 	= 61, 	['pants_2'] 	= 9,
            		['shoes_1'] 	= 25, 	['shoes_2'] 	= 0,
            		['helmet_1'] 	= 59, 	['helmet_2'] 	= 9,
            		['bags_1']		= 0, 	['bags_2']		= 0,
            		['bproof_1'] 	= 18,  	['bproof_2'] 	= 2,
            		['glasses_1'] 	= 5,  	['glasses_2'] 	= 0
        		}
        		TriggerEvent('skinchanger:loadClothes', skin, clothesSkinSwat)
        	end
        	local playerPed = GetPlayerPed(-1)
    		SetPedArmour(playerPed, 100)
    		ClearPedBloodDamage(playerPed)
    		ResetPedVisibleDamage(playerPed)
    		ClearPedLastWeaponDamage(playerPed)
    	end)
	else

		TriggerEvent('skinchanger:getSkin', function(skin)

			if PlayerData.job ~= nil and PlayerData.job.name == 'police' then
      
				if skin.sex == 0 then
        			local TenuPolice = {
            			['tshirt_1'] 	= 58, ['tshirt_2'] 	= 0,
            			['torso_1'] 	= 55, ['torso_2'] 	= 0,
            			['mask_1'] 		= 0,  ['mask_2'] 	= 0,
            			['arms'] 		= 30,
            			['helmet_1'] 	= -1, ['helmet_2'] 	= 0,
            			['bags_1']		= 0,  ['bags_2']	= 0,
            			['pants_1'] 	= 33, ['pants_2'] 	= 0,
            			['shoes_1'] 	= 24, ['shoes_2'] 	= 0,
            			['bproof_1'] 	= 0,  ['bproof_2'] 	= 0
        			}
        			TriggerEvent('skinchanger:loadClothes', skin, TenuPolice)

    			else
        			local TenuPolice = {
            			['tshirt_1'] 	= 35, ['tshirt_2'] 	= 0,
            			['torso_1'] 	= 48, ['torso_2'] 	= 0,
            			['mask_1'] 		= 0,  ['mask_2'] 	= 0,
            			['arms'] 		= 44,
            			['helmet_1'] 	= -1, ['helmet_2'] 	= 0,
            			['bags_1']		= 0,  ['bags_2']	= 0,
            			['pants_1'] 	= 61, ['pants_2'] 	= 9,
            			['shoes_1'] 	= 24, ['shoes_2'] 	= 0,
            			['bproof_1'] 	= 0,  ['bproof_2'] 	= 0
        			}
        			TriggerEvent('skinchanger:loadClothes', skin, TenuPolice)
        		end
        		local playerPed = GetPlayerPed(-1)
    			SetPedArmour(playerPed, 0)
    			ClearPedBloodDamage(playerPed)
    			ResetPedVisibleDamage(playerPed)
    			ClearPedLastWeaponDamage(playerPed)

			else

				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, hasSkin)

					if hasSkin then

						TriggerEvent('skinchanger:loadSkin', skin)
						TriggerEvent('esx:restoreLoadout')
					end
        		local playerPed = GetPlayerPed(-1)
    			SetPedArmour(playerPed, 0)
				end)
			end
		end)
	end

	UseTenu  = not UseTenu
	GUI.Time = GetGameTimer()

end)





