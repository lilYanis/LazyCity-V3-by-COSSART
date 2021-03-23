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
      { name = 'weapon_microsmg',     price = 50000 },
      { name = 'weapon_musket',       price = 40000 },
      { name = 'WEAPON_PISTOL',     price = 35000 },
--{ name = 'WEAPON_SAWNOFFSHOTGUN',      price = 60000 },
	 -- { name = 'WEAPON_BAT'		,        price = 3000 },
      --{ name = 'WEAPON_SNIPERRIFLE',      price = 2200000 },
    --  { name = 'WEAPON_APPISTOL',         price = 70000 },
    --  { name = 'WEAPON_CARBINERIFLE',     price = 100000 },
     --{ name = 'WEAPON_HEAVYSNIPER',      price = 2000000 },
    },

	  AuthorizedVehicles = {
		  { name = 'bf400',  label = 'Moto' },
		  { name = 'xls',    label = 'XLS' },
      { name = 'feltzer3',   label = 'Mercedes' },
      { name = 'Kuruma',   label = 'Kuruma' },
	  },

    Cloakrooms = {
      --{ x = 9.74, y = 526.55, z = 170.63},
    },

    Armories = {
      {x = 9.22, y = 529.09, z = 170.63},
    },

    Vehicles = {
      {
        Spawner    = {x = 13.71, y = 544.20, z = 175.98},
        SpawnPoint = {x = 14.38, y = 548.31, z = 176.17},
        Heading    = 40.00,
      }
    },

    Helicopters = {
      {
        Spawner    = { x = 140555555555551.446, y = 1114.91, z = 113.84 },
        SpawnPoint = { x = 139555555555551.74, y = 1116.18, z = 114.84 },
        Heading    = 90.23,
      }
    },

    VehicleDeleters = {
      { x = 22.16, y = 544.55, z = 176.02 },
      
    },

    BossActions = {
      {x = 1.06, y = 529.94, z = 170.61},
    },

  },

}
