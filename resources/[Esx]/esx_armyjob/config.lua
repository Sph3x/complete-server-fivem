Config                            = {}
Config.DrawDistance               = 600.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = false
Config.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale                     = 'fr'

Config.ArmyStations = {

  ARMY = {

    Blip = {
      Pos     = { x = -2307.806, y = 3390.877, z = 30.989 },
      Sprite  = 358,
      Display = 4,
      Scale   = 1.2,
--      Colour  = 29,
    },

    AuthorizedWeapons = {
      { name = 'WEAPON_NIGHTSTICK',       price = 200 },
      { name = 'WEAPON_COMBATPISTOL',     price = 300 },
      { name = 'WEAPON_ASSAULTSMG',       price = 1250 },
      { name = 'WEAPON_ASSAULTRIFLE',     price = 1500 },
      { name = 'WEAPON_PUMPSHOTGUN',      price = 600 },
      { name = 'WEAPON_STUNGUN',          price = 500 },
      { name = 'WEAPON_FLASHLIGHT',       price = 80 },
      { name = 'WEAPON_FIREEXTINGUISHER', price = 120 },
      { name = 'WEAPON_FLAREGUN',         price = 60 },
      { name = 'WEAPON_STICKYBOMB',       price = 250 },
      { name = 'WEAPON_KNIFE',            price = 200 },
      { name = 'WEAPON_PISTOL',           price = 1250 },
      { name = 'WEAPON_PISTOL50',         price = 1500 },
      { name = 'WEAPON_MG',               price = 600 },
      { name = 'WEAPON_RPG',              price = 80 },
      { name = 'WEAPON_BULLPUPRIFLE',     price = 60 },
      { name = 'WEAPON_HEAVYSHOTGUN',     price = 250 },
      { name = 'WEAPON_HEAVYSNIPER',      price = 250 },
      { name = 'WEAPON_MARKSMANRIFLE',    price = 200 },
      { name = 'WEAPON_AUTOSHOTGUN',      price = 1250 },
      { name = 'WEAPON_ASSAULTRIFLE',     price = 1500 },
      { name = 'WEAPON_REMOTESNIPER',     price = 1500 },
      { name = 'GADGET_PARACHUTE',        price = 300 },
      { name = 'GADGET_NIGHTVISION',      price = 300 },
    },
	AuthorizedVehicles = {
		{name = 'apc' , label = 'APC'},
		{name = 'barracks', label = 'Convoi'},
		{name = 'crusader', label = 'Transport de Troupes'},
		{name = 'rhino', label = 'Tank'},
		{name = 'hauler2', label = 'Transport'},
		{name = 'insurgent', label = 'Insurgent Armé'},
		{name = 'insurgent2', label = 'Insurgent'},
		{name = 'insurgent3', label = 'Insurgent Rapide Armé'},
		{name = 'savage', label = 'Savage'},
		{name = 'buzzard', label = 'Buzzard'},
		{name = 'hydra', label = 'Hydra'},
		{name = 'cargobob', label = 'Transport Aérien'},
		{name = 'dune', label = 'Dune déplacement terrestre'},
		{name = 'brickade', label = 'Camion Intervention Lourd'},
		{name = 'nightshark', label = 'Nightshark (Commandant)'},
		{name = 'valkyrie', label = 'Valkyrie (Commandant)'},
		{name = 'ruiner2', label = 'Ruiner 2000 (Commandant)'},
	},

    Cloakrooms = {
      {x = -2358.901, y = 3254.306, z = 31.810}
    },

    Armories = {
      {x = -2357.714, y = 3256.207, z = 31.810}
    },

    Vehicles = {
      {
        Spawner    = {x = -2345.004, y = 3256.802, z = 32.963},
        SpawnPoint = {x = -2338.568, y = 3254.336, z = 32.827},
        Heading    = 90.0
      }
    },

    Helicopters = {
      {
        Spawner    = {x = -1817.662, y = 2968.906, z = 32.810},
        SpawnPoint = {x = -1803.441, y = 2960.840, z = 32.809},
        Heading    = 0.0
      }
    },

    VehicleDeleters = {
      {x = -1883.584, y = 3005.857, z = 31.810},
	  {x = -2329.963, y = 3256.035, z = 31.827},
    },

    BossActions = {
      {x = -2346.942, y = 3269.744, z = 31.810}
    },

  },

}
