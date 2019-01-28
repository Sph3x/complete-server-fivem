Config              = {}
Config.MarkerType   = 1
Config.DrawDistance = 100.0
Config.ZoneSize     = {x = 3.0, y = 3.0, z = 0.001}
Config.MarkerColor  = {r = 100, g = 204, b = 100}
Config.ShowBlips   = false  --markers visible on the map? (false to hide the markers on the map)

Config.RequiredCopsCoke  = 0
Config.RequiredCopsMeth  = 0
Config.RequiredCopsWeed  = 0
Config.RequiredCopsOpium = 0
Config.RequiredCopsMunition = 0
Config.RequiredCopsBijoux = 0
Config.RequiredCopsPapier = 0
Config.RequiredCopsOrgan = 0

Config.RequiredCopsDealer = 2

Config.TimeToFarm    = 2000
Config.TimeToProcess = 5000
Config.TimeToSell    = 2000

Config.Locale = 'fr'

Config.Zones = {
	
	CokeField =			{x = 2536.4558,	y = 4987.7505,	z = 44.10,	name = _U('coke_field'),		 sprite = 501,	color = 40},
	CokeProcessing =	{x = 1093.6,	y = -3196.6,	z = -38.99841,	name = _U('coke_processing'),	 sprite = 478,	color = 40}, 
	CokeDealer =		{x = 154.2339,	y = -2785.247,	z = 6.20,	name = _U('coke_dealer'),		 sprite = 500,	color = 75},
	
	MethField =			{x = 1364.7863,	y = -2102.686,	z = 51.30,	name = _U('meth_field'),		 sprite = 499,	color = 26},
	MethProcessing =	{x = 1010.7556,	y = -3196.4870,	z = -39.993,	name = _U('meth_processing'),	 sprite = 499,	color = 26}, 
	MethDealer =		{x = 1007.1513,	y = -2892.98,	z = 15.21,	name = _U('meth_dealer'),		 sprite = 500,	color = 75},
	
	WeedField =			{x = 1039.2406,	y = -3205.3808,	z = -39.1664,	name = _U('weed_field'),		 sprite = 496,	color = 52}, 
	WeedProcessing =	{x = 2818.049,	y = -1467.603,	z = 9.596,	    name = _U('weed_processing'),	 sprite = 496,	color = 52}, 
	WeedDealer =		{x = 76.4854,	y = -1972.514,	z = 20.00,	    name = _U('weed_dealer'),		 sprite = 500,	color = 75},
	
	OpiumField =		{x = 2983.385, y = 4837.482 ,	z = 43.038, name = _U('opium_field'),		 sprite = 51,	color = 60},
    OpiumProcessing =	{x = 2330.1630,	y = 2570.3029,	z = 45.6796, name = _U('opium_processing'),	 sprite = 51,	color = 60},
	OpiumDealer =		{x = 149.7154,	y = -2204.5805,	z = 3.6880,	 name = _U('opium_dealer'),		 sprite = 500,	color = 75},

	MunitionField =		 {x = 468.735, y = -3206.375 , z = 5.069,	name = _U('munition_field'),     sprite = 51,	color = 60},
    MunitionProcessing = {x = 109.384, y = -1797.634, z = 26.077,   name = _U('munition_processing'),sprite = 51,	color = 60},
	MunitionDealer =	 {x = 307.822, y = -1005.594, z = 28.507,	name = _U('munition_dealer'),	 sprite = 500,	color = 75},

	BijouxField =		 {x = -580.055, y = -778.577,  z = 24.017,	name = _U('bijoux_field'),		 sprite = 51,	color = 60},
    BijouxProcessing =   {x = 795.176,  y = 562.459,   z = 125.110,	name = _U('bijoux_processing'),	 sprite = 51,	color = 60},
	BijouxDealer =	     {x = 968.392,  y = -1226.659, z = 26.065,	name = _U('bijoux_dealer'),		 sprite = 500,	color = 75},

    PapierField =		 {x = 939.942 ,  y = -1490.023, z = 29.227, name = _U('papier_field'),		  sprite = 51,	color = 60}, 
    PapierProcessing =   {x = 1163.842,    y = -3195.7,	 z = -39.008, name = _U('papier_processing'),  sprite = 51,	color = 60}, 
	PapierDealer =	     {x = -1158.583,  y = -2442.829, z = 19.261, name = _U('papier_dealer'),	  sprite = 500,	color = 75},

	OrganField =		 {x = 1102.409 ,  y = -1528.669, z = 34.032,  name = _U('organ_field'),		  sprite = 51,	color = 60},
    OrganProcessing =    {x = -130.668,   y = 867.476,	 z = 231.695, name = _U('organ_processing'),  sprite = 51,	color = 60},
	OrganDealer =	     {x = 977.0653,    y = -104.1691, z = 74.84,  name = _U('organ_dealer'),      sprite = 500,	color = 75}

}
