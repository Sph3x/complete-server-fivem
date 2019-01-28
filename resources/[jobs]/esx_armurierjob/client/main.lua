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

local PlayerData                = {}
local GUI                       = {}
local HasAlreadyEnteredMarker   = false
local LastStation               = nil
local LastPart                  = nil
local LastPartNum               = nil
local LastEntity                = nil
local LastZone                  = nil
local CurrentAction             = nil
local CurrentActionMsg          = ''
local CurrentActionData         = {}

ESX                             = nil
GUI.Time                        = 0

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

function IsJobTrue()
    if PlayerData ~= nil then
        local IsJobTrue = false
        if PlayerData.job ~= nil and PlayerData.job.name == 'armurier' then
            IsJobTrue = true
        end
        return IsJobTrue
    end
end

function SetVehicleMaxMods(vehicle)

  local props = {
    modEngine       = 0,
    modBrakes       = 0,
    modTransmission = 0,
    modSuspension   = 0,
    modTurbo        = false,
	SetVehicleWindowTint(vehicle, 1),
	SetVehicleNumberPlateText(vehicle, "BLANCO")
  }

  ESX.Game.SetVehicleProperties(vehicle, props)

end

function OpenCloakroomMenu()

  local elements = {
    { label = _U('citizen_wear'), value = 'citizen_wear' }
  }

  if PlayerData.job.grade_name == 'recrue' then
    table.insert(elements, {label = _U('recrue_wear'), value = 'recrue_wear'})
  end

  if PlayerData.job.grade_name == 'agent' then
    table.insert(elements, {label = _U('agent_wear'), value = 'agent_wear'})
  end

  if PlayerData.job.grade_name == 'garde_du_corps' then
    table.insert(elements, {label = _U('garde_wear'), value = 'garde_wear'})
  end

  if PlayerData.job.grade_name == 'equip_chief' then
    table.insert(elements, {label = _U('equip_chief_wear'), value = 'equip_chief_wear'})
  end

  if PlayerData.job.grade_name == 'security_chief' then
    table.insert(elements, {label = _U('security_chief_wear'), value = 'security_chief_wear'})
  end

  if PlayerData.job.grade_name == 'boss' then
    table.insert(elements, {label = _U('boss_wear'), value = 'boss_wear'})
  end

  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'cloakroom',
    {
      title    = _U('cloakroom'),
      align    = 'top-left',
      elements = elements,
    },
    function(data, menu)
      menu.close()

      if data.current.value == 'citizen_wear' then
            
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
          local model = nil

          if skin.sex == 0 then
            model = GetHashKey("mp_m_freemode_01")
          else
            model = GetHashKey("mp_f_freemode_01")
          end

          RequestModel(model)
          while not HasModelLoaded(model) do
            RequestModel(model)
            Citizen.Wait(1)
          end

          SetPlayerModel(PlayerId(), model)
          SetModelAsNoLongerNeeded(model)

          TriggerEvent('skinchanger:loadSkin', skin)
          TriggerEvent('esx:restoreLoadout')
          local playerPed = GetPlayerPed(-1)
          SetPedArmour(playerPed, 0)
          ClearPedBloodDamage(playerPed)
          ResetPedVisibleDamage(playerPed)
          ClearPedLastWeaponDamage(playerPed)
        end)
      end

      if data.current.value == 'recrue_wear' then
       
        TriggerEvent('skinchanger:getSkin', function(skin)

            if skin.sex == 0 then

                local clothesSkin = {
                  ['tshirt_1'] = 11, ['tshirt_2'] = 0,
                  ['torso_1'] = 28, ['torso_2'] = 0,
                  ['decals_1'] = 0, ['decals_2'] = 0,
                  ['arms'] = 4,
                  ['pants_1'] = 37, ['pants_2'] = 2,
                  ['shoes_1'] = 10, ['shoes_2'] = 0,
                  ['helmet_1'] = -1, ['helmet_2'] = 0,
                  ['chain_1'] = 0, ['chain_2'] = 0,
                  ['ears_1'] = 2, ['ears_2'] = 0
                  }
                TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

            else

                local clothesSkin = {
                  ['tshirt_1'] = 39, ['tshirt_2'] = 0,
                  ['torso_1'] = 6, ['torso_2'] = 4,
                  ['decals_1'] = 8, ['decals_2'] = 3,
                  ['arms'] = 5,
                  ['pants_1'] = 36, ['pants_2'] = 2,
                  ['shoes_1'] = 8, ['shoes_2'] = 0,
                  ['helmet_1'] = -1, ['helmet_2'] = 0,
                  ['chain_1'] = 0, ['chain_2'] = 0,
                  ['ears_1'] = 2, ['ears_2'] = 0
              }
                TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

            end

            local playerPed = GetPlayerPed(-1)
            SetPedArmour(playerPed, 0)
            ClearPedBloodDamage(playerPed)
            ResetPedVisibleDamage(playerPed)
            ClearPedLastWeaponDamage(playerPed)

        end)
      end
--agent
      if data.current.value == 'agent_wear' then
        
        TriggerEvent('skinchanger:getSkin', function(skin)

            if skin.sex == 0 then

                local clothesSkin = {
                  ['tshirt_1'] = 11, ['tshirt_2'] = 0,
                  ['torso_1'] = 28, ['torso_2'] = 0,
                  ['decals_1'] = 0, ['decals_2'] = 0,
                  ['arms'] = 4,
                  ['pants_1'] = 37, ['pants_2'] = 2,
                  ['shoes_1'] = 10, ['shoes_2'] = 0,
                  ['helmet_1'] = -1, ['helmet_2'] = 0,
                  ['chain_1'] = 0, ['chain_2'] = 0,
                  ['ears_1'] = 2, ['ears_2'] = 0
                  }
                TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

            else

                local clothesSkin = {
                  ['tshirt_1'] = 39, ['tshirt_2'] = 0,
                  ['torso_1'] = 6, ['torso_2'] = 4,
                  ['decals_1'] = 8, ['decals_2'] = 3,
                  ['arms'] = 5,
                  ['pants_1'] = 36, ['pants_2'] = 2,
                  ['shoes_1'] = 8, ['shoes_2'] = 0,
                  ['helmet_1'] = -1, ['helmet_2'] = 0,
                  ['chain_1'] = 0, ['chain_2'] = 0,
                  ['ears_1'] = 2, ['ears_2'] = 0
              }
                TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

            end

            local playerPed = GetPlayerPed(-1)
            SetPedArmour(playerPed, 0)
            ClearPedBloodDamage(playerPed)
            ResetPedVisibleDamage(playerPed)
            ClearPedLastWeaponDamage(playerPed)

        end)
      end
--garde du corps
      if data.current.value == 'garde_wear' then
        
        TriggerEvent('skinchanger:getSkin', function(skin)

            if skin.sex == 0 then

                local clothesSkin = {
                  ['tshirt_1'] = 11, ['tshirt_2'] = 0,
                  ['torso_1'] = 28, ['torso_2'] = 0,
                  ['decals_1'] = 0, ['decals_2'] = 0,
                  ['arms'] = 4,
                  ['pants_1'] = 37, ['pants_2'] = 2,
                  ['shoes_1'] = 10, ['shoes_2'] = 0,
                  ['helmet_1'] = -1, ['helmet_2'] = 0,
                  ['chain_1'] = 0, ['chain_2'] = 0,
                  ['ears_1'] = 2, ['ears_2'] = 0
                  }
                TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

            else

                local clothesSkin = {
                  ['tshirt_1'] = 39, ['tshirt_2'] = 0,
                  ['torso_1'] = 6, ['torso_2'] = 4,
                  ['decals_1'] = 8, ['decals_2'] = 3,
                  ['arms'] = 5,
                  ['pants_1'] = 36, ['pants_2'] = 2,
                  ['shoes_1'] = 8, ['shoes_2'] = 0,
                  ['helmet_1'] = -1, ['helmet_2'] = 0,
                  ['chain_1'] = 0, ['chain_2'] = 0,
                  ['ears_1'] = 2, ['ears_2'] = 0
              }
                TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

            end

            local playerPed = GetPlayerPed(-1)
            SetPedArmour(playerPed, 0)
            ClearPedBloodDamage(playerPed)
            ResetPedVisibleDamage(playerPed)
            ClearPedLastWeaponDamage(playerPed)

        end)
      end

