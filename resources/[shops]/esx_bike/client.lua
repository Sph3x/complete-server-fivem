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

ESX          = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

local havebike = false

Citizen.CreateThread(function()

	if not Config.EnableBlips then return end
	
	for _, info in pairs(Config.BlipZones) do
		info.blip = AddBlipForCoord(info.x, info.y, info.z)
		SetBlipSprite(info.blip, info.id)
		SetBlipDisplay(info.blip, 4)
		SetBlipScale(info.blip, 1.0)
		SetBlipColour(info.blip, info.colour)
		SetBlipAsShortRange(info.blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(info.title)
		EndTextCommandSetBlipName(info.blip)
	end
end)



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k in pairs(Config.MarkerZones) do
            DrawMarker(27, Config.MarkerZones[k].x, Config.MarkerZones[k].y, Config.MarkerZones[k].z, 0, 0, 0, 0, 0, 0, 2.001, 2.0001, 0.501, 0, 255, 255, 100, 0, 0, 0, 0)
			
		end
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
	
        for k in pairs(Config.MarkerZones) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, Config.MarkerZones[k].x, Config.MarkerZones[k].y, Config.MarkerZones[k].z)
            if dist <= 1.40 then
				if havebike == false then
					AddTextEntry("FREE_BIKE", _U('press_e'))
					DisplayHelpTextThisFrame("FREE_BIKE",false )
					if IsControlJustPressed(0, Keys['E']) and IsPedOnFoot(PlayerPedId()) then
						Citizen.Wait(100)  
						OpenBikesMenu()
					end 
				elseif havebike == true then
					AddTextEntry("FREE_BIKE", _U('storebike')) 
					DisplayHelpTextThisFrame("FREE_BIKE",false )
					if IsControlJustPressed(0, Keys['E']) then
						if IsPedOnAnyBike(PlayerPedId()) then
							Citizen.Wait(100) 
							if Config.EnableEffects then
								DoScreenFadeOut(1000)
								Citizen.Wait(500)
								TriggerEvent('esx:deleteVehicle')
								DoScreenFadeIn(3000) 
							else
								TriggerEvent('esx:deleteVehicle')
							end
							
							if Config.EnableEffects then
								ESX.ShowNotification(_U('bikemessage'))
							else
								TriggerEvent("chatMessage", _U('bikes'), {255,255,0}, _U('bikemessage'))
							end
							havebike = false
						else
							if Config.EnableEffects then
								ESX.ShowNotification(_U('notabike'))
							else
								TriggerEvent("chatMessage", _U('bikes'), {255,255,0}, _U('notabike'))
							end
						end
					end 		
				end
			elseif dist < 1.45 then
				ESX.UI.Menu.CloseAll()
            end
        end
    end
end)



