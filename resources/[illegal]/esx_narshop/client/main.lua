ESX                           = nil
local HasAlreadyEnteredMarker = false
local LastZone                = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local PlayerData              = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	Citizen.Wait(5000)
	PlayerData = ESX.GetPlayerData()

	ESX.TriggerServerCallback('esx_narshop:requestDBItems', function(ShopItems)
		for k,v in pairs(ShopItems) do
			Config.Zones[k].Items = v
		end
	end)
end)

function OpenShopMenu(zone)
	PlayerData = ESX.GetPlayerData()

	local elements = {}
	for i=1, #Config.Zones[zone].Items, 1 do
		local item = Config.Zones[zone].Items[i]

		if item.limit == -1 then
			item.limit = 100
		end

		table.insert(elements, {
			label      = item.label .. ' - <span style="color: green;">$' .. item.price .. '</span>',
			label_real = item.label,
			item       = item.item,
			price      = item.price,

			-- menu properties
			value      = 1,
			type       = 'slider',
			min        = 1,
			max        = item.limit
		})
	end

	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop', {
		title    = _U('shop'),
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_confirm', {
			title    = _U('shop_confirm', data.current.value, data.current.label_real, data.current.price * data.current.value),
			align    = 'bottom-right',
			elements = {
				{label = _U('no'),  value = 'no'},
				{label = _U('yes'), value = 'yes'}
			}
		}, function(data2, menu2)
			if data2.current.value == 'yes' then
				TriggerServerEvent('esx_narshop:buyItem', data.current.item, data.current.value, zone)
			end

			menu2.close()
		end, function(data2, menu2)
			menu2.close()
		end)
	end, function(data, menu)
		menu.close()
		CurrentAction     = 'shop_menu'
		CurrentActionMsg  = _U('press_menu')
		CurrentActionData = {zone = zone}
	end)
end

AddEventHandler('esx_narshop:hasEnteredMarker', function(zone)
	CurrentAction     = 'shop_menu'
	CurrentActionMsg  = _U('press_menu')
	CurrentActionData = {zone = zone}
end)

AddEventHandler('esx_narshop:hasExitedMarker', function(zone)
	CurrentAction = nil
	ESX.UI.Menu.CloseAll()
end)

-- Create Blips
Citizen.CreateThread(function()
	for k,v in pairs(Config.Zones) do
		for i = 1, #v.Pos, 1 do
			local blip = AddBlipForCoord(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
			SetBlipSprite (blip, 110)
			SetBlipDisplay(blip, 4)
			SetBlipScale  (blip, 1.0)
			SetBlipColour (blip, 49)
			SetBlipAsShortRange(blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(_U('narekshop'))
			EndTextCommandSetBlipName(blip)
		end
	end
end)

-- Display markers
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		local coords = GetEntityCoords(GetPlayerPed(-1))

		for k,v in pairs(Config.Zones) do
			for i = 1, #v.Pos, 1 do
				if(Config.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, true) < Config.DrawDistance) then
					DrawMarker(Config.Type, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g, Config.Color.b, 100, false, true, 2, false, false, false, false)
				end
			end
		end
	end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		local coords      = GetEntityCoords(GetPlayerPed(-1))
		local isInMarker  = false
		local currentZone = nil

		for k,v in pairs(Config.Zones) do
			for i = 1, #v.Pos, 1 do
				if(GetDistanceBetweenCoords(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, true) < Config.Size.x) then
					isInMarker  = true
					ShopItems   = v.Items
					currentZone = k
					LastZone    = k
				end
			end
		end
		if isInMarker and not HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = true
			TriggerEvent('esx_narshop:hasEnteredMarker', currentZone)
		end
		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_narshop:hasExitedMarker', LastZone)
		end
	end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)

		if CurrentAction ~= nil then

			SetTextComponentFormat('STRING')
			AddTextComponentString(CurrentActionMsg)
			DisplayHelpTextFromStringLabel(0, 0, 1, -1)

			if IsControlJustReleased(0, 38) then

				if CurrentAction == 'shop_menu' then
					OpenShopMenu(CurrentActionData.zone)
				end

				CurrentAction = nil

			end

		else
			Citizen.Wait(500)
		end
	end
