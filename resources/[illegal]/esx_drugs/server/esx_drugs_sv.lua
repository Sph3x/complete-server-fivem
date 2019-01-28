ESX 						      = nil
local CopsConnected       	      = 0
local PlayersHarvestingCoke       = {}
local PlayersTransformingCoke     = {}
local PlayersSellingCoke          = {}
local PlayersHarvestingMeth       = {}
local PlayersTransformingMeth     = {}
local PlayersSellingMeth          = {}
local PlayersHarvestingWeed       = {}
local PlayersTransformingWeed     = {}
local PlayersSellingWeed          = {}
local PlayersHarvestingOpium      = {}
local PlayersTransformingOpium    = {}
local PlayersSellingOpium         = {}
local PlayersHarvestingMunition   = {}
local PlayersTransformingMunition = {}
local PlayersSellingMunition      = {}
local PlayersHarvestingBijoux     = {}
local PlayersTransformingBijoux   = {}
local PlayersSellingBijoux        = {}
local PlayersHarvestingPapier     = {}
local PlayersTransformingPapier   = {}
local PlayersSellingPapier        = {}
local PlayersHarvestingOrgan      = {}
local PlayersTransformingOrgan    = {}
local PlayersSellingOrgan         = {}

local AlertMeth     = false
local AlertWeed     = false
local AlertCoke     = false
local AlertOpium    = false
local AlertMunition = false
local AlertBijoux   = false
local AlertPapier   = false
local AlertOrgan    = false

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function CountCops()

	local xPlayers = ESX.GetPlayers()

	CopsConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			CopsConnected = CopsConnected + 1
		end
	end

	SetTimeout(120 * 1000, CountCops)
end

CountCops()



function CallCopsWeed()
	if AlertWeed == false then
		AlertWeed = true
		SetTimeout(Config.TimeToSell*10, function()
		local xPlayers   = ESX.GetPlayers()
			for i=1, #xPlayers, 1 do
				local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
				if xPlayer.job.name == 'police' then
					TriggerClientEvent('esx:showNotification', xPlayers[i], _U('drug_sell'))
				end
			end
		end)
	end
end

function CallCopsMeth()
	if AlertMeth == false then
		AlertMeth = true
		SetTimeout(Config.TimeToSell*10, function()
		local xPlayers   = ESX.GetPlayers()
			for i=1, #xPlayers, 1 do
				local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
				if xPlayer.job.name == 'police' then
					TriggerClientEvent('esx:showNotification', xPlayers[i], _U('drug_sell'))
				end
			end
		end)
	end
end

function CallCopsCoke()
	if AlertCoke == false then
		AlertCoke = true
		SetTimeout(Config.TimeToSell*10, function()
		local xPlayers   = ESX.GetPlayers()
			for i=1, #xPlayers, 1 do
				local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
				if xPlayer.job.name == 'police' then
					TriggerClientEvent('esx:showNotification', xPlayers[i], _U('drug_sell'))
				end
			end
		end)
	end
end

function CallCopsOpium()
	if AlertOpium == false then
		AlertOpium = true
		SetTimeout(Config.TimeToSell*10, function()
		local xPlayers   = ESX.GetPlayers()
			for i=1, #xPlayers, 1 do
				local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
				if xPlayer.job.name == 'police' then
					TriggerClientEvent('esx:showNotification', xPlayers[i], _U('drug_sell'))
				end
			end
		end)
	end
end

function CallCopsMunition()
	if AlertMunition == false then
		AlertMunition = true
		SetTimeout(Config.TimeToSell*10, function()
		local xPlayers   = ESX.GetPlayers()
			for i=1, #xPlayers, 1 do
				local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
				if xPlayer.job.name == 'police' then
					TriggerClientEvent('esx:showNotification', xPlayers[i], _U('drug_sell'))
				end
			end
		end)
	end
end

function CallCopsBijoux()
	if AlertBijoux == false then
		AlertBijoux = true
		SetTimeout(Config.TimeToSell*10, function()
		local xPlayers   = ESX.GetPlayers()
			for i=1, #xPlayers, 1 do
				local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
				if xPlayer.job.name == 'police' then
					TriggerClientEvent('esx:showNotification', xPlayers[i], _U('drug_sell'))
				end
			end
		end)
	end
