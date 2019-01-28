--[[
	This script has nothing to do with ESX-org's vehicle inventory.
]]--
--ESX as usual--------------------------------------------------------
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(1)
	end
end)

PlayerData = nil

trunkIsOpen = false
currentExists = false
currentVehicle = nil
currentPlate = nil
currentProps = nil
currentContent = nil
---Debug
local trace = true
function dbg(msg)
	if trace then
		TriggerEvent('chatMessage', "", {255, 0, 0}, " ^1[esx_vehicletrunk]^0: ^6" .. tostring(msg))
	end
end
---

function getVehicleMaxCarry(vehicleType)
	return Config.VehicleCarry[vehicleType+1].value
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

function getAnusVector(entity)
	local hr = GetEntityHeading(entity) - 90.0
	if hr < 0.0 then
		hr = 360.0 + hr
	end
	hr = hr * 0.0174533
	return {
		x = math.cos(hr) * Config.VecOffset,
		y = math.sin(hr) * Config.VecOffset
	}
end

function IsDistanceOk()
	local c = GetEntityCoords(GetPlayerPed(-1))
	local f = getAnusVector(currentVehicle)
	local x, y, z   = table.unpack(GetEntityCoords(currentVehicle))
	x = x + f.x
	y = y + f.y
	return GetDistanceBetweenCoords(c, x, y, z, true) <= Config.MaxDistance
end

function drawTrunk(offsetX, offsetY, offsetZ)
	local f = getAnusVector(currentVehicle)
	local x, y, z   = table.unpack(GetEntityCoords(currentVehicle))
	x = x + f.x
	y = y + f.y
	DrawMarker(20, x + offsetX, y + offsetY, z + offsetZ, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.2, 0.2, 0.2, 255, 0, 25, 115, false, true, 2, false, false, false, false)
end

Citizen.CreateThread(function()
	while Config.EnableDebugMarker do
		if currentVehicle ~= nil then
			local vehicleType = GetVehicleClass(currentVehicle)
			if vehicleType == 8 then
				drawTrunk(0.75,1.3,0.35)
			elseif vehicleType ~= 13 then
				drawTrunk(0,0,0.85)
			end
		end
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
	while true do
		if (trunkIsOpen and currentPlate ~= nil and not IsDistanceOk()) or (trunkIsOpen and IsPedInAnyVehicle(GetPlayerPed(-1))) or (trunkIsOpen and IsDoorLocked()) then
			TriggerEvent('esx_vehicletrunk:onQuit')
			Citizen.Wait(500)
		end
		Citizen.Wait(100)
	end
end)


AddEventHandler('esx_vehicletrunk:onTrunkOpen', function()
	SetVehicleDoorOpen(currentVehicle,5,0,0)
end)

AddEventHandler('esx_vehicletrunk:onTrunkClose', function()
	SetVehicleDoorShut(currentVehicle,5,0)
end)

RegisterNetEvent('esx_vehicletrunk:addAmmo', function(weapon, ammo)
	AddAmmoToPed(GetPlayerPed(-1), weapon , ammo)
end)

AddEventHandler('esx_vehicletrunk:onQuit', function()
	if not trunkIsOpen then
		return
	end
	trunkIsOpen = false
	ESX.UI.Menu.CloseAll()
	TriggerServerEvent('esx_vehicletrunk:release', currentPlate, json.encode(currentContent), currentExists)
	ESX.ShowNotification('Fermeture du coffre')
	TriggerEvent('esx_vehicletrunk:onTrunkClose')
end)


function AddItem(name, count, limit, label)
	local currentTotal = 0
	for k,v in pairs(currentContent) do
		print(k)
		currentTotal = currentTotal + v.count
	end

	local found = false
	for i = 1, #currentContent, 1 do
		if currentContent[i].name == name then
			if  currentTotal + count > limit then
				ESX.ShowNotification('~r~ Impossible de déposer plus dans le coffre~s~.')
				return
			else
				TriggerServerEvent('esx_vehicletrunk:removeItem', name, count)
				currentContent[i].count = currentContent[i].count + count
				found = true
			end
			break
		end
	end
	if not found then
		table.insert(currentContent, {name = name, label = label, type = 'item', count = count, limit = limit})
		TriggerServerEvent('esx_vehicletrunk:removeItem', name, count)
	end
