


-- MelloTrainer Config


--  Name: localSaving 
--	Toggles the vehicle and skin saving system. 
--	Options: true, false 

local localSaving = true

--[[-----------------------------------------------------------
	Name: steamOnly 
	Toggles steam only mode, if a player joins without a 
	steam id, it will kick them from the server.
	Options: true, false 
-------------------------------------------------------------]]
local steamOnly = true


--	Name: adminOnlyTrainer 
--	Toggles admin only trainer, meaning only people 
--	specified in the below admins table can use it. 
--	Options: true, false 

local adminOnlyTrainer = true


--	Name: adminOnlyNoclip 
--	Toggles if the Noclip Functionality should be
--	reserved for admins only
--	Options: true, false 

local adminOnlyNoclip = true



--	List of identifiers that is used to grant admin
--	privledges within the trainer. MUST FOLLOW EXAMPLE FORMATS.

local admins = {
	"steam:11000011bb09fc5",   -- Add all steam hexs heres.
	"steam:11000011b2b3644",   -- MUST FOLLOW EXAMPLE FORMAT
	"steam:11000010c80c4b5",
	"ip:0.0.0.0",              -- IP possible but not recommended
}


--local pvpEnabled = true
--local maxPlayers = 32

Config = {}
Config.settings = {
	--pvpEnabled = pvpEnabled,
	--maxPlayers = maxPlayers,

	adminOnlyTrainer = adminOnlyTrainer,
	admins = admins,
	localSaving = localSaving, 
	steamOnly = steamOnly,
	adminOnlyNoclip = adminOnlyNoclip
}


-- Get Setting from Config.settings
RegisterServerEvent("mellotrainer:getConfigSetting")
AddEventHandler("mellotrainer:getConfigSetting",function(stringname)
	local value = Config.settings[stringname]
	TriggerClientEvent("mellotrainer:receiveConfigSetting", source, stringname, value)
end)





--[[
  _    _                         __  __                                                              _   
 | |  | |                       |  \/  |                                                            | |  
 | |  | |  ___    ___   _ __    | \  / |   __ _   _ __     __ _    __ _   _ __ ___     ___   _ __   | |_ 
 | |  | | / __|  / _ \ | '__|   | |\/| |  / _` | | '_ \   / _` |  / _` | | '_ ` _ \   / _ \ | '_ \  | __|
 | |__| | \__ \ |  __/ | |      | |  | | | (_| | | | | | | (_| | | (_| | | | | | | | |  __/ | | | | | |_ 
  \____/  |___/  \___| |_|      |_|  |_|  \__,_| |_| |_|  \__,_|  \__, | |_| |_| |_|  \___| |_| |_|  \__|
                                                                   __/ |                                 
                                                                  |___/                                  
--]]



local Users = {}
-- Called whenever someone loads into the server. Users created in variables.lua
RegisterServerEvent('mellotrainer:firstJoinProper')
AddEventHandler('mellotrainer:firstJoinProper', function(id)
	local identifiers = GetPlayerIdentifiers(source)
	for i = 1, #identifiers do
		if(Users[source] == nil)then
			Users[source] = GetPlayerName(source) -- Update to user object?
		end
	end

	TriggerClientEvent('mellotrainer:playerJoined', -1, id)
	TriggerClientEvent("mellotrainer:receiveConfigSetting", source, "adminOnlyTrainer", Config.settings.adminOnlyTrainer)
	TriggerClientEvent( "mellotrainer:receiveConfigSetting", source, "localSaving", Config.settings.localSaving )
	TriggerClientEvent( "mellotrainer:receiveConfigSetting", source, "adminOnlyNoclip", Config.settings.adminOnlyNoclip )


	-- If local saving is turned on then ensure files are created for this person.
	if(Config.settings.localSaving)then
		DATASAVE:AddPlayerToDataSave(source)
	end
end)


-- Remove User on playerDropped.
AddEventHandler('playerDropped', function()
	if(Users[source])then
		TriggerClientEvent('mellotrainer:playerLeft', -1, Users[source])
		Users[source] = nil
	end
end)







-- Admin Managment
local adminList = Config.settings.admins


-- Is identifier in admin list?
function isAdmin(identifier)
	local adminList = {}
	for _,v in pairs(admins) do
		adminList[v] = true
	end
	identifier = string.lower(identifier)
	identifier2 = string.upper(identifier)

	if(adminList[identifier] or adminList[identifier2])then
		return true
	else
		return false
	end
end



-- Is user an admin? Select trainer option
RegisterServerEvent("mellotrainer:isAdmin")
AddEventHandler("mellotrainer:isAdmin",function()
	local identifiers = GetPlayerIdentifiers(source)
	local found = false
	for i=1,#identifiers,1 do
		if(isAdmin(identifiers[i]))then
			TriggerClientEvent("mellotrainer:adminstatus",source,true)
			found = true
			break
		end
	end
	if(not found)then
		TriggerClientEvent("mellotrainer:adminstatus",source,false)
	end
end)


-- Is user an admin?
RegisterServerEvent("mellotrainer:getAdminStatus")
AddEventHandler("mellotrainer:getAdminStatus",function()
	local identifiers = GetPlayerIdentifiers(source)
	local found = false
	for i=1,#identifiers,1 do
		if(isAdmin(identifiers[i]))then
			found = true
			break
		end
	end
	TriggerClientEvent("mellotrainer:adminStatusReceived",source,found)
end)

