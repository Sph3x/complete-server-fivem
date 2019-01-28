Config = {}
Config.DirtyMoney = 'Argent sale'
Config.Cash = 'argent'
Config.MaxDistance = 1.5 --max distance to access trunk
Config.VecOffset = 2.5 --how much behind the car trunk is located. Very cheap way of accomplishing the goal
Config.Radius = 4.5 --How far away to search for vehicles (only for GetClosestVehicle
Config.Ammo = 250 --Ammo to give player on weapon pull
Config.AllowEmpty = true --Allow empty weapons to be stored (no ammo system(too lazy) so you can get ammo by simply adding weapons inside the trunk)
Config.EnableDupeProtection = false --Delete trunk content if trunk was open and player leaves the server
Config.CheckForGlitchedTrunks = false --Release glitched trunks
Config.EnableDebugMarker = true --Debug marker (see github readme img)

--- Vehicle type ref = https://runtime.fivem.net/doc/reference.html#_0x29439776AAA00A62
Config.VehicleCarry = {
	{value = 150}, -- Compacts
	{value = 200}, -- Sedans
	{value = 400}, -- Suvs
	{value = 150}, -- Coupes
	{value = 150}, -- Muscle
	{value = 80}, -- Sports classics
	{value = 80}, -- Sports
	{value = 50}, -- Super
	{value = 25}, -- Motorcycles
	{value = 500}, -- Off-road
	{value = 1000}, -- Industrial
	{value = 1000}, -- Utility
	{value = 500}, -- Vans
	{value = 0}, -- Cycles
	{value = 300}, -- Boats
	{value = 300}, -- Helicopter
	{value = 2000}, -- Planes
	{value = 300}, -- Service
	{value = 300}, -- Emergency
	{value = 500}, -- Military
	{value = 750},	-- Commercial
	{value = 4000}, -- Trains
}

Config.VehicleTrunkDistance = {

}

Config.LinersTake = {
	"No otat sen nyt silti.",
	"Et osaa tehdä rationaalisia päätöksiä.",
	"Tiedän, että halusit sen kuitenkin.",
	"Älä jaksa...",
	"Siinä. Ei kestä kiittää.",
	"Ole hyvä. Vastalauseita ei kuunnella."
}
Config.LinersAdd = {
	"No haista vittu sitten.",
	"Ei ole tuommoisille tarvettakaan.",
	"Ensin haluat laittaa aseen ja nyt et?",
	"Hermothan tämmösessä vehtaamisessa menee.",
	"Ensikerralla voit jättää kontin suosiolla kiinni.",
}