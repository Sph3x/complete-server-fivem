Config                            = {}
Config.DrawDistance               = 100.0
Config.MaxInService               = -1
Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
Config.EnableESXIdentity          = false
Config.Locale                     = 'fr'

Config.Cig = {
  'malbora',
  'gitanes'
}

Config.CigResellChances = {
  malbora = 45,
  gitanes = 55,
}

Config.CigResellQuantity= {
  malbora = {min = 5, max = 10},
  gitanes = {min = 5, max = 10},
}

Config.CigPrices = {
  malbora = {min = 35, max = 20},
  gitanes = {min = 25,   max = 25},
}

Config.CigPricesHigh = {
  malbora = {min = 65, max = 30},
  gitanes = {min = 55,   max = 35},
}

Config.Time = {
	malbora = 5 * 60,
	gitanes = 5 * 60,
}

Config.Blip = {
  Pos     = { x = 972.09210205078, y = -125.28999328613, z = 74.31 },
  Sprite  = 79,
  Display = 4,
  Scale   = 1.2,
  Colour  = 2,
}

Config.Zones = {

  TabacActions = {
    Pos   = { x =977.21374511719, y = -104.03607940674, z = 73.845 },
    Size  = { x = 1.6, y = 1.6, z = 1.0 },
	Color = {r = 136, g = 243, b = 216},
    Type  = 23,
  },

  Garage = {
    Pos   = { x = 2886.9729003906, y = 4609.4565429688, z = 46.987 },
    Size  = { x = 1.6, y = 1.6, z = 1.0 },
	Color = {r = 136, g = 243, b = 216},
    Type  = 23,
  },

  Craft = {
    Pos   = { x = 974.52801513672, y = -101.87335968018, z = 73.845 },
    Size  = { x = 1.6, y = 1.6, z = 1.0 },
	Color = {r = 136, g = 243, b = 216},
    Type  = 27,
  },

  Craft2 = {
    Pos   = { x = 987.06652832031, y = -144.44741821289, z = 74.271 },
    Size  = { x = 1.6, y = 1.6, z = 1.0 },
	Color = {r = 136, g = 243, b = 216},
    Type  = 27,
  },

  VehicleSpawnPoint = {
    Pos   = { x = 964.86932373047, y = -119.27603149, z = 73.353 },
    Size  = { x = 1.6, y = 1.6, z = 1.0 },
    Type  = -1,
  },

  VehicleDeleter = {
    Pos   = { x = 984.0830078125, y = -136.76441955566, z = 72.365 },
    Size  = { x = 1.6, y = 1.6, z = 1.0 },
    Color = { r = 204, g = 204, b = 0 },
    Type  = 1,
  },

  SellFarm = {
    Pos   = {x = 68.924179077148, y = 127.1748046875, z = 78.226},
    Size  = { x = 1.6, y = 1.6, z = 1.0 },
	Color = {r = 136, g = 243, b = 216},
    Name  = "Vente des produits",
    Type  = 1
  },
  
}
