ESX                = nil
local Categories   = {}
local Vehicles     = {}


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= 5 then
  TriggerEvent('esx_service:activateService', 'biker', Config.MaxInService)
end
TriggerEvent('esx_phone:registerNumber', 'biker', _U('biker_customer'), true, true)
TriggerEvent('esx_society:registerSociety', 'biker', 'Biker', 'society_biker', 'society_biker', 'society_biker', {type = 'private'})

RegisterServerEvent('esx_bikershop:annonce')
AddEventHandler('esx_bikershop:annonce', function(result)
  local _source  = source
  local xPlayer  = ESX.GetPlayerFromId(_source)
  local xPlayers = ESX.GetPlayers()
  local text     = result
  print(text)
  for i=1, #xPlayers, 1 do
    local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
    TriggerClientEvent('esx_bikershop:annonce', xPlayers[i],text)
  end

  Wait(8000)

  local xPlayers = ESX.GetPlayers()
  for i=1, #xPlayers, 1 do
    local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
    TriggerClientEvent('esx_bikershop:annoncestop', xPlayers[i])
  end

end)


function RemoveOwnedVehicle (plate)
  MySQL.Async.fetchAll(
    'SELECT * FROM owned_vehicles',
    {},
    function (result)
      for i=1, #result, 1 do
        local vehicleProps = json.decode(result[i].vehicle)

        if vehicleProps.plate == plate then
          MySQL.Async.execute(
            'DELETE FROM owned_vehicles WHERE id = @id',
            { ['@id'] = result[i].id }
          )
        end
      end
    end
  )
end

AddEventHandler('onMySQLReady', function ()
  Categories       = MySQL.Sync.fetchAll('SELECT * FROM biker_categories')
  local vehicles   = MySQL.Sync.fetchAll('SELECT * FROM bikes')

  for i=1, #vehicles, 1 do
    local vehicle = vehicles[i]

    for j=1, #Categories, 1 do
      if Categories[j].name == vehicle.category then
        vehicle.categoryLabel = Categories[j].label
      end
    end

    table.insert(Vehicles, vehicle)
  end
end)

RegisterServerEvent('esx_bikershop:setVehicleOwned')
AddEventHandler('esx_bikershop:setVehicleOwned', function (vehicleProps)
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(source)

  MySQL.Async.execute(
    'INSERT INTO owned_vehicles (vehicle, owner) VALUES (@vehicle, @owner)',
    {
      ['@vehicle'] = json.encode(vehicleProps),
      ['@owner']   = xPlayer.identifier,
    },
    function (rowsChanged)
      TriggerClientEvent('esx:showNotification', _source, _U('vehicle').. vehicleProps.plate .. _('belongs'))
    end
  )
end)

RegisterServerEvent('esx_bikershop:setVehicleOwnedPlayerId')
AddEventHandler('esx_bikershop:setVehicleOwnedPlayerId', function (playerId, vehicleProps)
  local xPlayer = ESX.GetPlayerFromId(playerId)

  MySQL.Async.execute(
    'INSERT INTO owned_vehicles (vehicle, owner) VALUES (@vehicle, @owner)',
    {
      ['@vehicle'] = json.encode(vehicleProps),
      ['@owner']   = xPlayer.identifier,
    },
    function (rowsChanged)
      TriggerClientEvent('esx:showNotification', playerId, _U('vehicle') .. vehicleProps.plate .. _('belongs'))
    end
  )
end)

RegisterServerEvent('esx_bikershop:setVehicleOwnedSociety')
AddEventHandler('esx_bikershop:setVehicleOwnedSociety', function (society, vehicleProps)
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(source)

  MySQL.Async.execute(
    'INSERT INTO owned_vehicles (vehicle, owner) VALUES (@vehicle, @owner)',
    {
      ['@vehicle'] = json.encode(vehicleProps),
      ['@owner']   = 'society:' .. society,
    },
    function (rowsChanged)

    end
  )
end)

RegisterServerEvent('esx_bikershop:sellVehicle')
AddEventHandler('esx_bikershop:sellVehicle', function (vehicle)
  MySQL.Async.fetchAll(
    'SELECT * FROM biker_vehicles WHERE vehicle = @vehicle LIMIT 1',
    { ['@vehicle'] = vehicle },
    function (result)
      local id    = result[1].id
      local price = result[1].price

      MySQL.Async.execute(
        'DELETE FROM biker_vehicles WHERE id = @id',
        { ['@id'] = id }
      )
    end
  )
end)


RegisterServerEvent('esx_bikershop:setVehicleForAllPlayers')
AddEventHandler('esx_bikershop:setVehicleForAllPlayers', function (props, x, y, z, radius)
  TriggerClientEvent('esx_bikershop:setVehicle', -1, props, x, y, z, radius)
end)


ESX.RegisterServerCallback('esx_bikershop:getCategories', function (source, cb)
  cb(Categories)
end)

