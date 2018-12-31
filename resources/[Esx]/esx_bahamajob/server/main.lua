ESX                    = nil
local PlayersCrafting  = {}
local PlayersCrafting2 = {}
local PlayersCrafting3 = {}
local PlayersCrafting4 = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_society:registerSociety', 'bahama', 'Bahama mas', 'society_bahama', 'society_bahama', 'society_bahama', {type = 'private'})

------------------------------------------------------------------------------------------------------------
-----------------------------------------------Alcool de myrte----------------------------------------------
------------------------------------------------------------------------------------------------------------

local function Craft(source)

	SetTimeout(4000, function()

		if PlayersCrafting[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local alcool = xPlayer.getInventoryItem('alcool').count
			local myrte = xPlayer.getInventoryItem('myrte').count
			local myrtealcool = xPlayer.getInventoryItem('myrtealcool').count

			if alcool <= 0 then
				TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez ~r~pas assez~s~ d\'alcool')		
			end
			if myrte <= 0 then
				TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez ~r~pas assez~s~ de myrte')	
			end 
			if myrtealcool >= 1 then
				TriggerClientEvent('esx:showNotification', source, 'Vous devez servire avant de refaire un cocktail')	
			else
        		xPlayer.removeInventoryItem('alcool', 1)
				xPlayer.removeInventoryItem('myrte', 1)
        		xPlayer.addInventoryItem('myrtealcool', 1)
					
			  Craft(source)
			end
		end
	end)
end

RegisterServerEvent('esx_bahamajob:myrtealcool')
AddEventHandler('esx_bahamajob:myrtealcool', function()
	local _source = source
	PlayersCrafting[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Préparation de ~b~Alcool de Myrte~s~...')
	Craft(_source)
end)

RegisterServerEvent('esx_bahamajob:stopCraft')
AddEventHandler('esx_bahamajob:stopCraft', function()
	local _source = source
	PlayersCrafting[_source] = false
end)

------------------------------------------------------------------------------------------------------------
-----------------------------------------------Whisky CoaCola-------------------------------------------------
------------------------------------------------------------------------------------------------------------

local function Craft2(source)

	SetTimeout(4000, function()

		if PlayersCrafting2[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local alcool = xPlayer.getInventoryItem('alcool').count
			local cocacola = xPlayer.getInventoryItem('cocacola').count
			local whiskycoc = xPlayer.getInventoryItem('whiskycoc').count 

			if alcool <= 0 then
				TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez ~r~pas assez~s~ d\'alcool')		
			end
			if cocacola <= 0 then
				TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez ~r~pas assez~s~ de CocaCola')		
			end
			if whiskycoc >= 1 then 
				TriggerClientEvent('esx:showNotification', source, 'Vous devez servire avant de refaire un cocktail')		
			else
       			xPlayer.removeInventoryItem('alcool', 1)
				xPlayer.removeInventoryItem('cocacola', 1)
        		xPlayer.addInventoryItem('whiskycoc', 1)
					
				Craft2(source)
			end
		end
	end)
end

RegisterServerEvent('esx_bahamajob:whiskycoc')
AddEventHandler('esx_bahamajob:whiskycoc', function()
	local _source = source
	PlayersCrafting2[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Préparation du ~b~Whisky CocaCola~s~...')
	Craft2(_source)
end)

RegisterServerEvent('esx_bahamajob:stopCraft2')
AddEventHandler('esx_bahamajob:stopCraft2', function()
	local _source = source
	PlayersCrafting2[_source] = false
end)
------------------------------------------------------------------------------------------------------------
-----------------------------------------------Jus d'orange-------------------------------------------------
------------------------------------------------------------------------------------------------------------

local function Craft3(source)

	SetTimeout(4000, function()

		if PlayersCrafting3[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local alcool = xPlayer.getInventoryItem('alcool').count
			local redbull = xPlayer.getInventoryItem('redbull').count
			local vodkrb = xPlayer.getInventoryItem('vodkrb').count 

			if alcool <= 0 then
				TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez ~r~pas assez~s~ d\'alcool')		
			end
			if redbull <= 0 then
				TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez ~r~pas assez~s~ de redbull')		
			end
			if vodkrb >= 1 then
				TriggerClientEvent('esx:showNotification', source, 'Vous devez servire avant de refaire un cocktail')	
			else
       			xPlayer.removeInventoryItem('alcool', 1)
				xPlayer.removeInventoryItem('redbull', 1)
       			xPlayer.addInventoryItem('vodkrb', 1)
					
				Craft3(source)
			end
		end
	end)
end

RegisterServerEvent('esx_bahamajob:vodkarb')
AddEventHandler('esx_bahamajob:vodkarb', function()
	local _source = source
	PlayersCrafting3[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Préparation de la ~b~Vodka RedBull~s~...')
	Craft3(_source)
end)

RegisterServerEvent('esx_bahamajob:stopCraft3')
AddEventHandler('esx_bahamajob:stopCraft3', function()
	local _source = source
	PlayersCrafting3[_source] = false
end)

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

ESX.RegisterServerCallback('esx_bahamajob:getPlayerInventory', function(source, cb)

	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory

	cb({
		items = items
	})

end)

------------------------------------------------------------------------------------------------------------
------------------------------------------------ Utiliser --------------------------------------------------
------------------------------------------------------------------------------------------------------------


TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

ESX.RegisterUsableItem('myrtealcool', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('myrtealcool', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 350000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_bahamajob:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez utilisé 1x ~y~alcool de Myrte~s~')

end)

ESX.RegisterUsableItem('whiskycoc', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('whiskycoc', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 550000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_bahamajob:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez utilisé 1x ~y~Whisky CocaCola~s~')

end)

ESX.RegisterUsableItem('vodkrb', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('vodkrb', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 250000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_bahamajob:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez utilisé 1x ~y~Vodka RedBull~s~')

end)

ESX.RegisterUsableItem('alcool', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('alcool', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 1000000)
	TriggerClientEvent('esx_status:add', source, 'thirst', -500000)
	TriggerClientEvent('esx_bahamajob:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez utilisé 1x ~y~Vodka RedBull~s~')

end)

ESX.RegisterUsableItem('redbull', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('redbull', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
	TriggerClientEvent('esx_bahamajob:speed', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez utilisé 1x ~y~RedBull~s~')

end)

RegisterServerEvent('esx_bahamajob:annonce')
AddEventHandler('esx_bahamajob:annonce', function(result)
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()
	local text     = result
	print(text)
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		TriggerClientEvent('esx_bahamajob:annonce', xPlayers[i],text)
	end

	Wait(8000)

	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		TriggerClientEvent('esx_bahamajob:annoncestop', xPlayers[i])
	end

end)