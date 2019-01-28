local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local PlayerData              = {}
local GUI                     = {}
local HasAlreadyEnteredMarker = false
local LastZone                = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local OnJob                   = false
local TargetCoords            = nil
local CurrentlyTowedVehicle   = nil
local IsInShopMenu            = true
local Categories              = {}
local Vehicles                = {}
local LastVehicles            = {}
local CurrentVehicleData      = nil
local Blips                   = {}
local NPCOnJob                = false
local NPCTargetTowable         = nil
local NPCTargetTowableZone     = nil
local NPCHasSpawnedTowable    = false
local NPCLastCancel           = GetGameTimer() - 5 * 60000
local NPCHasBeenNextToTowable = false
local NPCTargetDeleterZone    = false
ESX                           = nil
GUI.Time                      = 0

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(1)
  end

  ESX.TriggerServerCallback('esx_bikershop:getCategories', function (categories)
    Categories = categories
  end)

  ESX.TriggerServerCallback('esx_bikershop:getVehicles', function (vehicles)
    Vehicles = vehicles
  end)
end)

function Message()
	Citizen.CreateThread(function()
    while messagenotfinish do
    		Citizen.Wait(1)

			DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "", "", "", "", 30)
		    while (UpdateOnscreenKeyboard() == 0) do
		        DisableAllControlActions(0);
		       Citizen.Wait(1)
		    end
		    if (GetOnscreenKeyboardResult()) then
		        local result = GetOnscreenKeyboardResult()
		        messagenotfinish = false
		       TriggerServerEvent('esx_bikershop:annonce',result)
		        
		    end


		end
	end)
	
end


function DeleteShopInsideVehicles ()
  while #LastVehicles > 0 do
    local vehicle = LastVehicles[1]
    ESX.Game.DeleteVehicle(vehicle)
    table.remove(LastVehicles, 1)
  end
end

