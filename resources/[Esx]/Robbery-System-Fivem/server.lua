--[[ Layout



	["Name"]={name="Name",
	currentMoney=500, -- starting money
	maxMoney=5000, -- maximum money the store can hold
	moneyRengerationRate=100, -- how much money is gained Per Minute
	takesMoneyToBankOnMax=true, -- If the place transfers money to bank every 30 minutes
	isBank=false, -- is the place a bank
	bankToDeliverToo="Legion Flecca Bank Vault", -- what bank to deliver to if the takesMoenyToBank is true
	},

]]
robbableSpots = {
	["Little Seoul 24/7 Register #1"]={name="Little Seoul 24/7 Register #1",
	currentMoney=5000,
	maxMoney=10000,
	moneyRengerationRate=100, -- Per Minute
	takesMoneyToBankOnMax=true,
	isBank=false,
	bankToDeliverToo="Legion Flecca Bank Vault",
	},

	["Little Seoul 24/7 Register #2"]={name="Little Seoul 24/7 Register #2",
	currentMoney=5000,
	maxMoney=10000,
	moneyRengerationRate=100, -- Per Minute
	takesMoneyToBankOnMax=true,
	isBank=false,
	bankToDeliverToo="Legion Flecca Bank Vault",
	},

	["Little Seoul 24/7 Safe"]={name="Little Seoul 24/7 Safe",
	currentMoney=5000,
	maxMoney=25000,
	moneyRengerationRate=350, -- Per Minute
	takesMoneyToBankOnMax=true,
	isBank=false,
	bankToDeliverToo="Legion Flecca Bank Vault",
	},

	["Algonquin 24/7 Register"]={name="Algonquin 24/7 Register",
	currentMoney=5000,
	maxMoney=10000,
	moneyRengerationRate=100, -- Per Minute
	takesMoneyToBankOnMax=true,
	isBank=false,
	bankToDeliverToo="Route 68 Flecca Bank Vault",
	},

	["Mirror Park 24/7 Register #1"]={name="Mirror Park 24/7 Register #1",
	currentMoney=5000,
	maxMoney=10000,
	moneyRengerationRate=100, -- Per Minute
	takesMoneyToBankOnMax=true,
	isBank=false,
	bankToDeliverToo="East Hawick Flecca Bank Vault",
	},
	["Mirror Park 24/7 Register #2"]={name="Mirror Park 24/7 Register #2",
	currentMoney=5000,
	maxMoney=10000,
	moneyRengerationRate=100, -- Per Minute
	takesMoneyToBankOnMax=true,
	isBank=false,
	bankToDeliverToo="East Hawick Flecca Bank Vault",
	},
	["Mirror Park 24/7 Safe"]={name="Mirror Park 24/7 Safe",
	currentMoney=5000,
	maxMoney=25000,
	moneyRengerationRate=350, -- Per Minute
	takesMoneyToBankOnMax=true,
	isBank=false,
	bankToDeliverToo="East Hawick Flecca Bank Vault",
	},

	["Downtown Vinewood 24/7 Register #1"]={name="Downtown Vinewood 24/7 Register #1",
	currentMoney=5000,
	maxMoney=10000,
	moneyRengerationRate=100, -- Per Minute
	takesMoneyToBankOnMax=true,
	isBank=false,
	bankToDeliverToo="Pacific Standard Bank Vault",
	},
	["Downtown Vinewood 24/7 Register #2"]={name="Downtown Vinewood 24/7 Register #2",
	currentMoney=5000,
	maxMoney=10000,
	moneyRengerationRate=100, -- Per Minute
	takesMoneyToBankOnMax=true,
	isBank=false,
	bankToDeliverToo="Pacific Standard Bank Vault",
	},
	["Downtown Vinewood 24/7 Safe"]={name="Downtown Vinewood 24/7 Safe",
	currentMoney=5000,
	maxMoney=25000,
	moneyRengerationRate=350, -- Per Minute
	takesMoneyToBankOnMax=true,
	isBank=false,
	bankToDeliverToo="Pacific Standard Bank Vault",
	},

	["Rockford Dr 24/7 Register #1"]={name="Rockford Dr 24/7 Register #1",
	currentMoney=5000,
	maxMoney=10000,
	moneyRengerationRate=100, -- Per Minute
	takesMoneyToBankOnMax=true,
	isBank=false,
	bankToDeliverToo="Grean Ocean Hwy Flecca Bank Vault",
	},
	["Rockford Dr 24/7 Register #2"]={name="Rockford Dr 24/7 Register #2",
	currentMoney=5000,
	maxMoney=10000,
	moneyRengerationRate=100, -- Per Minute
	takesMoneyToBankOnMax=true,
	isBank=false,
	bankToDeliverToo="Grean Ocean Hwy Flecca Bank Vault",
	},
	["Rockford Dr 24/7 Safe"]={name="Rockford Dr 24/7 Safe",
	currentMoney=5000,
	maxMoney=25000,
	moneyRengerationRate=350, -- Per Minute
	takesMoneyToBankOnMax=true,
	isBank=false,
	bankToDeliverToo="Grean Ocean Hwy Flecca Bank Vault",
	},

	["South Senora Fwy 24/7 Register #1"]={name="South Senora Fwy 24/7 Register #1",
	currentMoney=5000,
	maxMoney=10000,
	moneyRengerationRate=100, -- Per Minute
	takesMoneyToBankOnMax=true,
	isBank=false,
	bankToDeliverToo="Route 68 Flecca Bank Vault",
	},
	["South Senora Fwy 24/7 Register #2"]={name="South Senora Fwy 24/7 Register #2",
	currentMoney=5000,
	maxMoney=10000,
	moneyRengerationRate=100, -- Per Minute
	takesMoneyToBankOnMax=true,
	isBank=false,
	bankToDeliverToo="Route 68 Flecca Bank Vault",
	},
	["South Senora Fwy 24/7 Safe"]={name="South Senora Fwy 24/7 Safe",
	currentMoney=5000,
	maxMoney=25000,
	moneyRengerationRate=350, -- Per Minute
	takesMoneyToBankOnMax=true,
	isBank=false,
	bankToDeliverToo="Route 68 Flecca Bank Vault",
	},

	["North Senora Fwy 24/7 Register #1"]={name="North Senora Fwy 24/7 Register #1",
	currentMoney=5000,
	maxMoney=10000,
	moneyRengerationRate=100, -- Per Minute
	takesMoneyToBankOnMax=true,
	isBank=false,
	bankToDeliverToo="Blaine County Savings Vault",
	},
	["North Senora Fwy 24/7 Register #2"]={name="North Senora Fwy 24/7 Register #2",
	currentMoney=5000,
	maxMoney=10000,
	moneyRengerationRate=100, -- Per Minute
	takesMoneyToBankOnMax=true,
	isBank=false,
	bankToDeliverToo="Blaine County Savings Vault",
	},
	["North Senora Fwy 24/7 Safe"]={name="North Senora Fwy 24/7 Safe",
	currentMoney=5000,
	maxMoney=25000,
	moneyRengerationRate=350, -- Per Minute
	takesMoneyToBankOnMax=true,
	isBank=false,
	bankToDeliverToo="Blaine County Savings Vault",
	},

	["Route 68 24/7 Register #1"]={name="Route 68 24/7 Register #1",
	currentMoney=5000,
	maxMoney=10000,
	moneyRengerationRate=100, -- Per Minute
	takesMoneyToBankOnMax=true,
	isBank=false,
	bankToDeliverToo="Grean Ocean ",
	},
	["Route 68 24/7 Register #2"]={name="Route 68 24/7 Register #2",
	currentMoney=5000,
	maxMoney=10000,
	moneyRengerationRate=100, -- Per Minute
	takesMoneyToBankOnMax=true,
	isBank=false,
	bankToDeliverToo="Grean Ocean ",
	},
	["Route 68 24/7 Safe"]={name="Route 68 24/7 Safe",
	currentMoney=5000,
	maxMoney=25000,
	moneyRengerationRate=350, -- Per Minute
	takesMoneyToBankOnMax=true,
	isBank=false,
	bankToDeliverToo="Grean Ocean ",
	},

	["Innocence Blvd 24/7 Register #1"]={name="Innocence Blvd 24/7 Register #1",
	currentMoney=5000,
	maxMoney=10000,
	moneyRengerationRate=100, -- Per Minute
	takesMoneyToBankOnMax=true,
	isBank=false,
	bankToDeliverToo="Legion Flecca Bank Vault",
	},
	["Innocence Blvd 24/7 Register #2"]={name="Innocence Blvd 24/7 Register #2",
	currentMoney=5000,
	maxMoney=10000,
	moneyRengerationRate=100, -- Per Minute
	takesMoneyToBankOnMax=true,
	isBank=false,
	bankToDeliverToo="Legion Flecca Bank Vault",
	},
	["Innocence Blvd 24/7 Safe"]={name="Innocence Blvd 24/7 Safe",
	currentMoney=5000,
	maxMoney=25000,
	moneyRengerationRate=350, -- Per Minute
	takesMoneyToBankOnMax=true,
	isBank=false,
	bankToDeliverToo="Legion Flecca Bank Vault",
	},


	--CLUBS










--- LIQUIOR STORES



	["Prosperity Liquor Store Register"]={name="Prosperity Liquor Store Register",
	currentMoney=5000,
	maxMoney=10000,
	moneyRengerationRate=200, -- Per Minute
	takesMoneyToBankOnMax=true,
	isBank=false,
	bankToDeliverToo="West Hawick Flecca Bank Vault",
	},
	["Prosperity Liquor Store Safe"]={name="Prosperity Liquor Store Safe",
	currentMoney=5000,
	maxMoney=30000,
	moneyRengerationRate=100, -- Per Minute
	takesMoneyToBankOnMax=true,
	isBank=false,
	bankToDeliverToo="West Hawick Flecca Bank Vault",
	},

	["El Rancho Blvd Liquor Store Register"]={name="El Rancho Blvd Liquor Store Register",
	currentMoney=5000,
	maxMoney=10000,
	moneyRengerationRate=200, -- Per Minute
	takesMoneyToBankOnMax=true,
	isBank=false,
	bankToDeliverToo="Legion Flecca Bank Vault",
	},
	["El Rancho Blvd Liquor Store Safe"]={name="El Rancho Blvd Liquor Store Safe",
	currentMoney=5000,
	maxMoney=30000,
	moneyRengerationRate=100, -- Per Minute
	takesMoneyToBankOnMax=true,
	isBank=false,
	bankToDeliverToo="Legion Flecca Bank Vault",
	},

	["Great Ocean Hwy Liquor Store Register"]={name="Great Ocean Hwy Liquor Store Register",
	currentMoney=5000,
	maxMoney=10000,
	moneyRengerationRate=200, -- Per Minute
	takesMoneyToBankOnMax=true,
	isBank=false,
	bankToDeliverToo="Great Owean Hwy Flecca Bank Vault",
	},
	["Great Ocean Hwy Liquor Store Safe"]={name="Great Ocean Hwy Liquor Store Safe",
	currentMoney=5000,
	maxMoney=30000,
	moneyRengerationRate=100, -- Per Minute
	takesMoneyToBankOnMax=true,
	isBank=false,
	bankToDeliverToo="Great Owean Hwy Flecca Bank Vault",
	},

	["Route 68 Liquor Store Register"]={name="Route 68 Liquor Store Register",
	currentMoney=5000,
	maxMoney=10000,
	moneyRengerationRate=200, -- Per Minute
	takesMoneyToBankOnMax=true,
	isBank=false,
	bankToDeliverToo="Route 68 Flecca Bank Vault",
	},
	["Route 68 Liquior Store Safe"]={name="Route 68 Liquior Store Safe",
	currentMoney=5000,
	maxMoney=30000,
	moneyRengerationRate=100, -- Per Minute
	takesMoneyToBankOnMax=true,
	isBank=false,
	bankToDeliverToo="Route 68 Flecca Bank Vault",
	},







-- bank booths

	["Pacific Standard Bank Booth #1"]={name="Pacific Standard Bank Booth #1",
	currentMoney=15000,
	maxMoney=50000,
	moneyRengerationRate=100, -- Per Minute
	takesMoneyToBankOnMax=false,
	isBank=true,
	bankToDeliverToo="None",
	},

	["Pacific Standard Bank Booth #2"]={name="Pacific Standard Bank Booth #2",
	currentMoney=15000,
	maxMoney=50000,
	moneyRengerationRate=100, -- Per Minute
	takesMoneyToBankOnMax=false,
	isBank=true,
	bankToDeliverToo="None",
	},

	["Pacific Standard Bank Booth #3"]={name="Pacific Standard Bank Booth #3",
	currentMoney=15000,
	maxMoney=50000,
	moneyRengerationRate=100, -- Per Minute
	takesMoneyToBankOnMax=false,
	isBank=true,
	bankToDeliverToo="None",
	},






	-- BANKS



	["East Hawick Flecca Bank Vault"]={name="East Hawick Flecca Bank Vault",
	currentMoney=100000,
	maxMoney=800000,
	moneyRengerationRate=400, -- Per Minute
	takesMoneyToBankOnMax=false,
	isBank=true,
	bankToDeliverToo="None",
	},

	["East Hawick Flecca Bank Vault"]={name="East Hawick Flecca Bank Vault",
	currentMoney=100000,
	maxMoney=800000,
	moneyRengerationRate=400, -- Per Minute
	takesMoneyToBankOnMax=false,
	isBank=true,
	bankToDeliverToo="None",
	},

	["Route 68 Flecca Bank Vault"]={name="Route 68 Flecca Bank Vault",
	currentMoney=100000,
	maxMoney=800000,
	moneyRengerationRate=400, -- Per Minute
	takesMoneyToBankOnMax=false,
	isBank=true,
	bankToDeliverToo="None",
	},

	["Hawick Flecca Bank Vault"]={name="Hawick Flecca Bank Vault",
	currentMoney=100000,
	maxMoney=800000,
	moneyRengerationRate=400, -- Per Minute
	takesMoneyToBankOnMax=false,
	isBank=true,
	bankToDeliverToo="None",
	},

	["West Hawick Flecca Bank Vault"]={name="West Hawick Flecca Bank Vault",
	currentMoney=100000,
	maxMoney=800000,
	moneyRengerationRate=400, -- Per Minute
	takesMoneyToBankOnMax=false,
	isBank=true,
	bankToDeliverToo="None",
	},

	["Legion Flecca Bank Vault"]={name="Legion Flecca Bank Vault",
	currentMoney=100000,
	maxMoney=800000,
	moneyRengerationRate=400, -- Per Minute
	takesMoneyToBankOnMax=false,
	isBank=true,
	bankToDeliverToo="None",
	},

	["Great Ocean Hwy Flecca Bank Vault"]={name="Great Ocean Hwy Flecca Bank Vault",
	currentMoney=100000,
	maxMoney=800000,
	moneyRengerationRate=400, -- Per Minute
	takesMoneyToBankOnMax=false,
	isBank=true,
	bankToDeliverToo="None",
	},

	["Pacific Standard Bank Vault"]={name="Pacific Standard Bank Vault",
	currentMoney=100000,
	maxMoney=800000,
	moneyRengerationRate=400, -- Per Minute
	takesMoneyToBankOnMax=false,
	isBank=true,
	bankToDeliverToo="None",
	},

	["Blaine County Savings Vault"]={name="Blaine County Savings Vault",
	currentMoney=100000,
	maxMoney=800000,
	moneyRengerationRate=400, -- Per Minute
	takesMoneyToBankOnMax=false,
	isBank=true,
	bankToDeliverToo="None",
	},
}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(60000)
		for name,spot in pairs(robbableSpots) do
			if(spot.currentMoney<spot.maxMoney)then
				spot.currentMoney = spot.currentMoney + spot.moneyRengerationRate
			end
		end
	end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1800000)
		for name,spot in pairs(robbableSpots)do
			if(spot.isBank==false)then
				local aFourth = spot.currentMoney/4
				local randomAmount = math.random(aFourth,aFourth*3)
				spot.currentMoney = spot.currentMoney-randomAmount
				robbableSpots[spot.bankToDeliverToo].currentMoney=robbableSpots[spot.bankToDeliverToo].currentMoney+randomAmount
				if(robbableSpots[spot.bankToDeliverToo].currentMoney>robbableSpots[spot.bankToDeliverToo].maxMoney)then
					robbableSpots[spot.bankToDeliverToo].currentMoney=robbableSpots[spot.bankToDeliverToo].maxMoney
				end
			end
		end
	end