end)

RegisterNetEvent('esx_narshop:clipcli')
AddEventHandler('esx_narshop:clipcli', function()
  ped = GetPlayerPed(-1)
  if IsPedArmed(ped, 4) then
    hash=GetSelectedPedWeapon(ped)
    if hash~=nil then
      TriggerServerEvent('esx_narshop:remove')
      AddAmmoToPed(GetPlayerPed(-1), hash,25)
      ESX.ShowNotification("tu a utilisé un chargeur")
    else
      ESX.ShowNotification("tu n'a pas d'arme en main")
    end
  else
    ESX.ShowNotification("ce type de munision ne convient pas")
  end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer 
end)

				local used = 0

RegisterNetEvent('esx_narshop:silencieux')
AddEventHandler('esx_narshop:silencieux', function(duration)
				local inventory = ESX.GetPlayerData().inventory
				local silencieux = 0
					for i=1, #inventory, 1 do
					  if inventory[i].name == 'silencieux' then
						silencieux = inventory[i].count
					  end
					end
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used < silencieux then

			if currentWeaponHash == GetHashKey("WEAPON_PISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("component_at_pi_supp_02"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville.")) 
		  		 	used = used + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL50") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville.")) 
		  			used = used + 1


		  	elseif currentWeaponHash == GetHashKey("WEAPON_COMBATPISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville.")) 
					used = used + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_APPISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville.")) 
		  		 	used = used + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville.")) 
		  			used = used + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_VINTAGEPISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_VINTAGEPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville."))
		  		  	used = used + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_SMG") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville.")) 
		  		 	used = used + 1


		  	elseif currentWeaponHash == GetHashKey("WEAPON_MICROSMG") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville.")) 
	used = used + 1
				

		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSMG") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville.")) 
	used = used + 1
		  		

		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville.")) 
	used = used + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville.")) 
	used = used + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville.")) 
	used = used + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville.")) 
	used = used + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville.")) 
	used = used + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSHOTGUN") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSHOTGUN"), GetHashKey("COMPONENT_AT_AR_SUPP"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville.")) 
	used = used + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYSHOTGUN") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSHOTGUN"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville.")) 
	used = used + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPSHOTGUN") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPSHOTGUN"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville.")) 
	used = used + 1
		  		 
		  	elseif currentWeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN"), GetHashKey("COMPONENT_AT_SR_SUPP"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville.")) 
	used = used + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville.")) 
	used = used + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_SNIPERRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNIPERRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville.")) 
	used = used + 1
		  		
		  	else 
		  		  ESX.ShowNotification(("Vous n'avez pas d'arme en main ou votre arme ne peux pas supporter de silencieux."))
		  		
			end
			else
					  		 ESX.ShowNotification(("Vous avez utiliser tout vos silencieux.")) 

		end
end)
				local used2 = 0

