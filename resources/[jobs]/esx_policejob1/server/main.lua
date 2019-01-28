ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
	TriggerEvent('esx_service:activateService', 'police', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'police', _('alert_police'), true, true)
TriggerEvent('esx_society:registerSociety', 'police', 'police', 'society_police', 'society_police', 'society_police', {type = 'private'})

--------------------------------------------- Caution -----------------------------------------------------------------
--[[
RegisterServerEvent('esx_policejob:Takecaution')
AddEventHandler('esx_policejob:Takecaution', function(Caution)

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeBank(Caution)
	TriggerClientEvent('esx:showNotification', _source, 'Vous avez été prélevées de ~g~$' .. Caution .. ' ~w~pour la caution')

end)

RegisterServerEvent('esx_policejob:Caution900')
AddEventHandler('esx_policejob:Caution900', function(Caution)

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.addBank(Caution)
	TriggerClientEvent('esx:showNotification', _source, 'Vous avez reçu un virement  de ~g~$' .. Caution .. ' ~w~pour la caution')
	
end)

RegisterServerEvent('esx_policejob:Caution800')
AddEventHandler('esx_policejob:Caution800', function(Caution)

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.addBank(Caution)
	TriggerClientEvent('esx:showNotification', _source, 'Vous avez reçu un virement  de ~g~$' .. Caution .. ' ~w~pour la caution')
	
end)

RegisterServerEvent('esx_policejob:Caution700')
AddEventHandler('esx_policejob:Caution700', function(Caution)

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.addBank(Caution)
	TriggerClientEvent('esx:showNotification', _source, 'Vous avez reçu un virement  de ~g~$' .. Caution .. ' ~w~pour la caution')
	
end)

RegisterServerEvent('esx_policejob:Caution0')
AddEventHandler('esx_policejob:Caution0', function(Caution)

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerClientEvent('esx:showNotification', _source, 'Vous avez reçu un virement  de ~g~$' .. Caution .. '~w~pour la caution')
	
end)
]]

ESX.RegisterServerCallback('esx_policejob:getItemAmount', function(source, cb, item)
  local xPlayer = ESX.GetPlayerFromId(source)
  local qtty = xPlayer.getInventoryItem(item).count
  cb(qtty)
end)

RegisterServerEvent('esx_policejob:giveWeapon')
AddEventHandler('esx_policejob:giveWeapon', function(weapon, ammo)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.addWeapon(weapon, ammo)
end)

RegisterServerEvent('esx_policejob:OutVehicle')
 AddEventHandler('esx_policejob:OutVehicle', function(target)
     TriggerClientEvent('esx_policejob:OutVehicle', target)
 end)

