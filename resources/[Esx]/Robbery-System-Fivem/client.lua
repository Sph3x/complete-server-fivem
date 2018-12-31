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

--[[ CONFIG ]]--
useCopsFiveM = true -- If you have cops FiveM you should enable this,  lets the script do cop checks
local keyToInteractWithRobbery = Keys["E"]
--[[--------]]

--[[LAYOUT

	["Name Of Store"]={name="Name Of Store",
	blip=500,  -- THE BLIP TO USE
	blipColor=6,  -- THE COLOR OF BLIP
	blipSize=0.6, -- THE SIZE OF BLIP
	x=-706.03717041016, y=-915.42755126953, z=19.215593338013, -- THE POSITION OF THE PLACE
	beingRobbed=false, -- IF IT'S BEING ROBBED
	timeToRob = 90, --HOW LONG IT TAKES TO ROB
	isSafe=false, --IF ITS A SAFE OR A REGISTER/BOOTH
	copsNeeded = 1}, -- HOW MANY COPS ARE REQUIRED TO ROB THIS ONE

]]



local robbableSpots = {

--24/7s
	["Little Seoul 24/7 Register #1"]={name="Little Seoul 24/7 Register #1",
	--blip=500,
	--blipColor=6,
	--blipSize=0.6,
	x=-706.03717041016, y=-915.42755126953, z=19.215593338013,
	beingRobbed=false,
	timeToRob = 90,
	isSafe=false,
	copsNeeded = 1},

	["Little Seoul 24/7 Register #2"]={name="Little Seoul 24/7 Register #2",
	--blip=500,
	--blipColor=6,
	--blipSize=0.6,
	x=-706.0966796875, y=-913.49053955078, z=19.215593338013,
	beingRobbed=false,
	timeToRob = 90,
	isSafe=false,
	copsNeeded = 1},

	["Little Seoul 24/7 Safe"]={name="Little Seoul 24/7 Safe",
	--blip=500,
	--blipColor=6,
	--blipSize=0.8,
	x=-709.66131591797, y=-904.18121337891, z=19.215612411499,
	beingRobbed=false,
	timeToRob = 360,
	isSafe=true,
	copsNeeded = 2},

	["Innocence Blvd 24/7 Register #1"]={name="Innocence Blvd 24/7 Register #1",
	--blip=500,
	--blipColor=6,
	--blipSize=0.6,
	x=24.487377166748, y=-1347.4102783203, z=29.497039794922,
	beingRobbed=false,
	timeToRob = 90,
	isSafe=false,
	copsNeeded = 1},

	["Innocence Blvd 24/7 Register #2"]={name="Innocence Blvd 24/7 Register #2",
	--blip=500,
	--blipColor=6,
	--blipSize=0.6,
	x=24.396217346191, y=-1344.9005126953, z=29.497039794922,
	beingRobbed=false,
	timeToRob = 90,
	isSafe=false,
	copsNeeded = 1},

	["Innocence Blvd 24/7 Safe"]={name="Innocence Blvd 24/7 Safe",
	--blip=500,
	--blipColor=6,
	--blipSize=0.8,
	x=28.284742355347, y=-1339.1623535156, z=29.497039794922,
	beingRobbed=false,
	timeToRob = 360,
	isSafe=true,
	copsNeeded = 2},

	["Mirror Park 24/7 Register #1"]={name="Mirror Park 24/7 Register #1",
	--blip=500,
	--blipColor=6,
	--blipSize=0.6,
	x=1165.0561523438, y=-324.41815185547, z=69.205062866211,
	beingRobbed=false,
	timeToRob = 90,
	isSafe=false,
	copsNeeded = 1},

	["Mirror Park 24/7 Register #2"]={name="Mirror Park 24/7 Register #2",
	--blip=500,
	--blipColor=6,
	--blipSize=0.6,
	x=1164.6981201172, y=-322.61318969727, z=69.205062866211,
	beingRobbed=false,
	timeToRob = 90,
	isSafe=false,
	copsNeeded = 1},

	["Mirror Park 24/7 Safe"]={name="Mirror Park 24/7 Safe",
	--blip=500,
	--blipColor=6,
	--blipSize=0.8,
	x=1159.55859375, y=-314.06265258789, z=69.205062866211,
	beingRobbed=false,
	timeToRob = 360,
	isSafe=true,
	copsNeeded = 2},

	["Downtown Vinewood 24/7 Register #1"]={name="Downtown Vinewood 24/7 Register #1",
	--blip=500,
	--blipColor=6,
	--blipSize=0.6,
	x=372.47518920898, y=326.35989379883, z=103.56636810303,
	beingRobbed=false,
	timeToRob = 90,
	isSafe=false,
	copsNeeded = 1},

	["Downtown Vinewood 24/7 Register #2"]={name="Downtown Vinewood 24/7 Register #2",
	--blip=500,
	--blipColor=6,
	--blipSize=0.6,
	x=373.0817565918, y=328.75726318359, z=103.56636810303,
	beingRobbed=false,
	timeToRob = 90,
	isSafe=false,
	copsNeeded = 1},

	["Downtown Vinewood 24/7 Safe"]={name="Downtown Vinewood 24/7 Safe",
	--blip=500,
	--blipColor=6,
	--blipSize=0.8,
	x=378.17330932617, y=333.39218139648, z=103.56636810303,
	beingRobbed=false,
	timeToRob = 360,
	isSafe=true,
	copsNeeded = 2},

	["Rockford Dr 24/7 Register #1"]={name="Rockford Dr 24/7 Register #1",
	--blip=500,
	--blipColor=6,
	--blipSize=0.6,
	x=-1818.8961181641, y=792.91729736328, z=138.08184814453,
	beingRobbed=false,
	timeToRob = 90,
	isSafe=false,
	copsNeeded = 1},

	["Rockford Dr 24/7 Register #2"]={name="Rockford Dr 24/7 Register #2",
	--blip=500,
	--blipColor=6,
	--blipSize=0.6,
	x=-1820.2630615234, y=794.45971679688, z=138.0887298584,
	beingRobbed=false,
	timeToRob = 90,
	isSafe=false,
	copsNeeded = 1},

	["Rockford Dr 24/7 Safe"]={name="Rockford Dr 24/7 Safe",
	--blip=500,
	--blipColor=6,
	--blipSize=0.8,
	x=-1829.2971191406, y=798.80505371094, z=138.19258117676,
	beingRobbed=false,
	timeToRob = 360,
	isSafe=true,
	copsNeeded = 2},
	
	["Route 68 24/7 Register #1"]={name="Route 68 24/7 Register #1",
	--blip=500,
	--blipColor=6,
	--blipSize=0.6,
	x=549.36108398438, y=2669.0007324219, z=42.156490325928,
	beingRobbed=false,
	timeToRob = 90,
	isSafe=false,
	copsNeeded = 1},

	["Route 68 24/7 Register #2"]={name="Route 68 24/7 Register #2",
	--blip=500,
	--blipColor=6,
	--blipSize=0.6,
	x=549.05975341797, y=2671.443359375, z=42.156490325928,
	beingRobbed=false,
	timeToRob = 90,
	isSafe=false,
	copsNeeded = 1},

	["Route 68 24/7 Safe"]={name="Route 68 24/7 Safe",
	--blip=500,
	--blipColor=6,
	--blipSize=0.8,
	x=546.40972900391, y=2662.7551269531, z=42.156536102295,
	beingRobbed=false,
	timeToRob = 360,
	isSafe=true,
	copsNeeded = 2},

	["South Senora Fwy 24/7 Register #1"]={name="South Senora Fwy 24/7 Register #1",
	--blip=500,
	--blipColor=6,
	--blipSize=0.6,
	x=2677.9641113281, y=3279.4440917969, z=55.241130828857,
	beingRobbed=false,
	timeToRob = 90,
	isSafe=false,
	copsNeeded = 1},

	["South Senora Fwy 24/7 Register #2"]={name="South Senora Fwy 24/7 Register #2",
	--blip=500,
	--blipColor=6,
	--blipSize=0.6,
	x=2675.8774414063, y=3280.537109375, z=55.241130828857,
	beingRobbed=false,
	timeToRob = 90,
	isSafe=false,
	copsNeeded = 1},

	["South Senora Fwy 24/7 Safe"]={name="South Senora Fwy 24/7 Safe",
	--blip=500,
	--blipColor=6,
	--blipSize=0.8,
	x=2672.9831542969, y=3286.49609375, z=55.241149902344,
	beingRobbed=false,
	timeToRob = 360,
	isSafe=true,
	copsNeeded = 2},
	
	["North Senora Fwy 24/7 Register #1"]={name="North Senora Fwy 24/7 Register #1",
	--blip=500,
	--blipColor=6,
	--blipSize=0.6,
	x=1727.8493652344, y=6415.2983398438, z=35.037227630615,
	beingRobbed=false,
	timeToRob = 90,
	isSafe=false,
	copsNeeded = 1},

	["North Senora Fwy 24/7 Register #2"]={name="North Senora Fwy 24/7 Register #2",
	--blip=500,
	--blipColor=6,
	--blipSize=0.6,
	x=1728.8804931641, y=6417.4360351563, z=35.037227630615,
	beingRobbed=false,
	timeToRob = 90,
	isSafe=false,
	copsNeeded = 1},

	["North Senora Fwy 24/7 Safe"]={name="North Senora Fwy 24/7 Safe",
	--blip=500,
	--blipColor=6,
	--blipSize=0.8,
	x=1735.1063232422, y=6420.5053710938, z=35.037227630615,
	beingRobbed=false,
	timeToRob = 360,
	isSafe=true,
	copsNeeded = 2},

	["Great Ocean Hwy 24/7 Register #1"]={name="Great Ocean Hwy 24/7 Register #1",
	--blip=500,
	--blipColor=6,
	--blipSize=0.6,
	x=372.47518920898, y=326.35989379883, z=103.56636810303,
	beingRobbed=false,
	timeToRob = 90,
	isSafe=false,
	copsNeeded = 1},

	["Great Ocean Hwy 24/7 Register #2"]={name="Great Ocean Hwy 24/7 Register #2",
	--blip=500,
	--blipColor=6,
	--blipSize=0.6,
	x=373.0817565918, y=328.75726318359, z=103.56636810303,
	beingRobbed=false,
	timeToRob = 90,
	isSafe=false,
	copsNeeded = 1},

	["Great Ocean Hwy 24/7 Safe"]={name="Great Ocean Hwy 24/7 Safe",
	--blip=500,
	--blipColor=6,
	--blipSize=0.8,
	x=378.17330932617, y=333.39218139648, z=103.56636810303,
	beingRobbed=false,
	timeToRob = 360,
	isSafe=true,
	copsNeeded = 2},



	["Algonquin 24/7 Register"]={name="Algonquin 24/7 Register",
	--blip=500,
	--blipColor=6,
	--blipSize=0.8,
	x=1392.8726806641, y=3606.3913574219, z=34.98091506958,
	beingRobbed=false,
	timeToRob = 90,
	isSafe=false,
	copsNeeded = 2},


--LIQUIOR STORES



	["Route 68 Liquor Store Register"]={name="Route 68 Liquor Store Register",
	--blip=500,
	--blipColor=6,
	--blipSize=0.6,
	x=1165.9134521484, y=2710.7854003906, z=38.157711029053,
	beingRobbed=false,
	timeToRob = 90,
	isSafe=false,
	copsNeeded = 1},

	["Route 68 Liquor Store Safe"]={name="Route 68 Liquor Store Safe",
	--blip=500,
	--blipColor=6,
	--blipSize=0.8,
	x=1169.2316894531, y=2717.8447265625, z=37.157691955566,
	beingRobbed=false,
	timeToRob =360,
	isSafe=true,
	copsNeeded = 2},

	["El Rancho Blvd Liquor Store Register"]={name="El Rancho Blvd Liquor Store Register",
	--blip=500,
	--blipColor=6,
	--blipSize=0.6,
	x=1134.2418212891, y=-982.54541015625, z=46.41584777832,
	beingRobbed=false,
	timeToRob = 90,
	isSafe=false,
	copsNeeded = 1},

	["El Rancho Blvd Liquor Store Safe"]={name="El Rancho Blvd Liquor Store Safe",
	--blip=500,
	--blipColor=6,
	--blipSize=0.8,
	x=1126.8385009766, y=-980.08166503906, z=45.415802001953,
	beingRobbed=false,
	timeToRob =360,
	isSafe=true,
	copsNeeded = 2},

	["Prosperity Liquor Store Register"]={name="Prosperity Liquor Store Register",
	--blip=500,
	--blipColor=6,
	--blipSize=0.6,
	x=-1486.2586669922, y=-377.96697998047, z=40.163429260254,
	beingRobbed=false,
	timeToRob = 90,
	isSafe=false,
	copsNeeded = 1},

	["Prosperity Liquor Store Safe"]={name="Prosperity Liquor Store Safe",
	--blip=500,
	--blipColor=6,
	--blipSize=0.8,
	x=-1479.0145263672, y=-375.44979858398, z=39.1633644104,
	beingRobbed=false,
	timeToRob =360,
	isSafe=true,
	copsNeeded = 2},

	["Great Ocean Hwy Liquor Store Register"]={name="Great Ocean Hwy Liquor Store Register",
	--blip=500,
	--blipColor=6,
	--blipSize=0.6,
	x=-2966.4309082031, y=390.98095703125, z=15.043313980103,
	beingRobbed=false,
	timeToRob = 90,
	isSafe=false,
	copsNeeded = 1},

	["Great Ocean Hwy Liquor Store Safe"]={name="Great Ocean Hwy Liquor Store Safe",
	--blip=500,
	--blipColor=6,
	--blipSize=0.8,
	x=-2959.6789550781, y=387.15994262695, z=14.043292999268,
	beingRobbed=false,
	timeToRob =360,
	isSafe=true,
	copsNeeded = 2},







	--CLUBS 


	-- BANK BOOTHS

	["Pacific Standard Bank Booth #1"]={name="Pacific Standard Bank Booth #1",
	--blip=500,
	--blipColor=6,
	--blipSize=0.8,
	x=242.81385803223, y=226.59515380859, z=106.28727722168,
	beingRobbed=false,
	timeToRob = 120,
	isSafe=false,
	copsNeeded = 1},

	["Pacific Standard Bank Booth #2"]={name="Pacific Standard Bank Booth #2",
	--blip=500,
	--blipColor=6,
	--blipSize=0.8,
	x=247.9873046875, y=224.75602722168, z=106.28736877441,
	beingRobbed=false,
	timeToRob = 120,
	isSafe=false,
	copsNeeded = 1},

	["Pacific Standard Bank Booth #3"]={name="Pacific Standard Bank Booth #3",
	--blip=500,
	--blipColor=6,
	--blipSize=0.8,
	x=252.95489501953, y=222.85342407227, z=106.28684234619,
	beingRobbed=false,
	timeToRob = 120,
	isSafe=false,
	copsNeeded = 1},

	--BANKS

	["Route 68 Flecca Bank Vault"]={name="Route 68 Flecca Bank Vault",
	--blip=500,
	--blipColor=6,
	--blipSize=0.8,
	x=1175.8201904297, y=2711.6484375, z=38.088001251221,
	beingRobbed=false,
	timeToRob = 900,
	isSafe=true,
	copsNeeded = 4},

	["Pacific Standard Bank Vault"]={name="Pacific Standard Bank Vault",
	--blip=500,
	--blipColor=6,
	--blipSize=0.8,
	x=254.30894470215, y=225.26997375488, z=101.8756942749,
	beingRobbed=false,
	timeToRob = 900,
	isSafe=true,
	copsNeeded = 4},

	["Legion Flecca Bank Vault"]={name="Legion Flecca Bank Vault",
	--blip=500,
	--blipColor=6,
	--blipSize=0.8,
	x=147.43576049805, y=-1044.9503173828, z=29.368032455444,
	beingRobbed=false,
	timeToRob = 900,
	isSafe=true,
	copsNeeded = 4},

	["Great Ocean Hwy Flecca Bank Vault"]={name="Great Ocean Hwy Flecca Bank Vault",
	--blip=500,
	--blipColor=6,
	--blipSize=0.8,
	x=147.43576049805, y=-1044.9503173828, z=29.368032455444,
	beingRobbed=false,
	timeToRob = 900,
	isSafe=true,
	copsNeeded = 4},

	["West Hawick Flecca Bank Vault"]={name="West Hawick Flecca Bank Vault",
	--blip=500,
	--blipColor=6,
	--blipSize=0.8,
	x=-1211.2392578125, y=-335.38189697266, z=37.78101348877,
	beingRobbed=false,
	timeToRob = 900,
	isSafe=true,
	copsNeeded = 4},

	["Hawick Flecca Bank Vault"]={name="Hawick Flecca Bank Vault",
	--blip=500,
	--blipColor=6,
	--blipSize=0.8,
	x=311.76455688477, y=-283.31527709961, z=54.16475677490,
	beingRobbed=false,
	timeToRob = 900,
	isSafe=true,
	copsNeeded = 4},

	["East Hawick Flecca Bank Vault"]={name="East Hawick Flecca Bank Vault",
	--blip=500,
	--blipColor=6,
	--blipSize=0.8,
	x=311.76455688477, y=-283.31527709961, z=54.16475677490,
	beingRobbed=false,
	timeToRob = 900,
	isSafe=true,
	copsNeeded = 4},

	["Blaine County Savings Vault"]={name="Blaine County Savings Vault",
	--blip=500,
	--blipColor=6,
	--blipSize=0.8,
	x=-106.25449371338, y=6478.3061523438, z=31.626726150513,
	beingRobbed=false,
	timeToRob = 900,
	isSafe=true,
	copsNeeded = 4},

}



