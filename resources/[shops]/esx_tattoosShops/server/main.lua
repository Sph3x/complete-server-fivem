ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('esx_tattooshop:requestPlayerTattoos', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(result)
		if result[1] ~= nil then
			cb(json.decode(result[1].tattoos))
		else
			cb({})
		end
	end)
end)

ESX.RegisterServerCallback('esx_tattooshop:purchaseTattoo', function(source, cb, tattooList, price, tattoo)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.getMoney() >= price then
		xPlayer.removeMoney(price)
		table.insert(tattooList, tattoo)

		MySQL.Async.execute('UPDATE users SET tattoos = @tattoos WHERE identifier = @identifier',
		{
			['@tattoos'] = json.encode(tattooList),
			['@identifier'] = xPlayer.identifier
		})

		TriggerClientEvent('esx:showNotification', source, _U('bought_tattoo', price))
		cb(true)
	else
		local missingMoney = price - xPlayer.getMoney()
		TriggerClientEvent('esx:showNotification', source, _U('not_enough_money', missingMoney))
		cb(false)
	end
end)