end

function CallCopsPapier()
	if AlertPapier == false then
		AlertPapier = true
		SetTimeout(Config.TimeToSell*10, function()
		local xPlayers   = ESX.GetPlayers()
			for i=1, #xPlayers, 1 do
				local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
				if xPlayer.job.name == 'police' then
					TriggerClientEvent('esx:showNotification', xPlayers[i], _U('drug_sell'))
				end
			end
		end)
	end
end

function CallCopsOrgan()
	if AlertOrgan == false then
		AlertOrgan = true
		SetTimeout(Config.TimeToSell*10, function()
		local xPlayers   = ESX.GetPlayers()
			for i=1, #xPlayers, 1 do
				local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
				if xPlayer.job.name == 'police' then
					TriggerClientEvent('esx:showNotification', xPlayers[i], _U('drug_Organ_sell'))
				end
			end
		end)
	end
end


--coke
local function HarvestCoke(source)

	if CopsConnected < Config.RequiredCopsCoke then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsCoke))
		return
	end

	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvestingCoke[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local coke = xPlayer.getInventoryItem('coke')

			if coke.limit ~= -1 and coke.count >= coke.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_coke'))
			else
				xPlayer.addInventoryItem('coke', 1)
				HarvestCoke(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startHarvestCoke')
AddEventHandler('esx_drugs:startHarvestCoke', function()

	local _source = source

	PlayersHarvestingCoke[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestCoke(_source)

end)

RegisterServerEvent('esx_drugs:stopHarvestCoke')
AddEventHandler('esx_drugs:stopHarvestCoke', function()

	local _source = source

	PlayersHarvestingCoke[_source] = false

end)

local function TransformCoke(source)

	if CopsConnected < Config.RequiredCopsCoke then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsCoke))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformingCoke[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local cokeQuantity = xPlayer.getInventoryItem('coke').count
			local poochQuantity = xPlayer.getInventoryItem('coke_pooch').count

			if poochQuantity > 35 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif cokeQuantity < 1 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_coke'))
			else
				xPlayer.removeInventoryItem('coke', 1)
				xPlayer.addInventoryItem('coke_pooch', 1)
			
				TransformCoke(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformCoke')
AddEventHandler('esx_drugs:startTransformCoke', function()

	local _source = source

	PlayersTransformingCoke[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformCoke(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformCoke')
AddEventHandler('esx_drugs:stopTransformCoke', function()

	local _source = source

	PlayersTransformingCoke[_source] = false

end)

local function SellCoke(source)

	if CopsConnected < Config.RequiredCopsDealer then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsDealer))
		return
	end

	SetTimeout(Config.TimeToSell, function()

		if PlayersSellingCoke[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local poochQuantity = xPlayer.getInventoryItem('coke_pooch').count

			CallCopsCoke()

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_pouches_sale'))
				AlertCoke = false
			else
				xPlayer.removeInventoryItem('coke_pooch', 1)
				if CopsConnected == 0 then
					xPlayer.addAccountMoney('black_money', 50)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('black_money', 100)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 200)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 300)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', 600)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('black_money', 700)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
				end
				
				SellCoke(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startSellCoke')
AddEventHandler('esx_drugs:startSellCoke', function()

	local _source = source

	PlayersSellingCoke[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellCoke(_source)

end)

RegisterServerEvent('esx_drugs:stopSellCoke')
AddEventHandler('esx_drugs:stopSellCoke', function()

	local _source = source

	PlayersSellingCoke[_source] = false

end)

--meth
local function HarvestMeth(source)

	if CopsConnected < Config.RequiredCopsMeth then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsMeth))
		return
	end
	
	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvestingMeth[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local meth = xPlayer.getInventoryItem('meth')

			if meth.limit ~= -1 and meth.count >= meth.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_meth'))
			else
				xPlayer.addInventoryItem('meth', 1)
				HarvestMeth(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startHarvestMeth')
AddEventHandler('esx_drugs:startHarvestMeth', function()

	local _source = source

	PlayersHarvestingMeth[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestMeth(_source)

end)

RegisterServerEvent('esx_drugs:stopHarvestMeth')
AddEventHandler('esx_drugs:stopHarvestMeth', function()

	local _source = source

	PlayersHarvestingMeth[_source] = false

end)

local function TransformMeth(source)

	if CopsConnected < Config.RequiredCopsMeth then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsMeth))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformingMeth[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local methQuantity = xPlayer.getInventoryItem('meth').count
			local poochQuantity = xPlayer.getInventoryItem('meth_pooch').count

			if poochQuantity > 35 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif methQuantity < 1 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_meth'))
			else
				xPlayer.removeInventoryItem('meth', 1)
				xPlayer.addInventoryItem('meth_pooch', 1)
				
				TransformMeth(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformMeth')
AddEventHandler('esx_drugs:startTransformMeth', function()

	local _source = source

	PlayersTransformingMeth[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformMeth(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformMeth')
AddEventHandler('esx_drugs:stopTransformMeth', function()

	local _source = source

	PlayersTransformingMeth[_source] = false

end)

local function SellMeth(source)

	if CopsConnected < Config.RequiredCopsDealer then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsDealer))
		return
	end

	SetTimeout(Config.TimeToSell, function()

		if PlayersSellingMeth[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local poochQuantity = xPlayer.getInventoryItem('meth_pooch').count

			CallCopsMeth()

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', _source, _U('no_pouches_sale'))
				AlertMeth = false
			else
				xPlayer.removeInventoryItem('meth_pooch', 1)
				if CopsConnected == 0 then
					xPlayer.addAccountMoney('black_money', 100)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('black_money', 200)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 250)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 350)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', 500)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
				elseif CopsConnected == 5 then
					xPlayer.addAccountMoney('black_money', 700)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
				elseif CopsConnected >= 6 then
					xPlayer.addAccountMoney('black_money', 800)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
				end
				
				SellMeth(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startSellMeth')
AddEventHandler('esx_drugs:startSellMeth', function()

	local _source = source

	PlayersSellingMeth[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellMeth(_source)

end)

RegisterServerEvent('esx_drugs:stopSellMeth')
AddEventHandler('esx_drugs:stopSellMeth', function()

	local _source = source

	PlayersSellingMeth[_source] = false

end)

--weed
local function HarvestWeed(source)

	if CopsConnected < Config.RequiredCopsWeed then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsWeed))
		return
	end

	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvestingWeed[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local weed = xPlayer.getInventoryItem('weed')

			if weed.limit ~= -1 and weed.count >= weed.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_weed'))
			else
				xPlayer.addInventoryItem('weed', 1)
				HarvestWeed(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startHarvestWeed')
AddEventHandler('esx_drugs:startHarvestWeed', function()

	local _source = source

	PlayersHarvestingWeed[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestWeed(_source)

end)

RegisterServerEvent('esx_drugs:stopHarvestWeed')
AddEventHandler('esx_drugs:stopHarvestWeed', function()

	local _source = source

	PlayersHarvestingWeed[_source] = false

end)

local function TransformWeed(source)

	if CopsConnected < Config.RequiredCopsWeed then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsWeed))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformingWeed[source] == true then

			local _source = source
  			local xPlayer = ESX.GetPlayerFromId(_source)
			local weedQuantity = xPlayer.getInventoryItem('weed').count
			local poochQuantity = xPlayer.getInventoryItem('weed_pooch').count

			if poochQuantity > 35 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif weedQuantity < 1 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_weed'))
			else
				xPlayer.removeInventoryItem('weed', 1)
				xPlayer.addInventoryItem('weed_pooch', 1)
				
				TransformWeed(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformWeed')
AddEventHandler('esx_drugs:startTransformWeed', function()

	local _source = source

	PlayersTransformingWeed[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformWeed(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformWeed')
AddEventHandler('esx_drugs:stopTransformWeed', function()

	local _source = source

	PlayersTransformingWeed[_source] = false

end)

local function SellWeed(source)

	if CopsConnected < Config.RequiredCopsDealer then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsDealer))
		return
	end

	SetTimeout(Config.TimeToSell, function()

		if PlayersSellingWeed[source] == true then

			local _source = source
  			local xPlayer = ESX.GetPlayerFromId(_source)

			local poochQuantity = xPlayer.getInventoryItem('weed_pooch').count

			CallCopsWeed()

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_pouches_sale'))
				AlertWeed = false
			else
				xPlayer.removeInventoryItem('weed_pooch', 1)
				if CopsConnected == 1 then
					xPlayer.addAccountMoney('black_money', 100)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 150)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 250)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', 350)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('black_money', 500)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
				end
				
				SellWeed(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startSellWeed')
AddEventHandler('esx_drugs:startSellWeed', function()

	local _source = source

	PlayersSellingWeed[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellWeed(_source)

end)

RegisterServerEvent('esx_drugs:stopSellWeed')
AddEventHandler('esx_drugs:stopSellWeed', function()

	local _source = source

	PlayersSellingWeed[_source] = false

end)


--opium

local function HarvestOpium(source)

	if CopsConnected < Config.RequiredCopsOpium then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsOpium))
		return
	end

	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvestingOpium[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local opium = xPlayer.getInventoryItem('opium')

			if opium.limit ~= -1 and opium.count >= opium.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_opium'))
			else
				xPlayer.addInventoryItem('opium', 1)
				HarvestOpium(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startHarvestOpium')
AddEventHandler('esx_drugs:startHarvestOpium', function()

	local _source = source

	PlayersHarvestingOpium[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestOpium(_source)

end)

RegisterServerEvent('esx_drugs:stopHarvestOpium')
AddEventHandler('esx_drugs:stopHarvestOpium', function()

	local _source = source

	PlayersHarvestingOpium[_source] = false

end)

local function TransformOpium(source)

	if CopsConnected < Config.RequiredCopsOpium then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsOpium))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformingOpium[source] == true then

			local _source = source
  			local xPlayer = ESX.GetPlayerFromId(_source)

			local opiumQuantity = xPlayer.getInventoryItem('opium').count
			local poochQuantity = xPlayer.getInventoryItem('opium_pooch').count

			if poochQuantity > 35 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif opiumQuantity < 1 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_opium'))
			else
				xPlayer.removeInventoryItem('opium', 1)
				xPlayer.addInventoryItem('opium_pooch', 1)
			
				TransformOpium(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformOpium')
AddEventHandler('esx_drugs:startTransformOpium', function()

	local _source = source

	PlayersTransformingOpium[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformOpium(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformOpium')
AddEventHandler('esx_drugs:stopTransformOpium', function()

	local _source = source

	PlayersTransformingOpium[_source] = false

end)

local function SellOpium(source)

	if CopsConnected < Config.RequiredCopsDealer then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsDealer))
		return
	end

	SetTimeout(Config.TimeToSell, function()

		if PlayersSellingOpium[source] == true then

			local _source = source
  			local xPlayer = ESX.GetPlayerFromId(_source)

			local poochQuantity = xPlayer.getInventoryItem('opium_pooch').count

			CallCopsOpium()

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_pouches_sale'))
				AlertOpium = false
			else
				xPlayer.removeInventoryItem('opium_pooch', 1)
				if CopsConnected == 0 then
					xPlayer.addAccountMoney('black_money', 250)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('black_money', 400)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 450)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 650)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', 850)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('black_money', 1100)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
				end
				
				SellOpium(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startSellOpium')
AddEventHandler('esx_drugs:startSellOpium', function()

	local _source = source

	PlayersSellingOpium[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellOpium(_source)

end)

RegisterServerEvent('esx_drugs:stopSellOpium')
AddEventHandler('esx_drugs:stopSellOpium', function()

	local _source = source

	PlayersSellingOpium[_source] = false

end)


----------------------------------------------------------------------------
----------------------------------------------------------------------------
--munition
local function HarvestMunition(source)

	if CopsConnected < Config.RequiredCopsMunition then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsMunition))
		return
	end

	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvestingMunition[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local munition = xPlayer.getInventoryItem('munition')

			if munition.limit ~= -1 and munition.count >= munition.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_munition'))
			else
				xPlayer.addInventoryItem('munition', 1)
				HarvestMunition(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startHarvestMunition')
AddEventHandler('esx_drugs:startHarvestMunition', function()

	local _source = source

	PlayersHarvestingMunition[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestMunition(_source)

end)

RegisterServerEvent('esx_drugs:stopHarvestMunition')
AddEventHandler('esx_drugs:stopHarvestMunition', function()

	local _source = source

	PlayersHarvestingMunition[_source] = false

end)

local function TransformMunition(source)

	if CopsConnected < Config.RequiredCopsMunition then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsMunition))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformingMunition[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local munitionQuantity = xPlayer.getInventoryItem('munition').count
			local poochQuantity = xPlayer.getInventoryItem('munition_pooch').count

			if poochQuantity > 35 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_munition'))
			elseif munitionQuantity < 1 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_munition'))
			else
				xPlayer.removeInventoryItem('munition', 1)
				xPlayer.addInventoryItem('munition_pooch', 1)
			
				TransformMunition(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformMunition')
AddEventHandler('esx_drugs:startTransformMunition', function()

	local _source = source

	PlayersTransformingMunition[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformMunition(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformMunition')
AddEventHandler('esx_drugs:stopTransformMunition', function()

	local _source = source

	PlayersTransformingMunition[_source] = false

end)

local function SellMunition(source)

	if CopsConnected < Config.RequiredCopsDealer then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsDealer))
		return
	end

	SetTimeout(Config.TimeToSell, function()

		if PlayersSellingMunition[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local poochQuantity = xPlayer.getInventoryItem('munition_pooch').count

			CallCopsMunition()

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_munition_sale'))
				AlertMunition = false
			else
				xPlayer.removeInventoryItem('munition_pooch', 1)
				if CopsConnected == 0 then
					xPlayer.addAccountMoney('black_money', 300)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_munition'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('black_money', 450)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_munition'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 500)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_munition'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 600)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_munition'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', 700)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_munition'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('black_money', 800)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_munition'))
				end
				
				SellMunition(source)
			end

		end
	end)
end 

RegisterServerEvent('esx_drugs:startSellMunition')
AddEventHandler('esx_drugs:startSellMunition', function()

	local _source = source

	PlayersSellingMunition[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellMunition(_source)

end)

RegisterServerEvent('esx_drugs:stopSellMunition')
AddEventHandler('esx_drugs:stopSellMunition', function()

	local _source = source

	PlayersSellingMunition[_source] = false

end)

----------------------------------------------------------------------------
----------------------------------------------------------------------------
--bijoux
local function HarvestBijoux(source)

	if CopsConnected < Config.RequiredCopsBijoux then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsBijoux))
		return
	end

	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvestingBijoux[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local bijoux = xPlayer.getInventoryItem('bijoux')

			if bijoux.limit ~= -1 and bijoux.count >= bijoux.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_bijoux'))
			else
				xPlayer.addInventoryItem('bijoux', 1)
				HarvestBijoux(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startHarvestBijoux')
AddEventHandler('esx_drugs:startHarvestBijoux', function()

	local _source = source

	PlayersHarvestingBijoux[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestBijoux(_source)

end)

RegisterServerEvent('esx_drugs:stopHarvestBijoux')
AddEventHandler('esx_drugs:stopHarvestBijoux', function()

	local _source = source

	PlayersHarvestingBijoux[_source] = false

end)

local function TransformBijoux(source)

	if CopsConnected < Config.RequiredCopsBijoux then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsBijoux))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformingBijoux[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local bijouxQuantity = xPlayer.getInventoryItem('bijoux').count
			local poochQuantity = xPlayer.getInventoryItem('bijoux_pooch').count

			if poochQuantity > 35 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_bijoux'))
			elseif bijouxQuantity < 1 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_bijoux'))
			else
				xPlayer.removeInventoryItem('bijoux', 1)
				xPlayer.addInventoryItem('bijoux_pooch', 1)
			
				TransformBijoux(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformBijoux')
AddEventHandler('esx_drugs:startTransformBijoux', function()

	local _source = source

	PlayersTransformingBijoux[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformBijoux(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformBijoux')
AddEventHandler('esx_drugs:stopTransformBijoux', function()

	local _source = source

	PlayersTransformingBijoux[_source] = false

end)

local function SellBijoux(source)

	if CopsConnected < Config.RequiredCopsDealer then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsDealer))
		return
	end

	SetTimeout(Config.TimeToSell, function()

		if PlayersSellingBijoux[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local poochQuantity = xPlayer.getInventoryItem('bijoux_pooch').count

			CallCopsBijoux()

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_bijoux_sale'))
				AlertBijoux = false
			else
				xPlayer.removeInventoryItem('bijoux_pooch', 1)
				if CopsConnected == 0 then
					xPlayer.addAccountMoney('black_money', 100)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_bijoux'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('black_money', 200)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_bijoux'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 350)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_bijoux'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 500)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_bijoux'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', 850)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_bijoux'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('black_money', 900)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_bijoux'))
				end
				
				SellBijoux(source)
			end

		end
	end)
end 

RegisterServerEvent('esx_drugs:startSellBijoux')
AddEventHandler('esx_drugs:startSellBijoux', function()

	local _source = source

	PlayersSellingBijoux[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellBijoux(_source)

end)

RegisterServerEvent('esx_drugs:stopSellBijoux')
AddEventHandler('esx_drugs:stopSellBijoux', function()

	local _source = source

	PlayersSellingBijoux[_source] = false

end)

----------------------------------------------------------------------------
----------------------------------------------------------------------------
--papier  Papier
local function HarvestPapier(source)

	if CopsConnected < Config.RequiredCopsPapier then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsPapier))
		return
	end

	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvestingPapier[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local papier = xPlayer.getInventoryItem('papier')

			if papier.limit ~= -1 and papier.count >= papier.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_papier'))
			else
				xPlayer.addInventoryItem('papier', 1)
				HarvestPapier(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startHarvestPapier')
AddEventHandler('esx_drugs:startHarvestPapier', function()

	local _source = source

	PlayersHarvestingPapier[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestPapier(_source)

end)

RegisterServerEvent('esx_drugs:stopHarvestPapier')
AddEventHandler('esx_drugs:stopHarvestPapier', function()

	local _source = source

	PlayersHarvestingPapier[_source] = false

end)

local function TransformPapier(source)

	if CopsConnected < Config.RequiredCopsPapier then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsPapier))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformingPapier[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local papierQuantity = xPlayer.getInventoryItem('papier').count
			local poochQuantity = xPlayer.getInventoryItem('papier_pooch').count

			if poochQuantity > 35 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_papier'))
			elseif papierQuantity < 1 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_papier'))
			else
				xPlayer.removeInventoryItem('papier', 1)
				xPlayer.addInventoryItem('papier_pooch', 1)
			
				TransformPapier(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformPapier')
AddEventHandler('esx_drugs:startTransformPapier', function()

	local _source = source

	PlayersTransformingPapier[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformPapier(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformPapier')
AddEventHandler('esx_drugs:stopTransformPapier', function()

	local _source = source

	PlayersTransformingPapier[_source] = false

end)

local function SellPapier(source)

	if CopsConnected < Config.RequiredCopsDealer then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsDealer))
		return
	end

	SetTimeout(Config.TimeToSell, function()

		if PlayersSellingPapier[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local poochQuantity = xPlayer.getInventoryItem('papier_pooch').count

			CallCopsPapier()

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_papier_sale'))
				AlertPapier = false
			else
				xPlayer.removeInventoryItem('papier_pooch', 1)
				if CopsConnected == 0 then
					xPlayer.addAccountMoney('black_money', 250)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_papier'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('black_money', 400)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_papier'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 500)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_papier'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 675)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_papier'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', 825)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_papier'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('black_money', 950)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_papier'))
				end
				
				SellPapier(source)
			end

		end
	end)
end 

RegisterServerEvent('esx_drugs:startSellPapier')
AddEventHandler('esx_drugs:startSellPapier', function()

	local _source = source

	PlayersSellingPapier[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellPapier(_source)

end)

RegisterServerEvent('esx_drugs:stopSellPapier')
AddEventHandler('esx_drugs:stopSellPapier', function()

	local _source = source

	PlayersSellingPapier[_source] = false

end)

----------------------------------------------------------------------------
----------------------------------------------------------------------------
--organ
local function HarvestOrgan(source)

	if CopsConnected < Config.RequiredCopsOrgan then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsOrgan))
		return
	end

	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvestingOrgan[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local organ = xPlayer.getInventoryItem('organ')

			if organ.limit ~= -1 and organ.count >= organ.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_organ'))
			else
				xPlayer.addInventoryItem('organ', 1)
				HarvestOrgan(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startHarvestOrgan')
AddEventHandler('esx_drugs:startHarvestOrgan', function()

	local _source = source

	PlayersHarvestingOrgan[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestOrgan(_source)

end)

RegisterServerEvent('esx_drugs:stopHarvestOrgan')
AddEventHandler('esx_drugs:stopHarvestOrgan', function()

	local _source = source

	PlayersHarvestingOrgan[_source] = false

end)

local function TransformOrgan(source)

	if CopsConnected < Config.RequiredCopsOrgan then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsOrgan))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformingOrgan[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local organQuantity = xPlayer.getInventoryItem('organ').count
			local poochQuantity = xPlayer.getInventoryItem('organ_pooch').count

			if poochQuantity > 35 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_organ'))
			elseif organQuantity < 1 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_organ'))
			else
				xPlayer.removeInventoryItem('organ', 1)
				xPlayer.addInventoryItem('organ_pooch', 1)
			
				TransformOrgan(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformOrgan')
AddEventHandler('esx_drugs:startTransformOrgan', function()

	local _source = source

	PlayersTransformingOrgan[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformOrgan(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformOrgan')
AddEventHandler('esx_drugs:stopTransformOrgan', function()

	local _source = source

	PlayersTransformingOrgan[_source] = false

end)

local function SellOrgan(source)

	if CopsConnected < Config.RequiredCopsDealer then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsDealer))
		return
	end

	SetTimeout(Config.TimeToSell, function()

		if PlayersSellingOrgan[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local poochQuantity = xPlayer.getInventoryItem('organ_pooch').count

			CallCopsOrgan()

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_organ_sale'))
				AlertOrgan = false
			else
				xPlayer.removeInventoryItem('organ_pooch', 1)
				if CopsConnected == 0 then
					xPlayer.addAccountMoney('black_money', 600)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_organ'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('black_money', 625)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_organ'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 700)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_organ'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 825)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_organ'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', 950)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_organ'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('black_money', 1000)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_organ'))
				end
				
				SellOrgan(source)
			end

		end
	end)
end 

RegisterServerEvent('esx_drugs:startSellOrgan')
AddEventHandler('esx_drugs:startSellOrgan', function()

	local _source = source

	PlayersSellingOrgan[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellOrgan(_source)

end)

RegisterServerEvent('esx_drugs:stopSellOrgan')
AddEventHandler('esx_drugs:stopSellOrgan', function()

	local _source = source

	PlayersSellingOrgan[_source] = false

end)

RegisterServerEvent('esx_drugs:GetUserInventory')
AddEventHandler('esx_drugs:GetUserInventory', function(currentZone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('esx_drugs:ReturnInventory', 
		_source, 
		xPlayer.getInventoryItem('coke').count, 
		xPlayer.getInventoryItem('coke_pooch').count,
		xPlayer.getInventoryItem('meth').count, 
		xPlayer.getInventoryItem('meth_pooch').count, 
		xPlayer.getInventoryItem('weed').count, 
		xPlayer.getInventoryItem('weed_pooch').count, 
		xPlayer.getInventoryItem('opium').count, 
		xPlayer.getInventoryItem('opium_pooch').count,
		xPlayer.getInventoryItem('munition').count, 
		xPlayer.getInventoryItem('munition_pooch').count,
		xPlayer.getInventoryItem('bijoux').count, 
		xPlayer.getInventoryItem('bijoux_pooch').count,
		xPlayer.getInventoryItem('papier').count, 
		xPlayer.getInventoryItem('papier_pooch').count,
		xPlayer.getInventoryItem('organ').count, 
		xPlayer.getInventoryItem('organ_pooch').count,

		xPlayer.job.name, 
		currentZone
	)
end)

ESX.RegisterUsableItem('weed', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('weed', 1)

	TriggerClientEvent('esx_drugs:onPot', _source)
	TriggerClientEvent('esx:showNotification', _source, _U('used_one_weed'))
end)
