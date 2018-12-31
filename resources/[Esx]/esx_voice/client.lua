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
local defaultkey = Keys["H"]
local defaultdistance = 5.001 -- De base
local highdistance = 12.001 -- Loin
local lowdistance = 1.001 -- Proche
local currentdistancevoice = 0 -- Distance actuelle (0 à 2)
function Notify(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, true)
end

local voice = 1

local UI = { 

	x =  0.022 ,	-- Base Screen Coords 	+ 	 x
	y =  -0.003 ,	-- Base Screen Coords 	+ 	-y

}

AddEventHandler('onClientMapStart', function()
	if currentdistancevoice == 0 then
		NetworkSetTalkerProximity(defaultdistance) -- 5 metres
	elseif currentdistancevoice == 1 then
		NetworkSetTalkerProximity(highdistance) -- 12 metres
	elseif currentdistancevoice == 2 then
		NetworkSetTalkerProximity(lowdistance) -- 1 metres
	end
end)
Citizen.CreateThread(function()
 	while true do
 		Citizen.Wait(0)
 		--TriggerEvent("pNotify:SetQueueMax", "voice", 20)
 		if IsControlJustPressed(1, defaultkey) then
 			currentdistancevoice = (currentdistancevoice + 1) % 3
			if currentdistancevoice == 0 then
				NetworkSetTalkerProximity(defaultdistance) -- 5 meters range
				TriggerEvent("ZAUB1_CORE:Notif",{
            		text = "Vous parlez <b style='color:LightBlue'>Normalement</b>",
            		timeout = (5000)
       		 	})
			elseif currentdistancevoice == 1 then
				NetworkSetTalkerProximity(highdistance) -- 12 meters range
				TriggerEvent("ZAUB1_CORE:Notif",{
            		text = "Vous <b style='color:Crimson'>Criez</b>",
            		timeout = (5000)
       		 	})
			elseif currentdistancevoice == 2 then
				NetworkSetTalkerProximity(lowdistance) -- 1 meters range
				TriggerEvent("ZAUB1_CORE:Notif",{
            		text = "Vous <b style='color:LightGreen'>Chuchottez</b>",
            		timeout = (5000)
       		 	})
			end
 		end
 	end
 end)

Citizen.CreateThread(function()
	while true do
	Citizen.Wait(0)
		if NetworkIsPlayerTalking(PlayerId()) then
			if currentdistancevoice == 0 then
				drawTxt(0.52, 0.506, 1.0,1.0,0.4, "~b~ Voix : Normale", 255, 255, 255, 255)
			elseif currentdistancevoice == 1 then
				drawTxt(0.52, 0.506, 1.0,1.0,0.4, "~b~ Voix : Forte", 255, 255, 255, 255)
			elseif currentdistancevoice == 2 then
				drawTxt(0.52, 0.506, 1.0,1.0,0.4, "~b~ Voix : Faible", 255, 255, 255, 255)
			end
		else
			if currentdistancevoice == 0 then
				drawTxt(0.52, 0.506, 1.0,1.0,0.4, "~w~ Voix : Normale", 255, 255, 255, 255)
			elseif currentdistancevoice == 1 then
				drawTxt(0.52, 0.506, 1.0,1.0,0.4, "~w~ Voix : Forte", 255, 255, 255, 255)
			elseif currentdistancevoice == 2 then
				drawTxt(0.52, 0.506, 1.0,1.0,0.4, "~w~ Voix : Faible", 255, 255, 255, 255)
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
	Citizen.Wait(0)
		drawRct(0.007, 0.01, 0.07,0.03,0,0,0,100)
		--Citizen.Trace(PlayerId())
		SendNUIMessage({
    		voice = voice,
  		})
	end
end)

function drawRct(x,y,width,height,r,g,b,a)
	DrawRect(x + width/2, y + height/2, width, height, r, g, b, a)
end

function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end