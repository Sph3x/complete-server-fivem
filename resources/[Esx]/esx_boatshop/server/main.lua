ESX              = nil
local Categories = {}
local Vehicles   = {}
local hasSqlRun  = false

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_phone:registerNumber', 'boatdealer', _U('dealer_customers'), false, false)
TriggerEvent('esx_society:registerSociety', 'boatdealer', _U('boat_dealer'), 'society_boatdealer', 'society_boatdealer', 'society_boatdealer', {type = 'private'})

function RemoveOwnedVehicle (plate)
	MySQL.Async.execute('DELETE FROM owned_boats WHERE plate = @plate',
	{
		['@plate'] = plate
	})
end

AddEventHandler('onMySQLReady', function()
	LoadVehicles()
end)

function LoadVehicles()
	hasSqlRun = true

	Categories     = MySQL.Sync.fetchAll('SELECT * FROM boat_categories')
	local vehicles = MySQL.Sync.fetchAll('SELECT * FROM boats')

	for i=1, #vehicles, 1 do
		local vehicle = vehicles[i]

		for j=1, #Categories, 1 do
			if Categories[j].name == vehicle.category then
				vehicle.categoryLabel = Categories[j].label
				break
			end
		end

		table.insert(Vehicles, vehicle)
	end

	-- send information after db has loaded, making sure everyone gets vehicle information
	TriggerClientEvent('esx_boatshop:sendCategories', -1, Categories)
	TriggerClientEvent('esx_boatshop:sendVehicles', -1, Vehicles)
end

-- extremely useful when restarting script mid-game
Citizen.CreateThread(function()
	Citizen.Wait(10000) -- hopefully enough for connection to the SQL server

	if not hasSqlRun then
		LoadVehicles()
	end
end)

RegisterServerEvent('esx_boatshop:setVehicleOwned')
AddEventHandler('esx_boatshop:setVehicleOwned', function (vehicleProps)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	MySQL.Async.execute('INSERT INTO owned_boats (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)',
	{
		['@owner']   = xPlayer.identifier,
		['@plate']   = vehicleProps.plate,
		['@vehicle'] = json.encode(vehicleProps)
	},
	function (rowsChanged)
		TriggerClientEvent('esx:showNotification', _source, _U('vehicle_belongs', vehicleProps.plate))
	end)
end)

RegisterServerEvent('esx_boatshop:setVehicleOwnedPlayerId')
AddEventHandler('esx_boatshop:setVehicleOwnedPlayerId', function (playerId, vehicleProps)
	local xPlayer = ESX.GetPlayerFromId(playerId)

	MySQL.Async.execute('INSERT INTO owned_boats (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)',
	{
		['@owner']   = xPlayer.identifier,
		['@plate']   = vehicleProps.plate,
		['@vehicle'] = json.encode(vehicleProps)
	},
	function (rowsChanged)
		TriggerClientEvent('esx:showNotification', playerId, _U('vehicle_belongs', vehicleProps.plate))
	end) 
end)

RegisterServerEvent('esx_boatshop:setVehicleOwnedSociety')
AddEventHandler('esx_boatshop:setVehicleOwnedSociety', function (society, vehicleProps)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	MySQL.Async.execute('INSERT INTO owned_boats (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)',
	{
		['@owner']   = 'society:' .. society,
		['@plate']   = vehicleProps.plate,
		['@vehicle'] = json.encode(vehicleProps),
	},
	function (rowsChanged)

	end)
end)

RegisterServerEvent('esx_boatshop:sellVehicle')
AddEventHandler('esx_boatshop:sellVehicle', function (vehicle)
	MySQL.Async.fetchAll('SELECT * FROM boatdealer_boats WHERE vehicle = @vehicle LIMIT 1', {
		['@vehicle'] = vehicle
	}, function (result)
		local id = result[1].id

		MySQL.Async.execute('DELETE FROM boatdealer_boats WHERE id = @id', {
			['@id'] = id
		})
	end)
end)

RegisterServerEvent('esx_boatshop:rentVehicle')
AddEventHandler('esx_boatshop:rentVehicle', function (vehicle, plate, playerName, basePrice, rentPrice, target)
	local xPlayer = ESX.GetPlayerFromId(target)

	MySQL.Async.fetchAll('SELECT * FROM boatdealer_boats WHERE vehicle = @vehicle LIMIT 1', {
		['@vehicle'] = vehicle
	}, function (result)
		local id    = result[1].id
		local price = result[1].price
		local owner = xPlayer.identifier

		MySQL.Async.execute('DELETE FROM boatdealer_boats WHERE id = @id', {
			['@id'] = id
		})

		MySQL.Async.execute('INSERT INTO rented_boats (vehicle, plate, player_name, base_price, rent_price, owner) VALUES (@vehicle, @plate, @player_name, @base_price, @rent_price, @owner)',
		{
			['@vehicle']     = vehicle,
			['@plate']       = plate,
			['@player_name'] = playerName,
			['@base_price']  = basePrice,
			['@rent_price']  = rentPrice,
			['@owner']       = owner,
		})
	end)
end)

