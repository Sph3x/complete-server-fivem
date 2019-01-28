Config                        = {}
Config.DrawDistance           = 100.0
Config.MarkerType             = 1
Config.MarkerSize             = {x = 1.5, y = 1.5, z = 1.0}
Config.MarkerColor            = {r = 50, g = 50, b = 204}
Config.EnablePlayerManagement = true
Config.EnableArmoryManagement = true
Config.MaxInService           = -1
Config.Locale       		      = 'fr'

Config.GouvStations = {
	
	Gouv = {

		Blip = {
			Pos   = {x = -429.23803710938, y = 1109.8786621094, z = 326.68237304688},
			Color = 419
		},

		AuthorizedWeapons = {
			{name = 'WEAPON_NIGHTSTICK',       price = 250},
			{name = 'WEAPON_HEAVYPISTOL',      price = 750},
			{name = 'WEAPON_SMG',              price = 1250},
			{name = 'WEAPON_CARBINERIFLE',     price = 2500},
			{name = 'WEAPON_PUMPSHOTGUN',      price = 1750},
			{name = 'WEAPON_STUNGUN',          price = 350},
			{name = 'WEAPON_FLASHLIGHT',       price = 150},
			{name = 'WEAPON_FIREEXTINGUISHER', price = 150},
			{name = 'WEAPON_FLAREGUN',         price = 100},
			{name = 'WEAPON_STICKYBOMB',       price = 4000},
			{name = 'WEAPON_SNIPERRIFLE',      price = 3000},
			{name = 'GADGET_PARACHUTE',        price = 500},
		},

		AuthorizedVehicles = {
			{name = 'fbi', label = 'FBI Voiture'},
			{name = 'fbi2', label = 'FBI Jeep'},
			{name = 'sspres', label = 'Voiture Président 1'},
			{name = 'onebeast', label = 'Voiture Président 2'}
		},
		AuthorizedHelicopters = {
			{name = 'whitehawk' , label = 'Helicoptere du gouvernement'},
		},

		Cloakrooms = {
			{x = 118.6728, y = -729.1000, z = 241.1519}
		},

		Armories = {
			{x = 127.4273, y = -729.1021, z = 241.1519}
		},

		Vehicles = {
			{
				Spawner    = {x = 120.222, y = -723.191, z = 41.025},
				SpawnPoint = {x = 128.9342, y = -688.419, z = 40.703,},
				Heading    = 41.703
			}
		},

		Helicopters = {
			{
				Spawner    = {x = -460.4334, y = 1118.6762, z = 325.8999},
				SpawnPoint = {x = -421.0164, y = 1135.9117, z = 325.8603},
				Heading    = 0.0
			}
		},

		VehicleDeleters = {
			{x = 145.682, y = -709.135, z = 41.028},
		},

		BossActions = {
			{x = 154.129, y = -745.552, z = 241.152}
		}

	}

}