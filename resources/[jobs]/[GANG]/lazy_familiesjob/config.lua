Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 23
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale                     = 'fr'

Config.GangStations = {

  Gang = {

    AuthorizedWeapons = {
     -- { name = 'WEAPON_COMBATPISTOL',     price = 30000 },
    --  { name = 'WEAPON_ASSAULTSMG',       price = 1125000 },
  --    { name = 'WEAPON_ASSAULTRIFLE',     price = 1500000 },
--{ name = 'WEAPON_SAWNOFFSHOTGUN',      price = 60000 },
	 -- { name = 'WEAPON_BAT'		,        price = 3000 },
      --{ name = 'WEAPON_SNIPERRIFLE',      price = 2200000 },
    --  { name = 'WEAPON_APPISTOL',         price = 70000 },
    --  { name = 'WEAPON_CARBINERIFLE',     price = 100000 },
     --{ name = 'WEAPON_HEAVYSNIPER',      price = 2000000 },
    },

	  AuthorizedVehicles = {
		  { name = 'buffalo',  label = 'Buffalo' },
		  { name = 'bf400',    label = 'Bf400' },
      { name = 'voodoo',   label = 'Voodoo' },
      --{ name = 'manchez',   label = 'Moto' },
	  },

    Cloakrooms = {
      --{ x = 1403.23, y = -2203.7377929688, z = 3.6880254745483},
    },

    Armories = {
      {x = -137.02, y = -1609.6, z = 34.03},
    },

    Vehicles = {
      {
        Spawner    = {x = -148.37, y = -1643.46, z = 31.89},
        SpawnPoint = {x = -107.11, y = -1596.7, z = 31.61},
        Heading    = 312.65,
      }
    },

    Helicopters = {
      {
        Spawner    = { x = 1132323.30500793457, y = -3109.3337402344, z = 5.0060696601868 },
        SpawnPoint = { x = -107.11, y = -1596.7, z = 31.61 },
        Heading    = 0.0,
      }
    },

    VehicleDeleters = {
      {x = -120.7, y = -1612.99, z = 30.92},
      
    },

    BossActions = {
      {x = -135.79, y = -1606.42, z = 34.03},
    },

  },

}
