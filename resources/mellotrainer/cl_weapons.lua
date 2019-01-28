--[[--------------------------------------------------------------------------
	*
	* Mello Trainer
	* (C) Michael Goodwin 2017
	* http://github.com/thestonedturtle/mellotrainer/releases
	*
	* This menu used the Scorpion Trainer as a framework to build off of.
	* https://github.com/pongo1231/ScorpionTrainer
	* (C) Emre Cürgül 2017
	* 
	* A lot of useful functionality has been converted from the lambda menu.
	* https://lambda.menu
	* (C) Oui 2017
	*
	* Additional Contributors:
	* WolfKnight (https://forum.fivem.net/u/WolfKnight)
	*
---------------------------------------------------------------------------]]

local playerPed = GetPlayerPed(-1)


-- Max Clip
function maxAmmoWeapon(weaponName)
	local weapon = GetHashKey(weaponName)
	local ammoType = GetPedAmmoType(playerPed, weapon)
	if(HasPedGotWeapon(playerPed, weapon, 0))then
		SetPedAmmoByType(playerPed, ammoType, 9999)
		drawNotification("Max Ammo")
	end
end


-- Add Clip
function addWeaponClip(weaponName)
	local weapon = GetHashKey(weaponName)
	local ammoType = GetPedAmmoType(playerPed, weapon)

	if(HasPedGotWeapon(playerPed, weapon, 0))then
		local maxAmmo = GetWeaponClipSize(weapon)
		--SetAmmoInClip(playerPed, weapon, maxAmmo) -- Refill Current Clip
		AddAmmoToPed(playerPed, weapon, maxAmmo) 
		drawNotification("Ammo Clip Added")
	end
end


-- Equip/Remove weapon.
function toggleWeaponEquipped(weaponName)
	local weapon = GetHashKey(weaponName)
	if(HasPedGotWeapon(playerPed, weapon, 0))then
		RemoveWeaponFromPed(playerPed, weapon)
		drawNotification("Weapon Removed")
	else
		local ammoType = GetPedAmmoType(playerPed, weapon)
		local ammoAmmount = GetPedAmmoByType(playerPed, ammoType)

		local addClip = GetMaxAmmoInClip(playerPed, weapon, 1)
		if(ammoAmmount == 0) then
			GiveWeaponToPed(playerPed, weapon, addClip, true, true)
			drawNotification("Weapon Added")
			return
		elseif(ammoAmmount < addClip) then
			SetPedAmmoByType(playerPed, ammoType, addClip)
		end
		GiveWeaponToPed(playerPed, weapon, 0, true, true)
		drawNotification("Weapon Added")
		if(featurePlayerInfiniteAmmo)then
			toggleInfiniteAmmo(featurePlayerInfiniteAmmo)
		end
	end
end


-- Ensure they have the weapon.
function forceHasWeapon(weaponName)
	if(HasPedGotWeapon(playerPed, GetHashKey(weaponName)) == false)then
		toggleWeaponEquipped(weaponName)
	end

end


-- Toggle a weapon component on/off for a weapon.
function toggleWeaponComponent(weaponName,componentName)
	--Citizen.Trace(weaponName.." "..componentName)
	local weapon = GetHashKey(weaponName)
	local component = GetHashKey(componentName)
	if(HasPedGotWeaponComponent(playerPed,weapon,component))then
		RemoveWeaponComponentFromPed(playerPed, weapon, component)
		drawNotification("Weapon Mod Removed")
	else
		GiveWeaponComponentToPed(playerPed, weapon, component)
		drawNotification("Weapon Mod Added")
	end

end


RegisterNUICallback("weapon", function(data)
	-- Update the current playerPed. Used inside functions.
	playerPed = GetPlayerPed(-1)
	local action = data.action
	local weaponString = data.data[3]

	if(action == "spawn") then
		toggleWeaponEquipped(weaponString)
		return
	elseif(action == "holdweapon")then
		local weapon = GetHashKey(weaponString)
		if(HasPedGotWeapon(playerPed,weapon))then
			SetCurrentPedWeapon(playerPed, weapon, 1)
		end
		return
	end

	if(action == "mod")then
		local modName = data.data[3]
		local weaponString = data.data[4]

		toggleWeaponComponent(weaponString, modName)

	elseif(action == "ammo")then
		local requestType = data.data[3]
		local weaponString = data.data[4]
		
		if(requestType == "add")then
			addWeaponClip(weaponString)
		elseif(requestType == "max")then
			maxAmmoWeapon(weaponString)
		end
	elseif(action == "tint")then
		local requestTint = data.data[3]
		local weaponString = data.data[4]

		SetPedWeaponTintIndex(playerPed,GetHashKey(weaponString), tonumber(requestTint))
		drawNotification("Weapon Tint Applied")

	elseif(action == "input")then
		local request = requestInput("",60)
		if(IsWeaponValid(GetHashKey(request)))then
			toggleWeaponEquipped(request)
		else
			drawNotification("Invalid Spawn Name")
		end
	else
		drawNotification("Error")
	end
end)




local allWeapons = {"WEAPON_KNIFE","WEAPON_KNUCKLE","WEAPON_NIGHTSTICK","WEAPON_HAMMER","WEAPON_BAT","WEAPON_GOLFCLUB","WEAPON_CROWBAR","WEAPON_BOTTLE","WEAPON_DAGGER","WEAPON_HATCHET","WEAPON_MACHETE","WEAPON_FLASHLIGHT","WEAPON_SWITCHBLADE","WEAPON_PISTOL","WEAPON_COMBATPISTOL","WEAPON_APPISTOL","WEAPON_PISTOL50","WEAPON_SNSPISTOL","WEAPON_HEAVYPISTOL","WEAPON_VINTAGEPISTOL","WEAPON_STUNGUN","WEAPON_FLAREGUN","WEAPON_MARKSMANPISTOL","WEAPON_REVOLVER","WEAPON_MICROSMG","WEAPON_SMG","WEAPON_ASSAULTSMG","WEAPON_MG","WEAPON_COMBATMG","WEAPON_COMBATPDW","WEAPON_GUSENBERG","WEAPON_MACHINEPISTOL","WEAPON_ASSAULTRIFLE","WEAPON_CARBINERIFLE","WEAPON_ADVANCEDRIFLE","WEAPON_SPECIALCARBINE","WEAPON_BULLPUPRIFLE","WEAPON_COMPACTRIFLE","WEAPON_PUMPSHOTGUN","WEAPON_SAWNOFFSHOTGUN","WEAPON_BULLPUPSHOTGUN","WEAPON_ASSAULTSHOTGUN","WEAPON_MUSKET","WEAPON_HEAVYSHOTGUN","WEAPON_DBSHOTGUN","WEAPON_SNIPERRIFLE","WEAPON_HEAVYSNIPER","WEAPON_MARKSMANRIFLE","WEAPON_GRENADELAUNCHER","WEAPON_GRENADELAUNCHER_SMOKE","WEAPON_RPG","WEAPON_STINGER","WEAPON_MINIGUN","WEAPON_FIREWORK","WEAPON_HOMINGLAUNCHER","WEAPON_GRENADE","WEAPON_STICKYBOMB","WEAPON_PROXMINE","WEAPON_BZGAS","WEAPON_SMOKEGRENADE","WEAPON_MOLOTOV","WEAPON_FIREEXTINGUISHER","WEAPON_PETROLCAN","WEAPON_SNOWBALL","WEAPON_FLARE","WEAPON_BALL"}


-- Toggle Infinite ammo for all weapons.
function toggleInfiniteAmmo(toggle)
	for i,v in ipairs(allWeapons) do
		local weapon = GetHashKey(v)
		SetPedInfiniteAmmo(playerPed, toggle, weapon)
	end	
end


-- Add All Weapons
function addAllWeapons()
	for i,v in ipairs(allWeapons) do
		forceHasWeapon(v)
	end	
end


-- Remove All Weapons
function removeAllWeapons()
	for i,v in ipairs(allWeapons) do
		local weapon = GetHashKey(v)
		RemoveWeaponFromPed(playerPed, weapon)
	end	
end


RegisterNUICallback("weaponoptions", function(data)
	-- Update the current playerPed. Used inside functions.
	playerPed = GetPlayerPed(-1)
	local action = data.action
	local weaponString = data.data[3]

	local text = "~r~OFF"
	if(data.newstate) then
		text = "~g~ON"
	end


	if(action == "infinitechutes")then
		featurePlayerInfiniteParachutes = data.newstate
		drawNotification("Infinite Parachutes: "..text)

	elseif(action == "noreload")then
		featurePlayerNoReload = data.newstate
		SetPedInfiniteAmmoClip(playerPed, featurePlayerNoReload)
		drawNotification("Infinite Clip: "..text)

	elseif(action == "infiniteammo")then
		featurePlayerInfiniteAmmo = data.newstate
		toggleInfiniteAmmo(featurePlayerInfiniteAmmo)
		drawNotification("Infinite Ammo: "..text)

	elseif(action == "addall")then
		addAllWeapons()
		drawNotification("Weapons Added")

	elseif(action == "removeall")then
		removeAllWeapons()
		drawNotification("Weapons Removed")
	end
end)




-- Infinite Parachutes, checks 4 times per second
Citizen.CreateThread(function()
	while true do
		Wait(250)

		--Infinite Parachutes
		if(featurePlayerInfiniteParachutes)then
			local pState = GetPedParachuteState(playerPed)

			-- unarmed or falling - don't try and give p/chute to player already using one, crashes game
			if (pState == -1 or pState == 3)then
				GiveDelayedWeaponToPed(playerPed, 0xFBAB5776, 1, 0)
				SetPedParachuteTintIndex(PlayerPedId(), 6)
			end
		end
	end

end)