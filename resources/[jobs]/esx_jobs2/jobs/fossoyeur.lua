
Config.Jobs.fossoyeur = {
  BlipInfos = {
    Sprite = 310,
    Color = 2
  },
  Vehicles = {
    Truck = {
      Spawner = 1,
      Hash = "romero",
      Trailer = "none",
      HasCaution = true
    }
  },
  --VESTIAIRES
  Zones = {
    CloakRoom = {
      Pos   = {x = -1684.7727, y = -291.4975, z = 50.8138}, --vestiere
      Size  = {x = 3.0, y = 3.0, z = 1.0},
      Color = {r = 204, g = 204, b = 0},
      Marker= 0,
      Blip  = true,
      Name  = _U('m_fossoyeur_locker'),
      Type  = "cloakroom",
      Hint  = _U('cloak_change'),
      GPS = {x = -1679.9342, y = -297.4066, z = 50.8207} --vehicule
    },
    --GARRAGE
    VehicleSpawner = {
      Pos   = {x = -1679.9342, y = -297.4066, z = 50.8207},
      Size  = {x = 5.0, y = 5.0, z = 1.0},
      Color = {r = 0, g = 155, b = 255},
      Marker= 0,
      Blip  = false,
      Name  = _U('spawn_veh'),
      Type  = "vehspawner",
      Spawner = 1,
      Hint  = _U('spawn_veh_button'),
      Caution = 0,
      --GPS = {x = 376.2714, y = -1443.6513, z = 28.4315} --recolt
    },

    VehicleSpawnPoint = {
      Pos   = {x = -1684.1335, y = -303.0729, z = 51.8076},
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
      Pos   = {x = -1679.3248, y = -307.7833, z = 50.8119},
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

    --RECOLTE
    Corp = {
      Pos   = {x = 376.2714, y = -1443.6513, z = 28.4315}, 
      Size  = {x = 10.0, y = 10.0, z = 1.0},
      Color = {r = 0, g = 0, b = 0},
      Marker= 1,
      Blip  = true,
      Name  = _U('m_corp'),
      Type  = "work",
      Item  = {
        {
          name   = _U('m_corp'),
          db_name= "corp",
          time   = 5000,
          max    = 40,
          add    = 1,
          remove = 1,
          requires = "nothing",
          requires_name = "Nothing",
          drop   = 100
        }
      },
      Hint  = _U('m_recoltcorp'),
     GPS = {x = 376.2714, y = -1443.6513, z = 28.4315}, 
    },

    --TRAITEMENT
    Traitement = {
      Pos   = {x = 1815.7720, y = 3679.1965, z = 33.2764}, 
      Size  = {x = 10.0, y = 10.0, z = 1.0},
      Color = {r = 0, g = 0, b = 0},
      Marker= 1,
      Blip  = true,
      Name  = _U('m_corps_smelting'),
      Type  = "work",
      Item  = {
        {
          name   = _U('m_corps'),
          db_name= "corps",
          time   = 4000,
          max    = 40,
          add    = 1,
          remove = 1,
          requires = "corp",
          requires_name = _U('fossoyeur'),
          drop   = 100
        },
      },
      Hint  = _U('m_corps_button'),
      GPS = {x = 1815.7720, y = 3679.1965, z = 33.2764}, 
    },

    -- REVENTE
    Corps = {
      Pos   = {x = -1699.5162, y = -279.2632, z = 50.8677}, --vente
      Color = {r = 0, g = 155, b = 255},
      Size  = {x = 5.0, y = 5.0, z = 1.0},
      Marker= 1,
      Blip  = true,
      Name  = _U('m_sell_corps'),
      Type  = "delivery",
      Spawner = 1,
      Item  = {
        {
          name   = _U('delivery'),
          time   = 500,
          remove = 1,
          max    = 40,
          price  = 25,
          requires = "corps",
          requires_name = _U('m_corps'),
          drop   = 40
        }
      },
      Hint  = _U('m_deliver_corps'),
      GPS = {x = -1699.5162, y = -279.2632, z = 50.8677}  
    },

  },
}
