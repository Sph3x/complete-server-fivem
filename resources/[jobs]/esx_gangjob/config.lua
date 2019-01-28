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
      { name = 'WEAPON_COMBATPISTOL',     price = 30000 },
      { name = 'WEAPON_ASSAULTSMG',       price = 1125000 },
      --{ name = 'WEAPON_ASSAULTRIFLE',     price = 1500000 },
      { name = 'WEAPON_SAWNOFFSHOTGUN',      price = 60000 },
	  { name = 'WEAPON_BAT'		,        price = 3000 },
      --{ name = 'WEAPON_SNIPERRIFLE',      price = 2200000 },
      { name = 'WEAPON_APPISTOL',         price = 70000 },
      { name = 'WEAPON_CARBINERIFLE',     price = 100000 },
      --{ name = 'WEAPON_HEAVYSNIPER',      price = 2000000 },
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
      { x = -95.255264282227, y = -68.602272033691, z = 58.127735137939},
    },

    Vehicles = {
      {
        Spawner    = { x = -104.53925323486, y = -66.550964355469, z = 56.423179626465 },
        SpawnPoint = { x = -99.29483032226, y = -57.635417480469, z = 56.423183441162 },
        Heading    = 315.699890,
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
      { x = -112.81218719482, y = -72.5231768798825, z = 56.648830413818 },
      
    },

    BossActions = {
      { x = -102.42551422119, y = -62.505821228027, z = 62.737754821777 },
    },

  },

}
