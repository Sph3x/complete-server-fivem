--[[

	This script has nothing to do with ESX-org's vehicle inventory.

]]--
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

trace = true
function dbg(msg)
	if trace then
		Citizen.Trace("\n[esx_vehicletrunk]: " .. tostring(msg) .. " \n")
	end 
end

TrunksInUse = {}

--AddEventHandler('onMySQLReady', function()
--	MySQL.Async.execute('DELETE FROM vehicle_trunks WHERE junk = 1')
--	
--	dbg("Junk trunks deleted")
--end)

--AddEventHandler('esx:playerDropped', function(source)
--  dbg("Player dropped")
--  local xPlayer = ESX.GetPlayerFromId(source)
--  for i, j in pairs(TrunksInUse) do
--	dbg("looping open trunk ".. i .. " > ".. j)
--	if j == xPlayer.identifier then
--		dbg("Trunk " .. i .." released")
--		if Config.EnableDupeProtection then
--			MySQL.Async.execute('DELETE FROM vehicle_trunks WHERE plate = @plate', { ['@plate'] = i }, function(r) TrunksInUse[i] = nil dbg("Trunk content deleted") end)
--		else
--			TrunksInUse[i] = nil
--		end
--		break
--	end
--  end
--end)

IsVehicleJunk = function(plate)
	local result = MySQL.Sync.fetchScalar('SELECT * FROM owned_vehicles WHERE plate = @plate', {['@plate'] = plate})
	if result then
		dbg("Vehicle not junk, plate " .. plate)
		return 0
	else
		dbg("Vehicle is junk, plate " .. plate)
		return 1
	end
end

AddEventHandler('esx_vehicletrunk:checkForGlitchedTrunks', function(id)
	for i, j in pairs(TrunksInUse) do
		if j == id then
			TrunksInUse[i] = nil
			dbg("Glitched trunk found")
			break
		end
	end
end)

ESX.RegisterServerCallback('esx_vehicletrunk:addCash', function(source, cb, sum)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.get('money') >= sum then
		xPlayer.removeMoney(sum)
		cb(sum)
		return
	end
	cb(-1)
end)

ESX.RegisterServerCallback('esx_vehicletrunk:addDirty', function(source, cb, sum)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getAccount('black_money').money >= sum then
		xPlayer.removeAccountMoney('black_money', sum)
		cb(sum)
		return
	end
	cb(-1)
end)

RegisterServerEvent('esx_vehicletrunk:giveCash')
AddEventHandler('esx_vehicletrunk:giveCash', function(sum)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addMoney(sum)
end)

RegisterServerEvent('esx_vehicletrunk:giveDirty')
AddEventHandler('esx_vehicletrunk:giveDirty', function(sum)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addAccountMoney('black_money', sum)
end)

RegisterServerEvent('esx_vehicletrunk:release')
AddEventHandler('esx_vehicletrunk:release', function(plate, content, exists)
	local plate = plate
	local junk = IsVehicleJunk(plate)
	local query
	if exists then query = 'UPDATE vehicle_trunks SET content = @content, junk = @junk WHERE plate = @plate'
	else query = 'INSERT INTO vehicle_trunks (`plate`, `content`, `junk`) VALUES (@plate, @content, @junk)' end
	
	MySQL.Async.execute(query, {['@plate'] = plate, ['@content'] = content, ['@junk'] = junk}, function(rows) TrunksInUse[plate] = nil end)
	dbg("Trunk released")
end)

RegisterServerEvent('esx_vehicletrunk:giveWeapon')
AddEventHandler('esx_vehicletrunk:giveWeapon', function(weapon, ammo)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addWeapon(weapon, 0)
	TriggerClientEvent('esx_vehicletrunk:addAmmo', weapon, ammo)
end)

RegisterServerEvent('esx_vehicletrunk:removeWeapon')
AddEventHandler('esx_vehicletrunk:removeWeapon', function(weapon)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeWeapon(weapon)
end)

RegisterServerEvent('esx_vehicletrunk:removeItem')
AddEventHandler('esx_vehicletrunk:removeItem', function(item, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem(item, count)
end)

RegisterServerEvent('esx_vehicletrunk:giveItem')
AddEventHandler('esx_vehicletrunk:giveItem', function(item, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addInventoryItem(item, count)
end)


ESX.RegisterServerCallback('esx_vehicletrunk:openTrunk', function(source, cb, plate)
	dbg("Trunk opening for " .. plate)
	if TrunksInUse[plate] ~= nil then
		cb({error = true})
		if Config.CheckForGlitchedTrunks then
			TriggerEvent('esx_vehicletrunk:checkForGlitchedTrunks', ESX.GetPlayerFromId(source).identifier)
		end
		return
	end
	local xPlayer = ESX.GetPlayerFromId(source)
	local plate = plate
	TrunksInUse[plate] = xPlayer.identifier
	MySQL.Async.fetchAll(
	'SELECT * FROM vehicle_trunks WHERE plate = @plate',
	{
		['@plate'] = plate
	},function(result)
		if #result >= 1 then
			cb({content = result[1].content, exists = true})
		else
			cb({content = {}, exists = false})
		end
	end)
end)

RegisterServerEvent('esx_vehicletrunk:convertDB', function(src, pw)
	if pw ~= "huutoripale" then
		TriggerClientEvent('esx:showNotification', src, '~r~Väärä salasana')
		return
	end
	local result = MySQL.Sync.fetchAll('SELECT * FROM owned_vehicles WHERE 1')
	local query = 'UPDATE owned_vehicles SET plate = @plate WHERE id = @id'
	for i = 1, #result, 1 do
		local plate = json.decode(result[i].vehicle).plate
		local id = result[i].id
		MySQL.Async.execute(query, {['@plate'] = plate, ['@id'] = id})
	end
end)

TriggerEvent('es:addGroupCommand', 'coffre-hack', "superadmin", function(source, args, user)
	TriggerEvent('esx_vehicletrunk:convertDB', source, args[1])
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Ei oikeuksia! Homo")
end, {help = "Älä käytä ellet todellakin tiedä mitä olet tekemässä.", params = {{name = "hashpassu", help = "salasana"}}})
