local ESX = nil
local isCagoule = false
local forceFirstPerson = false
local menuIsOpen = false

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(1)
  end
end)

RegisterNetEvent("esx_screeneffect:switch")
AddEventHandler("esx_screeneffect:switch", function(ptype)
  if ptype == "cagoule" then
    if isCagoule == true then
      isCagoule = false
      closeScreenEffect(ptype)
    else 
      isCagoule = true
      openScreenEffect(ptype)
    end
    changeTenue()
  end
end)

RegisterNetEvent("esx_screeneffect:put")
AddEventHandler("esx_screeneffect:put", function(ptype)
    local t, distance = GetClosestPlayer()
    if t ~= -1 and distance < 3.0 then
      TriggerServerEvent('esx_screeneffect:putOnPlayer', GetPlayerServerId(t), ptype)
    end
end)


function openScreenEffect(type)
		SendNUIMessage({method = 'display',  pType = type})
    DisplayRadar(false)
    forceFirstPerson = true
end
 
 
function closeScreenEffect(type)
		SendNUIMessage({method = 'hideAll',  pType = type})
    DisplayRadar(true)
    forceFirstPerson = false
end

function changeTenue()
  if isCagoule then

      TriggerEvent('skinchanger:getSkin', function(skin)
        local clothesSkin = {
          ['mask_1']    = 69, ['mask_2']  = 2
        }
        TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
      end)
  else

    TriggerEvent('skinchanger:getSkin', function(skin)

      ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, hasSkin)

        if hasSkin then

          TriggerEvent('skinchanger:loadSkin', skin)
          TriggerEvent('esx:restoreLoadout')
        end
      end)
    end)
  end
end

-- CODE --
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1)

    if forceFirstPerson then
      SetFollowPedCamViewMode(4)
    end
  end
end)

function GetPlayers()
    local players = {}

    for i = 0, 31 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end

function GetClosestPlayer()
  local players = GetPlayers()
  local closestDistance = -1
  local closestPlayer = -1
  local ply = GetPlayerPed(-1)
  local plyCoords = GetEntityCoords(ply, 0)
  
  for index,value in ipairs(players) do
    local target = GetPlayerPed(value)
    if(target ~= ply) then
      local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
      local distance = GetDistanceBetweenCoords(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
      if(closestDistance == -1 or closestDistance > distance) then
        closestPlayer = value
        closestDistance = distance
      end
    end
  end
  
  return closestPlayer, closestDistance
end