-- unused?
RegisterServerEvent('esx_boatshop:setVehicleForAllPlayers')
AddEventHandler('esx_boatshop:setVehicleForAllPlayers', function (props, x, y, z, radius)
	TriggerClientEvent('esx_boatshop:setVehicle', -1, props, x, y, z, radius)
end)

RegisterServerEvent('esx_boatshop:getStockItem')
AddEventHandler('esx_boatshop:getStockItem', function (itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_boatdealer', function (inventory)
		local item = inventory.getItem(itemName)

		-- is there enough in the society?
		if count > 0 and item.count >= count then
		
			-- can the player carry the said amount of x item?
			if sourceItem.limit ~= -1 and (sourceItem.count + count) > sourceItem.limit then
				TriggerClientEvent('esx:showNotification', _source, _U('player_cannot_hold'))
			else
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				TriggerClientEvent('esx:showNotification', _source, _U('have_withdrawn', count, item.label))
			end
		else
			TriggerClientEvent('esx:showNotification', _source, _U('not_enough_in_society'))
		end
	end)
end)

RegisterServerEvent('esx_boatshop:putStockItems')
AddEventHandler('esx_boatshop:putStockItems', function (itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_boatdealer', function (inventory)
		local item = inventory.getItem(itemName)

		if item.count >= 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent('esx:showNotification', _source, _U('have_deposited', count, item.label))
		else
			TriggerClientEvent('esx:showNotification', _source, _U('invalid_amount'))
		end
	end)
end)

ESX.RegisterServerCallback('esx_boatshop:getCategories', function (source, cb)
	cb(Categories)
end)

ESX.RegisterServerCallback('esx_boatshop:getVehicles', function (source, cb)
	cb(Vehicles)
end)

ESX.RegisterServerCallback('esx_boatshop:buyVehicle', function (source, cb, vehicleModel)
	local xPlayer     = ESX.GetPlayerFromId(source)
	local vehicleData = nil

	for i=1, #Vehicles, 1 do
		if Vehicles[i].model == vehicleModel then
			vehicleData = Vehicles[i]
			break
		end
	end

	if xPlayer.getMoney() >= vehicleData.price then
		xPlayer.removeMoney(vehicleData.price)
		cb(true)
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback('esx_boatshop:buyVehicleSociety', function (source, cb, society, vehicleModel)
	local vehicleData = nil

	for i=1, #Vehicles, 1 do
		if Vehicles[i].model == vehicleModel then
			vehicleData = Vehicles[i]
			break
		end
	end

	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_' .. society, function (account)
		if account.money >= vehicleData.price then

			account.removeMoney(vehicleData.price)
			MySQL.Async.execute('INSERT INTO boatdealer_boats (vehicle, price) VALUES (@vehicle, @price)',
			{
				['@vehicle'] = vehicleData.model,
				['@price']   = vehicleData.price,
			})

			cb(true)
		else
			cb(false)
		end
	end)
end)

ESX.RegisterServerCallback('esx_boatshop:getPersonnalVehicles', function (source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM owned_boats WHERE owner = @owner', {
		['@owner'] = xPlayer.identifier
	}, function (result)
		local vehicles = {}

		for i=1, #result, 1 do
			local vehicleData = json.decode(result[i].vehicle)
			table.insert(vehicles, vehicleData)
		end

		cb(vehicles)
	end)
end)

ESX.RegisterServerCallback('esx_boatshop:getCommercialVehicles', function (source, cb)
	MySQL.Async.fetchAll('SELECT * FROM boatdealer_boats ORDER BY vehicle ASC', {}, function (result)
		local vehicles = {}

		for i=1, #result, 1 do
			table.insert(vehicles, {
				name  = result[i].vehicle,
				price = result[i].price
			})
		end

		cb(vehicles)
	end)
end)


RegisterServerEvent('esx_boatshop:returnProvider')
AddEventHandler('esx_boatshop:returnProvider', function(vehicleModel)
	local _source = source

	MySQL.Async.fetchAll('SELECT * FROM boatdealer_boats WHERE vehicle = @vehicle LIMIT 1', {
		['@vehicle'] = vehicleModel
	}, function (result)

		if result[1] then
			local id    = result[1].id
			local price = ESX.Round(result[1].price * 0.75)

			TriggerEvent('esx_addonaccount:getSharedAccount', 'society_boatdealer', function(account)
				account.addMoney(price)
			end)

			MySQL.Async.execute('DELETE FROM boatdealer_boats WHERE id = @id', {
				['@id'] = id
			})

			TriggerClientEvent('esx:showNotification', _source, _U('vehicle_sold_for', vehicleModel, price))
		else
			print('esx_boatshop: ' .. GetPlayerIdentifiers(_source)[1] .. ' attempted selling an invalid vehicle!')
		end

	end)
end)