function SelectRandomTowable()

  local index = GetRandomIntInRange(1,  #Config.Towables)

  for k,v in pairs(Config.Zones) do
    if v.Pos.x == Config.Towables[index].x and v.Pos.y == Config.Towables[index].y and v.Pos.z == Config.Towables[index].z then
      return k
    end
  end

end

function StartNPCJob()

  NPCOnJob = true

  NPCTargetTowableZone = SelectRandomTowable()
  local zone       = Config.Zones[NPCTargetTowableZone]

  Blips['NPCTargetTowableZone'] = AddBlipForCoord(zone.Pos.x,  zone.Pos.y,  zone.Pos.z)
  SetBlipRoute(Blips['NPCTargetTowableZone'], true)

  ESX.ShowNotification(_U('drive_to_indicated'))
end

function StopNPCJob(cancel)

  if Blips['NPCTargetTowableZone'] ~= nil then
    RemoveBlip(Blips['NPCTargetTowableZone'])
    Blips['NPCTargetTowableZone'] = nil
  end

  if Blips['NPCDelivery'] ~= nil then
    RemoveBlip(Blips['NPCDelivery'])
    Blips['NPCDelivery'] = nil
  end


  Config.Zones.VehicleDelivery.Type = -1

  NPCOnJob                = false
  NPCTargetTowable        = nil
  NPCTargetTowableZone    = nil
  NPCHasSpawnedTowable    = false
  NPCHasBeenNextToTowable = false

  if cancel then
    ESX.ShowNotification(_U('mission_canceled'))
  else
    TriggerServerEvent('esx_bikershop:onNPCJobCompleted')
  end

end

function OpenShopMenu ()
  IsInShopMenu = true

  ESX.UI.Menu.CloseAll()

  local playerPed = GetPlayerPed(-1)

  FreezeEntityPosition(playerPed, true)
  SetEntityVisible(playerPed, false)
  SetEntityCoords(playerPed, Config.Zones.ShopInside.Pos.x, Config.Zones.ShopInside.Pos.y, Config.Zones.ShopInside.Pos.z)

  local vehiclesByCategory = {}
  local elements           = {}
  local firstVehicleData   = nil

  for i=1, #Categories, 1 do
    vehiclesByCategory[Categories[i].name] = {}
  end

  for i=1, #Vehicles, 1 do
    table.insert(vehiclesByCategory[Vehicles[i].category], Vehicles[i])
  end

  for i=1, #Categories, 1 do
    local category         = Categories[i]
    local categoryVehicles = vehiclesByCategory[category.name]
    local options          = {}

    for j=1, #categoryVehicles, 1 do
      local vehicle = categoryVehicles[j]

      if i == 1 and j == 1 then
        firstVehicleData = vehicle
      end

      table.insert(options, vehicle.name .. ' $' .. vehicle.price)
    end

    table.insert(elements, {
      name    = category.name,
      label   = category.label,
      value   = 0,
      type    = 'slider',
      max     = #Categories[i],
      options = options
    })
  end

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'vehicle_shop',
    {
      title    = 'BikeShop',
      align    = 'top-left',
      elements = elements,
    },
    function (data, menu)
      local vehicleData = vehiclesByCategory[data.current.name][data.current.value + 1]

      ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'shop_confirm',
        {
          title = _U('buy') .. ' ' .. vehicleData.name .. ' ' .. _U('for') .. ' ' .. vehicleData.price .. ' ?',
          align = 'top-left',
          elements = {
            {label = _U('yes'), value = 'yes'},
            {label = _U('no'), value = 'no'},
          },
        },
        function (data2, menu2)
          if data2.current.value == 'yes' then
            if Config.EnablePlayerManagement then
              ESX.TriggerServerCallback('esx_bikershop:buyVehicleSociety', function (hasEnoughMoney)
                if hasEnoughMoney then
                  IsInShopMenu = false

                  DeleteShopInsideVehicles()

                  local playerPed = GetPlayerPed(-1)

                  CurrentAction     = 'shop_menu'
                  CurrentActionMsg  = _U('shop_menu')
                  CurrentActionData = {}

                  FreezeEntityPosition(playerPed, false)
                  SetEntityVisible(playerPed, true)
                  SetEntityCoords(playerPed, Config.Zones.BossActions.Pos.x, Config.Zones.BossActions.Pos.y, Config.Zones.BossActions.Pos.z)

                  menu2.close()
                  menu.close()

                  ESX.ShowNotification(_U('vehicle_purchased'))
                else
                  ESX.ShowNotification(_U('broke_company'))
                end

              end, 'biker', vehicleData.model)
            else
              local playerData = ESX.GetPlayerData()

              if Config.EnableSocietyOwnedVehicles and playerData.job.grade_name == 'boss' then
                ESX.UI.Menu.Open(
                  'default', GetCurrentResourceName(), 'shop_confirm_buy_type',
                  {
                    title = 'Type d\'achat',
                    align = 'top-left',
                    elements = {
                      {label = 'Personnel', value = 'personnal'},
                      {label = 'Societé',   value = 'society'},
                    },
                  },
                  function (data3, menu3)

                    if data3.current.value == 'personnal' then
                      ESX.TriggerServerCallback('esx_bikershop:buyVehicle', function (hasEnoughMoney)
                        if hasEnoughMoney then
                          IsInShopMenu = false

                          menu3.close()
                          menu2.close()
                          menu.close()

                          DeleteShopInsideVehicles()

                          ESX.Game.SpawnVehicle(vehicleData.model, {
                            x = Config.Zones.ShopOutside.Pos.x,
                            y = Config.Zones.ShopOutside.Pos.y,
                            z = Config.Zones.ShopOutside.Pos.z
                          }, Config.Zones.ShopOutside.Heading, function (vehicle)

                            TaskWarpPedIntoVehicle(playerPed, vehicle, -1)

                            local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)

                            if Config.EnableOwnedVehicles then
                              TriggerServerEvent('esx_bikershop:setVehicleOwned', vehicleProps)
                            end

                            ESX.ShowNotification(_U('vehicle_purchased'))
                          end)

                          FreezeEntityPosition(playerPed, false)
                          SetEntityVisible(playerPed, true)
                        else
                          ESX.ShowNotification(_U('not_enough_money'))
                        end
                      end, vehicleData.model)
                    end

                    if data3.current.value == 'society' then
                      ESX.TriggerServerCallback('esx_bikershop:buyVehicleSociety', function (hasEnoughMoney)
                        if hasEnoughMoney then

                          IsInShopMenu = false

                          menu3.close()
                          menu2.close()
                          menu.close()

                          DeleteShopInsideVehicles()

                          ESX.Game.SpawnVehicle(vehicleData.model, {
                            x = Config.Zones.ShopOutside.Pos.x,
                            y = Config.Zones.ShopOutside.Pos.y,
                            z = Config.Zones.ShopOutside.Pos.z
                          }, Config.Zones.ShopOutside.Heading, function (vehicle)

                            TaskWarpPedIntoVehicle(playerPed, vehicle, -1)

                            local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)

                            TriggerServerEvent('esx_bikershop:setVehicleOwnedSociety', playerData.job.name, vehicleProps)

                            ESX.ShowNotification(_U('vehicle_purchased'))

                          end)

                          FreezeEntityPosition(playerPed, false)
                          SetEntityVisible(playerPed, true)
                        else
                          ESX.ShowNotification(_U('broke_company'))
                        end
                      end, playerData.job.name, vehicleData.model)
                    end
                  end,
                  function (data3, menu3)
                    menu3.close()
                  end
                )
              else
                ESX.TriggerServerCallback('esx_bikershop:buyVehicle', function (hasEnoughMoney)
                  if hasEnoughMoney then

                    IsInShopMenu = false

                    menu2.close()
                    menu.close()

                    DeleteShopInsideVehicles()

                    ESX.Game.SpawnVehicle(vehicleData.model, {
                      x = Config.Zones.ShopOutside.Pos.x,
                      y = Config.Zones.ShopOutside.Pos.y,
                      z = Config.Zones.ShopOutside.Pos.z
                    }, Config.Zones.ShopOutside.Heading, function (vehicle)

                      TaskWarpPedIntoVehicle(playerPed, vehicle, -1)

                      local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)

                      if Config.EnableOwnedVehicles then
                        TriggerServerEvent('esx_bikershop:setVehicleOwned', vehicleProps)
                      end

                      ESX.ShowNotification(_U('vehicle_purchased'))
                    end)

                    FreezeEntityPosition(playerPed, false)
                    SetEntityVisible(playerPed, true)
                  else
                    ESX.ShowNotification(_U('not_enough_money'))
                  end
                end, vehicleData.model)
              end
            end
          end

          if data2.current.value == 'no' then

          end

        end,
        function (data2, menu2)
          menu2.close()
        end
      )

    end,
    function (data, menu)

      menu.close()

      DeleteShopInsideVehicles()

      local playerPed = GetPlayerPed(-1)

      CurrentAction     = 'shop_menu'
      CurrentActionMsg  = _U('shop_menu')
      CurrentActionData = {}

      FreezeEntityPosition(playerPed, false)
      SetEntityVisible(playerPed, true)

      if Config.EnablePlayerManagement then
        SetEntityCoords(playerPed, Config.Zones.ShopEntering.Pos.x, Config.Zones.ShopEntering.Pos.y, Config.Zones.ShopEntering.Pos.z)
      end

      IsInShopMenu = false

    end,
    function (data, menu)
      local vehicleData = vehiclesByCategory[data.current.name][data.current.value + 1]
      local playerPed   = GetPlayerPed(-1)

      DeleteShopInsideVehicles()

      ESX.Game.SpawnLocalVehicle(vehicleData.model, {
        x = Config.Zones.ShopInside.Pos.x,
        y = Config.Zones.ShopInside.Pos.y,
        z = Config.Zones.ShopInside.Pos.z
      }, Config.Zones.ShopInside.Heading, function(vehicle)
        table.insert(LastVehicles, vehicle)
        TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
        FreezeEntityPosition(vehicle, true)
      end)
    end
  )

  DeleteShopInsideVehicles()

  ESX.Game.SpawnLocalVehicle(firstVehicleData.model, {
    x = Config.Zones.ShopInside.Pos.x,
    y = Config.Zones.ShopInside.Pos.y,
    z = Config.Zones.ShopInside.Pos.z
  }, Config.Zones.ShopInside.Heading, function (vehicle)
    table.insert(LastVehicles, vehicle)
    TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
    FreezeEntityPosition(vehicle, true)
  end)

end