end

function OpenInventoryDialog(item, itemCount, itemLabel, OGitemLimit, take)
	local item = item
	local itemCount = itemCount
	local itemLabel = itemLabel
	local take = take

	local itemLimit = getVehicleMaxCarry(GetVehicleClass(currentVehicle))
	ESX.UI.Menu.Open(
		'dialog', GetCurrentResourceName(), 'vehicle_count',
		{
			title = "Montant à déposer"
		},
		function(data, menu)
			local count = tonumber(data.value)
			if count ~= nil then count = math.floor(count) end
			if count == nil or count < 1 or (take and count > itemCount) or (not take and count > itemLimit) or (not take and count > itemCount) then
				ESX.ShowNotification("~r~Impossible de déposer plus de~w~ ".. itemLimit .. "~r~.")
			elseif take then
				TakeItem(item, count)
			else
				AddItem(item, count, itemLimit, itemLabel)
			end
			menu.close()
			OpenTrunkMenu()
		end,
		function(data, menu)
			menu.close()
			OpenTrunkMenu()
		end
	)
end

function AddItemsMenu()
	if #currentContent >= 15 then
		ESX.ShowNotification('~w~que veux tu  ~y~déposer ~r~dans~w~ le coffre~r~!')
		OpenTrunkMenu()
		return
	end
	ESX.TriggerServerCallback('esx_policejob:getPlayerInventory', function(inventory)
		local options = {}
		for i = 1, #inventory.items, 1 do
		  local item = inventory.items[i]
		  if item.count > 0 then
			table.insert(options, {label = item.label .. ' x' .. item.count, rlabel = item.label, count = item.count, value = item.name, limit = item.limit})
		  end
		end
		ESX.UI.Menu.Open(
		  'default', GetCurrentResourceName(), 'inventory_menu',
		  {
			title    = "coffre - objets",
			align    = "bottom-right",
			elements = options,
		  },
		  function(data, menu)
			menu.close()
			local itemName = data.current.value
			local itemCount = data.current.count
			local itemLabel = data.current.rlabel
			local itemLimit = data.current.limit

			OpenInventoryDialog(itemName, itemCount, itemLabel, itemLimit, false)
		  end,
		  function(data, menu)
			menu.close()
			OpenTrunkMenu()
		  end
		)
	end)
end

function AddCashMenu()
	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open(
	'dialog', GetCurrentResourceName(), 'failed_at_coding_dialog3',
	{
		title = "combien depose/reprendre"	
	},function(data, menu)
		local cash = tonumber(data.value)
		if cash == nil then
			ESX.ShowNotification("allez ~r~tagada~w~.")
		else
			menu.close()
			ESX.TriggerServerCallback('esx_vehicletrunk:addCash', function(sum)
				local sum = sum
				if sum ~= -1 then
					local found = false
					for i = 1, #currentContent, 1 do
						if currentContent[i].type == 'cash' then
							currentContent[i].count = currentContent[i].count + sum
							found = true
							break
						end
					end
					if not found then table.insert(currentContent, {count = sum, type = 'cash'}) end
				else
					ESX.ShowNotification('booo ~r~ses null ~w~chausettes.')
				end
				OpenTrunkMenu()
			end, math.floor(cash))
		end
end, function(data, menu) menu.close() OpenTrunkMenu() end)
end

function AddDirtyMenu()
	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open(
	'dialog', GetCurrentResourceName(), 'failed_at_coding_dialog3',
	{
		title = "combien depose/reprendre"	
	},function(data, menu)
		local cash = tonumber(data.value)
		if cash == nil then
			ESX.ShowNotification("abuse ~r~pas~w~.")
		else
			menu.close()
			ESX.TriggerServerCallback('esx_vehicletrunk:addDirty', function(sum)
				if sum ~= -1 then
					local found = false
					for i = 1, #currentContent, 1 do
						if currentContent[i].type == 'dirty' then
							currentContent[i].count = currentContent[i].count + sum
							found = true
							break
						end
					end
					if not found then table.insert(currentContent, {count = sum, type = 'dirty'}) end
				else
					ESX.ShowNotification('combien depose/reprendre')
				end
				OpenTrunkMenu()
			end, math.floor(cash))
		end
	end, function(data, menu) menu.close() OpenTrunkMenu() end)
