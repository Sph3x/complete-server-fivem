--[[--------------------------------------------------------------------------
	*
	* Mello Trainer
	* (C) Michael Goodwin 2017
	* http://github.com/thestonedturtle/mellotrainer/releases
	*
	* This menu used the Scorpion Trainer as a framework to build off of.
	* https://github.com/pongo1231/ScorpionTrainer
	* (C) Emre Cürgül 2017
	* 
	* A lot of useful functionality has been converted from the lambda menu.
	* https://lambda.menu
	* (C) Oui 2017
	*
	* Additional Contributors:
	* WolfKnight (https://forum.fivem.net/u/WolfKnight)
	*
---------------------------------------------------------------------------]]


--    _____        __            _ _    __      __        _       _     _           
--   |  __ \      / _|          | | |   \ \    / /       (_)     | |   | |          
--   | |  | | ___| |_ __ _ _   _| | |_   \ \  / /_ _ _ __ _  __ _| |__ | | ___  ___ 
--   | |  | |/ _ \  _/ _` | | | | | __|   \ \/ / _` | '__| |/ _` | '_ \| |/ _ \/ __|
--   | |__| |  __/ || (_| | |_| | | |_     \  / (_| | |  | | (_| | |_) | |  __/\__ \
--   |_____/ \___|_| \__,_|\__,_|_|\__|     \/ \__,_|_|  |_|\__,_|_.__/|_|\___||___/
--                                                                                  
--  
Users = {}
maxPlayers = 32;
playerWasDisconnected = true;
isVoiceChatRunning = true;

blipCheck1 = nil;
blipCheck2 = nil;

pmodel = nil;

drawable = {};
dtexture = {};
prop = {};
ptexture = {};
pallet = {};


--[[
  ______         _                   __      __        _       _     _           
 |  ____|       | |                  \ \    / /       (_)     | |   | |          
 | |__ ___  __ _| |_ _   _ _ __ ___   \ \  / /_ _ _ __ _  __ _| |__ | | ___  ___ 
 |  __/ _ \/ _` | __| | | | '__/ _ \   \ \/ / _` | '__| |/ _` | '_ \| |/ _ \/ __|
 | | |  __/ (_| | |_| |_| | | |  __/    \  / (_| | |  | | (_| | |_) | |  __/\__ \
 |_|  \___|\__,_|\__|\__,_|_|  \___|     \/ \__,_|_|  |_|\__,_|_.__/|_|\___||___/
--]]


--General Settings
featurePlayerBlips = false;
featurePlayerBlipNames = false;
featurePlayerHeadDisplay = false;
featurePlayerVehHeadDisplay = false;
--featurePlayerBlipCone = false;
featurePlayerNotifications = true;
featureDeathNotifications = true;
featureHideMap = false;
featureHideHud = false;
featureBigHud = false;
featurePoliceBlips = false;
featureMapBlips = false;
featureAreaStreetNames = false;
--featureShowDeathCutscene = false;
featureRestoreWeapons = false;--true
--featureRestoreAppearance = false;


--Vehicle Options
featureCloseInstantly = false;
featureSpeedometer = false;
featureVehicleDespawnable = nil;
featureSpawnInsideCar = true;
featureSpawnCarInFront = true 
featureDeleteLastVehicle = true;
featureNoFallOff = nil;
featureNoFallOffUpdated = nil;
featureNoDragOut = nil;
featureNoDragOutUpdated = nil;
featureNoHelmet = nil;
featureVehCosDamage = nil;
featureVehMechDamage = nil;
featureVehInvincible = nil;
featureTurboMode = nil;
featureCustomTires = nil;
featureBulletproofWheels = nil;
featureXeonLights = nil;

featureNeonLeft = nil;
featureNeonRight = nil;
featureNeonFront = nil;
featureNeonRear = nil;



--Online Player
featureSpectate = false;
featurePlayerAttach = false;
featureDrawRoute = false;
featureFriendly = false;
featureHostile = false;


--Player Toggles
featureNightVision = false;
featureThermalVision = false;
featurePlayerInvincible = false;
featurePlayerInvincibleUpdated = false;
featureKeepClean = false;
featureKeepWet = false;
featurePlayerNeverWanted = false;
featurePlayerNeverWantedUpdated = false;
featurePlayerIgnoredByPolice = false;
featurePlayerIgnoredByPoliceUpdated = false;
featurePlayerIgnoredByAll = false;
featurePlayerIgnoredByAllUpdated = false;
--featurePlayerUnlimitedAbility = false;
featurePlayerNoNoise = false;
featurePlayerNoNoiseUpdated = false;
featurePlayerFastSwim = false;
featurePlayerFastSwimUpdated = false;
featurePlayerFastRun = false;
featurePlayerFastRunUpdated = false;
featurePlayerSuperJump = false;
featureNoRagDoll = false;
featurePlayerInvisible = false;
featurePlayerInvisibleUpdated = false;
featurePlayerDrunk = false;
featurePlayerDrunkUpdated = false;
featurePlayerInfiniteStamina = true;
featurePlayerInfiniteParachutes = false;
featurePlayerInfiniteAmmo = false;
featurePlayerNoReload = false;


--Radio
featurePlayerRadio = false;
featurePlayerRadioUpdated = false;
featureRadioAlwaysOff = false;
featureRadioAlwaysOffUpdated = false;
featureLockRadio = false;
featureMiscLockRadio = false;


--Weather
featureBlackout = false;
featureWeatherWind = false;
featureWeatherFreeze = false;


--Voice
featureShowVoiceChatSpeaker = true;
featureVC1 = false;
featureVC2 = false;
featureVC3 = false;
featureVC4 = false;
featureVC5 = false;
featureVC6 = false;
featureVC7 = false;
featureVC8 = false;
featureVC9 = false;
featureVC10 = false;
featureHC1 = false;
featureHC2 = false;
featureHC3 = false;
featureHC4 = false;
featureHC5 = false;
featureHC6 = false;
featureHC7 = false;
featureHC8 = false;
featureHC9 = false;
featureHC10 = false;
featureVPTooClose = false;
featureVPVeryClose = false;
featureVPClose = false;
featureVPNearby = false;
featureVPDistant = false;
featureVPFar = false;
featureVPVeryFar = false;
featureVPAllPlayers = false;
featureChannelDefault = false;
featureChannel1 = false;
featureChannel2 = false;
featureChannel3 = false;
featureChannel4 = false;
featureChannel5 = false;
featureVoiceChat = true;


--    __  __               ____  _ _           
--   |  \/  |             |  _ \| (_)          
--   | \  / | __ _ _ __   | |_) | |_ _ __  ___ 
--   | |\/| |/ _` | '_ \  |  _ <| | | '_ \/ __|
--   | |  | | (_| | |_) | | |_) | | | |_) \__ \
--   |_|  |_|\__,_| .__/  |____/|_|_| .__/|___/
--                | |               | |        
--                |_|               |_|        
open1 = nil;
open2 = nil;
open3 = nil;
open4 = nil;
open5 = nil;
open6 = nil;
open7 = nil;
open8 = nil;
open9 = nil;
open10 = nil;
open11 = nil;
open12 = nil;
open13 = nil;
open14 = nil;
open15 = nil;
open16 = nil;
open17 = nil;
open18 = nil;
open19 = nil;
open20 = nil;
open21 = nil;
open22 = nil;
open23 = nil;
open24 = nil;
open25 = nil;
open26 = nil;
open27 = nil;
open28 = nil;
open29 = nil;
open30 = nil;
open31 = nil;
open32 = nil;
open33 = nil;
open34 = nil;
open35 = nil;
ponsonbys1 = nil;
ponsonbys2 = nil;
ponsonbys3 = nil;
discount1 = nil;
discount2 = nil;
discount3 = nil;
discount4 = nil;
discount5 = nil;
binco1 = nil;
binco2 = nil;
suburban1 = nil;
suburban2 = nil;
suburban3 = nil;
suburban4 = nil;
lsc1 = nil;
lsc2 = nil;
lsc3 = nil;
lsc4 = nil;
lsc5 = nil;
lsc6 = nil;
tattoo1 = nil;
tattoo2 = nil;
tattoo3 = nil;
tattoo4 = nil;
tattoo5 = nil;
tattoo6 = nil;
ammo1 = nil;
ammo2 = nil;
ammo3 = nil;
ammo4 = nil;
ammo5 = nil;
ammo6 = nil;
ammo7 = nil;
ammo8 = nil;
ammo9 = nil;
ammo10 = nil;
ammo11 = nil;
barber1 = nil;
barber2 = nil;
barber3 = nil;
barber4 = nil;
barber5 = nil;
barber6 = nil;
barber7 = nil;
store1 = nil;
store2 = nil;
store3 = nil;
store4 = nil;
store5 = nil;
store6 = nil;
store7 = nil;
store8 = nil;
store9 = nil;
store10 = nil;
store11 = nil;
store12 = nil;
policestation1 = nil;
policestation2 = nil;
policestation4 = nil;
policestation5 = nil;
policestation6 = nil;
policestation7 = nil;
policestation8 = nil;
policestation9 = nil;
policestation10 = nil;
policestation11 = nil;
bank1 = nil;
bank2 = nil;
bank3 = nil;
bank4 = nil;
bank5 = nil;
bank6 = nil;
bank7 = nil;
cablecar1 = nil;
cablecar2 = nil;
carwash1 = nil;
carwash2 = nil;
airport1 = nil;
airport2 = nil;
airport3 = nil;
stripclub = nil;
helipad = nil;
boat1 = nil;
rebel = nil;
theater1 = nil;
theater2 = nil;
theater3 = nil;
hospital1 = nil;
hospital2 = nil;
hospital3 = nil;
bar1 = nil;
bar2 = nil;
comedy = nil;
drugs = nil;
marijuana1 = nil;
marijuana2 = nil;
altruist = nil;
sub = nil;
masks = nil;
fairground = nil;
golf = nil;
tennis = nil;
darts = nil;
playboy = nil;
fib = nil;