--Truck
Config	=	{}

 -- Limit, unit can be whatever you want. Originally grams (as average people can hold 25kg)
Config.Limit = 50

-- Default weight for an item:
	-- weight == 0 : The item do not affect character inventory weight
	-- weight > 0 : The item cost place on inventory
	-- weight < 0 : The item add place on inventory. Smart people will love it.
Config.DefaultWeight = 1



-- If true, ignore rest of file
Config.WeightSqlBased = false

-- I Prefer to edit weight on the config.lua and I have switched Config.WeightSqlBased to false:

Config.localWeight = {
	bread = 1,
	water = 1,
}


-- http://gta.wikia.com/wiki/Category:Vehicle_Classes

Config.VehicleLimit ={
    [0]=120, -- Compacts
    [1]=140, -- Sedans
    [2]=300, -- SUVs
    [3]=170, -- Coupes
    [4]=120, -- Muscle
    [5]=75, -- Sports Classics
    [6]=100, -- Sports
    [7]=50, -- Super
    [8]=20, -- Motorcycles
    [9]=160, -- Off-road
    [10]=900, -- Industrial
    [11]=300, -- Utility
    [12]=600, -- Vans
    [13]=0, -- Cycles
    [14]=180, -- Boats
    [15]=300, -- Helicopters
    [16]=300, -- Planes
    [17]=300, -- Service
    [18]=300, -- Emergency
    [19]=1000, -- Military
    [20]=1500, -- Commercial
}