RegisterServerEvent('esx_policejob:confiscatePlayerItem')
AddEventHandler('esx_policejob:confiscatePlayerItem', function(target, itemType, itemName, amount)
	local _source = source
	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

  if itemType == 'item_standard' then
    
		local label = sourceXPlayer.getInventoryItem(itemName).label

		if (itemName == "weapon" or itemName == "dmv" or itemName == "drive"  or itemName == "drive_bike" or itemName == "drive_truck") then
			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, "Tu peux lui prendre sa licence par l'autre menu")
		else
			targetXPlayer.removeInventoryItem(itemName, amount)
			sourceXPlayer.addInventoryItem(itemName, amount)

		  TriggerClientEvent('esx:showNotification', sourceXPlayer.source, _('you_have_confinv') .. amount .. ' ' .. label .. _('from') .. targetXPlayer.name)
      TriggerClientEvent('esx:showNotification', targetXPlayer.source, '~b~' .. sourceXPlayer.name .. _('confinv') .. amount .. ' ' .. label )
      --Assaut
      if itemName == 'arme_ak' then 
        xPlayer.removeWeapon("WEAPON_ASSAULTRIFLE") 
      end
    
      if itemName == 'arme_g36c' then 
        xPlayer.removeWeapon("WEAPON_SPECIALCARBINE") 
      end
    
      if itemName == 'arme_ak74u' then 
        xPlayer.removeWeapon("WEAPON_COMPACTRIFLE") 
      end
    
      --Pistolet
      if itemName == 'arme_heavy' then 
        xPlayer.removeWeapon("WEAPON_HEAVYPISTOL") 
      end
    
      if itemName == 'arme_sns'then 
        xPlayer.removeWeapon("WEAPON_SNSPISTOL") 
      end
    
      if itemName == 'arme_heavyr' then 
        xPlayer.removeWeapon("WEAPON_REVOLVER") 
      end
    
      if itemName == 'arme_combat' then
        xPlayer.removeWeapon("WEAPON_COMBATPISTOL") 
      end
    
      if itemName == 'arme_pistol50' then 
        xPlayer.removeWeapon("WEAPON_PISTOL50") 
      end
    
      if itemName == 'arme_apistol ' then 
        xPlayer.removeWeapon("WEAPON_APPISTOL") 
      end
    
      --Spécial
      if itemName == 'arme_tazer' then
        xPlayer.removeWeapon("WEAPON_STUNGUN") 
      end
    
      if itemName == 'arme_flaregun' then
        xPlayer.removeWeapon("WEAPON_FLAREGUN") 
      end
    
      --SMG
      if itemName == 'arme_uzi' then 
        xPlayer.removeWeapon("WEAPON_MICROSMG") 
      end
    
      if itemName == 'arme_gusenberg ' then 
        xPlayer.removeWeapon("WEAPON_GUSENBERG") 
      end   
    
      if itemName == 'arme_mp5' then 
        xPlayer.removeWeapon("WEAPON_SMG") 
      end  
    
      if itemName == 'arme_assaut' then 
        xPlayer.removeWeapon("WEAPON_ASSAULTSMG") 
      end  
    
      --PEPOM
      if itemName == 'arme_pompe1' then 
        xPlayer.removeWeapon("WEAPON_PUMPSHOTGUN") 
      end
      --[[
      if itemName == 'arme_pompe2' then 
          xPlayer.removeWeapon("WEAPON_BULLPUPSHOTGUN") 
      end
    
      if itemName == 'arme_pompe3' then 
          xPlayer.removeWeapon("WEAPON_ASSAULTSHOTGUN") 
      end
    
      if itemName == 'arme_pompe4' then 
          xPlayer.removeWeapon("WEAPON_SAWNOFFSHOTGUN") 
      end
    
      if itemName == 'arme_musket' then 
          xPlayer.removeWeapon("WEAPON_MUSKET") 
      end
      ]]
      --Mélée
      if itemName == 'arme_flashlight' then 
          xPlayer.removeWeapon("WEAPON_FLASHLIGHT") 
      end
    
      if itemName == 'arme_bat' then 
        xPlayer.removeWeapon("WEAPON_BAT") 
      end
    
      if itemName == 'arme_knuckle' then 
        xPlayer.removeWeapon("WEAPON_KNUCKLE") 
      end
    
      if itemName == 'arme_machette' then 
        xPlayer.removeWeapon("WEAPON_MACHETE") 
      end
    
      if itemName == 'arme_knife' then
        xPlayer.removeWeapon("WEAPON_KNIFE") 
      end
    
      if itemName == 'arme_switchblade' then
        xPlayer.removeWeapon("WEAPON_SWITCHBLADE")
      end
    
      if itemName == 'arme_matraque' then
        xPlayer.removeWeapon("WEAPON_NIGHTSTICK") 
      end
      --[[
      if itemName == 'marteau' then
          xPlayer.removeWeapon("WEAPON_HAMMER") 
      end
    
      if itemName == 'hache' then
          xPlayer.removeWeapon("WEAPON_HATCHET") 
      end
      ]]
      --Sniper
      if itemName == 'arme_sniper' then
        xPlayer.removeWeapon("WEAPON_HEAVYSNIPER") 
      end
    
      --if itemName == 'sniper2' then
        --  xPlayer.removeWeapon("WEAPON_HEAVYSNIPER") 
      --end
    
      --Grenade
      if itemName == 'arme_molotov' then
        xPlayer.removeWeapon("WEAPON_MOLOTOV") 
      end
    
      if itemName == 'arme_fumigene' then
        xPlayer.removeWeapon("WEAPON_SMOKEGRENADE") 
      end
    
      if itemName == 'arme_ball2b' then
        xPlayer.removeWeapon("WEAPON_BALL") 
      end
      
	  end
	end

	if itemType == 'item_account' then

		targetXPlayer.removeAccountMoney(itemName, amount)
		sourceXPlayer.addAccountMoney(itemName, amount)

		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, _('you_have_confdm') .. amount .. _('from') .. targetXPlayer.name)
		TriggerClientEvent('esx:showNotification', targetXPlayer.source, '~b~' .. sourceXPlayer.name .. _('confdm') .. amount)

	end

	if itemType == 'item_weapon' then

		targetXPlayer.removeWeapon(itemName)
		sourceXPlayer.addWeapon(itemName, amount)

		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, _('you_have_confweapon') .. ESX.GetWeaponLabel(itemName) .. _('from') .. targetXPlayer.name)
		TriggerClientEvent('esx:showNotification', targetXPlayer.source, '~b~' .. sourceXPlayer.name .. _('confweapon') .. ESX.GetWeaponLabel(itemName))

	end

