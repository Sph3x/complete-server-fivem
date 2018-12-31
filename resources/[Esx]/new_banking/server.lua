--================================================================================================
--==                                VARIABLES - DO NOT EDIT                                     ==
--================================================================================================
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('bank:deposit')
AddEventHandler('bank:deposit', function(amount)
	local _source = source
	
	local xPlayer = ESX.GetPlayerFromId(_source)
	if amount == nil or amount <= 0 or amount > xPlayer.getMoney() then
		-- advanced notification with bank icon
		TriggerClientEvent('esx:showAdvancedNotification', _source, 'Bank', 'Déposer de l\'argent', 'Montant invalide', 'CHAR_BANK_MAZE', 9)
	else
		xPlayer.removeMoney(amount)
		xPlayer.addAccountMoney('bank', tonumber(amount))
                -- advanced notification with bank icon
		TriggerClientEvent('esx:showAdvancedNotification', _source, 'Bank', 'Déposer de l\'argent', 'Déposé ~g~$' .. amount .. '~s~', 'CHAR_BANK_MAZE', 9)
	end
end)


RegisterServerEvent('bank:withdraw')
AddEventHandler('bank:withdraw', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local base = 0
	amount = tonumber(amount)
	base = xPlayer.getAccount('bank').money
	if amount == nil or amount <= 0 or amount > base then
                 -- advanced notification with bank icon
		TriggerClientEvent('esx:showAdvancedNotification', _source, 'Bank', 'Retirer de l\'argent', 'Montant invalide', 'CHAR_BANK_MAZE', 9)
	else
		xPlayer.removeAccountMoney('bank', amount)
		xPlayer.addMoney(amount)
                 -- advanced notification with bank icon
                TriggerClientEvent('esx:showAdvancedNotification', _source, 'Bank', 'Retirer de l\'argent', 'Retiré ~r~$' .. amount .. '~s~', 'CHAR_BANK_MAZE', 9)
	end
end)

RegisterServerEvent('bank:balance')
AddEventHandler('bank:balance', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	balance = xPlayer.getAccount('bank').money
	TriggerClientEvent('currentbalance1', _source, balance)
	
end)


RegisterServerEvent('bank:transfer')
AddEventHandler('bank:transfer', function(to, amountt)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local zPlayer = ESX.GetPlayerFromId(to)
	local balance = 0
	balance = xPlayer.getAccount('bank').money
	zbalance = zPlayer.getAccount('bank').money
	
	if tonumber(_source) == tonumber(to) then
                -- advanced notification with bank icon
		TriggerClientEvent('esx:showAdvancedNotification', _source, 'Bank', 'Transférer de l\'argent', 'Vous ne pouvez pas vous transférer à vous-même!', 'CHAR_BANK_MAZE', 9)
	else
		if balance <= 0 or balance < tonumber(amountt) or tonumber(amountt) <= 0 then
                        -- advanced notification with bank icon
			TriggerClientEvent('esx:showAdvancedNotification', _source, 'Bank', 'Transférer de l\'argent', 'Pas assez d\'argent pour transférer!', 'CHAR_BANK_MAZE', 9)
		else
			xPlayer.removeAccountMoney('bank', amountt)
			zPlayer.addAccountMoney('bank', amountt)
                        -- advanced notification with bank icon
                        TriggerClientEvent('esx:showAdvancedNotification', _source, 'Bank', 'Transférer de l\'argent', 'Vous avez transféré ~r~$' .. amountt .. '~s~ to ~r~' .. to .. ' .', 'CHAR_BANK_MAZE', 9)
			TriggerClientEvent('esx:showAdvancedNotification', to, 'Bank', 'Transférer de l\'argent', 'Tu as reçu ~r~$' .. amountt .. '~s~ from ~r~' .. _source .. ' .', 'CHAR_BANK_MAZE', 9)
		end
		
	end
end)





