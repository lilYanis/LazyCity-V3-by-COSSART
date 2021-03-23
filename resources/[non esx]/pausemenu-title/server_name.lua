function SetData()

	players = {}

	for _, player in ipairs(GetActivePlayers()) do

		local ped = GetPlayerPed(player)

		table.insert( players, player )

end



	

	local name = GetPlayerName(PlayerId())

	local id = GetPlayerServerId(PlayerId())

	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), 'FE_THDR_GTAO', "~w~LazyCity ~y~V3 ~w~   ~y~| ~w~Discord : ~y~https://discord.gg/mUzZPSm | ~w~ID: "..id.."~w~ | ~y~".. #players .." connecté(e)s")

end



Citizen.CreateThread(function()

	while true do

		Citizen.Wait(100)

		SetData()

	end

end)



Citizen.CreateThread(function()

    AddTextEntry("PM_PANE_LEAVE", "~y~Se ~w~déconnecter ~y~du ~w~serveur ~y~LazyCity ~w~V3 ~y~ 😭")

end)



Citizen.CreateThread(function()

    AddTextEntry("PM_PANE_QUIT", "~r~Quitter ~b~FiveM 🐌")

end)