# esx_jb_realtimejailer

This is a jailsystem that uses IRL time to jail someone. If he return ingame before the time he will be put in jail again.

This is the code you need to put in esx_policejob and integrate it in the menu you want:
- 1 download the ressource
- 2 put it in your ressource folder somewhere
- 3 in server cfg add: start esx_jb_realtimejailer
- 4 add the code below in police client file 
- 5a trigger somewhere in your menus : openJailMenu(GetPlayerServerId(player))  -->olderversion of policejob where player is a variable of your player
- 5b trigger somewhere in your menus : openJailMenu(GetPlayerServerId(closestPlayer))  -->newer version of policejob where closestPlayer is a variable of your player
- 6 done !

```

function openJailMenu(playerid)
  local elements = {
    {label = "Cellule 1",     value = 'JailPoliceStation1'},
    {label = "Cellule 2",     value = 'JailPoliceStation2'},
    {label = "Cellule 3",     value = 'JailPoliceStation3'},
    {label = "Cellule fédérale",     value = 'FederalJail'},
    {label = "Libérer de cellule",     value = 'FreePlayer'},
  }
  ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'jail_menu',
	{
	  title    = 'Mettre en prison',
	  align    = 'top-left',
	  elements = elements,
	},
	function(data3, menu)
		if data3.current.value ~= "FreePlayer" then
			maxLength = 4
			AddTextEntry('FMMC_KEY_TIP8', "Nombre d'heures en prison")
			DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", "", "", "", "", maxLength)
			ESX.ShowNotification("~b~Entrez le nombre d'heures que vous voulez mettre la personne en prison.")
			blockinput = true

			while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
				Citizen.Wait( 0 )
			end

			local jailtime = GetOnscreenKeyboardResult()

			UnblockMenuInput()

			if string.len(jailtime) >= 1 and tonumber(jailtime) ~= nil then
				TriggerServerEvent('esx_jb_jailer:PutInJail', playerid, data3.current.value, tonumber(jailtime)*60*60)
			else
				return false
			end
		else
			TriggerServerEvent('esx_jb_jailer:UnJailplayer', playerid)
		end
	end,
	function(data3, menu)
	  menu.close()
	end
  )
end

function UnblockMenuInput()
    Citizen.CreateThread( function()
        Citizen.Wait( 150 )
        blockinput = false 
    end )
end
```
