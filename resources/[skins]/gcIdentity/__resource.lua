resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

ui_page 'html/ui.html'

server_script '@mysql-async/lib/MySQL.lua'

files {
	'html/ui.html',
	'html/style.css',
	'html/script.js',
	'html/carteV3_m.png',
	'html/carteV3_f.png',
	'html/cursor.png'
}

client_script {
	"client.lua"
}

server_script {
'server.lua',
'@mysql-async/lib/MySQL.lua',
'@es_extended/locale.lua'
}

export 'getIdentity'