end)

RegisterServerEvent("robberies:robberyOver")
AddEventHandler("robberies:robberyOver", function(name) 	
	TriggerEvent('es:getPlayerFromId', source, function(target) 
		if(target)then
			target.addMoney(robbableSpots[name].currentMoney) 
			robbableSpots[name].currentMoney=0
		end
	end)
end)

RegisterServerEvent("robberies:robberyOverNotification")
AddEventHandler("robberies:robberyOverNotification", function(name)
	TriggerEvent('es:getPlayers', function(players)
		for i,p in pairs(players) do
			if p.getSessionVar('policeInService') == true then
				TriggerClientEvent("robberies:robberyOverNotification",i, name)
			end
		end
	end)
end)

RegisterServerEvent("robberies:robberyStartedNotification")
AddEventHandler("robberies:robberyStartedNotification", function(name)
	TriggerEvent('es:getPlayers', function(players)
		for i,p in pairs(players) do
			if p.getSessionVar('policeInService') == true then
				TriggerClientEvent("robberies:robberyStartedNotification", i, name)
			end
		end
	end)
end)

RegisterServerEvent("robberies:syncSpots")
AddEventHandler("robberies:syncSpots", function(spots)
	TriggerClientEvent("robberies:syncSpotsClient", -1, spots)
end)

RegisterServerEvent("robberies:policeCheck")
AddEventHandler("robberies:policeCheck", function()
	TriggerEvent('es:getPlayers', function(players)
		local nbPolice = 0
		for i,p in pairs(players) do
			if p.getSessionVar('policeInService') == true then
				nbPolice = nbPolice + 1
			end
		end
		TriggerClientEvent("robberies:StartRobbery", source, nbPolice)
	end)
end)