end

function OpenDirtyDialog()
	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open(
	'dialog', GetCurrentResourceName(), 'failed_at_coding_dialog4',
	{
		title = "combien depose/reprendre"	
	},function(data, menu)
		local cash = tonumber(data.value)
		if cash ~= nil and cash >= 1 then
			cash = math.floor(cash)
			for i = 1, #currentContent, 1 do
				if currentContent[i].type == 'dirty' then
					if currentContent[i].count > cash then
						TriggerServerEvent('esx_vehicletrunk:giveDirty', cash)
						currentContent[i].count = currentContent[i].count - cash
					elseif currentContent[i].count == cash then
						TriggerServerEvent('esx_vehicletrunk:giveDirty', cash)
						table.remove(currentContent, i)
					elseif currentContent[i].count < cash then
						ESX.ShowNotification('Vous essayez de lever ~r~trop~w~..')
					end 
					break
				end
			end
			OpenTrunkMenu()
		else
			ESX.ShowNotification('~r~développement~w~somme..')
		end	
	end, function(data, menu) menu.close() OpenTrunkMenu() end)
end

function OpenCashDialog()
	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open(
	'dialog', GetCurrentResourceName(), 'failed_at_coding_dialog5',
	{
		title = "combien depose/reprendre"	
	},function(data, menu)
		local cash = tonumber(data.value)
		if cash ~= nil and cash >= 1 then
			cash = math.floor(cash)
			for i = 1, #currentContent, 1 do
				if currentContent[i].type == 'cash' then
					if currentContent[i].count > cash then
						TriggerServerEvent('esx_vehicletrunk:giveCash', cash)
						currentContent[i].count = currentContent[i].count - cash
					elseif currentContent[i].count == cash then
						TriggerServerEvent('esx_vehicletrunk:giveCash', cash)
						table.remove(currentContent, i)
					elseif currentContent[i].count < cash then
						ESX.ShowNotification('Vous essayez de lever ~r~trop~w~..')
					end 
					break
				end
			end
			OpenTrunkMenu()
		else
			ESX.ShowNotification('~r~développement~w~somme..')
		end	
	end, function(data, menu) menu.close() OpenTrunkMenu() end)
end

function TakeWeapon(name, ammo)
	local found = false
	for i = 1, #currentContent, 1 do
		if currentContent[i].name == name and currentContent[i].count == ammo then
			table.remove(currentContent, i)
			found = true
			break
		end
	end
	if not found then
		ESX.ShowNotification('~r~Il y avait une affirmation~w~.')
	else
		TriggerServerEvent('esx_vehicletrunk:giveWeapon', name, ammo)
	end
end

function TakeItem(name, count)
	ESX.TriggerServerCallback('esx_policejob:getPlayerInventory', function(inventory)
		local options = {}
		for i = 1, #inventory.items, 1 do
		  local item = inventory.items[i]
		  if item.count > 0 then
			table.insert(options, {label = item.label .. ' x' .. item.count, rlabel = item.label, count = item.count, value = item.name, limit = item.limit})
		  end
		end

		local found = false
		for i = 1, #currentContent, 1 do
			if currentContent[i].name == name then
				if currentContent[i].count - count < 0 then
					ESX.ShowNotification('~r~Vous ne pouvez pas prendre ~s~'.. count ..' ' .. name ..' ~r~il n\'y en a que ~s~' .. currentContent[i].count .. '~r~.')
					found = false
				elseif count > currentContent[i].limit then
					ESX.ShowNotification('~r~Vous ne pouvez pas prendre ~s~'.. count ..' ' .. name ..' ~r~la limite est de ~s~' .. currentContent[i].limt .. '~r~.')
					found = false
				else
					local itemInInventory = false
					local itemIsIn = nil
					for k,v in pairs(options) do
						if v.value == name then
							itemInInventory = true
							itemIsIn = v
						end
					end

					if itemInInventory then
						if itemIsIn.count + count >  currentContent[i].limit then
							ESX.ShowNotification('~r~Vous ne pouvez pas prendre ~s~'.. count ..' ' ..itemIsIn.rlabel ..' ~r~la limite est de ~s~' .. itemIsIn.limit .. '~r~ vous en avez ~s~'.. itemIsIn.count ..'~r~.')
							found = false
						else
							currentContent[i].count = currentContent[i].count - count
							if currentContent[i].count <= 0 then
								table.remove(currentContent,i)
							end
							ESX.ShowNotification('~g~Vous avez pris ~s~'.. count ..' ' .. itemIsIn.rlabel ..' ~g~ sur vous.')
							found = true
						end
					else
						currentContent[i].count = currentContent[i].count - count
						if currentContent[i].count <= 0 then
							table.remove(currentContent,i)
						end
						ESX.ShowNotification('~g~Vous avez pris ~s~'.. count ..' ' .. name ..' ~g~sur vous.')
						found = true
					end
				end
			end
		end
		if found then
			TriggerServerEvent('esx_vehicletrunk:giveItem', name, count)
			OpenTrunkMenu()
		end
	end)