--chef d'équipe
if data.current.value == 'equip_chief_wear' then
       
  TriggerEvent('skinchanger:getSkin', function(skin)

      if skin.sex == 0 then

          local clothesSkin = {
            ['tshirt_1'] = 11, ['tshirt_2'] = 0,
            ['torso_1'] = 28, ['torso_2'] = 0,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms'] = 4,
            ['pants_1'] = 37, ['pants_2'] = 2,
            ['shoes_1'] = 10, ['shoes_2'] = 0,
            ['helmet_1'] = -1, ['helmet_2'] = 0,
            ['chain_1'] = 0, ['chain_2'] = 0,
            ['ears_1'] = 2, ['ears_2'] = 0
            }
          TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

      else

          local clothesSkin = {
            ['tshirt_1'] = 39, ['tshirt_2'] = 0,
            ['torso_1'] = 6, ['torso_2'] = 4,
            ['decals_1'] = 8, ['decals_2'] = 3,
            ['arms'] = 5,
            ['pants_1'] = 36, ['pants_2'] = 2,
            ['shoes_1'] = 8, ['shoes_2'] = 0,
            ['helmet_1'] = -1, ['helmet_2'] = 0,
            ['chain_1'] = 0, ['chain_2'] = 0,
            ['ears_1'] = 2, ['ears_2'] = 0
        }
          TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

      end

      local playerPed = GetPlayerPed(-1)
      SetPedArmour(playerPed, 0)
      ClearPedBloodDamage(playerPed)
      ResetPedVisibleDamage(playerPed)
      ClearPedLastWeaponDamage(playerPed)

  end)
end
--chef de la sécurité
if data.current.value == 'security_chief_wear' then
       
  TriggerEvent('skinchanger:getSkin', function(skin)

      if skin.sex == 0 then

          local clothesSkin = {
            ['tshirt_1'] = 21, ['tshirt_2'] = 0,
            ['torso_1'] = 29, ['torso_2'] = 0,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms'] = 12,
            ['pants_1'] = 13, ['pants_2'] = 0,
            ['shoes_1'] = 10, ['shoes_2'] = 0,
            ['helmet_1'] = -1, ['helmet_2'] = 0,
            ['chain_1'] = 0, ['chain_2'] = 0,
            ['ears_1'] = 2, ['ears_2'] = 0,
            ['glasses_1'] = 17, ['glassess_2'] = 0
            }
          TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

      else

          local clothesSkin = {
            ['tshirt_1'] = 21, ['tshirt_2'] = 0,
            ['torso_1'] = 29, ['torso_2'] = 0,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms'] = 12,
            ['pants_1'] = 13, ['pants_2'] = 0,
            ['shoes_1'] = 10, ['shoes_2'] = 0,
            ['helmet_1'] = -1, ['helmet_2'] = 0,
            ['chain_1'] = 0, ['chain_2'] = 0,
            ['ears_1'] = 2, ['ears_2'] = 0,
            ['glasses_1'] = 17, ['glassess_2'] = 0
        }
          TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

      end

      local playerPed = GetPlayerPed(-1)
      SetPedArmour(playerPed, 0)
      ClearPedBloodDamage(playerPed)
      ResetPedVisibleDamage(playerPed)
      ClearPedLastWeaponDamage(playerPed)

  end)
end
--boss
      if data.current.value == 'boss_wear' then
        
        TriggerEvent('skinchanger:getSkin', function(skin)

            if skin.sex == 0 then

                local clothesSkin = {
                    ['tshirt_1'] = 4, ['tshirt_2'] = 0,
                    ['torso_1'] = 23, ['torso_2'] = 3,
                    ['decals_1'] = 0, ['decals_2'] = 0,
                    ['arms'] = 20,
                    ['pants_1'] = 24, ['pants_2'] = 5,
                    ['shoes_1'] = 1, ['shoes_2'] = 1,
                    ['helmet_1'] = 95, ['helmet_2'] = 4,
                    ['chain_1'] = 11, ['chain_2'] = 2,
                    ['ears_1'] = 0, ['ears_2'] = 0
                }
                TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

            else

                local clothesSkin = {
                    ['tshirt_1'] = 35, ['tshirt_2'] = 0,
                    ['torso_1'] = 48, ['torso_2'] = 0,
                    ['decals_1'] = 7, ['decals_2'] = 2,
                    ['arms'] = 44,
                    ['pants_1'] = 34, ['pants_2'] = 0,
                    ['shoes_1'] = 27, ['shoes_2'] = 0,
                    ['helmet_1'] = -1, ['helmet_2'] = 0,
                    ['chain_1'] = 0, ['chain_2'] = 0,
                    ['ears_1'] = 2, ['ears_2'] = 0
                }
                TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

            end

            local playerPed = GetPlayerPed(-1)
            SetPedArmour(playerPed, 0)
            ClearPedBloodDamage(playerPed)
            ResetPedVisibleDamage(playerPed)
            ClearPedLastWeaponDamage(playerPed)

        end)
      end

      CurrentAction     = 'menu_cloakroom'
      CurrentActionMsg  = _U('open_cloackroom')
      CurrentActionData = {}

    end,
    function(data, menu)

      menu.close()

      CurrentAction     = 'menu_cloakroom'
      CurrentActionMsg  = _U('open_cloackroom')
      CurrentActionData = {}
    end
  )

end

-- Coffre Armurier - Employé & Patron
function OpenArmoryMenu(station)

  if Config.EnableArmoryManagement then

    local elements = {
      {label = _U('get_weapon'), value = 'get_weapon'},
      {label = _U('put_weapon'), value = 'put_weapon'},
    }

    if PlayerData.job.grade_name == 'employe' then
	  table.insert(elements, {label = 'Prendre Objet',  value = 'get_stock'})
      table.insert(elements, {label = 'Déposer objet',  value = 'put_stock'})
    end
	if PlayerData.job.grade_name == 'boss' then
      table.insert(elements, {label = _U('buy_weapons'), value = 'buy_weapons'})
	  table.insert(elements, {label = 'Prendre Objet',  value = 'get_stock'})
      table.insert(elements, {label = 'Déposer objet',  value = 'put_stock'})
    end

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'armory',
      {
        title    = _U('armory'),
        align    = 'top-left',
        elements = elements,
      },
      function(data, menu)

        if data.current.value == 'get_weapon' then
          OpenGetWeaponMenu()
        end

        if data.current.value == 'put_weapon' then
          OpenPutWeaponMenu()
        end

        if data.current.value == 'buy_weapons' then
          OpenBuyWeaponsMenu(station)
        end

        if data.current.value == 'put_stock' then
              OpenPutStocksMenu()
            end

            if data.current.value == 'get_stock' then
              OpenGetStocksMenu()
            end

      end,
      function(data, menu)

        menu.close()

        CurrentAction     = 'menu_armory'
        CurrentActionMsg  = _U('open_armory')
        CurrentActionData = {station = station}
      end
    )

  else

    local elements = {}

    for i=1, #Config.ArmurierStations[station].AuthorizedWeapons, 1 do
      local weapon = Config.ArmurierStations[station].AuthorizedWeapons[i]
      table.insert(elements, {label = ESX.GetWeaponLabel(weapon.name), value = weapon.name})
    end

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'armory',
      {
        title    = _U('armory'),
        align    = 'top-left',
        elements = elements,
      },
      function(data, menu)
        local weapon = data.current.value
        TriggerServerEvent('esx_armurierjob:giveWeapon', weapon,  1000)
      end,
      function(data, menu)

        menu.close()

        CurrentAction     = 'menu_armory'
        CurrentActionMsg  = _U('open_armory')
        CurrentActionData = {station = station}

      end
    )

  end

