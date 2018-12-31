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

ESX                           = nil
local PlayerData              = {}
local HasAlreadyEnteredMarker = false
local LastZone                = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local PedBlacklist            = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(1)
	end
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
           TriggerServerEvent('esx_bahamajob:annonce',result)
            
        end


    end
  end)
  
end

function OpenBahamaActionsMenu() 

	 local elements = {
	}

	if PlayerData.job.grade_name == 'boss' then
    table.insert(elements,{label = 'Passer une annonce', value = 'announce'})
  	table.insert(elements,{label = 'Action Patron', value = 'boss_actions'})
	end

  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'boss_actions',
    {
      title    = 'Bahama Mamas',
      elements = elements
    },
    function(data, menu)

      if data.current.value == 'announce' then
          messagenotfinish = true
          Message()
      end
			
			if data.current.value == 'boss_actions' then
				TriggerEvent('esx_society:openBossMenu', 'bahama', function(data, menu)
					menu.close()
				end)
			end

    end,
    function(data, menu)

      menu.close()

      CurrentAction     = 'bahama_actions_menu'
      CurrentActionMsg  = 'Appuez sur ~INPUT_CONTEXT~ pour accéder au menu'
      CurrentActionData = {}

    end
  )

end


function OpenBahamaCocktailMenu() 

	local elements = {
		{label = 'Alcool de Myrte', value = 'Myrte_Alcool'},
		{label = 'Whisky Coca', 		value = 'Whisky_Coc'},
		{label = 'Vodka Red bull',	value = 'Vodka_RB'},
	}

  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'boss_actions',
    {
      title    = 'Cocktail',
      elements = elements
    },
    function(data, menu)

		 	if data.current.value == 'Myrte_Alcool' then
				TriggerServerEvent('esx_bahamajob:myrtealcool')
    	end
			
			if data.current.value == 'Whisky_Coc' then
    		TriggerServerEvent('esx_bahamajob:whiskycoc')
    	end
			
			if data.current.value == 'Vodka_RB' then
    		TriggerServerEvent('esx_bahamajob:vodkarb')
    	end

    end,
    function(data, menu)

      menu.close()

      CurrentAction     = 'bahama_cocktail_menu' 
      CurrentActionMsg  = 'Appuez sur ~INPUT_CONTEXT~ pour accéder au menu'
      CurrentActionData = {}

    end
  )

end

function OpenMobileBahamaActionsMenu()

 	ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'boss_actions',
    {
      title    = 'Bahama Mamas',
      elements = {
      	{label = 'Facturation', value = 'billing'}
    	}
    },
    function(data, menu)

			if data.current.value == 'billing' then

				ESX.UI.Menu.Open(
					'dialog', GetCurrentResourceName(), 'billing',
					{
						title = 'Montant de la facture'
					},
					function(data, menu)

						local amount = tonumber(data.value)

						if amount == nil then
							ESX.ShowNotification('Montant invalide')
						else
							
							menu.close()
							
							local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

							if closestPlayer == -1 or closestDistance > 3.0 then
								ESX.ShowNotification('Aucun joueur à proximité')
							else
								TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_bahama', 'Bahama Mamas', amount)
							end

						end

					end,
					function(data, menu)
						menu.close()
					end
				)

			end

    end,
    function(data, menu)
    	menu.close()
    end
  )

end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  
  PlayerData = xPlayer

  if PlayerData.job.name == 'bahama'  then
		Config.Zones.BahamaActionsBoss.Type = 1
		Config.Zones.BahamaStockBoss.Type = 1
		Config.Zones.BahamaCocktail.Type = 1
		Config.Zones.BahamaComptoirEnter.Type = 1
		Config.Zones.BahamaComptoirEnter2.Type = 1
		
  else
		Config.Zones.BahamaActionsBoss.Type = -1
		Config.Zones.BahamaStockBoss.Type = -1
		Config.Zones.BahamaCocktail.Type = -1 
		Config.Zones.BahamaComptoirEnter.Type = -1
		Config.Zones.BahamaComptoirEnter2.Type = -1
  end