function OpenResellerMenu ()

  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'reseller',
    {
      title    = _U('car_dealer'),
      align    = 'top-left',
      elements = {
        {label = _U('pop_vehicle'),                    value = 'pop_vehicle'},
        {label = _U('depop_vehicle'),                  value = 'depop_vehicle'},
        {label = _U('create_bill'),                    value = 'create_bill'},
        {label = _U('set_vehicle_owner_sell'),         value = 'set_vehicle_owner_sell'},
        {label = _U('set_vehicle_owner_sell_society'), value = 'set_vehicle_owner_sell_society'},
      }
    },
    function (data, menu)

      if data.current.value == 'pop_vehicle' then
        OpenPopVehicleMenu()
      end

      if data.current.value == 'depop_vehicle' then
        DeleteShopInsideVehicles()
      end

      if data.current.value == 'create_bill' then

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'set_vehicle_owner_sell_amount',
          {
            title = _U('invoice_amount'),
          },
          function (data2, menu)

            local amount = tonumber(data2.value)

            if amount == nil then
              ESX.ShowNotification(_U('invoice_amount'))
            else
              menu.close()

              local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

              if closestPlayer == -1 or closestDistance > 3.0 then
                ESX.ShowNotification(_U('invoice_amount'))
              else
                TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_biker', _U('car_dealer'), tonumber(data2.value))
              end
            end
          end,
          function (data2, menu)
            menu.close()
          end
        )
      end

      if data.current.value == 'set_vehicle_owner_sell' then
        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

        if closestPlayer == -1 or closestDistance > 3.0 then
          ESX.ShowNotification(_U('no_players'))
        else
          SetVehicleNumberPlateText(LastVehicles[#LastVehicles], string.upper(ESX.GetRandomString(8)))
          local vehicleProps = ESX.Game.GetVehicleProperties(LastVehicles[#LastVehicles])
          local model        = CurrentVehicleData.model

          TriggerServerEvent('esx_bikershop:sellVehicle', model)

          if Config.EnableOwnedVehicles then
            TriggerServerEvent('esx_bikershop:setVehicleOwnedPlayerId', GetPlayerServerId(closestPlayer), vehicleProps)
            ESX.ShowNotification(_U('vehicle_set_owned', vehicleProps.plate, GetPlayerName(closestPlayer)))
          else
            ESX.ShowNotification(_U('vehicle_sold_to', vehicleProps.plate, GetPlayerName(closestPlayer)))
          end
        end
      end

      if data.current.value == 'set_vehicle_owner_sell_society' then
        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

        if closestPlayer == -1 or closestDistance > 3.0 then
          ESX.ShowNotification(_U('no_players'))
        else
          SetVehicleNumberPlateText(LastVehicles[#LastVehicles], string.upper(ESX.GetRandomString(8)))
          ESX.TriggerServerCallback('esx:getOtherPlayerData', function (xPlayer)
            local vehicleProps = ESX.Game.GetVehicleProperties(LastVehicles[#LastVehicles])
            local model        = CurrentVehicleData.model

            TriggerServerEvent('esx_bikershop:sellVehicle', model)

            if Config.EnableSocietyOwnedVehicles then
              TriggerServerEvent('esx_bikershop:setVehicleOwnedSociety', xPlayer.job.name, vehicleProps)
              ESX.ShowNotification(_U('vehicle_set_owned', vehicleProps.plate, GetPlayerName(closestPlayer)))
            else
              ESX.ShowNotification(_U('vehicle_sold_to', vehicleProps.plate, GetPlayerName(closestPlayer)))
            end
          end, GetPlayerServerId(closestPlayer))
        end
      end
    end,
    function (data, menu)
      menu.close()

      CurrentAction     = 'reseller_menu'
      CurrentActionMsg  = _U('shop_menu')
      CurrentActionData = {}
    end
  )

end

function OpenPersonnalVehicleMenu ()

  ESX.UI.Menu.CloseAll()

  ESX.TriggerServerCallback('esx_bikershop:getPersonnalVehicles', function (vehicles)
    local elements = {}

    for i=1, #vehicles, 1 do
      for j=1, #Vehicles, 1 do
        if vehicles[i].model == GetHashKey(Vehicles[j].model) then
          vehicles[i].name = Vehicles[j].name
        end
      end
    end

    for i=1, #vehicles, 1 do
      table.insert(elements, {label = vehicles[i].name .. ' [' .. vehicles[i].plate .. ']', value = vehicles[i]})
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'personnal_vehicle',
      {
        title    = _U('personal_vehicle'),
        align    = 'top-left',
        elements = elements,
      },
      function (data, menu)
        local playerPed   = GetPlayerPed(-1)
        local coords      = GetEntityCoords(playerPed)
        local heading     = GetEntityHeading(playerPed)
        local vehicleData = data.current.value

        menu.close()

        ESX.Game.SpawnVehicle(vehicleData.model, {
          x = coords.x,
          y = coords.y,
          z = coords.z
        }, heading, function (vehicle)
          ESX.Game.SetVehicleProperties(vehicle, vehicleData)
          TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
        end)
      end,
      function (data, menu)
        menu.close()
      end
    )
  end)
end

function OpenPopVehicleMenu ()
  ESX.TriggerServerCallback('esx_bikershop:getCommercialVehicles', function (vehicles)
    local elements = {}

    for i=1, #vehicles, 1 do
      table.insert(elements, {label = vehicles[i].name .. ' $' .. vehicles[i].price, value = vehicles[i].name})
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'commercial_vehicles',
      {
        title    = _U('vehicle_dealer'),
        align    = 'top-left',
        elements = elements,
      },
      function (data, menu)
        local model = data.current.value

        DeleteShopInsideVehicles()

        ESX.Game.SpawnVehicle(model, {
          x = Config.Zones.ShopInside.Pos.x,
          y = Config.Zones.ShopInside.Pos.y,
          z = Config.Zones.ShopInside.Pos.z
        }, Config.Zones.ShopInside.Heading, function (vehicle)

          table.insert(LastVehicles, vehicle)

          for i=1, #Vehicles, 1 do
            if model == Vehicles[i].model then
              CurrentVehicleData = Vehicles[i]
            end
          end
        end)
      end,
      function (data, menu)
        menu.close()
      end
    )
  end)
end

function OpenBikerActionsMenu()
 
  local elements = {
    {label = _U('vehicle_list'), value = 'vehicle_list'},
    {label = _U('work_wear'), value = 'cloakroom'},
    {label = _U('civ_wear'), value = 'cloakroom2'},
    {label = _U('deposit_stock'), value = 'put_stock'},
    {label = _U('withdraw_stock'), value = 'get_stock'}
  }
  if Config.EnablePlayerManagement and PlayerData.job ~= nil and PlayerData.job.grade_name == 'boss' then
  	table.insert(elements, {label = 'Déposer Argent sale / Armes', value = 'put_black_money'})
  	table.insert(elements, {label = 'Prendre Argent sale / Armes', value = 'get_black_money'})
    table.insert(elements, {label = _U('buy_vehicle'), value = 'buy_vehicle'})
    table.insert(elements, {label = _U('boss_actions'), value = 'boss_actions'})
  end

  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'biker_actions',
    {
      title    = _U('mechanic'),
      elements = elements
    },
    function(data, menu)

      if data.current.value == 'buy_vehicle' then
        OpenShopMenu()
      end

      if data.current.value == 'vehicle_list' then

        if Config.EnableSocietyOwnedVehicles then

            local elements = {}

            ESX.TriggerServerCallback('esx_society:getVehiclesInGarage', function(vehicles)

              for i=1, #vehicles, 1 do
                table.insert(elements, {label = GetDisplayNameFromVehicleModel(vehicles[i].model) .. ' [' .. vehicles[i].plate .. ']', value = vehicles[i]})
              end

              ESX.UI.Menu.Open(
                'default', GetCurrentResourceName(), 'vehicle_spawner',
                {
                  title    = _U('service_vehicle'),
                  align    = 'top-left',
                  elements = elements,
                },
                function(data, menu)

                  menu.close()

                  local vehicleProps = data.current.value

                  ESX.Game.SpawnVehicle(vehicleProps.model, Config.Zones.VehicleSpawnPoint.Pos, 270.0, function(vehicle)
                    ESX.Game.SetVehicleProperties(vehicle, vehicleProps)
                    local playerPed = GetPlayerPed(-1)
                    TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)
                  end)

                  TriggerServerEvent('esx_society:removeVehicleFromGarage', 'biker', vehicleProps)

                end,
                function(data, menu)
                  menu.close()
                end
              )

            end, 'biker')

          else

            local elements = {
              {label = _U('flat_bed'), value = 'flatbed'},
              {label = _U('tow_truck'), value = 'gburrito'}
            }

            if Config.EnablePlayerManagement and PlayerData.job ~= nil and
              (PlayerData.job.grade_name == 'boss') then
              table.insert(elements, {label = 'Akuma', value = 'akuma'})
            end

            ESX.UI.Menu.CloseAll()

            ESX.UI.Menu.Open(
              'default', GetCurrentResourceName(), 'spawn_vehicle',
              {
                title    = _U('service_vehicle'),
                elements = elements
              },
              function(data, menu)
                for i=1, #elements, 1 do
                  if Config.MaxInService == 5 then
                    ESX.Game.SpawnVehicle(data.current.value, Config.Zones.VehicleSpawnPoint.Pos, 90.0, function(vehicle)
                      local playerPed = GetPlayerPed(-1)
                      TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
                    end)
                    break
                  else
                    ESX.TriggerServerCallback('esx_service:enableService', function(canTakeService, maxInService, inServiceCount)
                      if canTakeService then
                        ESX.Game.SpawnVehicle(data.current.value, Config.Zones.VehicleSpawnPoint.Pos, 90.0, function(vehicle)
                          local playerPed = GetPlayerPed(-1)
                          TaskWarpPedIntoVehicle(playerPed,  vehicle, -1)
                        end)
                      else
                        ESX.ShowNotification(_U('service_full') .. inServiceCount .. '/' .. maxInService)
                      end
                    end, 'biker')
                    break
                  end
                end
                menu.close()
              end,
              function(data, menu)
                menu.close()
                OpenBikerActionsMenu()
              end
            )

          end
      end

     
       if data.current.value == 'cloakroom' then
       TriggerServerEvent("player:serviceOn", "biker") 
        menu.close()
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

            if skin.sex == 0 then
              
                local clothesSkin = {
                  ['tshirt_1'] = 45, ['tshirt_2'] = 0,
                  ['torso_1'] = 42, ['torso_2'] = 0,
                  ['decals_1'] = 0, ['decals_2'] = 0,
                  ['arms'] = 26,
                  ['pants_1'] = 76, ['pants_2'] = 0,
                  ['shoes_1'] = 7, ['shoes_2'] = 2,
                  ['helmet_1'] = 5, ['helmet_2'] = 0,
                  ['chain_1'] = 0, ['chain_2'] = 0,
                  ['ears_1'] = 2, ['ears_2'] = 0
                  } 
                TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

            else
              TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
            end

        end)
      end

      if data.current.value == 'cloakroom2' then
      TriggerServerEvent("player:serviceOff", "biker")	
        menu.close()
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

            TriggerEvent('skinchanger:loadSkin', skin)

        end)
      end

      if data.current.value == 'put_stock' then
        OpenPutStocksMenu()
      end

      if data.current.value == 'get_stock' then
        OpenGetStocksMenu()
      end

      if data.current.value == 'get_black_money' then
		  OpenGetBlackMoney()
		end

		if data.current.value == 'put_black_money' then
		   OpenPutBlackMoney()
		end

      if data.current.value == 'boss_actions' then
        TriggerEvent('esx_society:openBossMenu', 'biker', function(data, menu)
          menu.close()
        end)
      end

    end,
    function(data, menu)
      menu.close()
      CurrentAction     = 'biker_actions_menu'
      CurrentActionMsg  = _U('open_actions')
      CurrentActionData = {}
    end
  )
end

---------------------------------------------------------------------------------------------------
--------------------------------------Coffre argent sale / Armes -----------------------------------
----------------------------------------------------------------------------------------------------
function OpenGetBlackMoney()

  ESX.TriggerServerCallback('esx_bikeshop:getBlackMoneySociety', function(inventory)

    local elements = {}

    table.insert(elements, {label = 'Argent sale : ' .. inventory.blackMoney, type = 'item_account', value = 'black_money'})

    for i=1, #inventory.items, 1 do

      local item = inventory.items[i]

      if item.count > 0 then
        table.insert(elements, {label = item.label .. ' x' .. item.count, type = 'item_standard', value = item.name})
      end
    end

    for i=1, #inventory.weapons, 1 do
      local weapon = inventory.weapons[i]
      table.insert(elements, {label = ESX.GetWeaponLabel(weapon.name) .. ' [' .. weapon.ammo .. ']', type = 'item_weapon', value = weapon.name, ammo = weapon.ammo})
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'get_black_money',
      {
        title    = 'Inventaire',
        align    = 'top-left',
        elements = elements,
      },
      function(data, menu)
        if data.current.type == 'item_weapon' then
          menu.close()
          TriggerServerEvent('esx_bikeshop:getItem', data.current.type, data.current.value, data.current.ammo)
          ESX.SetTimeout(300, function()
            OpenGetBlackMoney()
          end)

        else
          ESX.UI.Menu.Open(
            'dialog', GetCurrentResourceName(), 'get_item_count',
            {
              title = 'Montant',
            },
            function(data2, menu)

              local quantity = tonumber(data2.value)

              if quantity == nil then
                ESX.ShowNotification('Montant invalide')
              else
                menu.close()
                TriggerServerEvent('esx_bikeshop:getItem', data.current.type, data.current.value, quantity)
                ESX.SetTimeout(300, function()
                  OpenGetBlackMoney()
                end)
              end
            end,
            function(data2,menu)
              menu.close()
            end
          )
        end
      end,
      function(data, menu)
        menu.close()
      end
    )
  end)
