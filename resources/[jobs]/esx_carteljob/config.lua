Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = false -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale                     = 'fr'

Config.GangStations = {

  Gang = {

    Blip = {
--      Pos     = { x = 425.130, y = -979.558, z = 30.711 },
      Sprite  = 60,
      Display = 4,
      Scale   = 1.2,
      Colour  = 29,
    },

    AuthorizedWeapons = {

    {name = 'WEAPON_FIREEXTINGUISHER', price = 500},
    {name = 'WEAPON_STUNGUN',          price = 1000},
    {name = 'WEAPON_BZGAS',            price = 3000},
    {name = 'WEAPON_MOLOTOV',          price = 1500},
    {name = 'WEAPON_SMOKEGRENADE',     price = 1500},            
    {name = 'WEAPON_HEAVYPISTOL',      price = 8000},
    {name = 'WEAPON_COMBATPISTOL',     price = 10000},    
    {name = 'WEAPON_MICROSMG',         price = 12000},
    {name = 'WEAPON_SMG',              price = 16000},
    {name = 'WEAPON_CARBINERIFLE',     price = 18000},  
    {name = 'WEAPON_MG',               price = 25000},
    {name = 'WEAPON_COMPACTRIFLE',     price = 25000}, 
    {name = 'WEAPON_ASSAULTRIFLE',     price = 25000},
    {name = 'WEAPON_COMBATPDW',        price = 25000},
    {name = 'WEAPON_SPECIALCARBINE',   price = 35000},           
    {name = 'WEAPON_SAWNOFFSHOTGUN',   price = 17500},    
    {name = 'WEAPON_PUMPSHOTGUN',      price = 17500},
    {name = 'WEAPON_HEAVYSHOTGUN',     price = 25000},
    {name = 'WEAPON_MARKSMANRIFLE',    price = 30000},
    {name = 'WEAPON_SNIPERRIFLE',      price = 500000},
    {name = 'WEAPON_HEAVYSNIPER',      price = 650000},    
    {name = 'WEAPON_GUSENBERG',        price = 800000},
    {name = 'WEAPON_STICKYBOMB',       price = 100000},
    {name = 'WEAPON_PIPEBOMB',         price = 150000},
    {name = 'WEAPON_COMPACTLAUNCHER',  price = 1650000},
    {name = 'WEAPON_HOMINGLAUNCHER',   price = 3500000},            

    },

	  AuthorizedVehicles = {
		  { name = 'schafter5',  label = 'Véhicule Civil' },
		  { name = 'Akuma',    label = 'Moto' },
		  { name = 'Granger',   label = '4X4' },
		  { name = 'mule3',      label = 'Camion de Transport' },
	  },

    Cloakrooms = {
      --{ x = 144.57633972168, y = -2203.7377929688, z = 3.6880254745483},
    },

    Armories = {
      {x = 987.0928,   y = 2922.1762,  z = 31.120},
    },

    Vehicles = {
      {
        Spawner    = { x = 971.51593017578, y = 2920.287109375, z = 31.119997024536 },
        SpawnPoint = { x = 1019.0714, y = 2907.7136, z = 40.7725, a = 180.00 },
        Heading    = 314.51,
      }
    },

    Helicopters = {
      {
        Spawner    = { x = 113.30500793457, y = -3109.3337402344, z = 5.0060696601868 },
        SpawnPoint = { x = 112.94457244873, y = -3102.5942382813, z = 5.0050659179688 },
        Heading    = 0.0,
      }
    },

    VehicleDeleters = {
      { x = 1037.7847, y = 2917.3496, z = 40.5999 },
      
    },

    BossActions = {
      { x = 974.2588, y = 2912.0456, z = 30.80 },
    },

  },

}
