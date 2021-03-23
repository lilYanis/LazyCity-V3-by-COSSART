Citizen.CreateThread(function()
    while true do
        local id = GetPlayerServerId(PlayerId())

		SetDiscordAppId(725006286168522834)
		SetDiscordRichPresenceAsset('lazycity')
        SetDiscordRichPresenceAssetText('LazyCity, Rejoingnez-nous !.')
        SetDiscordRichPresenceAssetSmall('lazycity2')
        SetDiscordRichPresenceAssetSmallText('https://discord.gg/c5pbuJN')
		Citizen.Wait(600000)
	end
end)

Citizen.CreateThread(function()
    while true do
		players = {}
		for i = 0, 255 do
			if NetworkIsPlayerActive( i ) then
				table.insert( players, i )
			end
		end
		SetRichPresence("" .. GetPlayerName(PlayerId()) .. " ➡️ ".. #players .. "/128")
		Citizen.Wait(10000)
	end
end)