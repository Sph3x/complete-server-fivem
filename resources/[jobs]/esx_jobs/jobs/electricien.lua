
Config.Jobs.electricien = {
  BlipInfos = {
    Sprite = 354,
    Color = 5
  },
  Vehicles = {
    Truck = {
      Spawner = 1,
      Hash = "utillitruck",
      Trailer = "none",
      HasCaution = true
    }
  },
  Zones = {
    CloakRoom = {
      Pos   = {x = 957.0159, y = -2176.6340, z = 30.2995}, --vestiere
      Size  = {x = 3.0, y = 3.0, z = 1.0},
      Color = {r = 204, g = 204, b = 0},
      Marker= 0,
      Blip  = true,
      Name  = _U('m_electricien_locker'),
      Type  = "cloakroom",
      Hint  = _U('cloak_change'),
      GPS = {x = 945.4901, y = -2178.0578, z = 29.4753} --vehicule
    },

    Fil = {
      Pos   = {x = 2627.41, y = 2810.78, z = 33.3334}, --recolt
      Size  = {x = 10.0, y = 10.0, z = 1.0},
      Color = {r = 0, g = 0, b = 0},
      Marker= 1,
      Blip  = true,
      Name  = _U('m_fil'),
      Type  = "work",
      Item  = {
        {
          name   = _U('m_fil'),
          db_name= "fil",
          time   = 3000,
          max    = 50,
          add    = 1,
          remove = 1,
          requires = "nothing",
          requires_name = "Nothing",
          drop   = 100
        }
      },
      Hint  = _U('m_recoltfil'),
      GPS = {x = 2705.0815, y = 1575.0241, z = 23.4433}, --traitement
    },

    Traitement = {
      Pos   = {x = 2705.0815, y = 1575.0241, z = 23.4433}, --traitement
      Size  = {x = 10.0, y = 10.0, z = 1.0},
      Color = {r = 0, g = 0, b = 0},
      Marker= 1,
      Blip  = true,
      Name  = _U('m_cable_smelting'),
      Type  = "work",
      Item  = {
        {
          name   = _U('m_cable'),
          db_name= "cable",
          time   = 4000,
          max    = 100,
          add    = 1,
          remove = 1,
          requires = "fil",
          requires_name = _U('electricien'),
          drop   = 100
        },
      },
      Hint  = _U('m_cable_button'),
      GPS = {x = -2305.0729, y = 3427.5104, z = 30.0344} --vente 
    },

    VehicleSpawner = {
      Pos   = {x = 945.4901, y = -2178.0578, z = 29.4753},
      Size  = {x = 5.0, y = 5.0, z = 1.0},
      Color = {r = 0, g = 155, b = 255},
      Marker= 0,
      Blip  = false,
      Name  = _U('spawn_veh'),
      Type  = "vehspawner",
      Spawner = 1,
      Hint  = _U('spawn_veh_button'),
      Caution = 0,
      GPS = {x = 2627.41, y = 2810.78, z = 33.3334} --recolt
    },

    VehicleSpawnPoint = {
      Pos   = {x = 947.0775, y = -2184.5380, z = 30.5515},
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
      Pos   = {x = 955.5885, y = -2189.0256, z = 29.5003},
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

    Cable = {
      Pos   = {x = -2305.0729, y = 3427.5104, z = 30.0344}, --vente
      Color = {r = 0, g = 155, b = 255},
      Size  = {x = 5.0, y = 5.0, z = 1.0},
      Marker= 0,
      Blip  = true,
      Name  = _U('m_sell_cable'),
      Type  = "delivery",
      Spawner = 1,
      Item  = {
        {
          name   = _U('delivery'),
          time   = 500,
          remove = 1,
          max    = 100,
          price  = 40,
          requires = "cable",
          requires_name = _U('m_cable'),
          drop   = 100
        }
      },
      Hint  = _U('m_deliver_cable'),
      GPS = {x = 2627.41, y = 2810.78, z = 33.3334}, --recolt
    },

  },
}
