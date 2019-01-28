resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description "Server Side Trainer to replace the Lambda Menu. Created by TheStonedTurtle/Michael Goodwin."

ui_page "nui/trainer.html"

files {
	"nui/trainer.html",
	"nui/trainer.js",
	"nui/trainer.css",
	"nui/Roboto.ttf",
	"nui/Lemonada.ttf",
	"nui/Roboto-Black.ttf"
}

client_scripts { 
	'cl_utils.lua',                    -- Clientsided utilites.
	'cl_variables.lua',                -- Create all default variables. 
	'cl_general.lua',                  -- User Managment/Trainer Controls/Global Functions
	'cl_map.lua',                      -- Map Blips.
	'cl_player.lua',                   -- Player Toggles & Options
	'cl_settings.lua',                 -- General Settings (Player Blips etc)
	'cl_settings_voice.lua',           -- Handles all voice-chat related settings
	'cl_settings_notifications.lua',   -- Handles Player & Death Notifications
	'cl_player_skin.lua',              -- Player Skins & Props
	'cl_player_online.lua',            -- Other Player Options (Teleport/Spectate)
	'cl_vehicles.lua',                 -- Vehicle Spawning/Modifications
	'cl_weapons.lua',                  -- Weapon Spawning/Attachments
	'cl_admin.lua',                    -- Handles Admin Menu Access & Options
	'cl_noclip.lua',                   -- Handles all No Clip features
	'cl_world.lua'                     -- World stuff, teleportation 
}

server_script 'sv_config.lua'       -- MelloTrainer config file
server_script 'sv_main.lua'         -- Main serversided file 
server_script 'sv_data_saving.lua'  -- Data saving system 
server_script 'sv_admin.lua'        -- Handles Cross-Player Admin Commands