end)

RegisterServerEvent('esx_policejob:handcuff')
AddEventHandler('esx_policejob:handcuff', function(target)
	TriggerClientEvent('esx_policejob:handcuff', target)
end)
RegisterServerEvent('esx_policejob:drag')
 AddEventHandler('esx_policejob:drag', function(target)
 	local _source = source
 	TriggerClientEvent('esx_policejob:drag', target, _source)
end)
 
RegisterServerEvent('esx_policejob:putInVehicle')
AddEventHandler('esx_policejob:putInVehicle', function(target)
	TriggerClientEvent('esx_policejob:putInVehicle', target)
end)

RegisterServerEvent('esx_policejob:getStockItem')
AddEventHandler('esx_policejob:getStockItem', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_police', function(inventory)

		local item = inventory.getItem(itemName)

		if item.count >= count then
			inventory.removeItem(itemName, count)
			xPlayer.addInventoryItem(itemName, count)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, 'Quantité invalide')
		end

		TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez retiré x' .. count .. ' ' .. item.label)

	end)

end)

RegisterServerEvent('esx_policejob:putStockItems')
AddEventHandler('esx_policejob:putStockItems', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_police', function(inventory)

		local item = inventory.getItem(itemName)

		if item.count >= 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, 'Quantité invalide')
		end

    TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez ajouté x' .. count .. ' ' .. item.label)
    --fusil d'assaut
    if itemName == 'arme_ak' then 
      xPlayer.removeWeapon("WEAPON_ASSAULTRIFLE") 
    end
  
    if itemName == 'arme_g36c' then 
      xPlayer.removeWeapon("WEAPON_SPECIALCARBINE") 
    end
  
    if itemName == 'arme_ak74u' then 
      xPlayer.removeWeapon("WEAPON_COMPACTRIFLE") 
    end
  
    --Pistolet
    if itemName == 'arme_heavy' then 
      xPlayer.removeWeapon("WEAPON_HEAVYPISTOL") 
    end
  
    if itemName == 'arme_sns'then 
      xPlayer.removeWeapon("WEAPON_SNSPISTOL") 
    end
  
    if itemName == 'arme_heavyr' then 
      xPlayer.removeWeapon("WEAPON_REVOLVER") 
    end
  
    if itemName == 'arme_combat' then
      xPlayer.removeWeapon("WEAPON_COMBATPISTOL") 
    end
  
    if itemName == 'arme_pistol50' then 
      xPlayer.removeWeapon("WEAPON_PISTOL50") 
    end
  
    if itemName == 'arme_apistol ' then 
      xPlayer.removeWeapon("WEAPON_APPISTOL") 
    end
  
    --Spécial
    if itemName == 'arme_tazer' then
      xPlayer.removeWeapon("WEAPON_STUNGUN") 
    end
  
    if itemName == 'arme_flaregun' then
      xPlayer.removeWeapon("WEAPON_FLAREGUN") 
    end
  
    --SMG
    if itemName == 'arme_uzi' then 
      xPlayer.removeWeapon("WEAPON_MICROSMG") 
    end
  
    if itemName == 'arme_gusenberg ' then 
      xPlayer.removeWeapon("WEAPON_GUSENBERG") 
    end   
  
    if itemName == 'arme_mp5' then 
      xPlayer.removeWeapon("WEAPON_SMG") 
    end  
  
    if itemName == 'arme_assaut' then 
      xPlayer.removeWeapon("WEAPON_ASSAULTSMG") 
    end  
  
    --PEPOM
    if itemName == 'arme_pompe1' then 
      xPlayer.removeWeapon("WEAPON_PUMPSHOTGUN") 
    end
    --[[
    if itemName == 'arme_pompe2' then 
        xPlayer.removeWeapon("WEAPON_BULLPUPSHOTGUN") 
    end
  
    if itemName == 'arme_pompe3' then 
        xPlayer.removeWeapon("WEAPON_ASSAULTSHOTGUN") 
    end
  
    if itemName == 'arme_pompe4' then 
        xPlayer.removeWeapon("WEAPON_SAWNOFFSHOTGUN") 
    end
  
    if itemName == 'arme_musket' then 
        xPlayer.removeWeapon("WEAPON_MUSKET") 
    end
    ]]
    --Mélée
    if itemName == 'arme_flashlight' then 
        xPlayer.removeWeapon("WEAPON_FLASHLIGHT") 
    end
  
    if itemName == 'arme_bat' then 
      xPlayer.removeWeapon("WEAPON_BAT") 
    end
  
    if itemName == 'arme_knuckle' then 
      xPlayer.removeWeapon("WEAPON_KNUCKLE") 
    end
  
    if itemName == 'arme_machette' then 
      xPlayer.removeWeapon("WEAPON_MACHETE") 
    end
  
    if itemName == 'arme_knife' then
      xPlayer.removeWeapon("WEAPON_KNIFE") 
    end
  
    if itemName == 'arme_switchblade' then
      xPlayer.removeWeapon("WEAPON_SWITCHBLADE")
    end
  
    if itemName == 'arme_matraque' then
      xPlayer.removeWeapon("WEAPON_NIGHTSTICK") 
    end
    --[[
    if itemName == 'marteau' then
        xPlayer.removeWeapon("WEAPON_HAMMER") 
    end
  
    if itemName == 'hache' then
        xPlayer.removeWeapon("WEAPON_HATCHET") 
    end
    ]]
    --Sniper
    if itemName == 'arme_sniper' then
      xPlayer.removeWeapon("WEAPON_HEAVYSNIPER") 
    end
  
    --if itemName == 'sniper2' then
      --  xPlayer.removeWeapon("WEAPON_HEAVYSNIPER") 
    --end
  
    --Grenade
    if itemName == 'arme_molotov' then
      xPlayer.removeWeapon("WEAPON_MOLOTOV") 
    end
  
    if itemName == 'arme_fumigene' then
      xPlayer.removeWeapon("WEAPON_SMOKEGRENADE") 
    end
  
    if itemName == 'arme_ball2b' then
      xPlayer.removeWeapon("WEAPON_BALL") 
    end

	end)
