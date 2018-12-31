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
Config.Locale                     = 'en'

Config.PoliceStations = {

  LSPD1 = {

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
      {name = 'WEAPON_SPECIALCARBINE',   price = 1500},
      {name = 'WEAPON_PUMPSHOTGUN',      price = 600},
      {name = 'WEAPON_STUNGUN',          price = 500},
      {name = 'WEAPON_FLASHLIGHT',       price = 80},
      {name = 'WEAPON_FIREEXTINGUISHER', price = 120},
      {name = 'WEAPON_FLAREGUN',         price = 60},
    },

    AuthorizedVehicles = {
      {name = 'police' , label = 'Police Vehicle 1'},
      {name = 'police2', label = 'Police Vehicle 2'},
      {name = 'police3', label = 'Police Vehicle 3'},
      {name = 'police4', label = 'Police Vehicle 4'},
      {name = 'policeb', label = 'Motorcycle'},
      {name = 'policet', label = 'Transport Van'},
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

  },

  SASP1 = {
    Blip = {
      Pos   = {x = 825.34204101563, y = -1290.0471191406, z = 28.240659713745 },
      Color = 40
    },

    AuthorizedWeapons = {
      {name = 'WEAPON_NIGHTSTICK',       price = 200},
      {name = 'WEAPON_COMBATPISTOL',     price = 300},
      {name = 'WEAPON_ASSAULTSMG',       price = 1250},
      {name = 'WEAPON_SPECIALCARBINE',   price = 1500},
      {name = 'WEAPON_PUMPSHOTGUN',      price = 600},
      {name = 'WEAPON_STUNGUN',          price = 500},
      {name = 'WEAPON_FLASHLIGHT',       price = 80},
      {name = 'WEAPON_FIREEXTINGUISHER', price = 120},
      {name = 'WEAPON_FLAREGUN',         price = 60},
    },

    AuthorizedVehicles = {
      {name = 'police' , label = 'Police Vehicle 1'},
      {name = 'police2', label = 'Police Vehicle 2'},
      {name = 'police3', label = 'Police Vehicle 3'},
      {name = 'police4', label = 'Police Vehicle 4'},
      {name = 'policeb', label = 'Motorcycle'},
      {name = 'policet', label = 'Transport Van'},
    },

    Cloakrooms = {
      {x = 830.11590576172, y = -1311.4512939453, z = 28.13673210144 } -- state pd
    },

    Armories = {
      {x = 858.25366210938, y = -1321.5992431641, z = 28.136734008789 } -- state pd
    },

    Vehicles = {
      {
        Spawner    = {x = 863.17700195313, y = -1346.2406005859, z = 26.039228439331 }, --state pd
        SpawnPoint = {x = 871.07720947266, y = -1350.00390625, z = 26.3092918396 },  -- state pd
        Heading    = 90.0 --state pd
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
      {x = 823.95031738281, y = -1371.1483154297, z = 26.136753082275 } --state pd
    },

    BossActions = {
      {x = 850.228515625, y = -1284.50390625, z = 28.004758834839 } --state pd
    }

  },

  LSPD2 = {
    Blip = {
      Pos   = {x = -441.80764770508, y = 6012.5131835938, z = 31.716369628906 },
      Color = 29
    },

    AuthorizedWeapons = {
      {name = 'WEAPON_NIGHTSTICK',       price = 200},
      {name = 'WEAPON_COMBATPISTOL',     price = 300},
      {name = 'WEAPON_ASSAULTSMG',       price = 1250},
      {name = 'WEAPON_SPECIALCARBINE',   price = 1500},
      {name = 'WEAPON_PUMPSHOTGUN',      price = 600},
      {name = 'WEAPON_STUNGUN',          price = 500},
      {name = 'WEAPON_FLASHLIGHT',       price = 80},
      {name = 'WEAPON_FIREEXTINGUISHER', price = 120},
      {name = 'WEAPON_FLAREGUN',         price = 60},
    },

    AuthorizedVehicles = {
      {name = 'police' , label = 'Police Vehicle 1'},
      {name = 'police2', label = 'Police Vehicle 2'},
      {name = 'police3', label = 'Police Vehicle 3'},
      {name = 'police4', label = 'Police Vehicle 4'},
      {name = 'policeb', label = 'Motorcycle'},
      {name = 'policet', label = 'Transport Van'},
    },

    Cloakrooms = {
      {x = -450.2878112793, y = 6016.482421875, z = 31.716369628906 },
    },

    Armories = {
      {x = -448.04425048828, y = 6007.7104492188, z = 31.716369628906 },
    },

    Vehicles = {
      {
        Spawner    = {x = -452.30313110352, y = 6005.6704101563, z = 31.840929031372 },
        SpawnPoint = {x = -454.96899414063, y = 6001.8876953125, z = 31.340549468994 },
        Heading    = 87.0
      }
    },

    Helicopters = {
      {
        Spawner    = {x = -462.88317871094, y = 5993.7685546875, z = 31.245756149292 },
        SpawnPoint = {x = -475.48043823242, y = 5988.326171875, z = 31.336708068848 },
        Heading    = 270.0
      }
    },

    VehicleDeleters = {
      {x = -447.64434814453, y = 5994.5024414063, z = 31.340551376343 },
    },

    BossActions = {
      {x = -441.80764770508, y = 6012.5131835938, z = 31.716369628906 },
    }

  },

  SASP2 = {
    Blip = {
      Pos   = {x = 1851.0972900391, y = 3683.7622070313, z = 34.26708984375 },
      Color = 40
    },

    AuthorizedWeapons = {
      {name = 'WEAPON_NIGHTSTICK',       price = 200},
      {name = 'WEAPON_COMBATPISTOL',     price = 300},
      {name = 'WEAPON_ASSAULTSMG',       price = 1250},
      {name = 'WEAPON_SPECIALCARBINE',   price = 1500},
      {name = 'WEAPON_PUMPSHOTGUN',      price = 600},
      {name = 'WEAPON_STUNGUN',          price = 500},
      {name = 'WEAPON_FLASHLIGHT',       price = 80},
      {name = 'WEAPON_FIREEXTINGUISHER', price = 120},
      {name = 'WEAPON_FLAREGUN',         price = 60},
    },

    AuthorizedVehicles = {
      {name = 'police' , label = 'Police Vehicle 1'},
      {name = 'police2', label = 'Police Vehicle 2'},
      {name = 'police3', label = 'Police Vehicle 3'},
      {name = 'police4', label = 'Police Vehicle 4'},
      {name = 'policeb', label = 'Motorcycle'},
      {name = 'policet', label = 'Transport Van'},
    },

    Cloakrooms = {
      {x = 1857.2354736328, y = 3689.8408203125, z = 34.26708984375 }, -- state pd
    },

    Armories = {
      {x = 1848.3413085938, y = 3690.1345214844, z = 34.26708984375 }, -- state pd
    },

    Vehicles = {
      {
        Spawner    = {x = 1866.208984375, y = 3693.8125, z = 33.737236022949 }, --state pd
        SpawnPoint = {x = 1872.9417724609, y = 3690.5759277344, z = 33.569362640381 },  -- state pd
        Heading    = 90.0 --state pd
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
      {x = 1866.4152832031, y = 3699.6052246094, z = 33.535938262939 }, --state pd
    },

    BossActions = {
      {x = 1851.0972900391, y = 3683.7622070313, z = 34.26708984375 }, --state pd
    }

  },

}