end

function OpenPutBlackMoney()

  ESX.TriggerServerCallback('esx_bikeshop:getPlayerInventory2', function(inventory)

    local elements = {}

    table.insert(elements, {label = 'Argent sale : ' .. inventory.blackMoney, type = 'item_account', value = 'black_money'})

    local playerPed  = GetPlayerPed(-1)
    local weaponList = ESX.GetWeaponList()

    for i=1, #weaponList, 1 do
      local weaponHash = GetHashKey(weaponList[i].name)

      if HasPedGotWeapon(playerPed,  weaponHash,  false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
        local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
        table.insert(elements, {label = weaponList[i].label .. ' [' .. ammo .. ']', type = 'item_weapon', value = weaponList[i].name, ammo = ammo})
      end
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'put_black_money',
      {
        title    = 'Inventaire',
        align    = 'top-left',
        elements = elements,
      },
      function(data, menu)

        if data.current.type == 'item_weapon' then

          menu.close()

          TriggerServerEvent('esx_bikeshop:putItem', data.current.type, data.current.value, data.current.ammo)

          ESX.SetTimeout(300, function()
            OpenPutBlackMoney()
          end)
        else

          ESX.UI.Menu.Open(
            'dialog', GetCurrentResourceName(), 'put_item_count',
            {
              title = 'Montant',
            },
            function(data2, menu)

              menu.close()

              TriggerServerEvent('esx_bikeshop:putItem', data.current.type, data.current.value, tonumber(data2.value))

              ESX.SetTimeout(300, function()
                OpenPutBlackMoney()
              end)

            end,
            function(data2,menu)
              menu.close()
            end
          )

        end

      end,
      function(data, menu)
        menu.close()
      end
    )
  end)
