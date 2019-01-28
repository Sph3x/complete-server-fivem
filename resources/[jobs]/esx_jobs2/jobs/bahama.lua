
Config.Jobs.bahama = {
  BlipInfos = {
    Sprite = 93,
    Color = 1
  },
  Vehicles = {
    Truck = {
      Spawner = 1,
      Hash = "mule",
      Trailer = "none",
      HasCaution = false
    }
  },
  Zones = {
    CloakRoom = {
      Pos   = {x = -1413.6635, y = -635.0275, z = 27.6623}, --vestiere
      Size  = {x = 2.0, y = 2.0, z = 1.0},
      Color = {r = 204, g = 204, b = 0},
      Marker= 1,
      Blip  = false,
      Name  = _U('m_tequilala_locker'),
      Type  = "cloakroom",
      Hint  = _U('cloak_change'),
      --GPS = {x = 2019.62, y = 4975.54, z = 41.204} --vehicule
    },

    Agave = {
      Pos   = {x = 2552.7563, y = 4675.0058, z = 33.6747}, --recolt
      Size  = {x = 10.0, y = 10.0, z = 1.0},
      Color = {r = 0, g = 0, b = 0},
      Marker= 1,
      Blip  = true,
      Name  = _U('m_agave'),
      Type  = "work",
      Item  = {
        {
          name   = _U('m_agave'),
          db_name= "agave",
          time   = 3000,
          max    = 50,
          add    = 1,
          remove = 1,
          requires = "nothing",
          requires_name = "Nothing",
          drop   = 100
        }
      },
      Hint  = _U('m_recoltagave'),
      GPS = {x = 168.4940, y = 2774.8349, z = 44.7326}, --traitement
    },

    Traitement = {
      Pos   = {x = 168.4940, y = 2774.8349, z = 44.7326}, --traitement
      Size  = {x = 10.0, y = 10.0, z = 1.0},
      Color = {r = 0, g = 0, b = 0},
      Marker= 1,
      Blip  = true,
      Name  = _U('m_tequila_smelting'),
      Type  = "work",
      Item  = {
        {
          name   = _U('m_tequila'),
          db_name= "tequila",
          time   = 4000,
          max    = 100,
          add    = 1,
          remove = 1,
          requires = "agave",
          requires_name = _U('tequilala'),
          drop   = 100
        },
      },
      Hint  = _U('m_tequila_button'),
      GPS = {x = 1005.8873, y = -3100.0588, z = -40.0510} --vente 
    },

    --VehicleSpawner = {
      --Pos   = {x = 2019.62, y = 4975.54, z = 41.204},
      --Size  = {x = 5.0, y = 5.0, z = 1.0},
      --Color = {r = 0, g = 155, b = 255},
      --Marker= 1,
      --Blip  = false,
      --Name  = _U('spawn_veh'),
      --Type  = "vehspawner",
      --Spawner = 1,
      --Hint  = _U('spawn_veh_button'),
      --Caution = 2000,
      --GPS = {x = 2552.7563, y = 4675.0058, z = 33.6747} --recolt
    --},

    --VehicleSpawnPoint = {
      --Pos   = {x = 2027.09, y = 4967.31, z = 41.2583},
      --Size  = {x = 5.0, y = 5.0, z = 1.0},
      --Marker= -1,
      --Blip  = false,
      --Name  = _U('service_vh'),
      --Type  = "vehspawnpt",
      --Spawner = 1,
      --Heading = 49.00,
     -- GPS = 0
    --},

    --VehicleDeletePoint = {
      --Pos   = {x = 2011.28, y = 4969.68, z = 41.5693},
      --Size  = {x = 5.0, y = 5.0, z = 1.0},
      --Color = {r = 166, g = 0, b = 0},
      --Marker= 1,
      --Blip  = false,
      --Name  = _U('return_vh'),
      --Type  = "vehdelete",
      --Hint  = _U('return_vh_button'),
      --Spawner = 1,
      --Caution = 2000,
      --GPS = 0,
      --Teleport = 0
    --},

    Tequila = {
      Pos   = {x = 1005.8873, y = -3100.0588, z = -40.0510}, --vente
      Color = {r = 204, g = 204, b = 0},
      Size  = {x = 5.0, y = 5.0, z = 1.0},
      Marker= 1,
      Blip  = false,
      Name  = _U('m_sell_tequila'),
      Type  = "delivery",
      Spawner = 1,
      Item  = {
        {
          name   = _U('delivery'),
          time   = 500,
          remove = 1,
          max    = 100,
          price  = 50,
          requires = "tequila",
          requires_name = _U('m_tequila'),
          drop   = 100
        }
      },
      Hint  = _U('m_deliver_tequila'),
      GPS = {x = 2552.7563, y = 4675.0058, z = 33.6747}, --recolt
    },

  },
}
