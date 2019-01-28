ESX = nil

PlayersHarvesting  = {}
PlayersHarvesting2 = {}
PlayersCrafting    = {}
PlayersReselling   = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
  TriggerEvent('esx_service:activateService', 'armurier', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'armurier', _U('alert_armurier'), true, true)
TriggerEvent('esx_society:registerSociety', 'armurier', 'Armurier', 'society_armurier', 'society_armurier', 'society_armurier', {type = 'public'})

RegisterServerEvent('esx_armurierjob:giveWeapon')
AddEventHandler('esx_armurierjob:giveWeapon', function(weapon, ammo)
  local xPlayer = ESX.GetPlayerFromId(source)
  xPlayer.addWeapon(weapon, ammo)
end)

RegisterServerEvent('esx_armurierjob:washMoney')
AddEventHandler('esx_armurierjob:washMoney', function(amount)
	local xPlayer 		= ESX.GetPlayerFromId(source)
	local account 		= xPlayer.getAccount('black_money')
	local _percent		= Config.Percentage

	if amount > 0 and account.money >= amount then

		local bonus = math.random(Config.Bonus.min, Config.Bonus.max)
		local washedMoney = math.floor(amount / 100 * (_percent + bonus))

		xPlayer.removeAccountMoney('black_money', amount)
		xPlayer.addMoney(washedMoney)

		TriggerClientEvent("esx_armurierjob:notify", source, "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('cash') .. washedMoney .. _U('cash1'))

	else
		TriggerClientEvent("esx_armurierjob:notify", source, "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('invalid_amount'))
	end

end)

-- Coffre Prendre Objet - Patron & Employé
RegisterServerEvent('esx_armurierjob:getStockItem')
AddEventHandler('esx_armurierjob:getStockItem', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_armurier', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= count then
      inventory.removeItem(itemName, count)
      xPlayer.addInventoryItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_withdrawn') .. count .. ' ' .. item.label)

  end)

end)

-- Coffre Déposer Objet - Patron & Employé
RegisterServerEvent('esx_armurierjob:putStockItems')
AddEventHandler('esx_armurierjob:putStockItems', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_armurier', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= 0 then
      xPlayer.removeInventoryItem(itemName, count)
      inventory.addItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('added') .. count .. ' ' .. item.label)

  end)

end)

-- Coffre Prendre Objet - Patron
RegisterServerEvent('esx_armurierjob:getCoffreStockItem')
AddEventHandler('esx_armurierjob:getCoffreStockItem', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_armurier_coffre', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= count then
      inventory.removeItem(itemName, count)
      xPlayer.addInventoryItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_removed') .. count .. ' ' .. item.label)

  end)

end)

-- Coffre Déposer Objet - Patron
RegisterServerEvent('esx_armurierjob:putCoffreStockItems')
AddEventHandler('esx_armurierjob:putCoffreStockItems', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_armurier_coffre', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= 0 then
      xPlayer.removeInventoryItem(itemName, count)
      inventory.addItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('added') .. count .. ' ' .. item.label)

  end)

end)

