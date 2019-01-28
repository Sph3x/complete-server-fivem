
Config.Jobs.fisherman = {
  BlipInfos = {
    Sprite = 68,
    Color = 3
  },
  Vehicles = {
    Truck = {
      Spawner = 1,
      Hash = "benson",
      Trailer = "none",
      HasCaution = true
    },
    Boat = {
      Spawner = 2,
      Hash = "tug",
      Trailer = "none",
      HasCaution = false
    }
  },
  Zones = {
    CloakRoom = {
      Pos   = {x = 3808.2661, y = 4477.6416, z = 4.9418},
      Size  = {x = 2.0, y = 2.0, z = 1.0},
      Color = {r = 204, g = 204, b = 0},
      Marker= 0,
      Blip  = true,
      Name  = _U('fm_fish_locker'),
      Type  = "cloakroom",
      Hint  = _U('cloak_change'),
      GPS = {x = 3807.7128, y = 4452.7026, z = 3.0973} --vehicule
    },

    FishingSpot = {
      Pos   = {x = 4435.21, y = 4829.6, z = 0.3439},
      Color = {r = 204, g = 204, b = 0},
      Size  = {x = 110.0, y = 110.0, z = 10.0},
      Marker= 1,
      Blip  = true,
      Name  = _U('fm_fish_area'),
      Type  = "work",
      Item  = {
        {
          name   = _U('fm_fish'),
          db_name= "fish",
          time   = 2000,
          max    = 100,
          add    = 1,
          remove = 1,
          requires = "nothing",
          requires_name = "Nothing",
          drop   = 100
        }
      },
      Hint  = _U('fm_fish_button'),
      GPS = {x = 3859.43, y = 4448.83, z = 0.39994}
    },

    BoatSpawner = {
      Pos   = {x = 3867.44, y = 4463.62, z = 1.72386},
      Size  = {x = 3.0, y = 3.0, z = 1.0},
      Color = {r = 0, g = 155, b = 255},
      Marker= 0,
      Blip  = false,
      Name  = _U('fm_spawnboat_title'),
      Type  = "vehspawner",
      Spawner = 2,
      Hint  = _U('fm_spawnboat'),
      Caution = 0,
      GPS = {x = 4435.21, y = 4829.6, z = 0.3439}
    },

    BoatSpawnPoint = {
      Pos   = {x = 3888.3, y = 4468.09, z = 0.0},
      Size  = {x = 3.0, y = 3.0, z = 1.0},
      Marker= -1,
      Blip  = false,
      Name  = _U('fm_boat_title'),
      Type  = "vehspawnpt",
      Spawner = 2,
      GPS = 0,
      Heading = 270.1
    },

    BoatDeletePoint = {
      Pos   = {x = 3859.43, y = 4448.83, z = 0.39994},
      Size  = {x = 10.0, y = 10.0, z = 1.0},
      Color = {r = 166, g = 0, b = 0},
      Marker= 0,
      Blip  = false,
      Name  = _U('fm_boat_return_title'),
      Type  = "vehdelete",
      Hint  = _U('fm_boat_return_button'),
      Spawner = 2,
      Caution = 0,
      GPS = {x = -2196.7802, y = 4260.3710, z = 47.0418},--vente
      Teleport = {x = 3867.44, y = 4463.62, z = 1.72386}
    },


    VehicleSpawner = {
          Pos   = {x = 3807.7128, y = 4452.7026, z = 3.0973},
          Size  = {x = 3.0, y = 3.0, z = 1.0},
          Color = {r = 0, g = 155, b = 255},
      Marker= 0,
      Blip  = false,
      Name  = _U('spawn_veh'),
      Type  = "vehspawner",
      Spawner = 1,
      Hint  = _U('spawn_veh_button'),
      Caution = 0,
      GPS = {x = 3867.44, y = 4463.62, z = 1.72386}
    },

    VehicleSpawnPoint = {
          Pos   = {x = 3806.1230, y = 4460.9765, z = 4.4872},
          Size  = {x = 3.0, y = 3.0, z = 1.0},
      Marker= -1,
      Blip  = false,
      Name  = _U('service_vh'),
      Type  = "vehspawnpt",
      Spawner = 1,
      GPS = 0,
      Heading = 70.1
    },

    VehicleDeletePoint = {
          Pos   = {x = 3804.2790, y = 4442.8623, z = 2.9920},
          Size  = {x = 5.0, y = 5.0, z = 1.0},
          Color = {r = 166, g = 0, b = 0},
      Marker= 0,
      Blip  = false,
      Name  = _U('return_vh'),
      Type  = "vehdelete",
      Hint  = _U('return_vh_button'),
      Spawner = 1,
      Caution = 0,
      GPS = 0,
      Teleport = 0
    },

    Delivery = {
      Pos   = {x = -2196.7802, y = 4260.3710, z = 47.0418},--vente
      Size  = {x = 5.0, y = 5.0, z = 1.0},
      Color = {r = 0, g = 155, b = 255},
      Marker= 0,
      Blip  = true,
      Name  = _U('delivery_point'),
      Type  = "delivery",
      Spawner = 2,
      Item  = {
        {
          name   = _U('delivery'),
          time   = 500,
          remove = 1,
          max    = 100, -- if not present, probably an error at itemQtty >= item.max in esx_jobs_sv.lua
          price  = 40,
          requires = "fish",
          requires_name = _U('fm_fish'),
          drop   = 100
        }
      },
      Hint  = _U('fm_deliver_fish'),
      GPS = {x = 3867.44, y = 4463.62, z = 1.72386}
    }
  }
}
