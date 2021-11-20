local logEnabled = true

RegisterServerEvent('3dme:shareDisplay')
AddEventHandler('3dme:shareDisplay', function(text, players)
	for k,v in pairs(players) do
		TriggerClientEvent('3dme:triggerDisplay', v, text, source)
	end
end)