local distanceForMarkerToShow = 15
local distanceToInteractWithMarker = 1.5

local inCircle=false
local isRobbing=false
local spotBeingRobbed = nil

Citizen.CreateThread(function()
	--Setup the blips for all the locations.
	for name,robbableSpot in pairs(robbableSpots)do
        local blip = AddBlipForCoord(robbableSpot.x,robbableSpot.y,robbableSpot.z)
        SetBlipSprite(blip, robbableSpot.blip)
        SetBlipColour(blip, robbableSpot.blipColor)
        SetBlipScale(blip, robbableSpot.blipSize)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(name)
        EndTextCommandSetBlipName(blip)
	end
	
	while true do
		local x,y,z = table.unpack( GetEntityCoords( GetPlayerPed(-1), false ) )
		
		for name,robbableSpot in pairs(robbableSpots)do
			if(Vdist(x,y,z,robbableSpot.x,robbableSpot.y,robbableSpot.z)<distanceForMarkerToShow and isRobbing==false and robbableSpot.beingRobbed==false)then
				DrawMarker(27, robbableSpot.x,robbableSpot.y,robbableSpot.z-1, 0, 0, 0, 0, 0, 0, 0.75,0.75,0.5, 255, 0, 0,255, 0, 0, 0,0)
				if(Vdist(x,y,z,robbableSpot.x,robbableSpot.y,robbableSpot.z)<distanceToInteractWithMarker)then
					spotBeingRobbed=robbableSpot
					if(robbableSpot.isSafe)then
						DisplayHelpText("Appuyer ~INPUT_CONTEXT~ pour commencer à craquer le coffre-fort.")
					else
						DisplayHelpText("Appuyer ~INPUT_CONTEXT~ pour commencer à ouvrir le registre.")
					end
					if(IsControlJustPressed(1, keyToInteractWithRobbery))then
						TriggerServerEvent("robberies:policeCheck")
					end
				else
					if(isRobbing)then
						StopRobbery()
					end
				end
			end
		end
	
		if(IsControlJustPressed(1, keyToInteractWithRobbery) and isRobbing)then
			StopRobbery()
		end

		Citizen.Wait(0)
	end
end)

