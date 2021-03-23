Config = {}

-- Lägg till alla vapen det ska fungera på
Config.WeaponList = {
	453432689, --pistol
	-1716189206, --knife
	1737195953,
	-1076751822,
	1317494643,
	-1786099057,
	-1045183535,
	-2067956739,
	-102323637,
	1141786504,
	-1660422300,
	-1716589765,
	-1834847097,
	324215364,
	-619010992,
	1627465347,
	-1357824103,
	2132975508,
	-102973651,
	317205821,
	137902532,
	-598887786,
	487013001,
	1198879012,
	-275439685,
	205991906,
	984333226,
	-952879014,
	-656458692,
	177293209,
	-1063057011,
	2017895192,
	-1654528753,
	-1466123874,
	1649403952,
	4208062921,
	-1121678507,
	-494615257,
	100416529,
	-581044007,
	171789620,
	-1951375401,
	736523883,
	-538741184,
	-270015777,
	-1074790547,
	2024373456,
	584646201,
	-771403250,
	-1810795771,
	961495388,
	-2084633992,
	419712736,
	1593441988,
	-853065399,
	911657153,
	3219281620,
	453432689
}

Config.PedAbleToWalkWhileSwapping = true
Config.UnarmedHash = -1569615261

Citizen.CreateThread(function()
	local animDict = 'reaction@intimidation@1h'

	local animIntroName = 'intro'
	local animOutroName = 'outro'

	local animFlag = 0

	RequestAnimDict(animDict)
	  
	while not HasAnimDictLoaded(animDict) do
		Citizen.Wait(100)
	end

	local lastWeapon = nil

	while true do
		Citizen.Wait(0)

		if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
			if Config.PedAbleToWalkWhileSwapping then
				animFlag = 48
			else
				animFlag = 0
			end

			for i=1, #Config.WeaponList do
				if lastWeapon ~= nil and lastWeapon ~= Config.WeaponList[i] and GetSelectedPedWeapon(GetPlayerPed(-1)) == Config.WeaponList[i] then
					SetCurrentPedWeapon(GetPlayerPed(-1), Config.UnarmedHash, true)
					TaskPlayAnim(GetPlayerPed(-1), animDict, animIntroName, 8.0, -8.0, 2700, animFlag, 0.0, false, false, false)

					Citizen.Wait(1000)
					SetCurrentPedWeapon(GetPlayerPed(-1), Config.WeaponList[i], true)
				end

				if lastWeapon ~= nil and lastWeapon == Config.WeaponList[i] and GetSelectedPedWeapon(GetPlayerPed(-1)) == Config.UnarmedHash then
					TaskPlayAnim(GetPlayerPed(-1), animDict, animOutroName, 8.0, -8.0, 2100, animFlag, 0.0, false, false, false)

					Citizen.Wait(1000)
					SetCurrentPedWeapon(GetPlayerPed(-1), Config.UnarmedHash, true)
				end
			end
		end

		lastWeapon = GetSelectedPedWeapon(GetPlayerPed(-1))
	end
end)