RegisterNetEvent('esx_narshop:flashlight')
AddEventHandler('esx_narshop:flashlight', function(duration)
					local inventory = ESX.GetPlayerData().inventory
				local flashlight = 0
					for i=1, #inventory, 1 do
					  if inventory[i].name == 'flashlight' then
						flashlight = inventory[i].count
					  end
					end
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used2 < flashlight then
						print('used2')

			if currentWeaponHash == GetHashKey("WEAPON_PISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un lampe. Il faudra le rééquiper a chaques retours en ville.")) 
		  		 	used2 = used2 + 1
		  	elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL50") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un lampe. Il faudra le rééquiper a chaques retours en ville.")) 
	used2 = used2 + 1
		  		

		  	elseif currentWeaponHash == GetHashKey("WEAPON_COMBATPISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un lampe. Il faudra le rééquiper a chaques retours en ville.")) 
	used2 = used2 + 1
				
		  	elseif currentWeaponHash == GetHashKey("WEAPON_APPISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un lampe. Il faudra le rééquiper a chaques retours en ville.")) 
	used2 = used2 + 1
		  		 
		  	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un lampe. Il faudra le rééquiper a chaques retours en ville.")) 
	used2 = used2 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_SMG") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un lampe. Il faudra le rééquiper a chaques retours en ville.")) 
		  		 	used2 = used2 + 1


		  	elseif currentWeaponHash == GetHashKey("WEAPON_MICROSMG") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un lampe. Il faudra le rééquiper a chaques retours en ville.")) 
	used2 = used2 + 1
				

		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSMG") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un lampe. Il faudra le rééquiper a chaques retours en ville.")) 
	used2 = used2 + 1
				 
		  	elseif currentWeaponHash == GetHashKey("WEAPON_COMBATPDW") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPDW"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un lampe. Il faudra le rééquiper a chaques retours en ville.")) 
	used2 = used2 + 1
		  			

		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un lampe. Il faudra le rééquiper a chaques retours en ville.")) 
	used2 = used2 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un lampe. Il faudra le rééquiper a chaques retours en ville.")) 
	used2 = used2 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un lampe. Il faudra le rééquiper a chaques retours en ville.")) 
	used2 = used2 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un lampe. Il faudra le rééquiper a chaques retours en ville.")) 
	used2 = used2 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un lampe. Il faudra le rééquiper a chaques retours en ville.")) 
	used2 = used2 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSHOTGUN") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSHOTGUN"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un lampe. Il faudra le rééquiper a chaques retours en ville.")) 
	used2 = used2 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYSHOTGUN") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSHOTGUN"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un lampe. Il faudra le rééquiper a chaques retours en ville.")) 
	used2 = used2 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPSHOTGUN") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPSHOTGUN"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un lampe. Il faudra le rééquiper a chaques retours en ville.")) 
	used2 = used2 + 1
		  		 
		  	elseif currentWeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un lampe. Il faudra le rééquiper a chaques retours en ville.")) 
	used2 = used2 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un lampe. Il faudra le rééquiper a chaques retours en ville.")) 
	used2 = used2 + 1
		  		
		  	else 
		  		  ESX.ShowNotification(("Vous n'avez pas d'arme en main ou votre arme ne peux pas supporter de lampe."))
		  		
			end
		else
				  		  ESX.ShowNotification(("Vous avez utiliser toutes vos lampes."))

		end
end)
				local used3 = 0

RegisterNetEvent('esx_narshop:grip')
AddEventHandler('esx_narshop:grip', function(duration)
					local inventory = ESX.GetPlayerData().inventory
				local grip = 0
					for i=1, #inventory, 1 do
					  if inventory[i].name == 'grip' then
						grip = inventory[i].count
					  end
					end
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used3 < grip then

			
			if currentWeaponHash == GetHashKey("WEAPON_COMBATPDW") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPDW"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'une poignée. Il faudra le rééquiper a chaques retours en ville.")) 
		  				used3 = used3 + 1


		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'une poignée. Il faudra le rééquiper a chaques retours en ville.")) 
	used3 = used3 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'une poignée. Il faudra le rééquiper a chaques retours en ville.")) 
	used3 = used3 + 1
		  		
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'une poignée. Il faudra le rééquiper a chaques retours en ville.")) 
	used3 = used3 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'une poignée. Il faudra le rééquiper a chaques retours en ville.")) 
	used3 = used3 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSHOTGUN") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSHOTGUN"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'une poignée. Il faudra le rééquiper a chaques retours en ville.")) 
	used3 = used3 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYSHOTGUN") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSHOTGUN"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'une poignée. Il faudra le rééquiper a chaques retours en ville.")) 
	used3 = used3 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPSHOTGUN") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPSHOTGUN"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'une poignée. Il faudra le rééquiper a chaques retours en ville.")) 
	used3 = used3 + 1
		  		 
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'une poignée. Il faudra le rééquiper a chaques retours en ville.")) 
	used3 = used3 + 1
		  		
		  	else 
		  		  ESX.ShowNotification(("Vous n'avez pas d'arme en main ou votre arme ne peux pas supporter de poignée."))
		  		
			end
		else
				  		  ESX.ShowNotification(("Vous avez utiliser toutes vos poignées."))
		end
