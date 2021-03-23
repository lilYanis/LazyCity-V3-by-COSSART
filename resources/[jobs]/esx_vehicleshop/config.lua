Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerColor                = { r = 120, g = 120, b = 240 }
Config.EnablePlayerManagement     = true -- enables the actual car dealer job. You'll need esx_addonaccount, esx_billing and esx_society
Config.EnableOwnedVehicles        = true
Config.EnableSocietyOwnedVehicles = false -- use with EnablePlayerManagement disabled, or else it wont have any effects
Config.ResellPercentage           = 60

Config.Locale                     = 'fr'

Config.LicenseEnable = false -- require people to own drivers license when buying vehicles? Only applies if EnablePlayerManagement is disabled. Requires esx_license

-- looks like this: 'LLL NNN'
-- The maximum plate length is 8 chars (including spaces & symbols), don't go past it!
Config.PlateLetters  = 3
Config.PlateNumbers  = 3
Config.PlateUseSpace = true

Config.Zones = {

	ShopEntering = {
		Pos   = { x = -794.68078613281, y = -218.46437072754, z = 37.079620361328 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Type  = 1
	},

	ShopInside = {
		Pos     = { x = -783.62463378906, y = -223.59750366211, z = 37.32152557373 },
		Size    = { x = 1.5, y = 1.5, z = 1.0 },
		Heading = -20.0,
		Type    = -1
	},

	ShopOutside = {
		Pos     = { x = -774.32434082031, y = -232.63346862793, z = 37.079647064209 },
		Size    = { x = 1.5, y = 1.5, z = 1.0 },
		Heading = 330.0,
		Type    = -1
	},

	BossActions = {
		Pos   = { x = -788.99194335938, y = -215.50512695313, z = 37.079620361328 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Type  = -1
	},

	GiveBackVehicle = {
		Pos   = { x = -785.28881835938, y = -243.93418884277, z = 37.079639434814 },
		Size  = { x = 2.5, y = 2.5, z = 1.0 },
		Type  = (Config.EnablePlayerManagement and 1 or -1)
	},

	--ResellVehicle = {
		--Pos   = { x = -759.18804931641, y = -236.8720703125, z = 37.283821105957 },
		--Size  = { x = 2.5, y = 2.5, z = 1.0 },
	--	Type  = 1
	--}

}
