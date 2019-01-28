Config                        = {}
Config.DrawDistance           = 100.0
Config.MarkerType             = 1
Config.MarkerSize             = {x = 1.5, y = 1.5, z = 0.2}
Config.MarkerColor            = {r = 0, g = 8, b = 230}
Config.EnablePlayerManagement = true
Config.EnableArmoryManagement = false
Config.EnableLicenses         = true
Config.EnableESXIdentity      = true -- only turn this on if you are using esx_identity
Config.EnableSocietyOwnedVehicles = false
Config.MaxInService           = -1
Config.Locale       		      = 'fr'

Config.PoliceStations = {

	LSPD = {
		Blip = {
			Pos   = {x = 425.130, y = -979.558, z = 30.711},
			Color = 29
		},

        AuthorizedWeapons = { 
            { name = 'WEAPON_FLASHLIGHT',       price = 0 }, 
            { name = 'WEAPON_FLAREGUN',         price = 0 }, 
            { name = 'WEAPON_NIGHTSTICK',       price = 0 },           
            { name = 'WEAPON_PISTOL',           price = 0 },
            { name = 'WEAPON_COMBATPISTOL',     price = 0 }, 
            { name = 'WEAPON_STUNGUN',          price = 0 },     
            { name = 'WEAPON_ASSAULTSMG',       price = 0 }, 
            { name = 'WEAPON_CARBINERIFLE',     price = 0 },           
            { name = 'WEAPON_MICROSMG',         price = 0 },
            { name = 'WEAPON_SMG',              price = 0 },
            { name = 'WEAPON_PISTOL_MK2',       price = 0 },
            { name = 'WEAPON_PUMPSHOTGUN_MK2',  price = 0 },
            { name = 'WEAPON_BULLPUPRIFLE_MK2', price = 0 },
            { name = 'WEAPON_CARBINERIFLE_MK2', price = 0 },
        }, 

		AuthorizedVehicles = {
			{name = 'police' ,   label = 'Ford Focus'},
			{name = 'police2',   label = 'Voiture Rapide'},
			{name = 'police3',   label = 'Peugeot Partner'},
			{name = 'police4',   label = 'Préfèt Banalisée'},
			{name = 'sheriff',   label = 'Dacia Duster'},
			{name = 'sheriff2',  label = 'Jeep'},
			{name = 'blazer5',   label = 'Quad école'},
			{name = 'fbi',       label = 'Véhicule commandement'},
			{name = 'policeb',   label = 'Moto de ville'},
			{name = 'policebmw', label = 'Moto autoroutière'},
			{name = 'policet',   label = 'Fourgon transport divers'},
			{name = 'Policebike',label = 'Vélo de Police'},
			{name = 'pbus',      label = 'Transport détenus GIGN'},
			{name = 'riot',      label = 'Véhicule GIGN Lourd '},
			{name = 'polmav',    label = 'Hélicoptère'}
		},

		Cloakrooms = {
			{x = 452.600, y = -993.306, z = 29.750}
		},

		Armories = {
			{x = 461.94, y = -979.514, z = 29.689}
		},

		Vehicles = {
			{
				Spawner    = {x = 454.69, y = -1017.4, z = 27.430},
				SpawnPoint = {x = 438.42, y = -1018.3, z = 27.757},
				Heading    = 90.0
			}
		},

		Helicopters = {
			{
				Spawner    = {x = 466.477, y = -982.819, z = 42.691},
				SpawnPoint = {x = 450.04, y = -981.14, z = 42.691},
				Heading    = 0.0
			}
		},

		VehicleDeleters = {
			{x = 462.74, y = -1014.4, z = 27.065},
			{x = 462.40, y = -1019.7, z = 27.104}
		},

		BossActions = {
			{x = 448.417, y = -973.208, z = 29.689}
		}

	}

}