ESX.RegisterServerCallback('esx_armurierjob:getOtherPlayerData', function(source, cb, target)

  if Config.EnableESXIdentity then

    local xPlayer = ESX.GetPlayerFromId(target)

    local identifier = GetPlayerIdentifiers(target)[1]

    local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
      ['@identifier'] = identifier
    })

    local user      = result[1]
    local firstname     = user['firstname']
    local lastname      = user['lastname']
    local sex           = user['sex']
    local dob           = user['dateofbirth']
    local height        = user['height'] .. " Inches"

    local data = {
      name        = GetPlayerName(target),
      inventory   = xPlayer.inventory,
      accounts    = xPlayer.accounts,
      weapons     = xPlayer.loadout,
      firstname   = firstname,
      lastname    = lastname,
      sex         = sex,
      dob         = dob,
      height      = height
    }

    TriggerEvent('esx_status:getStatus', source, 'drunk', function(status)

      if status ~= nil then
        data.drunk = math.floor(status.percent)
      end

    end)

    if Config.EnableLicenses then

      TriggerEvent('esx_license:getLicenses', source, function(licenses)
        data.licenses = licenses
        cb(data)
      end)

    else
      cb(data)
    end

  else

    local xPlayer = ESX.GetPlayerFromId(target)

    local data = {
      name       = GetPlayerName(target),
      inventory  = xPlayer.inventory,
      accounts   = xPlayer.accounts,
      weapons    = xPlayer.loadout
    }

    TriggerEvent('esx_status:getStatus', _source, 'drunk', function(status)

      if status ~= nil then
        data.drunk = status.getPercent()
      end

    end)

    TriggerEvent('esx_license:getLicenses', _source, function(licenses)
      data.licenses = licenses
    end)

    cb(data)

  end

end)

ESX.RegisterServerCallback('esx_armurierjob:getFineList', function(source, cb, category)

  MySQL.Async.fetchAll(
    'SELECT * FROM fine_types_armurier WHERE category = @category',
    {
      ['@category'] = category
    },
    function(fines)
      cb(fines)
    end
  )

end)

-- Coffre Prendre Arme - Patron & Employé
ESX.RegisterServerCallback('esx_armurierjob:getArmoryWeapons', function(source, cb)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_armurier', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    cb(weapons)

  end)

end)

