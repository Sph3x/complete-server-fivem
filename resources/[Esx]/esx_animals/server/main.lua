ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback("eden_animal:animalname", function(source , cb)
    local _source        = source
    local xPlayer        = ESX.GetPlayerFromId(_source)
    MySQL.Async.fetchAll(
        'SELECT * FROM users WHERE identifier = @identifier',
        {
            ['@identifier'] = xPlayer.identifier
        },
        function(result)
                cb(result[1].animal)
        end
    )
end)

RegisterServerEvent("eden_animal:dead")
AddEventHandler("eden_animal:dead", function()
    local _source        = source
    local xPlayer        = ESX.GetPlayerFromId(_source)
	
	MySQL.Async.execute(
		'UPDATE users SET animal = "(NULL)" WHERE identifier = @identifier',
		{
			['@identifier']    = xPlayer.identifier
		}
	)     
end)

RegisterServerEvent('eden_animal:startHarvest')
AddEventHandler('eden_animal:startHarvest', function()
	local _source = source
	local xPlayer        = ESX.GetPlayerFromId(_source)
		xPlayer.removeInventoryItem('croquettes', 1)

end)

RegisterServerEvent('eden_animal:buy_croquette')
AddEventHandler('eden_animal:buy_croquette', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local price = 70
	--local file        = io.open('logs/animal.txt', "a")
	--local time         = os.date("%d/%m/%y %X")
	--local newFile     = "".. xPlayer.name .. " viens d \'acheter : des croquettes pour " .. price .. "$ // " .. time .. "\n"

	if xPlayer.get('money') >= price then

		xPlayer.removeMoney(price)
		xPlayer.addInventoryItem('croquettes', 10)
		TriggerClientEvent('esx:showNotification', _source, ('Vous venez d\'acheter des croquettes pour ~g~' .. price ..'$'))
		--file:write(newFile)
		--file:flush()
		--file:close()
	else
		TriggerClientEvent('esx:showNotification', _source, ('Vous n\'avez pas suffisamment d\'argent'))
	end

end)

RegisterServerEvent('eden_animal:buy_ball')
AddEventHandler('eden_animal:buy_ball', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local price = 30
	--local file        = io.open('logs/animal.txt', "a")
	--local time         = os.date("%d/%m/%y %X")
	--local newFile     = "".. xPlayer.name .. " viens d \'acheter : une balle d\'une valeur de " .. price .. "$ // " .. time .. "\n"

	if xPlayer.get('money') >= price then

		xPlayer.removeMoney(price)
		xPlayer.addWeapon("WEAPON_BALL", 1)
		TriggerClientEvent('esx:showNotification', _source, ('Vous venez d\'acheter une balle pour ~g~' .. price ..'$'))

		--file:write(newFile)
		--file:flush()
		--file:close()
	else
		TriggerClientEvent('esx:showNotification', _source, ('Vous n\'avez pas suffisamment d\'argent'))
	end

end)

RegisterServerEvent('eden_animal:takeanimal')
AddEventHandler('eden_animal:takeanimal',function(animalname, price)

	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local file        = io.open('logs/animal.txt', "a")
	local time         = os.date("%d/%m/%y %X")
	local newFile     = "".. xPlayer.name .. " viens d \'acheter : "  .. animalname .. " d\'une valeur de " .. price .. " $ // " .. time .. " \n"

		if xPlayer.get('money') >= price then

			xPlayer.removeMoney(price)
			MySQL.Async.execute(
				'UPDATE users SET animal = @animalname WHERE identifier = @identifier',
				{
					['@identifier']    = xPlayer.identifier,
					['@animalname']    = animalname
				}
			)
			TriggerClientEvent('esx:showNotification', _source, ('Vous venez d\'acheter un ' .. animalname .. ' pour ' .. price))

			file:write(newFile)
			file:flush()
			file:close()

		else
			TriggerClientEvent('esx:showNotification', _source, ('Vous n\'avez pas suffisamment d\'argent'))
		end

end)