function OpenBikesMenu()
	
	local elements = {}
	
	if Config.EnablePrice == false then
		table.insert(elements, {label = _U('bikefree'), value = 'kolo'}) 
		table.insert(elements, {label = _U('bike2free'), value = 'kolo2'}) 
		table.insert(elements, {label = _U('bike3free'), value = 'kolo3'}) 
		table.insert(elements, {label = _U('bike4free'), value = 'kolo4'}) 
	end
	
	if Config.EnablePrice == true then
		table.insert(elements, {label = _U('bike'), value = 'kolo'}) 
		table.insert(elements, {label = _U('bike2'), value = 'kolo2'}) 
		table.insert(elements, {label = _U('bike3'), value = 'kolo3'}) 
		table.insert(elements, {label = _U('bike4'), value = 'kolo4'}) 
	end
	
	
	--- WIP 
	if Config.EnableBuyOutfits then
		table.insert(elements, {label = '--------------------------------------------------', value = 'spacer'}) 
		table.insert(elements, {label = _U('civil_outfit'), value = 'citizen_wear'}) 
		table.insert(elements, {label = _U('outfit'), value = 'outfit'}) 
		table.insert(elements, {label = _U('outfit2'), value = 'outfit2'}) 
		table.insert(elements, {label = _U('outfit3'), value = 'outfit3'}) 
	end
	
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'client',
    {
		title    = _U('biketitle'),
		align    = 'bottom-right',
		elements = elements,
    },
	
	
	function(data, menu)

	if data.current.value == 'kolo' then
		if Config.EnableSoundEffects == true then
			TriggerServerEvent('InteractSound_SV:PlayOnSource', 'buy', Config.Volume)
		end
		if Config.EnablePrice then
			TriggerServerEvent("esx:lowmoney", Config.PriceTriBike) 
		end
		
		if Config.EnableEffects then
			DoScreenFadeOut(1000)
			Citizen.Wait(1000)
			TriggerEvent('esx:spawnVehicle', "tribike2")
			DoScreenFadeIn(3000) 
			ESX.ShowNotification(_U('bike_pay', Config.PriceTriBike))
		else
			TriggerEvent('esx:spawnVehicle', "tribike2")
			TriggerEvent("chatMessage", _U('bikes'), {255,0,255}, _U('bike_pay', Config.PriceTriBike))
		end
		
		ESX.UI.Menu.CloseAll()
		havebike = true	
	end
	
	if data.current.value == 'kolo2' then
		if Config.EnableSoundEffects == true then
			TriggerServerEvent('InteractSound_SV:PlayOnSource', 'buy', Config.Volume)
		end
		if Config.EnablePrice then
			TriggerServerEvent("esx:lowmoney", Config.PriceScorcher) 
		end
		
		if Config.EnableEffects then
			DoScreenFadeOut(1000)
			Citizen.Wait(1000)
			TriggerEvent('esx:spawnVehicle', "scorcher")
			DoScreenFadeIn(3000) 
			ESX.ShowNotification(_U('bike_pay', Config.PriceScorcher))
		else
			TriggerEvent('esx:spawnVehicle', "scorcher")
			TriggerEvent("chatMessage", _U('bikes'), {255,0,255}, _U('bike_pay', Config.PriceScorcher))
		end
		
		ESX.UI.Menu.CloseAll()
		havebike = true	
	end
	
	if data.current.value == 'kolo3' then
		if Config.EnableSoundEffects == true then
			TriggerServerEvent('InteractSound_SV:PlayOnSource', 'buy', Config.Volume)
		end
		if Config.EnablePrice then
			TriggerServerEvent("esx:lowmoney", Config.PriceCruiser) 
		end
		
		if Config.EnableEffects then
			DoScreenFadeOut(1000)
			Citizen.Wait(1000)
			TriggerEvent('esx:spawnVehicle', "cruiser")
			DoScreenFadeIn(3000) 
			ESX.ShowNotification(_U('bike_pay', Config.PriceCruiser))
		else
			TriggerEvent('esx:spawnVehicle', "cruiser")
			TriggerEvent("chatMessage", _U('bikes'), {255,0,255}, _U('bike_pay', Config.PriceCruiser))
		end
		ESX.UI.Menu.CloseAll()
		havebike = true	
	end
	
	if data.current.value == 'kolo4' then
		if Config.EnableSoundEffects == true then
			TriggerServerEvent('InteractSound_SV:PlayOnSource', 'buy', Config.Volume)
		end
		if Config.EnablePrice then
			TriggerServerEvent("esx:lowmoney", Config.PriceBmx) 
		end
		
		if Config.EnableEffects then
			DoScreenFadeOut(1000)
			Citizen.Wait(1000)
			TriggerEvent('esx:spawnVehicle', "bmx")
			DoScreenFadeIn(3000) 
			ESX.ShowNotification(_U('bike_pay', Config.PriceBmx))
		else
			TriggerEvent('esx:spawnVehicle', "bmx")
			TriggerEvent("chatMessage", _U('bikes'), {255,0,255}, _U('bike_pay', Config.PriceBmx))
		end
		ESX.UI.Menu.CloseAll()
		havebike = true	
	end
	
	
	-- outfits
	
	if data.current.value == 'citizen_wear' then
		ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
			TriggerEvent('skinchanger:loadSkin', skin)
		end)
	end
	
	if data.current.value == 'outfit' then
        TriggerEvent('skinchanger:getSkin', function(skin)
        
            if skin.sex == 0 then

                local clothesSkin = {
					['tshirt_1'] = 0, ['tshirt_2'] = 0,
                    ['torso_1'] = 0, ['torso_2'] = 0,
                    ['decals_1'] = 0, ['decals_2'] = 0,
                    ['arms'] = 0,
                    ['pants_1'] = 0, ['pants_2'] = 0,
                    ['shoes_1'] = 0, ['shoes_2'] = 0,
                    ['helmet_1'] = -1, ['helmet_2'] = 0,
                    ['chain_1'] = 0, ['chain_2'] = 0,
                    ['ears_1'] = -1, ['ears_2'] = -1
                }
                TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

            else

                local clothesSkin = {
                    ['tshirt_1'] = 0, ['tshirt_2'] = 0,
                    ['torso_1'] = 0, ['torso_2'] = 0,
                    ['decals_1'] = 0, ['decals_2'] = 0,
                    ['arms'] = 0,
                    ['pants_1'] = 0, ['pants_2'] = 0,
                    ['shoes_1'] = 0, ['shoes_2'] = 0,
                    ['helmet_1'] = 0, ['helmet_2'] = 0,
                    ['chain_1'] = 0, ['chain_2'] = 0,
                    ['ears_1'] = -1, ['ears_2'] = -1
                }
                TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

            end

            local playerPed = GetPlayerPed(-1)
            ClearPedBloodDamage(playerPed)
            ResetPedVisibleDamage(playerPed)
            ClearPedLastWeaponDamage(playerPed)
            
        end)
      end
	

    end,
	function(data, menu)
		menu.close()
		end
	)
end

RegisterNetEvent('xyz:clientsaver')
AddEventHandler('xyz:clientsaver', function()
	x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
	local PlayerName = GetPlayerName(PlayerId())
	--DisplayBottomLeft("Coords [x]:"..x..", [y]:"..y..", [z]:"..z)
	TriggerServerEvent("xyz:saver", PlayerName, x , y , z)
end)