end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)

  PlayerData.job = job

  if PlayerData.job.name == 'bahama' then
		Config.Zones.BahamaActionsBoss.Type = 1
		Config.Zones.BahamaStockBoss.Type = 1
		Config.Zones.BahamaCocktail.Type = 1
		Config.Zones.BahamaComptoirEnter.Type = 1
		Config.Zones.BahamaComptoirEnter2.Type = 1
  else
		Config.Zones.BahamaActionsBoss.Type = -1
		Config.Zones.BahamaStockBoss.Type = -1
		Config.Zones.BahamaCocktail.Type = -1	
		Config.Zones.BahamaComptoirEnter.Type = -1
		Config.Zones.BahamaComptoirEnter2.Type = -1
	end

end)

AddEventHandler('esx_bahamajob:hasEnteredMarker', function(zone)

  if zone == 'BahamaActionsBoss' and PlayerData.job ~= nil and PlayerData.job.grade_name == 'boss' and PlayerData.job.name == 'bahama' then
    CurrentAction     = 'bahama_actions_menu'
    CurrentActionMsg  = 'Appuez sur ~INPUT_CONTEXT~ pour accéder au menu'
    CurrentActionData = {}
	end
	
	if zone == 'BahamaStockBoss' and PlayerData.job ~= nil and PlayerData.job.name == 'bahama' then
    CurrentAction     = 'bahama_stock_menu'
    CurrentActionMsg  = 'Appuez sur ~INPUT_CONTEXT~ pour accéder au menu'
    CurrentActionData = {}
  end

	if zone == 'BahamaCocktail' and PlayerData.job ~= nil and PlayerData.job.name == 'bahama' then
    CurrentAction     = 'bahama_cocktail_menu'
    CurrentActionMsg  = 'Appuez sur ~INPUT_CONTEXT~ pour accéder au menu'
    CurrentActionData = {}
  end

	if zone == 'BahamaComptoirEnter' and PlayerData.job.name == 'bahama' then
		TeleportFadeEffect(GetPlayerPed(-1), Config.Zones.BahamaComptoirExit.Pos)
	end

	if zone == 'BahamaComptoirEnter2' and PlayerData.job.name == 'bahama' then
		TeleportFadeEffect(GetPlayerPed(-1), Config.Zones.BahamaActionsBoss.Pos)
	end

end)

AddEventHandler('esx_bahamajob:hasExitedMarker', function(zone)
  CurrentAction = nil
  ESX.UI.Menu.CloseAll()
	TriggerServerEvent('esx_bahamajob:stopCraft')
	TriggerServerEvent('esx_bahamajob:stopCraft2')
	TriggerServerEvent('esx_bahamajob:stopCraft3')
	TriggerServerEvent('esx_bahamajob:stopCraft4')
end)

-- Create blips
Citizen.CreateThread(function()

 local blip = AddBlipForCoord(Config.Zones.Bahama.Pos.x, Config.Zones.Bahama.Pos.y, Config.Zones.Bahama.Pos.z)
  
  SetBlipSprite (blip, 121)
  SetBlipDisplay(blip, 4)
  SetBlipScale  (blip, 0.9)
  SetBlipColour (blip, 4)
  SetBlipAsShortRange(blip, true)
  
	BeginTextCommandSetBlipName("STRING")
  AddTextComponentString("Bahama")
  EndTextCommandSetBlipName(blip)

end)

