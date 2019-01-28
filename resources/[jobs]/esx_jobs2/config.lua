Config              = {}
Config.DrawDistance = 1000.0
Config.Locale       = 'fr'

Config.Plates = {
  taxi        = "TAXI",
  fisherman   = "FISH",
  cop         = "LSPD",
  ambulance   = "EMS",
  depanneur   = "MECA",
  fuel        = "FUEL",
  lumberjack  = "BUCH",
  miner       = "MINE",
  reporter    = "CNN",
  slaughterer = "ABAT",
  textil      = "COUT",
  fermier     = "FERM",
  brasseur    = "BRAS",
  tabac       = "TABA",
  vanilla     = "VANI",
  vigne       = "VIGN",
  cuisinier   = "CUISI",
  electricien = "ELEC",
  joaillier   = "JOAIL",
  diver       = "MARIN",
  fossoyeur   = "FOSS",
  bahama      = "BAHA",
}

Config.Jobs = {}

Config.PublicZones = {
  EnterBuilding = {
    Pos       = { x = -118.213, y = -607.142, z = 35.280 },
    Size      = { x = 3.0, y = 3.0, z = 0.2 },
    Color     = { r = 0, g = 155, b = 255 },
    Marker    = 1,
    Blip      = true,
    Name      = "Agent Immobilier",
    Type      = "teleport",
    Hint      = "Appuyez sur ~INPUT_PICKUP~ pour entrer dans ~b~l'immeuble~s~.",
    Teleport  = { x = -139.098, y = -620.748, z = 167.820 }
  },

  ExitBuilding = {
    Pos       = { x = -139.458, y = -617.323, z = 167.820 },
    Size      = { x = 3.0, y = 3.0, z = 0.2 },
    Color     = { r = 0, g = 155, b = 255 },
    Marker    = 1,
    Blip      = false,
    Name      = "Agent Immobilier",
    Type      = "teleport",
    Hint      = "Appuyez sur ~INPUT_PICKUP~ pour aller à l'entrée de ~b~l'immeuble~s~.",
    Teleport  = { x = -113.07, y = -604.93, z = 35.28 },
  },
}
