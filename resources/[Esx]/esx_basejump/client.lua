local para = {
	--["parachute1"] = {
	--	position = { ['x'] = 454.8185, ['y'] = 5584.343, ['z'] = 781.2034 },
	--	nompara = "BASE Jump",
	--},
	["parachute2"] = {
		position = { ['x'] = 1-80.7721328735352, ['y'] = -825.642822265625, ['z'] = 326.083953857422 },
		nompara = "BASE Jump",
	},
	--["parachute3"] = {
	--	position = { ['x'] = -128.143, ['y'] = -596.1727, ['z'] = 201.7354 },
	--	nompara = "BASE Jump",
	--},
	--["parachute4"] = {
	--	position = { ['x'] = -1136.317, ['y'] = 4659.592, ['z'] = 243.9243 },
	--	nompara = "BASE Jump",
	--},
	["parachute5"] = {
		position = { ['x'] = 1665.401, ['y'] = -27.96845, ['z'] = 196.9363 },
		nompara = "BASE Jump",
	},
	--["parachute6"] = {
	--	position = { ['x'] = -546.6611, ['y'] = -2229.825, ['z'] = 122.3656 },
	--	nompara = "BASE Jump",
	--},
	["parachute7"] = {
		position = { ['x'] = -119.712, ['y'] = -976.443, ['z'] = 296.197 },
		nompara = "BASE Jump",
	},
	
	["McKenzie - Parachute"] = {
		position = { ['x'] = 2141.078369, ['y'] = 4788.543945, ['z'] = 40.7702 },
		nompara = "McKenzieParachute",
	},
}


-- blips
Citizen.CreateThread(function()
	for k,v in pairs(para) do
		local vpara = v.position

		local blip = AddBlipForCoord(vpara.x, vpara.y, vpara.z)
		SetBlipSprite(blip, 94)
		SetBlipColour(blip, 15)
		SetBlipScale(blip, 0.8)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("BASE Jump")
		EndTextCommandSetBlipName(blip)
	end
end)


function giveParachute()
    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("GADGET_PARACHUTE"), 150, true, true)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2)
		local pos = GetEntityCoords(GetPlayerPed(-1), true)

		for k,v in pairs(para)do
			local pos2 = v.position

			if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 15.0)then
					DrawMarker(1, v.position.x, v.position.y, v.position.z - 1, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 1555, 0, 0,255, 0, 0, 0,0)
					
					if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 1.0)then
                        ClearPrints()
                        SetTextEntry_2("STRING")
                        AddTextComponentString("Appuyez sur ~r~E~w~ pour obtenir un ~b~parachute")
                        DrawSubtitleTimed(2000, 1)
                        if IsControlJustPressed(1, 38) then
                            giveParachute()
                        end
					end
			end
		end
	end
end)
