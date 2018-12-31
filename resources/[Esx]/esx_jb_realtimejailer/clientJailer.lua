local cJ = false
local IsPlayerUnjailed = false


--ESX base

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent("esx_jb_jailer:JailInStation")
AddEventHandler("esx_jb_jailer:JailInStation", function(Station, JailTime)
	jailing(Station, JailTime)
end)

function jailing(Station, JailTime)
	if cJ == true then
		return
	end
	local PlayerPed = GetPlayerPed(-1)
	if DoesEntityExist(PlayerPed) then
		
		Citizen.CreateThread(function()
			local spawnloccoords = {}
			SetJailClothes()
			spawnloccoords = SetPlayerSpawnLocationjail(Station)
			SetEntityCoords(PlayerPed, spawnloccoords.x,spawnloccoords.y, spawnloccoords.z )
			cJ = true
			IsPlayerUnjailed = false
			while JailTime > 0 and not IsPlayerUnjailed do
				local remainingjailseconds = JailTime/ 60
				local jailseconds =  math.floor(JailTime) % 60 
				local remainingjailminutes = remainingjailseconds / 60
				local jailminutes =  math.floor(remainingjailseconds) % 60
				local remainingjailhours = remainingjailminutes / 24
				local jailhours =  math.floor(remainingjailminutes) % 24
				local remainingjaildays = remainingjailhours / 365 
				local jaildays =  math.floor(remainingjailhours) % 365

				
				PlayerPed = GetPlayerPed(-1)
				--RemoveAllPedWeapons(PlayerPed, true)
				--SetEntityInvincible(PlayerPed, true)
				if IsPedInAnyVehicle(PlayerPed, false) then
					ClearPedTasksImmediately(PlayerPed)
				end
				if JailTime % 10 == 0 then
					if JailTime % 30 == 0 then
						TriggerEvent('chatMessage', 'SYSTEM', { 0, 0, 0 }, math.floor(jaildays).." jours, "..math.floor(jailhours).." heures,"..math.floor(jailminutes).." minutes, "..math.floor(jailseconds).." secondes avant d'être libéré.")
					end
				end
				Citizen.Wait(1000)
				local pL = GetEntityCoords(PlayerPed, true)
				local D = Vdist(spawnloccoords.x,spawnloccoords.y, spawnloccoords.z, pL['x'], pL['y'], pL['z'])
				if D > spawnloccoords.distance then -- distance#######################################################################################
					SetEntityCoords(PlayerPed, spawnloccoords.x,spawnloccoords.y, spawnloccoords.z)
				end
				JailTime = JailTime - 1.0
			end
			TriggerServerEvent('chatMessageEntered', "SYSTEM", { 0, 0, 0 }, GetPlayerName(PlayerId()) .." a été libéré de la prison.")
			GetBackOriginalClothes()
			local outsidecoords = {}
			outsidecoords = SetPlayerSpawnLocationoutsidejail(Station)
			SetEntityCoords(PlayerPed, outsidecoords.x,outsidecoords.y,outsidecoords.z )
			cJ = false
			--SetEntityInvincible(PlayerPed, false)
			TriggerEvent('esx_society:getPlayerSkin')
		end)
	end
end

function SetPlayerSpawnLocationjail(location)
	if location == 'JailPoliceStation1' then
		return {x=459.5500793457, y=-994.46508789063, z=23.914855957031, distance = 2}
	elseif location == 'JailPoliceStation2' then
		return {x=458.41693115234,y=-997.93572998047,z=23.914854049683, distance = 2}	
	elseif location == 'JailPoliceStation3' then
		return {x=458.29275512695,y=-1001.5576782227,z=23.914852142334, distance = 2}	
	elseif location == 'FederalJail' then
		return {x=1643.7593994141,y=2530.9877929688,z=44.564888000488, distance = 80}
	end
end

function SetPlayerSpawnLocationoutsidejail(location)
	if location == 'JailPoliceStation1' then
		return {x=432.95864868164,y=-981.41455078125,z=29.710334777832}
	elseif location == 'JailPoliceStation2' then
		return {x=432.95864868164,y=-981.41455078125,z=29.710334777832}	
	elseif location == 'JailPoliceStation3' then
		return {x=432.95864868164,y=-981.41455078125,z=29.710334777832}	
	elseif location == 'FederalJail' then
		return {x=1847.5042724609,y=2586.2209472656,z=44.672046661377}
	end
end

RegisterNetEvent("esx_jb_jailer:UnJail")
AddEventHandler("esx_jb_jailer:UnJail", function()
	IsPlayerUnjailed = true
	GetBackOriginalClothes()
end)

function SetJailClothes()
local playerPed = GetPlayerPed(-1)
  TriggerEvent('skinchanger:getSkin', function(skin)
     if skin.sex == 0 then
      if Config.Clothes.police.prison_wear.male ~= nil then
        TriggerEvent('skinchanger:loadClothes', skin, Config.Clothes.police.prison_wear.male)
      else
        ESX.ShowNotification('no_outfit')
      end
    else
      if Config.Clothes.police.prison_wear.female ~= nil then
        TriggerEvent('skinchanger:loadClothes', skin, Config.Clothes.police.prison_wear.female)
      else
        ESX.ShowNotification('no_outfit')
      end
    end
  end)
end

function GetBackOriginalClothes()
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
	  TriggerEvent('skinchanger:loadSkin', skin)
	end)
end