end



function OpenMobileBikerActionsMenu()

  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'mobile_biker_actions',
    {
      title    = _U('mechanic'),
      elements = {
        {label = _U('billing'),    value = 'billing'},
        {label = '--------', value = ''},
        {label = _U('hijack'),     value = 'hijack_vehicle'},
        {label = _U('repair'),       value = 'fix_vehicle'},
        {label = _U('clean'),      value = 'clean_vehicle'},
        {label = 'Mettre en garage',     value = 'del_vehicle'},
        {label = _U('flat_bed'),       value = 'dep_vehicle'},
        {label = '--------', value = ''},
        {label = 'Passer une annonce', value = 'announce'}
      }
    },
    function(data, menu)
      if data.current.value == 'billing' then
        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'billing',
          {
            title = _U('invoice_amount')
          },
          function(data, menu)
            local amount = tonumber(data.value)
            if amount == nil then
              ESX.ShowNotification(_U('amount_invalid'))
            else
              menu.close()
              local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
              if closestPlayer == -1 or closestDistance > 3.0 then
                ESX.ShowNotification(_U('no_players_nearby'))
              else
                TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_biker', _U('mechanic'), amount)
              end
            end
          end,
        function(data, menu)
          menu.close()
        end
        )
      end

      if data.current.value == 'hijack_vehicle' then

        local playerPed = GetPlayerPed(-1)
        local coords    = GetEntityCoords(playerPed)

        if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then

          local vehicle = nil

          if IsPedInAnyVehicle(playerPed, false) then
            vehicle = GetVehiclePedIsIn(playerPed, false)
          else
            vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
          end

          if DoesEntityExist(vehicle) then
            TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)
            Citizen.CreateThread(function()
              Citizen.Wait(10000)
              SetVehicleDoorsLocked(vehicle, 1)
              SetVehicleDoorsLockedForAllPlayers(vehicle, false)
              ClearPedTasksImmediately(playerPed)
              ESX.ShowNotification(_U('vehicle_unlocked'))
            end)
          end

        end

      end

      if data.current.value == 'fix_vehicle' then

        local playerPed = GetPlayerPed(-1)
        local coords    = GetEntityCoords(playerPed)

        if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then

          local vehicle = nil

          if IsPedInAnyVehicle(playerPed, false) then
            vehicle = GetVehiclePedIsIn(playerPed, false)
          else
            vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
          end

          if DoesEntityExist(vehicle) then
            TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_BUM_BIN", 0, true)
            Citizen.CreateThread(function()
              Citizen.Wait(20000)
              SetVehicleFixed(vehicle)
              SetVehicleDeformationFixed(vehicle)
              SetVehicleUndriveable(vehicle, false)
              SetVehicleEngineOn(vehicle,  true,  true)
              ClearPedTasksImmediately(playerPed)
              ESX.ShowNotification(_U('vehicle_repaired'))
            end)
          end
        end
      end

      if data.current.value == 'clean_vehicle' then

        local playerPed = GetPlayerPed(-1)
        local coords    = GetEntityCoords(playerPed)

        if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then

          local vehicle = nil

          if IsPedInAnyVehicle(playerPed, false) then
            vehicle = GetVehiclePedIsIn(playerPed, false)
          else
            vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
          end

          if DoesEntityExist(vehicle) then
            TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_MAID_CLEAN", 0, true)
            Citizen.CreateThread(function()
              Citizen.Wait(10000)
              SetVehicleDirtLevel(vehicle, 0)
              ClearPedTasksImmediately(playerPed)
              ESX.ShowNotification(_U('vehicle_cleaned'))
            end)
          end
        end
      end

      if data.current.value == 'announce' then
		  messagenotfinish = true		  
		  Message()
      end

      if data.current.value == 'del_vehicle' then

        local ped = GetPlayerPed( -1 )

        if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
          local pos = GetEntityCoords( ped )

          if ( IsPedSittingInAnyVehicle( ped ) ) then
            local vehicle = GetVehiclePedIsIn( ped, false )

            if ( GetPedInVehicleSeat( vehicle, -1 ) == ped ) then
              ESX.ShowNotification(_U('vehicle_impounded'))
              SetEntityAsMissionEntity( vehicle, true, true )
              deleteCar( vehicle )
            else
              ESX.ShowNotification(_U('must_seat_driver'))
            end
          else
            local playerPos = GetEntityCoords( ped, 1 )
            local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords( ped, 0.0, distanceToCheck, 0.0 )
            local vehicle = GetVehicleInDirection( playerPos, inFrontOfPlayer )

            if ( DoesEntityExist( vehicle ) ) then
              ESX.ShowNotification(_U('vehicle_impounded'))
              SetEntityAsMissionEntity( vehicle, true, true )
              deleteCar( vehicle )
            else
              ESX.ShowNotification(_U('must_near'))
            end
          end
        end
      end

      if data.current.value == 'dep_vehicle' then

        local playerped = GetPlayerPed(-1)
        local vehicle = GetVehiclePedIsIn(playerped, true)

        local towmodel = GetHashKey('flatbed')
        local isVehicleTow = IsVehicleModel(vehicle, towmodel)

        if isVehicleTow then

          local coordA = GetEntityCoords(playerped, 1)
          local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 5.0, 0.0)
          local targetVehicle = getVehicleInDirection(coordA, coordB)

          if CurrentlyTowedVehicle == nil then
            if targetVehicle ~= 0 then
              if not IsPedInAnyVehicle(playerped, true) then
                if vehicle ~= targetVehicle then
                  AttachEntityToEntity(targetVehicle, vehicle, 20, -0.5, -5.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
                  CurrentlyTowedVehicle = targetVehicle
                  ESX.ShowNotification(_U('vehicle_success_attached'))

                  if NPCOnJob then

                    if NPCTargetTowable == targetVehicle then
                      ESX.ShowNotification(_U('please_drop_off'))

                      Config.Zones.VehicleDelivery.Type = 1

                      if Blips['NPCTargetTowableZone'] ~= nil then
                        RemoveBlip(Blips['NPCTargetTowableZone'])
                        Blips['NPCTargetTowableZone'] = nil
                      end

                      Blips['NPCDelivery'] = AddBlipForCoord(Config.Zones.VehicleDelivery.Pos.x,  Config.Zones.VehicleDelivery.Pos.y,  Config.Zones.VehicleDelivery.Pos.z)

                      SetBlipRoute(Blips['NPCDelivery'], true)

                    end

                  end

                else
                  ESX.ShowNotification(_U('cant_attach_own_tt'))
                end
              end
            else
              ESX.ShowNotification(_U('no_veh_att'))
            end
          else

            AttachEntityToEntity(CurrentlyTowedVehicle, vehicle, 20, -0.5, -12.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
            DetachEntity(CurrentlyTowedVehicle, true, true)

            if NPCOnJob then

              if NPCTargetDeleterZone then

                if CurrentlyTowedVehicle == NPCTargetTowable then
                  ESX.Game.DeleteVehicle(NPCTargetTowable)
                  TriggerServerEvent('esx_bikershop:onNPCJobMissionCompleted')
                  StopNPCJob()
                  NPCTargetDeleterZone = false

                else
                  ESX.ShowNotification(_U('not_right_veh'))
                end

              else
                ESX.ShowNotification(_U('not_right_place'))
              end

            end

            CurrentlyTowedVehicle = nil

            ESX.ShowNotification(_U('veh_det_succ'))
          end
        else
          ESX.ShowNotification(_U('imp_flatbed'))
        end
      end
    end,
  function(data, menu)
    menu.close()
  end
  )
end

function OpenGetStocksMenu()

  ESX.TriggerServerCallback('esx_bikershop:getStockItems', function(items)

    print(json.encode(items))

    local elements = {}

    for i=1, #items, 1 do

      local item = items[i]

      if item.count > 0 then
        table.insert(elements, {label = item.label .. ' x' .. item.count, type = 'item_standard', value = item.name})
      end

    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'stocks_menu',
      {
        title    = _U('mechanic_stock'),
        elements = elements
      },
      function(data, menu)

        local itemName = data.current.value

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count',
          {
            title = _U('quantity')
          },
          function(data2, menu2)

            local count = tonumber(data2.value)

            if count == nil then
              ESX.ShowNotification(_U('invalid_quantity'))
            else
              menu2.close()
              menu.close()
              OpenGetStocksMenu()

              TriggerServerEvent('esx_bikershop:getStockItem', itemName, count)
            end

          end,
          function(data2, menu2)
            menu2.close()
          end
        )

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end

function OpenPutStocksMenu()

ESX.TriggerServerCallback('esx_bikershop:getPlayerInventory', function(inventory)

    local elements = {}

    for i=1, #inventory.items, 1 do

      local item = inventory.items[i]

      if item.count > 0 then
        table.insert(elements, {label = item.label .. ' x' .. item.count, type = 'item_standard', value = item.name})
      end

    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'stocks_menu',
      {
        title    = _U('inventory'),
        elements = elements
      },
      function(data, menu)

        local itemName = data.current.value

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count',
          {
            title = _U('quantity')
          },
          function(data2, menu2)

            local count = tonumber(data2.value)

            if count == nil then
              ESX.ShowNotification(_U('invalid_quantity'))
            else
              menu2.close()
              menu.close()
              OpenPutStocksMenu()

              TriggerServerEvent('esx_bikershop:putStockItems', itemName, count)
            end

          end,
          function(data2, menu2)
            menu2.close()
          end
        )

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end


RegisterNetEvent('esx_bikershop:onHijack')
AddEventHandler('esx_bikershop:onHijack', function()
  local playerPed = GetPlayerPed(-1)
  local coords    = GetEntityCoords(playerPed)

  if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then

    local vehicle = nil

    if IsPedInAnyVehicle(playerPed, false) then
      vehicle = GetVehiclePedIsIn(playerPed, false)
    else
      vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
    end

    local crochete = math.random(100)
    local alarm    = math.random(100)

    if DoesEntityExist(vehicle) then
      if alarm <= 33 then
        SetVehicleAlarm(vehicle, true)
        StartVehicleAlarm(vehicle)
      end
      TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)
      Citizen.CreateThread(function()
        Citizen.Wait(10000)
        if crochete <= 66 then
          SetVehicleDoorsLocked(vehicle, 1)
          SetVehicleDoorsLockedForAllPlayers(vehicle, false)
          ClearPedTasksImmediately(playerPed)
          ESX.ShowNotification(_U('veh_unlocked'))
        else
          ESX.ShowNotification(_U('hijack_failed'))
          ClearPedTasksImmediately(playerPed)
        end
      end)
    end

  end
end)

