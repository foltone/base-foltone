Citizen.CreateThread(function()
	while true do
		SetDiscordAppId(850856832996999199)
		SetDiscordRichPresenceAsset('image')
        SetDiscordRichPresenceAssetText('Base foltone dev')
        SetDiscordRichPresenceAssetSmall('image')
        SetDiscordRichPresenceAssetSmallText('Base foltone dev')
		SetDiscordRichPresenceAction(0, "Discord", "https://discord.com/invite/X9ReemrhKh")
        --SetDiscordRichPresenceAction(1, "Se connecter", "fivem://connect/cfx.re/join/r3alvp")
		Citizen.Wait(60000)
	end
end)