end

function AddWeapon(name, ammo)
	local found = false
	TriggerServerEvent('esx_vehicletrunk:removeWeapon', name)
	table.insert(currentContent, {name = name, type = 'weapon', count = ammo})
end

function AddWeaponsMenu()
  local elements   = {}
  local playerPed  = GetPlayerPed(-1)
  local weaponList = ESX.GetWeaponList()

  for i=1, #weaponList, 1 do

    local weaponHash = GetHashKey(weaponList[i].name)

    if HasPedGotWeapon(playerPed,  weaponHash,  false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
		local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
		table.insert(elements, {label = weaponList[i].label .. '[' .. ammo .. ']', value = weaponList[i].name, ammo = ammo})
    end
  end

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'add_weapon',
    {
      title    = "deposer/reprendre arme",
      align    = 'bottom-right',
      elements = elements,
    },
    function(data, menu)
	  local data = data
      menu.close()
	  if #currentContent >= getVehicleMaxCarry(GetVehicleClass(currentVehicle)) then
		ESX.ShowNotification('~y~Le volume du  ~w~coffre~r~ne ~w~sufit pas.')
		Wait(500)
		OpenTrunkMenu()
	  else
		ESX.UI.Menu.Open(
		'dialog', GetCurrentResourceName(), 'failed_at_coding_dialog',
		{
			title = "Êtes-vous sûr de vouloir prendre une arme à feu" .. data.current.label .. "?"
			
		},function(data2, menu2)
			menu2.close()
			if data2.value ~= nil and string.lower(data2.value) == 'en' then
				ESX.ShowNotification(Config.LinersAdd[math.random(1,#Config.LinersAdd)])
			else
				AddWeapon(data.current.value, data.current.ammo) 
				OpenTrunkMenu()
			end
		end, function(data2, menu2) menu2.close() OpenTrunkMenu() end)
	  end
    end,
    function(data, menu)
      menu.close()
	  OpenTrunkMenu()
    end
  )

end

function InitTrunkMenu()
	ESX.UI.Menu.CloseAll()
	currentPlate = ESX.Game.GetVehicleProperties(currentVehicle).plate
	ESX.TriggerServerCallback('esx_vehicletrunk:openTrunk', function(trunk)
		if not trunk.error then
			TriggerEvent('esx_vehicletrunk:onTrunkOpen')
			currentExists = trunk.exists
			currentContent = {}
			if currentExists then
				currentContent = json.decode(trunk.content)
			end
			trunkIsOpen = true
			OpenTrunkMenu()
		else
			ESX.ShowNotification('Quelqu\'un regarde déjà le coffre.')
		end
	end, currentPlate)
end

function OpenTrunkMenu()
		ESX.UI.Menu.CloseAll()
		local elements = {}
		for i = 1, #currentContent, 1 do
			if currentContent[i].type == 'weapon' then
				table.insert(elements, {
					label = ESX.GetWeaponLabel(currentContent[i].name) .. ' [' .. currentContent[i].count .. ']',
					name = currentContent[i].name,
					count = currentContent[i].count,
					type = currentContent[i].type,
				})
			elseif currentContent[i].type == 'cash' then
				table.insert(elements, {
					label = Config.Cash .. ' - ' .. currentContent[i].count .. ' €',
					count = currentContent[i].count,
					type = currentContent[i].type,
				})
			elseif currentContent[i].type == 'dirty' then
				table.insert(elements, {
					label = Config.DirtyMoney .. ' - ' .. currentContent[i].count .. ' €',
					count = currentContent[i].count,
					type = currentContent[i].type,
				})
			elseif currentContent[i].type == 'item' then
				table.insert(elements, {
					label = currentContent[i].label .. ' x' .. currentContent[i].count,
					name = currentContent[i].name,
					count = currentContent[i].count,
					type = currentContent[i].type,
				})
			end
		end
		
		table.insert(elements, {label = '[ déposer objet ]', value = 'add_item'})
		table.insert(elements, {label = '[ déposer armes ]', value = 'add_weapon'})
		table.insert(elements, {label = '[ déposer argent ]', value = 'add_cash'})
		table.insert(elements, {label = '[ déposer argent sales ]', value = 'add_dirty'})
		
		local vehicleCarry = getVehicleMaxCarry(GetVehicleClass(currentVehicle))
		ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'trunk_menu',
		{
		    title    = 'coffre - ' .. currentPlate .. ' - limite ' .. vehicleCarry,
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			menu.close()
			local data = data
			if data.current.value == nil and data.current.type == 'cash' then
				OpenCashDialog()
			elseif data.current.value == nil and data.current.type == 'dirty' then
				OpenDirtyDialog()
			elseif data.current.value == nil and data.current.type == 'weapon' then
				ESX.UI.Menu.Open(
				'dialog', GetCurrentResourceName(), 'failed_at_coding_dialog',
				{
					title = "Êtes-vous sûr de vouloir prendre une arme à feu" .. data.current.label .. "?"
					
				},function(data2, menu2)
					menu2.close()
					if data2.value ~= nil and string.lower(data2.value) == 'en' then
						ESX.ShowNotification(Config.LinersTake[math.random(1,#Config.LinersTake)])
					end
					TakeWeapon(data.current.name, data.current.count)
					OpenTrunkMenu()
				end, function(data2, menu2) menu2.close() OpenTrunkMenu() end)
			elseif data.current.value == nil and data.current.type == 'item' then
				OpenInventoryDialog(data.current.name, data.current.count, data.current.label, Config.MaxCount, true)
			elseif data.current.value == 'add_item' then
				AddItemsMenu()
			elseif data.current.value == 'add_weapon' then
				AddWeaponsMenu()
			elseif data.current.value == 'add_cash' then
				AddCashMenu()
			elseif data.current.value == 'add_dirty' then
				AddDirtyMenu()
			end
		end,
		function(data, menu)
			  menu.close()
			  TriggerEvent('esx_vehicletrunk:onQuit')
		end
		)
end

function IsDoorLocked()
	return GetVehicleDoorLockStatus(currentVehicle) == 2
end

function GetVehicle()
	local playerPos = GetEntityCoords(GetPlayerPed(-1), false)
	currentVehicle = GetClosestVehicle(playerPos.x, playerPos.y, playerPos.z, Config.Radius,  0,  71)
	return currentVehicle ~= nil and DoesEntityExist(currentVehicle)
end

Citizen.CreateThread(function ()
	Citizen.Wait(1000)
	while true do
		Citizen.Wait(5)
		if IsControlJustReleased(0, 38) and not trunkIsOpen and not IsPedInAnyVehicle(GetPlayerPed(-1)) and GetVehicle() and IsDistanceOk() and not IsDoorLocked() then
			if currentVehicle ~= nil then
				local vehicleType = GetVehicleClass(currentVehicle)
				if vehicleType ~= 13 then
					InitTrunkMenu()
				else
					ESX.ShowNotification("~r~Ce véhicule n'as pas de coffre~s~.")
				end
			end
			Citizen.Wait(900)
		end
	end
end)