RegisterNetEvent('esx_bikershop:onCarokit')
AddEventHandler('esx_bikershop:onCarokit', function()
  local playerPed = GetPlayerPed(-1)
  local coords    = GetEntityCoords(playerPed)

  if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then

    local vehicle = nil

    if IsPedInAnyVehicle(playerPed, false) then
      vehicle = GetVehiclePedIsIn(playerPed, false)
    else
      vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
    end

    if DoesEntityExist(vehicle) then
      TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_HAMMERING", 0, true)
      Citizen.CreateThread(function()
        Citizen.Wait(10000)
        SetVehicleFixed(vehicle)
        SetVehicleDeformationFixed(vehicle)
        ClearPedTasksImmediately(playerPed)
        ESX.ShowNotification(_U('body_repaired'))
      end)
    end
  end
end)

RegisterNetEvent('esx_bikershop:onFixkit')
AddEventHandler('esx_bikershop:onFixkit', function()
  local playerPed = GetPlayerPed(-1)
  local coords    = GetEntityCoords(playerPed)

  if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then

    local vehicle = nil

    if IsPedInAnyVehicle(playerPed, false) then
      vehicle = GetVehiclePedIsIn(playerPed, false)
    else
      vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
    end

    if DoesEntityExist(vehicle) then
      TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_BUM_BIN", 0, true)
      Citizen.CreateThread(function()
        Citizen.Wait(20000)
        SetVehicleFixed(vehicle)
        SetVehicleDeformationFixed(vehicle)
        SetVehicleUndriveable(vehicle, false)
        ClearPedTasksImmediately(playerPed)
        ESX.ShowNotification(_U('veh_repaired'))
      end)
    end
  end
end)