end)

ESX.RegisterServerCallback('esx_policejob:getOtherPlayerData', function(source, cb, target)

  if Config.EnableESXIdentity then

    local xPlayer = ESX.GetPlayerFromId(target)

    local identifier = GetPlayerIdentifiers(target)[1]

    local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
      ['@identifier'] = identifier
    })

    local user      = result[1]
    local firstname     = user['firstname']
    local lastname      = user['lastname']
    local sex               = user['sex']
    local dob               = user['dateofbirth']
    local heightInit        = user['height']
    local height        = heightInit .. " cm"

    local data = {
      name        = GetPlayerName(target),
      job         = xPlayer.job,
      inventory   = xPlayer.inventory,
      accounts    = xPlayer.accounts,
      weapons     = xPlayer.loadout,
      firstname   = firstname,
      lastname    = lastname,
      sex           = sex,
      dob           = dob,
      height        = height
    }

    TriggerEvent('esx_status:getStatus', target, 'drunk', function(status)

      if status ~= nil then
        data.drunk = math.floor(status.percent)
      end

    end)

    if Config.EnableLicenses then

      TriggerEvent('esx_license:getLicenses', target, function(licenses)
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
      job        = xPlayer.job,
      inventory  = xPlayer.inventory,
      accounts   = xPlayer.accounts,
      weapons    = xPlayer.loadout
    }

    TriggerEvent('esx_status:getStatus', target, 'drunk', function(status)

      if status ~= nil then
        data.drunk = status.getPercent()
      end

    end)

    TriggerEvent('esx_license:getLicenses', target, function(licenses)
      data.licenses = licenses
    end)

    cb(data)

  end

end)

ESX.RegisterServerCallback('esx_policejob:getFineList', function(source, cb, category)

	MySQL.Async.fetchAll(
		'SELECT * FROM fine_types WHERE category = @category',
		{
			['@category'] = category
		},
		function(fines)
			cb(fines)
		end
	)

end)

ESX.RegisterServerCallback('esx_policejob:getVehicleInfos', function(source, cb, plate)
	if Config.EnableESXIdentity then

		MySQL.Async.fetchAll(
			'SELECT * FROM owned_vehicles',
			{},
			function(result)
			
			local foundIdentifier = nil

			for i=1, #result, 1 do
				
				local vehicleData = json.decode(result[i].vehicle)

				if vehicleData.plate == plate then
					foundIdentifier = result[i].owner
					break
				end

			end

			if foundIdentifier ~= nil then

				MySQL.Async.fetchAll(
            'SELECT * FROM users WHERE identifier = @identifier',
            {
              ['@identifier'] = foundIdentifier
            },
            function(result)

              local ownerName = result[1].firstname .. " " .. result[1].lastname

              local infos = {
                plate = plate,
                owner = ownerName
              }

              cb(infos)

            end
          )
			
			else

				local infos = {
					plate = plate
				}

				cb(infos)

				end

			end
		)

	else
		MySQL.Async.fetchAll(
      'SELECT * FROM owned_vehicles',
      {},
      function(result)

        local foundIdentifier = nil

        for i=1, #result, 1 do

          local vehicleData = json.decode(result[i].vehicle)

          if vehicleData.plate == plate then
            foundIdentifier = result[i].owner
            break
          end

        end

        if foundIdentifier ~= nil then

          MySQL.Async.fetchAll(
            'SELECT * FROM users WHERE identifier = @identifier',
            {
              ['@identifier'] = foundIdentifier
            },
            function(result)

              local infos = {
                plate = plate,
                owner = result[1].name
              }

              cb(infos)

            end
          )

        else

          local infos = {
          plate = plate
          }

          cb(infos)

        end

      end
    )

  end

end)

