--====================================================================================
-- #Author: Jonathan D & Charlie @ charli62128
-- 
-- Développée pour la communauté n3mtv
--      https://www.twitch.tv/n3mtv
--      https://twitter.com/n3m_tv
--      https://www.facebook.com/lan3mtv
--====================================================================================

--====================================================================================
--  Teste si un joueurs a donnée ces infomation identitaire
--====================================================================================
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('es:playerLoaded', function(source)
    print('identity playerLoaded')
    local identifier = GetPlayerIdentifiers(source)[1]
    MySQL.Async.fetchAll("SELECT users.* , jobs.label AS jobs FROM users JOIN jobs WHERE users.job = jobs.name AND users.identifier = @identifier", { ['@identifier'] = identifier }, function (result)             

        if result[1] ~= nil then
            result[1]['id'] = source
            identity = result[1]
            local identity = identity
            if identity == nil or identity.lastname == '' then
                TriggerClientEvent('gcIdentity:showRegisterIdentity', source)
            else
            print('identity setIdentity')
                TriggerClientEvent('gcIdentity:setIdentity', source, convertSQLData(identity))
            end
        end
    end)
end)

function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

function hasIdentity(source)
    local identifier = GetPlayerIdentifiers(source)[1]
    MySQL.Async.fetchAll("SELECT lastname, firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier }, function (result)
        if result[1] then
            local user = result[1]
            return not (user['lastname'] == '' or user['firstname'] == '')
        end
    end)
end

function convertSQLData(data)
    return {
        lastname = data.lastname,
        firstname = data.firstname,
        sex = data.sex,
        dateofbirth = tostring(data.dateofbirth),
        jobs = data.jobs,
        height = data.height,
        id = data.id
    }
end


RegisterServerEvent('gcIdentity:openIdentity')
AddEventHandler('gcIdentity:openIdentity',function(other)
    local identifier = GetPlayerIdentifiers(source)[1]
    MySQL.Async.fetchAll("SELECT users.* , jobs.label AS jobs FROM users JOIN jobs WHERE users.job = jobs.name AND users.identifier = @identifier", { ['@identifier'] = identifier }, function (result)             
        if result[1] ~= nil then
            result[1]['id'] = source
            identity = result[1]
            local data = convertSQLData(identity)
            TriggerClientEvent('gcIdentity:showIdentityData', other, data)
        end
    end)
end)


RegisterServerEvent('gcIdentity:setIdentity')
AddEventHandler('gcIdentity:setIdentity', function(data)
    MySQL.Async.fetchAll('UPDATE users SET lastname = @lastname, firstname = @firstname, dateofbirth = @dateofbirth, sex = @sex, height = @height WHERE identifier = @identifier', {
        ['@lastname'] = data.lastname,
        ['@firstname'] = data.firstname,
        ['@dateofbirth'] = data.dateofbirth,
        ['@sex'] = data.sex,
        ['@height'] = data.height,
        ['@identifier'] = GetPlayerIdentifiers(source)[1]
    })
end)