end)

				local used4 = 0

RegisterNetEvent('esx_narshop:yusuf')
AddEventHandler('esx_narshop:yusuf', function(duration)
					local inventory = ESX.GetPlayerData().inventory
				local yusuf = 0
					for i=1, #inventory, 1 do
					  if inventory[i].name == 'yusuf' then
						yusuf = inventory[i].count
					  end
					end
					
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used4 < yusuf then

			if currentWeaponHash == GetHashKey("WEAPON_PISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("COMPONENT_PISTOL_VARMOD_LUXE"))  
		  		 ESX.ShowNotification(("Vous venez d'équiper votre arme skin. Il faudra le rééquiper a chaques retours en ville.")) 
		  		 	used4 = used4 + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL50") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_PISTOL50_VARMOD_LUXE"))  
		  		 ESX.ShowNotification(("Vous venez d'équiper votre arme skin. Il faudra le rééquiper a chaques retours en ville.")) 
	used4 = used4 + 1
		  		
				
		  	elseif currentWeaponHash == GetHashKey("WEAPON_APPISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_APPISTOL_VARMOD_LUXE"))  
		  		 ESX.ShowNotification(("Vous venez d'équiper votre arme skin. Il faudra le rééquiper a chaques retours en ville.")) 
	used4 = used4 + 1
		  		 
		  	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_HEAVYPISTOL_VARMOD_LUXE"))  
		  		 ESX.ShowNotification(("Vous venez d'équiper votre arme skin. Il faudra le rééquiper a chaques retours en ville.")) 
	used4 = used4 + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_SMG") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_SMG_VARMOD_LUXE"))  
		  		 ESX.ShowNotification(("Vous venez d'équiper votre arme skin. Il faudra le rééquiper a chaques retours en ville.")) 
	used4 = used4 + 1
		  		 

		  	elseif currentWeaponHash == GetHashKey("WEAPON_MICROSMG") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_MICROSMG_VARMOD_LUXE"))  
		  		 ESX.ShowNotification(("Vous venez d'équiper votre arme skin. Il faudra le rééquiper a chaques retours en ville.")) 
	used4 = used4 + 1
				


		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_ASSAULTRIFLE_VARMOD_LUXE"))  
		  		 ESX.ShowNotification(("Vous venez d'équiper votre arme skin. Il faudra le rééquiper a chaques retours en ville.")) 
	used4 = used4 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_CARBINERIFLE_VARMOD_LUXE"))  
		  		 ESX.ShowNotification(("Vous venez d'équiper votre arme skin. Il faudra le rééquiper a chaques retours en ville.")) 
	used4 = used4 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE"))  
		  		 ESX.ShowNotification(("Vous venez d'équiper votre arme skin. Il faudra le rééquiper a chaques retours en ville.")) 
	used4 = used4 + 1
		  		
		  	
		  	else 
		  		  ESX.ShowNotification(("Vous n'avez pas d'arme en main ou votre arme ne peux pas supporter de look de luxe."))
		  		
			end
		else
				  		  ESX.ShowNotification(("Vous avez utiliser tout vos skins de luxe."))

		end
end)

AddEventHandler('playerSpawned', function()
  used = 0
  used2 = 0
  used3 = 0
  used4 = 0
end)