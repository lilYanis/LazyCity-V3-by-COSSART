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
    { name = 'WEAPON_PISTOL', price = 30000 },
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
		  { name = 'sultan',  label = 'Sultan' },
		  { name = 'bf400',    label = 'Bf400' },
      { name = 'buccaneer2',   label = 'Buccaneer' },
      --{ name = 'manchez',   label = 'Moto' },
	  },

    Cloakrooms = {
      --{ x = 1403.23, y = -2203.7377929688, z = 3.6880254745483},
    },

    Armories = {
      {x = 120.92, y = -1971.28, z = 20.32},
    },

    Vehicles = {
      {
        Spawner    = {x = 102.27, y = -1963.86, z = 19.84},
        SpawnPoint = {x = 108.78, y = -1945.22, z = 19.8},
        Heading    = 100.13,
      }
    },

    Helicopters = {
      {
        Spawner    = { x = 1132323.30500793457, y = -3109.3337402344, z = 5.0060696601868 },
        SpawnPoint = { x = 112.94457244873, y = -3102.5942382813, z = 5.0050659179688 },
        Heading    = 0.0,
      }
    },

    VehicleDeleters = {
      {x = 93.4, y = -1961.89, z = 19.74},
      
    },

    BossActions = {
      {x = 122.7, y = -1975.007, z = 20.32},
    },

  },

}
