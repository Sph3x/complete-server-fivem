Config = {
	Locale = 'fr',
	DrawDistance = 100,
	Price = 1500,
	DamageMultiplier = 5,
	PropertyGarages = false, -- Enabling allows use of Property Garages if you own a property at location.
	BlipInfos = {
		Sprite = 290,
		Color = 38 
	},
	BlipPrivate = {
		Sprite = 290,
		Color = 53 
	},
	BlipPound = {
		Sprite = 67,
		Color = 64 
	}
}

Config.Garages = {
	-- Start of Public Garages
	Garage_Centre = {	
		Pos = {x=215.800, y=-810.057, z=29.727},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		SpawnPoint = {
			Pos = {x=229.700, y=-800.1149, z=29.5722},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 157.84,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x=223.797, y=-760.415, z=29.646},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		},
		MunicipalPoundPoint = {
			Pos = {x=408.61, y=-1625.47, z=28.29},
			Color = {r=25,g=25,b=112},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		},
		SpawnMunicipalPoundPoint = {
			Pos = {x=405.64, y=-1643.4, z=27.61},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 229.54,
			Marker = 1
		},
	},
	Garage_Paleto = {	
		Pos = {x=105.359, y=6613.586, z=31.3973},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		SpawnPoint = {
			Pos = {x=128.7822, y=6622.9965, z=30.7828},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 315.01,
			Marker = 1
		},
		DeletePoint = {
			Pos = {x=126.3572, y=6608.4150, z=30.8565},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		},
		MunicipalPoundPoint = {
			Pos = {x=-185.187, y=6272.027, z=30.580},
			Color = {r=25,g=25,b=112},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		},	
		SpawnMunicipalPoundPoint = {
			Pos = {x=-199.160, y=6274.180, z=30.580},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 316.36,
			Marker = 1
		},
	},
	-- End of Public Garages
	-- Start of Private Garages
	-- MazeBankBuilding Garages
	Garage_MazeBankBuilding = {	
		Pos = {x= -44.031, y= -787.363, z= 43.186},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "MazeBankBuilding",
		SpawnPoint = {
			Pos = {x= -44.031, y= -787.363, z= 43.186},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 254.322,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x= -58.88, y= -778.625, z= 43.175},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_OldSpiceWarm = {	
		Pos = {x= -44.031, y= -787.363, z= 43.186},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "OldSpiceWarm",
		SpawnPoint = {
			Pos = {x= -44.031, y= -787.363, z= 43.186},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 254.322,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x= -58.88, y= -778.625, z= 43.175},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_OldSpiceClassical = {	
		Pos = {x= -44.031, y= -787.363, z= 43.186},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "OldSpiceClassical",
		SpawnPoint = {
			Pos = {x= -44.031, y= -787.363, z= 43.186},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 254.322,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x= -58.88, y= -778.625, z= 43.175},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_OldSpiceVintage = {	
		Pos = {x= -44.031, y= -787.363, z= 43.186},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "OldSpiceVintage",
		SpawnPoint = {
			Pos = {x= -44.031, y= -787.363, z= 43.186},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 254.322,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x= -58.88, y= -778.625, z= 43.175},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_ExecutiveRich = {	
		Pos = {x= -44.031, y= -787.363, z= 43.186},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "ExecutiveRich",
		SpawnPoint = {
			Pos = {x= -44.031, y= -787.363, z= 43.186},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 254.322,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x= -58.88, y= -778.625, z= 43.175},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_ExecutiveCool = {	
		Pos = {x= -44.031, y= -787.363, z= 43.186},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "ExecutiveCool",
		SpawnPoint = {
			Pos = {x= -44.031, y= -787.363, z= 43.186},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 254.322,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x= -58.88, y= -778.625, z= 43.175},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_ExecutiveContrast = {	
		Pos = {x= -44.031, y= -787.363, z= 43.186},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "ExecutiveContrast",
		SpawnPoint = {
			Pos = {x= -44.031, y= -787.363, z= 43.186},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 254.322,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x= -58.88, y= -778.625, z= 43.175},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_PowerBrokerIce = {	
		Pos = {x= -44.031, y= -787.363, z= 43.186},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "PowerBrokerIce",
		SpawnPoint = {
			Pos = {x= -44.031, y= -787.363, z= 43.186},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 254.322,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x= -58.88, y= -778.625, z= 43.175},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_PowerBrokerConservative = {	
		Pos = {x= -44.031, y= -787.363, z= 43.186},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "PowerBrokerConservative",
		SpawnPoint = {
			Pos = {x= -44.031, y= -787.363, z= 43.186},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 254.322,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x= -58.88, y= -778.625, z= 43.175},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_PowerBrokerPolished = {	
		Pos = {x= -44.031, y= -787.363, z= 43.186},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "PowerBrokerPolished",
		SpawnPoint = {
			Pos = {x= -44.031, y= -787.363, z= 43.186},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 254.322,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x= -58.88, y= -778.625, z= 43.175},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	-- End of MazeBankBuilding Garages
	-- Start of LomBank Garages
	Garage_LomBank = {	
		Pos = {x= -1551.88, y= -581.383, z= 24.708},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "LomBank",
		SpawnPoint = {
			Pos = {x= -1551.88, y= -581.383, z= 24.708},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 331.176,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x= -1538.564, y= -576.049, z= 24.708},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 2.0},
			Marker = 1
		}
	},
	Garage_LBOldSpiceWarm = {	
		Pos = {x= -1551.88, y= -581.383, z= 24.708},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "LBOldSpiceWarm",
		SpawnPoint = {
			Pos = {x= -1551.88, y= -581.383, z= 24.708},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 331.176,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x= -1538.564, y= -576.049, z= 24.708},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 2.0},
			Marker = 1
		}
	},
	Garage_LBOldSpiceClassical = {	
		Pos = {x= -1551.88, y= -581.383, z= 24.708},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "LBOldSpiceClassical",
		SpawnPoint = {
			Pos = {x= -1551.88, y= -581.383, z= 24.708},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 331.176,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x= -1538.564, y= -576.049, z= 24.708},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 2.0},
			Marker = 1
		}
	},
	Garage_LBOldSpiceVintage = {	
		Pos = {x= -1551.88, y= -581.383, z= 24.708},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "LBOldSpiceVintage",
		SpawnPoint = {
			Pos = {x= -1551.88, y= -581.383, z= 24.708},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 331.176,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x= -1538.564, y= -576.049, z= 24.708},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 2.0},
			Marker = 1
		}
	},
	Garage_LBExecutiveRich = {	
		Pos = {x= -1551.88, y= -581.383, z= 24.708},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "LBExecutiveRich",
		SpawnPoint = {
			Pos = {x= -1551.88, y= -581.383, z= 24.708},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 331.176,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x= -1538.564, y= -576.049, z= 24.708},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 2.0},
			Marker = 1
		}
	},
	Garage_LBExecutiveCool = {	
		Pos = {x= -1551.88, y= -581.383, z= 24.708},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "LBExecutiveCool",
		SpawnPoint = {
			Pos = {x= -1551.88, y= -581.383, z= 24.708},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 331.176,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x= -1538.564, y= -576.049, z= 24.708},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 2.0},
			Marker = 1
		}
	},
	Garage_LBExecutiveContrast = {	
		Pos = {x= -1551.88, y= -581.383, z= 24.708},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "LBExecutiveContrast",
		SpawnPoint = {
			Pos = {x= -1551.88, y= -581.383, z= 24.708},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 331.176,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x= -1538.564, y= -576.049, z= 24.708},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 2.0},
			Marker = 1
		}
	},
	Garage_LBPowerBrokerIce = {	
		Pos = {x= -1551.88, y= -581.383, z= 24.708},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "LBPowerBrokerIce",
		SpawnPoint = {
			Pos = {x= -1551.88, y= -581.383, z= 24.708},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 331.176,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x= -1538.564, y= -576.049, z= 24.708},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 2.0},
			Marker = 1
		}
	},
	Garage_LBPowerBrokerConservative = {	
		Pos = {x= -1551.88, y= -581.383, z= 24.708},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "LBPowerBrokerConservative",
		SpawnPoint = {
			Pos = {x= -1551.88, y= -581.383, z= 24.708},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 331.176,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x= -1538.564, y= -576.049, z= 24.708},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 2.0},
			Marker = 1
		}
	},
	Garage_LBPowerBrokerPolished = {	
		Pos = {x= -1551.88, y= -581.383, z= 24.708},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "LBPowerBrokerPolished",
		SpawnPoint = {
			Pos = {x= -1551.88, y= -581.383, z= 24.708},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 331.176,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x= -1538.564, y= -576.049, z= 24.708},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 2.0},
			Marker = 1
		}
	},
	-- End of LomBank Garages
	-- Start of MazeBankWest Garages
	Garage_MazeBankWest = {	
		Pos = {x=-1373.824, y= -468.05, z= 30.5},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "MazeBankWest",
		SpawnPoint = {
			Pos = {x=-1373.824, y= -468.05, z= 30.5},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 157.84,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x=-1362.065, y= -471.982, z= 30.5},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_MBWOldSpiceWarm = {	
		Pos = {x=-1373.824, y= -468.05, z= 30.5},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "MBWOldSpiceWarm",
		SpawnPoint = {
			Pos = {x=-1373.824, y= -468.05, z= 30.5},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 157.84,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x=-1362.065, y= -471.982, z= 30.5},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_MBWOldSpiceClassical = {	
		Pos = {x=-1373.824, y= -468.05, z= 30.5},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "MBWOldSpiceClassical",
		SpawnPoint = {
			Pos = {x=-1373.824, y= -468.05, z= 30.5},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 157.84,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x=-1362.065, y= -471.982, z= 30.5},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_MBWOldSpiceVintage = {	
		Pos = {x=-1373.824, y= -468.05, z= 30.5},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "MBWOldSpiceVintage",
		SpawnPoint = {
			Pos = {x=-1373.824, y= -468.05, z= 30.5},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 157.84,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x=-1362.065, y= -471.982, z= 30.5},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_MBWExecutiveRich = {	
		Pos = {x=-1373.824, y= -468.05, z= 30.5},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "MBWExecutiveRich",
		SpawnPoint = {
			Pos = {x=-1373.824, y= -468.05, z= 30.5},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 157.84,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x=-1362.065, y= -471.982, z= 30.5},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_MBWExecutiveCool = {	
		Pos = {x=-1373.824, y= -468.05, z= 30.5},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "MBWExecutiveCool",
		SpawnPoint = {
			Pos = {x=-1373.824, y= -468.05, z= 30.5},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 157.84,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x=-1362.065, y= -471.982, z= 30.5},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_MBWExecutiveContrast = {	
		Pos = {x=-1373.824, y= -468.05, z= 30.5},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "MBWExecutiveContrast",
		SpawnPoint = {
			Pos = {x=-1373.824, y= -468.05, z= 30.5},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 157.84,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x=-1362.065, y= -471.982, z= 30.5},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_MBWPowerBrokerIce = {	
		Pos = {x=-1373.824, y= -468.05, z= 30.5},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "MBWPowerBrokerIce",
		SpawnPoint = {
			Pos = {x=-1373.824, y= -468.05, z= 30.5},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 157.84,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x=-1362.065, y= -471.982, z= 30.5},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_MBWPowerBrokerConvservative = {	
		Pos = {x=-1373.824, y= -468.05, z= 30.5},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "MBWPowerBrokerConvservative",
		SpawnPoint = {
			Pos = {x=-1373.824, y= -468.05, z= 30.5},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 157.84,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x=-1362.065, y= -471.982, z= 30.5},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_MBWPowerBrokerPolished = {	
		Pos = {x=-1373.824, y= -468.05, z= 30.5},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "MBWPowerBrokerPolished",
		SpawnPoint = {
			Pos = {x=-1373.824, y= -468.05, z= 30.5},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 157.84,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x=-1362.065, y= -471.982, z= 30.5},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	-- End of MazeBankWest Garages
	-- Start of IntegrityWay Garages
	Garage_IntegrityWay = {	
		Pos = {x= -7.111, y= -635.1, z= 34.724},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "IntegrityWay",
		SpawnPoint = {
			Pos = {x= -7.351, y= -635.1, z= 34.724},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 66.632,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x= -37.575, y= -620.391, z= 34.073},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_IntegrityWay28 = {	
		Pos = {x= -7.111, y= -635.1, z= 34.724},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "IntegrityWay28",
		SpawnPoint = {
			Pos = {x= -7.351, y= -635.1, z= 34.724},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 66.632,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x= -37.575, y= -620.391, z= 34.073},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_IntegrityWay30 = {	
		Pos = {x= -7.111, y= -635.1, z= 34.724},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "IntegrityWay30",
		SpawnPoint = {
			Pos = {x= -7.351, y= -635.1, z= 34.724},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 66.632,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x= -37.575, y= -620.391, z= 34.073},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	-- End of IntegrityWay Garages
	-- Start of DellPerroHeights Garages
	Garage_DellPerroHeights = {	
		Pos = {x= -1472.974, y= -507.268, z= 31.807},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "DellPerroHeights",
		SpawnPoint = {
			Pos = {x= -1472.974, y= -507.268, z= 31.807},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 35.215,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x= -1452.612, y= -508.782, z= 30.582},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 2.0},
			Marker = 1
		}
	},
	Garage_DellPerroHeightst4 = {	
		Pos = {x= -1472.974, y= -507.268, z= 31.807},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "DellPerroHeightst4",
		SpawnPoint = {
			Pos = {x= -1472.974, y= -507.268, z= 31.807},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 35.215,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x= -1452.612, y= -508.782, z= 30.582},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 2.0},
			Marker = 1
		}
	},
	Garage_DellPerroHeightst7 = {	
		Pos = {x= -1472.974, y= -507.268, z= 31.807},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "DellPerroHeightst7",
		SpawnPoint = {
			Pos = {x= -1472.974, y= -507.268, z= 31.807},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 35.215,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x= -1452.612, y= -508.782, z= 30.582},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 2.0},
			Marker = 1
		}
	},
	-- End of DellPerroHeights Garages
	-- Start of MiltonDrive Garages
	Garage_MiltonDrive = {	
		Pos = {x=-800.496, y= 333.468, z= 84.5},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "MiltonDrive",
		SpawnPoint = {
			Pos = {x=-800.496, y= 333.468, z= 84.5},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 180.494,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x=-791.755, y= 333.468, z= 84.5},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_Modern1Apartment = {	
		Pos = {x=-800.496, y= 333.468, z= 84.5},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "Modern1Apartment",
		SpawnPoint = {
			Pos = {x=-800.496, y= 333.468, z= 84.5},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 180.494,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x=-791.755, y= 333.468, z= 84.5},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_Modern2Apartment = {	
		Pos = {x=-800.496, y= 333.468, z= 84.5},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "Modern2Apartment",
		SpawnPoint = {
			Pos = {x=-800.496, y= 333.468, z= 84.5},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 180.494,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x=-791.755, y= 333.468, z= 84.5},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_Modern3Apartment = {	
		Pos = {x=-800.496, y= 333.468, z= 84.5},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "Modern3Apartment",
		SpawnPoint = {
			Pos = {x=-800.496, y= 333.468, z= 84.5},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 180.494,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x=-791.755, y= 333.468, z= 84.5},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_Mody1Apartment = {	
		Pos = {x=-800.496, y= 333.468, z= 84.5},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "Mody1Apartment",
		SpawnPoint = {
			Pos = {x=-800.496, y= 333.468, z= 84.5},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 180.494,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x=-791.755, y= 333.468, z= 84.5},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_Mody2Apartment = {	
		Pos = {x=-800.496, y= 333.468, z= 84.5},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "Mody2Apartment",
		SpawnPoint = {
			Pos = {x=-800.496, y= 333.468, z= 84.5},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 180.494,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x=-791.755, y= 333.468, z= 84.5},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_Mody3Apartment = {	
		Pos = {x=-800.496, y= 333.468, z= 84.5},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "Mody3Apartment",
		SpawnPoint = {
			Pos = {x=-800.496, y= 333.468, z= 84.5},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 180.494,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x=-791.755, y= 333.468, z= 84.5},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_Vibrant1Apartment = {	
		Pos = {x=-800.496, y= 333.468, z= 84.5},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "Vibrant1Apartment",
		SpawnPoint = {
			Pos = {x=-800.496, y= 333.468, z= 84.5},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 180.494,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x=-791.755, y= 333.468, z= 84.5},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_Vibrant2Apartment = {	
		Pos = {x=-800.496, y= 333.468, z= 84.5},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "Vibrant2Apartment",
		SpawnPoint = {
			Pos = {x=-800.496, y= 333.468, z= 84.5},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 180.494,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x=-791.755, y= 333.468, z= 84.5},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_Vibrant3Apartment = {	
		Pos = {x=-800.496, y= 333.468, z= 84.5},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "Vibrant3Apartment",
		SpawnPoint = {
			Pos = {x=-800.496, y= 333.468, z= 84.5},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 180.494,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x=-791.755, y= 333.468, z= 84.5},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_Sharp1Apartment = {	
		Pos = {x=-800.496, y= 333.468, z= 84.5},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "Sharp1Apartment",
		SpawnPoint = {
			Pos = {x=-800.496, y= 333.468, z= 84.5},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 180.494,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x=-791.755, y= 333.468, z= 84.5},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_Sharp2Apartment = {	
		Pos = {x=-800.496, y= 333.468, z= 84.5},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "Sharp2Apartment",
		SpawnPoint = {
			Pos = {x=-800.496, y= 333.468, z= 84.5},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 180.494,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x=-791.755, y= 333.468, z= 84.5},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_Sharp3Apartment = {	
		Pos = {x=-800.496, y= 333.468, z= 84.5},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "Sharp3Apartment",
		SpawnPoint = {
			Pos = {x=-800.496, y= 333.468, z= 84.5},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 180.494,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x=-791.755, y= 333.468, z= 84.5},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_Monochrome1Apartment = {	
		Pos = {x=-800.496, y= 333.468, z= 84.5},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "Monochrome1Apartment",
		SpawnPoint = {
			Pos = {x=-800.496, y= 333.468, z= 84.5},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 180.494,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x=-791.755, y= 333.468, z= 84.5},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_Monochrome2Apartment = {	
		Pos = {x=-800.496, y= 333.468, z= 84.5},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "Monochrome2Apartment",
		SpawnPoint = {
			Pos = {x=-800.496, y= 333.468, z= 84.5},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 180.494,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x=-791.755, y= 333.468, z= 84.5},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_Monochrome3Apartment = {	
		Pos = {x=-800.496, y= 333.468, z= 84.5},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "Monochrome3Apartment",
		SpawnPoint = {
			Pos = {x=-800.496, y= 333.468, z= 84.5},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 180.494,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x=-791.755, y= 333.468, z= 84.5},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_Seductive1Apartment = {	
		Pos = {x=-800.496, y= 333.468, z= 84.5},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "Seductive1Apartment",
		SpawnPoint = {
			Pos = {x=-800.496, y= 333.468, z= 84.5},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 180.494,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x=-791.755, y= 333.468, z= 84.5},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_Seductive2Apartment = {	
		Pos = {x=-800.496, y= 333.468, z= 84.5},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "Seductive2Apartment",
		SpawnPoint = {
			Pos = {x=-800.496, y= 333.468, z= 84.5},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 180.494,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x=-791.755, y= 333.468, z= 84.5},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_Seductive3Apartment = {	
		Pos = {x=-800.496, y= 333.468, z= 84.5},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "Seductive3Apartment",
		SpawnPoint = {
			Pos = {x=-800.496, y= 333.468, z= 84.5},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 180.494,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x=-791.755, y= 333.468, z= 84.5},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_Regal1Apartment = {	
		Pos = {x=-800.496, y= 333.468, z= 84.5},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "Regal1Apartment",
		SpawnPoint = {
			Pos = {x=-800.496, y= 333.468, z= 84.5},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 180.494,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x=-791.755, y= 333.468, z= 84.5},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_Regal2Apartment = {	
		Pos = {x=-800.496, y= 333.468, z= 84.5},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "Regal2Apartment",
		SpawnPoint = {
			Pos = {x=-800.496, y= 333.468, z= 84.5},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 180.494,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x=-791.755, y= 333.468, z= 84.5},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_Regal3Apartment = {	
		Pos = {x=-800.496, y= 333.468, z= 84.5},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "Regal3Apartment",
		SpawnPoint = {
			Pos = {x=-800.496, y= 333.468, z= 84.5},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 180.494,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x=-791.755, y= 333.468, z= 84.5},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_Aqua1Apartment = {	
		Pos = {x=-800.496, y= 333.468, z= 84.5},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "Aqua1Apartment",
		SpawnPoint = {
			Pos = {x=-800.496, y= 333.468, z= 84.5},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 180.494,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x=-791.755, y= 333.468, z= 84.5},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_Aqua2Apartment = {	
		Pos = {x=-800.496, y= 333.468, z= 84.5},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "Aqua2Apartment",
		SpawnPoint = {
			Pos = {x=-800.496, y= 333.468, z= 84.5},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 180.494,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x=-791.755, y= 333.468, z= 84.5},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_Aqua3Apartment = {	
		Pos = {x=-800.496, y= 333.468, z= 84.5},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "Aqua3Apartment",
		SpawnPoint = {
			Pos = {x=-800.496, y= 333.468, z= 84.5},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 180.494,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x=-791.755, y= 333.468, z= 84.5},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	-- End of MiltonDrive Garages
	-- Start of Single Garages
	Garage_RichardMajesticApt2 = {	
		Pos = {x= -889.189, y= -336.813, z= 33.534},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "RichardMajesticApt2",
		SpawnPoint = {
			Pos = {x= -889.189, y= -336.813, z= 33.534},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 207.166,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x= -894.324, y= -349.326, z= 33.534},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_WildOatsDrive = {	
		Pos = {x= -188.651, y= 503.546, z= 133.272},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "WildOatsDrive",
		SpawnPoint = {
			Pos = {x= -188.651, y= 503.546, z= 133.272},
			Color = {r=0,g=255,b=0},
			Size  = {x = 2.0, y = 2.0, z = 1.0},
			Heading = 312.484,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x= -201.329, y= 510.572, z= 131.895},
			Color = {r=255,g=0,b=0},
			Size  = {x = 2.0, y = 2.0, z = 1.5},
			Marker = 1
		}
	},
	Garage_WhispymoundDrive = {	
		Pos = {x= 131.407, y= 569.395, z= 182.148},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "WhispymoundDrive",
		SpawnPoint = {
			Pos = {x= 131.407, y= 569.395, z= 182.148},
			Color = {r=0,g=255,b=0},
			Size  = {x = 2.0, y = 2.0, z = 1.0},
			Heading = 298.576,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x= 134.372, y= 579.335, z= 182.373},
			Color = {r=255,g=0,b=0},
			Size  = {x = 2.0, y = 2.0, z = 1.5},
			Marker = 1
		}
	},
	Garage_NorthConkerAvenue2044 = {	
		Pos = {x= 358.397, y= 437.064, z= 145.277},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "NorthConkerAvenue2044",
		SpawnPoint = {
			Pos = {x= 358.397, y= 437.064, z= 144.277},
			Color = {r=0,g=255,b=0},
			Size  = {x = 2.0, y = 2.0, z = 1.5},
			Heading = 285.911,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x= 351.383, y= 438.865, z= 145.66},
			Color = {r=255,g=0,b=0},
			Size  = {x = 2.0, y = 2.0, z = 1.5},
			Marker = 1
		}
	},
	Garage_HillcrestAvenue2862 = {	
		Pos = {x= -682.929, y= 606.566, z= 142.867},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "HillcrestAvenue2862",
		SpawnPoint = {
			Pos = {x= -682.929, y= 606.566, z= 142.867},
			Color = {r=0,g=255,b=0},
			Size  = {x = 2.0, y = 2.0, z = 1.0},
			Heading = 2.954,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x= -685.259, y= 601.083, z= 142.365},
			Color = {r=255,g=0,b=0},
			Size  = {x = 2.0, y = 2.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_HillcrestAvenue2868 = {	
		Pos = {x=-752.753, y= 624.901, z= 141.2},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "HillcrestAvenue2868",
		SpawnPoint = {
			Pos = {x=-752.753, y= 624.901, z= 141.2},
			Color = {r=0,g=255,b=0},
			Size  = {x = 2.0, y = 2.0, z = 1.0},
			Heading = 236.984,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x=-754.286, y= 631.581, z= 141.2},
			Color = {r=255,g=0,b=0},
			Size  = {x = 2.0, y = 2.0, z = 1.0},
			Marker = 1
		}
	},
	Garage_HillcrestAvenue2874 = {	
		Pos = {x=-863.681, y= 698.72, z= 148.052},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "HillcrestAvenue2874",
		SpawnPoint = {
			Pos = {x=-862.681, y= 699.72, z= 148.052},
			Color = {r=0,g=255,b=0},
			Size  = {x = 2.0, y = 2.0, z = 1.0},
			Heading = 341.77,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x=-872.712, y= 698.234, z= 147.606},
			Color = {r=255,g=0,b=0},
			Size  = {x = 2.0, y = 2.0, z = 2.0},
			Marker = 1
		}
	},
	Garage_MadWayneThunder = {	
		Pos = {x= -1299.25, y= 457.165, z= 96.542},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "MadWayneThunder",
		SpawnPoint = {
			Pos = {x= -1299.25, y= 457.165, z= 96.542},
			Color = {r=0,g=255,b=0},
			Size  = {x = 2.0, y = 2.0, z = 1.0},
			Heading = 285.652,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x= -1298.088, y= 468.952, z= 96.0},
			Color = {r=255,g=0,b=0},
			Size  = {x = 2.0, y = 2.0, z = 2.0},
			Marker = 1
		}
	},
	Garage_TinselTowersApt12 = {	
		Pos = {x= -620.588, y= 60.102, z= 42.736},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 1,
		Private = "TinselTowersApt12",
		SpawnPoint = {
			Pos = {x= -620.588, y= 60.102, z= 42.736},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Heading = 109.316,
			Marker = 1		
		},
		DeletePoint = {
			Pos = {x= -621.128, y= 52.691, z= 42.735},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 2.0},
			Marker = 1
		}
	},
	-- End of Single Garages
}