end

-- Coffre Armurier - Patron
function OpenArmory2Menu(station)

  if Config.EnableArmoryManagement then

    local elements = {
      {label = _U('get_weapon'), value = 'get_weapon'},
      {label = _U('put_weapon'), value = 'put_weapon'},
      {label = _U('get_object'), value = 'get_stock'},
      {label = _U('put_object'), value = 'put_stock'}
    }


    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'coffre',
      {
        title    = _U('armory'),
        align    = 'top-left',
        elements = elements,
      },
      function(data, menu)

        if data.current.value == 'get_weapon' then
          OpenGetWeaponMenu2()
        end

        if data.current.value == 'put_weapon' then
          OpenPutWeaponMenu2()
        end

        if data.current.value == 'put_stock' then
              OpenPutStocksMenu2()
            end

        if data.current.value == 'get_stock' then
              OpenGetStocksMenu2()
            end

      end,
      function(data, menu)

        menu.close()

        CurrentAction     = 'menu_coffre'
        CurrentActionMsg  = _U('open_armory')
        CurrentActionData = {station = station}
      end
    )

  else

    local elements = {}

    for i=1, #Config.ArmurierStations[station].AuthorizedWeapons, 1 do
      local weapon = Config.ArmurierStations[station].AuthorizedWeapons[i]
      table.insert(elements, {label = ESX.GetWeaponLabel(weapon.name), value = weapon.name})
    end

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'coffre',
      {
        title    = _U('armory'),
        align    = 'top-left',
        elements = elements,
      },
      function(data, menu)
        local weapon = data.current.value
        TriggerServerEvent('esx_armurierjob:giveWeapon', weapon,  1000)
      end,
      function(data, menu)

        menu.close()

        CurrentAction     = 'menu_coffre'
        CurrentActionMsg  = _U('open_armory')
        CurrentActionData = {station = station}

      end
    )

  end

end

function OpenVehicleSpawnerMenu(station, partNum)

  local vehicles = Config.ArmurierStations[station].Vehicles

  ESX.UI.Menu.CloseAll()

  if Config.EnableSocietyOwnedVehicles then

    local elements = {}

    ESX.TriggerServerCallback('esx_society:getVehiclesInGarage', function(garageVehicles)

      for i=1, #garageVehicles, 1 do
        table.insert(elements, {label = GetDisplayNameFromVehicleModel(garageVehicles[i].model) .. ' [' .. garageVehicles[i].plate .. ']', value = garageVehicles[i]})
      end

      ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'vehicle_spawner',
        {
          title    = _U('vehicle_menu'),
          align    = 'top-left',
          elements = elements,
        },
        function(data, menu)

          menu.close()

          local vehicleProps = data.current.value

          ESX.Game.SpawnVehicle(vehicleProps.model, vehicles[partNum].SpawnPoint, 270.0, function(vehicle)
            ESX.Game.SetVehicleProperties(vehicle, vehicleProps)
            local playerPed = GetPlayerPed(-1)
            TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)
          end)

          TriggerServerEvent('esx_society:removeVehicleFromGarage', 'armurier', vehicleProps)

        end,
        function(data, menu)

          menu.close()

          CurrentAction     = 'menu_vehicle_spawner'
          CurrentActionMsg  = _U('vehicle_spawner')
          CurrentActionData = {station = station, partNum = partNum}

        end
      )

    end, 'armurier')

  else

    local elements = {}

    for i=1, #Config.ArmurierStations[station].AuthorizedVehicles, 1 do
      local vehicle = Config.ArmurierStations[station].AuthorizedVehicles[i]
      table.insert(elements, {label = vehicle.label, value = vehicle.name})
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'vehicle_spawner',
      {
        title    = _U('vehicle_menu'),
        align    = 'top-left',
        elements = elements,
      },
      function(data, menu)

        menu.close()

        local model = data.current.value

        local vehicle = GetClosestVehicle(vehicles[partNum].SpawnPoint.x,  vehicles[partNum].SpawnPoint.y,  vehicles[partNum].SpawnPoint.z,  3.0,  0,  71)

        if not DoesEntityExist(vehicle) then

          local playerPed = GetPlayerPed(-1)

          if Config.MaxInService == -1 then

            ESX.Game.SpawnVehicle(model, {
              x = vehicles[partNum].SpawnPoint.x,
              y = vehicles[partNum].SpawnPoint.y,
              z = vehicles[partNum].SpawnPoint.z
            }, vehicles[partNum].Heading, function(vehicle)
              TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)
              SetVehicleMaxMods(vehicle)
			  SetVehicleColours(vehicle, 0, 0)
            end)

          else

            ESX.TriggerServerCallback('esx_service:enableService', function(canTakeService, maxInService, inServiceCount)

              if canTakeService then

                ESX.Game.SpawnVehicle(model, {
                  x = vehicles[partNum].SpawnPoint.x,
                  y = vehicles[partNum].SpawnPoint.y,
                  z = vehicles[partNum].SpawnPoint.z
                }, vehicles[partNum].Heading, function(vehicle)
                  TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)
                  SetVehicleMaxMods(vehicle)
                  SetVehicleColours(vehicle, 0, 0)
                end)

              else
                ESX.ShowNotification(_U('service_max') .. inServiceCount .. '/' .. maxInService)
              end

            end, 'armurier')

          end

        else
          ESX.ShowNotification(_U('vehicle_out'))
        end

      end,
      function(data, menu)

        menu.close()

        CurrentAction     = 'menu_vehicle_spawner'
        CurrentActionMsg  = _U('vehicle_spawner')
        CurrentActionData = {station = station, partNum = partNum}

      end
    )

  end

end

