ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_screeneffect:putOnPlayer')
AddEventHandler('esx_screeneffect:putOnPlayer', function(player, pType)
  if player == -1 then
  	player = source
  end
  TriggerClientEvent('esx_screeneffect:switch', player, pType)
end)


ESX.RegisterUsableItem('cagoule', function(source)
	local source_ = source
    TriggerClientEvent('esx_screeneffect:put', source_, "cagoule")
end)