ESX.RegisterServerCallback('esx_bikershop:getVehicles', function (source, cb)
  cb(Vehicles)
end)

ESX.RegisterServerCallback('esx_bikershop:buyVehicle', function (source, cb, vehicleModel)
  local xPlayer     = ESX.GetPlayerFromId(source)
  local vehicleData = nil

  for i=1, #Vehicles, 1 do
    if Vehicles[i].model == vehicleModel then
      vehicleData = Vehicles[i]
      break
    end
  end

  if xPlayer.get('money') >= vehicleData.price then
    xPlayer.removeMoney(vehicleData.price)
    cb(true)
  else
    cb(false)
  end
end)

ESX.RegisterServerCallback('esx_bikershop:buyVehicleSociety', function (source, cb, society, vehicleModel)
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

      MySQL.Async.execute(
        'INSERT INTO biker_vehicles (vehicle, price) VALUES (@vehicle, @price)',
        {
          ['@vehicle'] = vehicleData.model,
          ['@price']   = vehicleData.price,
        }
      )

      cb(true)
    else
      cb(false)
    end
  end)
end)

ESX.RegisterServerCallback('esx_bikershop:getPersonnalVehicles', function (source, cb)
  local xPlayer = ESX.GetPlayerFromId(source)

  MySQL.Async.fetchAll(
    'SELECT * FROM owned_vehicles WHERE owner = @owner',
    { ['@owner'] = xPlayer.identifier },
    function (result)
      local vehicles = {}

      for i=1, #result, 1 do
        local vehicleData = json.decode(result[i].vehicle)
        table.insert(vehicles, vehicleData)
      end

      cb(vehicles)
    end
  )
end)

ESX.RegisterServerCallback('esx_bikershop:getCommercialVehicles', function (source, cb)
  MySQL.Async.fetchAll(
    'SELECT * FROM biker_vehicles ORDER BY vehicle ASC',
    {},
    function (result)
      local vehicles = {}

      for i=1, #result, 1 do
        table.insert(vehicles, {
          name  = result[i].vehicle,
          price = result[i].price
        })
      end

      cb(vehicles)
    end
  )
end)


ESX.RegisterServerCallback('esx_bikershop:resellVehicle', function (source, cb, plate, price)
  MySQL.Async.fetchAll(
    'SELECT * FROM rented_vehicles WHERE plate = @plate LIMIT 1',
    { ['@plate'] = plate },
    function (result)
      if #result > 0 then
        cb(false)
      else
        local xPlayer = ESX.GetPlayerFromId(source)

        MySQL.Async.fetchAll(
          'SELECT * FROM owned_vehicles WHERE owner = @owner',
          { ['@owner'] = xPlayer.identifier },
          function (result)
            local found = false

            for i=1, #result, 1 do
              local vehicleProps = json.decode(result[i].vehicle)

              if vehicleProps.plate == plate then
                found = true
                break
              end
            end

            if found then
              xPlayer.addMoney(price)
              RemoveOwnedVehicle(plate)

              cb(true)
            else
              if xPlayer.job.grade_name == 'boss' then
                MySQL.Async.fetchAll(
                  'SELECT * FROM owned_vehicles WHERE owner = @owner',
                  { ['@owner'] = 'society:' .. xPlayer.job.name },
                  function (result)
                    local found = false

                    for i=1, #result, 1 do
                      local vehicleProps = json.decode(result[i].vehicle)

                      if vehicleProps.plate == plate then
                        found = true
                        break
                      end
                    end

                    if found then
                      xPlayer.addMoney(price)
                      RemoveOwnedVehicle(plate)

                      cb(true)
                    else
                      cb(false)
                    end
                  end
                )
              else
                cb(false)
              end
            end
          end
        )
      end
    end
  )
end)

if Config.EnablePvCommand then
  TriggerEvent('es:addCommand', 'pv', function (source, args, user)
    TriggerClientEvent('esx_bikershop:openPersonnalVehicleMenu', source)
  end, {help = _U('leaving')})
end


---------------------------- NPC Job Earnings ------------------------------------------------------

RegisterServerEvent('esx_bikershop:onNPCJobMissionCompleted')
AddEventHandler('esx_bikershop:onNPCJobMissionCompleted', function()

  math.randomseed(os.time())

  local xPlayer        = ESX.GetPlayerFromId(source)
  local total          = math.random(Config.NPCJobEarnings.min, Config.NPCJobEarnings.max);
  local societyAccount = nil

  if xPlayer.job.grade >= 3 then
    total = total * 2
  end

  TriggerEvent('esx_addonaccount:getSharedAccount', 'society_biker', function(account)
    societyAccount = account
  end)

  if societyAccount ~= nil then

    local playerMoney  = math.floor(total / 100 * 40)
    local societyMoney = math.floor(total / 100 * 60)

    xPlayer.addMoney(playerMoney)
    societyAccount.addMoney(societyMoney)

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_earned') .. playerMoney)
    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('comp_earned') .. societyMoney)
  else
    xPlayer.addMoney(total)
    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_earned') .. total)
  end