function OpenArmurierActionsMenu()

  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'armurier_actions',
    {
      title    = 'Armurier',
      align    = 'top-left',
      elements = {
        {label = _U('citizen_interaction'), value = 'citizen_interaction'},
        --{label = _U('vehicle_interaction'), value = 'vehicle_interaction'},
        {label = _U('object_spawner'),      value = 'object_spawner'},
      },
    },
    function(data, menu)

      if data.current.value == 'citizen_interaction' then

        ESX.UI.Menu.Open(
          'default', GetCurrentResourceName(), 'citizen_interaction',
          {
            title    = _U('citizen_interaction'),
            align    = 'top-left',
            elements = {
              {label = _U('id_card'),       value = 'identity_card'},
              --{label = _U('search'),        value = 'body_search'},
              --{label = _U('handcuff'),    value = 'handcuff'},
              --{label = _U('drag'),      value = 'drag'},
              --{label = _U('put_in_vehicle'),  value = 'put_in_vehicle'},
              --{label = _U('out_the_vehicle'), value = 'out_the_vehicle'},
              --{label = _U('fine'),            value = 'fine'}
            },
          },
          function(data2, menu2)

            local player, distance = ESX.Game.GetClosestPlayer()

            if distance ~= -1 and distance <= 3.0 then

              if data2.current.value == 'identity_card' then
                OpenIdentityCardMenu(player)
              end

              if data2.current.value == 'fine' then
                OpenFineMenu(player)
              end

            else
              ESX.ShowNotification(_U('no_players_nearby'))
            end

          end,
          function(data2, menu2)
            menu2.close()
          end
        )

      end

      if data.current.value == 'object_spawner' then

        ESX.UI.Menu.Open(
          'default', GetCurrentResourceName(), 'citizen_interaction',
          {
            title    = _U('traffic_interaction'),
            align    = 'top-left',
            elements = {
              {label = _U('armoire'),     value = 'prop_rub_cabinet03'},
              {label = _U('can'), value = 'prop_ld_can_01'},
              {label = _U('pneu'),   value = 'prop_stockade_wheel'},
              {label = _U('bear'),   value = 'prop_sh_mr_rasp_01'},
              {label = _U('foin'),   value = 'prop_offroad_bale01'},
              {label = _U('pic'),   value = 'prop_ped_pic_03'},
              {label = _U('pano'),   value = 'prop_cs_protest_sign_02'},
              {label = _U('target'),   value = 'prop_dart_bd_01'}
            },
          },
          function(data2, menu2)


            local model     = data2.current.value
            local playerPed = GetPlayerPed(-1)
            local coords    = GetEntityCoords(playerPed)
            local forward   = GetEntityForwardVector(playerPed)
            local x, y, z   = table.unpack(coords + forward * 1.0)

            if model == 'prop_roadcone02a' then
              z = z - 2.0
            end

            ESX.Game.SpawnObject(model, {
              x = x,
              y = y,
              z = z
            }, function(obj)
              SetEntityHeading(obj, GetEntityHeading(playerPed))
              PlaceObjectOnGroundProperly(obj)
            end)

          end,
          function(data2, menu2)
            menu2.close()
          end
        )

      end

    end,
    function(data, menu)

      menu.close()

    end
  )

end

----- Menu de Récolte -----
function OpenHarvestMenu()

	if Config.EnablePlayerManagement and PlayerData.job ~= nil then
		local elements = {
			{label = 'Douille', value = 'douille'},
			{label = 'Poudre à canon', value = 'poudre'}
		}

		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'armurier_harvest',
			{
				title    = _U('harvest'),
				elements = elements
			},
			function(data, menu)

				if data.current.value == 'douille' then
					menu.close()
					TriggerServerEvent('esx_armurierjob:startHarvest')
				end

				if data.current.value == 'poudre' then
					menu.close()
					TriggerServerEvent('esx_armurierjob:startHarvest2')
				end


			end,
			function(data, menu)
				menu.close()
				CurrentAction     = 'armurier_harvest_menu'
				CurrentActionMsg  = _U'open_harvest'
				CurrentActionData = {}
			end
		)
	else
		ESX.ShowNotification('not_experienced_enough')
	end
end

----- Menu de Craft -----
function OpenCraftMenu()

	if Config.EnablePlayerManagement and PlayerData.job ~= nil then
		local elements = {
			{label = 'Chargeur', value = 'clip'},
		}

		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'armurier_craft',
			{
				title    = _U('craft'),
				elements = elements
			},
			function(data, menu)
				if data.current.value == 'clip' then
					menu.close()
					TriggerServerEvent('esx_armurierjob:startCraft')
				end

			end,
			function(data, menu)
				menu.close()
				CurrentAction     = 'armurier_craft_menu'
				CurrentActionMsg  = _U'open_craft'
				CurrentActionData = {}
			end
		)
	else
		ESX.ShowNotification('not_experienced_enough')
	end
end

----- Menu de Vente -----
function OpenResellMenu()

	if Config.EnablePlayerManagement and PlayerData.job ~= nil then
		local elements = {
			{label = 'Chargeur', value = 'clip'},
		}

		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'armurier_resell',
			{
				title    = _U('resell'),
				elements = elements
			},
			function(data, menu)
				if data.current.value == 'clip' then
					menu.close()
					TriggerServerEvent('esx_armurierjob:startResell')
				end

			end,
			function(data, menu)
				menu.close()
				CurrentAction     = 'armurier_resell_menu'
				CurrentActionMsg  = _U'open_resell'
				CurrentActionData = {}
			end
		)
	else
		ESX.ShowNotification('not_experienced_enough')
	end
end

function OpenIdentityCardMenu(player)

  if Config.EnableESXIdentity then

    ESX.TriggerServerCallback('esx_armurierjob:getOtherPlayerData', function(data)

      local sexLabel    = nil
      local sex         = nil
      local dobLabel    = nil
      local heightLabel = nil

      if data.job.grade_label ~= nil and  data.job.grade_label ~= '' then
        jobLabel = 'Job : ' .. data.job.label .. ' - ' .. data.job.grade_label
      else
        jobLabel = 'Job : ' .. data.job.label
      end

      if data.sex ~= nil then
        if (data.sex == 'm') or (data.sex == 'M') then
          sex = 'Homme'
        else
          sex = 'Femme'
        end
        sexLabel = 'Sexe : ' .. sex
      else
        sexLabel = 'Sexe : Inconnu'
      end

      if data.dob ~= nil then
        dobLabel = 'Date de naissance : ' .. data.dob
      else
        dobLabel = 'Date de naissance : Inconnu'
      end

      if data.height ~= nil then
        heightLabel = 'Taille : ' .. data.height
      else
        heightLabel = 'Taille : Inconnu'
      end

      local elements = {
        {label = _U('name') .. data.firstname .. " " .. data.lastname, value = nil},
        {label = sexLabel,    value = nil},
        {label = dobLabel,    value = nil},
        {label = heightLabel, value = nil},
      }

      if data.drunk ~= nil then
        table.insert(elements, {label = _U('bac') .. data.drunk .. '%', value = nil})
      end

      if data.licenses ~= nil then

        table.insert(elements, {label = '--- Licenses ---', value = nil})

        for i=1, #data.licenses, 1 do
          table.insert(elements, {label = data.licenses[i].label, value = nil})
        end

      end

      ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'citizen_interaction',
        {
          title    = _U('citizen_interaction'),
          align    = 'top-left',
          elements = elements,
        },
        function(data, menu)

        end,
        function(data, menu)
          menu.close()
        end
      )

    end, GetPlayerServerId(player))

  else

    ESX.TriggerServerCallback('esx_armurierjob:getOtherPlayerData', function(data)

      local jobLabel = nil

      if data.job.grade_label ~= nil and  data.job.grade_label ~= '' then
        jobLabel = 'Job : ' .. data.job.label .. ' - ' .. data.job.grade_label
      else
        jobLabel = 'Job : ' .. data.job.label
      end

        local elements = {
          {label = _U('name') .. data.name, value = nil},
          {label = jobLabel,              value = nil},
        }

      if data.drunk ~= nil then
        table.insert(elements, {label = _U('bac') .. data.drunk .. '%', value = nil})
      end

      if data.licenses ~= nil then

        table.insert(elements, {label = '--- Licenses ---', value = nil})

        for i=1, #data.licenses, 1 do
          table.insert(elements, {label = data.licenses[i].label, value = nil})
        end

      end

      ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'citizen_interaction',
        {
          title    = _U('citizen_interaction'),
          align    = 'top-left',
          elements = elements,
        },
        function(data, menu)

        end,
        function(data, menu)
          menu.close()
        end
      )

    end, GetPlayerServerId(player))

  end

end

function OpenFineMenu(player)

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'fine',
    {
      title    = _U('fine'),
      align    = 'top-left',
      elements = {
        {label = _U('traffic_offense'),   value = 0},
        {label = _U('minor_offense'),     value = 1},
        {label = _U('average_offense'),   value = 2},
        {label = _U('major_offense'),     value = 3}
      },
    },
    function(data, menu)

      OpenFineCategoryMenu(player, data.current.value)

    end,
    function(data, menu)
      menu.close()
    end
  )

