resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

--AntiVDM
client_script "lazy_utils/AntiVDM/cl_antivdm.lua"

--cachercoffre
client_script  'lazy_utils/cachercoffre/client/main.lua'

--knockout
client_script 'lazy_utils/knockout/ko_client.lua'

--lazy_drift
client_script 'lazy_utils/lazy_drift/drift.lua'

--pausemenu-title
client_script "lazy_utils/pausemenu-title/server_name.lua"

--ProtectPnj
client_script {
	'lazy_utils/ProtectPnj/deletearmevehiculeclient.lua',
	--'lazy_utils/ProtectPnj/NoDrivingCopCar.lua',
	'lazy_utils/ProtectPnj/NoMoreCopNPC.lua',
	'lazy_utils/ProtectPnj/NoMoreWeaponsOnNPC.lua',
	'lazy_utils/ProtectPnj/NoWeaponReward.lua',
	'lazy_utils/ProtectPnj/passager.lua',
	'lazy_utils/ProtectPnj/DamageReducer.lua'
}

server_script 'lazy_utils/ProtectPnj/deletearmevehiculeserver.lua'

--RealisticTraffic
data_file 'VEHICLE_METADATA_FILE' 'lazy_utils/RealisticTraffic/handling.meta'

files {
	'handling.meta'
}

client_script 'lazy_utils/RealisticTraffic/RealisticTraffic_cl.lua'

--RealisticVehicleFailure
client_scripts {
	"lazy_utils/RealisticVehicleFailure/config.lua",
	"lazy_utils/RealisticVehicleFailure/client.lua"
}

server_scripts {
	"lazy_utils/RealisticVehicleFailure/config.lua",
	"lazy_utils/RealisticVehicleFailure/server.lua"
}

--ReducedNPCs
files {}

server_scripts {"lazy_utils/ReducedNPCs/server.lua"}
client_scripts {"lazy_utils/ReducedNPCs/client.lua"}

--weapon_switch_anim
description 'Weapon'

version '0.1.0'

client_scripts {
	'lazy_utils/weapon_switch_anim/client.lua',
}

--takehostage
client_script "lazy_utils/TakeHostage/cl_takehostage.lua"
server_script "lazy_utils/TakeHostage/sv_takehostage.lua"

--CarryPeople
client_script "lazy_utils/CarryPeople/cl_carry.lua"
server_script "lazy_utils/CarryPeople/sv_carry.lua"