
Config.Jobs.tabac = {
  BlipInfos = {
    Sprite = 468,
    Color = 9
  },
  Vehicles = {
    Truck = {
      Spawner = 1,
      Hash = "youga2",
      Trailer = "none",
      HasCaution = true
    }
  },
  Zones = {
    CloakRoom = {
      Pos   = {x = 2028.7791, y = 4976.00, z = 40.0472}, --vestiere
      Size  = {x = 3.0, y = 3.0, z = 1.0},
      Color = {r = 204, g = 204, b = 0},
      Marker= 0,
      Blip  = true,
      Name  = _U('m_tabac_locker'),
      Type  = "cloakroom",
      Hint  = _U('cloak_change'),
      GPS = {x = 2018.9318, y = 4976.0922, z = 40.1846} --vehicule
    },

    Tabac = {
      Pos   = {x = 1941.07, y = 5013.98, z = 42.6027}, --recolt
      Size  = {x = 10.0, y = 10.0, z = 1.0},
      Color = {r = 0, g = 0, b = 0},
      Marker= 1,
      Blip  = true,
      Name  = _U('m_tabac'),
      Type  = "work",
      Item  = {
        {
          name   = _U('m_tabac'),
          db_name= "tabac",
          time   = 3000,
          max    = 50,
          add    = 1,
          remove = 1,
          requires = "nothing",
          requires_name = "Nothing",
          drop   = 100
        }
      },
      Hint  = _U('m_recolttabac'),
      GPS = {x = 579.677, y = 2679.1, z = 41.817}, --traitement
    },

    Traitement = {
      Pos   = {x = 579.677, y = 2679.1, z = 41.817}, --traitement
      Size  = {x = 10.0, y = 10.0, z = 1.0},
      Color = {r = 0, g = 0, b = 0},
      Marker= 1,
      Blip  = true,
      Name  = _U('m_tabac_smelting'),
      Type  = "work",
      Item  = {
        {
          name   = _U('m_cigarette'),
          db_name= "cigarette",
          time   = 4000,
          max    = 100,
          add    = 1,
          remove = 1,
          requires = "tabac",
          requires_name = _U('tabac'),
          drop   = 100
        },
      },
      Hint  = _U('m_tabac_button'),
      GPS = {x = -1232.3555, y = -901.8353, z = 11.0773} --vente 
    },

    VehicleSpawner = {
      Pos   = {x = 2018.9318, y = 4976.0922, z = 40.1846},
      Size  = {x = 5.0, y = 5.0, z = 1.0},
      Color = {r = 0, g = 155, b = 255},
      Marker= 0,
      Blip  = false,
      Name  = _U('spawn_veh'),
      Type  = "vehspawner",
      Spawner = 1,
      Hint  = _U('spawn_veh_button'),
      Caution = 0,
      GPS = {x = 1941.07, y = 5013.98, z = 42.6027} --recolt
    },

    VehicleSpawnPoint = {
      Pos   = {x = 2027.09, y = 4967.31, z = 41.2583},
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
      Pos   = {x = 2007.3038, y = 4985.4931, z = 40.3593},
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

    Cigarette = {
      Pos   = {x = -1232.3555, y = -901.8353, z = 11.0773}, --vente
      Color = {r = 0, g = 155, b = 255},
      Size  = {x = 5.0, y = 5.0, z = 1.0},
      Marker= 0,
      Blip  = true,
      Name  = _U('m_sell_cigarette'),
      Type  = "delivery",
      Spawner = 1,
      Item  = {
        {
          name   = _U('delivery'),
          time   = 500,
          remove = 1,
          max    = 100,
          price  = 15,
          requires = "cigarette",
          requires_name = _U('m_cigarette'),
          drop   = 100
        }
      },
      Hint  = _U('m_deliver_cigarette'),
      GPS = {x = 1941.07, y = 5013.98, z = 42.6027}, --recolt
    },

  },
}