end

function OpenFineCategoryMenu(player, category)

  ESX.TriggerServerCallback('esx_armurierjob:getFineList', function(fines)

    local elements = {}

    for i=1, #fines, 1 do
      table.insert(elements, {
        label     = fines[i].label .. ' $' .. fines[i].amount,
        value     = fines[i].id,
        amount    = fines[i].amount,
        fineLabel = fines[i].label
      })
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'fine_category',
      {
        title    = _U('fine'),
        align    = 'top-left',
        elements = elements,
      },
      function(data, menu)

        local label  = data.current.fineLabel
        local amount = data.current.amount

        menu.close()

        if Config.EnablePlayerManagement then
          TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_armurier', _U('fine_total') .. label, amount)
        else
          TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), '', _U('fine_total') .. label, amount)
        end

        ESX.SetTimeout(300, function()
          OpenFineCategoryMenu(player, category)
        end)

      end,
      function(data, menu)
        menu.close()
      end
    )

  end, category)

end

-- Coffre Prendre Arme - Patron & Employé
function OpenGetWeaponMenu()

  ESX.TriggerServerCallback('esx_armurierjob:getArmoryWeapons', function(weapons)

    local elements = {}

    for i=1, #weapons, 1 do
      if weapons[i].count > 0 then
        table.insert(elements, {label = 'x' .. weapons[i].count .. ' ' .. ESX.GetWeaponLabel(weapons[i].name), value = weapons[i].name})
      end
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'armory_get_weapon',
      {
        title    = _U('get_weapon_menu'),
        align    = 'top-left',
        elements = elements,
      },
      function(data, menu)

        menu.close()

        ESX.TriggerServerCallback('esx_armurierjob:removeArmoryWeapon', function()
          OpenGetWeaponMenu()
        end, data.current.value)

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end

-- Coffre Déposer Arme - Patron & Employé
function OpenPutWeaponMenu()

  local elements   = {}
  local playerPed  = GetPlayerPed(-1)
  local weaponList = ESX.GetWeaponList()

  for i=1, #weaponList, 1 do

    local weaponHash = GetHashKey(weaponList[i].name)

    if HasPedGotWeapon(playerPed,  weaponHash,  false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
      local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
      table.insert(elements, {label = weaponList[i].label, value = weaponList[i].name})
    end

  end

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'armory_put_weapon',
    {
      title    = _U('put_weapon_menu'),
      align    = 'top-left',
      elements = elements,
    },
    function(data, menu)

      menu.close()

      ESX.TriggerServerCallback('esx_armurierjob:addArmoryWeapon', function()
        OpenPutWeaponMenu()
      end, data.current.value)

    end,
    function(data, menu)
      menu.close()
    end
  )

end

-- Coffre Prendre Arme - Patron
function OpenGetWeaponMenu2()

  ESX.TriggerServerCallback('esx_armurierjob:getCoffreArmoryWeapons', function(weapons)

    local elements = {}

    for i=1, #weapons, 1 do
      if weapons[i].count > 0 then
        table.insert(elements, {label = 'x' .. weapons[i].count .. ' ' .. ESX.GetWeaponLabel(weapons[i].name), value = weapons[i].name})
      end
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'coffre_get_weapon',
      {
        title    = _U('get_weapon_menu'),
        align    = 'top-left',
        elements = elements,
      },
      function(data, menu)

        menu.close()

        ESX.TriggerServerCallback('esx_armurierjob:removeCoffreArmoryWeapon', function()
          OpenGetWeaponMenu2()
        end, data.current.value)

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end

-- Coffre Déposer Arme - Patron
function OpenPutWeaponMenu2()

  local elements   = {}
  local playerPed  = GetPlayerPed(-1)
  local weaponList = ESX.GetWeaponList()

  for i=1, #weaponList, 1 do

    local weaponHash = GetHashKey(weaponList[i].name)

    if HasPedGotWeapon(playerPed,  weaponHash,  false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
      local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
      table.insert(elements, {label = weaponList[i].label, value = weaponList[i].name})
    end

  end

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'coffre_put_weapon',
    {
      title    = _U('put_weapon_menu'),
      align    = 'top-left',
      elements = elements,
    },
    function(data, menu)

      menu.close()

      ESX.TriggerServerCallback('esx_armurierjob:addCoffreArmoryWeapon', function()
        OpenPutWeaponMenu2()
      end, data.current.value)

    end,
    function(data, menu)
      menu.close()
    end
  )

end


function OpenBuyWeaponsMenu(station)

  ESX.TriggerServerCallback('esx_armurierjob:getArmoryWeapons', function(weapons)

    local elements = {}

    for i=1, #Config.ArmurierStations[station].AuthorizedWeapons, 1 do

      local weapon = Config.ArmurierStations[station].AuthorizedWeapons[i]
      local count  = 0

      for i=1, #weapons, 1 do
        if weapons[i].name == weapon.name then
          count = weapons[i].count
          break
        end
      end

      table.insert(elements, {label = 'x' .. count .. ' ' .. ESX.GetWeaponLabel(weapon.name) .. ' $' .. weapon.price, value = weapon.name, price = weapon.price})

    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'armory_buy_weapons',
      {
        title    = _U('buy_weapon_menu'),
        align    = 'top-left',
        elements = elements,
      },
      function(data, menu)

        ESX.TriggerServerCallback('esx_armurierjob:buy', function(hasEnoughMoney)

          if hasEnoughMoney then
            ESX.TriggerServerCallback('esx_armurierjob:addArmoryWeapon', function()
              OpenBuyWeaponsMenu(station)
            end, data.current.value)
          else
            ESX.ShowNotification(_U('not_enough_money'))
          end

        end, data.current.price)

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end

-- Coffre Prendre Objet - Patron & Employé
function OpenGetStocksMenu()

  ESX.TriggerServerCallback('esx_armurierjob:getStockItems', function(items)

    print(json.encode(items))

    local elements = {}

    for i=1, #items, 1 do
      table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name})
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'stocks_menu',
      {
        title    = _U('armurier_stock'),
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
              ESX.ShowNotification(_U('quantity_invalid'))
            else
              menu2.close()
              menu.close()
              OpenGetStocksMenu()

              TriggerServerEvent('esx_armurierjob:getStockItem', itemName, count)
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

-- Coffre Prendre Objet - Patron
function OpenGetStocksMenu2()

  ESX.TriggerServerCallback('esx_armurierjob:getCoffreStockItems', function(items)

    print(json.encode(items))

    local elements = {}

    for i=1, #items, 1 do
      table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name})
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'coffre_menu',
      {
        title    = _U('armurier_stock'),
        elements = elements
      },
      function(data, menu)

        local itemName = data.current.value

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'coffre_menu_get_item_count',
          {
            title = _U('quantity')
          },
          function(data2, menu2)

            local count = tonumber(data2.value)

            if count == nil then
              ESX.ShowNotification(_U('quantity_invalid'))
            else
              menu2.close()
              menu.close()
              OpenGetStocksMenu2()

              TriggerServerEvent('esx_armurierjob:getCoffreStockItem', itemName, count)
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

-- Coffre Déposer Objet - Patron & Employé
function OpenPutStocksMenu()

  ESX.TriggerServerCallback('esx_armurierjob:getPlayerInventory', function(inventory)

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
              ESX.ShowNotification(_U('quantity_invalid'))
            else
              menu2.close()
              menu.close()
              OpenPutStocksMenu()

              TriggerServerEvent('esx_armurierjob:putStockItems', itemName, count)
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

-- Coffre Déposer Objet - Patron
function OpenPutStocksMenu2()

  ESX.TriggerServerCallback('esx_armurierjob:getPlayerInventory', function(inventory)

    local elements = {}

    for i=1, #inventory.items, 1 do

      local item = inventory.items[i]

      if item.count > 0 then
        table.insert(elements, {label = item.label .. ' x' .. item.count, type = 'item_standard', value = item.name})
      end

    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'coffre_menu',
      {
        title    = _U('inventory'),
        elements = elements
      },
      function(data, menu)

        local itemName = data.current.value

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'coffre_menu_put_item_count',
          {
            title = _U('quantity')
          },
          function(data2, menu2)

            local count = tonumber(data2.value)

            if count == nil then
              ESX.ShowNotification(_U('quantity_invalid'))
            else
              menu2.close()
              menu.close()
              OpenPutStocksMenu2()

              TriggerServerEvent('esx_armurierjob:putCoffreStockItems', itemName, count)
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

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

AddEventHandler('esx_armurierjob:hasEnteredMarker', function(station, part, partNum)

  if part == 'Cloakroom' then
    CurrentAction     = 'menu_cloakroom'
    CurrentActionMsg  = _U('open_cloackroom')
    CurrentActionData = {}
  end

  if part == 'Armory' then
    CurrentAction     = 'menu_armory'
    CurrentActionMsg  = _U('open_armory')
    CurrentActionData = {station = station}
  end

  if part == 'Armory2' then
    CurrentAction     = 'menu_coffre'
    CurrentActionMsg  = _U('open_armory')
    CurrentActionData = {station = station}
  end

  if part == 'Harvest' then
    CurrentAction     = 'armurier_harvest_menu'
    CurrentActionMsg  = _U('open_harvest')
    CurrentActionData = {station = station}
  end

  if part == 'Craft' then
    CurrentAction     = 'armurier_craft_menu'
    CurrentActionMsg  = _U('open_craft')
    CurrentActionData = {station = station}
  end

  if part == 'Delivery' then
    CurrentAction     = 'armurier_resell_menu'
    CurrentActionMsg  = _U('open_resell')
    CurrentActionData = {station = station}
  end

  if part == 'VehicleSpawner' then
    CurrentAction     = 'menu_vehicle_spawner'
    CurrentActionMsg  = _U('vehicle_spawner')
    CurrentActionData = {station = station, partNum = partNum}
  end

  if part == 'VehicleDeleter' then

    local playerPed = GetPlayerPed(-1)
    local coords    = GetEntityCoords(playerPed)

    if IsPedInAnyVehicle(playerPed,  false) then

      local vehicle = GetVehiclePedIsIn(playerPed, false)

      if DoesEntityExist(vehicle) then
        CurrentAction     = 'delete_vehicle'
        CurrentActionMsg  = _U('store_vehicle')
        CurrentActionData = {vehicle = vehicle}
      end

    end

  end

  if part == 'BossActions' then
    CurrentAction     = 'menu_boss_actions'
    CurrentActionMsg  = _U('open_bossmenu')
    CurrentActionData = {}
  end

end)

AddEventHandler('esx_armurierjob:hasExitedMarker', function(station, part, partNum)

  if part == 'Craft' then
    TriggerServerEvent('esx_armurierjob:stopCraft')
  end

  if part == 'Delivery' then
	TriggerServerEvent('esx_armurierjob:stopResell')
  end

  if part == 'Harvest' then
    TriggerServerEvent('esx_armurierjob:stopHarvest')
    TriggerServerEvent('esx_armurierjob:stopHarvest2')
  end

  CurrentAction = nil
  ESX.UI.Menu.CloseAll()
end)

AddEventHandler('esx_armurierjob:hasEnteredEntityZone', function(entity)

  local playerPed = GetPlayerPed(-1)

  if PlayerData.job ~= nil and PlayerData.job.name == 'armurier' and not IsPedInAnyVehicle(playerPed, false) then
    CurrentAction     = 'remove_entity'
    CurrentActionMsg  = _U('remove_object')
    CurrentActionData = {entity = entity}
  end

  if GetEntityModel(entity) == GetHashKey('p_ld_stinger_s') then

    local playerPed = GetPlayerPed(-1)
    local coords    = GetEntityCoords(playerPed)

    if IsPedInAnyVehicle(playerPed,  false) then

      local vehicle = GetVehiclePedIsIn(playerPed)

      for i=0, 7, 1 do
        SetVehicleTyreBurst(vehicle,  i,  true,  1000)
      end

    end

  end

end)

AddEventHandler('esx_armurierjob:hasExitedEntityZone', function(entity)

  if CurrentAction == 'remove_entity' then
    CurrentAction = nil
  end

end)

Citizen.CreateThread(function()
  while true do
    Wait(0)
    if IsHandcuffed then
      if IsDragged then
        local ped = GetPlayerPed(GetPlayerFromServerId(CopPed))
        local myped = GetPlayerPed(-1)
        AttachEntityToEntity(myped, ped, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
      else
        DetachEntity(GetPlayerPed(-1), true, false)
      end
    end
  end
end)

RegisterNetEvent('esx_armurierjob:putInVehicle')
AddEventHandler('esx_armurierjob:putInVehicle', function()

  local playerPed = GetPlayerPed(-1)
  local coords    = GetEntityCoords(playerPed)

  if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then

    local vehicle = GetClosestVehicle(coords.x,  coords.y,  coords.z,  5.0,  0,  71)

    if DoesEntityExist(vehicle) then

      local maxSeats = GetVehicleMaxNumberOfPassengers(vehicle)
      local freeSeat = nil

      for i=maxSeats - 1, 0, -1 do
        if IsVehicleSeatFree(vehicle,  i) then
          freeSeat = i
          break
        end
      end

      if freeSeat ~= nil then
        TaskWarpPedIntoVehicle(playerPed,  vehicle,  freeSeat)
      end

    end

  end

end)

RegisterNetEvent('esx_armurierjob:OutVehicle')
AddEventHandler('esx_armurierjob:OutVehicle', function(t)
  local ped = GetPlayerPed(t)
  ClearPedTasksImmediately(ped)
  plyPos = GetEntityCoords(GetPlayerPed(-1),  true)
  local xnew = plyPos.x+2
  local ynew = plyPos.y+2

  SetEntityCoords(GetPlayerPed(-1), xnew, ynew, plyPos.z)
end)

-- Create blips
Citizen.CreateThread(function()

  for k,v in pairs(Config.ArmurierStations) do

    local blip = AddBlipForCoord(v.Blip.Pos.x, v.Blip.Pos.y, v.Blip.Pos.z)

    SetBlipSprite (blip, v.Blip.Sprite)
    SetBlipDisplay(blip, v.Blip.Display)
    SetBlipScale  (blip, v.Blip.Scale)
    SetBlipColour (blip, v.Blip.Colour)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(_U('map_blip'))
    EndTextCommandSetBlipName(blip)

  end

end)

-- Display markers
Citizen.CreateThread(function()
  while true do

    Wait(0)

    if PlayerData.job ~= nil and PlayerData.job.name == 'armurier' then

      local playerPed = GetPlayerPed(-1)
      local coords    = GetEntityCoords(playerPed)

      for k,v in pairs(Config.ArmurierStations) do

        for i=1, #v.Cloakrooms, 1 do
          if GetDistanceBetweenCoords(coords,  v.Cloakrooms[i].x,  v.Cloakrooms[i].y,  v.Cloakrooms[i].z,  true) < Config.DrawDistance then
            DrawMarker(Config.MarkerType, v.Cloakrooms[i].x, v.Cloakrooms[i].y, v.Cloakrooms[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
          end
        end

        for i=1, #v.Armories, 1 do
          if GetDistanceBetweenCoords(coords,  v.Armories[i].x,  v.Armories[i].y,  v.Armories[i].z,  true) < Config.DrawDistance then
            DrawMarker(Config.MarkerType, v.Armories[i].x, v.Armories[i].y, v.Armories[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
          end
        end

        for i=1, #v.Armories2, 1 do
          if GetDistanceBetweenCoords(coords,  v.Armories2[i].x,  v.Armories2[i].y,  v.Armories2[i].z,  true) < Config.DrawDistance then
            DrawMarker(Config.MarkerType, v.Armories2[i].x, v.Armories2[i].y, v.Armories2[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
          end
        end

        for i=1, #v.Harvest, 1 do
          if GetDistanceBetweenCoords(coords,  v.Harvest[i].x,  v.Harvest[i].y,  v.Harvest[i].z,  true) < Config.DrawDistance then
            DrawMarker(Config.MarkerType, v.Harvest[i].x, v.Harvest[i].y, v.Harvest[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
          end
        end

        for i=1, #v.Craft, 1 do
          if GetDistanceBetweenCoords(coords,  v.Craft[i].x,  v.Craft[i].y,  v.Craft[i].z,  true) < Config.DrawDistance then
            DrawMarker(Config.MarkerType, v.Craft[i].x, v.Craft[i].y, v.Craft[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
          end
        end

        for i=1, #v.Delivery, 1 do
          if GetDistanceBetweenCoords(coords,  v.Delivery[i].x,  v.Delivery[i].y,  v.Delivery[i].z,  true) < Config.DrawDistance then
            DrawMarker(Config.MarkerType, v.Delivery[i].x, v.Delivery[i].y, v.Delivery[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
          end
        end

        for i=1, #v.Vehicles, 1 do
          if GetDistanceBetweenCoords(coords,  v.Vehicles[i].Spawner.x,  v.Vehicles[i].Spawner.y,  v.Vehicles[i].Spawner.z,  true) < Config.DrawDistance then
            DrawMarker(Config.MarkerType, v.Vehicles[i].Spawner.x, v.Vehicles[i].Spawner.y, v.Vehicles[i].Spawner.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
          end
        end

        for i=1, #v.VehicleDeleters, 1 do
          if GetDistanceBetweenCoords(coords,  v.VehicleDeleters[i].x,  v.VehicleDeleters[i].y,  v.VehicleDeleters[i].z,  true) < Config.DrawDistance then
            DrawMarker(Config.MarkerType, v.VehicleDeleters[i].x, v.VehicleDeleters[i].y, v.VehicleDeleters[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
          end
        end

        if Config.EnablePlayerManagement and PlayerData.job ~= nil and PlayerData.job.name == 'armurier' and PlayerData.job.grade_name == 'boss' then

          for i=1, #v.BossActions, 1 do
            if not v.BossActions[i].disabled and GetDistanceBetweenCoords(coords,  v.BossActions[i].x,  v.BossActions[i].y,  v.BossActions[i].z,  true) < Config.DrawDistance then
              DrawMarker(Config.MarkerType, v.BossActions[i].x, v.BossActions[i].y, v.BossActions[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
            end
          end

        end

      end

    end

  end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()

  while true do

    Wait(0)

    if PlayerData.job ~= nil and PlayerData.job.name == 'armurier' then

      local playerPed      = GetPlayerPed(-1)
      local coords         = GetEntityCoords(playerPed)
      local isInMarker     = false
      local currentStation = nil
      local currentPart    = nil
      local currentPartNum = nil

      for k,v in pairs(Config.ArmurierStations) do

        for i=1, #v.Cloakrooms, 1 do
          if GetDistanceBetweenCoords(coords,  v.Cloakrooms[i].x,  v.Cloakrooms[i].y,  v.Cloakrooms[i].z,  true) < Config.MarkerSize.x then
            isInMarker     = true
            currentStation = k
            currentPart    = 'Cloakroom'
            currentPartNum = i
          end
        end

        for i=1, #v.Armories, 1 do
          if GetDistanceBetweenCoords(coords,  v.Armories[i].x,  v.Armories[i].y,  v.Armories[i].z,  true) < Config.MarkerSize.x then
            isInMarker     = true
            currentStation = k
            currentPart    = 'Armory'
            currentPartNum = i
          end
        end

        for i=1, #v.Armories2, 1 do
          if GetDistanceBetweenCoords(coords,  v.Armories2[i].x,  v.Armories2[i].y,  v.Armories2[i].z,  true) < Config.MarkerSize.x then
            isInMarker     = true
            currentStation = k
            currentPart    = 'Armory2'
            currentPartNum = i
          end
        end

        for i=1, #v.Harvest, 1 do
          if GetDistanceBetweenCoords(coords,  v.Harvest[i].x,  v.Harvest[i].y,  v.Harvest[i].z,  true) < Config.MarkerSize.x then
            isInMarker     = true
            currentStation = k
            currentPart    = 'Harvest'
            currentPartNum = i
          end
        end

        for i=1, #v.Craft, 1 do
          if GetDistanceBetweenCoords(coords,  v.Craft[i].x,  v.Craft[i].y,  v.Craft[i].z,  true) < Config.MarkerSize.x then
            isInMarker     = true
            currentStation = k
            currentPart    = 'Craft'
            currentPartNum = i
          end
        end

        for i=1, #v.Delivery, 1 do
          if GetDistanceBetweenCoords(coords,  v.Delivery[i].x,  v.Delivery[i].y,  v.Delivery[i].z,  true) < Config.MarkerSize.x then
            isInMarker     = true
            currentStation = k
            currentPart    = 'Delivery'
            currentPartNum = i
          end
        end

        for i=1, #v.Vehicles, 1 do

          if GetDistanceBetweenCoords(coords,  v.Vehicles[i].Spawner.x,  v.Vehicles[i].Spawner.y,  v.Vehicles[i].Spawner.z,  true) < Config.MarkerSize.x then
            isInMarker     = true
            currentStation = k
            currentPart    = 'VehicleSpawner'
            currentPartNum = i
          end

          if GetDistanceBetweenCoords(coords,  v.Vehicles[i].SpawnPoint.x,  v.Vehicles[i].SpawnPoint.y,  v.Vehicles[i].SpawnPoint.z,  true) < Config.MarkerSize.x then
            isInMarker     = true
            currentStation = k
            currentPart    = 'VehicleSpawnPoint'
            currentPartNum = i
          end
        end

----

        for i=1, #v.VehicleDeleters, 1 do
          if GetDistanceBetweenCoords(coords,  v.VehicleDeleters[i].x,  v.VehicleDeleters[i].y,  v.VehicleDeleters[i].z,  true) < Config.MarkerSize.x then
            isInMarker     = true
            currentStation = k
            currentPart    = 'VehicleDeleter'
            currentPartNum = i
          end
        end

        if Config.EnablePlayerManagement and PlayerData.job ~= nil and PlayerData.job.name == 'armurier' and PlayerData.job.grade_name == 'boss' then

          for i=1, #v.BossActions, 1 do
            if GetDistanceBetweenCoords(coords,  v.BossActions[i].x,  v.BossActions[i].y,  v.BossActions[i].z,  true) < Config.MarkerSize.x then
              isInMarker     = true
              currentStation = k
              currentPart    = 'BossActions'
              currentPartNum = i
            end
          end

        for i=1, #v.VehicleDeleters, 1 do
          if GetDistanceBetweenCoords(coords,  v.VehicleDeleters[i].x,  v.VehicleDeleters[i].y,  v.VehicleDeleters[i].z,  true) < Config.MarkerSize.x then
            isInMarker     = true
            currentStation = k
            currentPart    = 'VehicleDeleter'
            currentPartNum = i
          end
        end

        for i=1, #v.VehicleDeleters, 1 do
          if GetDistanceBetweenCoords(coords,  v.VehicleDeleters[i].x,  v.VehicleDeleters[i].y,  v.VehicleDeleters[i].z,  true) < Config.MarkerSize.x then
            isInMarker     = true
            currentStation = k
            currentPart    = 'VehicleDeleter'
            currentPartNum = i
          end
        end

        end
      end

      local hasExited = false

      if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum) ) then

        if
          (LastStation ~= nil and LastPart ~= nil and LastPartNum ~= nil) and
          (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)
        then
          TriggerEvent('esx_armurierjob:hasExitedMarker', LastStation, LastPart, LastPartNum)
          hasExited = true
        end

        HasAlreadyEnteredMarker = true
        LastStation             = currentStation
        LastPart                = currentPart
        LastPartNum             = currentPartNum

        TriggerEvent('esx_armurierjob:hasEnteredMarker', currentStation, currentPart, currentPartNum)
      end

      if not hasExited and not isInMarker and HasAlreadyEnteredMarker then

        HasAlreadyEnteredMarker = false

        TriggerEvent('esx_armurierjob:hasExitedMarker', LastStation, LastPart, LastPartNum)
      end

    end

  end
end)

-- Enter / Exit entity zone events
Citizen.CreateThread(function()

  local trackedEntities = {
    'prop_rub_cabinet03',
    'prop_ld_can_01',
    'prop_stockade_wheel',
    'prop_sh_mr_rasp_01',
    'prop_offroad_bale01',
	'prop_ped_pic_03',
	'prop_cs_protest_sign_02',
	'prop_dart_bd_01'
  }

  while true do

    Citizen.Wait(0)

    local playerPed = GetPlayerPed(-1)
    local coords    = GetEntityCoords(playerPed)

    local closestDistance = -1
    local closestEntity   = nil

    for i=1, #trackedEntities, 1 do

      local object = GetClosestObjectOfType(coords.x,  coords.y,  coords.z,  3.0,  GetHashKey(trackedEntities[i]), false, false, false)

      if DoesEntityExist(object) then

        local objCoords = GetEntityCoords(object)
        local distance  = GetDistanceBetweenCoords(coords.x,  coords.y,  coords.z,  objCoords.x,  objCoords.y,  objCoords.z,  true)

        if closestDistance == -1 or closestDistance > distance then
          closestDistance = distance
          closestEntity   = object
        end

      end

    end

    if closestDistance ~= -1 and closestDistance <= 3.0 then

      if LastEntity ~= closestEntity then
        TriggerEvent('esx_armurierjob:hasEnteredEntityZone', closestEntity)
        LastEntity = closestEntity
      end

    else

      if LastEntity ~= nil then
        TriggerEvent('esx_armurierjob:hasExitedEntityZone', LastEntity)
        LastEntity = nil
      end

    end

  end
end)

-- Key Controls
Citizen.CreateThread(function()
  while true do

    Citizen.Wait(0)

    if CurrentAction ~= nil then

      SetTextComponentFormat('STRING')
      AddTextComponentString(CurrentActionMsg)
      DisplayHelpTextFromStringLabel(0, 0, 1, -1)

      if IsControlPressed(0,  Keys['E']) and PlayerData.job ~= nil and PlayerData.job.name == 'armurier' and (GetGameTimer() - GUI.Time) > 150 then

        if CurrentAction == 'menu_cloakroom' then
          OpenCloakroomMenu()
        end

        if CurrentAction == 'menu_armory' then
          OpenArmoryMenu(CurrentActionData.station)
        end

        if CurrentAction == 'menu_coffre' then
          OpenArmory2Menu(CurrentActionData.station)
        end

        if CurrentAction == 'armurier_harvest_menu' then
          OpenHarvestMenu(CurrentActionData.station)
        end

        if CurrentAction == 'armurier_craft_menu' then
          OpenCraftMenu(CurrentActionData.station)
        end

        if CurrentAction == 'armurier_resell_menu' then
          OpenResellMenu(CurrentActionData.station)
        end

        if CurrentAction == 'menu_vehicle_spawner' then
          OpenVehicleSpawnerMenu(CurrentActionData.station, CurrentActionData.partNum)
        end

        if CurrentAction == 'delete_vehicle' then

          if Config.EnableSocietyOwnedVehicles then

            local vehicleProps = ESX.Game.GetVehicleProperties(CurrentActionData.vehicle)
            TriggerServerEvent('esx_society:putVehicleInGarage', 'armurier', vehicleProps)

          else

            if
              GetEntityModel(vehicle) == GetHashKey('speedo')  or
              GetEntityModel(vehicle) == GetHashKey('dinghy2')  or
              GetEntityModel(vehicle) == GetHashKey('dinghy3')
            then
              TriggerServerEvent('esx_service:disableService', 'armurier')
            end

          end

          ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
        end

        if CurrentAction == 'menu_boss_actions' then

          ESX.UI.Menu.CloseAll()

          TriggerEvent('esx_society:openBossMenu', 'armurier', function(data, menu)

            menu.close()

            CurrentAction     = 'menu_boss_actions'
            CurrentActionMsg  = _U('open_bossmenu')
            CurrentActionData = {}

          end, {wash = true})

        end

        if CurrentAction == 'remove_entity' then
          DeleteEntity(CurrentActionData.entity)
        end

        CurrentAction = nil
        GUI.Time      = GetGameTimer()

      end

    end

   if IsControlPressed(0,  Keys['F6']) and PlayerData.job ~= nil and PlayerData.job.name == 'armurier' and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'armurier_actions') and (GetGameTimer() - GUI.Time) > 150 then
     OpenArmurierActionsMenu()
     GUI.Time = GetGameTimer()
    end

  end
end)

---------------------------------------------------------------------------------------------------------
--NB : gestion des menu
---------------------------------------------------------------------------------------------------------

RegisterNetEvent('NB:openMenuArmurier')
AddEventHandler('NB:openMenuArmurier', function()
	OpenArmurierActionsMenu()
end)

-----------------------
----- TELEPORTERS -----

AddEventHandler('esx_armurierjob:teleportMarkers', function(position)
  SetEntityCoords(GetPlayerPed(-1), position.x, position.y, position.z)
end)

-- Show top left hint
Citizen.CreateThread(function()
  while true do
    Wait(0)
    if hintIsShowed == true then
      SetTextComponentFormat("STRING")
      AddTextComponentString(hintToDisplay)
      DisplayHelpTextFromStringLabel(0, 0, 1, -1)
    end
  end
end)

-- Display teleport markers
Citizen.CreateThread(function()
  while true do
    Wait(0)

    if PlayerData.job ~= nil and PlayerData.job.grade_name == 'boss' then

        local coords = GetEntityCoords(GetPlayerPed(-1))
        for k,v in pairs(Config.TeleportZones) do
          if(v.Marker ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
            DrawMarker(v.Marker, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
          end
        end

    end

  end
end)

-- Activate teleport marker
Citizen.CreateThread(function()
  while true do
    Wait(0)
    local coords      = GetEntityCoords(GetPlayerPed(-1))
    local position    = nil
    local zone        = nil

    if PlayerData.job ~= nil and PlayerData.job.grade_name == 'boss' then

        for k,v in pairs(Config.TeleportZones) do
          if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
            isInPublicMarker = true
            position = v.Teleport
            zone = v
            break
          else
            isInPublicMarker  = false
          end
        end

        if IsControlJustReleased(0, Keys["E"]) and isInPublicMarker then
          TriggerEvent('esx_armurierjob:teleportMarkers', position)
        end

        -- hide or show top left zone hints
        if isInPublicMarker then
          hintToDisplay = zone.Hint
          hintIsShowed = true
        else
          if not isInMarker then
            hintToDisplay = "no hint to display"
            hintIsShowed = false
          end
        end

    end

  end
end)
