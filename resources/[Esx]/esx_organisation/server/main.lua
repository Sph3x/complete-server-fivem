ESX                 = nil
Org                 = {}
RegisteredSocieties = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function stringsplit(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t={} ; i=1
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
    t[i] = str
    i = i + 1
  end
  return t
end

function GetOrganisation(name)
  for i=1, #RegisteredSocieties, 1 do
    if RegisteredSocieties[i].name == name then
      return RegisteredSocieties[i]
    end
  end
end

AddEventHandler('onMySQLReady', function()

  local result = MySQL.Sync.fetchAll('SELECT * FROM org', {})

  for i=1, #result, 1 do
    Org[result[i].name]= result[i]
    Org[result[i].name].grade = {}
  end

  local result2 = MySQL.Sync.fetchAll('SELECT * FROM org_gradeorg', {})

  for i=1, #result2, 1 do
    Org[result2[i].org_name].grade[tostring(result2[i].grade)] = result2[i]
  end

end)

AddEventHandler('esx_organisation:registerOrganisation', function(name, label, account, datastore, inventory, data)

  local found = false

  local organisation = {
    name      = name,
    label     = label,
    account   = account,
    datastore = datastore,
    inventory = inventory,
    data      = data,
  }

  for i=1, #RegisteredSocieties, 1 do
    if RegisteredSocieties[i].name == name then
      found                  = true
      RegisteredSocieties[i] = organisation
      break
    end
  end

  if not found then
    table.insert(RegisteredSocieties, organisation)
  end

end)

AddEventHandler('esx_organisation:getSocieties', function(cb)
  cb(RegisteredSocieties)
end)

AddEventHandler('esx_organisation:getOrganisation', function(name, cb)
  cb(GetOrganisation(name))
end)

RegisterServerEvent('esx_organisation:withdrawMoney')
AddEventHandler('esx_organisation:withdrawMoney', function(organisation, amount)

  local xPlayer = ESX.GetPlayerFromId(source)
  local organisation = GetOrganisation(organisation)

  TriggerEvent('esx_addonaccount:getSharedAccount', organisation.account, function(account)

    if amount > 0 and account.money >= amount then

      account.removeMoney(amount)
      xPlayer.addMoney(amount)

      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_withdrawn') .. amount)

    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_amount'))
    end

  end)

end)

RegisterServerEvent('esx_organisation:depositMoney')
AddEventHandler('esx_organisation:depositMoney', function(organisation, amount)

  local xPlayer = ESX.GetPlayerFromId(source)
  local organisation = GetOrganisation(organisation)

  if amount > 0 and xPlayer.get('money') >= amount then

    TriggerEvent('esx_addonaccount:getSharedAccount', organisation.account, function(account)
      xPlayer.removeMoney(amount)
      account.addMoney(amount)
    end)

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_deposited') .. amount)

  else
    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_amount'))
  end

end)

RegisterServerEvent('esx_organisation:washMoney')
AddEventHandler('esx_organisation:washMoney', function(organisation, amount)

  local xPlayer = ESX.GetPlayerFromId(source)
  local account = xPlayer.getAccount('black_money')

  if amount > 0 and account.money >= amount then
  	
  	TriggerEvent("esx:washingmoneyalert",xPlayer.name,amount)
    xPlayer.removeAccountMoney('black_money', amount)

      MySQL.Async.execute(
        'INSERT INTO organisation_moneywash (identifier, organisation, amount) VALUES (@identifier, @organisation, @amount)',
        {
          ['@identifier'] = xPlayer.identifier,
          ['@organisation']    = organisation,
          ['@amount']     = amount
        },
        function(rowsChanged)
          TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_have') .. amount .. '~s~ en attente de ~r~blanchiement~s~ (24h)')
        end
      )

  else
    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_amount'))
  end

end)

RegisterServerEvent('esx_organisation:putVehicleInGarage')
AddEventHandler('esx_organisation:putVehicleInGarage', function(organisationName, vehicle)

  local organisation = GetOrganisation(organisationName)

  TriggerEvent('esx_datastore:getSharedDataStore', organisation.datastore, function(store)
    local garage = store.get('garage') or {}
    table.insert(garage, vehicle)
    store.set('garage', garage)
  end)

end)

RegisterServerEvent('esx_organisation:removeVehicleFromGarage')
AddEventHandler('esx_organisation:removeVehicleFromGarage', function(organisationName, vehicle)

  local organisation = GetOrganisation(organisationName)

  TriggerEvent('esx_datastore:getSharedDataStore', organisation.datastore, function(store)
    
    local garage = store.get('garage') or {}

    for i=1, #garage, 1 do
      if garage[i].plate == vehicle.plate then
        table.remove(garage, i)
        break
      end
    end

    store.set('garage', garage)

  end)

end)

ESX.RegisterServerCallback('esx_organisation:getOrganisationMoney', function(source, cb, organisationName)

  local organisation = GetOrganisation(organisationName)

  if organisation ~= nil then

    TriggerEvent('esx_addonaccount:getSharedAccount', organisation.account, function(account)
      cb(account.money)
    end)

  else
    cb(0)
  end

end)

ESX.RegisterServerCallback('esx_organisation:getEmployees', function(source, cb, organisation)

  if Config.EnableESXIdentity then
    MySQL.Async.fetchAll(
      'SELECT * FROM users WHERE org = @org ORDER BY org_gradeorg DESC',
      { ['@org'] = organisation },
      function (results)
        local employees = {}

        for i=1, #results, 1 do
          table.insert(employees, {
            name                 = results[i].firstname .. ' ' .. results[i].lastname,
            identifier  		= results[i].identifier,
            org = {
              name        = results[i].org,
              label       = Org[results[i].org].label,
              grade       = results[i].org_gradeorg,
              grade_name  = Org[results[i].org].grade[tostring(results[i].org_gradeorg)].name,
              grade_label = Org[results[i].org].grade[tostring(results[i].org_gradeorg)].label,
            }
          })
        end

        cb(employees)
      end
    )
  else
    MySQL.Async.fetchAll(
      'SELECT * FROM users WHERE org = @org ORDER BY org_gradeorg DESC',
      { ['@org'] = organisation },
      function (result)
        local employees = {}

        for i=1, #result, 1 do
          table.insert(employees, {
            name        = result[i].name,
            identifier  = result[i].identifier,
            org = {
              name        = result[i].org,
              label       = Org[result[i].org].label,
              grade       = result[i].org_gradeorg,
              grade_name  = Org[result[i].org].grade[tostring(result[i].org_gradeorg)].name,
              grade_label = Org[result[i].org].grade[tostring(result[i].org_gradeorg)].label,
            }
          })
        end

        cb(employees)
      end
    )
  end
end)

ESX.RegisterServerCallback('esx_organisation:getOrg', function(source, cb, organisation)

  local org    = json.decode(json.encode(Org[organisation]))
  local grade  = {}

  for k,v in pairs(org.grade) do
    table.insert(grade, v)
  end

  table.sort(grade, function(a, b)
    return a.grade < b.grade
  end)

  org.grade = grade

  cb(org)

end)


ESX.RegisterServerCallback('esx_organisation:setOrg', function(source, cb, identifier, org, grade, type)

  local xPlayer = ESX.GetPlayerFromIdentifier(identifier)

  if type == 'hire' then
    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_have_been_hired', org))
  elseif type == 'promote' then
    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_have_been_promoted'))
  elseif type == 'fire' then
    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_have_been_fired', xPlayer.getOrg().label))
  end

  if xPlayer ~= nil then
    xPlayer.setOrg(org, grade)
  end

  MySQL.Async.execute(
    'UPDATE users SET org = @org, org_gradeorg = @org_gradeorg WHERE identifier = @identifier',
    {
      ['@org']        = org,
      ['@org_gradeorg']  = grade,
      ['@identifier'] = identifier
    },
    function(rowsChanged)
      cb()
    end
  )

end)

ESX.RegisterServerCallback('esx_organisation:setOrgSalary', function(source, cb, org, grade, salary)

  MySQL.Async.execute(
    'UPDATE org_gradeorg SET salary = @salary WHERE org_name = @org_name AND grade = @grade',
    {
      ['@salary']   = salary,
      ['@org_name'] = org,
      ['@grade']    = grade
    },
    function(rowsChanged)

      Org[org].grade[tostring(grade)].salary = salary

      local xPlayers = ESX.GetPlayers()

      for i=1, #xPlayers, 1 do

        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

        if xPlayer.org.name == org and xPlayer.org.gradeorg == grade then
          xPlayer.setOrg(org, grade)
        end

      end

      cb()
    end
  )

end)

ESX.RegisterServerCallback('esx_organisation:getOnlinePlayers', function(source, cb)

  local xPlayers = ESX.GetPlayers()
  local players  = {}

  for i=1, #xPlayers, 1 do

    local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

    table.insert(players, {
      source     = xPlayer.source,
      identifier = xPlayer.identifier,
      name       = xPlayer.name,
      org        = xPlayer.org
    })

  end

  cb(players)

end)

ESX.RegisterServerCallback('esx_organisation:getVehiclesInGarage', function(source, cb, organisationName)

  local organisation = Getorganisation(organisationName)

  TriggerEvent('esx_datastore:getSharedDataStore', organisation.datastore, function(store)
    local garage = store.get('garage') or {}
    cb(garage)
  end)

end)

function WashMoneyCRON(d, h, m)

  MySQL.Async.fetchAll(
    'SELECT * FROM organisation_moneywash',
    {},
    function(result)

      local xPlayers = ESX.GetPlayers()

      for i=1, #result, 1 do

        local foundPlayer = false
        local xPlayer     = nil
        local organisation     = Getorganisation(result[i].organisation)

        for j=1, #xPlayers, 1 do
          local xPlayer2 = ESX.GetPlayerFromId(xPlayers[j])
          if xPlayer2.identifier == result[i].identifier then
            foundPlayer = true
            xPlayer     = xPlayer2
          end
        end

        TriggerEvent('esx_addonaccount:getSharedAccount', organisation.account, function(account)
          account.addMoney(result[i].amount)
        end)

        if foundPlayer then
          TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_have_laundered') .. result[i].amount)
        end

        MySQL.Async.execute(
          'DELETE FROM organisation_moneywash WHERE id = @id',
          {
            ['@id'] = result[i].id
          }
        )

      end

    end
  )

end

TriggerEvent('cron:runAt', 18, 30, WashMoneyCRON)
