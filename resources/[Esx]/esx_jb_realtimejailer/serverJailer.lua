ESX 				= nil
-----------------------------

--ESX base
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('es:playerLoaded', function(source) 
  SetTimeout(20000, function()
	local identifier = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll('SELECT TIMESTAMPDIFF(SECOND, CURRENT_TIMESTAMP,J_Time) as timeleft, J_Cell as cellule, isjailed as isjailed from jail where identifier =@id', {['@id'] = identifier}, function(result)
		if result[1] ~= nil then
			if result[1].timeleft > 0 then
				if result[1].cellule ~= nil then
					TriggerClientEvent("esx_jb_jailer:JailInStation", source,result[1].cellule,result[1].timeleft)
				end
			elseif result[1].isjailed == true then
				if result[1].cellule ~= nil then
					TriggerClientEvent("esx_jb_jailer:JailInStation", source,result[1].cellule,result[1].timeleft)
				end
			end
		end
	end)
  end)
end)

-- RegisterServerEvent("esx_jb_jailer:JailUpdate")
-- AddEventHandler("esx_jb_jailer:JailUpdate", function(newTime)
	-- local xPlayer = ESX.GetPlayerFromId(source)
	-- print("TIME REMAINING="..newTime)
	-- local identifier = xPlayer.identifier
	-- MySQL.Async.execute("UPDATE jail SET J_Time=@TIME WHERE identifier=@identifier", {["@TIME"] = newTime, ['@identifier'] = identifier})
	-- if newTime == 0 then
		-- MySQL.Async.execute("UPDATE jail SET J_Time=@Time WHERE identifier=@identifier", {["@Time"] = 0, ['@identifier'] = identifier})
		-- TriggerClientEvent("esx_jb_jailer:UnJail", playerid)
	-- end
-- end)
function round(num, numDecimalPlaces)
  if numDecimalPlaces and numDecimalPlaces>0 then
    local mult = 10^numDecimalPlaces
    return math.floor(num * mult + 0.5) / mult
  end
  return math.floor(num + 0.5)
end

RegisterServerEvent("esx_jb_jailer:PutInJail")
AddEventHandler("esx_jb_jailer:PutInJail", function(playerid, jail, jailtime)
	--calculate jailtime
	local remainingjailseconds = jailtime/ 60
	local jailseconds =  math.floor(jailtime) % 60 
	local remainingjailminutes = remainingjailseconds / 60
	local jailminutes =  math.floor(remainingjailseconds) % 60
	local remainingjailhours = remainingjailminutes / 24
	local jailhours =  math.floor(remainingjailminutes) % 24
	local remainingjaildays = remainingjailhours / 365 
	local jaildays =  math.floor(remainingjailhours) % 365
	
	--end calculate jailtime
	local identifier = GetPlayerIdentifiers(playerid)[1]
	local name = GetPlayerName(source)
	local id = GetPlayerIdentifiers(source)[1]
	-- print(os.date('%d.%m.%Y %H:%M:%S'))
	local year = round(os.date('%Y'),0)
	local month = round(os.date('%m'),0)
	local day = round(os.date('%d')+jaildays,0)
	local hour = round(os.date('%H')+jailhours,0)
	local minutes =round(os.date('%M')+jailminutes,0)
	local seconds =round(os.date('%S')+jailseconds,0)
	if hour >= 24 then
		hour = hour - 24
		day = day +1
	end
	if ((month == 1 or month == 2 or month == 5 or month == 7 or month == 8 or month == 10 or month == 12) and day > 31) then
		month = month +1
		day = day -31
	elseif (month == 3 and day > 28) then
		month = month +1
		day = day -28
	elseif ((month == 4 or month == 6 or month == 9 or month == 11) and day > 30) then
		month = month +1
		day = day -30
	end
	
	if jail ~= nil then
			print("[esx_jb_jailer] Mettre en prison en ".. jail.." :".. GetPlayerName(playerid).. " pour ".. jailtime .." secs - commande entree par ".. GetPlayerName(source))
			TriggerEvent('esx:importantlogs',"[esx_jb_jailer] Mettre en prison en ".. jail.." :".. GetPlayerName(playerid).. " pour ".. jailtime .." secs - commande entree par ".. GetPlayerName(source))
			MySQL.Async.execute("INSERT INTO jail (identifier,isjailed,J_Time,J_Cell,Jailer,Jailer_ID) VALUES (@Identifier,@isjailed,@J_Time,@J_Cell,@JAILER,@JID) ON DUPLICATE KEY UPDATE identifier=@identifier,isjailed=@isjailed,J_Time=@J_Time, J_Cell=@J_Cell, Jailer=@JAILER, Jailer_ID=@JID", {['@identifier'] = identifier,['@isjailed'] = true, ['@J_Time'] = year..'-'..month..'-'..day..' '..hour..':'..minutes..':'..seconds, ['@J_Cell'] = jail, ['@JAILER'] = name, ['@JID'] = id})
			-- MySQL.Async.execute("INSERT INTO jail (identifier,isjailed,J_Time,J_Cell,Jailer,Jailer_ID) VALUES (@Identifier,@isjailed,@J_Time,@J_Cell,@JAILER,@JID) ON DUPLICATE KEY UPDATE Identifier=@identifier, isjailed=@isjailed J_Time=@J_Time, J_Cell=@J_Cell, jailer=@JAILER, Jailer_ID=@JID", {['@identifier'] = identifier,['@isjailed'] = true, ['@J_Time'] = os.date('%Y-%m-%d %H:%M:%S'), ['@J_Cell'] = "123", ['@JAILER'] = name, ['@JID'] = id})
			-- TriggerClientEvent('chatMessage', -1, 'JUGE', { 0, 0, 0 }, GetPlayerName(playerid) ..' est en prison pour '.. math.floor(jaildays).." jours, "..math.floor(jailhours).." heures,"..math.floor(jailminutes).." minutes, "..math.floor(jailseconds).." secondes")
			TriggerClientEvent("esx_jb_jailer:JailInStation", playerid,jail,jailtime)
	end
end)

RegisterServerEvent("esx_jb_jailer:UnJailplayer")
AddEventHandler("esx_jb_jailer:UnJailplayer", function(playerid)
	local identifier = GetPlayerIdentifiers(playerid)[1]
	if GetPlayerName(playerid) ~= nil then
		TriggerClientEvent("esx_jb_jailer:UnJail", playerid)
		-- MySQL.Async.execute("INSERT INTO jail (identifier,J_Time, isjailed) VALUES (@Identifier,@J_Time,@isjailed) ON DUPLICATE KEY UPDATE Identifier=identifier,isjailed=@isjailed,J_Time=@J_Time", {['@identifier'] = identifier, ['@J_Time'] = os.date('%Y-%m-%d %H:%M:%S'),['@isjailed'] = false})
		-- MySQL.Async.execute("UPDATE jail SET `isjailed` = false where identifier = @identifier", {['@identifier'] = identifier)
		MySQL.Async.execute("DELETE FROM jail WHERE identifier=identifier", {['@identifier'] = identifier})
	end
end)

function dump(o, nb)
  if nb == nil then
    nb = 0
  end
   if type(o) == 'table' then
      local s = ''
      for i = 1, nb + 1, 1 do
        s = s .. "    "
      end
      s = '{\n'
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
          for i = 1, nb, 1 do
            s = s .. "    "
          end
         s = s .. '['..k..'] = ' .. dump(v, nb + 1) .. ',\n'
      end
      for i = 1, nb, 1 do
        s = s .. "    "
      end
      return s .. '}'
   else
      return tostring(o)
   end
end
