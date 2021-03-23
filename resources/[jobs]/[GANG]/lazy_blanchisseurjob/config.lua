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
  --  { name = 'WEAPON_PISTOL', price = 30000 },
    --  { name = 'WEAPON_ASSAULTSMG',       price = 1125000 },
    --{ name = 'WEAPON_ASSAULTRIFLE',     price = 1500000 },
    --{ name = 'WEAPON_SAWNOFFSHOTGUN',      price = 60000 },
	-- { name = 'WEAPON_BAT'		,        price = 3000 },
   -- { name = 'WEAPON_SNIPERRIFLE',      price = 2200000 },
    --  { name = 'WEAPON_APPISTOL',         price = 70000 },
   -- { name = 'WEAPON_CARBINERIFLE',     price = 100000 },
     --{ name = 'WEAPON_HEAVYSNIPER',      price = 2000000 },
    },

	  AuthorizedVehicles = {
		  { name = 'sultan',  label = 'Sultan' },
		  { name = 'bf400',    label = 'Bf400' },
          { name = 'mesa3',   label = 'mesa3' },
      --{ name = 'manchez',   label = 'Moto' },
	  },

    Cloakrooms = {
      --{ x = 1403.23, y = -2203.7377929688, z = 3.6880254745483},
    },

    Armories = {
      {x = -1148.81, y = 4939.22, z = 222.26},
    },

    Vehicles = {
      {
        Spawner    = {x = -1058.52, y = 4915.41, z = 211.81},
        SpawnPoint = { x = -1054.39, y = 4907.56, z = 210.71 },
        Heading    = 100.13,
      }
    },

    Helicopters = {
     -- {
       -- Spawner    = { x = 1132323.30500793457, y = -3109.3337402344, z = 5.0060696601868 },
       -- SpawnPoint = { x = -1054.39, y = 4907.56, z = 210.71 },
       -- Heading    = 280.96,
      --}
    },

    VehicleDeleters = {
      --{x = 93.4, y = -1961.89, z = 19.74},
      
    },

    BossActions = {
      {x = -1137.74, y = 4940.45, z = 222.26},
    },

  },

}