end)

----------------------------------
---- Ajout Gestion Stock Boss ----
----------------------------------

RegisterServerEvent('esx_bikershop:getStockItem')
AddEventHandler('esx_bikershop:getStockItem', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_biker', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= count then
      inventory.removeItem(itemName, count)
      xPlayer.addInventoryItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_removed') .. count .. ' ' .. item.label)

  end)

end)

ESX.RegisterServerCallback('esx_bikershop:getStockItems', function(source, cb)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_biker', function(inventory)
    cb(inventory.items)
  end)

end)

-------------
-- AJOUT 2 --
-------------

RegisterServerEvent('esx_bikershop:putStockItems')
AddEventHandler('esx_bikershop:putStockItems', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_biker', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= 0 then
      xPlayer.removeInventoryItem(itemName, count)
      inventory.addItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_added') .. count .. ' ' .. item.label)

  end)

end)

ESX.RegisterServerCallback('esx_bikershop:getPlayerInventory', function(source, cb)

  local xPlayer    = ESX.GetPlayerFromId(source)
  local items      = xPlayer.inventory

  cb({
    items      = items
  })

end)


----------------------------------------------------------------------------------------------------------------------
--------------------------------------Coffre argent sale / Armes ------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
ESX.RegisterServerCallback('esx_bikeshop:getBlackMoneySociety', function(source, cb)
  local _source = source
  local xPlayer    = ESX.GetPlayerFromId(_source)
  local blackMoney = 0
  local items      = {}
  local weapons    = {}

  TriggerEvent('esx_addonaccount:getSharedAccount', 'society_biker_black', function(account)
    blackMoney = account.money
  end)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_biker', function(inventory)
    items = inventory.items
  end)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_biker', function(store)
    local storeWeapons = store.get('weapons')

    if storeWeapons ~= nil then
      weapons = storeWeapons
    end
  end)

  cb({
    blackMoney = blackMoney,
    items      = items,
    weapons    = weapons
  })

end)

RegisterServerEvent('esx_bikeshop:getItem')
AddEventHandler('esx_bikeshop:getItem', function(type, item, count)

  local _source      = source
  local xPlayer      = ESX.GetPlayerFromId(_source)

  if type == 'item_account' then

    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_biker_black', function(account)

      local roomAccountMoney = account.money

      if roomAccountMoney >= count then
        account.removeMoney(count)
        xPlayer.addAccountMoney(item, count)
      else
        TriggerClientEvent('esx:showNotification', _source, 'Montant invalide')
      end

    end)
  end

  if type == 'item_weapon' then

    TriggerEvent('esx_datastore:getSharedDataStore', 'society_biker', function(store)

      local storeWeapons = store.get('weapons')

      if storeWeapons == nil then
        storeWeapons = {}
      end

      local weaponName   = nil
      local ammo         = nil

      for i=1, #storeWeapons, 1 do
        if storeWeapons[i].name == item then
          weaponName = storeWeapons[i].name
          ammo       = storeWeapons[i].ammo
          table.remove(storeWeapons, i)
          break
        end
      end
      store.set('weapons', storeWeapons)
      xPlayer.addWeapon(weaponName, ammo)
    end)
  end
end)

RegisterServerEvent('esx_bikeshop:putItem')
AddEventHandler('esx_bikeshop:putItem', function(type, item, count)

  local _source      = source
  local xPlayer      = ESX.GetPlayerFromId(_source)

  if type == 'item_account' then
    local playerAccountMoney = xPlayer.getAccount(item).money

    if playerAccountMoney >= count then

      xPlayer.removeAccountMoney(item, count)
      TriggerEvent('esx_addonaccount:getSharedAccount', 'society_biker_black', function(account)
        account.addMoney(count)
      end)
    else
      TriggerClientEvent('esx:showNotification', _source, 'Montant invalide')
    end
  end

  if type == 'item_weapon' then
    TriggerEvent('esx_datastore:getSharedDataStore', 'society_biker', function(store)
      local storeWeapons = store.get('weapons')

      if storeWeapons == nil then
        storeWeapons = {}
      end

      table.insert(storeWeapons, {
        name = item,
        ammo = count
      })
      store.set('weapons', storeWeapons)

      xPlayer.removeWeapon(item)
    end)
  end
end)

ESX.RegisterServerCallback('esx_bikeshop:getPlayerInventory2', function(source, cb)
  local _source = source
  local xPlayer    = ESX.GetPlayerFromId(_source)
  local blackMoney = xPlayer.getAccount('black_money').money
  local items      = xPlayer.inventory

  cb({
    blackMoney = blackMoney,
    items      = items
  })
end)