-- Coffre Déposer Arme - Patron & Employé
ESX.RegisterServerCallback('esx_armurierjob:addArmoryWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.removeWeapon(weaponName)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_armurier', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = weapons[i].count + 1
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 1
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

-- Coffre Prendre Arme - Patron & Employé
ESX.RegisterServerCallback('esx_armurierjob:removeArmoryWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.addWeapon(weaponName, 1000)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_armurier', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 0
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

-- Coffre Prendre Arme - Patron
ESX.RegisterServerCallback('esx_armurierjob:getCoffreArmoryWeapons', function(source, cb)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_armurier_coffre', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    cb(weapons)

  end)

end)

-- Coffre Déposer Arme - Patron
ESX.RegisterServerCallback('esx_armurierjob:addCoffreArmoryWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.removeWeapon(weaponName)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_armurier_coffre', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = weapons[i].count + 1
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 1
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

-- Coffre Prendre Arme - Patron
ESX.RegisterServerCallback('esx_armurierjob:removeCoffreArmoryWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.addWeapon(weaponName, 1000)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_armurier_coffre', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 0
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

-- Coffre Acheter Armes - Patron
ESX.RegisterServerCallback('esx_armurierjob:buy', function(source, cb, amount)

  TriggerEvent('esx_addonaccount:getSharedAccount', 'society_armurier', function(account)

    if account.money >= amount then
      account.removeMoney(amount)
      cb(true)
    else
      cb(false)
    end

  end)

end)

-- Coffre Prendre Objet - Patron & Employé
ESX.RegisterServerCallback('esx_armurierjob:getStockItems', function(source, cb)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_armurier', function(inventory)
    cb(inventory.items)
  end)

end)

-- Coffre Prendre Objet - Patron
ESX.RegisterServerCallback('esx_armurierjob:getCoffreStockItems', function(source, cb)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_armurier_coffre', function(inventory)
    cb(inventory.items)
  end)

end)

------------------------------------------
-------------- Récolte Douille -------------
local function Harvest(source)

	SetTimeout(4000, function()

		if PlayersHarvesting[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local DouilleQuantity = xPlayer.getInventoryItem('douille').count

			if DouilleQuantity >= 50 then
				TriggerClientEvent('esx:showNotification', source, '~r~Vous n\'avez plus de place')
			else
                xPlayer.addInventoryItem('douille', 1)

				Harvest(source)
			end
		end
	end)
end

RegisterServerEvent('esx_armurierjob:startHarvest')
AddEventHandler('esx_armurierjob:startHarvest', function()
	local _source = source
	PlayersHarvesting[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Récolte de ~b~Douille~s~...')
	Harvest(source)
end)

RegisterServerEvent('esx_armurierjob:stopHarvest')
AddEventHandler('esx_armurierjob:stopHarvest', function()
	local _source = source
	PlayersHarvesting[_source] = false
end)

------------------------------------------
-------------- Récolte Poudre ------------
local function Harvest2(source)

	SetTimeout(4000, function()

		if PlayersHarvesting2[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local PoudreQuantity = xPlayer.getInventoryItem('poudre').count

			if PoudreQuantity >= 50 then
				TriggerClientEvent('esx:showNotification', source, '~r~Vous n\'avez plus de place')
			else
                xPlayer.addInventoryItem('poudre', 1)

				Harvest2(source)
			end
		end
	end)
end

RegisterServerEvent('esx_armurierjob:startHarvest2')
AddEventHandler('esx_armurierjob:startHarvest2', function()
	local _source = source
	PlayersHarvesting2[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Récolte de ~b~Poudre à canon~s~...')
	Harvest2(source)
end)

RegisterServerEvent('esx_armurierjob:stopHarvest2')
AddEventHandler('esx_armurierjob:stopHarvest2', function()
	local _source = source
	PlayersHarvesting2[_source] = false
end)
-------------------------------
----------------- Traitement des produits -------------------------------------
----------------- 		Craft Chargeur		-------------------------------------
local function Craft(source)

	SetTimeout(5000, function()

		if PlayersCrafting[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local DouilleQuantity    = xPlayer.getInventoryItem('douille').count
			local PoudreQuantity  = xPlayer.getInventoryItem('poudre').count
            if DouilleQuantity <= 0 then
			elseif PoudreQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez ~r~pas assez~s~ de Douille et Poudre')
			else
                xPlayer.removeInventoryItem('douille', 2)
				xPlayer.removeInventoryItem('poudre', 2)
                xPlayer.addInventoryItem('clip', 1)

				Craft(source)
			end
		end
	end)
end

RegisterServerEvent('esx_armurierjob:startCraft')
AddEventHandler('esx_armurierjob:startCraft', function()
	local _source = source
	PlayersCrafting[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Fabrication de ~b~Chargeur~s~...')
	Craft(_source)
end)

RegisterServerEvent('esx_armurierjob:stopCraft')
AddEventHandler('esx_armurierjob:stopCraft', function()
	local _source = source
	PlayersCrafting[_source] = false
end)
---------------------
---------------- Revente Chargeur -----------------------
local function Resell(source)

	SetTimeout(1000, function()

		if PlayersReselling[source] == true then

			   local xPlayer  = ESX.GetPlayerFromId(source)
			   local ChargeurQuantity = xPlayer.getInventoryItem('clip').count

			    if ChargeurQuantity <= 0 then
					TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez plus de Chargeur à vendre')
			    else

					xPlayer.removeInventoryItem('clip', 1)
					xPlayer.addMoney(77)

					Resell(source)
				end
		end
	end)
end

RegisterServerEvent('esx_armurierjob:startResell')
AddEventHandler('esx_armurierjob:startResell', function()
	local _source = source
	PlayersReselling[source] = true
	TriggerClientEvent('esx:showNotification', source, 'Vente de ~b~Chargeurs~s~ en cours...')
	Resell(source)
end)

RegisterServerEvent('esx_armurierjob:stopResell')
AddEventHandler('esx_armurierjob:stopResell', function()
	local _source = source
	PlayersReselling[source] = false
end)
---------------------

ESX.RegisterServerCallback('esx_armurierjob:getPlayerInventory', function(source, cb)

  local xPlayer = ESX.GetPlayerFromId(source)
  local items   = xPlayer.inventory

  cb({
    items = items
  })

end)
