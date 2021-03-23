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
      { name = 'faction2',   label = 'Faction' },
      --{ name = 'manchez',   label = 'Moto' },
	  },

    Cloakrooms = {
      --{ x = 1403.23, y = -2203.7377929688, z = 3.6880254745483},
    },

    Armories = {
      {x = 344.98, y = -2022.2, z = 21.4},
    },

    Vehicles = {
      {
        Spawner    = {x = 336.51, y = -2036.81, z = 20.35},
        SpawnPoint = {x = 326.9, y = -2033.73, z = 19.91},
        Heading    = 50.315,
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
      { x = 329.86, y = -2042.97, z = 19.81 },
      
    },

    BossActions = {
      {x = 361.375, y = -2039.175, z = 21.4},
    },

  },

}
