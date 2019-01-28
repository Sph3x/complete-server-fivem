
Config.Jobs.cuisinier = {
  BlipInfos = {
    Sprite = 501,
    Color = 0
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
      Pos   = {x = -379.1633, y = 276.7713, z = 83.7735}, --vestiere
      Size  = {x = 3.0, y = 3.0, z = 1.0},
      Color = {r = 204, g = 204, b = 0},
      Marker= 0,
      Blip  = true,
      Name  = _U('m_cuisinier_locker'),
      Type  = "cloakroom",
      Hint  = _U('cloak_change'),
      GPS = {x = -384.6596, y = 285.8997, z = 83.8508} --vehicule
    },

    Ingredient = {
      Pos   = {x = 2647.95, y = 4735.97, z = 35.1296}, --recolt
      Size  = {x = 10.0, y = 10.0, z = 1.0},
      Color = {r = 0, g = 0, b = 0},
      Marker= 1,
      Blip  = true,
      Name  = _U('m_ingredient'),
      Type  = "work",
      Item  = {
        {
          name   = _U('m_ingredient'),
          db_name= "ingredient",
          time   = 3000,
          max    = 50,
          add    = 1,
          remove = 1,
          requires = "nothing",
          requires_name = "Nothing",
          drop   = 100
        }
      },
      Hint  = _U('m_recoltingredient'),
      GPS = {x = 463.741, y = -705.542, z = 27.5263}, --traitement
    },

    Traitement = {
      Pos   = {x = 463.741, y = -705.542, z = 27.5263}, --traitement
      Size  = {x = 10.0, y = 10.0, z = 1.0},
      Color = {r = 0, g = 0, b = 0},
      Marker= 1,
      Blip  = true,
      Name  = _U('m_plat_smelting'),
      Type  = "work",
      Item  = {
        {
          name   = _U('m_plat'),
          db_name= "plat",
          time   = 4000,
          max    = 100,
          add    = 1,
          remove = 1,
          requires = "ingredient",
          requires_name = _U('cuisinier'),
          drop   = 100
        },
      },
      Hint  = _U('m_plat_button'),
      GPS = {x = -3051.6098, y = 634.3840, z = 6.3509} --vente 
    },

    VehicleSpawner = {
      Pos   = {x = -384.6596, y = 285.8997, z = 83.8508},
      Size  = {x = 5.0, y = 5.0, z = 1.0},
      Color = {r = 0, g = 155, b = 255},
      Marker= 0,
      Blip  = false,
      Name  = _U('spawn_veh'),
      Type  = "vehspawner",
      Spawner = 1,
      Hint  = _U('spawn_veh_button'),
      Caution = 0,
      GPS = {x = 2647.95, y = 4735.97, z = 35.1296} --recolt
    },

    VehicleSpawnPoint = {
      Pos   = {x = -383.737, y = 288.44, z = 84.7867},
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
      Pos   = {x = -386.7240, y = 291.8942, z = 83.8752},
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

    Plat = {
      Pos   = {x = -3051.6098, y = 634.3840, z = 6.3509}, --vente
      Color = {r = 0, g = 155, b = 255},
      Size  = {x = 5.0, y = 5.0, z = 1.0},
      Marker= 0,
      Blip  = true,
      Name  = _U('m_sell_plat'),
      Type  = "delivery",
      Spawner = 1,
      Item  = {
        {
          name   = _U('delivery'),
          time   = 500,
          remove = 1,
          max    = 100,
          price  = 40,
          requires = "plat",
          requires_name = _U('m_plat'),
          drop   = 100
        }
      },
      Hint  = _U('m_deliver_plat'),
      GPS = {x = 2647.95, y = 4735.97, z = 35.1296}, --recolt
    },

  },
}
