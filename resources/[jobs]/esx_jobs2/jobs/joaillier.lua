
Config.Jobs.joaillier = {
  BlipInfos = {
    Sprite = 318,
    Color = 5
  },
  Vehicles = {
    Truck = {
      Spawner = 1,
      Hash = "tiptruck2",
      Trailer = "none",
      HasCaution = true
    }
  },
  Zones = {
    CloakRoom = {
      Pos   = {x = 966.6137, y = -1932.4678, z = 30.0574}, --vestiere
      Size  = {x = 3.0, y = 3.0, z = 1.0},
      Color = {r = 204, g = 204, b = 0},
      Marker= 0,
      Blip  = true,
      Name  = _U('m_joaillier_locker'),
      Type  = "cloakroom",
      Hint  = _U('cloak_change'),
      GPS = {x = 982.8979, y = -1921.5446, z = 30.0715} --vehicule
    },

    Cristaux = {
      Pos   = {x = 2683.6142, y = 2875.1313, z = 35.6101}, --recolt
      Size  = {x = 15.0, y = 15.0, z = 1.0},
      Color = {r = 0, g = 0, b = 0},
      Marker= 1,
      Blip  = true,
      Name  = _U('m_cristaux'),
      Type  = "work",
      Item  = {
        {
          name   = _U('m_cristaux'),
          db_name= "cristaux",
          time   = 3000,
          max    = 50,
          add    = 1,
          remove = 1,
          requires = "nothing",
          requires_name = "Nothing",
          drop   = 100
        }
      },
      Hint  = _U('m_recoltcristaux'),
      GPS = {x = 355.1619, y = 2910.0305, z = 41.3853}, --traitement
    },

    Traitement = {
      Pos   = {x = 355.1619, y = 2910.0305, z = 41.3853}, --traitement
      Size  = {x = 15.0, y = 15.0, z = 1.0},
      Color = {r = 0, g = 0, b = 0},
      Marker= 1,
      Blip  = true,
      Name  = _U('m_diamant_smelting'),
      Type  = "work",
      Item  = {
        {
          name   = _U('m_diamant'),
          db_name= "diamant",
          time   = 4000,
          max    = 100,
          add    = 1,
          remove = 1,
          requires = "cristaux",
          requires_name = _U('joaillier'),
          drop   = 100
        },
      },
      Hint  = _U('m_diamant_button'),
      GPS = {x = -622.0641, y = -230.7658, z = 37.0060} --vente 
    },

    VehicleSpawner = {
      Pos   = {x = 982.8979, y = -1921.5446, z = 30.0715},
      Size  = {x = 3.0, y = 3.0, z = 1.0},
      Color = {r = 0, g = 155, b = 255},
      Marker= 0,
      Blip  = false,
      Name  = _U('spawn_veh'),
      Type  = "vehspawner",
      Spawner = 1,
      Hint  = _U('spawn_veh_button'),
      Caution = 0,
      GPS = {x = 2683.6142, y = 2875.1313, z = 35.6101} --recolt
    },

    VehicleSpawnPoint = {
      Pos   = {x = 978.7905, y = -1920.9525, z = 31.1348},
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
      Pos   = {x = 994.6999, y = -1919.3847, z = 30.0714},
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

    Diamant = {
      Pos   = {x = -622.0641, y = -230.7658, z = 37.0060}, --vente
      Color = {r = 0, g = 155, b = 255},
      Size  = {x = 5.0, y = 5.0, z = 1.0},
      Marker= 1,
      Blip  = true,
      Name  = _U('m_sell_diamant'),
      Type  = "delivery",
      Spawner = 1,
      Item  = {
        {
          name   = _U('delivery'),
          time   = 500,
          remove = 1,
          max    = 100,
          price  = 40,
          requires = "diamant",
          requires_name = _U('m_diamant'),
          drop   = 100
        }
      },
      Hint  = _U('m_deliver_diamant'),
      GPS = {x = 2683.6142, y = 2875.1313, z = 35.6101}, --recolt
    },

  },
}
