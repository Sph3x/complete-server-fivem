local holdingBoombox = false
local usingBoombox = false
local boomModel = "prop_boombox_01"
local boomanimDict = "missheistdocksprep1hold_cellphone"
local boomanimName = "hold_cellphone"
local bag_net = nil
local radioStation = math.random(1, 8)

local UI = { 
	x =  0.000 ,
	y = -0.001 ,
}

RegisterCommand("bbox", function()
    TriggerEvent("boombox:ToggleBoombox")
end, false)

RegisterNetEvent("boombox:ToggleBoombox")
AddEventHandler("boombox:ToggleBoombox", function()
    if not holdingBoombox then
        RequestModel(GetHashKey(boomModel))
        while not HasModelLoaded(GetHashKey(boomModel)) do
            Citizen.Wait(100)
        end
		
		while not HasAnimDictLoaded(boomanimDict) do
			RequestAnimDict(boomanimDict)
			Citizen.Wait(100)
		end

        local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -5.0)
        local boomSpawned = CreateObject(GetHashKey(boomModel), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
        Citizen.Wait(1000)
        local netid = ObjToNet(boomSpawned)
        SetNetworkIdExistsOnAllMachines(netid, true)
        NetworkSetNetworkIdDynamic(netid, true)
        SetNetworkIdCanMigrate(netid, false)
        AttachEntityToEntity(boomSpawned, GetPlayerPed(PlayerId()), GetPedBoneIndex(GetPlayerPed(PlayerId()), 57005), 0.30, 0, 0, 0, 260.0, 60.0, true, true, false, true, 1, true)
        TaskPlayAnim(GetPlayerPed(PlayerId()), 1.0, -1, -1, 50, 0, 0, 0, 0) -- 50 = 32 + 16 + 2
        TaskPlayAnim(GetPlayerPed(PlayerId()), boomanimDict, boomanimName, 1.0, -1, -1, 50, 0, 0, 0, 0)
		
        Citizen.InvokeNative(0x651D3228960D08AF, "SE_Script_Placed_Prop_Emitter_Boombox", boomSpawned)
        SetEmitterRadioStation("SE_Script_Placed_Prop_Emitter_Boombox", GetRadioStationName(radioStation))
        SetStaticEmitterEnabled("SE_Script_Placed_Prop_Emitter_Boombox", true)
        bag_net = netid
        holdingBoombox = true
    else
        ClearPedSecondaryTask(GetPlayerPed(PlayerId()))
        DetachEntity(NetToObj(bag_net), 1, 1)
        DeleteEntity(NetToObj(bag_net))
        bag_net = nil
        holdingBoombox = false
        usingBoombox = false
    end	
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if holdingBoombox then
			while not HasAnimDictLoaded(boomanimDict) do
				RequestAnimDict(boomanimDict)
				Citizen.Wait(100)
			end
			
			local coords = GetEntityCoords(GetPlayerPed(PlayerId()), false)
			DrawText3Ds(coords['x'], coords['y'], coords['z'], "Appuie sur ~g~E ~w~pour changer la radio")
			DisablePlayerFiring(PlayerId(), true)
			DisableControlAction(0,25,true) -- disable aim
			DisableControlAction(0,23,true) -- disable aim
			DisableControlAction(0, 44,  true) -- INPUT_COVER
			DisableControlAction(0,37,true) -- INPUT_SELECT_WEAPON
			SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey("WEAPON_UNARMED"), true)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		local radioStation = math.random(1, 8)
		Citizen.Wait(0)
		if holdingBoombox then
			if IsControlJustReleased(0,38,true) then
				SetEmitterRadioStation("SE_Script_Placed_Prop_Emitter_Boombox", GetRadioStationName(radioStation))
			end
		end
	end
end)

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 450
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end