Config                            = {}
Config.DrawDistance               = 100.0
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

Config.BikerStations = {

  Biker = {

    Blip = {
      Pos     = { x = 425.130, y = -979.558, z = 30.711 },
      Sprite  = 60,
      Display = 4,
      Scale   = 1.2,
      Colour  = 29,
    },

    AuthorizedWeapons = {
     -- { name = 'WEAPON_PISTOL50',       price = 0 },
	  { name = 'WEAPON_REVOLVER',       price = 5000 },
     -- { name = 'WEAPON_ASSAULTRIFLE',     price = 0 },
      { name = 'WEAPON_SAWNOFFSHOTGUN',       price = 5000 },
      { name = 'WEAPON_MOLOTOV',     price = 5000 },
      { name = 'WEAPON_KNIFE',      price = 5000 },
     -- { name = 'WEAPON_STUNGUN',          price = 50000 },
     -- { name = 'WEAPON_FLASHLIGHT',       price = 800 },
     -- { name = 'WEAPON_FIREEXTINGUISHER', price = 1200 },
     -- { name = 'WEAPON_FLAREGUN',         price = 6000 },
     -- { name = 'GADGET_PARACHUTE',        price = 3000 },
      { name = 'WEAPON_STICKYBOMB',       price = 5000 },
     -- { name = 'WEAPON_SNIPERRIFLE',      price = 2200000 },
     -- { name = 'WEAPON_FIREWORK',         price = 30000 },
     -- { name = 'WEAPON_GRENADE',          price = 180000 },
     -- { name = 'WEAPON_BZGAS',            price = 120000 },
     -- { name = 'WEAPON_SMOKEGRENADE',     price = 100000 },
      { name = 'WEAPON_APPISTOL',         price = 5000 },
      { name = 'WEAPON_CARBINERIFLE',     price = 5000 },
     -- { name = 'WEAPON_HEAVYSNIPER',      price = 0 },
     -- { name = 'WEAPON_MINIGUN',          price = 700000 },
     -- { name = 'WEAPON_RAILGUN',          price = 2500000 },
    },

	AuthorizedVehicles = {
		  { name = 'flatbed',  label = 'Plateaux' },
		  { name = 'avarus',    label = 'Moto Avararus' },
		  { name = 'hexer',   label = 'Moto Hexer' },
		  { name = 'guardian',      label = '4x4' },
	  },
	  Cloakrooms = {
      { x = 986.94677734375, y = -92.968696594238, z = -73.84593963623 },
    },
    Armories = {
      { x = 1004.3538, y = -3149.98584, z = -39.9071 },
    },

    Vehicles = {
      {
        Spawner    = { x = 964.87175996094, y = -119.22956848145, z = 73.353042602539 },
        SpawnPoint = { x = 967.47393798828, y = -125.96086120605, z = 73.354141235352},
        Heading    = 331.298,
      }
    },

    Helicopters = {
      --{
      --  Spawner    = { x = 468.73999023438, y = -1299.3319091797, z = 32.47146987915 },
      --  SpawnPoint = { x = 461.86053466797, y = -1297.3302001953, z = 32.478931427002 },
      --  Heading    = 82.760,
      --}
    },

    VehicleDeleters = {
      { x = 976.533, y = -142.497, z = 73.233 },
    },

    BossActions = {
      { x = 1008.7592, y = -3170.1137, z = -39.8941 }
    },
  },
}