ESX.RegisterServerCallback('esx_boatshop:getRentedVehicles', function (source, cb)
	MySQL.Async.fetchAll('SELECT * FROM rented_boats ORDER BY player_name ASC', {}, function (result)
		local vehicles = {}

		for i=1, #result, 1 do
			table.insert(vehicles, {
				name       = result[i].vehicle,
				plate      = result[i].plate,
				playerName = result[i].player_name
			})
		end

		cb(vehicles)
	end)
end)

ESX.RegisterServerCallback('esx_boatshop:giveBackVehicle', function (source, cb, plate)
	MySQL.Async.fetchAll('SELECT * FROM rented_boats WHERE plate = @plate', {
		['@plate'] = plate
	}, function (result)
		if result[1] ~= nil then
			local vehicle   = result[1].vehicle
			local basePrice = result[1].base_price

			MySQL.Async.execute('INSERT INTO boatdealer_boats (vehicle, price) VALUES (@vehicle, @price)',
			{
				['@vehicle'] = vehicle,
				['@price']   = basePrice
			})

			MySQL.Async.execute('DELETE FROM rented_boats WHERE plate = @plate',{
				['@plate'] = plate
			})

			RemoveOwnedVehicle(plate)
			cb(true)
		else
			cb(false)
		end
	end)
end)

ESX.RegisterServerCallback('esx_boatshop:resellVehicle', function (source, cb, plate, price)
	MySQL.Async.fetchAll('SELECT * FROM rented_boats WHERE plate = @plate', {
		['@plate'] = plate
	}, function (result)
		if result[1] ~= nil then -- is it a rented vehicle?
			cb(false) -- it is, don't let the player sell it since he doesn't own it
		else
			local xPlayer = ESX.GetPlayerFromId(source)

			MySQL.Async.fetchAll('SELECT * FROM owned_boats WHERE owner = @owner AND @plate = plate',
			{
				['@owner'] = xPlayer.identifier,
				['@plate'] = plate
			}, function (result)

				-- does the owner match?
				if result[1] ~= nil then
					xPlayer.addMoney(price)
					RemoveOwnedVehicle(plate)
					cb(true)
				else
					if xPlayer.job.grade_name == 'boss' then
						MySQL.Async.fetchAll('SELECT * FROM owned_boats WHERE owner = @owner AND @plate = plate',
						{
							['@owner'] = 'society:' .. xPlayer.job.name,
							['@plate'] = plate
						}, function (result)
							if result[1] ~= nil then
								xPlayer.addMoney(price)
								RemoveOwnedVehicle(plate)
								cb(true)
							else
								cb(false)
							end
						end)
					else
						cb(false)
					end
				end
			end)
		end
	end)
end)


ESX.RegisterServerCallback('esx_boatshop:getStockItems', function (source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_boatdealer', function(inventory)
		cb(inventory.items)
	end)
end)

ESX.RegisterServerCallback('esx_boatshop:getPlayerInventory', function (source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory

	cb({ items = items })
end)

ESX.RegisterServerCallback('esx_boatshop:isPlateTaken', function (source, cb, plate)
	MySQL.Async.fetchAll('SELECT * FROM owned_boats WHERE @plate = plate', {
		['@plate'] = plate
	}, function (result)
		cb(result[1] ~= nil)
	end)
end)

if Config.EnablePbCommand then
	TriggerEvent('es:addGroupCommand', 'pb', 'user', function(source, args, user)
		TriggerClientEvent('esx_boatshop:openPersonnalVehicleMenu', source)
	end, {help = _U('leaving')})
end

function PayRent(d, h, m)
	MySQL.Async.fetchAll('SELECT * FROM rented_boats', {}, function (result)
		for i=1, #result, 1 do
			local xPlayer = ESX.GetPlayerFromIdentifier(result[i].owner)

			-- message player if connected
			if xPlayer ~= nil then
				xPlayer.removeAccountMoney('bank', result[i].rent_price)
				TriggerClientEvent('esx:showNotification', xPlayer.source, _U('paid_rental', result[i].rent_price))
			else -- pay rent either way
				MySQL.Sync.execute('UPDATE users SET bank = bank - @bank WHERE identifier = @identifier',
				{
					['@bank']       = result[i].rent_price,
					['@identifier'] = result[i].owner
				})
			end

			TriggerEvent('esx_addonaccount:getSharedAccount', 'society_boatdealer', function(account)
				account.addMoney(result[i].rent_price)
			end)
		end
	end)
end

TriggerEvent('cron:runAt', 22, 00, PayRent)