RegisterNetEvent("robberies:StartRobbery")
AddEventHandler("robberies:StartRobbery", function(cops)

	local ongoingRobberies = 0
	for i,v in ipairs(robbableSpots)do
		if(v.beingRobbed)then
			ongoingRobberies=ongoingRobberies+1
		end
	end
	if(cops<ongoingRobberies)then
		return
	end

	Citizen.CreateThread(function()
		if(cops>=spotBeingRobbed.copsNeeded)then
			TriggerServerEvent("robberies:robberyStartedNotification", spotBeingRobbed.name)
			TaskPlayAnim(GetPlayerPed(-1),"mini@repair","fixing_a_player", 8.0, 0.0, -1, 1, 0, 0, 0, 0)     
			isRobbing=true
			spotBeingRobbed.beingRobbed=true
			robbableSpots[spotBeingRobbed.name]=spotBeingRobbed
			TriggerServerEvent("robberies:syncSpots", robbableSpots)
			FreezeEntityPosition(GetPlayerPed(-1), true)
			local currentSecondCount = 0
			Citizen.CreateThread(function()
				while isRobbing do
					if(spotBeingRobbed.isSafe)then
						DisplayHelpText("Vous craquez actuellement le coffre-fort ("..spotBeingRobbed.timeToRob-currentSecondCount.." secondes restantes)")
					else
						DisplayHelpText("Vous êtes en train d'ouvrir la caisse ("..spotBeingRobbed.timeToRob-currentSecondCount.." secondes restantes)")
					end
					Citizen.Wait(0)
				end
			end)
			while isRobbing do
				currentSecondCount = currentSecondCount + 1
				if(currentSecondCount==spotBeingRobbed.timeToRob)then
					RobberyOver()
				end
				Citizen.Wait(1000)
			end
		end
	end)
end)

