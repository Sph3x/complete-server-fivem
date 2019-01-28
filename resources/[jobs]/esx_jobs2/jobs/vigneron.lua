
Config.Jobs.vigne = {
  BlipInfos = {
    Sprite = 93,
    Color = 17
  },
  Vehicles = {
    Truck = {
      Spawner = 1,
      Hash = "sadler",
      Trailer = "none",
      HasCaution = true
    }
  },
  Zones = {
    CloakRoom = {
      Pos   = {x = -1936.5881, y = 2051.1713, z = 140.0234},--vestiere
      Size  = {x = 1.5, y = 1.5, z = 1.0},
      Color = {r = 204, g = 204, b = 0},
      Marker= 0,
      Blip  = false,
      Name  = _U('m_vigne_locker'),
      Type  = "cloakroom",
      Hint  = _U('cloak_change'),
      GPS = {x = -1903.2751, y = 2048.2907, z = 139.6860}--vehicule
    },

    Orange = {
      Pos   = {x = -1833.5142, y = 2013.9284, z = 130.2425},--recolt
      Size  = {x = 5.0, y = 5.0, z = 1.0},
      Color = {r = 136, g = 243, b = 216},
      Marker= 1,
      Blip  = true,
      Name  = _U('m_orange_smelting'),
      Type  = "work",
      Item  = {
        {
          name   = _U('m_orange'),
          db_name= "orange",
          time   = 2000,
          max    = 40,
          add    = 1,
          remove = 1,
          requires = "nothing",
          requires_name = "Nothing",
          drop   = 40
        }
      },
      Hint  = _U('m_recoltorange'),
      GPS = {x = 2537.1728, y = 2579.0847, z = 36.9526},--traitement
    },

    Traitement = {
      Pos   = {x = 2537.1728, y = 2579.0847, z = 36.9526},--traitement
      Size  = {x = 5.0, y = 5.0, z = 1.0},
      Color = {r = 136, g = 243, b = 216},
      Marker= 1,
      Blip  = true,
      Name  = _U('m_jorange_smelting'),
      Type  = "work",
      Item  = {
        {
          name   = _U('m_jorange'),
          db_name= "jorange",
          time   = 3000,
          max    = 40,
          add    = 1,
          remove = 1,
          requires = "orange",
          requires_name = _U('vigne'),
          drop   = 40
        },
      },
      Hint  = _U('m_jorange_button'),
      GPS = {x = -1433.3229, y = 208.5721, z = 56.7720}--vente
    },

    --VehicleSpawner = {
      --Pos   = {x = -1903.2751, y = 2048.2907, z = 139.6860},
      --Size  = {x = 3.0, y = 3.0, z = 1.0},
      --Color = {r = 0, g = 155, b = 255},
      --Marker= 0,
      --Blip  = false,
      --Name  = _U('spawn_veh'),
      --Type  = "vehspawner",
      --Spawner = 1,
      --Hint  = _U('spawn_veh_button'),
      --Caution = 0,
      --GPS = {x = -1833.5142, y = 2013.9284, z = 130.2425}--recolt
    --},

    --VehicleSpawnPoint = {
      --Pos   = {x = -1909.57, y = 2047.65, z = 140.738},
      --Size  = {x = 5.0, y = 5.0, z = 1.0},
      --Marker= -1,
      --Blip  = false,
      --Name  = _U('service_vh'),
      --Type  = "vehspawnpt",
      --Spawner = 1,
      --Heading = 49.00,
      --GPS = 0
    --},

    --VehicleDeletePoint = {
      --Pos   = {x = -1924.7856, y = 2066.2153, z = 139.5272},
      --Size  = {x = 5.0, y = 5.0, z = 1.0},
      --Color = {r = 166, g = 0, b = 0},
      --Marker= 0,
      --Blip  = false,
      --Name  = _U('return_vh'),
      --Type  = "vehdelete",
      --Hint  = _U('return_vh_button'),
      --Spawner = 1,
      --Caution = 0,
      --GPS = 0,
      --Teleport = 0
    --},

    Jusdorange = {
      Pos   = {x = -1433.3229, y = 208.5721, z = 56.7720},--vente
      Color = {r = 136, g = 243, b = 216},
      Size  = {x = 3.0, y = 3.0, z = 1.0},
      Marker= 0,
      Blip  = true,
      Name  = _U('m_sell_jorange'),
      Type  = "delivery",
      Spawner = 1,
      Item  = {
        {
          name   = _U('delivery'),
          time   = 500,
          remove = 1,
          max    = 400,
          price  = 40,
          requires = "jorange",
          requires_name = _U('m_jorange'),
          drop   = 100
        }
      },
      Hint  = _U('m_deliver_jorange'),
      GPS = {x = -1833.5142, y = 2013.9284, z = 130.2425},--recolt
    },

  },
}
