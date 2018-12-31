Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = {x = 1.5, y = 1.5, z = 1.0}
Config.MarkerColor                = {r = 50, g = 50, b = 204}
Config.EnablePlayerManagement     = false
Config.EnableArmoryManagement     = false
Config.EnableESXIdentity          = false -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.MaxInService               = -1
Config.Locale                     = 'de'


Config.PoliceStations = {

  LSPD = {

    Blip = {
      Pos     = { x = 425.130, y = -979.558, z = 30.711 },
      Sprite  = 60,
      Display = 4,
      Scale   = 1.2,
      Colour  = 29,
    },

    AuthorizedWeapons = {
      {name = 'WEAPON_NIGHTSTICK',       price = 200},
      {name = 'WEAPON_COMBATPISTOL',     price = 300},
      {name = 'WEAPON_ASSAULTSMG',       price = 1250},
      {name = 'WEAPON_ASSAULTRIFLE',     price = 1500},
      {name = 'WEAPON_PUMPSHOTGUN',      price = 600},
      {name = 'WEAPON_STUNGUN',          price = 500},
      {name = 'WEAPON_FLASHLIGHT',       price = 80},
      {name = 'WEAPON_FIREEXTINGUISHER', price = 120},
      {name = 'WEAPON_FLAREGUN',         price = 60},
      {name = 'WEAPON_STICKYBOMB',       price = 250},
      {name = 'GADGET_PARACHUTE',        price = 300},
    },

    AuthorizedVehicles = {
      {name = 'police' , label = 'Streifenfahrzeug 1'},
      {name = 'police2', label = 'Streifenfahrzeug 2'},
      {name = 'police3', label = 'Streifenfahrzeug 3'},
      {name = 'police4', label = 'Zivilfahrzeug'},
      {name = 'policeb', label = 'Motorrad'},
      {name = 'policet', label = 'Transporter'},
    },

    Cloakrooms = {
      {x = -2358.901, y = 3254.306, z = 31.810}
    },

    Armories = {
      {x = -2357.714, y = 3256.207, z = 31.810}
    },

    Vehicles = {
      {
        Spawner    = {x = -2345.9580, y = 3254.750, z = 31.028},
        SpawnPoint = {x = -2342.659, y = 3250.693, z = 31.827},
        Heading    = 90.0
      }
    },

    Helicopters = {
      {
        Spawner    = {x = -1833.248, y = 2966.934, z = 31.810},
        SpawnPoint = {x = -1803.441, y = 2960.840, z = 31.809},
        Heading    = 0.0
      }
    },

    VehicleDeleters = {
      {x = -1883.584, y = 3005.857, z = 31.810},
	  {x = -2329.963, y = 3256.035, z = 31.827},
    },

    BossActions = {
      {x = -2346.942, y = 3269.744, z = 31.810}

  }

}
