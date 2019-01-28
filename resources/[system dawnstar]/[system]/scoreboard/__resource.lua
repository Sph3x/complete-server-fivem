resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Scoreboard'

ui_page 'html/scoreboard.html'

client_script 'client.lua'


server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server.lua'
}

files {
	'html/scoreboard.html',
	'html/style.css',
	'html/reset.css',
	'html/bg.png',
	'html/newlogo.png',
	'html/listener.js',
	'html/res/futurastd-medium.css',
	'html/res/futurastd-medium.eot',
	'html/res/futurastd-medium.woff',
	'html/res/futurastd-medium.ttf',
	'html/res/opensans-light.ttf',
	'html/res/futurastd-medium.svg'
}