function setEntityHeadingFromEntity ( vehicle, playerPed )
    local heading = GetEntityHeading(vehicle)
    SetEntityHeading( playerPed, heading )
end

function getVehicleInDirection(coordFrom, coordTo)
  local rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed(-1), 0)
  local a, b, c, d, vehicle = GetRaycastResult(rayHandle)
  return vehicle
end

function deleteCar( entity )
    Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) )
end


AddEventHandler('esx_bikershop:hasEnteredMarker', function(zone)

  if zone == NPCJobTargetTowable then

  end

  if zone =='VehicleDelivery' then
    NPCTargetDeleterZone = true
  end

  if zone == 'BikerActions' then
    CurrentAction     = 'biker_actions_menu'
    CurrentActionMsg  = _U('open_actions')
    CurrentActionData = {}
  end

  if zone == 'VehicleDeleter' then

    local playerPed = GetPlayerPed(-1)

    if IsPedInAnyVehicle(playerPed,  false) then

      local vehicle = GetVehiclePedIsIn(playerPed,  false)

      CurrentAction     = 'delete_vehicle'
      CurrentActionMsg  = _U('veh_stored')
      CurrentActionData = {vehicle = vehicle}
    end
  end

end)

AddEventHandler('esx_bikershop:hasExitedMarker', function(zone)

  if zone =='VehicleDelivery' then
    NPCTargetDeleterZone = false
  end

  if not IsInShopMenu then
    ESX.UI.Menu.CloseAll()
  end  

  CurrentAction = nil
  ESX.UI.Menu.CloseAll()
end)



RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function (xPlayer)
  PlayerData = xPlayer

  if Config.EnablePlayerManagement then
    if PlayerData.job.name == 'biker' then
      Config.Zones.ShopEntering.Type = 1
    else
      Config.Zones.ShopEntering.Type = -1
    end
  end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function (job)
  PlayerData.job = job

  if Config.EnablePlayerManagement then
    if PlayerData.job.name == 'biker' then
      Config.Zones.ShopEntering.Type = 1
    else
      Config.Zones.ShopEntering.Type = -1
    end
  end
end)

RegisterNetEvent('esx_bikershop:openPersonnalVehicleMenu')
AddEventHandler('esx_bikershop:openPersonnalVehicleMenu', function ()
  OpenPersonnalVehicleMenu()
end)

AddEventHandler('esx_bikershop:hasEnteredMarker', function (zone)
  
  if zone == 'ShopEntering' then
    if Config.EnablePlayerManagement then
      if PlayerData.job ~= nil and PlayerData.job.name == 'biker' then
        CurrentAction     = 'reseller_menu'
        CurrentActionMsg  = _U('shop_menu')
        CurrentActionData = {}
      end
    else
      CurrentAction     = 'shop_menu'
      CurrentActionMsg  = _U('shop_menu')
      CurrentActionData = {}
    end
  end

  if zone == 'GiveBackVehicle' and Config.EnablePlayerManagement then
    local playerPed = GetPlayerPed(-1)

    if IsPedInAnyVehicle(playerPed, false) then
      local vehicle = GetVehiclePedIsIn(playerPed, false)

      CurrentAction     = 'give_back_vehicle'
      CurrentActionMsg  = _U('vehicle_menu')

      CurrentActionData = {
        vehicle = vehicle
      }
    end
  end

  if zone == 'ResellVehicle' then
    local playerPed = GetPlayerPed(-1)

    if IsPedInAnyVehicle(playerPed, false) then
      local vehicle     = GetVehiclePedIsIn(playerPed, false)
      local vehicleData = nil

      for i=1, #Vehicles, 1 do
        if GetHashKey(Vehicles[i].model) == GetEntityModel(vehicle) then
          vehicleData = Vehicles[i]
          break
        end
      end

      local resellPrice = math.floor(vehicleData.price / 100 * Config.ResellPercentage)

      CurrentAction     = 'resell_vehicle'
      CurrentActionMsg  = _U('sell_menu').. vehicleData.name .. _U('price') .. resellPrice

      CurrentActionData = {
        vehicle = vehicle,
        price   = resellPrice
      }
    end
  end
end)

