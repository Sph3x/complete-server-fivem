--[[                   GNU GENERAL PUBLIC LICENSE
                       Version 3, 29 June 2007
 Copyright (C) 2007 Free Software Foundation, Inc. <http://fsf.org/>
 Everyone is permitted to copy and distribute verbatim copies
 of this license document, but changing it is not allowed.
]]

resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

version '4.2'

description 'Esx Bike Rental by sheen - thx for base Woopi/Lucas Miller'


client_scripts {
  '@es_extended/locale.lua',
  'translations/en.lua',
  'translations/cz.lua',
  'config.lua',
  'client.lua'
}

server_scripts {
	'@es_extended/locale.lua',
	'translations/en.lua',
	'translations/cz.lua',
	'config.lua',
	'server.lua'
}	
