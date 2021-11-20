ESX = nil


Configwash = {}

Configwash.Locale = 'en'

Configwash.EnablePrice = true
Configwash.Price = 250

Configwash.Locations = {
	vector3(26.5906, -1392.0261, 27.3634),
	vector3(167.1034, -1719.4704, 27.2916),
	vector3(-74.5693, 6427.8715, 29.4400),
	vector3(-699.6325, -932.7043, 17.0139)
}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('esx_carwash:canAfford', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	if Configwash.EnablePrice then
		if xPlayer.getMoney() >= Configwash.Price then
			xPlayer.removeMoney(Configwash.Price)
			cb(true)
		else
			cb(false)
		end
	else
		cb(true)
	end
end)