
Config.Jobs.unicorn = {
  BlipInfos = {
    Sprite = 93,
    Color = 48
  },
  Vehicles = {
    Truck = {
      Spawner = 1,
      Hash = "youga",
      Trailer = "none",
      HasCaution = true
    }
  },
  Zones = {
    CloakRoom = {
      Pos   = {x = 107.3510, y = -1304.7512, z = 27.7176},--vestiere
      Size  = {x = 1.2, y = 1.2, z = 1.0},
      Color = {r = 0, g = 0, b = 0},
      Marker= 1,
      Blip  = false,
      Name  = _U('m_unicorn_locker'),
      Type  = "cloakroom",
      Hint  = _U('cloak_change'),
      GPS = {x = 87.0338, y = -1288.0550, z = 28.3832}--vehicule
    },

    Alcool = {
      Pos   = {x = 1541.98, y = 2184.08, z = 78.812},--recolt
      Size  = {x = 6.0, y = 6.0, z = 1.0},
      Color = {r = 0, g = 0, b = 0},
      Marker= 1,
      Blip  = true,
      Name  = _U('m_alcool'),
      Type  = "work",
      Item  = {
        {
          name   = _U('m_alcool'),
          db_name= "alcool",
          time   = 3000,
          max    = 40,
          add    = 1,
          remove = 1,
          requires = "nothing",
          requires_name = "Nothing",
          drop   = 100
        }
      },
      Hint  = _U('m_recoltalcool'),
      GPS = {x = 963.697, y = -1856.44, z = 31.1969},--traitement
    },

    Traitement = {
      Pos   = {x = 963.697, y = -1856.44, z = 31.1969},--traitement
      Size  = {x = 6.0, y = 6.0, z = 1.0},
      Color = {r = 0, g = 0, b = 0},
      Marker= 1,
      Blip  = true,
      Name  = _U('m_magnum_smelting'),
      Type  = "work",
      Item  = {
        {
          name   = _U('m_magnum'),
          db_name= "magnum",
          time   = 4000,
          max    = 40,
          add    = 1,
          remove = 1,
          requires = "alcool",
          requires_name = _U('unicorn'),
          drop   = 100
        },
      },
      Hint  = _U('m_magnum_button'),
      GPS = {x = -1314.3775, y = -688.5130, z = 24.8613}--vente
    },

    VehicleSpawner = {
      Pos   = {x = 87.0338, y = -1288.0550, z = 28.3832},
      Size  = {x = 1.8, y = 1.8, z = 1.0},
      Color = {r = 0, g = 155, b = 255},
      Marker= 1,
      Blip  = false,
      Name  = _U('spawn_veh'),
      Type  = "vehspawner",
      Spawner = 1,
      Hint  = _U('spawn_veh_button'),
      Caution = 2000,
      GPS = {x = 1541.98, y = 2184.08, z = 78.812}--recolt
    },

    VehicleSpawnPoint = {
      Pos   = {x = 81.9216, y = -1283.5721, z = 29.2819},
      Size  = {x = 5.0, y = 5.0, z = 1.0},
      Marker= -1,
      Blip  = false,
      Name  = _U('service_vh'),
      Type  = "vehspawnpt",
      Spawner = 1,
      Heading = 49.00,
      GPS = 0
    },

    VehicleDeletePoint = {
      Pos   = {x = 146.1920, y = -1332.2756, z = 28.1259},
      Size  = {x = 5.0, y = 5.0, z = 1.0},
      Color = {r = 166, g = 0, b = 0},
      Marker= 1,
      Blip  = false,
      Name  = _U('return_vh'),
      Type  = "vehdelete",
      Hint  = _U('return_vh_button'),
      Spawner = 1,
      Caution = 2000,
      GPS = 0,
      Teleport = 0
    },

    Magnum = {
      Pos   = {x = -1314.3775, y = -688.5130, z = 24.8613},--vente
      Color = {r = 0, g = 155, b = 255},
      Size  = {x = 3.0, y = 3.0, z = 1.0},
      Marker= 1,
      Blip  = true,
      Name  = _U('m_sell_magnum'),
      Type  = "delivery",
      Spawner = 1,
      Item  = {
        {
          name   = _U('delivery'),
          time   = 500,
          remove = 1,
          max    = 100,
          price  = 30,
          requires = "magnum",
          requires_name = _U('m_magnum'),
          drop   = 100
        }
      },
      Hint  = _U('m_deliver_magnum'),
      GPS = {x = 1541.98, y = 2184.08, z = 78.812},--recolt
    },

  },
}