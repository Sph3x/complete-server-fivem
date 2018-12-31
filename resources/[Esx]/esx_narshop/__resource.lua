resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Esx NarShop'

version '1.1.0'

client_scripts {
	'@es_extended/locale.lua',
	'locales/fr.lua',
	'config.lua',
	'client/main.lua'
}

server_scripts {
	'@es_extended/locale.lua',
	'@mysql-async/lib/MySQL.lua',
	'locales/fr.lua',
	'config.lua',
	'server/main.lua'
}

dependency 'es_extended'
