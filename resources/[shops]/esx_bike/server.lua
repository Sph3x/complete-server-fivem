ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("esx:lowmoney")
AddEventHandler("esx:lowmoney", function(money)
    local _source = source	
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.removeMoney(money)
end)

TriggerEvent('es:addAdminCommand', 'savexyz', 10, function(source, args, user)
	TriggerClientEvent("xyz:clientsaver", source)
end, function(source, args, user)
     TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "You dont have permission!")
end, {})

-- credits BadKai_PandaMay / DUFX 
RegisterServerEvent("xyz:saver");
AddEventHandler("xyz:saver", function(PlayerName, x, y, z)
	file = io.open('resources\\esx_bike-rental\\xyz\\'..PlayerName..".txt", "a")
	if file then
		file:write("{['x'] = " .. x .. ", ['y'] = " .. y .. ", ['z'] =  " .. z .. "}, \n")
	else
		print('Error[xyz]');
	end
	file:close()
end)

Citizen.CreateThread(function()
	Citizen.Wait(5000)
	local ver = "4.2"
	print("ESX Bike Rental started v"..ver)
end)