-- Display markers
Citizen.CreateThread(function()
  while true do
    
    Wait(0)
    
    local coords = GetEntityCoords(GetPlayerPed(-1))
    
    for k,v in pairs(Config.Zones) do
      if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
        DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
      end
    end

  end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
  while true do
    
    Wait(0)
    
    local coords          = GetEntityCoords(GetPlayerPed(-1))
    local isInMarker      = false
    local currentZone     = nil

    for k,v in pairs(Config.Zones) do
      if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
        isInMarker      = true
        currentZone     = k
      end
    end

    if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
      HasAlreadyEnteredMarker = true
      LastZone                = currentZone
      TriggerEvent('esx_bahamajob:hasEnteredMarker', currentZone)
    end

    if not isInMarker and HasAlreadyEnteredMarker then
      HasAlreadyEnteredMarker = false
      TriggerEvent('esx_bahamajob:hasExitedMarker', LastZone)
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

      if IsControlJustReleased(0,  Keys['E']) and PlayerData.job ~= nil and PlayerData.job.name == 'bahama' then
        
        if CurrentAction == 'bahama_actions_menu'  then  
          OpenBahamaActionsMenu()
				end
				

				if CurrentAction == 'bahama_stock_menu' then
          TriggerEvent('esx_society:openStocksMenu', 'bahama', function(data, menu)

            menu.close()

            CurrentAction     = 'bahama_stock_menu'
            CurrentActionMsg  = 'Appuez sur ~INPUT_CONTEXT~ pour accéder au coffre'
            CurrentActionData = {}

          end)
        end

				if CurrentAction == 'bahama_cocktail_menu' then  
          OpenBahamaCocktailMenu()
        end
        
        CurrentAction = nil
      end

    end

    if IsDisabledControlJustReleased(0, Keys['F6']) and PlayerData.job ~= nil and PlayerData.job.name == 'bahama' then
      OpenMobileBahamaActionsMenu()
    end
  end
end)

function TeleportFadeEffect(entity, coords)

	Citizen.CreateThread(function()

		DoScreenFadeOut(800)

		while not IsScreenFadedOut() do
			Citizen.Wait(1)
		end

		ESX.Game.Teleport(entity, coords, function()
			DoScreenFadeIn(800)
		end)

	end)

end

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
                    DrawAdvancedTextCNN(0.588, 0.14, 0.005, 0.0028, 0.8, "~r~ BAHAMA ~d~", 255, 255, 255, 255, 1, 0)
                    DrawAdvancedTextCNN(0.586, 0.199, 0.005, 0.0028, 0.6, texteafiche, 255, 255, 255, 255, 7, 0)
                    DrawAdvancedTextCNN(0.588, 0.246, 0.005, 0.0028, 0.4, "", 255, 255, 255, 255, 0, 0)

            end                
       end
    end)



RegisterNetEvent('esx_bahamajob:annonce')
AddEventHandler('esx_bahamajob:annonce', function(text)
    texteafiche = text
    affichenews = true
    
  end) 


RegisterNetEvent('esx_bahamajob:annoncestop')
AddEventHandler('esx_bahamajob:annoncestop', function()
    affichenews = false
    
  end) 

------------------------------------------------------------------------------------------------------------
------------------------------------------------ Utiliser --------------------------------------------------
------------------------------------------------------------------------------------------------------------

RegisterNetEvent('esx_bahamajob:onDrink')
AddEventHandler('esx_bahamajob:onDrink', function()
  
  local playerPed = GetPlayerPed(-1)
  
  TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_DRINKING", 0, 1)
  Citizen.Wait(10000)
  ClearPedTasksImmediately(playerPed)

end)

RegisterNetEvent('esx_bahamajob:speed')
AddEventHandler('esx_bahamajob:speed', function()
  
  local playerPed = GetPlayerPed(-1)
  
  TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_DRINKING", 0, 1)
  Citizen.Wait(10000)
	ClearPedTasksImmediately(playerPed)
	RestorePlayerStamina(PlayerId(), 1.5)
	SetRunSprintMultiplierForPlayer(PlayerId(), 1.15)
	Citizen.Wait(60000)
	RestorePlayerStamina(PlayerId(), 1.0)
	SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
end)