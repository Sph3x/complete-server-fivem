
Config.Jobs.reporter = {
  BlipInfos = {
    Sprite = 472,
    Color = 48
  },
  Vehicles = {
    Truck = {
      Spawner = 1,
      Hash = "burrito2",
      Trailer = "none",
      HasCaution = false
    }
  },
  Zones = {
    CloakRoom = {
      Pos   = {x = -1055.6092, y = -234.3167, z = 42.9695}, --vestiere
      Size  = {x = 1.5, y = 1.5, z = 1.0},
      Color = {r = 204, g = 204, b = 0},
      Marker= 0,
      Blip  = false,
      Name  = _U('m_reporter_locker'),
      Type  = "cloakroom",
      Hint  = _U('cloak_change'),
      GPS = {x = -1095.1394, y = -254.5236, z = 36.6832} --vehicule
    },

    Papier = {
      Pos   = {x = -413.1283, y = -2798.9355, z = 5.7483}, --recolt
      Size  = {x = 5.0, y = 5.0, z = 1.0},
      Color = {r = 0, g = 0, b = 0},
      Marker= 1,
      Blip  = true,
      Name  = _U('m_papier'),
      Type  = "work",
      Item  = {
        {
          name   = _U('m_papier'),
          db_name= "papier",
          time   = 3000,
          max    = 40,
          add    = 1,
          remove = 1,
          requires = "nothing",
          requires_name = "Nothing",
          drop   = 100
        }
      },
      Hint  = _U('m_recoltpapier'),
      GPS = {x = -557.3737, y = -1799.8942, z = 21.6171}, --traitement
    },

    Traitement = {
      Pos   = {x = -557.3737, y = -1799.8942, z = 21.6171}, --traitement
      Size  = {x = 5.0, y = 5.0, z = 1.0},
      Color = {r = 0, g = 0, b = 0},
      Marker= 1,
      Blip  = true,
      Name  = _U('m_journaux_smelting'),
      Type  = "work",
      Item  = {
        {
          name   = _U('m_journaux'),
          db_name= "journaux",
          time   = 4000,
          max    = 40,
          add    = 1,
          remove = 1,
          requires = "papier",
          requires_name = _U('reporter'),
          drop   = 100
        },
      },
      Hint  = _U('m_journaux_button'),
      GPS = {x = -591.2218, y = -912.6143, z = 22.8602} --vente 
    },  
  
    VehicleSpawner = {
      Pos   = { x = -1095.1394, y = -254.5236, z = 36.6832 },
      Size  = {x = 3.0, y = 3.0, z = 1.0},
      Color = {r = 0, g = 155, b = 255},
      Marker= 0,
      Blip  = false,
      Name  = _U('reporter_name'),
      Type  = "vehspawner",
      Spawner = 1,
      Hint  = _U('reporter_garage'),
      Caution = 0
    },

    VehicleSpawnPoint = {
      Pos   = { x = -1100.43, y = -259.878, z = 37.6847 },
      Size  = {x = 3.0, y = 3.0, z = 1.0},
      Marker= -1,
      Blip  = false,
      Name  = _U('service_vh'),
      Type  = "vehspawnpt",
      Spawner = 1,
      Heading = 200.1
    },

    VehicleDeletePoint = {
      Pos   = { x = -1100.1606,  y = -262.9941, z = 36.6605 },
      Size  = {x = 3.0, y = 3.0, z = 1.0},
      Color = {r = 166, g = 0, b = 0},
      Marker= 0,
      Blip  = false,
      Name  = _U('return_vh'),
      Type  = "vehdelete",
      Hint  = _U('return_vh_button'),
      Spawner = 1,
      Caution = 2000,
      GPS = 0,
      Teleport = 0
    },
	
   Journaux = {
      Pos   = {x = -591.2218, y = -912.6143, z = 22.8602}, --vente
      Color = {r = 0, g = 155, b = 255},
      Size  = {x = 5.0, y = 5.0, z = 1.0},
      Marker= 1,
      Blip  = true,
      Name  = _U('m_sell_journaux'),
      Type  = "delivery",
      Spawner = 1,
      Item  = {
        {
          name   = _U('delivery'),
          time   = 500,
          remove = 1,
          max    = 100,
          price  = 25,
          requires = "journaux",
          requires_name = _U('m_journaux'),
          drop   = 100
        }
      },
      Hint  = _U('m_deliver_journaux'),
      GPS = {x = -413.1283, y = -2798.9355, z = 5.7483}, --recolt
    },

  },
}
