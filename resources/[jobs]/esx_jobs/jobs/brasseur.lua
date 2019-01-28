
Config.Jobs.brasseur = {
  BlipInfos = {
    Sprite = 464,
    Color = 9
  },
  Vehicles = {
    Truck = {
      Spawner = 1,
      Hash = "pounder",
      Trailer = "none",
      HasCaution = true
    }
  },
  Zones = {
    CloakRoom = {
      Pos   = {x = 812.3793, y = -1602.3922, z = 30.6036},--vestiere
      Size  = {x = 3.0, y = 3.0, z = 1.0},
      Color = {r = 204, g = 204, b = 0},
      Marker= 0,
      Blip  = true,
      Name  = _U('m_brasseur_locker'),
      Type  = "cloakroom",
      Hint  = _U('cloak_change'),
      GPS = {x = 802.2557, y = -1605.4996, z = 30.3082}--vehicule
    },

    Malt = {
      Pos   = {x = 2286.82, y = 4763.14, z = 38.6066},--recolt
      Size  = {x = 10.0, y = 10.0, z = 1.0},
      Color = {r = 0, g = 0, b = 0},
      Marker= 1,
      Blip  = true,
      Name  = _U('m_malt'),
      Type  = "work",
      Item  = {
        {
          name   = _U('m_malt'),
          db_name= "malt",
          time   = 3000,
          max    = 50,
          add    = 1,
          remove = 1,
          requires = "nothing",
          requires_name = "Nothing",
          drop   = 100
        }
      },
      Hint  = _U('m_recoltmalt'),
      GPS = {x = 816.141, y = 2176.47, z = 52.3161},--traitement
    },

    Traitement = {
      Pos   = {x = 816.141, y = 2176.47, z = 52.3161},--traitement
      Size  = {x = 10.0, y = 10.0, z = 1.0},
      Color = {r = 0, g = 0, b = 0},
      Marker= 1,
      Blip  = true,
      Name  = _U('m_biere_smelting'),
      Type  = "work",
      Item  = {
        {
          name   = _U('m_biere'),
          db_name= "biere",
          time   = 4000,
          max    = 100,
          add    = 1,
          remove = 1,
          requires = "malt",
          requires_name = _U('brasseur'),
          drop   = 100
        },
      },
      Hint  = _U('m_biere_button'),
      GPS = {x = -1400.0093, y = -640.8576, z = 27.6894}--vente
    },

    VehicleSpawner = {
      Pos   = {x = 802.2557, y = -1605.4996, z = 30.3082},
      Size  = {x = 5.0, y = 5.0, z = 1.0},
      Color = {r = 0, g = 155, b = 255},
      Marker= 0,
      Blip  = false,
      Name  = _U('spawn_veh'),
      Type  = "vehspawner",
      Spawner = 1,
      Hint  = _U('spawn_veh_button'),
      Caution = 0,
      GPS = {x = 2286.82, y = 4763.14, z = 38.6066}--recolt
    },

    VehicleSpawnPoint = {
      Pos   = {x = 795.763, y = -1614.58, z = 31.2193},
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
      Pos   = {x = 786.5674, y = -1615.8221, z = 30.1216},
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

    Biere = {
      Pos   = {x = -1400.0093, y = -640.8576, z = 27.6894},--vente
      Color = {r = 0, g = 155, b = 255},
      Size  = {x = 5.0, y = 5.0, z = 1.0},
      Marker= 0,
      Blip  = true,
      Name  = _U('m_sell_biere'),
      Type  = "delivery",
      Spawner = 1,
      Item  = {
        {
          name   = _U('delivery'),
          time   = 500,
          remove = 1,
          max    = 100,
          price  = 40,
          requires = "biere",
          requires_name = _U('m_biere'),
          drop   = 100
        }
      },
      Hint  = _U('m_deliver_biere'),
      GPS = {x = 2286.82, y = 4763.14, z = 38.6066},--recolt
    },

  },
}
