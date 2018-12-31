TriggerEvent('es:addGroupCommand', 'mapper', "admin", function(source, args, user)
	TriggerClientEvent('es_mapper:toggle', source)
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end, {help = 'Edit Map'})

--[[
RegisterCommand('mapper', function(source, args)
	if source ~= 0 then
		TriggerClientEvent('es_mapper:toggle', source)
	end
end)
]]--
