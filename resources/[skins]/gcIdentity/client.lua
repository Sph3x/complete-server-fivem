--====================================================================================
-- #Author: Jonathan D @ Gannon
-- 
-- Developed for the n3mtv community
--====================================================================================
 
-- Configuration
local KeyToucheClose = 177 -- PhoneCancel
local distMaxCheck = 3

-- Variable | 0 close | 1 Identity | 2 register
local menuIsOpen = 0

local myIdentity = {}
 
ESX          = nil
--====================================================================================
--  TEMPORARY Thread interaction
--====================================================================================
 
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if menuIsOpen ~= 0 then
      if IsControlJustPressed(1, KeyToucheClose) and menuIsOpen == 1 then
        closeGui()
      elseif menuIsOpen == 2 then
        local ply = GetPlayerPed(-1)
        DisableControlAction(0, 1, true)
        DisableControlAction(0, 2, true)
        DisableControlAction(0, 24, true)
        DisablePlayerFiring(ply, true)
        DisableControlAction(0, 142, true)
        DisableControlAction(0, 106, true)
        DisableControlAction(0,KeyToucheClose,true)
        if IsDisabledControlJustReleased(0, 142) then
          SendNUIMessage({method = "clickGui"})
        end
      end
    end
  end
end)

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)
 
--====================================================================================
--  User Event
--====================================================================================
RegisterNetEvent("gcIdentity:showIdentity")
AddEventHandler("gcIdentity:showIdentity", function()
    local p , dist  = GetClosestPlayer(distMaxCheck)
    if p ~= -1 then
        TriggerServerEvent('gcIdentity:openIdentity', GetPlayerServerId(p))
    end
end)
 
RegisterNetEvent("gcIdentity:openMeIdentity")
AddEventHandler("gcIdentity:openMeIdentity", function()
      openGuiIdentity(myIdentity)
end)
 
--====================================================================================
--  Server Event Management
--====================================================================================
RegisterNetEvent("gcIdentity:showIdentityData")
AddEventHandler("gcIdentity:showIdentityData", function(data)
  print('HEY')
  openGuiIdentity(data)
end)

--RegisterNetEvent("gcIdentity:showRegisterIdentity")
--AddEventHandler("gcIdentity:showRegisterIdentity", function()
 -- openGuiRegisterIdentity()
--end)
 
RegisterNetEvent("gcIdentity:setIdentity")
AddEventHandler("gcIdentity:setIdentity", function(identity)
  myIdentity = identity
end)
 
RegisterNUICallback('register', function(data, cb)
    closeGui()
    TriggerServerEvent('gcIdentity:setIdentity', data)
    myIdentity = data
    cb()
end)
 
--====================================================================================
-- UI Management
--====================================================================================
function openGuiIdentity(data)
  --SetNuiFocus(true)
  SendNUIMessage({method = 'openGuiIdentity',  data = data})
  Citizen.Trace('Data : ' .. json.encode(data))
  menuIsOpen = 1
end
 
--function openGuiRegisterIdentity()
 -- SetNuiFocus(true)
 -- SendNUIMessage({method = 'openGuiRegisterIdentity'})
 -- menuIsOpen = 2
--end
 
function closeGui()
  --SetNuiFocus(false)
  SendNUIMessage({method = 'closeGui'})
  menuIsOpen = 0
end
 
--====================================================================================
--  export function
--====================================================================================
function getIdentity()
  return myIdentity
end

--====================================================================================
--  Utils function
--====================================================================================
function GetClosestPlayer(distmax)
    local players = GetPlayers()
    local closestDistance = distmax or -1
    local closestPlayer = -1
    local ply = GetPlayerPed(-1)
    local plyCoords = GetEntityCoords(ply, 0)
   
    for _ ,value in ipairs(players) do
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
 
function GetPlayers()
    local players = {}
    for i = 0, 31 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end
    return players
end