-- Pop NPC mission vehicle when inside area
Citizen.CreateThread(function()
  while true do

    Wait(0)

    if NPCTargetTowableZone ~= nil and not NPCHasSpawnedTowable then

      local coords = GetEntityCoords(GetPlayerPed(-1))
      local zone   = Config.Zones[NPCTargetTowableZone]

      if GetDistanceBetweenCoords(coords, zone.Pos.x, zone.Pos.y, zone.Pos.z, true) < Config.NPCSpawnDistance then

        local model = Config.Vehicles[GetRandomIntInRange(1,  #Config.Vehicles)]

        ESX.Game.SpawnVehicle(model, zone.Pos, 0, function(vehicle)
          NPCTargetTowable = vehicle
        end)

        NPCHasSpawnedTowable = true

      end

    end

    if NPCTargetTowableZone ~= nil and NPCHasSpawnedTowable and not NPCHasBeenNextToTowable then

      local coords = GetEntityCoords(GetPlayerPed(-1))
      local zone   = Config.Zones[NPCTargetTowableZone]

      if(GetDistanceBetweenCoords(coords, zone.Pos.x, zone.Pos.y, zone.Pos.z, true) < Config.NPCNextToDistance) then
        ESX.ShowNotification(_U('please_tow'))
        NPCHasBeenNextToTowable = true
      end

    end

  end
end)


-- Display markers
Citizen.CreateThread(function()
  while true do
    Wait(0)
    if PlayerData.job ~= nil and PlayerData.job.name == 'biker' then

      local coords = GetEntityCoords(GetPlayerPed(-1))

      for k,v in pairs(Config.Zones) do
        if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
          DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
        end
      end
    end
  end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
  while true do
    Wait(0)
    if PlayerData.job ~= nil and PlayerData.job.name == 'biker' then
      local coords      = GetEntityCoords(GetPlayerPed(-1))
      local isInMarker  = false
      local currentZone = nil
      for k,v in pairs(Config.Zones) do
        if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
          isInMarker  = true
          currentZone = k
        end
      end
      if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
        HasAlreadyEnteredMarker = true
        LastZone                = currentZone
        TriggerEvent('esx_bikershop:hasEnteredMarker', currentZone)
      end
      if not isInMarker and HasAlreadyEnteredMarker then
        HasAlreadyEnteredMarker = false
        TriggerEvent('esx_bikershop:hasExitedMarker', LastZone)
      end
    end
  end
end)


-- Key Controls
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        if CurrentAction ~= nil then

          SetTextComponentFormat('STRING')
          AddTextComponentString(CurrentActionMsg)
          DisplayHelpTextFromStringLabel(0, 0, 1, -1)

          if IsControlPressed(0, Keys['E']) and PlayerData.job ~= nil and PlayerData.job.name == 'biker' and (GetGameTimer() - GUI.Time) > 300 then

            if CurrentAction == 'shop_menu' then
              OpenShopMenu()
            end

            if CurrentAction == 'reseller_menu' then
              OpenResellerMenu()
            end

            if CurrentAction == 'give_back_vehicle' then
              ESX.TriggerServerCallback('esx_bikershop:giveBackVehicle', function (isRentedVehicle)
                if isRentedVehicle then
                  DeleteVehicle(CurrentActionData.vehicle)
                  ESX.ShowNotification(_U('delivered'))
                else
                  ESX.ShowNotification(_U('not_rental'))
                end
              end, GetVehicleNumberPlateText(CurrentActionData.vehicle))
            end

            if CurrentAction == 'resell_vehicle' then
              ESX.TriggerServerCallback('esx_bikershop:resellVehicle', function (isOwnedVehicle)
                if isOwnedVehicle then
                  DeleteVehicle(CurrentActionData.vehicle)
                  ESX.ShowNotification(_U('vehicle_sold'))
                else
                  ESX.ShowNotification(_U('not_yours'))
                end
              end, GetVehicleNumberPlateText(CurrentActionData.vehicle), CurrentActionData.price)
            end

            if CurrentAction == 'biker_actions_menu' then
                OpenBikerActionsMenu()
            end

            if CurrentAction == 'delete_vehicle' then

              if Config.EnableSocietyOwnedVehicles then

                local vehicleProps = ESX.Game.GetVehicleProperties(CurrentActionData.vehicle)
                TriggerServerEvent('esx_society:putVehicleInGarage', 'biker', vehicleProps)

              else

                if
                  GetEntityModel(vehicle) == GetHashKey('flatbed')   or
                  GetEntityModel(vehicle) == GetHashKey('towtrcuk2') or
                  GetEntityModel(vehicle) == GetHashKey('akuma')
                then
                  TriggerServerEvent('esx_service:disableService', 'biker')
                end

              end

              ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
            end

            CurrentAction = nil
          end
        end

        if IsControlJustReleased(0, Keys['F6']) and PlayerData.job ~= nil and PlayerData.job.name == 'biker' then
            OpenMobileBikerActionsMenu()
        end

        if IsControlJustReleased(0, Keys['N9']) and PlayerData.job ~= nil and PlayerData.job.name == 'biker' then

          if NPCOnJob then

            if GetGameTimer() - NPCLastCancel > 5 * 60000 then
              StopNPCJob(true)
              NPCLastCancel = GetGameTimer()
            else
              ESX.ShowNotification(_U('wait_five'))
            end

          else

            local playerPed = GetPlayerPed(-1)

            if IsPedInAnyVehicle(playerPed,  false) and IsVehicleModel(GetVehiclePedIsIn(playerPed,  false), GetHashKey("flatbed")) then
              StartNPCJob()
            else
              ESX.ShowNotification(_U('must_in_flatbed'))
            end

          end

        end

    end
end)


function DrawAdvancedTextCNN (x,y ,w,h,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(sc, sc)
    N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - 0.1+w, y - 0.02+h)
end


 Citizen.CreateThread(function()
		    while true do
		        Citizen.Wait(1)    
		                       
		            if (affichenews == true) then
		           
				            DrawRect(0.494, 0.227, 5.185, 0.118, 0, 0, 0, 150)
				            DrawAdvancedTextCNN(0.588, 0.14, 0.005, 0.0028, 0.8, "~r~ CONCESS MOTO ~d~", 255, 255, 255, 255, 1, 0)
				            DrawAdvancedTextCNN(0.586, 0.199, 0.005, 0.0028, 0.6, texteafiche, 255, 255, 255, 255, 7, 0)
				            DrawAdvancedTextCNN(0.588, 0.246, 0.005, 0.0028, 0.4, "", 255, 255, 255, 255, 0, 0)

				    end                
		   end
		end)



RegisterNetEvent('esx_bikershop:annonce')
AddEventHandler('esx_bikershop:annonce', function(text)
 		texteafiche = text
 		affichenews = true
		
  end) 


RegisterNetEvent('esx_bikershop:annoncestop')
AddEventHandler('esx_bikershop:annoncestop', function()
 		affichenews = false
 		
  end) 