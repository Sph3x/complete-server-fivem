Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerSizeDel              = { x = 5.0, y = 5.0, z = 0.5 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.MarkerColorDel             = { r = 204, g = 50, b = 50 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale                     = 'fr'
Config.EnableFacadeSociety         = true
Config.IllegalCode = 2806

Config.IllegalMarkerColor = { r= 204, g =100, b= 100}
Config.IllegalCarMarkerSize = { x = 5.0, y = 5.0, z = 0.5 }

Config.Illegal = {
  Teleport = {
    IllegalRoomEntry1 = {
      positionFrom = { x = 1082.5856933594, y= -787.45501708984, z= 57.5527,  nom = "Entrer"},
      positionTo = { x = 903.55458984, y=   -3182.390625, z=  -97.8527, nom = "Sortir"},
    },
    IllegalRoomEntry2 = {
      positionFrom = {x = 880.80426025391, y=   -3249.70000, z=  -99.0527, nom = "Sortir"},
      positionTo = {  x = -942.0097045, y= 16.456165, z= 47.5301, nom = "Entrer"},
    },
  },

  CarTeleport = {
    IllegalTunnelEntry = {
      positionFrom = { x = 1092.428833, y= -789.983276, z= 57.5627,  h = 180.0, nom = "Entrer par le tunnel"},
      positionTo = { x = 954.9675, y= -3244.8964, z= -95.0170, h = 90.0 ,nom = "Sortir par le tunnel"},
    },
    IllegalBaseEntry = {
      positionFrom = { x = 898.70275878906, y= -3245.532226, z= -99.1121, h = 270.0,  nom = "Entrer dans la base"},
      positionTo = { x = 891.52874755859, y=   -3243.95800, z=  -99.2617, h = 90.0, nom = "Sortir par le tunnel"},
    },
  },

  Locker = {
    BossLocker = {
      { x = 903.68322753906, y = -3199.3076171875, z = -98.187911, name = "BossLocker", type = 'locker'},
    },
    SecurityChiefLocker = {
      { x = 908.141296, y = -3203.011962, z = -98.18791, name = "SecurityChiefLocker", type = 'locker'},
    },
    TeamLocker = {
      { x = 904.70202, y = -3238.85644, z = -99.2942, name = "TeamLocker", type = 'locker'},
    },
    WeaponLocker = {
      { x = 884.7355, y = -3199.8543, z = -99.187911, name = "WeaponLocker", type = 'weapon'},
    },
    DrugLocker = {
     { x = 891.1911, y = -3224.6577, z = -99.2300, name = "DrugLocker", type = 'drug'},
   },
  }
}

Config.bodyguardStations = {

  bodyguard = {
      Blip = {
        Pos     = {x = -817.48126220703 ,y = 177.86479187012,z = 72.223388671875},
        Sprite  = 442,
        Display = 4,
        Scale   = 1.5,
        Colour  = 50,
      },

      BlipPlaneHangar = {
        Pos     = { x = -985.54797363281,y = -2950.544677344,z = 13.945073127747 },
        Sprite  = 307,
        Display = 4,
        Scale   = 1.5,
        Colour  = 50,
      },




     AuthorizedWeapons = {
      { name = 'WEAPON_PISTOL_MK2',       price = 1000 },
     -- { name = 'WEAPON_ASSAULTRIFLE',     price = 1000 },
      --{ name = 'WEAPON_SAWNOFFSHOTGUN',   price = 1000 },
      --{ name = 'WEAPON_BAT',              price = 1000 },
     -- { name = 'WEAPON_PUMPSHOTGUN',      price = 1000 },
      { name = 'WEAPON_KNIFE',            price = 1000 },
      { name = 'WEAPON_STUNGUN',          price = 1000},
      --{ name = 'WEAPON_SNIPERRIFLE',      price = 1000 },
    },

    AuthorizedVehicles = {
    {name = 'hakuchou', label = 'Moto hakuchou'},
    {name = 'schafter5', label = 'Schafter V12'},
    {name = 'dubsta2', label = 'Dubsta luxe'},
    {name = 'xls2', label = 'Bmw XLS'},  
    {name = 'guardian', label = 'Offroad Guardian'}  
    },
  
  AuthorizedVehicles1 = {
    {name = 'frogger2' , label = 'Hélico'}
  },

  AuthorizedVehicles2 = {
    {name = 'nimbus', label = 'Jet privée'}
  },

     Cloakrooms = {
      { x = -811.68957519531, y = 175.23027038574, z = 75.545384216309 },
    },

    Armories = {
      { x = -803.51403808594, y = 185.64356994629, z = 71.505506896973 },
    },

    Vehicles = {
      {
        Spawner    = { x = -807.59442138672, y = 188.18432617188, z = 71.577043151855 },
        SpawnPoint = { x = -811.95440673828, y = 187.63679504395, z = 71.574159240723 },
        Heading    = 115.25,
      },
    },

    VehiclesIllegal = 
      {
        {
          Spawner    = { x = 883.07489, y = -3240.0541, z = -99.27 },
          SpawnPoint = { x = 883.07489, y = -3240.0541, z = -98.27 },
          Heading    = 170.0,
        }
      },

    Vehicles1 = {
     {
    Spawner1    = {x = -781.90875244141,y = 156.68197631836,z = 65.57852935791 },
    SpawnPoint1 = {x = -773.06561279297,y = 160.55815124512,z = 65.574578857422 },
    Heading1   = 90.0
     }
   },

   Vehicles2 = {
   {
      Spawner2   = {x = -985.54797363281,y = -2950.544677344,z = 12.945073127747 },
      SpawnPoint2 = {x = -977.982421875,y = -2996.1220703125,z = 13.945074081241 },
      Heading2   = 90.0
    }  
 },

   VehicleDeleters = {
      { x = -805.24328613281, y = 162.93472290039, z = 70.538375854492 },
    },

  VehicleDeleters1 = {
    {x = -772.69378662109,y = 146.16860961914,z = 66.574174499512 },
  },
  VehicleDeleters2 = {
    {x = -977.982421875,y = -2996.1220703125,z = 12.945074081241 },
  },
   BossActions = {
      { x = -802.48681640625, y = 173.01718139648, z = 71.551493835449 }
    },

  },

}
