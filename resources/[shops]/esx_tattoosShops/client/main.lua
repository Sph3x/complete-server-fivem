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

ESX								= nil
local currentTattoos			= {}
local cam						= -1
local HasAlreadyEnteredMarker	= false
local LastZone					= nil
local CurrentAction				= nil
local CurrentActionMsg			= ''
local CurrentActionData			= {}

Citizen.CreateThread(function()
	addBlips()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	-- load tattoo
	Citizen.Wait(10000) -- wait for player skin to load, there's probably a trigger you could use instead
	ESX.TriggerServerCallback('esx_tattooshop:requestPlayerTattoos', function(tattooList)
		for _,k in pairs(tattooList) do
			ApplyPedOverlay(GetPlayerPed(-1), GetHashKey(k.collection), GetHashKey(Config.TattooList[k.collection][k.texture].nameHash))
		end
		currentTattoos = tattooList
	end)
end)

function OpenShopMenu()
	local elements = {}

	for _,k in pairs(Config.TattooCategories) do
		table.insert(elements, {label= k.name, value = k.value})
	end

	if DoesCamExist(cam) then
		RenderScriptCams(false, false, 0, 1, 0)
		DestroyCam(cam, false)
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'Tattoos_menu',
	{
		title    = _U('tattoos'),
		align    = 'bottom-right',
		elements = elements,
	}, function(data, menu)
		local currentLabel = data.current.label
		local currentValue = data.current.value
		if data.current.value ~= nil then
			elements = {}
			table.insert(elements, {label = _U('go_back_to_menu'), value = nil})
			for i,k in pairs(Config.TattooList[data.current.value]) do
				table.insert(elements, {label= _U('tattoo') .. ' n°'..i..' - ' .. _U('money_amount', k.price), value = i, price = k.price})
			end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'Tattoos_Categories_menu',
			{
				title    = _U('tattoos') .. ' | '..currentLabel,
				align    = 'bottom-right',
				elements = elements,
			}, function(data2, menu2)
				local price = data2.current.price
				if data2.current.value ~= nil then

					ESX.TriggerServerCallback('esx_tattooshop:purchaseTattoo', function(success)
						if success then
							table.insert(currentTattoos, {collection = currentValue, texture = data2.current.value})
						end
					end, currentTattoos, price, {collection = currentValue, texture = data2.current.value})

				else
					OpenShopMenu()
					RenderScriptCams(false, false, 0, 1, 0)
					DestroyCam(cam, false)
					cleanPlayer()
				end

			end, function(data2, menu2)
				menu2.close()
				RenderScriptCams(false, false, 0, 1, 0)
				DestroyCam(cam, false)
				setPedSkin()
			end, function(data2, menu2) -- when highlighted
				if data2.current.value ~= nil then
					drawTattoo(data2.current.value, currentValue)
				end
			end)
		end
	end, function(data, menu)
		menu.close()
		setPedSkin()
	end)
end

function addBlips()
	for _,k in pairs(Config.Zones) do
		local blip = AddBlipForCoord(k.x, k.y, k.z)
		SetBlipSprite(blip, 75)
		SetBlipColour(blip, 1)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString(_U('tattoo_shop'))
		EndTextCommandSetBlipName(blip)
	end
end

-- Display markers
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local coords = GetEntityCoords(GetPlayerPed(-1))
		for k,v in pairs(Config.Zones) do
			if(Config.Type ~= -1 and GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.DrawDistance) then
				DrawMarker(Config.Type, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g, Config.Color.b, 100, false, true, 2, false, false, false, false)
			end
		end
	end
  end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		local coords      = GetEntityCoords(GetPlayerPed(-1))
		local isInMarker  = false
		local currentZone = nil

		for k,v in pairs(Config.Zones) do
			if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.Size.x) then
				isInMarker  = true
				currentZone = k
				LastZone    = k
			end
		end
		if isInMarker and not HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = true
			TriggerEvent('esx_tattooshop:hasEnteredMarker', currentZone)
		end
		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_tattooshop:hasExitedMarker', LastZone)
		end
	end
end)

AddEventHandler('esx_tattooshop:hasEnteredMarker', function(zone)
	CurrentAction     = 'tattoo_shop'
	CurrentActionMsg  = _U('tattoo_shop_nearby')
	CurrentActionData = {zone = zone}
end)

AddEventHandler('esx_tattooshop:hasExitedMarker', function(zone)
	CurrentAction = nil
	ESX.UI.Menu.CloseAll()
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
	Citizen.Wait(10)
		if CurrentAction ~= nil then
			showNotification(CurrentActionMsg)

			if IsControlJustReleased(0, Keys['E']) then
				if CurrentAction == 'tattoo_shop' then
					OpenShopMenu()
				end
				CurrentAction = nil
			end
		end
	end
end)

function setPedSkin()
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		TriggerEvent('skinchanger:loadSkin', skin)
	end)
	
	Citizen.Wait(1000)

	for _,k in pairs(currentTattoos) do
		ApplyPedOverlay(GetPlayerPed(-1), GetHashKey(k.collection), GetHashKey(Config.TattooList[k.collection][k.texture].nameHash))
	end
end

function drawTattoo(current, collection)
	SetEntityHeading(GetPlayerPed(-1), 297.7296)

	ClearPedDecorations(GetPlayerPed(-1))
	for _,k in pairs(currentTattoos) do
		ApplyPedOverlay(GetPlayerPed(-1), GetHashKey(k.collection), GetHashKey(Config.TattooList[k.collection][k.texture].nameHash))
	end

	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
			TriggerEvent('skinchanger:loadSkin', {
				sex      = 0,
				tshirt_1 = 15,
				tshirt_2 = 0,
				arms     = 15,
				torso_1  = 91,
				torso_2  = 0,
				pants_1  = 14,
				pants_2  = 0
			})
		else
			TriggerEvent('skinchanger:loadSkin', {
				sex      = 1,
				tshirt_1 = 34,
				tshirt_2 = 0,
				arms     = 15,
				torso_1  = 101,
				torso_2  = 1,
				pants_1  = 16,
				pants_2  = 0
			})
		end
	end)

	ApplyPedOverlay(GetPlayerPed(-1), GetHashKey(collection), GetHashKey(Config.TattooList[collection][current].nameHash))

	if(not DoesCamExist(cam)) then
		cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
		
		SetCamCoord(cam, GetEntityCoords(GetPlayerPed(-1)))
		SetCamRot(cam, 0.0, 0.0, 0.0)
		SetCamActive(cam, true)
		RenderScriptCams(true, false, 0, true, true)
		SetCamCoord(cam, GetEntityCoords(GetPlayerPed(-1)))
	end

	local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1)))

	SetCamCoord(cam, x+Config.TattooList[collection][current].addedX, y+Config.TattooList[collection][current].addedY, z+Config.TattooList[collection][current].addedZ)
	SetCamRot(cam, 0.0, 0.0, Config.TattooList[collection][current].rotZ)
end

function cleanPlayer()
	ClearPedDecorations(GetPlayerPed(-1))
	for _,k in pairs(currentTattoos) do
		ApplyPedOverlay(GetPlayerPed(-1), GetHashKey(k.collection), GetHashKey(Config.TattooList[k.collection][k.texture].nameHash))
	end
end

function showNotification(text)
	SetTextComponentFormat('STRING')
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end