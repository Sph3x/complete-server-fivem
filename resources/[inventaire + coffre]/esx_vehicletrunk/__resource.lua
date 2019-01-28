version '0.0.1'

description 'ESX Vehicletrunk'

client_scripts {
    'config.lua',
    'client/main.lua'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
    'config.lua',
    'server/main.lua',
}
