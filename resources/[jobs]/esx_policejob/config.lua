Config                        = {}
Config.DrawDistance           = 100.0
Config.MarkerType             = 1
Config.MarkerSize             = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerSizeDel          = { x = 5.0, y = 5.0, z = 0.5 }
Config.MarkerColor            = { r = 50, g = 50, b = 204 }
Config.MarkerColorDel         = { r = 204, g = 50, b = 50 }
Config.EnablePlayerManagement = true
Config.EnableArmoryManagement = true
Config.EnableLicenses         = true
Config.EnableESXIdentity      = true -- only turn this on if you are using esx_identity
Config.EnableSocietyOwnedVehicles = false
Config.MaxInService           = -1
Config.Locale       		      = 'fr'

Config.EnableFacadeSociety         = false
Config.IllegalCode = 2806

Config.IllegalMarkerColor = { r= 204, g =100, b= 100}
Config.IllegalCarMarkerSize = { x = 5.0, y = 5.0, z = 0.5 }

Config.Illegal = {
	Teleport = {
	  IllegalRoomEntry1 = {
		positionFrom = { x = 1082.5856933594, y= -787.45501708984, z= 57.5527,  nom = "Entrer"},
		positionTo = { x = 903.55458984, y=   -3182.390625, z=  -97.8527, nom = "Sortir"},
	  },
	  IllegalRoomEntry2 = {
		positionFrom = {x = 880.80426025391, y=   -3249.70000, z=  -99.0527, nom = "Sortir"},
		positionTo = {  x = -942.0097045, y= 16.456165, z= 47.5301, nom = "Entrer"},
	  },
	},
  
	CarTeleport = {
	  IllegalTunnelEntry = {
		positionFrom = { x = 1092.428833, y= -789.983276, z= 57.5627,  h = 180.0, nom = "Entrer par le tunnel"},
		positionTo = { x = 954.9675, y= -3244.8964, z= -95.0170, h = 90.0 ,nom = "Sortir par le tunnel"},
	  },
       IllegalBaseEntry = {
		positionFrom = { x = 898.70275878906, y= -3245.532226, z= -99.1121, h = 270.0,  nom = "Entrer dans la base"},
		positionTo = { x = 891.52874755859, y=   -3243.95800, z=  -99.2617, h = 90.0, nom = "Sortir par le tunnel"},
	  },
	},
  
  Locker = {
    BossLocker = {
      {  x = 452.965, y = -973.114, z = 29.689, name = "BossLocker", type = 'locker'},
    },
    SecurityChiefLocker = {
      { x = 459.729, y = -989.082, z = 23.914, name = "SecurityChiefLocker", type = 'locker'},
    },
   TeamLocker = {
      { x = 441.846, y = -991.444, z = 29.689, name = "TeamLocker", type = 'locker'},
    },
    WeaponLocker = {
      { x = 455.918, y = -979.245, z = 29.689, name = "WeaponLocker", type = 'weapon'},
    },
    DrugLocker = {
     { x = 461.867, y = -983.085, z = 29.689, name = "DrugLocker", type = 'drug'},
   },
  }
}

Config.PoliceStations = {

	LSPD = {
		Blip = {
			Pos   = {x = 425.130, y = -979.558, z = 30.711},
			Color = 29
		},

        AuthorizedWeapons = { 
            { name = 'WEAPON_FLASHLIGHT',       price = 25   }, 
            { name = 'WEAPON_FLAREGUN',         price = 25   }, 
            { name = 'WEAPON_NIGHTSTICK',       price = 25   },           
            { name = 'WEAPON_PISTOL',           price = 85   },
            { name = 'WEAPON_COMBATPISTOL',     price = 69   }, 
            { name = 'WEAPON_STUNGUN',          price = 10   },     
            { name = 'WEAPON_ASSAULTSMG',       price = 125  }, 
            { name = 'WEAPON_CARBINERIFLE',     price = 150  },           
            { name = 'WEAPON_MICROSMG',         price = 150  },
            { name = 'WEAPON_SMG',              price = 150  },
            { name = 'WEAPON_PISTOL_MK2',       price = 2000 },
            { name = 'WEAPON_PUMPSHOTGUN_MK2',  price = 2500 },
            { name = 'WEAPON_BULLPUPRIFLE_MK2', price = 2500 },
			{ name = 'WEAPON_CARBINERIFLE_MK2', price = 2500 },
			
				
		}, 
		
		AuthorizedItems = {
			{label = _U('pharmacy_take') .. ' ' .. _('grip'),  value = 'poigné'},
			{label = _U('pharmacy_take') .. ' ' .. _('flashlight'),  value = 'lampe'},
			{label = _U('pharmacy_take') .. ' ' .. _('silencieux'),  value = 'silencieux'},
		},

		AuthorizedVehicles = {
			{name = 'police' ,   label = 'Ford cadet'},
			{name = 'police2',   label = 'Voiture Rapide'},
			{name = 'police3',   label = 'Mercedes'},
			{name = 'police4',   label = ''}, 
			{name = 'police5',   label = '4x4'},
			{name = 'police6',   label = '4x4 K9'},
			{name = 'police7',   label = ''},
			{name = 'sheriff',   label = 'Véhicule rapide'},
			{name = 'sheriff2',  label = 'SUV shériff'},
			{name = 'blazer5',   label = ''},
			{name = 'fbi',       label = 'FBI'},
			{name = 'policeb',   label = 'moto'},
			{name = 'policebmw', label = 'moto bmw'},
			{name = 'policet',   label = 'fourgon transport'},
			{name = 'Policebike',label = ''},
			{name = 'pbus',      label = 'transport détenus'},
			{name = 'riot',      label = 'véhicule  lourd'},
			{name = 'polmav',    label = 'hélicoptère'}
		},

		Cloakrooms = {
			{x = 452.600, y = -993.306, z = 29.750}
		},

		Armories = {
			{x = 461.94, y = -979.514, z = 29.689}
		},
 
		Vehicles = {
			{
				Spawner    = {x = 454.69, y = -1017.4, z = 27.430},
				SpawnPoint = {x = 438.42, y = -1018.3, z = 27.757},
				Heading    = 90.0
			}
		},

		Helicopters = {
			{
				Spawner    = {x = 466.477, y = -982.819, z = 42.691},
				SpawnPoint = {x = 450.04, y = -981.14, z = 42.691},
				Heading    = 0.0
			}
		},

		VehicleDeleters = {
			{x = 462.74, y = -1014.4, z = 27.065},
			{x = 462.40, y = -1019.7, z = 27.104},
			{x = 449.22, y = -981.07, z = 42.690}
		},

		BossActions = {
			{x = 448.417, y = -973.208, z = 29.689}
		}

	}

}