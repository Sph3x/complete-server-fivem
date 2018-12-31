# esx_ladderhud
**Credits: Marmota#2533**

**My discord:** https://discord.gg/DcqwPkD

**Screenshots:**

![Screenshot](https://i.imgur.com/84NRqwa.png)
![Screenshot](https://i.imgur.com/t1rR9rr.jpg)


**How to install:**

 - Put the folder **esx_ladderhud** inside your resources folder and start it on your server.cfg!
 
 * Add TriggerEvent in (resources\[esx]\esx_status\client\main.lua `esx_status:load`) 
 ```lua
 TriggerEvent('esx_ladderhud:updateBasics', GetStatusData(true))
 ```
 to look like this
 ```lua
 RegisterNetEvent('esx_status:load')
 AddEventHandler('esx_status:load', function(status)
 
 	for i=1, #Status, 1 do
 		for j=1, #status, 1 do
 			if Status[i].name == status[j].name then
 				Status[i].set(status[j].val)
 			end
 		end
 	end
 
 	Citizen.CreateThread(function()
 	  while true do
 
 	  	for i=1, #Status, 1 do
 	  		Status[i].onTick()
 	  	end
 
 			SendNUIMessage({
 				update = true,
 				status = GetStatusData()
 			})
 	
 		TriggerEvent('esx_ladderhud:updateBasics', GetStatusData(true))
 	    Citizen.Wait(Config.TickTime)
 	  end
 	end)
 
 end)
 ```
* Disabling Basic Needs Bars (resources\[esx]\esx_basicneeds\client\main.lua `esx_status:loaded`)
```lua
AddEventHandler('esx_status:loaded', function(status)

	TriggerEvent('esx_status:registerStatus', 'hunger', 1000000, '#FFFF00', -- amarelo
	--TriggerEvent('esx_status:registerStatus', 'hunger', 1000000, '#CFAD0F', -- GOLD
		function(status)
			return false -- Change to true to show hunger bar | false to hide hunger bar
		end, function(status)
			status.remove(100)
		end
	)

	TriggerEvent('esx_status:registerStatus', 'thirst', 1000000, '#0099FF', -- azul
	--TriggerEvent('esx_status:registerStatus', 'thirst', 1000000, '#0C98F1', -- CYAN
		function(status)
			return false -- Change to true to show thirst bar | false to hide thirst bar
		end, function(status)
			status.remove(75)
		end
	)
```
  
