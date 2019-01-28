
Config.Jobs.diver = {
  BlipInfos = {
    Sprite = 416,
    Color = 0
  },
  Vehicles = {
    Truck = {
      Spawner = 1,
      Hash = "dinghy",
      Trailer = "none",
      HasCaution = true
    }
  },
  Zones = {
    CloakRoom = {
      Pos   = {x = 726.7556, y = 4168.9990, z = 39.5833}, --vestiere
      Size  = {x = 3.0, y = 3.0, z = 1.0},
      Color = {r = 204, g = 204, b = 0},
      Marker= 1,
      Blip  = true,
      Name  = _U('m_diver_locker'),
      Type  = "cloakroom",
      Hint  = _U('cloak_change'),
      GPS = {x = 713.4363, y = 4093.4602, z = 33.6527} --vehicule
    },

    Objet = {
      Pos   = {x = 1941.07, y = 5013.98, z = 42.6027}, --recolt
      Size  = {x = 25.0, y = 25.0, z = 1.0},
      Color = {r = 0, g = 0, b = 0},
      Marker= 1,
      Blip  = true,
      Name  = _U('m_objet'),
      Type  = "work",
      Item  = {
        {
          name   = _U('m_objet'),
          db_name= "objet",
          time   = 3000,
          max    = 50,
          add    = 1,
          remove = 1,
          requires = "nothing",
          requires_name = "Nothing",
          drop   = 100
        }
      },
      Hint  = _U('m_recoltobjet'),
      GPS = {x = 579.677, y = 2679.1, z = 41.817}, --traitement
    },

    Traitement = {
      Pos   = {x = 579.677, y = 2679.1, z = 41.817}, --traitement
      Size  = {x = 25.0, y = 25.0, z = 1.0},
      Color = {r = 0, g = 0, b = 0},
      Marker= 1,
      Blip  = true,
      Name  = _U('m_objets_smelting'),
      Type  = "work",
      Item  = {
        {
          name   = _U('m_objets'),
          db_name= "objets",
          time   = 4000,
          max    = 100,
          add    = 1,
          remove = 1,
          requires = "objet",
          requires_name = _U('diver'),
          drop   = 100
        },
      },
      Hint  = _U('m_objets_button'),
      GPS = {x = 376.264, y = 333.14, z = 103.566} --vente 
    },

    VehicleSpawner = {
      Pos   = {x = 713.4363, y = 4093.4602, z = 33.6527},
      Size  = {x = 5.0, y = 5.0, z = 1.0},
      Color = {r = 0, g = 155, b = 255},
      Marker= 1,
      Blip  = false,
      Name  = _U('spawn_veh'),
      Type  = "vehspawner",
      Spawner = 1,
      Hint  = _U('spawn_veh_button'),
      Caution = 250,
      GPS = {x = 1941.07, y = 5013.98, z = 42.6027} --recolt
    },

    VehicleSpawnPoint = {
      Pos   = {x = 708.4552, y = 4084.6577, z = 31.0449},
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
      Pos   = {x = 708.4553, y = 4094.4738, z = 30.0776},
      Size  = {x = 5.0, y = 5.0, z = 1.0},
      Color = {r = 166, g = 0, b = 0},
      Marker= 1,
      Blip  = false,
      Name  = _U('return_vh'),
      Type  = "vehdelete",
      Hint  = _U('return_vh_button'),
      Spawner = 1,
      Caution = 250,
      GPS = 0,
      Teleport = 0 --{ x = 712.7231, y = 4098.5722, z = 35.6778 },
    },

    Objets = {
      Pos   = {x = 376.264, y = 333.14, z = 103.566}, --vente
      Color = {r = 0, g = 155, b = 255},
      Size  = {x = 5.0, y = 5.0, z = 3.0},
      Marker= 1,
      Blip  = true,
      Name  = _U('m_sell_objets'),
      Type  = "delivery",
      Spawner = 1,
      Item  = {
        {
          name   = _U('delivery'),
          time   = 500,
          remove = 1,
          max    = 100,
          price  = 40,
          requires = "objets",
          requires_name = _U('m_objets'),
          drop   = 100
        }
      },
      Hint  = _U('m_deliver_objets'),
      GPS = {x = 1941.07, y = 5013.98, z = 42.6027}, --recolt
    },

  },
}