RegisterNetEvent("robberies:syncSpotsClient")
AddEventHandler("robberies:syncSpotsClient", function(spots)
	robbableSpots=spots
end)

function StopRobbery()
	isRobbing=false
	spotBeingRobbed.beingRobbed=false
	robbableSpots[spotBeingRobbed.name]=spotBeingRobbed
	TriggerServerEvent("robberies:robberyOverNotification", spotBeingRobbed.name)
	TriggerServerEvent("robberies:syncSpots", robbableSpots)
	spotBeingRobbed=nil
	FreezeEntityPosition(GetPlayerPed(-1), false)
	ClearPedTasksImmediately(GetPlayerPed(-1))
end

function RobberyOver()			
	DisplayHelpText("You have sucesffully robbed this spot!")
	TriggerServerEvent("robberies:robberyOver", spotBeingRobbed.name)
	StopRobbery()
end

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end


RegisterNetEvent("robberies:robberyOverNotification")
AddEventHandler("robberies:robberyOverNotification", function(name)
		TriggerEvent("pNotify:SendNotification", {
			text = "10-90 : Quelqu'un a été vu fuyant la zone ( "..name.." )",
			type = "warning",
			timeout = 10000,
			layout = "centerRight",
			queue = "right"
   		})
end)

RegisterNetEvent("robberies:robberyStartedNotification")
AddEventHandler("robberies:robberyStartedNotification", function(name)
		TriggerEvent("pNotify:SendNotification", {
			text = "10-90 : Une alarme silencieuse a été déclenchée ( "..name.." )",
			type = "warning",
			timeout = 10000,
			layout = "centerRight",
			queue = "right"
    	})
end)