ESX.RegisterServerCallback('esx_policejob:getArmoryWeapons', function(source, cb)

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_police', function(store)

		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end

		cb(weapons)

	end)

end)

ESX.RegisterServerCallback('esx_policejob:addArmoryWeapon', function(source, cb, weaponName)

  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)

  xPlayer.removeWeapon(weaponName)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_police', function(store)

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

ESX.RegisterServerCallback('esx_policejob:removeArmoryWeapon', function(source, cb, weaponName)

  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)

  xPlayer.addWeapon(weaponName, 1000)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_police', function(store)

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



ESX.RegisterServerCallback('esx_policejob:buy', function(source, cb, amount)
	
	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_police', function(account)

		if account.money >= amount then
			account.removeMoney(amount)
			cb(true)
		else
			cb(false)
		end

	end)

end)

ESX.RegisterServerCallback('esx_policejob:getStockItems', function(source, cb)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_police', function(inventory)
		cb(inventory.items)
	end)

end)

ESX.RegisterServerCallback('esx_policejob:getPlayerInventory', function(source, cb)

	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
	local items   = xPlayer.inventory

	cb({
		items = items
	})

end)

 ---------------------------------- Retirer les licenses --------------------------------
function deleteLicense(owner, license)
    MySQL.Sync.execute("DELETE FROM user_licenses WHERE `owner` = @owner AND `type` = @license", {
        ['@owner'] = owner,
        ['@license'] = license,
    })
    print('Permis suppr - '..owner)
    print('Permis suppr - '..license)
  
end

RegisterServerEvent('esx_policejob:deletelicense')
AddEventHandler('esx_policejob:deletelicense', function(target, license)
  local text = ""
  local _source = source
  local sourceXPlayer = ESX.GetPlayerFromId(_source)
  local targetXPlayer = ESX.GetPlayerFromId(target)

  if(license =="weapon")then
    text= "Permis de port d'arme"
  end
  if(license =="dmv")then
    text = "Code de la route"
  end
  if(license =="drive")then
    text= "Permis de conduire"
  end
  if(license =="drive_bike")then
    text= "Permis moto"
  end
  if(license =="drive_truck")then
    text="Permis camion"
  end

  TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous avez ~r~supprimé ~w~ : '..text..' de ~b~'..targetXPlayer.name )
  TriggerClientEvent('esx:showNotification', targetXPlayer.source, '~r~' .. sourceXPlayer.name .. ' vous a retiré : '.. text)

  local identifier = GetPlayerIdentifiers(target)[1]

  deleteLicense(identifier,license)
end)


----------------------------------------- Prison -----------------------------------------------

RegisterServerEvent('esx_policejob:AddPlayer')
AddEventHandler('esx_policejob:AddPlayer', function(prisonier, time)
  local _source = source
  TriggerClientEvent("Jail", prisonier, time)
  TriggerClientEvent('chatMessage', -1, 'Pénitencier', { 0, 0, 0 }, GetPlayerName(prisonier) ..' emprisonné pour '.. time ..' secondes')
end)

RegisterServerEvent('esx_policejob:UnjailPlayer')
AddEventHandler('esx_policejob:UnjailPlayer', function(prisonier)
  local _source = source
  TriggerClientEvent("UnJail", prisonier)
  TriggerClientEvent('chatMessage', -1, 'Pénitencier', { 0, 0, 0 }, "Libération de ".. GetPlayerName(prisonier) ..' par '.. GetPlayerName(_source))
end)

RegisterServerEvent('esx_policejob:FreePlayer')
AddEventHandler('esx_policejob:FreePlayer', function(name)
  local _source = source
  TriggerClientEvent('chatMessage', -1, 'Pénitencier', { 0, 0, 0 }, name ..' a été libéré de prison !')
end)

----------------------------------------- items --------------------------------------------------

--item tenue swat
ESX.RegisterUsableItem('tenu_swat1', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    
        TriggerClientEvent('esx_tenues:settenueswt1', _source)
end)